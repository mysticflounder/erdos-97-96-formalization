/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 5:100-192

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0100 : Poly :=
[
  term ((-32 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 100 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0100 : Poly :=
[
  term ((64 : Rat) / 29) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-32 : Rat) / 29) [(4, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-32 : Rat) / 29) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-64 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((32 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((32 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0100_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0100
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0101 : Poly :=
[
  term ((344934986 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 101 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0101 : Poly :=
[
  term ((-689869972 : Rat) / 99568455) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((344934986 : Rat) / 99568455) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((344934986 : Rat) / 99568455) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((689869972 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-344934986 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-344934986 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0101_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0101
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0102 : Poly :=
[
  term ((-65504 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0102 : Poly :=
[
  term ((131008 : Rat) / 98097) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65504 : Rat) / 98097) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65504 : Rat) / 98097) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131008 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65504 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((65504 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0102_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0102
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0103 : Poly :=
[
  term ((82912552 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 103 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0103 : Poly :=
[
  term ((-165825104 : Rat) / 99568455) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((82912552 : Rat) / 99568455) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((82912552 : Rat) / 99568455) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((165825104 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-82912552 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((-82912552 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0103_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0103
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0104 : Poly :=
[
  term ((67712 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 104 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0104 : Poly :=
[
  term ((-135424 : Rat) / 98097) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((67712 : Rat) / 98097) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((67712 : Rat) / 98097) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((135424 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-67712 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-67712 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0104_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0104
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0105 : Poly :=
[
  term ((62010784 : Rat) / 6637897) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 105 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0105 : Poly :=
[
  term ((-124021568 : Rat) / 6637897) [(4, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((62010784 : Rat) / 6637897) [(4, 2), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((62010784 : Rat) / 6637897) [(5, 2), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((124021568 : Rat) / 6637897) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-62010784 : Rat) / 6637897) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2)],
  term ((-62010784 : Rat) / 6637897) [(9, 1), (11, 1), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0105_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0105
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0106 : Poly :=
[
  term ((-58880 : Rat) / 32699) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0106 : Poly :=
[
  term ((117760 : Rat) / 32699) [(4, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58880 : Rat) / 32699) [(4, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58880 : Rat) / 32699) [(5, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-117760 : Rat) / 32699) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((58880 : Rat) / 32699) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((58880 : Rat) / 32699) [(9, 1), (11, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0106_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0106
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0107 : Poly :=
[
  term ((47960666 : Rat) / 14224065) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 107 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0107 : Poly :=
[
  term ((-95921332 : Rat) / 14224065) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((47960666 : Rat) / 14224065) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((47960666 : Rat) / 14224065) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((95921332 : Rat) / 14224065) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-47960666 : Rat) / 14224065) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-47960666 : Rat) / 14224065) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0107_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0107
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0108 : Poly :=
[
  term ((-15456 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0108 : Poly :=
[
  term ((30912 : Rat) / 32699) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15456 : Rat) / 32699) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15456 : Rat) / 32699) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-30912 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((15456 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((15456 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0108_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0108
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0109 : Poly :=
[
  term ((-349376336 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)]
]

/-- Partial product 109 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0109 : Poly :=
[
  term ((698752672 : Rat) / 99568455) [(4, 1), (9, 1), (11, 1), (15, 4)],
  term ((-349376336 : Rat) / 99568455) [(4, 2), (9, 1), (11, 1), (15, 4)],
  term ((-349376336 : Rat) / 99568455) [(5, 2), (9, 1), (11, 1), (15, 4)],
  term ((-698752672 : Rat) / 99568455) [(9, 1), (11, 1), (14, 1), (15, 4)],
  term ((349376336 : Rat) / 99568455) [(9, 1), (11, 1), (14, 2), (15, 4)],
  term ((349376336 : Rat) / 99568455) [(9, 1), (11, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0109_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0109
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0110 : Poly :=
[
  term ((5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 110 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0110 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(4, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((5888 : Rat) / 32699) [(4, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((5888 : Rat) / 32699) [(5, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((11776 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 4), (16, 1)],
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0110_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0110
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0111 : Poly :=
[
  term ((-5 : Rat) / 2) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 111 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0111 : Poly :=
[
  term (5 : Rat) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 2) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 2) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term (-5 : Rat) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((5 : Rat) / 2) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((5 : Rat) / 2) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0111_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0111
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0112 : Poly :=
[
  term ((-80 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 112 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0112 : Poly :=
[
  term ((160 : Rat) / 29) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(4, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(5, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-160 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((80 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((80 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0112_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0112
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0113 : Poly :=
[
  term ((-46 : Rat) / 29) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 113 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0113 : Poly :=
[
  term ((92 : Rat) / 29) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-46 : Rat) / 29) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-46 : Rat) / 29) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-92 : Rat) / 29) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((46 : Rat) / 29) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((46 : Rat) / 29) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0113_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0113
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0114 : Poly :=
[
  term ((137 : Rat) / 48) [(9, 1), (13, 1)]
]

/-- Partial product 114 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0114 : Poly :=
[
  term ((-137 : Rat) / 24) [(4, 1), (9, 1), (13, 1)],
  term ((137 : Rat) / 48) [(4, 2), (9, 1), (13, 1)],
  term ((137 : Rat) / 48) [(5, 2), (9, 1), (13, 1)],
  term ((137 : Rat) / 24) [(9, 1), (13, 1), (14, 1)],
  term ((-137 : Rat) / 48) [(9, 1), (13, 1), (14, 2)],
  term ((-137 : Rat) / 48) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0114_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0114
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0115 : Poly :=
[
  term ((767 : Rat) / 116) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 115 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0115 : Poly :=
[
  term ((-767 : Rat) / 58) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((767 : Rat) / 116) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((767 : Rat) / 116) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((767 : Rat) / 58) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-767 : Rat) / 116) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-767 : Rat) / 116) [(9, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0115_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0115
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0116 : Poly :=
[
  term ((-280 : Rat) / 87) [(9, 1), (13, 1), (15, 4)]
]

/-- Partial product 116 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0116 : Poly :=
[
  term ((560 : Rat) / 87) [(4, 1), (9, 1), (13, 1), (15, 4)],
  term ((-280 : Rat) / 87) [(4, 2), (9, 1), (13, 1), (15, 4)],
  term ((-280 : Rat) / 87) [(5, 2), (9, 1), (13, 1), (15, 4)],
  term ((-560 : Rat) / 87) [(9, 1), (13, 1), (14, 1), (15, 4)],
  term ((280 : Rat) / 87) [(9, 1), (13, 1), (14, 2), (15, 4)],
  term ((280 : Rat) / 87) [(9, 1), (13, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0116_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0116
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0117 : Poly :=
[
  term (5 : Rat) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 117 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0117 : Poly :=
[
  term (-10 : Rat) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term (5 : Rat) [(4, 2), (9, 1), (13, 2), (15, 1)],
  term (5 : Rat) [(5, 2), (9, 1), (13, 2), (15, 1)],
  term (10 : Rat) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term (-5 : Rat) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term (-5 : Rat) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0117_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0117
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0118 : Poly :=
[
  term ((160 : Rat) / 29) [(9, 1), (13, 2), (15, 3)]
]

/-- Partial product 118 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0118 : Poly :=
[
  term ((-320 : Rat) / 29) [(4, 1), (9, 1), (13, 2), (15, 3)],
  term ((160 : Rat) / 29) [(4, 2), (9, 1), (13, 2), (15, 3)],
  term ((160 : Rat) / 29) [(5, 2), (9, 1), (13, 2), (15, 3)],
  term ((320 : Rat) / 29) [(9, 1), (13, 2), (14, 1), (15, 3)],
  term ((-160 : Rat) / 29) [(9, 1), (13, 2), (14, 2), (15, 3)],
  term ((-160 : Rat) / 29) [(9, 1), (13, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0118_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0118
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0119 : Poly :=
[
  term ((5011 : Rat) / 1392) [(9, 1), (15, 1)]
]

/-- Partial product 119 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0119 : Poly :=
[
  term ((-5011 : Rat) / 696) [(4, 1), (9, 1), (15, 1)],
  term ((5011 : Rat) / 1392) [(4, 2), (9, 1), (15, 1)],
  term ((5011 : Rat) / 1392) [(5, 2), (9, 1), (15, 1)],
  term ((5011 : Rat) / 696) [(9, 1), (14, 1), (15, 1)],
  term ((-5011 : Rat) / 1392) [(9, 1), (14, 2), (15, 1)],
  term ((-5011 : Rat) / 1392) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0119_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0119
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0120 : Poly :=
[
  term ((-7 : Rat) / 6) [(9, 1), (15, 3)]
]

/-- Partial product 120 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0120 : Poly :=
[
  term ((7 : Rat) / 3) [(4, 1), (9, 1), (15, 3)],
  term ((-7 : Rat) / 6) [(4, 2), (9, 1), (15, 3)],
  term ((-7 : Rat) / 6) [(5, 2), (9, 1), (15, 3)],
  term ((-7 : Rat) / 3) [(9, 1), (14, 1), (15, 3)],
  term ((7 : Rat) / 6) [(9, 1), (14, 2), (15, 3)],
  term ((7 : Rat) / 6) [(9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0120_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0120
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0121 : Poly :=
[
  term ((2046355872 : Rat) / 6637897) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 121 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0121 : Poly :=
[
  term ((-4092711744 : Rat) / 6637897) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((2046355872 : Rat) / 6637897) [(4, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((2046355872 : Rat) / 6637897) [(5, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(10, 1), (11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0121_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0121
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0122 : Poly :=
[
  term ((-1943040 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0122 : Poly :=
[
  term ((3886080 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1943040 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1943040 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3886080 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1943040 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1943040 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0122_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0122
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0123 : Poly :=
[
  term ((3999695568 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 123 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0123 : Poly :=
[
  term ((-7999391136 : Rat) / 33189485) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((3999695568 : Rat) / 33189485) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((3999695568 : Rat) / 33189485) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((7999391136 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3999695568 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3999695568 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0123_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0123
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0124 : Poly :=
[
  term ((-759552 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0124 : Poly :=
[
  term ((1519104 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-759552 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-759552 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1519104 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((759552 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((759552 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0124_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0124
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0125 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

/-- Partial product 125 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0125 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(4, 1), (10, 1), (11, 1), (15, 3)],
  term ((31005392 : Rat) / 33189485) [(4, 2), (10, 1), (11, 1), (15, 3)],
  term ((31005392 : Rat) / 33189485) [(5, 2), (10, 1), (11, 1), (15, 3)],
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 3)],
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0125_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0125
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0126 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 126 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0126 : Poly :=
[
  term ((11776 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5888 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5888 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((5888 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0126_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0126
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0127 : Poly :=
[
  term ((3986508072 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 127 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0127 : Poly :=
[
  term ((-7973016144 : Rat) / 6637897) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((3986508072 : Rat) / 6637897) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((3986508072 : Rat) / 6637897) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((7973016144 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3986508072 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3986508072 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0127_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0127
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0128 : Poly :=
[
  term ((-3812400 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0128 : Poly :=
[
  term ((7624800 : Rat) / 32699) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3812400 : Rat) / 32699) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3812400 : Rat) / 32699) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7624800 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3812400 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3812400 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0128_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0128
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0129 : Poly :=
[
  term ((2989881054 : Rat) / 33189485) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 129 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0129 : Poly :=
[
  term ((-5979762108 : Rat) / 33189485) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((2989881054 : Rat) / 33189485) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((2989881054 : Rat) / 33189485) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((5979762108 : Rat) / 33189485) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0129_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0129
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0130 : Poly :=
[
  term ((-571860 : Rat) / 32699) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0130 : Poly :=
[
  term ((1143720 : Rat) / 32699) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-571860 : Rat) / 32699) [(4, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-571860 : Rat) / 32699) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1143720 : Rat) / 32699) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((571860 : Rat) / 32699) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((571860 : Rat) / 32699) [(10, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0130_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0130
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0131 : Poly :=
[
  term ((-4045158685 : Rat) / 39827382) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 131 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0131 : Poly :=
[
  term ((4045158685 : Rat) / 19913691) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4045158685 : Rat) / 39827382) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4045158685 : Rat) / 39827382) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4045158685 : Rat) / 19913691) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((4045158685 : Rat) / 39827382) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((4045158685 : Rat) / 39827382) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0131_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0131
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0132 : Poly :=
[
  term ((1874914 : Rat) / 98097) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0132 : Poly :=
[
  term ((-3749828 : Rat) / 98097) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1874914 : Rat) / 98097) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1874914 : Rat) / 98097) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3749828 : Rat) / 98097) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1874914 : Rat) / 98097) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1874914 : Rat) / 98097) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0132_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0132
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0133 : Poly :=
[
  term ((664418012 : Rat) / 1144465) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 133 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0133 : Poly :=
[
  term ((-1328836024 : Rat) / 1144465) [(4, 1), (10, 1), (13, 1), (15, 3)],
  term ((664418012 : Rat) / 1144465) [(4, 2), (10, 1), (13, 1), (15, 3)],
  term ((664418012 : Rat) / 1144465) [(5, 2), (10, 1), (13, 1), (15, 3)],
  term ((1328836024 : Rat) / 1144465) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-664418012 : Rat) / 1144465) [(10, 1), (13, 1), (14, 2), (15, 3)],
  term ((-664418012 : Rat) / 1144465) [(10, 1), (13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0133_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0133
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0134 : Poly :=
[
  term ((-3685320 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 134 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0134 : Poly :=
[
  term ((7370640 : Rat) / 32699) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3685320 : Rat) / 32699) [(4, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3685320 : Rat) / 32699) [(5, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7370640 : Rat) / 32699) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3685320 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((3685320 : Rat) / 32699) [(10, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0134_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0134
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0135 : Poly :=
[
  term ((-7973016144 : Rat) / 6637897) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 135 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0135 : Poly :=
[
  term ((15946032288 : Rat) / 6637897) [(4, 1), (10, 1), (13, 2), (15, 2)],
  term ((-7973016144 : Rat) / 6637897) [(4, 2), (10, 1), (13, 2), (15, 2)],
  term ((-7973016144 : Rat) / 6637897) [(5, 2), (10, 1), (13, 2), (15, 2)],
  term ((-15946032288 : Rat) / 6637897) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((7973016144 : Rat) / 6637897) [(10, 1), (13, 2), (14, 2), (15, 2)],
  term ((7973016144 : Rat) / 6637897) [(10, 1), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0135_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0135
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0136 : Poly :=
[
  term ((7624800 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 136 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0136 : Poly :=
[
  term ((-15249600 : Rat) / 32699) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((7624800 : Rat) / 32699) [(4, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((7624800 : Rat) / 32699) [(5, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((15249600 : Rat) / 32699) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7624800 : Rat) / 32699) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-7624800 : Rat) / 32699) [(10, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0136_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0136
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0137 : Poly :=
[
  term ((-40717408174 : Rat) / 99568455) [(10, 1), (15, 2)]
]

/-- Partial product 137 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0137 : Poly :=
[
  term ((81434816348 : Rat) / 99568455) [(4, 1), (10, 1), (15, 2)],
  term ((-40717408174 : Rat) / 99568455) [(4, 2), (10, 1), (15, 2)],
  term ((-40717408174 : Rat) / 99568455) [(5, 2), (10, 1), (15, 2)],
  term ((-81434816348 : Rat) / 99568455) [(10, 1), (14, 1), (15, 2)],
  term ((40717408174 : Rat) / 99568455) [(10, 1), (14, 2), (15, 2)],
  term ((40717408174 : Rat) / 99568455) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0137_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0137
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0138 : Poly :=
[
  term ((7792066 : Rat) / 98097) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 138 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0138 : Poly :=
[
  term ((-15584132 : Rat) / 98097) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((7792066 : Rat) / 98097) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((7792066 : Rat) / 98097) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((15584132 : Rat) / 98097) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7792066 : Rat) / 98097) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7792066 : Rat) / 98097) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0138_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0138
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0139 : Poly :=
[
  term ((2989881054 : Rat) / 33189485) [(10, 1), (15, 4)]
]

/-- Partial product 139 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0139 : Poly :=
[
  term ((-5979762108 : Rat) / 33189485) [(4, 1), (10, 1), (15, 4)],
  term ((2989881054 : Rat) / 33189485) [(4, 2), (10, 1), (15, 4)],
  term ((2989881054 : Rat) / 33189485) [(5, 2), (10, 1), (15, 4)],
  term ((5979762108 : Rat) / 33189485) [(10, 1), (14, 1), (15, 4)],
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (14, 2), (15, 4)],
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0139_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0139
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0140 : Poly :=
[
  term ((-571860 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 140 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0140 : Poly :=
[
  term ((1143720 : Rat) / 32699) [(4, 1), (10, 1), (15, 4), (16, 1)],
  term ((-571860 : Rat) / 32699) [(4, 2), (10, 1), (15, 4), (16, 1)],
  term ((-571860 : Rat) / 32699) [(5, 2), (10, 1), (15, 4), (16, 1)],
  term ((-1143720 : Rat) / 32699) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((571860 : Rat) / 32699) [(10, 1), (14, 2), (15, 4), (16, 1)],
  term ((571860 : Rat) / 32699) [(10, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0140_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0140
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0141 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 141 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0141 : Poly :=
[
  term ((-11627022000 : Rat) / 6637897) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5813511000 : Rat) / 6637897) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5813511000 : Rat) / 6637897) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((11627022000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0141_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0141
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0142 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 142 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0142 : Poly :=
[
  term ((11040000 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0142_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0142
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0143 : Poly :=
[
  term ((-36134299337 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 143 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0143 : Poly :=
[
  term ((72268598674 : Rat) / 33189485) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-36134299337 : Rat) / 33189485) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-36134299337 : Rat) / 33189485) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-72268598674 : Rat) / 33189485) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((36134299337 : Rat) / 33189485) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((36134299337 : Rat) / 33189485) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0143_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0143
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0144 : Poly :=
[
  term ((6920562 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0144 : Poly :=
[
  term ((-13841124 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6920562 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6920562 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13841124 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6920562 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6920562 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0144_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0144
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0145 : Poly :=
[
  term ((3875674 : Rat) / 4741355) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 145 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0145 : Poly :=
[
  term ((-7751348 : Rat) / 4741355) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term ((3875674 : Rat) / 4741355) [(4, 2), (11, 1), (12, 1), (15, 3)],
  term ((3875674 : Rat) / 4741355) [(5, 2), (11, 1), (12, 1), (15, 3)],
  term ((7751348 : Rat) / 4741355) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-3875674 : Rat) / 4741355) [(11, 1), (12, 1), (14, 2), (15, 3)],
  term ((-3875674 : Rat) / 4741355) [(11, 1), (12, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0145_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0145
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0146 : Poly :=
[
  term ((-5152 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 146 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0146 : Poly :=
[
  term ((10304 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5152 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5152 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10304 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((5152 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((5152 : Rat) / 32699) [(11, 1), (12, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0146_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0146
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0147 : Poly :=
[
  term ((29190119561 : Rat) / 19913691) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 147 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0147 : Poly :=
[
  term ((-58380239122 : Rat) / 19913691) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((29190119561 : Rat) / 19913691) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((29190119561 : Rat) / 19913691) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((58380239122 : Rat) / 19913691) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-29190119561 : Rat) / 19913691) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-29190119561 : Rat) / 19913691) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0147_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0147
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0148 : Poly :=
[
  term ((-27976480 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 148 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0148 : Poly :=
[
  term ((55952960 : Rat) / 98097) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27976480 : Rat) / 98097) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27976480 : Rat) / 98097) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-55952960 : Rat) / 98097) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((27976480 : Rat) / 98097) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((27976480 : Rat) / 98097) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0148_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0148
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0149 : Poly :=
[
  term ((968918500 : Rat) / 948271) [(11, 1), (13, 1), (15, 4)]
]

/-- Partial product 149 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0149 : Poly :=
[
  term ((-1937837000 : Rat) / 948271) [(4, 1), (11, 1), (13, 1), (15, 4)],
  term ((968918500 : Rat) / 948271) [(4, 2), (11, 1), (13, 1), (15, 4)],
  term ((968918500 : Rat) / 948271) [(5, 2), (11, 1), (13, 1), (15, 4)],
  term ((1937837000 : Rat) / 948271) [(11, 1), (13, 1), (14, 1), (15, 4)],
  term ((-968918500 : Rat) / 948271) [(11, 1), (13, 1), (14, 2), (15, 4)],
  term ((-968918500 : Rat) / 948271) [(11, 1), (13, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0149_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0149
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0150 : Poly :=
[
  term ((-6440000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 150 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0150 : Poly :=
[
  term ((12880000 : Rat) / 32699) [(4, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-6440000 : Rat) / 32699) [(4, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-6440000 : Rat) / 32699) [(5, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-12880000 : Rat) / 32699) [(11, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((6440000 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 4), (16, 1)],
  term ((6440000 : Rat) / 32699) [(11, 1), (13, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0150_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0150
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0151 : Poly :=
[
  term ((-11627022000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)]
]

/-- Partial product 151 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0151 : Poly :=
[
  term ((23254044000 : Rat) / 6637897) [(4, 1), (11, 1), (13, 2), (15, 3)],
  term ((-11627022000 : Rat) / 6637897) [(4, 2), (11, 1), (13, 2), (15, 3)],
  term ((-11627022000 : Rat) / 6637897) [(5, 2), (11, 1), (13, 2), (15, 3)],
  term ((-23254044000 : Rat) / 6637897) [(11, 1), (13, 2), (14, 1), (15, 3)],
  term ((11627022000 : Rat) / 6637897) [(11, 1), (13, 2), (14, 2), (15, 3)],
  term ((11627022000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0151_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0151
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0152 : Poly :=
[
  term ((11040000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 152 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0152 : Poly :=
[
  term ((-22080000 : Rat) / 32699) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((11040000 : Rat) / 32699) [(4, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((11040000 : Rat) / 32699) [(5, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((22080000 : Rat) / 32699) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(11, 1), (13, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0152_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0152
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0153 : Poly :=
[
  term ((315446132839 : Rat) / 398273820) [(11, 1), (15, 1)]
]

/-- Partial product 153 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0153 : Poly :=
[
  term ((-315446132839 : Rat) / 199136910) [(4, 1), (11, 1), (15, 1)],
  term ((315446132839 : Rat) / 398273820) [(4, 2), (11, 1), (15, 1)],
  term ((315446132839 : Rat) / 398273820) [(5, 2), (11, 1), (15, 1)],
  term ((315446132839 : Rat) / 199136910) [(11, 1), (14, 1), (15, 1)],
  term ((-315446132839 : Rat) / 398273820) [(11, 1), (14, 2), (15, 1)],
  term ((-315446132839 : Rat) / 398273820) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0153_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0153
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0154 : Poly :=
[
  term ((-15096760 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0154 : Poly :=
[
  term ((30193520 : Rat) / 98097) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15096760 : Rat) / 98097) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15096760 : Rat) / 98097) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-30193520 : Rat) / 98097) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((15096760 : Rat) / 98097) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((15096760 : Rat) / 98097) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0154_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0154
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0155 : Poly :=
[
  term ((-7627425668 : Rat) / 4741355) [(11, 1), (15, 3)]
]

/-- Partial product 155 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0155 : Poly :=
[
  term ((15254851336 : Rat) / 4741355) [(4, 1), (11, 1), (15, 3)],
  term ((-7627425668 : Rat) / 4741355) [(4, 2), (11, 1), (15, 3)],
  term ((-7627425668 : Rat) / 4741355) [(5, 2), (11, 1), (15, 3)],
  term ((-15254851336 : Rat) / 4741355) [(11, 1), (14, 1), (15, 3)],
  term ((7627425668 : Rat) / 4741355) [(11, 1), (14, 2), (15, 3)],
  term ((7627425668 : Rat) / 4741355) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0155_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0155
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0156 : Poly :=
[
  term ((10173774 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 156 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0156 : Poly :=
[
  term ((-20347548 : Rat) / 32699) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((10173774 : Rat) / 32699) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((10173774 : Rat) / 32699) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((20347548 : Rat) / 32699) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10173774 : Rat) / 32699) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-10173774 : Rat) / 32699) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0156_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0156
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0157 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 157 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0157 : Poly :=
[
  term ((27532788096 : Rat) / 33189485) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13766394048 : Rat) / 33189485) [(4, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13766394048 : Rat) / 33189485) [(5, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-27532788096 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0157_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0157
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0158 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0158 : Poly :=
[
  term ((-5228544 : Rat) / 32699) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2614272 : Rat) / 32699) [(4, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2614272 : Rat) / 32699) [(5, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5228544 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0158_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0158
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0159 : Poly :=
[
  term ((10107757792 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 159 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0159 : Poly :=
[
  term ((-20215515584 : Rat) / 33189485) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((10107757792 : Rat) / 33189485) [(4, 2), (11, 2), (12, 1), (15, 2)],
  term ((10107757792 : Rat) / 33189485) [(5, 2), (11, 2), (12, 1), (15, 2)],
  term ((20215515584 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-10107757792 : Rat) / 33189485) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-10107757792 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0159_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0159
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0160 : Poly :=
[
  term ((-1919488 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 160 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0160 : Poly :=
[
  term ((3838976 : Rat) / 32699) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1919488 : Rat) / 32699) [(4, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1919488 : Rat) / 32699) [(5, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3838976 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1919488 : Rat) / 32699) [(11, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1919488 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0160_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0160
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0161 : Poly :=
[
  term ((10727865632 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 161 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0161 : Poly :=
[
  term ((-21455731264 : Rat) / 33189485) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((10727865632 : Rat) / 33189485) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((10727865632 : Rat) / 33189485) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((21455731264 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-10727865632 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-10727865632 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0161_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0161
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0162 : Poly :=
[
  term ((-2037248 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0162 : Poly :=
[
  term ((4074496 : Rat) / 32699) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2037248 : Rat) / 32699) [(4, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2037248 : Rat) / 32699) [(5, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4074496 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2037248 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2037248 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0162_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0162
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0163 : Poly :=
[
  term ((-57173942848 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 163 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0163 : Poly :=
[
  term ((114347885696 : Rat) / 33189485) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((-57173942848 : Rat) / 33189485) [(4, 2), (11, 2), (13, 1), (15, 3)],
  term ((-57173942848 : Rat) / 33189485) [(5, 2), (11, 2), (13, 1), (15, 3)],
  term ((-114347885696 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((57173942848 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((57173942848 : Rat) / 33189485) [(11, 2), (13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0163_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0163
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0164 : Poly :=
[
  term ((10857472 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 164 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0164 : Poly :=
[
  term ((-21714944 : Rat) / 32699) [(4, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((10857472 : Rat) / 32699) [(4, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((10857472 : Rat) / 32699) [(5, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((21714944 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10857472 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-10857472 : Rat) / 32699) [(11, 2), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0164_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0164
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0165 : Poly :=
[
  term ((27532788096 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

/-- Partial product 165 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0165 : Poly :=
[
  term ((-55065576192 : Rat) / 33189485) [(4, 1), (11, 2), (13, 2), (15, 2)],
  term ((27532788096 : Rat) / 33189485) [(4, 2), (11, 2), (13, 2), (15, 2)],
  term ((27532788096 : Rat) / 33189485) [(5, 2), (11, 2), (13, 2), (15, 2)],
  term ((55065576192 : Rat) / 33189485) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((-27532788096 : Rat) / 33189485) [(11, 2), (13, 2), (14, 2), (15, 2)],
  term ((-27532788096 : Rat) / 33189485) [(11, 2), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0165_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0165
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0166 : Poly :=
[
  term ((-5228544 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 166 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0166 : Poly :=
[
  term ((10457088 : Rat) / 32699) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(4, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(5, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-10457088 : Rat) / 32699) [(11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((5228544 : Rat) / 32699) [(11, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((5228544 : Rat) / 32699) [(11, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0166_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0166
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0167 : Poly :=
[
  term ((-2999771676 : Rat) / 33189485) [(11, 2), (15, 2)]
]

/-- Partial product 167 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0167 : Poly :=
[
  term ((5999543352 : Rat) / 33189485) [(4, 1), (11, 2), (15, 2)],
  term ((-2999771676 : Rat) / 33189485) [(4, 2), (11, 2), (15, 2)],
  term ((-2999771676 : Rat) / 33189485) [(5, 2), (11, 2), (15, 2)],
  term ((-5999543352 : Rat) / 33189485) [(11, 2), (14, 1), (15, 2)],
  term ((2999771676 : Rat) / 33189485) [(11, 2), (14, 2), (15, 2)],
  term ((2999771676 : Rat) / 33189485) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0167_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0167
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0168 : Poly :=
[
  term ((569664 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 168 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0168 : Poly :=
[
  term ((-1139328 : Rat) / 32699) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((569664 : Rat) / 32699) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((569664 : Rat) / 32699) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((1139328 : Rat) / 32699) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-569664 : Rat) / 32699) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-569664 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0168_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0168
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0169 : Poly :=
[
  term ((23905157232 : Rat) / 33189485) [(11, 2), (15, 4)]
]

/-- Partial product 169 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0169 : Poly :=
[
  term ((-47810314464 : Rat) / 33189485) [(4, 1), (11, 2), (15, 4)],
  term ((23905157232 : Rat) / 33189485) [(4, 2), (11, 2), (15, 4)],
  term ((23905157232 : Rat) / 33189485) [(5, 2), (11, 2), (15, 4)],
  term ((47810314464 : Rat) / 33189485) [(11, 2), (14, 1), (15, 4)],
  term ((-23905157232 : Rat) / 33189485) [(11, 2), (14, 2), (15, 4)],
  term ((-23905157232 : Rat) / 33189485) [(11, 2), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0169_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0169
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0170 : Poly :=
[
  term ((-4539648 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

/-- Partial product 170 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0170 : Poly :=
[
  term ((9079296 : Rat) / 32699) [(4, 1), (11, 2), (15, 4), (16, 1)],
  term ((-4539648 : Rat) / 32699) [(4, 2), (11, 2), (15, 4), (16, 1)],
  term ((-4539648 : Rat) / 32699) [(5, 2), (11, 2), (15, 4), (16, 1)],
  term ((-9079296 : Rat) / 32699) [(11, 2), (14, 1), (15, 4), (16, 1)],
  term ((4539648 : Rat) / 32699) [(11, 2), (14, 2), (15, 4), (16, 1)],
  term ((4539648 : Rat) / 32699) [(11, 2), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0170_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0170
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0171 : Poly :=
[
  term ((496086272 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

/-- Partial product 171 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0171 : Poly :=
[
  term ((-992172544 : Rat) / 33189485) [(4, 1), (11, 3), (13, 1), (15, 2)],
  term ((496086272 : Rat) / 33189485) [(4, 2), (11, 3), (13, 1), (15, 2)],
  term ((496086272 : Rat) / 33189485) [(5, 2), (11, 3), (13, 1), (15, 2)],
  term ((992172544 : Rat) / 33189485) [(11, 3), (13, 1), (14, 1), (15, 2)],
  term ((-496086272 : Rat) / 33189485) [(11, 3), (13, 1), (14, 2), (15, 2)],
  term ((-496086272 : Rat) / 33189485) [(11, 3), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0171_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0171
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0172 : Poly :=
[
  term ((-94208 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 172 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0172 : Poly :=
[
  term ((188416 : Rat) / 32699) [(4, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-94208 : Rat) / 32699) [(4, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-94208 : Rat) / 32699) [(5, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-188416 : Rat) / 32699) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((94208 : Rat) / 32699) [(11, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((94208 : Rat) / 32699) [(11, 3), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0172_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0172
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0173 : Poly :=
[
  term ((93016176 : Rat) / 33189485) [(11, 3), (15, 1)]
]

/-- Partial product 173 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0173 : Poly :=
[
  term ((-186032352 : Rat) / 33189485) [(4, 1), (11, 3), (15, 1)],
  term ((93016176 : Rat) / 33189485) [(4, 2), (11, 3), (15, 1)],
  term ((93016176 : Rat) / 33189485) [(5, 2), (11, 3), (15, 1)],
  term ((186032352 : Rat) / 33189485) [(11, 3), (14, 1), (15, 1)],
  term ((-93016176 : Rat) / 33189485) [(11, 3), (14, 2), (15, 1)],
  term ((-93016176 : Rat) / 33189485) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0173_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0173
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0174 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0174 : Poly :=
[
  term ((35328 : Rat) / 32699) [(4, 1), (11, 3), (15, 1), (16, 1)],
  term ((-17664 : Rat) / 32699) [(4, 2), (11, 3), (15, 1), (16, 1)],
  term ((-17664 : Rat) / 32699) [(5, 2), (11, 3), (15, 1), (16, 1)],
  term ((-35328 : Rat) / 32699) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((17664 : Rat) / 32699) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((17664 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0174_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0174
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0175 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(11, 3), (15, 3)]
]

/-- Partial product 175 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0175 : Poly :=
[
  term ((248043136 : Rat) / 33189485) [(4, 1), (11, 3), (15, 3)],
  term ((-124021568 : Rat) / 33189485) [(4, 2), (11, 3), (15, 3)],
  term ((-124021568 : Rat) / 33189485) [(5, 2), (11, 3), (15, 3)],
  term ((-248043136 : Rat) / 33189485) [(11, 3), (14, 1), (15, 3)],
  term ((124021568 : Rat) / 33189485) [(11, 3), (14, 2), (15, 3)],
  term ((124021568 : Rat) / 33189485) [(11, 3), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0175_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0175
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0176 : Poly :=
[
  term ((23552 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

/-- Partial product 176 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0176 : Poly :=
[
  term ((-47104 : Rat) / 32699) [(4, 1), (11, 3), (15, 3), (16, 1)],
  term ((23552 : Rat) / 32699) [(4, 2), (11, 3), (15, 3), (16, 1)],
  term ((23552 : Rat) / 32699) [(5, 2), (11, 3), (15, 3), (16, 1)],
  term ((47104 : Rat) / 32699) [(11, 3), (14, 1), (15, 3), (16, 1)],
  term ((-23552 : Rat) / 32699) [(11, 3), (14, 2), (15, 3), (16, 1)],
  term ((-23552 : Rat) / 32699) [(11, 3), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0176_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0176
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0177 : Poly :=
[
  term ((109 : Rat) / 40) [(12, 1)]
]

/-- Partial product 177 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0177 : Poly :=
[
  term ((-109 : Rat) / 20) [(4, 1), (12, 1)],
  term ((109 : Rat) / 40) [(4, 2), (12, 1)],
  term ((109 : Rat) / 40) [(5, 2), (12, 1)],
  term ((109 : Rat) / 20) [(12, 1), (14, 1)],
  term ((-109 : Rat) / 40) [(12, 1), (14, 2)],
  term ((-109 : Rat) / 40) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0177_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0177
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0178 : Poly :=
[
  term ((-29004583963 : Rat) / 18965420) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 178 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0178 : Poly :=
[
  term ((29004583963 : Rat) / 9482710) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-29004583963 : Rat) / 18965420) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-29004583963 : Rat) / 18965420) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-29004583963 : Rat) / 9482710) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((29004583963 : Rat) / 18965420) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((29004583963 : Rat) / 18965420) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0178_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0178
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0179 : Poly :=
[
  term ((9616766 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0179 : Poly :=
[
  term ((-19233532 : Rat) / 32699) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9616766 : Rat) / 32699) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9616766 : Rat) / 32699) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((19233532 : Rat) / 32699) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9616766 : Rat) / 32699) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9616766 : Rat) / 32699) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0179_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0179
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0180 : Poly :=
[
  term ((1736140985741 : Rat) / 1593095280) [(12, 1), (15, 2)]
]

/-- Partial product 180 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0180 : Poly :=
[
  term ((-1736140985741 : Rat) / 796547640) [(4, 1), (12, 1), (15, 2)],
  term ((1736140985741 : Rat) / 1593095280) [(4, 2), (12, 1), (15, 2)],
  term ((1736140985741 : Rat) / 1593095280) [(5, 2), (12, 1), (15, 2)],
  term ((1736140985741 : Rat) / 796547640) [(12, 1), (14, 1), (15, 2)],
  term ((-1736140985741 : Rat) / 1593095280) [(12, 1), (14, 2), (15, 2)],
  term ((-1736140985741 : Rat) / 1593095280) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0180_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0180
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0181 : Poly :=
[
  term ((-41429629 : Rat) / 196194) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 181 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0181 : Poly :=
[
  term ((41429629 : Rat) / 98097) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-41429629 : Rat) / 196194) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-41429629 : Rat) / 196194) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-41429629 : Rat) / 98097) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((41429629 : Rat) / 196194) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((41429629 : Rat) / 196194) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0181_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0181
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0182 : Poly :=
[
  term ((113269573579 : Rat) / 99568455) [(13, 1), (15, 1)]
]

/-- Partial product 182 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0182 : Poly :=
[
  term ((-226539147158 : Rat) / 99568455) [(4, 1), (13, 1), (15, 1)],
  term ((113269573579 : Rat) / 99568455) [(4, 2), (13, 1), (15, 1)],
  term ((113269573579 : Rat) / 99568455) [(5, 2), (13, 1), (15, 1)],
  term ((226539147158 : Rat) / 99568455) [(13, 1), (14, 1), (15, 1)],
  term ((-113269573579 : Rat) / 99568455) [(13, 1), (14, 2), (15, 1)],
  term ((-113269573579 : Rat) / 99568455) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0182_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0182
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0183 : Poly :=
[
  term ((-21579749 : Rat) / 98097) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0183 : Poly :=
[
  term ((43159498 : Rat) / 98097) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21579749 : Rat) / 98097) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21579749 : Rat) / 98097) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43159498 : Rat) / 98097) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21579749 : Rat) / 98097) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((21579749 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0183_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0183
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0184 : Poly :=
[
  term ((-954112331701 : Rat) / 265515880) [(13, 1), (15, 3)]
]

/-- Partial product 184 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0184 : Poly :=
[
  term ((954112331701 : Rat) / 132757940) [(4, 1), (13, 1), (15, 3)],
  term ((-954112331701 : Rat) / 265515880) [(4, 2), (13, 1), (15, 3)],
  term ((-954112331701 : Rat) / 265515880) [(5, 2), (13, 1), (15, 3)],
  term ((-954112331701 : Rat) / 132757940) [(13, 1), (14, 1), (15, 3)],
  term ((954112331701 : Rat) / 265515880) [(13, 1), (14, 2), (15, 3)],
  term ((954112331701 : Rat) / 265515880) [(13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0184_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0184
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0185 : Poly :=
[
  term ((68185447 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 185 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0185 : Poly :=
[
  term ((-136370894 : Rat) / 98097) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((68185447 : Rat) / 98097) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((68185447 : Rat) / 98097) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((136370894 : Rat) / 98097) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-68185447 : Rat) / 98097) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-68185447 : Rat) / 98097) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0185_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0185
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0186 : Poly :=
[
  term ((-41 : Rat) / 20) [(13, 2)]
]

/-- Partial product 186 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0186 : Poly :=
[
  term ((41 : Rat) / 10) [(4, 1), (13, 2)],
  term ((-41 : Rat) / 20) [(4, 2), (13, 2)],
  term ((-41 : Rat) / 20) [(5, 2), (13, 2)],
  term ((-41 : Rat) / 10) [(13, 2), (14, 1)],
  term ((41 : Rat) / 20) [(13, 2), (14, 2)],
  term ((41 : Rat) / 20) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0186_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0186
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0187 : Poly :=
[
  term ((28926825741 : Rat) / 9482710) [(13, 2), (15, 2)]
]

/-- Partial product 187 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0187 : Poly :=
[
  term ((-28926825741 : Rat) / 4741355) [(4, 1), (13, 2), (15, 2)],
  term ((28926825741 : Rat) / 9482710) [(4, 2), (13, 2), (15, 2)],
  term ((28926825741 : Rat) / 9482710) [(5, 2), (13, 2), (15, 2)],
  term ((28926825741 : Rat) / 4741355) [(13, 2), (14, 1), (15, 2)],
  term ((-28926825741 : Rat) / 9482710) [(13, 2), (14, 2), (15, 2)],
  term ((-28926825741 : Rat) / 9482710) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0187_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0187
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0188 : Poly :=
[
  term ((-19233532 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 188 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0188 : Poly :=
[
  term ((38467064 : Rat) / 32699) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19233532 : Rat) / 32699) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-19233532 : Rat) / 32699) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-38467064 : Rat) / 32699) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((19233532 : Rat) / 32699) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((19233532 : Rat) / 32699) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0188_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0188
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0189 : Poly :=
[
  term ((-2491158132977 : Rat) / 3186190560) [(15, 2)]
]

/-- Partial product 189 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0189 : Poly :=
[
  term ((2491158132977 : Rat) / 1593095280) [(4, 1), (15, 2)],
  term ((-2491158132977 : Rat) / 3186190560) [(4, 2), (15, 2)],
  term ((-2491158132977 : Rat) / 3186190560) [(5, 2), (15, 2)],
  term ((-2491158132977 : Rat) / 1593095280) [(14, 1), (15, 2)],
  term ((2491158132977 : Rat) / 3186190560) [(14, 2), (15, 2)],
  term ((2491158132977 : Rat) / 3186190560) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0189_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0189
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0190 : Poly :=
[
  term ((60109543 : Rat) / 392388) [(15, 2), (16, 1)]
]

/-- Partial product 190 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0190 : Poly :=
[
  term ((-60109543 : Rat) / 196194) [(4, 1), (15, 2), (16, 1)],
  term ((60109543 : Rat) / 392388) [(4, 2), (15, 2), (16, 1)],
  term ((60109543 : Rat) / 392388) [(5, 2), (15, 2), (16, 1)],
  term ((60109543 : Rat) / 196194) [(14, 1), (15, 2), (16, 1)],
  term ((-60109543 : Rat) / 392388) [(14, 2), (15, 2), (16, 1)],
  term ((-60109543 : Rat) / 392388) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0190_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0190
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0191 : Poly :=
[
  term ((713886046843 : Rat) / 796547640) [(15, 4)]
]

/-- Partial product 191 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0191 : Poly :=
[
  term ((-713886046843 : Rat) / 398273820) [(4, 1), (15, 4)],
  term ((713886046843 : Rat) / 796547640) [(4, 2), (15, 4)],
  term ((713886046843 : Rat) / 796547640) [(5, 2), (15, 4)],
  term ((713886046843 : Rat) / 398273820) [(14, 1), (15, 4)],
  term ((-713886046843 : Rat) / 796547640) [(14, 2), (15, 4)],
  term ((-713886046843 : Rat) / 796547640) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0191_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0191
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYYY_coefficient_05_0192 : Poly :=
[
  term ((-17064581 : Rat) / 98097) [(15, 4), (16, 1)]
]

/-- Partial product 192 for generator 5. -/
def rs_R009_ueqv_R009NYYYY_partial_05_0192 : Poly :=
[
  term ((34129162 : Rat) / 98097) [(4, 1), (15, 4), (16, 1)],
  term ((-17064581 : Rat) / 98097) [(4, 2), (15, 4), (16, 1)],
  term ((-17064581 : Rat) / 98097) [(5, 2), (15, 4), (16, 1)],
  term ((-34129162 : Rat) / 98097) [(14, 1), (15, 4), (16, 1)],
  term ((17064581 : Rat) / 98097) [(14, 2), (15, 4), (16, 1)],
  term ((17064581 : Rat) / 98097) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 5. -/
theorem rs_R009_ueqv_R009NYYYY_partial_05_0192_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_05_0192
        rs_R009_ueqv_R009NYYYY_generator_05_0100_0192 =
      rs_R009_ueqv_R009NYYYY_partial_05_0192 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_05_0100_0192 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_05_0100,
  rs_R009_ueqv_R009NYYYY_partial_05_0101,
  rs_R009_ueqv_R009NYYYY_partial_05_0102,
  rs_R009_ueqv_R009NYYYY_partial_05_0103,
  rs_R009_ueqv_R009NYYYY_partial_05_0104,
  rs_R009_ueqv_R009NYYYY_partial_05_0105,
  rs_R009_ueqv_R009NYYYY_partial_05_0106,
  rs_R009_ueqv_R009NYYYY_partial_05_0107,
  rs_R009_ueqv_R009NYYYY_partial_05_0108,
  rs_R009_ueqv_R009NYYYY_partial_05_0109,
  rs_R009_ueqv_R009NYYYY_partial_05_0110,
  rs_R009_ueqv_R009NYYYY_partial_05_0111,
  rs_R009_ueqv_R009NYYYY_partial_05_0112,
  rs_R009_ueqv_R009NYYYY_partial_05_0113,
  rs_R009_ueqv_R009NYYYY_partial_05_0114,
  rs_R009_ueqv_R009NYYYY_partial_05_0115,
  rs_R009_ueqv_R009NYYYY_partial_05_0116,
  rs_R009_ueqv_R009NYYYY_partial_05_0117,
  rs_R009_ueqv_R009NYYYY_partial_05_0118,
  rs_R009_ueqv_R009NYYYY_partial_05_0119,
  rs_R009_ueqv_R009NYYYY_partial_05_0120,
  rs_R009_ueqv_R009NYYYY_partial_05_0121,
  rs_R009_ueqv_R009NYYYY_partial_05_0122,
  rs_R009_ueqv_R009NYYYY_partial_05_0123,
  rs_R009_ueqv_R009NYYYY_partial_05_0124,
  rs_R009_ueqv_R009NYYYY_partial_05_0125,
  rs_R009_ueqv_R009NYYYY_partial_05_0126,
  rs_R009_ueqv_R009NYYYY_partial_05_0127,
  rs_R009_ueqv_R009NYYYY_partial_05_0128,
  rs_R009_ueqv_R009NYYYY_partial_05_0129,
  rs_R009_ueqv_R009NYYYY_partial_05_0130,
  rs_R009_ueqv_R009NYYYY_partial_05_0131,
  rs_R009_ueqv_R009NYYYY_partial_05_0132,
  rs_R009_ueqv_R009NYYYY_partial_05_0133,
  rs_R009_ueqv_R009NYYYY_partial_05_0134,
  rs_R009_ueqv_R009NYYYY_partial_05_0135,
  rs_R009_ueqv_R009NYYYY_partial_05_0136,
  rs_R009_ueqv_R009NYYYY_partial_05_0137,
  rs_R009_ueqv_R009NYYYY_partial_05_0138,
  rs_R009_ueqv_R009NYYYY_partial_05_0139,
  rs_R009_ueqv_R009NYYYY_partial_05_0140,
  rs_R009_ueqv_R009NYYYY_partial_05_0141,
  rs_R009_ueqv_R009NYYYY_partial_05_0142,
  rs_R009_ueqv_R009NYYYY_partial_05_0143,
  rs_R009_ueqv_R009NYYYY_partial_05_0144,
  rs_R009_ueqv_R009NYYYY_partial_05_0145,
  rs_R009_ueqv_R009NYYYY_partial_05_0146,
  rs_R009_ueqv_R009NYYYY_partial_05_0147,
  rs_R009_ueqv_R009NYYYY_partial_05_0148,
  rs_R009_ueqv_R009NYYYY_partial_05_0149,
  rs_R009_ueqv_R009NYYYY_partial_05_0150,
  rs_R009_ueqv_R009NYYYY_partial_05_0151,
  rs_R009_ueqv_R009NYYYY_partial_05_0152,
  rs_R009_ueqv_R009NYYYY_partial_05_0153,
  rs_R009_ueqv_R009NYYYY_partial_05_0154,
  rs_R009_ueqv_R009NYYYY_partial_05_0155,
  rs_R009_ueqv_R009NYYYY_partial_05_0156,
  rs_R009_ueqv_R009NYYYY_partial_05_0157,
  rs_R009_ueqv_R009NYYYY_partial_05_0158,
  rs_R009_ueqv_R009NYYYY_partial_05_0159,
  rs_R009_ueqv_R009NYYYY_partial_05_0160,
  rs_R009_ueqv_R009NYYYY_partial_05_0161,
  rs_R009_ueqv_R009NYYYY_partial_05_0162,
  rs_R009_ueqv_R009NYYYY_partial_05_0163,
  rs_R009_ueqv_R009NYYYY_partial_05_0164,
  rs_R009_ueqv_R009NYYYY_partial_05_0165,
  rs_R009_ueqv_R009NYYYY_partial_05_0166,
  rs_R009_ueqv_R009NYYYY_partial_05_0167,
  rs_R009_ueqv_R009NYYYY_partial_05_0168,
  rs_R009_ueqv_R009NYYYY_partial_05_0169,
  rs_R009_ueqv_R009NYYYY_partial_05_0170,
  rs_R009_ueqv_R009NYYYY_partial_05_0171,
  rs_R009_ueqv_R009NYYYY_partial_05_0172,
  rs_R009_ueqv_R009NYYYY_partial_05_0173,
  rs_R009_ueqv_R009NYYYY_partial_05_0174,
  rs_R009_ueqv_R009NYYYY_partial_05_0175,
  rs_R009_ueqv_R009NYYYY_partial_05_0176,
  rs_R009_ueqv_R009NYYYY_partial_05_0177,
  rs_R009_ueqv_R009NYYYY_partial_05_0178,
  rs_R009_ueqv_R009NYYYY_partial_05_0179,
  rs_R009_ueqv_R009NYYYY_partial_05_0180,
  rs_R009_ueqv_R009NYYYY_partial_05_0181,
  rs_R009_ueqv_R009NYYYY_partial_05_0182,
  rs_R009_ueqv_R009NYYYY_partial_05_0183,
  rs_R009_ueqv_R009NYYYY_partial_05_0184,
  rs_R009_ueqv_R009NYYYY_partial_05_0185,
  rs_R009_ueqv_R009NYYYY_partial_05_0186,
  rs_R009_ueqv_R009NYYYY_partial_05_0187,
  rs_R009_ueqv_R009NYYYY_partial_05_0188,
  rs_R009_ueqv_R009NYYYY_partial_05_0189,
  rs_R009_ueqv_R009NYYYY_partial_05_0190,
  rs_R009_ueqv_R009NYYYY_partial_05_0191,
  rs_R009_ueqv_R009NYYYY_partial_05_0192
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_05_0100_0192 : Poly :=
[
  term ((64 : Rat) / 29) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-689869972 : Rat) / 99568455) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((131008 : Rat) / 98097) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-165825104 : Rat) / 99568455) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-135424 : Rat) / 98097) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-124021568 : Rat) / 6637897) [(4, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((117760 : Rat) / 32699) [(4, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-95921332 : Rat) / 14224065) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((30912 : Rat) / 32699) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((698752672 : Rat) / 99568455) [(4, 1), (9, 1), (11, 1), (15, 4)],
  term ((-11776 : Rat) / 32699) [(4, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term (5 : Rat) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((160 : Rat) / 29) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((92 : Rat) / 29) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-137 : Rat) / 24) [(4, 1), (9, 1), (13, 1)],
  term ((-767 : Rat) / 58) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((560 : Rat) / 87) [(4, 1), (9, 1), (13, 1), (15, 4)],
  term (-10 : Rat) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((-320 : Rat) / 29) [(4, 1), (9, 1), (13, 2), (15, 3)],
  term ((-5011 : Rat) / 696) [(4, 1), (9, 1), (15, 1)],
  term ((7 : Rat) / 3) [(4, 1), (9, 1), (15, 3)],
  term ((-4092711744 : Rat) / 6637897) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((3886080 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7999391136 : Rat) / 33189485) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((1519104 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(4, 1), (10, 1), (11, 1), (15, 3)],
  term ((11776 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 6637897) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((7624800 : Rat) / 32699) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((1143720 : Rat) / 32699) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((4045158685 : Rat) / 19913691) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3749828 : Rat) / 98097) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 1144465) [(4, 1), (10, 1), (13, 1), (15, 3)],
  term ((7370640 : Rat) / 32699) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((15946032288 : Rat) / 6637897) [(4, 1), (10, 1), (13, 2), (15, 2)],
  term ((-15249600 : Rat) / 32699) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((81434816348 : Rat) / 99568455) [(4, 1), (10, 1), (15, 2)],
  term ((-15584132 : Rat) / 98097) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(4, 1), (10, 1), (15, 4)],
  term ((1143720 : Rat) / 32699) [(4, 1), (10, 1), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((11040000 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((72268598674 : Rat) / 33189485) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-13841124 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7751348 : Rat) / 4741355) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term ((10304 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-58380239122 : Rat) / 19913691) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((55952960 : Rat) / 98097) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1937837000 : Rat) / 948271) [(4, 1), (11, 1), (13, 1), (15, 4)],
  term ((12880000 : Rat) / 32699) [(4, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((23254044000 : Rat) / 6637897) [(4, 1), (11, 1), (13, 2), (15, 3)],
  term ((-22080000 : Rat) / 32699) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-315446132839 : Rat) / 199136910) [(4, 1), (11, 1), (15, 1)],
  term ((30193520 : Rat) / 98097) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((15254851336 : Rat) / 4741355) [(4, 1), (11, 1), (15, 3)],
  term ((-20347548 : Rat) / 32699) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5228544 : Rat) / 32699) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20215515584 : Rat) / 33189485) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((3838976 : Rat) / 32699) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-21455731264 : Rat) / 33189485) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((4074496 : Rat) / 32699) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((114347885696 : Rat) / 33189485) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((-21714944 : Rat) / 32699) [(4, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-55065576192 : Rat) / 33189485) [(4, 1), (11, 2), (13, 2), (15, 2)],
  term ((10457088 : Rat) / 32699) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((5999543352 : Rat) / 33189485) [(4, 1), (11, 2), (15, 2)],
  term ((-1139328 : Rat) / 32699) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-47810314464 : Rat) / 33189485) [(4, 1), (11, 2), (15, 4)],
  term ((9079296 : Rat) / 32699) [(4, 1), (11, 2), (15, 4), (16, 1)],
  term ((-992172544 : Rat) / 33189485) [(4, 1), (11, 3), (13, 1), (15, 2)],
  term ((188416 : Rat) / 32699) [(4, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-186032352 : Rat) / 33189485) [(4, 1), (11, 3), (15, 1)],
  term ((35328 : Rat) / 32699) [(4, 1), (11, 3), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(4, 1), (11, 3), (15, 3)],
  term ((-47104 : Rat) / 32699) [(4, 1), (11, 3), (15, 3), (16, 1)],
  term ((-109 : Rat) / 20) [(4, 1), (12, 1)],
  term ((29004583963 : Rat) / 9482710) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-19233532 : Rat) / 32699) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1736140985741 : Rat) / 796547640) [(4, 1), (12, 1), (15, 2)],
  term ((41429629 : Rat) / 98097) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-226539147158 : Rat) / 99568455) [(4, 1), (13, 1), (15, 1)],
  term ((43159498 : Rat) / 98097) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((954112331701 : Rat) / 132757940) [(4, 1), (13, 1), (15, 3)],
  term ((-136370894 : Rat) / 98097) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 10) [(4, 1), (13, 2)],
  term ((-28926825741 : Rat) / 4741355) [(4, 1), (13, 2), (15, 2)],
  term ((38467064 : Rat) / 32699) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((2491158132977 : Rat) / 1593095280) [(4, 1), (15, 2)],
  term ((-60109543 : Rat) / 196194) [(4, 1), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 398273820) [(4, 1), (15, 4)],
  term ((34129162 : Rat) / 98097) [(4, 1), (15, 4), (16, 1)],
  term ((-32 : Rat) / 29) [(4, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((344934986 : Rat) / 99568455) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-65504 : Rat) / 98097) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((82912552 : Rat) / 99568455) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((67712 : Rat) / 98097) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 6637897) [(4, 2), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-58880 : Rat) / 32699) [(4, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((47960666 : Rat) / 14224065) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((-15456 : Rat) / 32699) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-349376336 : Rat) / 99568455) [(4, 2), (9, 1), (11, 1), (15, 4)],
  term ((5888 : Rat) / 32699) [(4, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-5 : Rat) / 2) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-80 : Rat) / 29) [(4, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-46 : Rat) / 29) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((137 : Rat) / 48) [(4, 2), (9, 1), (13, 1)],
  term ((767 : Rat) / 116) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((-280 : Rat) / 87) [(4, 2), (9, 1), (13, 1), (15, 4)],
  term (5 : Rat) [(4, 2), (9, 1), (13, 2), (15, 1)],
  term ((160 : Rat) / 29) [(4, 2), (9, 1), (13, 2), (15, 3)],
  term ((5011 : Rat) / 1392) [(4, 2), (9, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(4, 2), (9, 1), (15, 3)],
  term ((2046355872 : Rat) / 6637897) [(4, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1943040 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3999695568 : Rat) / 33189485) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-759552 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(4, 2), (10, 1), (11, 1), (15, 3)],
  term ((-5888 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((3986508072 : Rat) / 6637897) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3812400 : Rat) / 32699) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((-571860 : Rat) / 32699) [(4, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4045158685 : Rat) / 39827382) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((1874914 : Rat) / 98097) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((664418012 : Rat) / 1144465) [(4, 2), (10, 1), (13, 1), (15, 3)],
  term ((-3685320 : Rat) / 32699) [(4, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 6637897) [(4, 2), (10, 1), (13, 2), (15, 2)],
  term ((7624800 : Rat) / 32699) [(4, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-40717408174 : Rat) / 99568455) [(4, 2), (10, 1), (15, 2)],
  term ((7792066 : Rat) / 98097) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(4, 2), (10, 1), (15, 4)],
  term ((-571860 : Rat) / 32699) [(4, 2), (10, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36134299337 : Rat) / 33189485) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((6920562 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3875674 : Rat) / 4741355) [(4, 2), (11, 1), (12, 1), (15, 3)],
  term ((-5152 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((29190119561 : Rat) / 19913691) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-27976480 : Rat) / 98097) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((968918500 : Rat) / 948271) [(4, 2), (11, 1), (13, 1), (15, 4)],
  term ((-6440000 : Rat) / 32699) [(4, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(4, 2), (11, 1), (13, 2), (15, 3)],
  term ((11040000 : Rat) / 32699) [(4, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((315446132839 : Rat) / 398273820) [(4, 2), (11, 1), (15, 1)],
  term ((-15096760 : Rat) / 98097) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7627425668 : Rat) / 4741355) [(4, 2), (11, 1), (15, 3)],
  term ((10173774 : Rat) / 32699) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(4, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(4, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10107757792 : Rat) / 33189485) [(4, 2), (11, 2), (12, 1), (15, 2)],
  term ((-1919488 : Rat) / 32699) [(4, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((10727865632 : Rat) / 33189485) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2037248 : Rat) / 32699) [(4, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-57173942848 : Rat) / 33189485) [(4, 2), (11, 2), (13, 1), (15, 3)],
  term ((10857472 : Rat) / 32699) [(4, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(4, 2), (11, 2), (13, 2), (15, 2)],
  term ((-5228544 : Rat) / 32699) [(4, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2999771676 : Rat) / 33189485) [(4, 2), (11, 2), (15, 2)],
  term ((569664 : Rat) / 32699) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((23905157232 : Rat) / 33189485) [(4, 2), (11, 2), (15, 4)],
  term ((-4539648 : Rat) / 32699) [(4, 2), (11, 2), (15, 4), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(4, 2), (11, 3), (13, 1), (15, 2)],
  term ((-94208 : Rat) / 32699) [(4, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((93016176 : Rat) / 33189485) [(4, 2), (11, 3), (15, 1)],
  term ((-17664 : Rat) / 32699) [(4, 2), (11, 3), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(4, 2), (11, 3), (15, 3)],
  term ((23552 : Rat) / 32699) [(4, 2), (11, 3), (15, 3), (16, 1)],
  term ((109 : Rat) / 40) [(4, 2), (12, 1)],
  term ((-29004583963 : Rat) / 18965420) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((9616766 : Rat) / 32699) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1736140985741 : Rat) / 1593095280) [(4, 2), (12, 1), (15, 2)],
  term ((-41429629 : Rat) / 196194) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((113269573579 : Rat) / 99568455) [(4, 2), (13, 1), (15, 1)],
  term ((-21579749 : Rat) / 98097) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-954112331701 : Rat) / 265515880) [(4, 2), (13, 1), (15, 3)],
  term ((68185447 : Rat) / 98097) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 20) [(4, 2), (13, 2)],
  term ((28926825741 : Rat) / 9482710) [(4, 2), (13, 2), (15, 2)],
  term ((-19233532 : Rat) / 32699) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2491158132977 : Rat) / 3186190560) [(4, 2), (15, 2)],
  term ((60109543 : Rat) / 392388) [(4, 2), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 796547640) [(4, 2), (15, 4)],
  term ((-17064581 : Rat) / 98097) [(4, 2), (15, 4), (16, 1)],
  term ((-32 : Rat) / 29) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((344934986 : Rat) / 99568455) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-65504 : Rat) / 98097) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((82912552 : Rat) / 99568455) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((67712 : Rat) / 98097) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 6637897) [(5, 2), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-58880 : Rat) / 32699) [(5, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((47960666 : Rat) / 14224065) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((-15456 : Rat) / 32699) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-349376336 : Rat) / 99568455) [(5, 2), (9, 1), (11, 1), (15, 4)],
  term ((5888 : Rat) / 32699) [(5, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-5 : Rat) / 2) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-80 : Rat) / 29) [(5, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-46 : Rat) / 29) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((137 : Rat) / 48) [(5, 2), (9, 1), (13, 1)],
  term ((767 : Rat) / 116) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((-280 : Rat) / 87) [(5, 2), (9, 1), (13, 1), (15, 4)],
  term (5 : Rat) [(5, 2), (9, 1), (13, 2), (15, 1)],
  term ((160 : Rat) / 29) [(5, 2), (9, 1), (13, 2), (15, 3)],
  term ((5011 : Rat) / 1392) [(5, 2), (9, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(5, 2), (9, 1), (15, 3)],
  term ((2046355872 : Rat) / 6637897) [(5, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1943040 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3999695568 : Rat) / 33189485) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-759552 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(5, 2), (10, 1), (11, 1), (15, 3)],
  term ((-5888 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((3986508072 : Rat) / 6637897) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3812400 : Rat) / 32699) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((-571860 : Rat) / 32699) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4045158685 : Rat) / 39827382) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((1874914 : Rat) / 98097) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((664418012 : Rat) / 1144465) [(5, 2), (10, 1), (13, 1), (15, 3)],
  term ((-3685320 : Rat) / 32699) [(5, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 6637897) [(5, 2), (10, 1), (13, 2), (15, 2)],
  term ((7624800 : Rat) / 32699) [(5, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-40717408174 : Rat) / 99568455) [(5, 2), (10, 1), (15, 2)],
  term ((7792066 : Rat) / 98097) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(5, 2), (10, 1), (15, 4)],
  term ((-571860 : Rat) / 32699) [(5, 2), (10, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36134299337 : Rat) / 33189485) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((6920562 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3875674 : Rat) / 4741355) [(5, 2), (11, 1), (12, 1), (15, 3)],
  term ((-5152 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((29190119561 : Rat) / 19913691) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((-27976480 : Rat) / 98097) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((968918500 : Rat) / 948271) [(5, 2), (11, 1), (13, 1), (15, 4)],
  term ((-6440000 : Rat) / 32699) [(5, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(5, 2), (11, 1), (13, 2), (15, 3)],
  term ((11040000 : Rat) / 32699) [(5, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((315446132839 : Rat) / 398273820) [(5, 2), (11, 1), (15, 1)],
  term ((-15096760 : Rat) / 98097) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7627425668 : Rat) / 4741355) [(5, 2), (11, 1), (15, 3)],
  term ((10173774 : Rat) / 32699) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(5, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(5, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10107757792 : Rat) / 33189485) [(5, 2), (11, 2), (12, 1), (15, 2)],
  term ((-1919488 : Rat) / 32699) [(5, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((10727865632 : Rat) / 33189485) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2037248 : Rat) / 32699) [(5, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-57173942848 : Rat) / 33189485) [(5, 2), (11, 2), (13, 1), (15, 3)],
  term ((10857472 : Rat) / 32699) [(5, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(5, 2), (11, 2), (13, 2), (15, 2)],
  term ((-5228544 : Rat) / 32699) [(5, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2999771676 : Rat) / 33189485) [(5, 2), (11, 2), (15, 2)],
  term ((569664 : Rat) / 32699) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((23905157232 : Rat) / 33189485) [(5, 2), (11, 2), (15, 4)],
  term ((-4539648 : Rat) / 32699) [(5, 2), (11, 2), (15, 4), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(5, 2), (11, 3), (13, 1), (15, 2)],
  term ((-94208 : Rat) / 32699) [(5, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((93016176 : Rat) / 33189485) [(5, 2), (11, 3), (15, 1)],
  term ((-17664 : Rat) / 32699) [(5, 2), (11, 3), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(5, 2), (11, 3), (15, 3)],
  term ((23552 : Rat) / 32699) [(5, 2), (11, 3), (15, 3), (16, 1)],
  term ((109 : Rat) / 40) [(5, 2), (12, 1)],
  term ((-29004583963 : Rat) / 18965420) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((9616766 : Rat) / 32699) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1736140985741 : Rat) / 1593095280) [(5, 2), (12, 1), (15, 2)],
  term ((-41429629 : Rat) / 196194) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((113269573579 : Rat) / 99568455) [(5, 2), (13, 1), (15, 1)],
  term ((-21579749 : Rat) / 98097) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-954112331701 : Rat) / 265515880) [(5, 2), (13, 1), (15, 3)],
  term ((68185447 : Rat) / 98097) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 20) [(5, 2), (13, 2)],
  term ((28926825741 : Rat) / 9482710) [(5, 2), (13, 2), (15, 2)],
  term ((-19233532 : Rat) / 32699) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2491158132977 : Rat) / 3186190560) [(5, 2), (15, 2)],
  term ((60109543 : Rat) / 392388) [(5, 2), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 796547640) [(5, 2), (15, 4)],
  term ((-17064581 : Rat) / 98097) [(5, 2), (15, 4), (16, 1)],
  term ((-64 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((32 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((32 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (15, 4)],
  term ((689869972 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-131008 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((165825104 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((135424 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-344934986 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((65504 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-82912552 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((-67712 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-344934986 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((65504 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-82912552 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 5)],
  term ((-67712 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((124021568 : Rat) / 6637897) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-117760 : Rat) / 32699) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 6637897) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2)],
  term ((58880 : Rat) / 32699) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 6637897) [(9, 1), (11, 1), (13, 2), (15, 4)],
  term ((58880 : Rat) / 32699) [(9, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((95921332 : Rat) / 14224065) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-30912 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-698752672 : Rat) / 99568455) [(9, 1), (11, 1), (14, 1), (15, 4)],
  term ((11776 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-47960666 : Rat) / 14224065) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((15456 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((349376336 : Rat) / 99568455) [(9, 1), (11, 1), (14, 2), (15, 4)],
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 4), (16, 1)],
  term ((-47960666 : Rat) / 14224065) [(9, 1), (11, 1), (15, 4)],
  term ((15456 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((349376336 : Rat) / 99568455) [(9, 1), (11, 1), (15, 6)],
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 6), (16, 1)],
  term (-5 : Rat) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-160 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((5 : Rat) / 2) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((80 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((5 : Rat) / 2) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((80 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 4)],
  term ((-92 : Rat) / 29) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((46 : Rat) / 29) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((46 : Rat) / 29) [(9, 1), (12, 1), (15, 3)],
  term ((137 : Rat) / 24) [(9, 1), (13, 1), (14, 1)],
  term ((767 : Rat) / 58) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-560 : Rat) / 87) [(9, 1), (13, 1), (14, 1), (15, 4)],
  term ((-137 : Rat) / 48) [(9, 1), (13, 1), (14, 2)],
  term ((-767 : Rat) / 116) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((280 : Rat) / 87) [(9, 1), (13, 1), (14, 2), (15, 4)],
  term ((-137 : Rat) / 48) [(9, 1), (13, 1), (15, 2)],
  term ((-767 : Rat) / 116) [(9, 1), (13, 1), (15, 4)],
  term ((280 : Rat) / 87) [(9, 1), (13, 1), (15, 6)],
  term (10 : Rat) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((320 : Rat) / 29) [(9, 1), (13, 2), (14, 1), (15, 3)],
  term (-5 : Rat) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-160 : Rat) / 29) [(9, 1), (13, 2), (14, 2), (15, 3)],
  term (-5 : Rat) [(9, 1), (13, 2), (15, 3)],
  term ((-160 : Rat) / 29) [(9, 1), (13, 2), (15, 5)],
  term ((5011 : Rat) / 696) [(9, 1), (14, 1), (15, 1)],
  term ((-7 : Rat) / 3) [(9, 1), (14, 1), (15, 3)],
  term ((-5011 : Rat) / 1392) [(9, 1), (14, 2), (15, 1)],
  term ((7 : Rat) / 6) [(9, 1), (14, 2), (15, 3)],
  term ((-5011 : Rat) / 1392) [(9, 1), (15, 3)],
  term ((7 : Rat) / 6) [(9, 1), (15, 5)],
  term ((4092711744 : Rat) / 6637897) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3886080 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2046355872 : Rat) / 6637897) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((1943040 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2046355872 : Rat) / 6637897) [(10, 1), (11, 1), (13, 1), (15, 4)],
  term ((1943040 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((7999391136 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1519104 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3999695568 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((759552 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 3)],
  term ((5888 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-3999695568 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)],
  term ((759552 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 5)],
  term ((5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 5), (16, 1)],
  term ((7973016144 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7624800 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3812400 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((3812400 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1143720 : Rat) / 32699) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((571860 : Rat) / 32699) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (12, 1), (15, 4)],
  term ((571860 : Rat) / 32699) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((-4045158685 : Rat) / 19913691) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3749828 : Rat) / 98097) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 1144465) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-7370640 : Rat) / 32699) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((4045158685 : Rat) / 39827382) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1874914 : Rat) / 98097) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-664418012 : Rat) / 1144465) [(10, 1), (13, 1), (14, 2), (15, 3)],
  term ((3685320 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((4045158685 : Rat) / 39827382) [(10, 1), (13, 1), (15, 3)],
  term ((-1874914 : Rat) / 98097) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-664418012 : Rat) / 1144465) [(10, 1), (13, 1), (15, 5)],
  term ((3685320 : Rat) / 32699) [(10, 1), (13, 1), (15, 5), (16, 1)],
  term ((-15946032288 : Rat) / 6637897) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((15249600 : Rat) / 32699) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((7973016144 : Rat) / 6637897) [(10, 1), (13, 2), (14, 2), (15, 2)],
  term ((-7624800 : Rat) / 32699) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((7973016144 : Rat) / 6637897) [(10, 1), (13, 2), (15, 4)],
  term ((-7624800 : Rat) / 32699) [(10, 1), (13, 2), (15, 4), (16, 1)],
  term ((-81434816348 : Rat) / 99568455) [(10, 1), (14, 1), (15, 2)],
  term ((15584132 : Rat) / 98097) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(10, 1), (14, 1), (15, 4)],
  term ((-1143720 : Rat) / 32699) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((40717408174 : Rat) / 99568455) [(10, 1), (14, 2), (15, 2)],
  term ((-7792066 : Rat) / 98097) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (14, 2), (15, 4)],
  term ((571860 : Rat) / 32699) [(10, 1), (14, 2), (15, 4), (16, 1)],
  term ((40717408174 : Rat) / 99568455) [(10, 1), (15, 4)],
  term ((-7792066 : Rat) / 98097) [(10, 1), (15, 4), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (15, 6)],
  term ((571860 : Rat) / 32699) [(10, 1), (15, 6), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-11040000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-72268598674 : Rat) / 33189485) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((13841124 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7751348 : Rat) / 4741355) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-10304 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((36134299337 : Rat) / 33189485) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-6920562 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3875674 : Rat) / 4741355) [(11, 1), (12, 1), (14, 2), (15, 3)],
  term ((5152 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((36134299337 : Rat) / 33189485) [(11, 1), (12, 1), (15, 3)],
  term ((-6920562 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3875674 : Rat) / 4741355) [(11, 1), (12, 1), (15, 5)],
  term ((5152 : Rat) / 32699) [(11, 1), (12, 1), (15, 5), (16, 1)],
  term ((58380239122 : Rat) / 19913691) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-55952960 : Rat) / 98097) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1937837000 : Rat) / 948271) [(11, 1), (13, 1), (14, 1), (15, 4)],
  term ((-12880000 : Rat) / 32699) [(11, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-29190119561 : Rat) / 19913691) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((27976480 : Rat) / 98097) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-968918500 : Rat) / 948271) [(11, 1), (13, 1), (14, 2), (15, 4)],
  term ((6440000 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 4), (16, 1)],
  term ((-29190119561 : Rat) / 19913691) [(11, 1), (13, 1), (15, 4)],
  term ((27976480 : Rat) / 98097) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-968918500 : Rat) / 948271) [(11, 1), (13, 1), (15, 6)],
  term ((6440000 : Rat) / 32699) [(11, 1), (13, 1), (15, 6), (16, 1)],
  term ((-23254044000 : Rat) / 6637897) [(11, 1), (13, 2), (14, 1), (15, 3)],
  term ((22080000 : Rat) / 32699) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(11, 1), (13, 2), (14, 2), (15, 3)],
  term ((-11040000 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 5)],
  term ((-11040000 : Rat) / 32699) [(11, 1), (13, 2), (15, 5), (16, 1)],
  term ((315446132839 : Rat) / 199136910) [(11, 1), (14, 1), (15, 1)],
  term ((-30193520 : Rat) / 98097) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15254851336 : Rat) / 4741355) [(11, 1), (14, 1), (15, 3)],
  term ((20347548 : Rat) / 32699) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-315446132839 : Rat) / 398273820) [(11, 1), (14, 2), (15, 1)],
  term ((15096760 : Rat) / 98097) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((7627425668 : Rat) / 4741355) [(11, 1), (14, 2), (15, 3)],
  term ((-10173774 : Rat) / 32699) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-315446132839 : Rat) / 398273820) [(11, 1), (15, 3)],
  term ((15096760 : Rat) / 98097) [(11, 1), (15, 3), (16, 1)],
  term ((7627425668 : Rat) / 4741355) [(11, 1), (15, 5)],
  term ((-10173774 : Rat) / 32699) [(11, 1), (15, 5), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5228544 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((20215515584 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-3838976 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10107757792 : Rat) / 33189485) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((1919488 : Rat) / 32699) [(11, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-10107757792 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)],
  term ((1919488 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)],
  term ((21455731264 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4074496 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114347885696 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((21714944 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10727865632 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((2037248 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((57173942848 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((-10857472 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-10727865632 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((2037248 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((57173942848 : Rat) / 33189485) [(11, 2), (13, 1), (15, 5)],
  term ((-10857472 : Rat) / 32699) [(11, 2), (13, 1), (15, 5), (16, 1)],
  term ((55065576192 : Rat) / 33189485) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((-10457088 : Rat) / 32699) [(11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(11, 2), (13, 2), (14, 2), (15, 2)],
  term ((5228544 : Rat) / 32699) [(11, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(11, 2), (13, 2), (15, 4)],
  term ((5228544 : Rat) / 32699) [(11, 2), (13, 2), (15, 4), (16, 1)],
  term ((-5999543352 : Rat) / 33189485) [(11, 2), (14, 1), (15, 2)],
  term ((1139328 : Rat) / 32699) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((47810314464 : Rat) / 33189485) [(11, 2), (14, 1), (15, 4)],
  term ((-9079296 : Rat) / 32699) [(11, 2), (14, 1), (15, 4), (16, 1)],
  term ((2999771676 : Rat) / 33189485) [(11, 2), (14, 2), (15, 2)],
  term ((-569664 : Rat) / 32699) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-23905157232 : Rat) / 33189485) [(11, 2), (14, 2), (15, 4)],
  term ((4539648 : Rat) / 32699) [(11, 2), (14, 2), (15, 4), (16, 1)],
  term ((2999771676 : Rat) / 33189485) [(11, 2), (15, 4)],
  term ((-569664 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)],
  term ((-23905157232 : Rat) / 33189485) [(11, 2), (15, 6)],
  term ((4539648 : Rat) / 32699) [(11, 2), (15, 6), (16, 1)],
  term ((992172544 : Rat) / 33189485) [(11, 3), (13, 1), (14, 1), (15, 2)],
  term ((-188416 : Rat) / 32699) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(11, 3), (13, 1), (14, 2), (15, 2)],
  term ((94208 : Rat) / 32699) [(11, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(11, 3), (13, 1), (15, 4)],
  term ((94208 : Rat) / 32699) [(11, 3), (13, 1), (15, 4), (16, 1)],
  term ((186032352 : Rat) / 33189485) [(11, 3), (14, 1), (15, 1)],
  term ((-35328 : Rat) / 32699) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(11, 3), (14, 1), (15, 3)],
  term ((47104 : Rat) / 32699) [(11, 3), (14, 1), (15, 3), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(11, 3), (14, 2), (15, 1)],
  term ((17664 : Rat) / 32699) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(11, 3), (14, 2), (15, 3)],
  term ((-23552 : Rat) / 32699) [(11, 3), (14, 2), (15, 3), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(11, 3), (15, 3)],
  term ((17664 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(11, 3), (15, 5)],
  term ((-23552 : Rat) / 32699) [(11, 3), (15, 5), (16, 1)],
  term ((-29004583963 : Rat) / 9482710) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((19233532 : Rat) / 32699) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((29004583963 : Rat) / 18965420) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-9616766 : Rat) / 32699) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((29004583963 : Rat) / 18965420) [(12, 1), (13, 1), (15, 3)],
  term ((-9616766 : Rat) / 32699) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((109 : Rat) / 20) [(12, 1), (14, 1)],
  term ((1736140985741 : Rat) / 796547640) [(12, 1), (14, 1), (15, 2)],
  term ((-41429629 : Rat) / 98097) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-109 : Rat) / 40) [(12, 1), (14, 2)],
  term ((-1736140985741 : Rat) / 1593095280) [(12, 1), (14, 2), (15, 2)],
  term ((41429629 : Rat) / 196194) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-109 : Rat) / 40) [(12, 1), (15, 2)],
  term ((-1736140985741 : Rat) / 1593095280) [(12, 1), (15, 4)],
  term ((41429629 : Rat) / 196194) [(12, 1), (15, 4), (16, 1)],
  term ((226539147158 : Rat) / 99568455) [(13, 1), (14, 1), (15, 1)],
  term ((-43159498 : Rat) / 98097) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-954112331701 : Rat) / 132757940) [(13, 1), (14, 1), (15, 3)],
  term ((136370894 : Rat) / 98097) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-113269573579 : Rat) / 99568455) [(13, 1), (14, 2), (15, 1)],
  term ((21579749 : Rat) / 98097) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((954112331701 : Rat) / 265515880) [(13, 1), (14, 2), (15, 3)],
  term ((-68185447 : Rat) / 98097) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-113269573579 : Rat) / 99568455) [(13, 1), (15, 3)],
  term ((21579749 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)],
  term ((954112331701 : Rat) / 265515880) [(13, 1), (15, 5)],
  term ((-68185447 : Rat) / 98097) [(13, 1), (15, 5), (16, 1)],
  term ((-41 : Rat) / 10) [(13, 2), (14, 1)],
  term ((28926825741 : Rat) / 4741355) [(13, 2), (14, 1), (15, 2)],
  term ((-38467064 : Rat) / 32699) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((41 : Rat) / 20) [(13, 2), (14, 2)],
  term ((-28926825741 : Rat) / 9482710) [(13, 2), (14, 2), (15, 2)],
  term ((19233532 : Rat) / 32699) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((41 : Rat) / 20) [(13, 2), (15, 2)],
  term ((-28926825741 : Rat) / 9482710) [(13, 2), (15, 4)],
  term ((19233532 : Rat) / 32699) [(13, 2), (15, 4), (16, 1)],
  term ((-2491158132977 : Rat) / 1593095280) [(14, 1), (15, 2)],
  term ((60109543 : Rat) / 196194) [(14, 1), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 398273820) [(14, 1), (15, 4)],
  term ((-34129162 : Rat) / 98097) [(14, 1), (15, 4), (16, 1)],
  term ((2491158132977 : Rat) / 3186190560) [(14, 2), (15, 2)],
  term ((-60109543 : Rat) / 392388) [(14, 2), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 796547640) [(14, 2), (15, 4)],
  term ((17064581 : Rat) / 98097) [(14, 2), (15, 4), (16, 1)],
  term ((2491158132977 : Rat) / 3186190560) [(15, 4)],
  term ((-60109543 : Rat) / 392388) [(15, 4), (16, 1)],
  term ((-713886046843 : Rat) / 796547640) [(15, 6)],
  term ((17064581 : Rat) / 98097) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 100 through 192. -/
theorem rs_R009_ueqv_R009NYYYY_block_05_0100_0192_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_05_0100_0192
      rs_R009_ueqv_R009NYYYY_block_05_0100_0192 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
