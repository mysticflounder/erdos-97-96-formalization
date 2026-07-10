/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 9:100-127

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_09_0100_0127 : Poly :=
[
  term (-2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (5, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0100 : Poly :=
[
  term ((-21980048 : Rat) / 385571) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0100 : Poly :=
[
  term ((43960096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((43960096 : Rat) / 385571) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0100_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0100
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0101 : Poly :=
[
  term ((-2359360 : Rat) / 158397) [(7, 1), (15, 1)]
]

/-- Partial product 101 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0101 : Poly :=
[
  term ((4718720 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 158397) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2359360 : Rat) / 158397) [(4, 2), (7, 1), (15, 1)],
  term ((-2359360 : Rat) / 158397) [(5, 2), (7, 1), (15, 1)],
  term ((2359360 : Rat) / 158397) [(7, 1), (12, 2), (15, 1)],
  term ((2359360 : Rat) / 158397) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0101_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0101
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0102 : Poly :=
[
  term ((10990024 : Rat) / 385571) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0102 : Poly :=
[
  term ((-21980048 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((10990024 : Rat) / 385571) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((10990024 : Rat) / 385571) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-10990024 : Rat) / 385571) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10990024 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0102_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0102
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0103 : Poly :=
[
  term ((281216 : Rat) / 52799) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 103 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0103 : Poly :=
[
  term ((-562432 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((562432 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-562432 : Rat) / 52799) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((562432 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((281216 : Rat) / 52799) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((281216 : Rat) / 52799) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((-281216 : Rat) / 52799) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-281216 : Rat) / 52799) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0103_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0103
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0104 : Poly :=
[
  term ((44665248 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0104 : Poly :=
[
  term ((-89330496 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((89330496 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-89330496 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((89330496 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((44665248 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((44665248 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-44665248 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-44665248 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0104_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0104
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0105 : Poly :=
[
  term ((-4464640 : Rat) / 158397) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 105 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0105 : Poly :=
[
  term ((8929280 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-8929280 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((8929280 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((-8929280 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4464640 : Rat) / 158397) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-4464640 : Rat) / 158397) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((4464640 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((4464640 : Rat) / 158397) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0105_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0105
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0106 : Poly :=
[
  term ((-2020544 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0106 : Poly :=
[
  term ((4041088 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4041088 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4041088 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4041088 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2020544 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2020544 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2020544 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2020544 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0106_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0106
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0107 : Poly :=
[
  term ((-2621440 : Rat) / 158397) [(8, 1), (15, 2)]
]

/-- Partial product 107 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0107 : Poly :=
[
  term ((5242880 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((-5242880 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((5242880 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((-5242880 : Rat) / 158397) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-2621440 : Rat) / 158397) [(4, 2), (8, 1), (15, 2)],
  term ((-2621440 : Rat) / 158397) [(5, 2), (8, 1), (15, 2)],
  term ((2621440 : Rat) / 158397) [(8, 1), (12, 2), (15, 2)],
  term ((2621440 : Rat) / 158397) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0107_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0107
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0108 : Poly :=
[
  term ((-628352 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0108 : Poly :=
[
  term ((1256704 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1256704 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1256704 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1256704 : Rat) / 385571) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-628352 : Rat) / 385571) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-628352 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((628352 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((628352 : Rat) / 385571) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0108_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0108
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0109 : Poly :=
[
  term ((944000 : Rat) / 158397) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 109 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0109 : Poly :=
[
  term ((-1888000 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((1888000 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1888000 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((1888000 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((944000 : Rat) / 158397) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((944000 : Rat) / 158397) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-944000 : Rat) / 158397) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-944000 : Rat) / 158397) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0109_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0109
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0110 : Poly :=
[
  term ((-39467024 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0110 : Poly :=
[
  term ((78934048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-78934048 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((78934048 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-78934048 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39467024 : Rat) / 385571) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-39467024 : Rat) / 385571) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((39467024 : Rat) / 385571) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((39467024 : Rat) / 385571) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0110_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0110
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0111 : Poly :=
[
  term ((7034720 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 111 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0111 : Poly :=
[
  term ((-14069440 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((14069440 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-14069440 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((14069440 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((7034720 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((7034720 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)],
  term ((-7034720 : Rat) / 158397) [(9, 1), (12, 2), (15, 1)],
  term ((-7034720 : Rat) / 158397) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0111_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0111
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0112 : Poly :=
[
  term ((4043596 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0112 : Poly :=
[
  term ((-8087192 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((8087192 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8087192 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((8087192 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((4043596 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((4043596 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4043596 : Rat) / 385571) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4043596 : Rat) / 385571) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0112_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0112
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0113 : Poly :=
[
  term ((1064960 : Rat) / 158397) [(9, 2), (15, 2)]
]

/-- Partial product 113 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0113 : Poly :=
[
  term ((-2129920 : Rat) / 158397) [(0, 1), (4, 1), (9, 2), (15, 2)],
  term ((2129920 : Rat) / 158397) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (5, 1), (9, 2), (15, 2)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((1064960 : Rat) / 158397) [(4, 2), (9, 2), (15, 2)],
  term ((1064960 : Rat) / 158397) [(5, 2), (9, 2), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(9, 2), (12, 2), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0113_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0113
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0114 : Poly :=
[
  term ((2156032 : Rat) / 385571) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0114 : Poly :=
[
  term ((-4312064 : Rat) / 385571) [(0, 1), (4, 1), (9, 2), (15, 2), (16, 1)],
  term ((4312064 : Rat) / 385571) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(4, 2), (9, 2), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0114_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0114
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0115 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 115 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0115 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((5181440 : Rat) / 158397) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0115_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0115
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0116 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0116 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0116_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0116
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0117 : Poly :=
[
  term ((-1884160 : Rat) / 158397) [(10, 1), (15, 2)]
]

/-- Partial product 117 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0117 : Poly :=
[
  term ((3768320 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-3768320 : Rat) / 158397) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((3768320 : Rat) / 158397) [(1, 1), (5, 1), (10, 1), (15, 2)],
  term ((-3768320 : Rat) / 158397) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1884160 : Rat) / 158397) [(4, 2), (10, 1), (15, 2)],
  term ((-1884160 : Rat) / 158397) [(5, 2), (10, 1), (15, 2)],
  term ((1884160 : Rat) / 158397) [(10, 1), (12, 2), (15, 2)],
  term ((1884160 : Rat) / 158397) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0117_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0117
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0118 : Poly :=
[
  term ((-6153920 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0118 : Poly :=
[
  term ((12307840 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12307840 : Rat) / 385571) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((12307840 : Rat) / 385571) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12307840 : Rat) / 385571) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6153920 : Rat) / 385571) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6153920 : Rat) / 385571) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((6153920 : Rat) / 385571) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((6153920 : Rat) / 385571) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0118_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0118
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0119 : Poly :=
[
  term ((6215680 : Rat) / 158397) [(11, 1), (15, 1)]
]

/-- Partial product 119 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0119 : Poly :=
[
  term ((-12431360 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((12431360 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12431360 : Rat) / 158397) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((12431360 : Rat) / 158397) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((6215680 : Rat) / 158397) [(4, 2), (11, 1), (15, 1)],
  term ((6215680 : Rat) / 158397) [(5, 2), (11, 1), (15, 1)],
  term ((-6215680 : Rat) / 158397) [(11, 1), (12, 2), (15, 1)],
  term ((-6215680 : Rat) / 158397) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0119_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0119
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0120 : Poly :=
[
  term ((301904 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0120 : Poly :=
[
  term ((-603808 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((603808 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-603808 : Rat) / 385571) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((603808 : Rat) / 385571) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((301904 : Rat) / 385571) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((301904 : Rat) / 385571) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-301904 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-301904 : Rat) / 385571) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0120_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0120
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0121 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 121 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0121 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0121_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0121
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0122 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0122 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0122_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0122
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0123 : Poly :=
[
  term ((-339440 : Rat) / 52799) [(13, 1), (15, 1)]
]

/-- Partial product 123 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0123 : Poly :=
[
  term ((678880 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(1, 1), (13, 2), (15, 1)],
  term ((-339440 : Rat) / 52799) [(4, 2), (13, 1), (15, 1)],
  term ((-339440 : Rat) / 52799) [(5, 2), (13, 1), (15, 1)],
  term ((339440 : Rat) / 52799) [(12, 2), (13, 1), (15, 1)],
  term ((339440 : Rat) / 52799) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0123_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0123
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0124 : Poly :=
[
  term ((9166302 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0124 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((9166302 : Rat) / 385571) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((9166302 : Rat) / 385571) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9166302 : Rat) / 385571) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9166302 : Rat) / 385571) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0124_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0124
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0125 : Poly :=
[
  term ((3381616 : Rat) / 158397) [(14, 1)]
]

/-- Partial product 125 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0125 : Poly :=
[
  term ((-6763232 : Rat) / 158397) [(0, 1), (4, 1), (14, 1)],
  term ((6763232 : Rat) / 158397) [(0, 1), (12, 1), (14, 1)],
  term ((-6763232 : Rat) / 158397) [(1, 1), (5, 1), (14, 1)],
  term ((6763232 : Rat) / 158397) [(1, 1), (13, 1), (14, 1)],
  term ((3381616 : Rat) / 158397) [(4, 2), (14, 1)],
  term ((3381616 : Rat) / 158397) [(5, 2), (14, 1)],
  term ((-3381616 : Rat) / 158397) [(12, 2), (14, 1)],
  term ((-3381616 : Rat) / 158397) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0125_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0125
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0126 : Poly :=
[
  term ((-721296 : Rat) / 52799) [(15, 2)]
]

/-- Partial product 126 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0126 : Poly :=
[
  term ((1442592 : Rat) / 52799) [(0, 1), (4, 1), (15, 2)],
  term ((-1442592 : Rat) / 52799) [(0, 1), (12, 1), (15, 2)],
  term ((1442592 : Rat) / 52799) [(1, 1), (5, 1), (15, 2)],
  term ((-1442592 : Rat) / 52799) [(1, 1), (13, 1), (15, 2)],
  term ((-721296 : Rat) / 52799) [(4, 2), (15, 2)],
  term ((-721296 : Rat) / 52799) [(5, 2), (15, 2)],
  term ((721296 : Rat) / 52799) [(12, 2), (15, 2)],
  term ((721296 : Rat) / 52799) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0126_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0126
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005NYN_coefficient_09_0127 : Poly :=
[
  term ((918156 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 127 for generator 9. -/
def rs_R005_ueqv_R005NYN_partial_09_0127 : Poly :=
[
  term ((-1836312 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((1836312 : Rat) / 385571) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1836312 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((1836312 : Rat) / 385571) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((918156 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((918156 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)],
  term ((-918156 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)],
  term ((-918156 : Rat) / 385571) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 9. -/
theorem rs_R005_ueqv_R005NYN_partial_09_0127_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_09_0127
        rs_R005_ueqv_R005NYN_generator_09_0100_0127 =
      rs_R005_ueqv_R005NYN_partial_09_0127 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_09_0100_0127 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_09_0100,
  rs_R005_ueqv_R005NYN_partial_09_0101,
  rs_R005_ueqv_R005NYN_partial_09_0102,
  rs_R005_ueqv_R005NYN_partial_09_0103,
  rs_R005_ueqv_R005NYN_partial_09_0104,
  rs_R005_ueqv_R005NYN_partial_09_0105,
  rs_R005_ueqv_R005NYN_partial_09_0106,
  rs_R005_ueqv_R005NYN_partial_09_0107,
  rs_R005_ueqv_R005NYN_partial_09_0108,
  rs_R005_ueqv_R005NYN_partial_09_0109,
  rs_R005_ueqv_R005NYN_partial_09_0110,
  rs_R005_ueqv_R005NYN_partial_09_0111,
  rs_R005_ueqv_R005NYN_partial_09_0112,
  rs_R005_ueqv_R005NYN_partial_09_0113,
  rs_R005_ueqv_R005NYN_partial_09_0114,
  rs_R005_ueqv_R005NYN_partial_09_0115,
  rs_R005_ueqv_R005NYN_partial_09_0116,
  rs_R005_ueqv_R005NYN_partial_09_0117,
  rs_R005_ueqv_R005NYN_partial_09_0118,
  rs_R005_ueqv_R005NYN_partial_09_0119,
  rs_R005_ueqv_R005NYN_partial_09_0120,
  rs_R005_ueqv_R005NYN_partial_09_0121,
  rs_R005_ueqv_R005NYN_partial_09_0122,
  rs_R005_ueqv_R005NYN_partial_09_0123,
  rs_R005_ueqv_R005NYN_partial_09_0124,
  rs_R005_ueqv_R005NYN_partial_09_0125,
  rs_R005_ueqv_R005NYN_partial_09_0126,
  rs_R005_ueqv_R005NYN_partial_09_0127
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_09_0100_0127 : Poly :=
[
  term ((43960096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-562432 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-89330496 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8929280 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((4041088 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5242880 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((1256704 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1888000 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((78934048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14069440 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-8087192 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (4, 1), (9, 2), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (4, 1), (9, 2), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3768320 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((12307840 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12431360 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-603808 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6763232 : Rat) / 158397) [(0, 1), (4, 1), (14, 1)],
  term ((1442592 : Rat) / 52799) [(0, 1), (4, 1), (15, 2)],
  term ((-1836312 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((562432 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((89330496 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8929280 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4041088 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5242880 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-1256704 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1888000 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-78934048 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((14069440 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((8087192 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3768320 : Rat) / 158397) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-12307840 : Rat) / 385571) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((12431360 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((603808 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6763232 : Rat) / 158397) [(0, 1), (12, 1), (14, 1)],
  term ((-1442592 : Rat) / 52799) [(0, 1), (12, 1), (15, 2)],
  term ((1836312 : Rat) / 385571) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((43960096 : Rat) / 385571) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 158397) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-562432 : Rat) / 52799) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-89330496 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8929280 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((4041088 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5242880 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((1256704 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1888000 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((78934048 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14069440 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-8087192 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (5, 1), (9, 2), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3768320 : Rat) / 158397) [(1, 1), (5, 1), (10, 1), (15, 2)],
  term ((12307840 : Rat) / 385571) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12431360 : Rat) / 158397) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-603808 : Rat) / 385571) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6763232 : Rat) / 158397) [(1, 1), (5, 1), (14, 1)],
  term ((1442592 : Rat) / 52799) [(1, 1), (5, 1), (15, 2)],
  term ((-1836312 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((562432 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((89330496 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8929280 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4041088 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5242880 : Rat) / 158397) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1256704 : Rat) / 385571) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((1888000 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-78934048 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14069440 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((8087192 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3768320 : Rat) / 158397) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-12307840 : Rat) / 385571) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((12431360 : Rat) / 158397) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((603808 : Rat) / 385571) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6763232 : Rat) / 158397) [(1, 1), (13, 1), (14, 1)],
  term ((-1442592 : Rat) / 52799) [(1, 1), (13, 1), (15, 2)],
  term ((1836312 : Rat) / 385571) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(1, 1), (13, 2), (15, 1)],
  term ((18332604 : Rat) / 385571) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 158397) [(4, 2), (7, 1), (15, 1)],
  term ((10990024 : Rat) / 385571) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((281216 : Rat) / 52799) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((44665248 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4464640 : Rat) / 158397) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2020544 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2621440 : Rat) / 158397) [(4, 2), (8, 1), (15, 2)],
  term ((-628352 : Rat) / 385571) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((944000 : Rat) / 158397) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-39467024 : Rat) / 385571) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7034720 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((4043596 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(4, 2), (9, 2), (15, 2)],
  term ((2156032 : Rat) / 385571) [(4, 2), (9, 2), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1884160 : Rat) / 158397) [(4, 2), (10, 1), (15, 2)],
  term ((-6153920 : Rat) / 385571) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((6215680 : Rat) / 158397) [(4, 2), (11, 1), (15, 1)],
  term ((301904 : Rat) / 385571) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-339440 : Rat) / 52799) [(4, 2), (13, 1), (15, 1)],
  term ((9166302 : Rat) / 385571) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((3381616 : Rat) / 158397) [(4, 2), (14, 1)],
  term ((-721296 : Rat) / 52799) [(4, 2), (15, 2)],
  term ((918156 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 158397) [(5, 2), (7, 1), (15, 1)],
  term ((10990024 : Rat) / 385571) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((281216 : Rat) / 52799) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((44665248 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4464640 : Rat) / 158397) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2020544 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2621440 : Rat) / 158397) [(5, 2), (8, 1), (15, 2)],
  term ((-628352 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((944000 : Rat) / 158397) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-39467024 : Rat) / 385571) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7034720 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)],
  term ((4043596 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(5, 2), (9, 2), (15, 2)],
  term ((2156032 : Rat) / 385571) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1884160 : Rat) / 158397) [(5, 2), (10, 1), (15, 2)],
  term ((-6153920 : Rat) / 385571) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((6215680 : Rat) / 158397) [(5, 2), (11, 1), (15, 1)],
  term ((301904 : Rat) / 385571) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-339440 : Rat) / 52799) [(5, 2), (13, 1), (15, 1)],
  term ((9166302 : Rat) / 385571) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((3381616 : Rat) / 158397) [(5, 2), (14, 1)],
  term ((-721296 : Rat) / 52799) [(5, 2), (15, 2)],
  term ((918156 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)],
  term ((21980048 : Rat) / 385571) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 158397) [(7, 1), (12, 2), (15, 1)],
  term ((-10990024 : Rat) / 385571) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 158397) [(7, 1), (13, 2), (15, 1)],
  term ((-10990024 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-281216 : Rat) / 52799) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-44665248 : Rat) / 385571) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-281216 : Rat) / 52799) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-44665248 : Rat) / 385571) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((4464640 : Rat) / 158397) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((2020544 : Rat) / 385571) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4464640 : Rat) / 158397) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((2020544 : Rat) / 385571) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2621440 : Rat) / 158397) [(8, 1), (12, 2), (15, 2)],
  term ((628352 : Rat) / 385571) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((2621440 : Rat) / 158397) [(8, 1), (13, 2), (15, 2)],
  term ((628352 : Rat) / 385571) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-944000 : Rat) / 158397) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((39467024 : Rat) / 385571) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-944000 : Rat) / 158397) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((39467024 : Rat) / 385571) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7034720 : Rat) / 158397) [(9, 1), (12, 2), (15, 1)],
  term ((-4043596 : Rat) / 385571) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7034720 : Rat) / 158397) [(9, 1), (13, 2), (15, 1)],
  term ((-4043596 : Rat) / 385571) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(9, 2), (12, 2), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(9, 2), (13, 2), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1884160 : Rat) / 158397) [(10, 1), (12, 2), (15, 2)],
  term ((6153920 : Rat) / 385571) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1884160 : Rat) / 158397) [(10, 1), (13, 2), (15, 2)],
  term ((6153920 : Rat) / 385571) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6215680 : Rat) / 158397) [(11, 1), (12, 2), (15, 1)],
  term ((-301904 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6215680 : Rat) / 158397) [(11, 1), (13, 2), (15, 1)],
  term ((-301904 : Rat) / 385571) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((339440 : Rat) / 52799) [(12, 2), (13, 1), (15, 1)],
  term ((-9166302 : Rat) / 385571) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3381616 : Rat) / 158397) [(12, 2), (14, 1)],
  term ((721296 : Rat) / 52799) [(12, 2), (15, 2)],
  term ((-918156 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)],
  term ((-3381616 : Rat) / 158397) [(13, 2), (14, 1)],
  term ((721296 : Rat) / 52799) [(13, 2), (15, 2)],
  term ((-918156 : Rat) / 385571) [(13, 2), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(13, 3), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((339440 : Rat) / 52799) [(13, 3), (15, 1)],
  term ((-9166302 : Rat) / 385571) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 100 through 127. -/
theorem rs_R005_ueqv_R005NYN_block_09_0100_0127_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_09_0100_0127
      rs_R005_ueqv_R005NYN_block_09_0100_0127 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
