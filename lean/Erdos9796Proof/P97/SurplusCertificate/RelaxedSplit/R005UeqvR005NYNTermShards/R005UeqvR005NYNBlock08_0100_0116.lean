/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 8:100-116

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_08_0100_0116 : Poly :=
[
  term (-2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(0, 1), (10, 1)],
  term (-2 : Rat) [(1, 1), (5, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0100 : Poly :=
[
  term ((2020544 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0100 : Poly :=
[
  term ((-4041088 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4041088 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4041088 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4041088 : Rat) / 385571) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((2020544 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2020544 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2020544 : Rat) / 385571) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2020544 : Rat) / 385571) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0100_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0100
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0101 : Poly :=
[
  term ((1556480 : Rat) / 158397) [(8, 1), (15, 2)]
]

/-- Partial product 101 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0101 : Poly :=
[
  term ((-3112960 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((3112960 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-3112960 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((3112960 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((1556480 : Rat) / 158397) [(4, 2), (8, 1), (15, 2)],
  term ((1556480 : Rat) / 158397) [(5, 2), (8, 1), (15, 2)],
  term ((-1556480 : Rat) / 158397) [(8, 1), (10, 2), (15, 2)],
  term ((-1556480 : Rat) / 158397) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0101_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0101
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0102 : Poly :=
[
  term ((-1527680 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0102 : Poly :=
[
  term ((3055360 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3055360 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((3055360 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3055360 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((1527680 : Rat) / 385571) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((1527680 : Rat) / 385571) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0102_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0102
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0103 : Poly :=
[
  term ((-944000 : Rat) / 158397) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 103 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0103 : Poly :=
[
  term ((1888000 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1888000 : Rat) / 158397) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((1888000 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1888000 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-944000 : Rat) / 158397) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-944000 : Rat) / 158397) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((944000 : Rat) / 158397) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((944000 : Rat) / 158397) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0103_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0103
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0104 : Poly :=
[
  term ((39467024 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0104 : Poly :=
[
  term ((-78934048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((78934048 : Rat) / 385571) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-78934048 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((78934048 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((39467024 : Rat) / 385571) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((39467024 : Rat) / 385571) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-39467024 : Rat) / 385571) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-39467024 : Rat) / 385571) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0104_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0104
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0105 : Poly :=
[
  term ((-12134912 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 105 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0105 : Poly :=
[
  term ((24269824 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-24269824 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((24269824 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-24269824 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12134912 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((-12134912 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)],
  term ((12134912 : Rat) / 158397) [(9, 1), (10, 2), (15, 1)],
  term ((12134912 : Rat) / 158397) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0105_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0105
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0106 : Poly :=
[
  term ((-14800360 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0106 : Poly :=
[
  term ((29600720 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-29600720 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((29600720 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-29600720 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14800360 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-14800360 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((14800360 : Rat) / 385571) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((14800360 : Rat) / 385571) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0106_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0106
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0107 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(9, 2), (15, 2)]
]

/-- Partial product 107 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0107 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(0, 1), (4, 1), (9, 2), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (9, 2), (10, 1), (15, 2)],
  term ((2129920 : Rat) / 158397) [(1, 1), (5, 1), (9, 2), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(4, 2), (9, 2), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(5, 2), (9, 2), (15, 2)],
  term ((1064960 : Rat) / 158397) [(9, 2), (10, 2), (15, 2)],
  term ((1064960 : Rat) / 158397) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0107_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0107
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0108 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0108 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(0, 1), (4, 1), (9, 2), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((4312064 : Rat) / 385571) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(4, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0108_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0108
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0109 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 109 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0109 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((5181440 : Rat) / 158397) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(10, 1), (11, 3), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0109_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0109
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0110 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0110 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0110_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0110
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0111 : Poly :=
[
  term ((1884160 : Rat) / 158397) [(10, 1), (15, 2)]
]

/-- Partial product 111 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0111 : Poly :=
[
  term ((-3768320 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((3768320 : Rat) / 158397) [(0, 1), (10, 2), (15, 2)],
  term ((-3768320 : Rat) / 158397) [(1, 1), (5, 1), (10, 1), (15, 2)],
  term ((3768320 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((1884160 : Rat) / 158397) [(4, 2), (10, 1), (15, 2)],
  term ((1884160 : Rat) / 158397) [(5, 2), (10, 1), (15, 2)],
  term ((-1884160 : Rat) / 158397) [(10, 1), (11, 2), (15, 2)],
  term ((-1884160 : Rat) / 158397) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0111_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0111
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0112 : Poly :=
[
  term ((6153920 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0112 : Poly :=
[
  term ((-12307840 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((12307840 : Rat) / 385571) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-12307840 : Rat) / 385571) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((12307840 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((6153920 : Rat) / 385571) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((6153920 : Rat) / 385571) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6153920 : Rat) / 385571) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-6153920 : Rat) / 385571) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0112_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0112
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0113 : Poly :=
[
  term ((-6215680 : Rat) / 158397) [(11, 1), (15, 1)]
]

/-- Partial product 113 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0113 : Poly :=
[
  term ((12431360 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-12431360 : Rat) / 158397) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((12431360 : Rat) / 158397) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-12431360 : Rat) / 158397) [(1, 1), (11, 2), (15, 1)],
  term ((-6215680 : Rat) / 158397) [(4, 2), (11, 1), (15, 1)],
  term ((-6215680 : Rat) / 158397) [(5, 2), (11, 1), (15, 1)],
  term ((6215680 : Rat) / 158397) [(10, 2), (11, 1), (15, 1)],
  term ((6215680 : Rat) / 158397) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0113_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0113
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0114 : Poly :=
[
  term ((-301904 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0114 : Poly :=
[
  term ((603808 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-603808 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((603808 : Rat) / 385571) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-603808 : Rat) / 385571) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-301904 : Rat) / 385571) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-301904 : Rat) / 385571) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((301904 : Rat) / 385571) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((301904 : Rat) / 385571) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0114_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0114
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0115 : Poly :=
[
  term ((2254160 : Rat) / 158397) [(15, 2)]
]

/-- Partial product 115 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0115 : Poly :=
[
  term ((-4508320 : Rat) / 158397) [(0, 1), (4, 1), (15, 2)],
  term ((4508320 : Rat) / 158397) [(0, 1), (10, 1), (15, 2)],
  term ((-4508320 : Rat) / 158397) [(1, 1), (5, 1), (15, 2)],
  term ((4508320 : Rat) / 158397) [(1, 1), (11, 1), (15, 2)],
  term ((2254160 : Rat) / 158397) [(4, 2), (15, 2)],
  term ((2254160 : Rat) / 158397) [(5, 2), (15, 2)],
  term ((-2254160 : Rat) / 158397) [(10, 2), (15, 2)],
  term ((-2254160 : Rat) / 158397) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0115_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0115
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NYN_coefficient_08_0116 : Poly :=
[
  term ((-12488456 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 116 for generator 8. -/
def rs_R005_ueqv_R005NYN_partial_08_0116 : Poly :=
[
  term ((24976912 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-24976912 : Rat) / 385571) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((24976912 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-24976912 : Rat) / 385571) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12488456 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((-12488456 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)],
  term ((12488456 : Rat) / 385571) [(10, 2), (15, 2), (16, 1)],
  term ((12488456 : Rat) / 385571) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 8. -/
theorem rs_R005_ueqv_R005NYN_partial_08_0116_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_08_0116
        rs_R005_ueqv_R005NYN_generator_08_0100_0116 =
      rs_R005_ueqv_R005NYN_partial_08_0116 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_08_0100_0116 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_08_0100,
  rs_R005_ueqv_R005NYN_partial_08_0101,
  rs_R005_ueqv_R005NYN_partial_08_0102,
  rs_R005_ueqv_R005NYN_partial_08_0103,
  rs_R005_ueqv_R005NYN_partial_08_0104,
  rs_R005_ueqv_R005NYN_partial_08_0105,
  rs_R005_ueqv_R005NYN_partial_08_0106,
  rs_R005_ueqv_R005NYN_partial_08_0107,
  rs_R005_ueqv_R005NYN_partial_08_0108,
  rs_R005_ueqv_R005NYN_partial_08_0109,
  rs_R005_ueqv_R005NYN_partial_08_0110,
  rs_R005_ueqv_R005NYN_partial_08_0111,
  rs_R005_ueqv_R005NYN_partial_08_0112,
  rs_R005_ueqv_R005NYN_partial_08_0113,
  rs_R005_ueqv_R005NYN_partial_08_0114,
  rs_R005_ueqv_R005NYN_partial_08_0115,
  rs_R005_ueqv_R005NYN_partial_08_0116
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_08_0100_0116 : Poly :=
[
  term ((-4041088 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((3055360 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((1888000 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-78934048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((24269824 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((29600720 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (4, 1), (9, 2), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 1), (4, 1), (9, 2), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3768320 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-12307840 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((12431360 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((603808 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4508320 : Rat) / 158397) [(0, 1), (4, 1), (15, 2)],
  term ((24976912 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((4041088 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-3055360 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-24269824 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-29600720 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1888000 : Rat) / 158397) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((78934048 : Rat) / 385571) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (9, 2), (10, 1), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-12431360 : Rat) / 158397) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-603808 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4508320 : Rat) / 158397) [(0, 1), (10, 1), (15, 2)],
  term ((-24976912 : Rat) / 385571) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((3768320 : Rat) / 158397) [(0, 1), (10, 2), (15, 2)],
  term ((12307840 : Rat) / 385571) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-4041088 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((3055360 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((1888000 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-78934048 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((24269824 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((29600720 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(1, 1), (5, 1), (9, 2), (15, 2)],
  term ((4312064 : Rat) / 385571) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3768320 : Rat) / 158397) [(1, 1), (5, 1), (10, 1), (15, 2)],
  term ((-12307840 : Rat) / 385571) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((12431360 : Rat) / 158397) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((603808 : Rat) / 385571) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4508320 : Rat) / 158397) [(1, 1), (5, 1), (15, 2)],
  term ((24976912 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-3055360 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((4041088 : Rat) / 385571) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1888000 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((78934048 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24269824 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-29600720 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((3768320 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((12307840 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((4508320 : Rat) / 158397) [(1, 1), (11, 1), (15, 2)],
  term ((-24976912 : Rat) / 385571) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12431360 : Rat) / 158397) [(1, 1), (11, 2), (15, 1)],
  term ((-603808 : Rat) / 385571) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((2020544 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 158397) [(4, 2), (8, 1), (15, 2)],
  term ((-1527680 : Rat) / 385571) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-944000 : Rat) / 158397) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((39467024 : Rat) / 385571) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12134912 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((-14800360 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(4, 2), (9, 2), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(4, 2), (9, 2), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1884160 : Rat) / 158397) [(4, 2), (10, 1), (15, 2)],
  term ((6153920 : Rat) / 385571) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6215680 : Rat) / 158397) [(4, 2), (11, 1), (15, 1)],
  term ((-301904 : Rat) / 385571) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((2254160 : Rat) / 158397) [(4, 2), (15, 2)],
  term ((-12488456 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((2020544 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 158397) [(5, 2), (8, 1), (15, 2)],
  term ((-1527680 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-944000 : Rat) / 158397) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((39467024 : Rat) / 385571) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12134912 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)],
  term ((-14800360 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(5, 2), (9, 2), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1884160 : Rat) / 158397) [(5, 2), (10, 1), (15, 2)],
  term ((6153920 : Rat) / 385571) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6215680 : Rat) / 158397) [(5, 2), (11, 1), (15, 1)],
  term ((-301904 : Rat) / 385571) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((2254160 : Rat) / 158397) [(5, 2), (15, 2)],
  term ((-12488456 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)],
  term ((-2020544 : Rat) / 385571) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(8, 1), (10, 2), (15, 2)],
  term ((1527680 : Rat) / 385571) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(8, 1), (11, 2), (15, 2)],
  term ((1527680 : Rat) / 385571) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2020544 : Rat) / 385571) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((944000 : Rat) / 158397) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-39467024 : Rat) / 385571) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((12134912 : Rat) / 158397) [(9, 1), (10, 2), (15, 1)],
  term ((14800360 : Rat) / 385571) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((944000 : Rat) / 158397) [(9, 1), (10, 3), (15, 1)],
  term ((-39467024 : Rat) / 385571) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((12134912 : Rat) / 158397) [(9, 1), (11, 2), (15, 1)],
  term ((14800360 : Rat) / 385571) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(9, 2), (10, 2), (15, 2)],
  term ((2156032 : Rat) / 385571) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(9, 2), (11, 2), (15, 2)],
  term ((2156032 : Rat) / 385571) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-1884160 : Rat) / 158397) [(10, 1), (11, 2), (15, 2)],
  term ((-6153920 : Rat) / 385571) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(10, 1), (11, 3), (15, 1)],
  term ((21092000 : Rat) / 385571) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((6215680 : Rat) / 158397) [(10, 2), (11, 1), (15, 1)],
  term ((301904 : Rat) / 385571) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2254160 : Rat) / 158397) [(10, 2), (15, 2)],
  term ((12488456 : Rat) / 385571) [(10, 2), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(10, 3), (11, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1884160 : Rat) / 158397) [(10, 3), (15, 2)],
  term ((-6153920 : Rat) / 385571) [(10, 3), (15, 2), (16, 1)],
  term ((-2254160 : Rat) / 158397) [(11, 2), (15, 2)],
  term ((12488456 : Rat) / 385571) [(11, 2), (15, 2), (16, 1)],
  term ((6215680 : Rat) / 158397) [(11, 3), (15, 1)],
  term ((301904 : Rat) / 385571) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 100 through 116. -/
theorem rs_R005_ueqv_R005NYN_block_08_0100_0116_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_08_0100_0116
      rs_R005_ueqv_R005NYN_block_08_0100_0116 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
