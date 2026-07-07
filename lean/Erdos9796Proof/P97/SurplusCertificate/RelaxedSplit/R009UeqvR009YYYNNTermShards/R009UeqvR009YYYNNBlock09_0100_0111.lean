/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 9:100-111

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0100 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 100 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0100 : Poly :=
[
  term ((-98779986 : Rat) / 3048283) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0100_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0100
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0101 : Poly :=
[
  term ((-76543767 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 101 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0101 : Poly :=
[
  term ((153087534 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-153087534 : Rat) / 21337981) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((153087534 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-153087534 : Rat) / 21337981) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(2, 2), (13, 1), (14, 2), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((76543767 : Rat) / 21337981) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((76543767 : Rat) / 21337981) [(13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0101_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0101
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0102 : Poly :=
[
  term ((-219064770 : Rat) / 21337981) [(13, 1), (15, 1)]
]

/-- Partial product 102 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0102 : Poly :=
[
  term ((438129540 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-438129540 : Rat) / 21337981) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((438129540 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-438129540 : Rat) / 21337981) [(1, 1), (13, 2), (15, 1)],
  term ((-219064770 : Rat) / 21337981) [(2, 2), (13, 1), (15, 1)],
  term ((-219064770 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)],
  term ((219064770 : Rat) / 21337981) [(12, 2), (13, 1), (15, 1)],
  term ((219064770 : Rat) / 21337981) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0102_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0102
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0103 : Poly :=
[
  term ((-17753203 : Rat) / 85351924) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0103 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0103_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0103
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0104 : Poly :=
[
  term ((269186184 : Rat) / 21337981) [(13, 1), (15, 3)]
]

/-- Partial product 104 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0104 : Poly :=
[
  term ((-538372368 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (15, 3)],
  term ((538372368 : Rat) / 21337981) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((-538372368 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((538372368 : Rat) / 21337981) [(1, 1), (13, 2), (15, 3)],
  term ((269186184 : Rat) / 21337981) [(2, 2), (13, 1), (15, 3)],
  term ((269186184 : Rat) / 21337981) [(3, 2), (13, 1), (15, 3)],
  term ((-269186184 : Rat) / 21337981) [(12, 2), (13, 1), (15, 3)],
  term ((-269186184 : Rat) / 21337981) [(13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0104_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0104
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0105 : Poly :=
[
  term ((221907303 : Rat) / 42675962) [(14, 1)]
]

/-- Partial product 105 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0105 : Poly :=
[
  term ((-221907303 : Rat) / 21337981) [(0, 1), (2, 1), (14, 1)],
  term ((221907303 : Rat) / 21337981) [(0, 1), (12, 1), (14, 1)],
  term ((-221907303 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1)],
  term ((221907303 : Rat) / 21337981) [(1, 1), (13, 1), (14, 1)],
  term ((221907303 : Rat) / 42675962) [(2, 2), (14, 1)],
  term ((221907303 : Rat) / 42675962) [(3, 2), (14, 1)],
  term ((-221907303 : Rat) / 42675962) [(12, 2), (14, 1)],
  term ((-221907303 : Rat) / 42675962) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0105_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0105
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0106 : Poly :=
[
  term ((705555 : Rat) / 435469) [(14, 1), (15, 2)]
]

/-- Partial product 106 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0106 : Poly :=
[
  term ((-1411110 : Rat) / 435469) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((1411110 : Rat) / 435469) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1411110 : Rat) / 435469) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((1411110 : Rat) / 435469) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((705555 : Rat) / 435469) [(2, 2), (14, 1), (15, 2)],
  term ((705555 : Rat) / 435469) [(3, 2), (14, 1), (15, 2)],
  term ((-705555 : Rat) / 435469) [(12, 2), (14, 1), (15, 2)],
  term ((-705555 : Rat) / 435469) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0106_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0106
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0107 : Poly :=
[
  term ((510224265 : Rat) / 85351924) [(14, 2)]
]

/-- Partial product 107 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0107 : Poly :=
[
  term ((-510224265 : Rat) / 42675962) [(0, 1), (2, 1), (14, 2)],
  term ((510224265 : Rat) / 42675962) [(0, 1), (12, 1), (14, 2)],
  term ((-510224265 : Rat) / 42675962) [(1, 1), (3, 1), (14, 2)],
  term ((510224265 : Rat) / 42675962) [(1, 1), (13, 1), (14, 2)],
  term ((510224265 : Rat) / 85351924) [(2, 2), (14, 2)],
  term ((510224265 : Rat) / 85351924) [(3, 2), (14, 2)],
  term ((-510224265 : Rat) / 85351924) [(12, 2), (14, 2)],
  term ((-510224265 : Rat) / 85351924) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0107_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0107
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0108 : Poly :=
[
  term ((40718556 : Rat) / 3048283) [(14, 2), (15, 2)]
]

/-- Partial product 108 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0108 : Poly :=
[
  term ((-81437112 : Rat) / 3048283) [(0, 1), (2, 1), (14, 2), (15, 2)],
  term ((81437112 : Rat) / 3048283) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-81437112 : Rat) / 3048283) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((81437112 : Rat) / 3048283) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((40718556 : Rat) / 3048283) [(2, 2), (14, 2), (15, 2)],
  term ((40718556 : Rat) / 3048283) [(3, 2), (14, 2), (15, 2)],
  term ((-40718556 : Rat) / 3048283) [(12, 2), (14, 2), (15, 2)],
  term ((-40718556 : Rat) / 3048283) [(13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0108_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0108
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0109 : Poly :=
[
  term ((85024407 : Rat) / 12193132) [(15, 2)]
]

/-- Partial product 109 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0109 : Poly :=
[
  term ((-85024407 : Rat) / 6096566) [(0, 1), (2, 1), (15, 2)],
  term ((85024407 : Rat) / 6096566) [(0, 1), (12, 1), (15, 2)],
  term ((-85024407 : Rat) / 6096566) [(1, 1), (3, 1), (15, 2)],
  term ((85024407 : Rat) / 6096566) [(1, 1), (13, 1), (15, 2)],
  term ((85024407 : Rat) / 12193132) [(2, 2), (15, 2)],
  term ((85024407 : Rat) / 12193132) [(3, 2), (15, 2)],
  term ((-85024407 : Rat) / 12193132) [(12, 2), (15, 2)],
  term ((-85024407 : Rat) / 12193132) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0109_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0109
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0110 : Poly :=
[
  term ((142964775 : Rat) / 85351924) [(15, 2), (16, 1)]
]

/-- Partial product 110 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0110 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(2, 2), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(3, 2), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(12, 2), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0110_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0110
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0111 : Poly :=
[
  term ((40718556 : Rat) / 3048283) [(15, 4)]
]

/-- Partial product 111 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0111 : Poly :=
[
  term ((-81437112 : Rat) / 3048283) [(0, 1), (2, 1), (15, 4)],
  term ((81437112 : Rat) / 3048283) [(0, 1), (12, 1), (15, 4)],
  term ((-81437112 : Rat) / 3048283) [(1, 1), (3, 1), (15, 4)],
  term ((81437112 : Rat) / 3048283) [(1, 1), (13, 1), (15, 4)],
  term ((40718556 : Rat) / 3048283) [(2, 2), (15, 4)],
  term ((40718556 : Rat) / 3048283) [(3, 2), (15, 4)],
  term ((-40718556 : Rat) / 3048283) [(12, 2), (15, 4)],
  term ((-40718556 : Rat) / 3048283) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0111_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0111
        rs_R009_ueqv_R009YYYNN_generator_09_0100_0111 =
      rs_R009_ueqv_R009YYYNN_partial_09_0111 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_09_0100_0111 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_09_0100,
  rs_R009_ueqv_R009YYYNN_partial_09_0101,
  rs_R009_ueqv_R009YYYNN_partial_09_0102,
  rs_R009_ueqv_R009YYYNN_partial_09_0103,
  rs_R009_ueqv_R009YYYNN_partial_09_0104,
  rs_R009_ueqv_R009YYYNN_partial_09_0105,
  rs_R009_ueqv_R009YYYNN_partial_09_0106,
  rs_R009_ueqv_R009YYYNN_partial_09_0107,
  rs_R009_ueqv_R009YYYNN_partial_09_0108,
  rs_R009_ueqv_R009YYYNN_partial_09_0109,
  rs_R009_ueqv_R009YYYNN_partial_09_0110,
  rs_R009_ueqv_R009YYYNN_partial_09_0111
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_09_0100_0111 : Poly :=
[
  term ((-98779986 : Rat) / 3048283) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((153087534 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (14, 2), (15, 1)],
  term ((438129540 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((17753203 : Rat) / 42675962) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-538372368 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (15, 3)],
  term ((-221907303 : Rat) / 21337981) [(0, 1), (2, 1), (14, 1)],
  term ((-1411110 : Rat) / 435469) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-510224265 : Rat) / 42675962) [(0, 1), (2, 1), (14, 2)],
  term ((-81437112 : Rat) / 3048283) [(0, 1), (2, 1), (14, 2), (15, 2)],
  term ((-85024407 : Rat) / 6096566) [(0, 1), (2, 1), (15, 2)],
  term ((-142964775 : Rat) / 42675962) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-81437112 : Rat) / 3048283) [(0, 1), (2, 1), (15, 4)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-153087534 : Rat) / 21337981) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-438129540 : Rat) / 21337981) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17753203 : Rat) / 42675962) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((538372368 : Rat) / 21337981) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((221907303 : Rat) / 21337981) [(0, 1), (12, 1), (14, 1)],
  term ((1411110 : Rat) / 435469) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((510224265 : Rat) / 42675962) [(0, 1), (12, 1), (14, 2)],
  term ((81437112 : Rat) / 3048283) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((85024407 : Rat) / 6096566) [(0, 1), (12, 1), (15, 2)],
  term ((142964775 : Rat) / 42675962) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((81437112 : Rat) / 3048283) [(0, 1), (12, 1), (15, 4)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((153087534 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((438129540 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((17753203 : Rat) / 42675962) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-538372368 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-221907303 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1)],
  term ((-1411110 : Rat) / 435469) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-510224265 : Rat) / 42675962) [(1, 1), (3, 1), (14, 2)],
  term ((-81437112 : Rat) / 3048283) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-85024407 : Rat) / 6096566) [(1, 1), (3, 1), (15, 2)],
  term ((-142964775 : Rat) / 42675962) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-81437112 : Rat) / 3048283) [(1, 1), (3, 1), (15, 4)],
  term ((221907303 : Rat) / 21337981) [(1, 1), (13, 1), (14, 1)],
  term ((1411110 : Rat) / 435469) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((510224265 : Rat) / 42675962) [(1, 1), (13, 1), (14, 2)],
  term ((81437112 : Rat) / 3048283) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((85024407 : Rat) / 6096566) [(1, 1), (13, 1), (15, 2)],
  term ((142964775 : Rat) / 42675962) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((81437112 : Rat) / 3048283) [(1, 1), (13, 1), (15, 4)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-153087534 : Rat) / 21337981) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-438129540 : Rat) / 21337981) [(1, 1), (13, 2), (15, 1)],
  term ((-17753203 : Rat) / 42675962) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((538372368 : Rat) / 21337981) [(1, 1), (13, 2), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(2, 2), (13, 1), (14, 2), (15, 1)],
  term ((-219064770 : Rat) / 21337981) [(2, 2), (13, 1), (15, 1)],
  term ((-17753203 : Rat) / 85351924) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((269186184 : Rat) / 21337981) [(2, 2), (13, 1), (15, 3)],
  term ((221907303 : Rat) / 42675962) [(2, 2), (14, 1)],
  term ((705555 : Rat) / 435469) [(2, 2), (14, 1), (15, 2)],
  term ((510224265 : Rat) / 85351924) [(2, 2), (14, 2)],
  term ((40718556 : Rat) / 3048283) [(2, 2), (14, 2), (15, 2)],
  term ((85024407 : Rat) / 12193132) [(2, 2), (15, 2)],
  term ((142964775 : Rat) / 85351924) [(2, 2), (15, 2), (16, 1)],
  term ((40718556 : Rat) / 3048283) [(2, 2), (15, 4)],
  term ((49389993 : Rat) / 3048283) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((-219064770 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)],
  term ((-17753203 : Rat) / 85351924) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((269186184 : Rat) / 21337981) [(3, 2), (13, 1), (15, 3)],
  term ((221907303 : Rat) / 42675962) [(3, 2), (14, 1)],
  term ((705555 : Rat) / 435469) [(3, 2), (14, 1), (15, 2)],
  term ((510224265 : Rat) / 85351924) [(3, 2), (14, 2)],
  term ((40718556 : Rat) / 3048283) [(3, 2), (14, 2), (15, 2)],
  term ((85024407 : Rat) / 12193132) [(3, 2), (15, 2)],
  term ((142964775 : Rat) / 85351924) [(3, 2), (15, 2), (16, 1)],
  term ((40718556 : Rat) / 3048283) [(3, 2), (15, 4)],
  term ((-49389993 : Rat) / 3048283) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((76543767 : Rat) / 21337981) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((219064770 : Rat) / 21337981) [(12, 2), (13, 1), (15, 1)],
  term ((17753203 : Rat) / 85351924) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-269186184 : Rat) / 21337981) [(12, 2), (13, 1), (15, 3)],
  term ((-221907303 : Rat) / 42675962) [(12, 2), (14, 1)],
  term ((-705555 : Rat) / 435469) [(12, 2), (14, 1), (15, 2)],
  term ((-510224265 : Rat) / 85351924) [(12, 2), (14, 2)],
  term ((-40718556 : Rat) / 3048283) [(12, 2), (14, 2), (15, 2)],
  term ((-85024407 : Rat) / 12193132) [(12, 2), (15, 2)],
  term ((-142964775 : Rat) / 85351924) [(12, 2), (15, 2), (16, 1)],
  term ((-40718556 : Rat) / 3048283) [(12, 2), (15, 4)],
  term ((-221907303 : Rat) / 42675962) [(13, 2), (14, 1)],
  term ((-705555 : Rat) / 435469) [(13, 2), (14, 1), (15, 2)],
  term ((-510224265 : Rat) / 85351924) [(13, 2), (14, 2)],
  term ((-40718556 : Rat) / 3048283) [(13, 2), (14, 2), (15, 2)],
  term ((-85024407 : Rat) / 12193132) [(13, 2), (15, 2)],
  term ((-142964775 : Rat) / 85351924) [(13, 2), (15, 2), (16, 1)],
  term ((-40718556 : Rat) / 3048283) [(13, 2), (15, 4)],
  term ((-49389993 : Rat) / 3048283) [(13, 3), (14, 1), (15, 1)],
  term ((76543767 : Rat) / 21337981) [(13, 3), (14, 2), (15, 1)],
  term ((219064770 : Rat) / 21337981) [(13, 3), (15, 1)],
  term ((17753203 : Rat) / 85351924) [(13, 3), (15, 1), (16, 1)],
  term ((-269186184 : Rat) / 21337981) [(13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 100 through 111. -/
theorem rs_R009_ueqv_R009YYYNN_block_09_0100_0111_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_09_0100_0111
      rs_R009_ueqv_R009YYYNN_block_09_0100_0111 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
