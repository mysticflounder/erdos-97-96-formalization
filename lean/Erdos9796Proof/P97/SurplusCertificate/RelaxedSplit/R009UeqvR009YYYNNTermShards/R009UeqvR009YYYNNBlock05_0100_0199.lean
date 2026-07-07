/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 5:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0100 : Poly :=
[
  term ((-303296400 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1)]
]

/-- Partial product 100 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0100 : Poly :=
[
  term ((606592800 : Rat) / 21337981) [(2, 1), (3, 2), (4, 1), (14, 1)],
  term ((-303296400 : Rat) / 21337981) [(2, 1), (3, 2), (4, 2), (14, 1)],
  term ((-303296400 : Rat) / 21337981) [(2, 1), (3, 2), (5, 2), (14, 1)],
  term ((303296400 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1), (15, 2)],
  term ((-606592800 : Rat) / 21337981) [(2, 1), (3, 2), (14, 2)],
  term ((303296400 : Rat) / 21337981) [(2, 1), (3, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0100_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0100
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0101 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 101 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0101 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (4, 2), (5, 1), (14, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (14, 3), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0101_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0101
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0102 : Poly :=
[
  term ((-783435654 : Rat) / 21337981) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 102 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0102 : Poly :=
[
  term ((1566871308 : Rat) / 21337981) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-783435654 : Rat) / 21337981) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((-1566871308 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((783435654 : Rat) / 21337981) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((783435654 : Rat) / 21337981) [(2, 1), (5, 1), (15, 3)],
  term ((-783435654 : Rat) / 21337981) [(2, 1), (5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0102_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0102
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0103 : Poly :=
[
  term ((81891549 : Rat) / 42675962) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0103 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0103_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0103
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0104 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (15, 3)]
]

/-- Partial product 104 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0104 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (4, 2), (5, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (14, 2), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (15, 5)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (5, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0104_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0104
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0105 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 105 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0105 : Poly :=
[
  term ((327566196 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0105_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0105
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0106 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0106 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0106_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0106
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0107 : Poly :=
[
  term ((655132392 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 107 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0107 : Poly :=
[
  term ((-1310264784 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((655132392 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (14, 1), (15, 1)],
  term ((655132392 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 3)],
  term ((1310264784 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0107_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0107
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0108 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0108 : Poly :=
[
  term ((327566196 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0108_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0108
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0109 : Poly :=
[
  term ((1157413563 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 109 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0109 : Poly :=
[
  term ((-2314827126 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((1157413563 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((1157413563 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (15, 1)],
  term ((2314827126 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1157413563 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1157413563 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0109_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0109
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0110 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0110 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0110_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0110
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0111 : Poly :=
[
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)]
]

/-- Partial product 111 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0111 : Poly :=
[
  term ((4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0111_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0111
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0112 : Poly :=
[
  term ((309826278 : Rat) / 21337981) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 112 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0112 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((309826278 : Rat) / 21337981) [(2, 1), (4, 2), (12, 1), (15, 2)],
  term ((309826278 : Rat) / 21337981) [(2, 1), (5, 2), (12, 1), (15, 2)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-309826278 : Rat) / 21337981) [(2, 1), (12, 1), (14, 2), (15, 2)],
  term ((-309826278 : Rat) / 21337981) [(2, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0112_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0112
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0113 : Poly :=
[
  term ((228546090 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 113 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0113 : Poly :=
[
  term ((-457092180 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((228546090 : Rat) / 21337981) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1)],
  term ((228546090 : Rat) / 21337981) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-228546090 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((457092180 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-228546090 : Rat) / 21337981) [(2, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0113_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0113
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0114 : Poly :=
[
  term ((-570655809 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 114 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0114 : Poly :=
[
  term ((1141311618 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-570655809 : Rat) / 21337981) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((-570655809 : Rat) / 21337981) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((-1141311618 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((570655809 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((570655809 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0114_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0114
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0115 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0115 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0115_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0115
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0116 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)]
]

/-- Partial product 116 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0116 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (4, 2), (13, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (5, 2), (13, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0116_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0116
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0117 : Poly :=
[
  term ((-67346280 : Rat) / 21337981) [(2, 1), (14, 1)]
]

/-- Partial product 117 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0117 : Poly :=
[
  term ((134692560 : Rat) / 21337981) [(2, 1), (4, 1), (14, 1)],
  term ((-67346280 : Rat) / 21337981) [(2, 1), (4, 2), (14, 1)],
  term ((-67346280 : Rat) / 21337981) [(2, 1), (5, 2), (14, 1)],
  term ((67346280 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((-134692560 : Rat) / 21337981) [(2, 1), (14, 2)],
  term ((67346280 : Rat) / 21337981) [(2, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0117_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0117
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0118 : Poly :=
[
  term ((542213064 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)]
]

/-- Partial product 118 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0118 : Poly :=
[
  term ((-1084426128 : Rat) / 21337981) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((542213064 : Rat) / 21337981) [(2, 1), (4, 2), (14, 1), (15, 2)],
  term ((542213064 : Rat) / 21337981) [(2, 1), (5, 2), (14, 1), (15, 2)],
  term ((-542213064 : Rat) / 21337981) [(2, 1), (14, 1), (15, 4)],
  term ((1084426128 : Rat) / 21337981) [(2, 1), (14, 2), (15, 2)],
  term ((-542213064 : Rat) / 21337981) [(2, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0118_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0118
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0119 : Poly :=
[
  term ((-1225676493 : Rat) / 21337981) [(2, 1), (15, 2)]
]

/-- Partial product 119 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0119 : Poly :=
[
  term ((2451352986 : Rat) / 21337981) [(2, 1), (4, 1), (15, 2)],
  term ((-1225676493 : Rat) / 21337981) [(2, 1), (4, 2), (15, 2)],
  term ((-1225676493 : Rat) / 21337981) [(2, 1), (5, 2), (15, 2)],
  term ((-2451352986 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((1225676493 : Rat) / 21337981) [(2, 1), (14, 2), (15, 2)],
  term ((1225676493 : Rat) / 21337981) [(2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0119_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0119
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0120 : Poly :=
[
  term ((289905372 : Rat) / 21337981) [(2, 2)]
]

/-- Partial product 120 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0120 : Poly :=
[
  term ((-579810744 : Rat) / 21337981) [(2, 2), (4, 1)],
  term ((289905372 : Rat) / 21337981) [(2, 2), (4, 2)],
  term ((289905372 : Rat) / 21337981) [(2, 2), (5, 2)],
  term ((579810744 : Rat) / 21337981) [(2, 2), (14, 1)],
  term ((-289905372 : Rat) / 21337981) [(2, 2), (14, 2)],
  term ((-289905372 : Rat) / 21337981) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0120_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0120
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0121 : Poly :=
[
  term ((-831523032 : Rat) / 21337981) [(3, 1), (5, 1)]
]

/-- Partial product 121 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0121 : Poly :=
[
  term ((1663046064 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1)],
  term ((-831523032 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1)],
  term ((-1663046064 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1)],
  term ((831523032 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2)],
  term ((831523032 : Rat) / 21337981) [(3, 1), (5, 1), (15, 2)],
  term ((-831523032 : Rat) / 21337981) [(3, 1), (5, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0121_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0121
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0122 : Poly :=
[
  term ((-60619536 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 122 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0122 : Poly :=
[
  term ((121239072 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (13, 1), (15, 1)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (5, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0122_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0122
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0123 : Poly :=
[
  term ((-671568552 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 123 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0123 : Poly :=
[
  term ((1343137104 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (14, 1)],
  term ((-671568552 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (14, 1)],
  term ((671568552 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-1343137104 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2)],
  term ((671568552 : Rat) / 21337981) [(3, 1), (5, 1), (14, 3)],
  term ((-671568552 : Rat) / 21337981) [(3, 1), (5, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0123_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0123
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0124 : Poly :=
[
  term ((-81891549 : Rat) / 42675962) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 124 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0124 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (4, 2), (5, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (5, 1), (14, 3), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (5, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0124_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0124
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0125 : Poly :=
[
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2)]
]

/-- Partial product 125 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0125 : Poly :=
[
  term ((1800091512 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (14, 2)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (14, 2)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((-1800091512 : Rat) / 21337981) [(3, 1), (5, 1), (14, 3)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 4)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0125_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0125
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0126 : Poly :=
[
  term ((585936108 : Rat) / 21337981) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 126 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0126 : Poly :=
[
  term ((-1171872216 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((585936108 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (15, 2)],
  term ((1171872216 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-585936108 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((-585936108 : Rat) / 21337981) [(3, 1), (5, 1), (15, 4)],
  term ((585936108 : Rat) / 21337981) [(3, 1), (5, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0126_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0126
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0127 : Poly :=
[
  term ((52640874 : Rat) / 21337981) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 127 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0127 : Poly :=
[
  term ((-105281748 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0127_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0127
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0128 : Poly :=
[
  term ((801666342 : Rat) / 21337981) [(3, 1), (9, 1)]
]

/-- Partial product 128 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0128 : Poly :=
[
  term ((-1603332684 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1)],
  term ((801666342 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1)],
  term ((801666342 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1)],
  term ((1603332684 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1)],
  term ((-801666342 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2)],
  term ((-801666342 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0128_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0128
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0129 : Poly :=
[
  term ((-75129426 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 129 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0129 : Poly :=
[
  term ((150258852 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (12, 1)],
  term ((-75129426 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (12, 1)],
  term ((-75129426 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (12, 1)],
  term ((-150258852 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((75129426 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((75129426 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0129_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0129
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0130 : Poly :=
[
  term ((-13524246 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 130 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0130 : Poly :=
[
  term ((27048492 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (12, 1), (14, 1)],
  term ((-13524246 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (12, 1), (14, 1)],
  term ((-13524246 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (12, 1), (14, 1)],
  term ((13524246 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-27048492 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((13524246 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0130_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0130
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0131 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 131 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0131 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0131_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0131
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0132 : Poly :=
[
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 132 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0132 : Poly :=
[
  term ((-210563496 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (12, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0132_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0132
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0133 : Poly :=
[
  term ((60619536 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 133 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0133 : Poly :=
[
  term ((-121239072 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (13, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0133_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0133
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0134 : Poly :=
[
  term ((1530709137 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 134 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0134 : Poly :=
[
  term ((-3061418274 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (14, 1)],
  term ((1530709137 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (14, 1)],
  term ((1530709137 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (14, 1)],
  term ((-1530709137 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((3061418274 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2)],
  term ((-1530709137 : Rat) / 21337981) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0134_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0134
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0135 : Poly :=
[
  term ((-128671947 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 135 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0135 : Poly :=
[
  term ((257343894 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-128671947 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((-128671947 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((128671947 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-257343894 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((128671947 : Rat) / 21337981) [(3, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0135_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0135
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0136 : Poly :=
[
  term ((-628586352 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2)]
]

/-- Partial product 136 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0136 : Poly :=
[
  term ((1257172704 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (14, 2)],
  term ((-628586352 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (14, 2)],
  term ((-628586352 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (14, 2)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-1257172704 : Rat) / 21337981) [(3, 1), (9, 1), (14, 3)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (9, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0136_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0136
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0137 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 137 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0137 : Poly :=
[
  term ((-327566196 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (14, 2), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (14, 2), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((327566196 : Rat) / 21337981) [(3, 1), (9, 1), (14, 3), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0137_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0137
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0138 : Poly :=
[
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 138 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0138 : Poly :=
[
  term ((5450573952 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (15, 2)],
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (15, 2)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0138_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0138
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0139 : Poly :=
[
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 139 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0139 : Poly :=
[
  term ((210563496 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0139_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0139
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0140 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 140 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0140 : Poly :=
[
  term ((2654642808 : Rat) / 21337981) [(3, 1), (4, 1), (10, 1), (11, 1)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (4, 2), (10, 1), (11, 1)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (5, 2), (10, 1), (11, 1)],
  term ((-2654642808 : Rat) / 21337981) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0140_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0140
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0141 : Poly :=
[
  term ((966957102 : Rat) / 21337981) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 141 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0141 : Poly :=
[
  term ((-1933914204 : Rat) / 21337981) [(3, 1), (4, 1), (10, 1), (15, 1)],
  term ((966957102 : Rat) / 21337981) [(3, 1), (4, 2), (10, 1), (15, 1)],
  term ((966957102 : Rat) / 21337981) [(3, 1), (5, 2), (10, 1), (15, 1)],
  term ((1933914204 : Rat) / 21337981) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-966957102 : Rat) / 21337981) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-966957102 : Rat) / 21337981) [(3, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0141_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0141
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0142 : Poly :=
[
  term ((663660702 : Rat) / 21337981) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 142 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0142 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (4, 2), (11, 1), (14, 1)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (5, 2), (11, 1), (14, 1)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (11, 1), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0142_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0142
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0143 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (11, 1), (14, 2)]
]

/-- Partial product 143 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0143 : Poly :=
[
  term ((2654642808 : Rat) / 21337981) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (4, 2), (11, 1), (14, 2)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (5, 2), (11, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-2654642808 : Rat) / 21337981) [(3, 1), (11, 1), (14, 3)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (11, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0143_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0143
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0144 : Poly :=
[
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 144 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0144 : Poly :=
[
  term ((1327321404 : Rat) / 21337981) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (4, 2), (11, 1), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (5, 2), (11, 1), (15, 2)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0144_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0144
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0145 : Poly :=
[
  term ((450022878 : Rat) / 21337981) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 145 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0145 : Poly :=
[
  term ((-900045756 : Rat) / 21337981) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((450022878 : Rat) / 21337981) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1)],
  term ((450022878 : Rat) / 21337981) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1)],
  term ((-450022878 : Rat) / 21337981) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-450022878 : Rat) / 21337981) [(3, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0145_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0145
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0146 : Poly :=
[
  term ((478953234 : Rat) / 21337981) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 146 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0146 : Poly :=
[
  term ((-957906468 : Rat) / 21337981) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((478953234 : Rat) / 21337981) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((478953234 : Rat) / 21337981) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((957906468 : Rat) / 21337981) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-478953234 : Rat) / 21337981) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-478953234 : Rat) / 21337981) [(3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0146_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0146
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0147 : Poly :=
[
  term ((-851521068 : Rat) / 21337981) [(3, 1), (13, 1)]
]

/-- Partial product 147 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0147 : Poly :=
[
  term ((1703042136 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1)],
  term ((-851521068 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1)],
  term ((-851521068 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1)],
  term ((-1703042136 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1)],
  term ((851521068 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2)],
  term ((851521068 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0147_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0147
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0148 : Poly :=
[
  term ((901929951 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 148 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0148 : Poly :=
[
  term ((-1803859902 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((901929951 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (14, 1)],
  term ((901929951 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (14, 1)],
  term ((-901929951 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((1803859902 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2)],
  term ((-901929951 : Rat) / 21337981) [(3, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0148_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0148
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0149 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 149 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0149 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0149_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0149
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0150 : Poly :=
[
  term ((-419693238 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2)]
]

/-- Partial product 150 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0150 : Poly :=
[
  term ((839386476 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((-419693238 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (14, 2)],
  term ((-419693238 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (14, 2)],
  term ((419693238 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-839386476 : Rat) / 21337981) [(3, 1), (13, 1), (14, 3)],
  term ((419693238 : Rat) / 21337981) [(3, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0150_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0150
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0151 : Poly :=
[
  term ((3957649686 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 151 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0151 : Poly :=
[
  term ((-7915299372 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((3957649686 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (15, 2)],
  term ((3957649686 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((7915299372 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3957649686 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-3957649686 : Rat) / 21337981) [(3, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0151_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0151
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0152 : Poly :=
[
  term ((105281748 : Rat) / 21337981) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 152 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0152 : Poly :=
[
  term ((-210563496 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0152_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0152
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0153 : Poly :=
[
  term ((-60619536 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 153 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0153 : Poly :=
[
  term ((121239072 : Rat) / 21337981) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (4, 2), (13, 2), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (5, 2), (13, 2), (15, 1)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0153_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0153
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0154 : Poly :=
[
  term ((23591367 : Rat) / 435469) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 154 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0154 : Poly :=
[
  term ((-47182734 : Rat) / 435469) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((23591367 : Rat) / 435469) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((23591367 : Rat) / 435469) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((-23591367 : Rat) / 435469) [(3, 1), (14, 1), (15, 3)],
  term ((47182734 : Rat) / 435469) [(3, 1), (14, 2), (15, 1)],
  term ((-23591367 : Rat) / 435469) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0154_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0154
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0155 : Poly :=
[
  term ((1457307990 : Rat) / 21337981) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 155 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0155 : Poly :=
[
  term ((-2914615980 : Rat) / 21337981) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((1457307990 : Rat) / 21337981) [(3, 1), (4, 2), (14, 2), (15, 1)],
  term ((1457307990 : Rat) / 21337981) [(3, 1), (5, 2), (14, 2), (15, 1)],
  term ((-1457307990 : Rat) / 21337981) [(3, 1), (14, 2), (15, 3)],
  term ((2914615980 : Rat) / 21337981) [(3, 1), (14, 3), (15, 1)],
  term ((-1457307990 : Rat) / 21337981) [(3, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0155_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0155
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0156 : Poly :=
[
  term ((-1868846040 : Rat) / 21337981) [(3, 1), (15, 1)]
]

/-- Partial product 156 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0156 : Poly :=
[
  term ((3737692080 : Rat) / 21337981) [(3, 1), (4, 1), (15, 1)],
  term ((-1868846040 : Rat) / 21337981) [(3, 1), (4, 2), (15, 1)],
  term ((-1868846040 : Rat) / 21337981) [(3, 1), (5, 2), (15, 1)],
  term ((-3737692080 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)],
  term ((1868846040 : Rat) / 21337981) [(3, 1), (14, 2), (15, 1)],
  term ((1868846040 : Rat) / 21337981) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0156_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0156
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0157 : Poly :=
[
  term ((1999521054 : Rat) / 21337981) [(3, 1), (15, 3)]
]

/-- Partial product 157 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0157 : Poly :=
[
  term ((-3999042108 : Rat) / 21337981) [(3, 1), (4, 1), (15, 3)],
  term ((1999521054 : Rat) / 21337981) [(3, 1), (4, 2), (15, 3)],
  term ((1999521054 : Rat) / 21337981) [(3, 1), (5, 2), (15, 3)],
  term ((3999042108 : Rat) / 21337981) [(3, 1), (14, 1), (15, 3)],
  term ((-1999521054 : Rat) / 21337981) [(3, 1), (14, 2), (15, 3)],
  term ((-1999521054 : Rat) / 21337981) [(3, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0157_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0157
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0158 : Poly :=
[
  term ((43477047 : Rat) / 21337981) [(3, 2)]
]

/-- Partial product 158 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0158 : Poly :=
[
  term ((-86954094 : Rat) / 21337981) [(3, 2), (4, 1)],
  term ((43477047 : Rat) / 21337981) [(3, 2), (4, 2)],
  term ((43477047 : Rat) / 21337981) [(3, 2), (5, 2)],
  term ((86954094 : Rat) / 21337981) [(3, 2), (14, 1)],
  term ((-43477047 : Rat) / 21337981) [(3, 2), (14, 2)],
  term ((-43477047 : Rat) / 21337981) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0158_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0158
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0159 : Poly :=
[
  term ((30329640 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1)]
]

/-- Partial product 159 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0159 : Poly :=
[
  term ((-60659280 : Rat) / 21337981) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (4, 2), (5, 1), (13, 1)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1), (14, 2)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0159_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0159
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0160 : Poly :=
[
  term ((3266556984 : Rat) / 21337981) [(3, 2), (5, 1), (15, 1)]
]

/-- Partial product 160 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0160 : Poly :=
[
  term ((-6533113968 : Rat) / 21337981) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((3266556984 : Rat) / 21337981) [(3, 2), (4, 2), (5, 1), (15, 1)],
  term ((6533113968 : Rat) / 21337981) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-3266556984 : Rat) / 21337981) [(3, 2), (5, 1), (14, 2), (15, 1)],
  term ((-3266556984 : Rat) / 21337981) [(3, 2), (5, 1), (15, 3)],
  term ((3266556984 : Rat) / 21337981) [(3, 2), (5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0160_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0160
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0161 : Poly :=
[
  term ((-30329640 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 161 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0161 : Poly :=
[
  term ((60659280 : Rat) / 21337981) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (4, 2), (9, 1), (13, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (5, 2), (9, 1), (13, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0161_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0161
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0162 : Poly :=
[
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 162 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0162 : Poly :=
[
  term ((2932930944 : Rat) / 21337981) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (4, 2), (9, 1), (15, 1)],
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0162_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0162
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0163 : Poly :=
[
  term ((-7582410 : Rat) / 21337981) [(3, 2), (12, 1)]
]

/-- Partial product 163 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0163 : Poly :=
[
  term ((15164820 : Rat) / 21337981) [(3, 2), (4, 1), (12, 1)],
  term ((-7582410 : Rat) / 21337981) [(3, 2), (4, 2), (12, 1)],
  term ((-7582410 : Rat) / 21337981) [(3, 2), (5, 2), (12, 1)],
  term ((-15164820 : Rat) / 21337981) [(3, 2), (12, 1), (14, 1)],
  term ((7582410 : Rat) / 21337981) [(3, 2), (12, 1), (14, 2)],
  term ((7582410 : Rat) / 21337981) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0163_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0163
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0164 : Poly :=
[
  term ((78484788 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 164 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0164 : Poly :=
[
  term ((-156969576 : Rat) / 21337981) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((78484788 : Rat) / 21337981) [(3, 2), (4, 2), (13, 1), (15, 1)],
  term ((78484788 : Rat) / 21337981) [(3, 2), (5, 2), (13, 1), (15, 1)],
  term ((156969576 : Rat) / 21337981) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-78484788 : Rat) / 21337981) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((-78484788 : Rat) / 21337981) [(3, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0164_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0164
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0165 : Poly :=
[
  term ((30329640 : Rat) / 21337981) [(3, 2), (13, 2)]
]

/-- Partial product 165 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0165 : Poly :=
[
  term ((-60659280 : Rat) / 21337981) [(3, 2), (4, 1), (13, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (4, 2), (13, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (5, 2), (13, 2)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (13, 2), (14, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (13, 2), (14, 2)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0165_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0165
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0166 : Poly :=
[
  term ((-282801213 : Rat) / 3048283) [(3, 2), (14, 1)]
]

/-- Partial product 166 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0166 : Poly :=
[
  term ((565602426 : Rat) / 3048283) [(3, 2), (4, 1), (14, 1)],
  term ((-282801213 : Rat) / 3048283) [(3, 2), (4, 2), (14, 1)],
  term ((-282801213 : Rat) / 3048283) [(3, 2), (5, 2), (14, 1)],
  term ((282801213 : Rat) / 3048283) [(3, 2), (14, 1), (15, 2)],
  term ((-565602426 : Rat) / 3048283) [(3, 2), (14, 2)],
  term ((282801213 : Rat) / 3048283) [(3, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0166_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0166
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0167 : Poly :=
[
  term ((120805506 : Rat) / 3048283) [(3, 2), (14, 2)]
]

/-- Partial product 167 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0167 : Poly :=
[
  term ((-241611012 : Rat) / 3048283) [(3, 2), (4, 1), (14, 2)],
  term ((120805506 : Rat) / 3048283) [(3, 2), (4, 2), (14, 2)],
  term ((120805506 : Rat) / 3048283) [(3, 2), (5, 2), (14, 2)],
  term ((-120805506 : Rat) / 3048283) [(3, 2), (14, 2), (15, 2)],
  term ((241611012 : Rat) / 3048283) [(3, 2), (14, 3)],
  term ((-120805506 : Rat) / 3048283) [(3, 2), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0167_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0167
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0168 : Poly :=
[
  term ((-2334383046 : Rat) / 21337981) [(3, 2), (15, 2)]
]

/-- Partial product 168 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0168 : Poly :=
[
  term ((4668766092 : Rat) / 21337981) [(3, 2), (4, 1), (15, 2)],
  term ((-2334383046 : Rat) / 21337981) [(3, 2), (4, 2), (15, 2)],
  term ((-2334383046 : Rat) / 21337981) [(3, 2), (5, 2), (15, 2)],
  term ((-4668766092 : Rat) / 21337981) [(3, 2), (14, 1), (15, 2)],
  term ((2334383046 : Rat) / 21337981) [(3, 2), (14, 2), (15, 2)],
  term ((2334383046 : Rat) / 21337981) [(3, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0168_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0168
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0169 : Poly :=
[
  term ((-303296400 : Rat) / 21337981) [(3, 3), (15, 1)]
]

/-- Partial product 169 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0169 : Poly :=
[
  term ((606592800 : Rat) / 21337981) [(3, 3), (4, 1), (15, 1)],
  term ((-303296400 : Rat) / 21337981) [(3, 3), (4, 2), (15, 1)],
  term ((-303296400 : Rat) / 21337981) [(3, 3), (5, 2), (15, 1)],
  term ((-606592800 : Rat) / 21337981) [(3, 3), (14, 1), (15, 1)],
  term ((303296400 : Rat) / 21337981) [(3, 3), (14, 2), (15, 1)],
  term ((303296400 : Rat) / 21337981) [(3, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0169_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0169
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0170 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(5, 1), (13, 1)]
]

/-- Partial product 170 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0170 : Poly :=
[
  term ((35506406 : Rat) / 21337981) [(4, 1), (5, 1), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(4, 2), (5, 1), (13, 1)],
  term ((-35506406 : Rat) / 21337981) [(5, 1), (13, 1), (14, 1)],
  term ((17753203 : Rat) / 21337981) [(5, 1), (13, 1), (14, 2)],
  term ((17753203 : Rat) / 21337981) [(5, 1), (13, 1), (15, 2)],
  term ((-17753203 : Rat) / 21337981) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0170_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0170
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0171 : Poly :=
[
  term ((17753203 : Rat) / 85351924) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 171 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0171 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0171_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0171
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0172 : Poly :=
[
  term ((929478834 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 172 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0172 : Poly :=
[
  term ((-1858957668 : Rat) / 21337981) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((929478834 : Rat) / 21337981) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-929478834 : Rat) / 21337981) [(5, 1), (14, 1), (15, 3)],
  term ((1858957668 : Rat) / 21337981) [(5, 1), (14, 2), (15, 1)],
  term ((-929478834 : Rat) / 21337981) [(5, 1), (14, 3), (15, 1)],
  term ((929478834 : Rat) / 21337981) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0172_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0172
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0173 : Poly :=
[
  term ((619652556 : Rat) / 21337981) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 173 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0173 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(4, 2), (5, 1), (14, 2), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 2), (15, 3)],
  term ((1239305112 : Rat) / 21337981) [(5, 1), (14, 3), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 4), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0173_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0173
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0174 : Poly :=
[
  term ((452791053 : Rat) / 21337981) [(5, 1), (15, 1)]
]

/-- Partial product 174 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0174 : Poly :=
[
  term ((-905582106 : Rat) / 21337981) [(4, 1), (5, 1), (15, 1)],
  term ((452791053 : Rat) / 21337981) [(4, 2), (5, 1), (15, 1)],
  term ((905582106 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)],
  term ((-452791053 : Rat) / 21337981) [(5, 1), (14, 2), (15, 1)],
  term ((-452791053 : Rat) / 21337981) [(5, 1), (15, 3)],
  term ((452791053 : Rat) / 21337981) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0174_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0174
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0175 : Poly :=
[
  term ((-142964775 : Rat) / 85351924) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0175 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(5, 1), (15, 3), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0175_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0175
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0176 : Poly :=
[
  term ((-1858957668 : Rat) / 21337981) [(5, 1), (15, 3)]
]

/-- Partial product 176 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0176 : Poly :=
[
  term ((3717915336 : Rat) / 21337981) [(4, 1), (5, 1), (15, 3)],
  term ((-1858957668 : Rat) / 21337981) [(4, 2), (5, 1), (15, 3)],
  term ((-3717915336 : Rat) / 21337981) [(5, 1), (14, 1), (15, 3)],
  term ((1858957668 : Rat) / 21337981) [(5, 1), (14, 2), (15, 3)],
  term ((1858957668 : Rat) / 21337981) [(5, 1), (15, 5)],
  term ((-1858957668 : Rat) / 21337981) [(5, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0176_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0176
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0177 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 177 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0177 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0177_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0177
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0178 : Poly :=
[
  term ((44139420 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 178 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0178 : Poly :=
[
  term ((-88278840 : Rat) / 21337981) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((44139420 : Rat) / 21337981) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((44139420 : Rat) / 21337981) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-44139420 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((88278840 : Rat) / 21337981) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-44139420 : Rat) / 21337981) [(9, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0178_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0178
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0179 : Poly :=
[
  term ((141713388 : Rat) / 21337981) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 179 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0179 : Poly :=
[
  term ((-283426776 : Rat) / 21337981) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((141713388 : Rat) / 21337981) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((141713388 : Rat) / 21337981) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((283426776 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-141713388 : Rat) / 21337981) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-141713388 : Rat) / 21337981) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0179_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0179
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0180 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 180 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0180 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0180_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0180
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0181 : Poly :=
[
  term ((83021005 : Rat) / 85351924) [(9, 1), (13, 1)]
]

/-- Partial product 181 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0181 : Poly :=
[
  term ((-83021005 : Rat) / 42675962) [(4, 1), (9, 1), (13, 1)],
  term ((83021005 : Rat) / 85351924) [(4, 2), (9, 1), (13, 1)],
  term ((83021005 : Rat) / 85351924) [(5, 2), (9, 1), (13, 1)],
  term ((83021005 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1)],
  term ((-83021005 : Rat) / 85351924) [(9, 1), (13, 1), (14, 2)],
  term ((-83021005 : Rat) / 85351924) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0181_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0181
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0182 : Poly :=
[
  term ((-12008193 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 182 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0182 : Poly :=
[
  term ((12008193 : Rat) / 21337981) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-12008193 : Rat) / 42675962) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-12008193 : Rat) / 42675962) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((12008193 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12008193 : Rat) / 21337981) [(9, 1), (13, 1), (14, 2)],
  term ((12008193 : Rat) / 42675962) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0182_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0182
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0183 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 183 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0183 : Poly :=
[
  term ((35506406 : Rat) / 21337981) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35506406 : Rat) / 21337981) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0183_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0183
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0184 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 184 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0184 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0184_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0184
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0185 : Poly :=
[
  term ((-1400173125 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 185 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0185 : Poly :=
[
  term ((2800346250 : Rat) / 21337981) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1400173125 : Rat) / 21337981) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1400173125 : Rat) / 21337981) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((1400173125 : Rat) / 21337981) [(9, 1), (14, 1), (15, 3)],
  term ((-2800346250 : Rat) / 21337981) [(9, 1), (14, 2), (15, 1)],
  term ((1400173125 : Rat) / 21337981) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0185_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0185
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0186 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0186 : Poly :=
[
  term ((-285929550 : Rat) / 21337981) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((285929550 : Rat) / 21337981) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0186_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0186
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0187 : Poly :=
[
  term ((35538786 : Rat) / 3048283) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 187 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0187 : Poly :=
[
  term ((-71077572 : Rat) / 3048283) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((35538786 : Rat) / 3048283) [(4, 2), (9, 1), (14, 2), (15, 1)],
  term ((35538786 : Rat) / 3048283) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((-35538786 : Rat) / 3048283) [(9, 1), (14, 2), (15, 3)],
  term ((71077572 : Rat) / 3048283) [(9, 1), (14, 3), (15, 1)],
  term ((-35538786 : Rat) / 3048283) [(9, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0187_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0187
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0188 : Poly :=
[
  term ((-1053701265 : Rat) / 42675962) [(9, 1), (15, 1)]
]

/-- Partial product 188 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0188 : Poly :=
[
  term ((1053701265 : Rat) / 21337981) [(4, 1), (9, 1), (15, 1)],
  term ((-1053701265 : Rat) / 42675962) [(4, 2), (9, 1), (15, 1)],
  term ((-1053701265 : Rat) / 42675962) [(5, 2), (9, 1), (15, 1)],
  term ((-1053701265 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)],
  term ((1053701265 : Rat) / 42675962) [(9, 1), (14, 2), (15, 1)],
  term ((1053701265 : Rat) / 42675962) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0188_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0188
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0189 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0189 : Poly :=
[
  term ((-142964775 : Rat) / 21337981) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0189_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0189
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0190 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(9, 1), (15, 3)]
]

/-- Partial product 190 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0190 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(4, 1), (9, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(4, 2), (9, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(5, 2), (9, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(9, 1), (14, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(9, 1), (14, 2), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0190_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0190
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0191 : Poly :=
[
  term ((-552797961 : Rat) / 85351924) [(9, 2)]
]

/-- Partial product 191 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0191 : Poly :=
[
  term ((552797961 : Rat) / 42675962) [(4, 1), (9, 2)],
  term ((-552797961 : Rat) / 85351924) [(4, 2), (9, 2)],
  term ((-552797961 : Rat) / 85351924) [(5, 2), (9, 2)],
  term ((-552797961 : Rat) / 42675962) [(9, 2), (14, 1)],
  term ((552797961 : Rat) / 85351924) [(9, 2), (14, 2)],
  term ((552797961 : Rat) / 85351924) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0191_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0191
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0192 : Poly :=
[
  term ((-12008193 : Rat) / 42675962) [(9, 2), (12, 1)]
]

/-- Partial product 192 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0192 : Poly :=
[
  term ((12008193 : Rat) / 21337981) [(4, 1), (9, 2), (12, 1)],
  term ((-12008193 : Rat) / 42675962) [(4, 2), (9, 2), (12, 1)],
  term ((-12008193 : Rat) / 42675962) [(5, 2), (9, 2), (12, 1)],
  term ((-12008193 : Rat) / 21337981) [(9, 2), (12, 1), (14, 1)],
  term ((12008193 : Rat) / 42675962) [(9, 2), (12, 1), (14, 2)],
  term ((12008193 : Rat) / 42675962) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0192_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0192
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0193 : Poly :=
[
  term ((147205635 : Rat) / 21337981) [(9, 2), (14, 1)]
]

/-- Partial product 193 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0193 : Poly :=
[
  term ((-294411270 : Rat) / 21337981) [(4, 1), (9, 2), (14, 1)],
  term ((147205635 : Rat) / 21337981) [(4, 2), (9, 2), (14, 1)],
  term ((147205635 : Rat) / 21337981) [(5, 2), (9, 2), (14, 1)],
  term ((-147205635 : Rat) / 21337981) [(9, 2), (14, 1), (15, 2)],
  term ((294411270 : Rat) / 21337981) [(9, 2), (14, 2)],
  term ((-147205635 : Rat) / 21337981) [(9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0193_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0193
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0194 : Poly :=
[
  term ((-348102729 : Rat) / 42675962) [(10, 1)]
]

/-- Partial product 194 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0194 : Poly :=
[
  term ((348102729 : Rat) / 21337981) [(4, 1), (10, 1)],
  term ((-348102729 : Rat) / 42675962) [(4, 2), (10, 1)],
  term ((-348102729 : Rat) / 42675962) [(5, 2), (10, 1)],
  term ((-348102729 : Rat) / 21337981) [(10, 1), (14, 1)],
  term ((348102729 : Rat) / 42675962) [(10, 1), (14, 2)],
  term ((348102729 : Rat) / 42675962) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0194_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0194
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0195 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 195 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0195 : Poly :=
[
  term ((-197559972 : Rat) / 3048283) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0195_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0195
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0196 : Poly :=
[
  term ((-399196080 : Rat) / 21337981) [(10, 1), (15, 2)]
]

/-- Partial product 196 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0196 : Poly :=
[
  term ((798392160 : Rat) / 21337981) [(4, 1), (10, 1), (15, 2)],
  term ((-399196080 : Rat) / 21337981) [(4, 2), (10, 1), (15, 2)],
  term ((-399196080 : Rat) / 21337981) [(5, 2), (10, 1), (15, 2)],
  term ((-798392160 : Rat) / 21337981) [(10, 1), (14, 1), (15, 2)],
  term ((399196080 : Rat) / 21337981) [(10, 1), (14, 2), (15, 2)],
  term ((399196080 : Rat) / 21337981) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0196_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0196
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0197 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 197 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0197 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (14, 1), (15, 3)],
  term ((-98779986 : Rat) / 3048283) [(11, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0197_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0197
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0198 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 198 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0198 : Poly :=
[
  term ((-197559972 : Rat) / 3048283) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(11, 1), (14, 2), (15, 3)],
  term ((197559972 : Rat) / 3048283) [(11, 1), (14, 3), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(11, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0198_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0198
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0199 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(11, 1), (15, 3)]
]

/-- Partial product 199 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0199 : Poly :=
[
  term ((-98779986 : Rat) / 3048283) [(4, 1), (11, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(4, 2), (11, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(5, 2), (11, 1), (15, 3)],
  term ((98779986 : Rat) / 3048283) [(11, 1), (14, 1), (15, 3)],
  term ((-49389993 : Rat) / 3048283) [(11, 1), (14, 2), (15, 3)],
  term ((-49389993 : Rat) / 3048283) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0199_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0199
        rs_R009_ueqv_R009YYYNN_generator_05_0100_0199 =
      rs_R009_ueqv_R009YYYNN_partial_05_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_05_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_05_0100,
  rs_R009_ueqv_R009YYYNN_partial_05_0101,
  rs_R009_ueqv_R009YYYNN_partial_05_0102,
  rs_R009_ueqv_R009YYYNN_partial_05_0103,
  rs_R009_ueqv_R009YYYNN_partial_05_0104,
  rs_R009_ueqv_R009YYYNN_partial_05_0105,
  rs_R009_ueqv_R009YYYNN_partial_05_0106,
  rs_R009_ueqv_R009YYYNN_partial_05_0107,
  rs_R009_ueqv_R009YYYNN_partial_05_0108,
  rs_R009_ueqv_R009YYYNN_partial_05_0109,
  rs_R009_ueqv_R009YYYNN_partial_05_0110,
  rs_R009_ueqv_R009YYYNN_partial_05_0111,
  rs_R009_ueqv_R009YYYNN_partial_05_0112,
  rs_R009_ueqv_R009YYYNN_partial_05_0113,
  rs_R009_ueqv_R009YYYNN_partial_05_0114,
  rs_R009_ueqv_R009YYYNN_partial_05_0115,
  rs_R009_ueqv_R009YYYNN_partial_05_0116,
  rs_R009_ueqv_R009YYYNN_partial_05_0117,
  rs_R009_ueqv_R009YYYNN_partial_05_0118,
  rs_R009_ueqv_R009YYYNN_partial_05_0119,
  rs_R009_ueqv_R009YYYNN_partial_05_0120,
  rs_R009_ueqv_R009YYYNN_partial_05_0121,
  rs_R009_ueqv_R009YYYNN_partial_05_0122,
  rs_R009_ueqv_R009YYYNN_partial_05_0123,
  rs_R009_ueqv_R009YYYNN_partial_05_0124,
  rs_R009_ueqv_R009YYYNN_partial_05_0125,
  rs_R009_ueqv_R009YYYNN_partial_05_0126,
  rs_R009_ueqv_R009YYYNN_partial_05_0127,
  rs_R009_ueqv_R009YYYNN_partial_05_0128,
  rs_R009_ueqv_R009YYYNN_partial_05_0129,
  rs_R009_ueqv_R009YYYNN_partial_05_0130,
  rs_R009_ueqv_R009YYYNN_partial_05_0131,
  rs_R009_ueqv_R009YYYNN_partial_05_0132,
  rs_R009_ueqv_R009YYYNN_partial_05_0133,
  rs_R009_ueqv_R009YYYNN_partial_05_0134,
  rs_R009_ueqv_R009YYYNN_partial_05_0135,
  rs_R009_ueqv_R009YYYNN_partial_05_0136,
  rs_R009_ueqv_R009YYYNN_partial_05_0137,
  rs_R009_ueqv_R009YYYNN_partial_05_0138,
  rs_R009_ueqv_R009YYYNN_partial_05_0139,
  rs_R009_ueqv_R009YYYNN_partial_05_0140,
  rs_R009_ueqv_R009YYYNN_partial_05_0141,
  rs_R009_ueqv_R009YYYNN_partial_05_0142,
  rs_R009_ueqv_R009YYYNN_partial_05_0143,
  rs_R009_ueqv_R009YYYNN_partial_05_0144,
  rs_R009_ueqv_R009YYYNN_partial_05_0145,
  rs_R009_ueqv_R009YYYNN_partial_05_0146,
  rs_R009_ueqv_R009YYYNN_partial_05_0147,
  rs_R009_ueqv_R009YYYNN_partial_05_0148,
  rs_R009_ueqv_R009YYYNN_partial_05_0149,
  rs_R009_ueqv_R009YYYNN_partial_05_0150,
  rs_R009_ueqv_R009YYYNN_partial_05_0151,
  rs_R009_ueqv_R009YYYNN_partial_05_0152,
  rs_R009_ueqv_R009YYYNN_partial_05_0153,
  rs_R009_ueqv_R009YYYNN_partial_05_0154,
  rs_R009_ueqv_R009YYYNN_partial_05_0155,
  rs_R009_ueqv_R009YYYNN_partial_05_0156,
  rs_R009_ueqv_R009YYYNN_partial_05_0157,
  rs_R009_ueqv_R009YYYNN_partial_05_0158,
  rs_R009_ueqv_R009YYYNN_partial_05_0159,
  rs_R009_ueqv_R009YYYNN_partial_05_0160,
  rs_R009_ueqv_R009YYYNN_partial_05_0161,
  rs_R009_ueqv_R009YYYNN_partial_05_0162,
  rs_R009_ueqv_R009YYYNN_partial_05_0163,
  rs_R009_ueqv_R009YYYNN_partial_05_0164,
  rs_R009_ueqv_R009YYYNN_partial_05_0165,
  rs_R009_ueqv_R009YYYNN_partial_05_0166,
  rs_R009_ueqv_R009YYYNN_partial_05_0167,
  rs_R009_ueqv_R009YYYNN_partial_05_0168,
  rs_R009_ueqv_R009YYYNN_partial_05_0169,
  rs_R009_ueqv_R009YYYNN_partial_05_0170,
  rs_R009_ueqv_R009YYYNN_partial_05_0171,
  rs_R009_ueqv_R009YYYNN_partial_05_0172,
  rs_R009_ueqv_R009YYYNN_partial_05_0173,
  rs_R009_ueqv_R009YYYNN_partial_05_0174,
  rs_R009_ueqv_R009YYYNN_partial_05_0175,
  rs_R009_ueqv_R009YYYNN_partial_05_0176,
  rs_R009_ueqv_R009YYYNN_partial_05_0177,
  rs_R009_ueqv_R009YYYNN_partial_05_0178,
  rs_R009_ueqv_R009YYYNN_partial_05_0179,
  rs_R009_ueqv_R009YYYNN_partial_05_0180,
  rs_R009_ueqv_R009YYYNN_partial_05_0181,
  rs_R009_ueqv_R009YYYNN_partial_05_0182,
  rs_R009_ueqv_R009YYYNN_partial_05_0183,
  rs_R009_ueqv_R009YYYNN_partial_05_0184,
  rs_R009_ueqv_R009YYYNN_partial_05_0185,
  rs_R009_ueqv_R009YYYNN_partial_05_0186,
  rs_R009_ueqv_R009YYYNN_partial_05_0187,
  rs_R009_ueqv_R009YYYNN_partial_05_0188,
  rs_R009_ueqv_R009YYYNN_partial_05_0189,
  rs_R009_ueqv_R009YYYNN_partial_05_0190,
  rs_R009_ueqv_R009YYYNN_partial_05_0191,
  rs_R009_ueqv_R009YYYNN_partial_05_0192,
  rs_R009_ueqv_R009YYYNN_partial_05_0193,
  rs_R009_ueqv_R009YYYNN_partial_05_0194,
  rs_R009_ueqv_R009YYYNN_partial_05_0195,
  rs_R009_ueqv_R009YYYNN_partial_05_0196,
  rs_R009_ueqv_R009YYYNN_partial_05_0197,
  rs_R009_ueqv_R009YYYNN_partial_05_0198,
  rs_R009_ueqv_R009YYYNN_partial_05_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_05_0100_0199 : Poly :=
[
  term ((606592800 : Rat) / 21337981) [(2, 1), (3, 2), (4, 1), (14, 1)],
  term ((-303296400 : Rat) / 21337981) [(2, 1), (3, 2), (4, 2), (14, 1)],
  term ((-303296400 : Rat) / 21337981) [(2, 1), (3, 2), (5, 2), (14, 1)],
  term ((303296400 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1), (15, 2)],
  term ((-606592800 : Rat) / 21337981) [(2, 1), (3, 2), (14, 2)],
  term ((303296400 : Rat) / 21337981) [(2, 1), (3, 2), (14, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((1566871308 : Rat) / 21337981) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1310264784 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2314827126 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((-619652556 : Rat) / 21337981) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-457092180 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((1141311618 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((134692560 : Rat) / 21337981) [(2, 1), (4, 1), (14, 1)],
  term ((-1084426128 : Rat) / 21337981) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((2451352986 : Rat) / 21337981) [(2, 1), (4, 1), (15, 2)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-783435654 : Rat) / 21337981) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (4, 2), (5, 1), (15, 3)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((655132392 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1157413563 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (4, 2), (9, 1), (15, 3)],
  term ((309826278 : Rat) / 21337981) [(2, 1), (4, 2), (12, 1), (15, 2)],
  term ((228546090 : Rat) / 21337981) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-570655809 : Rat) / 21337981) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (4, 2), (13, 1), (15, 3)],
  term ((-67346280 : Rat) / 21337981) [(2, 1), (4, 2), (14, 1)],
  term ((542213064 : Rat) / 21337981) [(2, 1), (4, 2), (14, 1), (15, 2)],
  term ((-1225676493 : Rat) / 21337981) [(2, 1), (4, 2), (15, 2)],
  term ((-1566871308 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((6196525560 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 3)],
  term ((-1695174570 : Rat) / 21337981) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (14, 2), (15, 3)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (14, 3), (15, 1)],
  term ((783435654 : Rat) / 21337981) [(2, 1), (5, 1), (15, 3)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (15, 5)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((655132392 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1157413563 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (5, 2), (9, 1), (15, 3)],
  term ((309826278 : Rat) / 21337981) [(2, 1), (5, 2), (12, 1), (15, 2)],
  term ((228546090 : Rat) / 21337981) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-570655809 : Rat) / 21337981) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (5, 2), (13, 1), (15, 3)],
  term ((-67346280 : Rat) / 21337981) [(2, 1), (5, 2), (14, 1)],
  term ((542213064 : Rat) / 21337981) [(2, 1), (5, 2), (14, 1), (15, 2)],
  term ((-1225676493 : Rat) / 21337981) [(2, 1), (5, 2), (15, 2)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 3), (14, 1), (15, 1)],
  term ((-783435654 : Rat) / 21337981) [(2, 1), (5, 3), (15, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (5, 3), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (5, 3), (15, 3)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (15, 3)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((2314827126 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5612352840 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 3)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((152851221 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-245674647 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 3)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (9, 1), (14, 3), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1157413563 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (15, 5)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-309826278 : Rat) / 21337981) [(2, 1), (12, 1), (14, 2), (15, 2)],
  term ((-309826278 : Rat) / 21337981) [(2, 1), (12, 1), (15, 4)],
  term ((-1141311618 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4728674358 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((1027747989 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 3)],
  term ((-228546090 : Rat) / 21337981) [(2, 1), (13, 1), (14, 3), (15, 1)],
  term ((570655809 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (15, 5)],
  term ((-2384006706 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((-542213064 : Rat) / 21337981) [(2, 1), (14, 1), (15, 4)],
  term ((-134692560 : Rat) / 21337981) [(2, 1), (14, 2)],
  term ((2310102621 : Rat) / 21337981) [(2, 1), (14, 2), (15, 2)],
  term ((67346280 : Rat) / 21337981) [(2, 1), (14, 3)],
  term ((-542213064 : Rat) / 21337981) [(2, 1), (14, 3), (15, 2)],
  term ((1225676493 : Rat) / 21337981) [(2, 1), (15, 4)],
  term ((-579810744 : Rat) / 21337981) [(2, 2), (4, 1)],
  term ((289905372 : Rat) / 21337981) [(2, 2), (4, 2)],
  term ((289905372 : Rat) / 21337981) [(2, 2), (5, 2)],
  term ((579810744 : Rat) / 21337981) [(2, 2), (14, 1)],
  term ((-289905372 : Rat) / 21337981) [(2, 2), (14, 2)],
  term ((-289905372 : Rat) / 21337981) [(2, 2), (15, 2)],
  term ((1663046064 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((1343137104 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (14, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((1800091512 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (14, 2)],
  term ((-1171872216 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-1603332684 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1)],
  term ((150258852 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (12, 1)],
  term ((27048492 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (12, 1), (14, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3061418274 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (14, 1)],
  term ((257343894 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((1257172704 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (14, 2)],
  term ((-327566196 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (14, 2), (16, 1)],
  term ((5450573952 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (4, 1), (9, 1), (16, 1)],
  term ((2654642808 : Rat) / 21337981) [(3, 1), (4, 1), (10, 1), (11, 1)],
  term ((-1933914204 : Rat) / 21337981) [(3, 1), (4, 1), (10, 1), (15, 1)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((2654642808 : Rat) / 21337981) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-957906468 : Rat) / 21337981) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((1703042136 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1)],
  term ((-1803859902 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((839386476 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((-7915299372 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-47182734 : Rat) / 435469) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-2914615980 : Rat) / 21337981) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((3737692080 : Rat) / 21337981) [(3, 1), (4, 1), (15, 1)],
  term ((-3999042108 : Rat) / 21337981) [(3, 1), (4, 1), (15, 3)],
  term ((-831523032 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (13, 1), (15, 1)],
  term ((-671568552 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (14, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (4, 2), (5, 1), (14, 1), (16, 1)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (14, 2)],
  term ((585936108 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (15, 2)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((801666342 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1)],
  term ((-75129426 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (12, 1)],
  term ((-13524246 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (12, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (12, 1), (16, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (13, 1), (15, 1)],
  term ((1530709137 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (14, 1)],
  term ((-128671947 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((-628586352 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (14, 2)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (14, 2), (16, 1)],
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (4, 2), (10, 1), (11, 1)],
  term ((966957102 : Rat) / 21337981) [(3, 1), (4, 2), (10, 1), (15, 1)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (4, 2), (11, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (4, 2), (11, 1), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (4, 2), (11, 1), (15, 2)],
  term ((450022878 : Rat) / 21337981) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1)],
  term ((478953234 : Rat) / 21337981) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-851521068 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1)],
  term ((901929951 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-419693238 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (14, 2)],
  term ((3957649686 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (15, 2)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (4, 2), (13, 2), (15, 1)],
  term ((23591367 : Rat) / 435469) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((1457307990 : Rat) / 21337981) [(3, 1), (4, 2), (14, 2), (15, 1)],
  term ((-1868846040 : Rat) / 21337981) [(3, 1), (4, 2), (15, 1)],
  term ((1999521054 : Rat) / 21337981) [(3, 1), (4, 2), (15, 3)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((-1663046064 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1)],
  term ((1843440768 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-511614072 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2)],
  term ((314109648 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((-134532423 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-1128522960 : Rat) / 21337981) [(3, 1), (5, 1), (14, 3)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (5, 1), (14, 3), (16, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 4)],
  term ((831523032 : Rat) / 21337981) [(3, 1), (5, 1), (15, 2)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-585936108 : Rat) / 21337981) [(3, 1), (5, 1), (15, 4)],
  term ((801666342 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1)],
  term ((-75129426 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (12, 1)],
  term ((-13524246 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (12, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 1)],
  term ((1530709137 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (14, 1)],
  term ((-128671947 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((-628586352 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (14, 2)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (5, 2), (10, 1), (11, 1)],
  term ((966957102 : Rat) / 21337981) [(3, 1), (5, 2), (10, 1), (15, 1)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (5, 2), (11, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(3, 1), (5, 2), (11, 1), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (5, 2), (11, 1), (15, 2)],
  term ((450022878 : Rat) / 21337981) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1)],
  term ((478953234 : Rat) / 21337981) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-851521068 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1)],
  term ((901929951 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-419693238 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (14, 2)],
  term ((3957649686 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (5, 2), (13, 2), (15, 1)],
  term ((23591367 : Rat) / 435469) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((1457307990 : Rat) / 21337981) [(3, 1), (5, 2), (14, 2), (15, 1)],
  term ((-1868846040 : Rat) / 21337981) [(3, 1), (5, 2), (15, 1)],
  term ((1999521054 : Rat) / 21337981) [(3, 1), (5, 2), (15, 3)],
  term ((-831523032 : Rat) / 21337981) [(3, 1), (5, 3)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (5, 3), (13, 1), (15, 1)],
  term ((-671568552 : Rat) / 21337981) [(3, 1), (5, 3), (14, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (5, 3), (14, 1), (16, 1)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 3), (14, 2)],
  term ((585936108 : Rat) / 21337981) [(3, 1), (5, 3), (15, 2)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (5, 3), (16, 1)],
  term ((-150258852 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((13524246 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((48080934 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-269064846 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((13524246 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 3)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (14, 3), (16, 1)],
  term ((75129426 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((1603332684 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1)],
  term ((-6981283089 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((128671947 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((2259751932 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2)],
  term ((3353873328 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-152062146 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-6293187 : Rat) / 48167) [(3, 1), (9, 1), (14, 3)],
  term ((456238143 : Rat) / 21337981) [(3, 1), (9, 1), (14, 3), (16, 1)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (9, 1), (14, 4)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (14, 4), (16, 1)],
  term ((-801666342 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (15, 4)],
  term ((-2654642808 : Rat) / 21337981) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((1933914204 : Rat) / 21337981) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-966957102 : Rat) / 21337981) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-966957102 : Rat) / 21337981) [(3, 1), (10, 1), (15, 3)],
  term ((-1990982106 : Rat) / 21337981) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (11, 1), (14, 2)],
  term ((1990982106 : Rat) / 21337981) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-3318303510 : Rat) / 21337981) [(3, 1), (11, 1), (14, 3)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (11, 1), (14, 4)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (11, 1), (15, 4)],
  term ((957906468 : Rat) / 21337981) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-450022878 : Rat) / 21337981) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((421092522 : Rat) / 21337981) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-450022878 : Rat) / 21337981) [(3, 1), (12, 1), (14, 3), (15, 1)],
  term ((-478953234 : Rat) / 21337981) [(3, 1), (12, 1), (15, 3)],
  term ((-1703042136 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1)],
  term ((7013369421 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((2655380970 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2)],
  term ((-3537956448 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-269064846 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1741316427 : Rat) / 21337981) [(3, 1), (13, 1), (14, 3)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((419693238 : Rat) / 21337981) [(3, 1), (13, 1), (14, 4)],
  term ((851521068 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3957649686 : Rat) / 21337981) [(3, 1), (13, 1), (15, 4)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (13, 2), (15, 3)],
  term ((-3737692080 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)],
  term ((2843065125 : Rat) / 21337981) [(3, 1), (14, 1), (15, 3)],
  term ((4180800006 : Rat) / 21337981) [(3, 1), (14, 2), (15, 1)],
  term ((-3456829044 : Rat) / 21337981) [(3, 1), (14, 2), (15, 3)],
  term ((1758638997 : Rat) / 21337981) [(3, 1), (14, 3), (15, 1)],
  term ((-1457307990 : Rat) / 21337981) [(3, 1), (14, 4), (15, 1)],
  term ((1868846040 : Rat) / 21337981) [(3, 1), (15, 3)],
  term ((-1999521054 : Rat) / 21337981) [(3, 1), (15, 5)],
  term ((-86954094 : Rat) / 21337981) [(3, 2), (4, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((-6533113968 : Rat) / 21337981) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((2932930944 : Rat) / 21337981) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((15164820 : Rat) / 21337981) [(3, 2), (4, 1), (12, 1)],
  term ((-156969576 : Rat) / 21337981) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (4, 1), (13, 2)],
  term ((565602426 : Rat) / 3048283) [(3, 2), (4, 1), (14, 1)],
  term ((-241611012 : Rat) / 3048283) [(3, 2), (4, 1), (14, 2)],
  term ((4668766092 : Rat) / 21337981) [(3, 2), (4, 1), (15, 2)],
  term ((43477047 : Rat) / 21337981) [(3, 2), (4, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (4, 2), (5, 1), (13, 1)],
  term ((3266556984 : Rat) / 21337981) [(3, 2), (4, 2), (5, 1), (15, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (4, 2), (9, 1), (13, 1)],
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (4, 2), (9, 1), (15, 1)],
  term ((-7582410 : Rat) / 21337981) [(3, 2), (4, 2), (12, 1)],
  term ((78484788 : Rat) / 21337981) [(3, 2), (4, 2), (13, 1), (15, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (4, 2), (13, 2)],
  term ((-282801213 : Rat) / 3048283) [(3, 2), (4, 2), (14, 1)],
  term ((120805506 : Rat) / 3048283) [(3, 2), (4, 2), (14, 2)],
  term ((-2334383046 : Rat) / 21337981) [(3, 2), (4, 2), (15, 2)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1), (14, 2)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((6533113968 : Rat) / 21337981) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-3266556984 : Rat) / 21337981) [(3, 2), (5, 1), (14, 2), (15, 1)],
  term ((-3266556984 : Rat) / 21337981) [(3, 2), (5, 1), (15, 3)],
  term ((43477047 : Rat) / 21337981) [(3, 2), (5, 2)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (5, 2), (9, 1), (13, 1)],
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((-7582410 : Rat) / 21337981) [(3, 2), (5, 2), (12, 1)],
  term ((78484788 : Rat) / 21337981) [(3, 2), (5, 2), (13, 1), (15, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (5, 2), (13, 2)],
  term ((-282801213 : Rat) / 3048283) [(3, 2), (5, 2), (14, 1)],
  term ((120805506 : Rat) / 3048283) [(3, 2), (5, 2), (14, 2)],
  term ((-2334383046 : Rat) / 21337981) [(3, 2), (5, 2), (15, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (5, 3), (13, 1)],
  term ((3266556984 : Rat) / 21337981) [(3, 2), (5, 3), (15, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (15, 3)],
  term ((-15164820 : Rat) / 21337981) [(3, 2), (12, 1), (14, 1)],
  term ((7582410 : Rat) / 21337981) [(3, 2), (12, 1), (14, 2)],
  term ((7582410 : Rat) / 21337981) [(3, 2), (12, 1), (15, 2)],
  term ((156969576 : Rat) / 21337981) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-78484788 : Rat) / 21337981) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((-78484788 : Rat) / 21337981) [(3, 2), (13, 1), (15, 3)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (13, 2), (14, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (13, 2), (14, 2)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (13, 2), (15, 2)],
  term ((86954094 : Rat) / 21337981) [(3, 2), (14, 1)],
  term ((-2689157601 : Rat) / 21337981) [(3, 2), (14, 1), (15, 2)],
  term ((-4002694029 : Rat) / 21337981) [(3, 2), (14, 2)],
  term ((1488744504 : Rat) / 21337981) [(3, 2), (14, 2), (15, 2)],
  term ((524412225 : Rat) / 3048283) [(3, 2), (14, 3)],
  term ((-120805506 : Rat) / 3048283) [(3, 2), (14, 4)],
  term ((-43477047 : Rat) / 21337981) [(3, 2), (15, 2)],
  term ((2334383046 : Rat) / 21337981) [(3, 2), (15, 4)],
  term ((606592800 : Rat) / 21337981) [(3, 3), (4, 1), (15, 1)],
  term ((-303296400 : Rat) / 21337981) [(3, 3), (4, 2), (15, 1)],
  term ((-303296400 : Rat) / 21337981) [(3, 3), (5, 2), (15, 1)],
  term ((-606592800 : Rat) / 21337981) [(3, 3), (14, 1), (15, 1)],
  term ((303296400 : Rat) / 21337981) [(3, 3), (14, 2), (15, 1)],
  term ((303296400 : Rat) / 21337981) [(3, 3), (15, 3)],
  term ((35506406 : Rat) / 21337981) [(4, 1), (5, 1), (13, 1)],
  term ((-17753203 : Rat) / 42675962) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-1858957668 : Rat) / 21337981) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-905582106 : Rat) / 21337981) [(4, 1), (5, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((3717915336 : Rat) / 21337981) [(4, 1), (5, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-88278840 : Rat) / 21337981) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-283426776 : Rat) / 21337981) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-83021005 : Rat) / 42675962) [(4, 1), (9, 1), (13, 1)],
  term ((12008193 : Rat) / 21337981) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((35506406 : Rat) / 21337981) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((2800346250 : Rat) / 21337981) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-285929550 : Rat) / 21337981) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-71077572 : Rat) / 3048283) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((1053701265 : Rat) / 21337981) [(4, 1), (9, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(4, 1), (9, 1), (15, 3)],
  term ((552797961 : Rat) / 42675962) [(4, 1), (9, 2)],
  term ((12008193 : Rat) / 21337981) [(4, 1), (9, 2), (12, 1)],
  term ((-294411270 : Rat) / 21337981) [(4, 1), (9, 2), (14, 1)],
  term ((348102729 : Rat) / 21337981) [(4, 1), (10, 1)],
  term ((-197559972 : Rat) / 3048283) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((798392160 : Rat) / 21337981) [(4, 1), (10, 1), (15, 2)],
  term ((98779986 : Rat) / 3048283) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-197559972 : Rat) / 3048283) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(4, 1), (11, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(4, 2), (5, 1), (13, 1)],
  term ((17753203 : Rat) / 85351924) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((929478834 : Rat) / 21337981) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(4, 2), (5, 1), (14, 2), (15, 1)],
  term ((452791053 : Rat) / 21337981) [(4, 2), (5, 1), (15, 1)],
  term ((-142964775 : Rat) / 85351924) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1858957668 : Rat) / 21337981) [(4, 2), (5, 1), (15, 3)],
  term ((17753203 : Rat) / 42675962) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((44139420 : Rat) / 21337981) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((141713388 : Rat) / 21337981) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((83021005 : Rat) / 85351924) [(4, 2), (9, 1), (13, 1)],
  term ((-12008193 : Rat) / 42675962) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-17753203 : Rat) / 21337981) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1400173125 : Rat) / 21337981) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35538786 : Rat) / 3048283) [(4, 2), (9, 1), (14, 2), (15, 1)],
  term ((-1053701265 : Rat) / 42675962) [(4, 2), (9, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(4, 2), (9, 1), (15, 3)],
  term ((-552797961 : Rat) / 85351924) [(4, 2), (9, 2)],
  term ((-12008193 : Rat) / 42675962) [(4, 2), (9, 2), (12, 1)],
  term ((147205635 : Rat) / 21337981) [(4, 2), (9, 2), (14, 1)],
  term ((-348102729 : Rat) / 42675962) [(4, 2), (10, 1)],
  term ((98779986 : Rat) / 3048283) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-399196080 : Rat) / 21337981) [(4, 2), (10, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(4, 2), (11, 1), (15, 3)],
  term ((-35506406 : Rat) / 21337981) [(5, 1), (13, 1), (14, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(5, 1), (13, 1), (14, 2)],
  term ((-17753203 : Rat) / 85351924) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(5, 1), (13, 1), (15, 2)],
  term ((-17753203 : Rat) / 85351924) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((905582106 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4647394170 : Rat) / 21337981) [(5, 1), (14, 1), (15, 3)],
  term ((200880945 : Rat) / 3048283) [(5, 1), (14, 2), (15, 1)],
  term ((142964775 : Rat) / 85351924) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((1239305112 : Rat) / 21337981) [(5, 1), (14, 2), (15, 3)],
  term ((309826278 : Rat) / 21337981) [(5, 1), (14, 3), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 4), (15, 1)],
  term ((-452791053 : Rat) / 21337981) [(5, 1), (15, 3)],
  term ((142964775 : Rat) / 85351924) [(5, 1), (15, 3), (16, 1)],
  term ((1858957668 : Rat) / 21337981) [(5, 1), (15, 5)],
  term ((17753203 : Rat) / 42675962) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((44139420 : Rat) / 21337981) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((141713388 : Rat) / 21337981) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((83021005 : Rat) / 85351924) [(5, 2), (9, 1), (13, 1)],
  term ((-12008193 : Rat) / 42675962) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-17753203 : Rat) / 21337981) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1400173125 : Rat) / 21337981) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35538786 : Rat) / 3048283) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((-1053701265 : Rat) / 42675962) [(5, 2), (9, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(5, 2), (9, 1), (15, 3)],
  term ((-552797961 : Rat) / 85351924) [(5, 2), (9, 2)],
  term ((-12008193 : Rat) / 42675962) [(5, 2), (9, 2), (12, 1)],
  term ((147205635 : Rat) / 21337981) [(5, 2), (9, 2), (14, 1)],
  term ((-348102729 : Rat) / 42675962) [(5, 2), (10, 1)],
  term ((98779986 : Rat) / 3048283) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-399196080 : Rat) / 21337981) [(5, 2), (10, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(5, 2), (11, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(5, 3), (13, 1)],
  term ((17753203 : Rat) / 85351924) [(5, 3), (13, 1), (16, 1)],
  term ((929478834 : Rat) / 21337981) [(5, 3), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 3), (14, 2), (15, 1)],
  term ((452791053 : Rat) / 21337981) [(5, 3), (15, 1)],
  term ((-142964775 : Rat) / 85351924) [(5, 3), (15, 1), (16, 1)],
  term ((-1858957668 : Rat) / 21337981) [(5, 3), (15, 3)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((283426776 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44139420 : Rat) / 21337981) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-53434548 : Rat) / 21337981) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44139420 : Rat) / 21337981) [(9, 1), (12, 1), (14, 3), (15, 1)],
  term ((-141713388 : Rat) / 21337981) [(9, 1), (12, 1), (15, 3)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((83021005 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1)],
  term ((12008193 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-131053777 : Rat) / 85351924) [(9, 1), (13, 1), (14, 2)],
  term ((-53259609 : Rat) / 42675962) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((12008193 : Rat) / 42675962) [(9, 1), (13, 1), (14, 3)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-83021005 : Rat) / 85351924) [(9, 1), (13, 1), (15, 2)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1053701265 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6357393573 : Rat) / 21337981) [(9, 1), (14, 1), (15, 3)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4546991235 : Rat) / 42675962) [(9, 1), (14, 2), (15, 1)],
  term ((428894325 : Rat) / 42675962) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2727381726 : Rat) / 21337981) [(9, 1), (14, 2), (15, 3)],
  term ((1897716129 : Rat) / 21337981) [(9, 1), (14, 3), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-35538786 : Rat) / 3048283) [(9, 1), (14, 4), (15, 1)],
  term ((1053701265 : Rat) / 42675962) [(9, 1), (15, 3)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (15, 3), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(9, 1), (15, 5)],
  term ((-12008193 : Rat) / 21337981) [(9, 2), (12, 1), (14, 1)],
  term ((12008193 : Rat) / 42675962) [(9, 2), (12, 1), (14, 2)],
  term ((12008193 : Rat) / 42675962) [(9, 2), (12, 1), (15, 2)],
  term ((-552797961 : Rat) / 42675962) [(9, 2), (14, 1)],
  term ((-147205635 : Rat) / 21337981) [(9, 2), (14, 1), (15, 2)],
  term ((1730443041 : Rat) / 85351924) [(9, 2), (14, 2)],
  term ((-147205635 : Rat) / 21337981) [(9, 2), (14, 3)],
  term ((552797961 : Rat) / 85351924) [(9, 2), (15, 2)],
  term ((197559972 : Rat) / 3048283) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(10, 1), (11, 1), (15, 3)],
  term ((-348102729 : Rat) / 21337981) [(10, 1), (14, 1)],
  term ((-798392160 : Rat) / 21337981) [(10, 1), (14, 1), (15, 2)],
  term ((348102729 : Rat) / 42675962) [(10, 1), (14, 2)],
  term ((399196080 : Rat) / 21337981) [(10, 1), (14, 2), (15, 2)],
  term ((348102729 : Rat) / 42675962) [(10, 1), (15, 2)],
  term ((399196080 : Rat) / 21337981) [(10, 1), (15, 4)],
  term ((148169979 : Rat) / 3048283) [(11, 1), (14, 1), (15, 3)],
  term ((-98779986 : Rat) / 3048283) [(11, 1), (14, 2), (15, 1)],
  term ((-148169979 : Rat) / 3048283) [(11, 1), (14, 2), (15, 3)],
  term ((246949965 : Rat) / 3048283) [(11, 1), (14, 3), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(11, 1), (14, 4), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 100 through 199. -/
theorem rs_R009_ueqv_R009YYYNN_block_05_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_05_0100_0199
      rs_R009_ueqv_R009YYYNN_block_05_0100_0199 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
