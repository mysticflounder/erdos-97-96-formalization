/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 3:600-626

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_03_0600_0626 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(10, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0600 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 600 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0600 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0600_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0600
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0601 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 601 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0601 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((5181440 : Rat) / 158397) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((5181440 : Rat) / 158397) [(9, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0601_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0601
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0602 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 602 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0602 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(9, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(9, 1), (11, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0602_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0602
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0603 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 603 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0603 : Poly :=
[
  term ((-8921600 : Rat) / 158397) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((8921600 : Rat) / 158397) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0603_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0603
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0604 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0604 : Poly :=
[
  term ((-113392576 : Rat) / 385571) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0604_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0604
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0605 : Poly :=
[
  term ((-394624 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 605 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0605 : Poly :=
[
  term ((789248 : Rat) / 158397) [(2, 1), (9, 1), (15, 1)],
  term ((-394624 : Rat) / 158397) [(2, 2), (9, 1), (15, 1)],
  term ((-394624 : Rat) / 158397) [(3, 2), (9, 1), (15, 1)],
  term ((-789248 : Rat) / 158397) [(9, 1), (10, 1), (15, 1)],
  term ((394624 : Rat) / 158397) [(9, 1), (10, 2), (15, 1)],
  term ((394624 : Rat) / 158397) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0605_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0605
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0606 : Poly :=
[
  term ((-26298404 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 606 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0606 : Poly :=
[
  term ((52596808 : Rat) / 385571) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-26298404 : Rat) / 385571) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-26298404 : Rat) / 385571) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-52596808 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((26298404 : Rat) / 385571) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((26298404 : Rat) / 385571) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0606_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0606
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0607 : Poly :=
[
  term ((2230400 : Rat) / 158397) [(9, 1), (15, 3)]
]

/-- Partial product 607 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0607 : Poly :=
[
  term ((-4460800 : Rat) / 158397) [(2, 1), (9, 1), (15, 3)],
  term ((2230400 : Rat) / 158397) [(2, 2), (9, 1), (15, 3)],
  term ((2230400 : Rat) / 158397) [(3, 2), (9, 1), (15, 3)],
  term ((4460800 : Rat) / 158397) [(9, 1), (10, 1), (15, 3)],
  term ((-2230400 : Rat) / 158397) [(9, 1), (10, 2), (15, 3)],
  term ((-2230400 : Rat) / 158397) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0607_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0607
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0608 : Poly :=
[
  term ((28348144 : Rat) / 385571) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 608 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0608 : Poly :=
[
  term ((-56696288 : Rat) / 385571) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((28348144 : Rat) / 385571) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((28348144 : Rat) / 385571) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((56696288 : Rat) / 385571) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0608_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0608
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0609 : Poly :=
[
  term ((-1390720 : Rat) / 158397) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 609 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0609 : Poly :=
[
  term ((2781440 : Rat) / 158397) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-1390720 : Rat) / 158397) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1390720 : Rat) / 158397) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((1390720 : Rat) / 158397) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((1390720 : Rat) / 158397) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0609_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0609
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0610 : Poly :=
[
  term ((-37175504 : Rat) / 385571) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0610 : Poly :=
[
  term ((74351008 : Rat) / 385571) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0610_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0610
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0611 : Poly :=
[
  term ((2867200 : Rat) / 158397) [(9, 2), (15, 2)]
]

/-- Partial product 611 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0611 : Poly :=
[
  term ((-5734400 : Rat) / 158397) [(2, 1), (9, 2), (15, 2)],
  term ((2867200 : Rat) / 158397) [(2, 2), (9, 2), (15, 2)],
  term ((2867200 : Rat) / 158397) [(3, 2), (9, 2), (15, 2)],
  term ((5734400 : Rat) / 158397) [(9, 2), (10, 1), (15, 2)],
  term ((-2867200 : Rat) / 158397) [(9, 2), (10, 2), (15, 2)],
  term ((-2867200 : Rat) / 158397) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0611_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0611
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0612 : Poly :=
[
  term ((-1213504 : Rat) / 385571) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 612 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0612 : Poly :=
[
  term ((2427008 : Rat) / 385571) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1213504 : Rat) / 385571) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-1213504 : Rat) / 385571) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2427008 : Rat) / 385571) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((1213504 : Rat) / 385571) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((1213504 : Rat) / 385571) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0612_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0612
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0613 : Poly :=
[
  term ((-4280320 : Rat) / 158397) [(10, 1), (15, 2)]
]

/-- Partial product 613 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0613 : Poly :=
[
  term ((8560640 : Rat) / 158397) [(2, 1), (10, 1), (15, 2)],
  term ((-4280320 : Rat) / 158397) [(2, 2), (10, 1), (15, 2)],
  term ((-4280320 : Rat) / 158397) [(3, 2), (10, 1), (15, 2)],
  term ((4280320 : Rat) / 158397) [(10, 1), (11, 2), (15, 2)],
  term ((-8560640 : Rat) / 158397) [(10, 2), (15, 2)],
  term ((4280320 : Rat) / 158397) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0613_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0613
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0614 : Poly :=
[
  term ((4201120 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 614 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0614 : Poly :=
[
  term ((-8402240 : Rat) / 385571) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((4201120 : Rat) / 385571) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((4201120 : Rat) / 385571) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4201120 : Rat) / 385571) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((8402240 : Rat) / 385571) [(10, 2), (15, 2), (16, 1)],
  term ((-4201120 : Rat) / 385571) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0614_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0614
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0615 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 615 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0615 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0615_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0615
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0616 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 616 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0616 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0616_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0616
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0617 : Poly :=
[
  term ((-1356800 : Rat) / 158397) [(11, 1), (15, 1)]
]

/-- Partial product 617 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0617 : Poly :=
[
  term ((2713600 : Rat) / 158397) [(2, 1), (11, 1), (15, 1)],
  term ((-1356800 : Rat) / 158397) [(2, 2), (11, 1), (15, 1)],
  term ((-1356800 : Rat) / 158397) [(3, 2), (11, 1), (15, 1)],
  term ((-2713600 : Rat) / 158397) [(10, 1), (11, 1), (15, 1)],
  term ((1356800 : Rat) / 158397) [(10, 2), (11, 1), (15, 1)],
  term ((1356800 : Rat) / 158397) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0617_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0617
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0618 : Poly :=
[
  term ((13336520 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 618 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0618 : Poly :=
[
  term ((-26673040 : Rat) / 385571) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((13336520 : Rat) / 385571) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((13336520 : Rat) / 385571) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((26673040 : Rat) / 385571) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13336520 : Rat) / 385571) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13336520 : Rat) / 385571) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0618_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0618
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0619 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(11, 1), (15, 3)]
]

/-- Partial product 619 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0619 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(2, 1), (11, 1), (15, 3)],
  term ((5181440 : Rat) / 158397) [(2, 2), (11, 1), (15, 3)],
  term ((5181440 : Rat) / 158397) [(3, 2), (11, 1), (15, 3)],
  term ((10362880 : Rat) / 158397) [(10, 1), (11, 1), (15, 3)],
  term ((-5181440 : Rat) / 158397) [(10, 2), (11, 1), (15, 3)],
  term ((-5181440 : Rat) / 158397) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0619_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0619
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0620 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 620 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0620 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((21092000 : Rat) / 385571) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((21092000 : Rat) / 385571) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0620_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0620
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0621 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(12, 1), (15, 2)]
]

/-- Partial product 621 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0621 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(2, 1), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (12, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(10, 1), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(10, 2), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0621_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0621
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0622 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 622 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0622 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0622_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0622
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0623 : Poly :=
[
  term ((216184 : Rat) / 158397) [(15, 2)]
]

/-- Partial product 623 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0623 : Poly :=
[
  term ((-432368 : Rat) / 158397) [(2, 1), (15, 2)],
  term ((216184 : Rat) / 158397) [(2, 2), (15, 2)],
  term ((216184 : Rat) / 158397) [(3, 2), (15, 2)],
  term ((432368 : Rat) / 158397) [(10, 1), (15, 2)],
  term ((-216184 : Rat) / 158397) [(10, 2), (15, 2)],
  term ((-216184 : Rat) / 158397) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0623_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0623
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0624 : Poly :=
[
  term ((-3296236 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 624 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0624 : Poly :=
[
  term ((6592472 : Rat) / 385571) [(2, 1), (15, 2), (16, 1)],
  term ((-3296236 : Rat) / 385571) [(2, 2), (15, 2), (16, 1)],
  term ((-3296236 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)],
  term ((-6592472 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)],
  term ((3296236 : Rat) / 385571) [(10, 2), (15, 2), (16, 1)],
  term ((3296236 : Rat) / 385571) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0624_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0624
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0625 : Poly :=
[
  term ((-2007040 : Rat) / 158397) [(15, 4)]
]

/-- Partial product 625 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0625 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(2, 1), (15, 4)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (15, 4)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (15, 4)],
  term ((-4014080 : Rat) / 158397) [(10, 1), (15, 4)],
  term ((2007040 : Rat) / 158397) [(10, 2), (15, 4)],
  term ((2007040 : Rat) / 158397) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0625_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0625
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 3. -/
def rs_R005_ueqv_R005NYN_coefficient_03_0626 : Poly :=
[
  term ((9973120 : Rat) / 385571) [(15, 4), (16, 1)]
]

/-- Partial product 626 for generator 3. -/
def rs_R005_ueqv_R005NYN_partial_03_0626 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(2, 1), (15, 4), (16, 1)],
  term ((9973120 : Rat) / 385571) [(2, 2), (15, 4), (16, 1)],
  term ((9973120 : Rat) / 385571) [(3, 2), (15, 4), (16, 1)],
  term ((19946240 : Rat) / 385571) [(10, 1), (15, 4), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(10, 2), (15, 4), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 3. -/
theorem rs_R005_ueqv_R005NYN_partial_03_0626_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_03_0626
        rs_R005_ueqv_R005NYN_generator_03_0600_0626 =
      rs_R005_ueqv_R005NYN_partial_03_0626 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_03_0600_0626 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_03_0600,
  rs_R005_ueqv_R005NYN_partial_03_0601,
  rs_R005_ueqv_R005NYN_partial_03_0602,
  rs_R005_ueqv_R005NYN_partial_03_0603,
  rs_R005_ueqv_R005NYN_partial_03_0604,
  rs_R005_ueqv_R005NYN_partial_03_0605,
  rs_R005_ueqv_R005NYN_partial_03_0606,
  rs_R005_ueqv_R005NYN_partial_03_0607,
  rs_R005_ueqv_R005NYN_partial_03_0608,
  rs_R005_ueqv_R005NYN_partial_03_0609,
  rs_R005_ueqv_R005NYN_partial_03_0610,
  rs_R005_ueqv_R005NYN_partial_03_0611,
  rs_R005_ueqv_R005NYN_partial_03_0612,
  rs_R005_ueqv_R005NYN_partial_03_0613,
  rs_R005_ueqv_R005NYN_partial_03_0614,
  rs_R005_ueqv_R005NYN_partial_03_0615,
  rs_R005_ueqv_R005NYN_partial_03_0616,
  rs_R005_ueqv_R005NYN_partial_03_0617,
  rs_R005_ueqv_R005NYN_partial_03_0618,
  rs_R005_ueqv_R005NYN_partial_03_0619,
  rs_R005_ueqv_R005NYN_partial_03_0620,
  rs_R005_ueqv_R005NYN_partial_03_0621,
  rs_R005_ueqv_R005NYN_partial_03_0622,
  rs_R005_ueqv_R005NYN_partial_03_0623,
  rs_R005_ueqv_R005NYN_partial_03_0624,
  rs_R005_ueqv_R005NYN_partial_03_0625,
  rs_R005_ueqv_R005NYN_partial_03_0626
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_03_0600_0626 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-113392576 : Rat) / 385571) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((789248 : Rat) / 158397) [(2, 1), (9, 1), (15, 1)],
  term ((52596808 : Rat) / 385571) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(2, 1), (9, 1), (15, 3)],
  term ((-56696288 : Rat) / 385571) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((2781440 : Rat) / 158397) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5734400 : Rat) / 158397) [(2, 1), (9, 2), (15, 2)],
  term ((2427008 : Rat) / 385571) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((8560640 : Rat) / 158397) [(2, 1), (10, 1), (15, 2)],
  term ((-8402240 : Rat) / 385571) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2713600 : Rat) / 158397) [(2, 1), (11, 1), (15, 1)],
  term ((-26673040 : Rat) / 385571) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 1), (11, 1), (15, 3)],
  term ((42184000 : Rat) / 385571) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((8028160 : Rat) / 158397) [(2, 1), (12, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-432368 : Rat) / 158397) [(2, 1), (15, 2)],
  term ((6592472 : Rat) / 385571) [(2, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(2, 1), (15, 4)],
  term ((-19946240 : Rat) / 385571) [(2, 1), (15, 4), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((21092000 : Rat) / 385571) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-394624 : Rat) / 158397) [(2, 2), (9, 1), (15, 1)],
  term ((-26298404 : Rat) / 385571) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(2, 2), (9, 1), (15, 3)],
  term ((28348144 : Rat) / 385571) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2867200 : Rat) / 158397) [(2, 2), (9, 2), (15, 2)],
  term ((-1213504 : Rat) / 385571) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-4280320 : Rat) / 158397) [(2, 2), (10, 1), (15, 2)],
  term ((4201120 : Rat) / 385571) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1356800 : Rat) / 158397) [(2, 2), (11, 1), (15, 1)],
  term ((13336520 : Rat) / 385571) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(2, 2), (11, 1), (15, 3)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (12, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((216184 : Rat) / 158397) [(2, 2), (15, 2)],
  term ((-3296236 : Rat) / 385571) [(2, 2), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (15, 4)],
  term ((9973120 : Rat) / 385571) [(2, 2), (15, 4), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((21092000 : Rat) / 385571) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-394624 : Rat) / 158397) [(3, 2), (9, 1), (15, 1)],
  term ((-26298404 : Rat) / 385571) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(3, 2), (9, 1), (15, 3)],
  term ((28348144 : Rat) / 385571) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2867200 : Rat) / 158397) [(3, 2), (9, 2), (15, 2)],
  term ((-1213504 : Rat) / 385571) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-4280320 : Rat) / 158397) [(3, 2), (10, 1), (15, 2)],
  term ((4201120 : Rat) / 385571) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1356800 : Rat) / 158397) [(3, 2), (11, 1), (15, 1)],
  term ((13336520 : Rat) / 385571) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(3, 2), (11, 1), (15, 3)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (12, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((216184 : Rat) / 158397) [(3, 2), (15, 2)],
  term ((-3296236 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (15, 4)],
  term ((9973120 : Rat) / 385571) [(3, 2), (15, 4), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((8921600 : Rat) / 158397) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((113392576 : Rat) / 385571) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-789248 : Rat) / 158397) [(9, 1), (10, 1), (15, 1)],
  term ((-52596808 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(9, 1), (10, 1), (15, 3)],
  term ((56696288 : Rat) / 385571) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((9973120 : Rat) / 385571) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(9, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((394624 : Rat) / 158397) [(9, 1), (10, 2), (15, 1)],
  term ((26298404 : Rat) / 385571) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(9, 1), (10, 2), (15, 3)],
  term ((-28348144 : Rat) / 385571) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((394624 : Rat) / 158397) [(9, 1), (11, 2), (15, 1)],
  term ((26298404 : Rat) / 385571) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(9, 1), (11, 2), (15, 3)],
  term ((-28348144 : Rat) / 385571) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((9973120 : Rat) / 385571) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(9, 1), (11, 4), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(9, 1), (11, 4), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5734400 : Rat) / 158397) [(9, 2), (10, 1), (15, 2)],
  term ((-2427008 : Rat) / 385571) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((1390720 : Rat) / 158397) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2867200 : Rat) / 158397) [(9, 2), (10, 2), (15, 2)],
  term ((1213504 : Rat) / 385571) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-2867200 : Rat) / 158397) [(9, 2), (11, 2), (15, 2)],
  term ((1213504 : Rat) / 385571) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((1390720 : Rat) / 158397) [(9, 2), (11, 3), (15, 1)],
  term ((37175504 : Rat) / 385571) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2713600 : Rat) / 158397) [(10, 1), (11, 1), (15, 1)],
  term ((26673040 : Rat) / 385571) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(10, 1), (11, 1), (15, 3)],
  term ((-42184000 : Rat) / 385571) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((4280320 : Rat) / 158397) [(10, 1), (11, 2), (15, 2)],
  term ((-4201120 : Rat) / 385571) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(10, 1), (12, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((432368 : Rat) / 158397) [(10, 1), (15, 2)],
  term ((-6592472 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(10, 1), (15, 4)],
  term ((19946240 : Rat) / 385571) [(10, 1), (15, 4), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1356800 : Rat) / 158397) [(10, 2), (11, 1), (15, 1)],
  term ((-13336520 : Rat) / 385571) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(10, 2), (11, 1), (15, 3)],
  term ((21092000 : Rat) / 385571) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(10, 2), (12, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2925608 : Rat) / 52799) [(10, 2), (15, 2)],
  term ((11698476 : Rat) / 385571) [(10, 2), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(10, 2), (15, 4)],
  term ((-9973120 : Rat) / 385571) [(10, 2), (15, 4), (16, 1)],
  term ((4280320 : Rat) / 158397) [(10, 3), (15, 2)],
  term ((-4201120 : Rat) / 385571) [(10, 3), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(11, 2), (12, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-216184 : Rat) / 158397) [(11, 2), (15, 2)],
  term ((3296236 : Rat) / 385571) [(11, 2), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(11, 2), (15, 4)],
  term ((-9973120 : Rat) / 385571) [(11, 2), (15, 4), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(11, 3), (12, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((1356800 : Rat) / 158397) [(11, 3), (15, 1)],
  term ((-13336520 : Rat) / 385571) [(11, 3), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(11, 3), (15, 3)],
  term ((21092000 : Rat) / 385571) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 600 through 626. -/
theorem rs_R005_ueqv_R005NYN_block_03_0600_0626_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_03_0600_0626
      rs_R005_ueqv_R005NYN_block_03_0600_0626 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
