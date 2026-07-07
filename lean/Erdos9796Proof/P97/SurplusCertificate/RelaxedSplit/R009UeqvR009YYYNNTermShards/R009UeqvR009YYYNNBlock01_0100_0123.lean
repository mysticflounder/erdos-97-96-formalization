/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 1:100-123

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 1 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0100 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 100 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0100 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0100_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0100
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0101 : Poly :=
[
  term ((-643048041 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 101 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0101 : Poly :=
[
  term ((-643048041 : Rat) / 21337981) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-643048041 : Rat) / 21337981) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((643048041 : Rat) / 21337981) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((643048041 : Rat) / 21337981) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0101_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0101
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0102 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0102 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0102_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0102
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0103 : Poly :=
[
  term ((17769393 : Rat) / 3048283) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 103 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0103 : Poly :=
[
  term ((17769393 : Rat) / 3048283) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((17769393 : Rat) / 3048283) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((-17769393 : Rat) / 3048283) [(8, 2), (9, 1), (14, 2), (15, 1)],
  term ((-17769393 : Rat) / 3048283) [(9, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0103_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0103
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0104 : Poly :=
[
  term ((783023343 : Rat) / 42675962) [(9, 1), (15, 1)]
]

/-- Partial product 104 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0104 : Poly :=
[
  term ((783023343 : Rat) / 42675962) [(0, 2), (9, 1), (15, 1)],
  term ((783023343 : Rat) / 42675962) [(1, 2), (9, 1), (15, 1)],
  term ((-783023343 : Rat) / 42675962) [(8, 2), (9, 1), (15, 1)],
  term ((-783023343 : Rat) / 42675962) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0104_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0104
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0105 : Poly :=
[
  term ((-135197442 : Rat) / 21337981) [(9, 2)]
]

/-- Partial product 105 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0105 : Poly :=
[
  term ((-135197442 : Rat) / 21337981) [(0, 2), (9, 2)],
  term ((-135197442 : Rat) / 21337981) [(1, 2), (9, 2)],
  term ((135197442 : Rat) / 21337981) [(8, 2), (9, 2)],
  term ((135197442 : Rat) / 21337981) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0105_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0105
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0106 : Poly :=
[
  term ((-348102729 : Rat) / 42675962) [(10, 1)]
]

/-- Partial product 106 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0106 : Poly :=
[
  term ((-348102729 : Rat) / 42675962) [(0, 2), (10, 1)],
  term ((-348102729 : Rat) / 42675962) [(1, 2), (10, 1)],
  term ((348102729 : Rat) / 42675962) [(8, 2), (10, 1)],
  term ((348102729 : Rat) / 42675962) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0106_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0106
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0107 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 107 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0107 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0107_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0107
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0108 : Poly :=
[
  term ((-399196080 : Rat) / 21337981) [(10, 1), (15, 2)]
]

/-- Partial product 108 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0108 : Poly :=
[
  term ((-399196080 : Rat) / 21337981) [(0, 2), (10, 1), (15, 2)],
  term ((-399196080 : Rat) / 21337981) [(1, 2), (10, 1), (15, 2)],
  term ((399196080 : Rat) / 21337981) [(8, 2), (10, 1), (15, 2)],
  term ((399196080 : Rat) / 21337981) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0108_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0108
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0109 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 109 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0109 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0109_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0109
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0110 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 110 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0110 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(9, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0110_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0110
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0111 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(11, 1), (15, 3)]
]

/-- Partial product 111 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0111 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(0, 2), (11, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(1, 2), (11, 1), (15, 3)],
  term ((-49389993 : Rat) / 3048283) [(8, 2), (11, 1), (15, 3)],
  term ((-49389993 : Rat) / 3048283) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0111_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0111
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0112 : Poly :=
[
  term ((333551016 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 112 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0112 : Poly :=
[
  term ((333551016 : Rat) / 21337981) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((333551016 : Rat) / 21337981) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-333551016 : Rat) / 21337981) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-333551016 : Rat) / 21337981) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0112_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0112
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0113 : Poly :=
[
  term ((76543767 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 113 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0113 : Poly :=
[
  term ((76543767 : Rat) / 21337981) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((76543767 : Rat) / 21337981) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(9, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0113_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0113
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0114 : Poly :=
[
  term ((-76336443 : Rat) / 21337981) [(13, 1), (15, 1)]
]

/-- Partial product 114 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0114 : Poly :=
[
  term ((-76336443 : Rat) / 21337981) [(0, 2), (13, 1), (15, 1)],
  term ((-76336443 : Rat) / 21337981) [(1, 2), (13, 1), (15, 1)],
  term ((76336443 : Rat) / 21337981) [(8, 2), (13, 1), (15, 1)],
  term ((76336443 : Rat) / 21337981) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0114_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0114
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0115 : Poly :=
[
  term ((-17753203 : Rat) / 85351924) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0115 : Poly :=
[
  term ((-17753203 : Rat) / 85351924) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0115_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0115
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0116 : Poly :=
[
  term ((-269186184 : Rat) / 21337981) [(13, 1), (15, 3)]
]

/-- Partial product 116 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0116 : Poly :=
[
  term ((-269186184 : Rat) / 21337981) [(0, 2), (13, 1), (15, 3)],
  term ((-269186184 : Rat) / 21337981) [(1, 2), (13, 1), (15, 3)],
  term ((269186184 : Rat) / 21337981) [(8, 2), (13, 1), (15, 3)],
  term ((269186184 : Rat) / 21337981) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0116_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0116
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0117 : Poly :=
[
  term ((615349683 : Rat) / 85351924) [(14, 1)]
]

/-- Partial product 117 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0117 : Poly :=
[
  term ((615349683 : Rat) / 85351924) [(0, 2), (14, 1)],
  term ((615349683 : Rat) / 85351924) [(1, 2), (14, 1)],
  term ((-615349683 : Rat) / 85351924) [(8, 2), (14, 1)],
  term ((-615349683 : Rat) / 85351924) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0117_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0117
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0118 : Poly :=
[
  term ((-15810300 : Rat) / 3048283) [(14, 1), (15, 2)]
]

/-- Partial product 118 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0118 : Poly :=
[
  term ((-15810300 : Rat) / 3048283) [(0, 2), (14, 1), (15, 2)],
  term ((-15810300 : Rat) / 3048283) [(1, 2), (14, 1), (15, 2)],
  term ((15810300 : Rat) / 3048283) [(8, 2), (14, 1), (15, 2)],
  term ((15810300 : Rat) / 3048283) [(9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0118_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0118
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0119 : Poly :=
[
  term ((-342524349 : Rat) / 85351924) [(14, 2)]
]

/-- Partial product 119 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0119 : Poly :=
[
  term ((-342524349 : Rat) / 85351924) [(0, 2), (14, 2)],
  term ((-342524349 : Rat) / 85351924) [(1, 2), (14, 2)],
  term ((342524349 : Rat) / 85351924) [(8, 2), (14, 2)],
  term ((342524349 : Rat) / 85351924) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0119_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0119
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0120 : Poly :=
[
  term ((-40718556 : Rat) / 3048283) [(14, 2), (15, 2)]
]

/-- Partial product 120 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0120 : Poly :=
[
  term ((-40718556 : Rat) / 3048283) [(0, 2), (14, 2), (15, 2)],
  term ((-40718556 : Rat) / 3048283) [(1, 2), (14, 2), (15, 2)],
  term ((40718556 : Rat) / 3048283) [(8, 2), (14, 2), (15, 2)],
  term ((40718556 : Rat) / 3048283) [(9, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0120_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0120
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0121 : Poly :=
[
  term ((387365709 : Rat) / 85351924) [(15, 2)]
]

/-- Partial product 121 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0121 : Poly :=
[
  term ((387365709 : Rat) / 85351924) [(0, 2), (15, 2)],
  term ((387365709 : Rat) / 85351924) [(1, 2), (15, 2)],
  term ((-387365709 : Rat) / 85351924) [(8, 2), (15, 2)],
  term ((-387365709 : Rat) / 85351924) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0121_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0121
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0122 : Poly :=
[
  term ((142964775 : Rat) / 85351924) [(15, 2), (16, 1)]
]

/-- Partial product 122 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0122 : Poly :=
[
  term ((142964775 : Rat) / 85351924) [(0, 2), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(1, 2), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(8, 2), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0122_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0122
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YYYNN_coefficient_01_0123 : Poly :=
[
  term ((-40718556 : Rat) / 3048283) [(15, 4)]
]

/-- Partial product 123 for generator 1. -/
def rs_R009_ueqv_R009YYYNN_partial_01_0123 : Poly :=
[
  term ((-40718556 : Rat) / 3048283) [(0, 2), (15, 4)],
  term ((-40718556 : Rat) / 3048283) [(1, 2), (15, 4)],
  term ((40718556 : Rat) / 3048283) [(8, 2), (15, 4)],
  term ((40718556 : Rat) / 3048283) [(9, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 1. -/
theorem rs_R009_ueqv_R009YYYNN_partial_01_0123_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_01_0123
        rs_R009_ueqv_R009YYYNN_generator_01_0100_0123 =
      rs_R009_ueqv_R009YYYNN_partial_01_0123 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_01_0100_0123 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_01_0100,
  rs_R009_ueqv_R009YYYNN_partial_01_0101,
  rs_R009_ueqv_R009YYYNN_partial_01_0102,
  rs_R009_ueqv_R009YYYNN_partial_01_0103,
  rs_R009_ueqv_R009YYYNN_partial_01_0104,
  rs_R009_ueqv_R009YYYNN_partial_01_0105,
  rs_R009_ueqv_R009YYYNN_partial_01_0106,
  rs_R009_ueqv_R009YYYNN_partial_01_0107,
  rs_R009_ueqv_R009YYYNN_partial_01_0108,
  rs_R009_ueqv_R009YYYNN_partial_01_0109,
  rs_R009_ueqv_R009YYYNN_partial_01_0110,
  rs_R009_ueqv_R009YYYNN_partial_01_0111,
  rs_R009_ueqv_R009YYYNN_partial_01_0112,
  rs_R009_ueqv_R009YYYNN_partial_01_0113,
  rs_R009_ueqv_R009YYYNN_partial_01_0114,
  rs_R009_ueqv_R009YYYNN_partial_01_0115,
  rs_R009_ueqv_R009YYYNN_partial_01_0116,
  rs_R009_ueqv_R009YYYNN_partial_01_0117,
  rs_R009_ueqv_R009YYYNN_partial_01_0118,
  rs_R009_ueqv_R009YYYNN_partial_01_0119,
  rs_R009_ueqv_R009YYYNN_partial_01_0120,
  rs_R009_ueqv_R009YYYNN_partial_01_0121,
  rs_R009_ueqv_R009YYYNN_partial_01_0122,
  rs_R009_ueqv_R009YYYNN_partial_01_0123
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_01_0100_0123 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-643048041 : Rat) / 21337981) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((17769393 : Rat) / 3048283) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((783023343 : Rat) / 42675962) [(0, 2), (9, 1), (15, 1)],
  term ((-135197442 : Rat) / 21337981) [(0, 2), (9, 2)],
  term ((-348102729 : Rat) / 42675962) [(0, 2), (10, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-399196080 : Rat) / 21337981) [(0, 2), (10, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(0, 2), (11, 1), (15, 3)],
  term ((333551016 : Rat) / 21337981) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((76543767 : Rat) / 21337981) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-76336443 : Rat) / 21337981) [(0, 2), (13, 1), (15, 1)],
  term ((-17753203 : Rat) / 85351924) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-269186184 : Rat) / 21337981) [(0, 2), (13, 1), (15, 3)],
  term ((615349683 : Rat) / 85351924) [(0, 2), (14, 1)],
  term ((-15810300 : Rat) / 3048283) [(0, 2), (14, 1), (15, 2)],
  term ((-342524349 : Rat) / 85351924) [(0, 2), (14, 2)],
  term ((-40718556 : Rat) / 3048283) [(0, 2), (14, 2), (15, 2)],
  term ((387365709 : Rat) / 85351924) [(0, 2), (15, 2)],
  term ((142964775 : Rat) / 85351924) [(0, 2), (15, 2), (16, 1)],
  term ((-40718556 : Rat) / 3048283) [(0, 2), (15, 4)],
  term ((-17753203 : Rat) / 42675962) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-643048041 : Rat) / 21337981) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((17769393 : Rat) / 3048283) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((783023343 : Rat) / 42675962) [(1, 2), (9, 1), (15, 1)],
  term ((-135197442 : Rat) / 21337981) [(1, 2), (9, 2)],
  term ((-348102729 : Rat) / 42675962) [(1, 2), (10, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-399196080 : Rat) / 21337981) [(1, 2), (10, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 2), (11, 1), (15, 3)],
  term ((333551016 : Rat) / 21337981) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((76543767 : Rat) / 21337981) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-76336443 : Rat) / 21337981) [(1, 2), (13, 1), (15, 1)],
  term ((-17753203 : Rat) / 85351924) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-269186184 : Rat) / 21337981) [(1, 2), (13, 1), (15, 3)],
  term ((615349683 : Rat) / 85351924) [(1, 2), (14, 1)],
  term ((-15810300 : Rat) / 3048283) [(1, 2), (14, 1), (15, 2)],
  term ((-342524349 : Rat) / 85351924) [(1, 2), (14, 2)],
  term ((-40718556 : Rat) / 3048283) [(1, 2), (14, 2), (15, 2)],
  term ((387365709 : Rat) / 85351924) [(1, 2), (15, 2)],
  term ((142964775 : Rat) / 85351924) [(1, 2), (15, 2), (16, 1)],
  term ((-40718556 : Rat) / 3048283) [(1, 2), (15, 4)],
  term ((17753203 : Rat) / 42675962) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((643048041 : Rat) / 21337981) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17769393 : Rat) / 3048283) [(8, 2), (9, 1), (14, 2), (15, 1)],
  term ((-783023343 : Rat) / 42675962) [(8, 2), (9, 1), (15, 1)],
  term ((135197442 : Rat) / 21337981) [(8, 2), (9, 2)],
  term ((348102729 : Rat) / 42675962) [(8, 2), (10, 1)],
  term ((-98779986 : Rat) / 3048283) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((399196080 : Rat) / 21337981) [(8, 2), (10, 1), (15, 2)],
  term ((49389993 : Rat) / 3048283) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(8, 2), (11, 1), (15, 3)],
  term ((-333551016 : Rat) / 21337981) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((76336443 : Rat) / 21337981) [(8, 2), (13, 1), (15, 1)],
  term ((17753203 : Rat) / 85351924) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((269186184 : Rat) / 21337981) [(8, 2), (13, 1), (15, 3)],
  term ((-615349683 : Rat) / 85351924) [(8, 2), (14, 1)],
  term ((15810300 : Rat) / 3048283) [(8, 2), (14, 1), (15, 2)],
  term ((342524349 : Rat) / 85351924) [(8, 2), (14, 2)],
  term ((40718556 : Rat) / 3048283) [(8, 2), (14, 2), (15, 2)],
  term ((-387365709 : Rat) / 85351924) [(8, 2), (15, 2)],
  term ((-142964775 : Rat) / 85351924) [(8, 2), (15, 2), (16, 1)],
  term ((40718556 : Rat) / 3048283) [(8, 2), (15, 4)],
  term ((348102729 : Rat) / 42675962) [(9, 2), (10, 1)],
  term ((-98779986 : Rat) / 3048283) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((399196080 : Rat) / 21337981) [(9, 2), (10, 1), (15, 2)],
  term ((49389993 : Rat) / 3048283) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(9, 2), (11, 1), (15, 3)],
  term ((-333551016 : Rat) / 21337981) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-76543767 : Rat) / 21337981) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((76336443 : Rat) / 21337981) [(9, 2), (13, 1), (15, 1)],
  term ((17753203 : Rat) / 85351924) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((269186184 : Rat) / 21337981) [(9, 2), (13, 1), (15, 3)],
  term ((-615349683 : Rat) / 85351924) [(9, 2), (14, 1)],
  term ((15810300 : Rat) / 3048283) [(9, 2), (14, 1), (15, 2)],
  term ((342524349 : Rat) / 85351924) [(9, 2), (14, 2)],
  term ((40718556 : Rat) / 3048283) [(9, 2), (14, 2), (15, 2)],
  term ((-387365709 : Rat) / 85351924) [(9, 2), (15, 2)],
  term ((-142964775 : Rat) / 85351924) [(9, 2), (15, 2), (16, 1)],
  term ((40718556 : Rat) / 3048283) [(9, 2), (15, 4)],
  term ((17753203 : Rat) / 42675962) [(9, 3), (13, 1), (14, 1), (16, 1)],
  term ((643048041 : Rat) / 21337981) [(9, 3), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-17769393 : Rat) / 3048283) [(9, 3), (14, 2), (15, 1)],
  term ((-783023343 : Rat) / 42675962) [(9, 3), (15, 1)],
  term ((135197442 : Rat) / 21337981) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 100 through 123. -/
theorem rs_R009_ueqv_R009YYYNN_block_01_0100_0123_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_01_0100_0123
      rs_R009_ueqv_R009YYYNN_block_01_0100_0123 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
