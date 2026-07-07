/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:2100-2199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_2100_2199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 2100 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2100 : Poly :=
[
  term ((2048 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2100 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2100 : Poly :=
[
  term ((-2048 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((4096 : Rat) / 35) [(7, 1), (8, 2), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2100 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2100_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2100
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2100 := by
  native_decide

/-- Coefficient term 2101 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2101 : Poly :=
[
  term ((-1664 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 2101 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2101 : Poly :=
[
  term ((1664 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3328 : Rat) / 35) [(7, 1), (8, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2101 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2101_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2101
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2101 := by
  native_decide

/-- Coefficient term 2102 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2102 : Poly :=
[
  term ((9209 : Rat) / 105) [(7, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 2102 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2102 : Poly :=
[
  term ((-9209 : Rat) / 105) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((18418 : Rat) / 105) [(7, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2102 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2102_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2102
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2102 := by
  native_decide

/-- Coefficient term 2103 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2103 : Poly :=
[
  term ((-379 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 2103 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2103 : Poly :=
[
  term ((379 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-758 : Rat) / 35) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2103 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2103_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2103
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2103 := by
  native_decide

/-- Coefficient term 2104 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2104 : Poly :=
[
  term ((-8125416 : Rat) / 53375) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 2104 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2104 : Poly :=
[
  term ((8125416 : Rat) / 53375) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-16250832 : Rat) / 53375) [(7, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2104 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2104_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2104
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2104 := by
  native_decide

/-- Coefficient term 2105 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2105 : Poly :=
[
  term ((6528 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2105 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2105 : Poly :=
[
  term ((-6528 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((13056 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2105 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2105_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2105
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2105 := by
  native_decide

/-- Coefficient term 2106 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2106 : Poly :=
[
  term ((-2176 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2106 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2106 : Poly :=
[
  term ((2176 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4352 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2106 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2106_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2106
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2106 := by
  native_decide

/-- Coefficient term 2107 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2107 : Poly :=
[
  term ((1768 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2107 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2107 : Poly :=
[
  term ((-1768 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((3536 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2107 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2107_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2107
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2107 := by
  native_decide

/-- Coefficient term 2108 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2108 : Poly :=
[
  term ((-6137 : Rat) / 700) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 2108 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2108 : Poly :=
[
  term ((6137 : Rat) / 700) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-6137 : Rat) / 350) [(7, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2108 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2108_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2108
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2108 := by
  native_decide

/-- Coefficient term 2109 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2109 : Poly :=
[
  term ((137 : Rat) / 28) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2109 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2109 : Poly :=
[
  term ((-137 : Rat) / 28) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((137 : Rat) / 14) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2109 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2109_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2109
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2109 := by
  native_decide

/-- Coefficient term 2110 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2110 : Poly :=
[
  term ((745756 : Rat) / 53375) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 2110 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2110 : Poly :=
[
  term ((-745756 : Rat) / 53375) [(7, 1), (8, 1), (13, 1)],
  term ((1491512 : Rat) / 53375) [(7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2110 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2110_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2110
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2110 := by
  native_decide

/-- Coefficient term 2111 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2111 : Poly :=
[
  term ((-60 : Rat) / 7) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 2111 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2111 : Poly :=
[
  term ((60 : Rat) / 7) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-120 : Rat) / 7) [(7, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2111 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2111_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2111
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2111 := by
  native_decide

/-- Coefficient term 2112 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2112 : Poly :=
[
  term ((352 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2112 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2112 : Poly :=
[
  term ((-352 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((704 : Rat) / 35) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2112 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2112_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2112
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2112 := by
  native_decide

/-- Coefficient term 2113 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2113 : Poly :=
[
  term ((-202 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 2113 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2113 : Poly :=
[
  term ((202 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-404 : Rat) / 35) [(7, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2113 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2113_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2113
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2113 := by
  native_decide

/-- Coefficient term 2114 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2114 : Poly :=
[
  term ((-15223 : Rat) / 840) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 2114 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2114 : Poly :=
[
  term ((15223 : Rat) / 840) [(7, 1), (8, 1), (15, 1)],
  term ((-15223 : Rat) / 420) [(7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2114 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2114_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2114
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2114 := by
  native_decide

/-- Coefficient term 2115 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2115 : Poly :=
[
  term ((-459 : Rat) / 280) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 2115 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2115 : Poly :=
[
  term ((459 : Rat) / 280) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-459 : Rat) / 140) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2115 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2115_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2115
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2115 := by
  native_decide

/-- Coefficient term 2116 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2116 : Poly :=
[
  term ((-18 : Rat) / 5) [(7, 1), (9, 1)]
]

/-- Partial product 2116 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2116 : Poly :=
[
  term ((-36 : Rat) / 5) [(7, 1), (8, 1), (9, 1)],
  term ((18 : Rat) / 5) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2116 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2116_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2116
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2116 := by
  native_decide

/-- Coefficient term 2117 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2117 : Poly :=
[
  term ((-9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2117 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2117 : Poly :=
[
  term ((-19067264 : Rat) / 53375) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2117 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2117_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2117
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2117 := by
  native_decide

/-- Coefficient term 2118 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2118 : Poly :=
[
  term ((1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2118 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2118 : Poly :=
[
  term ((3072 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2118 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2118_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2118
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2118 := by
  native_decide

/-- Coefficient term 2119 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2119 : Poly :=
[
  term ((-512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2119 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2119 : Poly :=
[
  term ((-1024 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2119 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2119_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2119
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2119 := by
  native_decide

/-- Coefficient term 2120 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2120 : Poly :=
[
  term ((416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2120 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2120 : Poly :=
[
  term ((832 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2120 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2120_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2120
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2120 := by
  native_decide

/-- Coefficient term 2121 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2121 : Poly :=
[
  term ((-12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2121 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2121 : Poly :=
[
  term ((-25574 : Rat) / 105) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2121 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2121_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2121
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2121 := by
  native_decide

/-- Coefficient term 2122 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2122 : Poly :=
[
  term ((521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2122 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2122 : Poly :=
[
  term ((1042 : Rat) / 35) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2122 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2122_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2122
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2122 := by
  native_decide

/-- Coefficient term 2123 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2123 : Poly :=
[
  term ((-9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 2123 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2123 : Poly :=
[
  term ((-19067264 : Rat) / 53375) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2123 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2123_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2123
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2123 := by
  native_decide

/-- Coefficient term 2124 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2124 : Poly :=
[
  term ((1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2124 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2124 : Poly :=
[
  term ((3072 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2124 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2124_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2124
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2124 := by
  native_decide

/-- Coefficient term 2125 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2125 : Poly :=
[
  term ((-512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2125 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2125 : Poly :=
[
  term ((-1024 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2125 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2125_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2125
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2125 := by
  native_decide

/-- Coefficient term 2126 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2126 : Poly :=
[
  term ((416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2126 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2126 : Poly :=
[
  term ((832 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2126 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2126_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2126
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2126 := by
  native_decide

/-- Coefficient term 2127 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2127 : Poly :=
[
  term ((-12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 2127 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2127 : Poly :=
[
  term ((-25574 : Rat) / 105) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2127 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2127_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2127
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2127 := by
  native_decide

/-- Coefficient term 2128 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2128 : Poly :=
[
  term ((521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2128 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2128 : Poly :=
[
  term ((1042 : Rat) / 35) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2128 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2128_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2128
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2128 := by
  native_decide

/-- Coefficient term 2129 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2129 : Poly :=
[
  term ((-18 : Rat) / 5) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 2129 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2129 : Poly :=
[
  term ((-36 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((18 : Rat) / 5) [(7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2129 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2129_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2129
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2129 := by
  native_decide

/-- Coefficient term 2130 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2130 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 2130 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2130 : Poly :=
[
  term ((24 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2130 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2130_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2130
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2130 := by
  native_decide

/-- Coefficient term 2131 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2131 : Poly :=
[
  term ((-6 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 2131 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2131 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2131 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2131_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2131
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2131 := by
  native_decide

/-- Coefficient term 2132 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2132 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 2132 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2132 : Poly :=
[
  term ((24 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2132 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2132_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2132
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2132 := by
  native_decide

/-- Coefficient term 2133 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2133 : Poly :=
[
  term ((-6 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 2133 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2133 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2133 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2133_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2133
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2133 := by
  native_decide

/-- Coefficient term 2134 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2134 : Poly :=
[
  term ((5472 : Rat) / 7625) [(7, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 2134 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2134 : Poly :=
[
  term ((10944 : Rat) / 7625) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(7, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2134 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2134_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2134
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2134 := by
  native_decide

/-- Coefficient term 2135 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2135 : Poly :=
[
  term ((-81 : Rat) / 10) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 2135 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2135 : Poly :=
[
  term ((-81 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((81 : Rat) / 10) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2135 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2135_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2135
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2135 := by
  native_decide

/-- Coefficient term 2136 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2136 : Poly :=
[
  term ((9 : Rat) / 10) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 2136 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2136 : Poly :=
[
  term ((9 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2136 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2136_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2136
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2136 := by
  native_decide

/-- Coefficient term 2137 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2137 : Poly :=
[
  term ((-51148 : Rat) / 105) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2137 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2137 : Poly :=
[
  term ((-102296 : Rat) / 105) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((51148 : Rat) / 105) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2137 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2137_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2137
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2137 := by
  native_decide

/-- Coefficient term 2138 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2138 : Poly :=
[
  term ((2084 : Rat) / 35) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2138 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2138 : Poly :=
[
  term ((4168 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2084 : Rat) / 35) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2138 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2138_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2138
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2138 := by
  native_decide

/-- Coefficient term 2139 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2139 : Poly :=
[
  term ((-38134528 : Rat) / 53375) [(7, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 2139 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2139 : Poly :=
[
  term ((-76269056 : Rat) / 53375) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((38134528 : Rat) / 53375) [(7, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2139 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2139_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2139
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2139 := by
  native_decide

/-- Coefficient term 2140 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2140 : Poly :=
[
  term ((6144 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 2140 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2140 : Poly :=
[
  term ((12288 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-6144 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2140 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2140_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2140
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2140 := by
  native_decide

/-- Coefficient term 2141 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2141 : Poly :=
[
  term ((-2048 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2141 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2141 : Poly :=
[
  term ((-4096 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2048 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2141 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2141_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2141
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2141 := by
  native_decide

/-- Coefficient term 2142 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2142 : Poly :=
[
  term ((1664 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 2142 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2142 : Poly :=
[
  term ((3328 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2142 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2142_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2142
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2142 := by
  native_decide

/-- Coefficient term 2143 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2143 : Poly :=
[
  term ((-36572 : Rat) / 105) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 2143 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2143 : Poly :=
[
  term ((-73144 : Rat) / 105) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((36572 : Rat) / 105) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2143 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2143_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2143
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2143 := by
  native_decide

/-- Coefficient term 2144 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2144 : Poly :=
[
  term ((1492 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2144 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2144 : Poly :=
[
  term ((2984 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1492 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2144 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2144_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2144
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2144 := by
  native_decide

/-- Coefficient term 2145 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2145 : Poly :=
[
  term ((-27659024 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)]
]

/-- Partial product 2145 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2145 : Poly :=
[
  term ((-55318048 : Rat) / 53375) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((27659024 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2145 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2145_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2145
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2145 := by
  native_decide

/-- Coefficient term 2146 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2146 : Poly :=
[
  term ((22272 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 2146 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2146 : Poly :=
[
  term ((44544 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-22272 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2146 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2146_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2146
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2146 := by
  native_decide

/-- Coefficient term 2147 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2147 : Poly :=
[
  term ((-7424 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2147 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2147 : Poly :=
[
  term ((-14848 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7424 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2147 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2147_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2147
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2147 := by
  native_decide

/-- Coefficient term 2148 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2148 : Poly :=
[
  term ((6032 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 2148 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2148 : Poly :=
[
  term ((12064 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6032 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2148 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2148_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2148
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2148 := by
  native_decide

/-- Coefficient term 2149 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2149 : Poly :=
[
  term ((62704 : Rat) / 875) [(7, 1), (11, 2), (13, 1)]
]

/-- Partial product 2149 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2149 : Poly :=
[
  term ((125408 : Rat) / 875) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-62704 : Rat) / 875) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2149 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2149_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2149
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2149 := by
  native_decide

/-- Coefficient term 2150 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2150 : Poly :=
[
  term ((-3072 : Rat) / 35) [(7, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 2150 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2150 : Poly :=
[
  term ((-6144 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((3072 : Rat) / 35) [(7, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2150 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2150_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2150
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2150 := by
  native_decide

/-- Coefficient term 2151 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2151 : Poly :=
[
  term ((1024 : Rat) / 35) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2151 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2151 : Poly :=
[
  term ((2048 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 35) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2151 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2151_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2151
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2151 := by
  native_decide

/-- Coefficient term 2152 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2152 : Poly :=
[
  term ((-832 : Rat) / 35) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 2152 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2152 : Poly :=
[
  term ((-1664 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((832 : Rat) / 35) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2152 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2152_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2152
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2152 := by
  native_decide

/-- Coefficient term 2153 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2153 : Poly :=
[
  term ((9209 : Rat) / 210) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 2153 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2153 : Poly :=
[
  term ((9209 : Rat) / 105) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-9209 : Rat) / 210) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2153 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2153_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2153
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2153 := by
  native_decide

/-- Coefficient term 2154 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2154 : Poly :=
[
  term ((-379 : Rat) / 70) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 2154 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2154 : Poly :=
[
  term ((-379 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((379 : Rat) / 70) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2154 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2154_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2154
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2154 := by
  native_decide

/-- Coefficient term 2155 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2155 : Poly :=
[
  term ((-15925272 : Rat) / 53375) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 2155 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2155 : Poly :=
[
  term ((-31850544 : Rat) / 53375) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((15925272 : Rat) / 53375) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2155 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2155_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2155
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2155 := by
  native_decide

/-- Coefficient term 2156 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2156 : Poly :=
[
  term ((9816 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2156 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2156 : Poly :=
[
  term ((19632 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9816 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2156 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2156_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2156
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2156 := by
  native_decide

/-- Coefficient term 2157 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2157 : Poly :=
[
  term ((-128 : Rat) / 7) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2157 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2157 : Poly :=
[
  term ((-256 : Rat) / 7) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 7) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2157 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2157_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2157
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2157 := by
  native_decide

/-- Coefficient term 2158 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2158 : Poly :=
[
  term ((352 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2158 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2158 : Poly :=
[
  term ((704 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-352 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2158 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2158_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2158
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2158 := by
  native_decide

/-- Coefficient term 2159 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2159 : Poly :=
[
  term ((-50773 : Rat) / 1050) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 2159 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2159 : Poly :=
[
  term ((-50773 : Rat) / 525) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((50773 : Rat) / 1050) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2159 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2159_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2159
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2159 := by
  native_decide

/-- Coefficient term 2160 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2160 : Poly :=
[
  term ((71 : Rat) / 14) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2160 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2160 : Poly :=
[
  term ((71 : Rat) / 7) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-71 : Rat) / 14) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2160 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2160_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2160
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2160 := by
  native_decide

/-- Coefficient term 2161 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2161 : Poly :=
[
  term ((2091752 : Rat) / 10675) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 2161 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2161 : Poly :=
[
  term ((4183504 : Rat) / 10675) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-2091752 : Rat) / 10675) [(7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2161 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2161_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2161
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2161 := by
  native_decide

/-- Coefficient term 2162 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2162 : Poly :=
[
  term ((-8448 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 2162 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2162 : Poly :=
[
  term ((-16896 : Rat) / 35) [(7, 1), (8, 1), (12, 2), (13, 1), (14, 1)],
  term ((8448 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2162 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2162_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2162
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2162 := by
  native_decide

/-- Coefficient term 2163 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2163 : Poly :=
[
  term ((2816 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2163 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2163 : Poly :=
[
  term ((5632 : Rat) / 35) [(7, 1), (8, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2163 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2163_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2163
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2163 := by
  native_decide

/-- Coefficient term 2164 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2164 : Poly :=
[
  term ((-2288 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 2164 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2164 : Poly :=
[
  term ((-4576 : Rat) / 35) [(7, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2164 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2164_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2164
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2164 := by
  native_decide

/-- Coefficient term 2165 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2165 : Poly :=
[
  term ((41173 : Rat) / 1050) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 2165 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2165 : Poly :=
[
  term ((41173 : Rat) / 525) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-41173 : Rat) / 1050) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2165 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2165_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2165
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2165 := by
  native_decide

/-- Coefficient term 2166 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2166 : Poly :=
[
  term ((-603 : Rat) / 70) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 2166 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2166 : Poly :=
[
  term ((-603 : Rat) / 35) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((603 : Rat) / 70) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2166 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2166_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2166
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2166 := by
  native_decide

/-- Coefficient term 2167 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2167 : Poly :=
[
  term ((306578 : Rat) / 10675) [(7, 1), (13, 1)]
]

/-- Partial product 2167 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2167 : Poly :=
[
  term ((613156 : Rat) / 10675) [(7, 1), (8, 1), (13, 1)],
  term ((-306578 : Rat) / 10675) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2167 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2167_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2167
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2167 := by
  native_decide

/-- Coefficient term 2168 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2168 : Poly :=
[
  term ((-1662 : Rat) / 35) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 2168 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2168 : Poly :=
[
  term ((-3324 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((1662 : Rat) / 35) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2168 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2168_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2168
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2168 := by
  native_decide

/-- Coefficient term 2169 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2169 : Poly :=
[
  term ((624 : Rat) / 35) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2169 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2169 : Poly :=
[
  term ((1248 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2169 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2169_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2169
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2169 := by
  native_decide

/-- Coefficient term 2170 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2170 : Poly :=
[
  term ((-633 : Rat) / 35) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 2170 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2170 : Poly :=
[
  term ((-1266 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((633 : Rat) / 35) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2170 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2170_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2170
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2170 := by
  native_decide

/-- Coefficient term 2171 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2171 : Poly :=
[
  term ((7219 : Rat) / 1680) [(7, 1), (15, 1)]
]

/-- Partial product 2171 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2171 : Poly :=
[
  term ((7219 : Rat) / 840) [(7, 1), (8, 1), (15, 1)],
  term ((-7219 : Rat) / 1680) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2171 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2171_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2171
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2171 := by
  native_decide

/-- Coefficient term 2172 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2172 : Poly :=
[
  term ((-1257 : Rat) / 560) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 2172 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2172 : Poly :=
[
  term ((-1257 : Rat) / 280) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1257 : Rat) / 560) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2172 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2172_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2172
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2172 := by
  native_decide

/-- Coefficient term 2173 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2173 : Poly :=
[
  term ((9 : Rat) / 5) [(7, 2)]
]

/-- Partial product 2173 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2173 : Poly :=
[
  term ((-9 : Rat) / 5) [(7, 2)],
  term ((18 : Rat) / 5) [(7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2173 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2173_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2173
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2173 := by
  native_decide

/-- Coefficient term 2174 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2174 : Poly :=
[
  term ((-6 : Rat) / 5) [(7, 2), (8, 1)]
]

/-- Partial product 2174 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2174 : Poly :=
[
  term ((6 : Rat) / 5) [(7, 2), (8, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2174 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2174_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2174
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2174 := by
  native_decide

/-- Coefficient term 2175 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2175 : Poly :=
[
  term ((-9533632 : Rat) / 53375) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 2175 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2175 : Poly :=
[
  term ((9533632 : Rat) / 53375) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2175 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2175_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2175
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2175 := by
  native_decide

/-- Coefficient term 2176 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2176 : Poly :=
[
  term ((1536 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2176 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2176 : Poly :=
[
  term ((-1536 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2176 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2176_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2176
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2176 := by
  native_decide

/-- Coefficient term 2177 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2177 : Poly :=
[
  term ((-512 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2177 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2177 : Poly :=
[
  term ((512 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2177 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2177_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2177
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2177 := by
  native_decide

/-- Coefficient term 2178 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2178 : Poly :=
[
  term ((416 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2178 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2178 : Poly :=
[
  term ((-416 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2178 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2178_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2178
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2178 := by
  native_decide

/-- Coefficient term 2179 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2179 : Poly :=
[
  term ((-12787 : Rat) / 105) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 2179 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2179 : Poly :=
[
  term ((12787 : Rat) / 105) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2179 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2179_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2179
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2179 := by
  native_decide

/-- Coefficient term 2180 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2180 : Poly :=
[
  term ((521 : Rat) / 35) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2180 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2180 : Poly :=
[
  term ((-521 : Rat) / 35) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2180 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2180_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2180
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2180 := by
  native_decide

/-- Coefficient term 2181 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2181 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 2), (8, 1), (14, 1)]
]

/-- Partial product 2181 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2181 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 2), (8, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2181 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2181_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2181
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2181 := by
  native_decide

/-- Coefficient term 2182 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2182 : Poly :=
[
  term ((-6 : Rat) / 5) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 2182 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2182 : Poly :=
[
  term ((6 : Rat) / 5) [(7, 2), (8, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2182 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2182_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2182
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2182 := by
  native_decide

/-- Coefficient term 2183 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2183 : Poly :=
[
  term ((19067264 : Rat) / 53375) [(7, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2183 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2183 : Poly :=
[
  term ((38134528 : Rat) / 53375) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2183 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2183_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2183
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2183 := by
  native_decide

/-- Coefficient term 2184 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2184 : Poly :=
[
  term ((-3072 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2184 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2184 : Poly :=
[
  term ((-6144 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2184 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2184_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2184
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2184 := by
  native_decide

/-- Coefficient term 2185 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2185 : Poly :=
[
  term ((1024 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2185 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2185 : Poly :=
[
  term ((2048 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2185 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2185_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2185
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2185 := by
  native_decide

/-- Coefficient term 2186 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2186 : Poly :=
[
  term ((-832 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2186 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2186 : Poly :=
[
  term ((-1664 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2186 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2186_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2186
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2186 := by
  native_decide

/-- Coefficient term 2187 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2187 : Poly :=
[
  term ((25574 : Rat) / 105) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2187 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2187 : Poly :=
[
  term ((51148 : Rat) / 105) [(7, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2187 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2187_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2187
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2187 := by
  native_decide

/-- Coefficient term 2188 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2188 : Poly :=
[
  term ((-1042 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2188 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2188 : Poly :=
[
  term ((-2084 : Rat) / 35) [(7, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2188 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2188_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2188
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2188 := by
  native_decide

/-- Coefficient term 2189 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2189 : Poly :=
[
  term ((14300448 : Rat) / 53375) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 2189 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2189 : Poly :=
[
  term ((28600896 : Rat) / 53375) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-14300448 : Rat) / 53375) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2189 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2189_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2189
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2189 := by
  native_decide

/-- Coefficient term 2190 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2190 : Poly :=
[
  term ((-2304 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2190 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2190 : Poly :=
[
  term ((-4608 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((2304 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2190 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2190_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2190
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2190 := by
  native_decide

/-- Coefficient term 2191 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2191 : Poly :=
[
  term ((768 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2191 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2191 : Poly :=
[
  term ((1536 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2191 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2191_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2191
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2191 := by
  native_decide

/-- Coefficient term 2192 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2192 : Poly :=
[
  term ((-624 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2192 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2192 : Poly :=
[
  term ((-1248 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((624 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2192 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2192_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2192
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2192 := by
  native_decide

/-- Coefficient term 2193 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2193 : Poly :=
[
  term ((12787 : Rat) / 70) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 2193 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2193 : Poly :=
[
  term ((12787 : Rat) / 35) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-12787 : Rat) / 70) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2193 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2193_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2193
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2193 := by
  native_decide

/-- Coefficient term 2194 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2194 : Poly :=
[
  term ((-1563 : Rat) / 70) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2194 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2194 : Poly :=
[
  term ((-1563 : Rat) / 35) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1563 : Rat) / 70) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2194 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2194_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2194
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2194 := by
  native_decide

/-- Coefficient term 2195 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2195 : Poly :=
[
  term ((628 : Rat) / 5) [(7, 2), (12, 1)]
]

/-- Partial product 2195 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2195 : Poly :=
[
  term ((1256 : Rat) / 5) [(7, 2), (8, 1), (12, 1)],
  term ((-628 : Rat) / 5) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2195 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2195_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2195
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2195 := by
  native_decide

/-- Coefficient term 2196 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2196 : Poly :=
[
  term ((-552 : Rat) / 5) [(7, 2), (12, 1), (14, 1)]
]

/-- Partial product 2196 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2196 : Poly :=
[
  term ((-1104 : Rat) / 5) [(7, 2), (8, 1), (12, 1), (14, 1)],
  term ((552 : Rat) / 5) [(7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2196 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2196_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2196
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2196 := by
  native_decide

/-- Coefficient term 2197 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2197 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 2197 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2197 : Poly :=
[
  term ((24 : Rat) / 5) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2197 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2197_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2197
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2197 := by
  native_decide

/-- Coefficient term 2198 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2198 : Poly :=
[
  term ((18 : Rat) / 5) [(7, 2), (14, 1)]
]

/-- Partial product 2198 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2198 : Poly :=
[
  term ((36 : Rat) / 5) [(7, 2), (8, 1), (14, 1)],
  term ((-18 : Rat) / 5) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2198 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2198_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2198
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2198 := by
  native_decide

/-- Coefficient term 2199 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2199 : Poly :=
[
  term ((9 : Rat) / 5) [(7, 2), (16, 1)]
]

/-- Partial product 2199 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2199 : Poly :=
[
  term ((18 : Rat) / 5) [(7, 2), (8, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2199 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2199_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2199
        rs_R003_ueqv_R003YY_generator_19_2100_2199 =
      rs_R003_ueqv_R003YY_partial_19_2199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_2100_2199 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_2100,
  rs_R003_ueqv_R003YY_partial_19_2101,
  rs_R003_ueqv_R003YY_partial_19_2102,
  rs_R003_ueqv_R003YY_partial_19_2103,
  rs_R003_ueqv_R003YY_partial_19_2104,
  rs_R003_ueqv_R003YY_partial_19_2105,
  rs_R003_ueqv_R003YY_partial_19_2106,
  rs_R003_ueqv_R003YY_partial_19_2107,
  rs_R003_ueqv_R003YY_partial_19_2108,
  rs_R003_ueqv_R003YY_partial_19_2109,
  rs_R003_ueqv_R003YY_partial_19_2110,
  rs_R003_ueqv_R003YY_partial_19_2111,
  rs_R003_ueqv_R003YY_partial_19_2112,
  rs_R003_ueqv_R003YY_partial_19_2113,
  rs_R003_ueqv_R003YY_partial_19_2114,
  rs_R003_ueqv_R003YY_partial_19_2115,
  rs_R003_ueqv_R003YY_partial_19_2116,
  rs_R003_ueqv_R003YY_partial_19_2117,
  rs_R003_ueqv_R003YY_partial_19_2118,
  rs_R003_ueqv_R003YY_partial_19_2119,
  rs_R003_ueqv_R003YY_partial_19_2120,
  rs_R003_ueqv_R003YY_partial_19_2121,
  rs_R003_ueqv_R003YY_partial_19_2122,
  rs_R003_ueqv_R003YY_partial_19_2123,
  rs_R003_ueqv_R003YY_partial_19_2124,
  rs_R003_ueqv_R003YY_partial_19_2125,
  rs_R003_ueqv_R003YY_partial_19_2126,
  rs_R003_ueqv_R003YY_partial_19_2127,
  rs_R003_ueqv_R003YY_partial_19_2128,
  rs_R003_ueqv_R003YY_partial_19_2129,
  rs_R003_ueqv_R003YY_partial_19_2130,
  rs_R003_ueqv_R003YY_partial_19_2131,
  rs_R003_ueqv_R003YY_partial_19_2132,
  rs_R003_ueqv_R003YY_partial_19_2133,
  rs_R003_ueqv_R003YY_partial_19_2134,
  rs_R003_ueqv_R003YY_partial_19_2135,
  rs_R003_ueqv_R003YY_partial_19_2136,
  rs_R003_ueqv_R003YY_partial_19_2137,
  rs_R003_ueqv_R003YY_partial_19_2138,
  rs_R003_ueqv_R003YY_partial_19_2139,
  rs_R003_ueqv_R003YY_partial_19_2140,
  rs_R003_ueqv_R003YY_partial_19_2141,
  rs_R003_ueqv_R003YY_partial_19_2142,
  rs_R003_ueqv_R003YY_partial_19_2143,
  rs_R003_ueqv_R003YY_partial_19_2144,
  rs_R003_ueqv_R003YY_partial_19_2145,
  rs_R003_ueqv_R003YY_partial_19_2146,
  rs_R003_ueqv_R003YY_partial_19_2147,
  rs_R003_ueqv_R003YY_partial_19_2148,
  rs_R003_ueqv_R003YY_partial_19_2149,
  rs_R003_ueqv_R003YY_partial_19_2150,
  rs_R003_ueqv_R003YY_partial_19_2151,
  rs_R003_ueqv_R003YY_partial_19_2152,
  rs_R003_ueqv_R003YY_partial_19_2153,
  rs_R003_ueqv_R003YY_partial_19_2154,
  rs_R003_ueqv_R003YY_partial_19_2155,
  rs_R003_ueqv_R003YY_partial_19_2156,
  rs_R003_ueqv_R003YY_partial_19_2157,
  rs_R003_ueqv_R003YY_partial_19_2158,
  rs_R003_ueqv_R003YY_partial_19_2159,
  rs_R003_ueqv_R003YY_partial_19_2160,
  rs_R003_ueqv_R003YY_partial_19_2161,
  rs_R003_ueqv_R003YY_partial_19_2162,
  rs_R003_ueqv_R003YY_partial_19_2163,
  rs_R003_ueqv_R003YY_partial_19_2164,
  rs_R003_ueqv_R003YY_partial_19_2165,
  rs_R003_ueqv_R003YY_partial_19_2166,
  rs_R003_ueqv_R003YY_partial_19_2167,
  rs_R003_ueqv_R003YY_partial_19_2168,
  rs_R003_ueqv_R003YY_partial_19_2169,
  rs_R003_ueqv_R003YY_partial_19_2170,
  rs_R003_ueqv_R003YY_partial_19_2171,
  rs_R003_ueqv_R003YY_partial_19_2172,
  rs_R003_ueqv_R003YY_partial_19_2173,
  rs_R003_ueqv_R003YY_partial_19_2174,
  rs_R003_ueqv_R003YY_partial_19_2175,
  rs_R003_ueqv_R003YY_partial_19_2176,
  rs_R003_ueqv_R003YY_partial_19_2177,
  rs_R003_ueqv_R003YY_partial_19_2178,
  rs_R003_ueqv_R003YY_partial_19_2179,
  rs_R003_ueqv_R003YY_partial_19_2180,
  rs_R003_ueqv_R003YY_partial_19_2181,
  rs_R003_ueqv_R003YY_partial_19_2182,
  rs_R003_ueqv_R003YY_partial_19_2183,
  rs_R003_ueqv_R003YY_partial_19_2184,
  rs_R003_ueqv_R003YY_partial_19_2185,
  rs_R003_ueqv_R003YY_partial_19_2186,
  rs_R003_ueqv_R003YY_partial_19_2187,
  rs_R003_ueqv_R003YY_partial_19_2188,
  rs_R003_ueqv_R003YY_partial_19_2189,
  rs_R003_ueqv_R003YY_partial_19_2190,
  rs_R003_ueqv_R003YY_partial_19_2191,
  rs_R003_ueqv_R003YY_partial_19_2192,
  rs_R003_ueqv_R003YY_partial_19_2193,
  rs_R003_ueqv_R003YY_partial_19_2194,
  rs_R003_ueqv_R003YY_partial_19_2195,
  rs_R003_ueqv_R003YY_partial_19_2196,
  rs_R003_ueqv_R003YY_partial_19_2197,
  rs_R003_ueqv_R003YY_partial_19_2198,
  rs_R003_ueqv_R003YY_partial_19_2199
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_2100_2199 : Poly :=
[
  term ((-36 : Rat) / 5) [(7, 1), (8, 1), (9, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((24 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((24 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((10944 : Rat) / 7625) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-81 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((9 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-102296 : Rat) / 105) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4168 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-76269056 : Rat) / 53375) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((12288 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-4096 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3328 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-73144 : Rat) / 105) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2984 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55318048 : Rat) / 53375) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((44544 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-14848 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((12064 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((125408 : Rat) / 875) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-6144 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((-3389304 : Rat) / 7625) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((1872 : Rat) / 5) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 5) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-152 : Rat) / 5) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-26383 : Rat) / 300) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((21 : Rat) / 4) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4183504 : Rat) / 10675) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-16896 : Rat) / 35) [(7, 1), (8, 1), (12, 2), (13, 1), (14, 1)],
  term ((5632 : Rat) / 35) [(7, 1), (8, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4576 : Rat) / 35) [(7, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((41173 : Rat) / 525) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-603 : Rat) / 35) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((331432 : Rat) / 7625) [(7, 1), (8, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-152 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((1603 : Rat) / 60) [(7, 1), (8, 1), (15, 1)],
  term ((-57 : Rat) / 20) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((4096 : Rat) / 35) [(7, 1), (8, 2), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3328 : Rat) / 35) [(7, 1), (8, 2), (11, 2), (13, 1), (16, 1)],
  term ((18418 : Rat) / 105) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((-758 : Rat) / 35) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((-16250832 : Rat) / 53375) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((13056 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((-4352 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3536 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-6137 : Rat) / 350) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((137 : Rat) / 14) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((1491512 : Rat) / 53375) [(7, 1), (8, 2), (13, 1)],
  term ((-120 : Rat) / 7) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((704 : Rat) / 35) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-404 : Rat) / 35) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-15223 : Rat) / 420) [(7, 1), (8, 2), (15, 1)],
  term ((-459 : Rat) / 140) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(7, 1), (9, 1)],
  term ((9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(7, 1), (9, 1), (12, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (14, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (16, 1)],
  term ((-5472 : Rat) / 7625) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((81 : Rat) / 10) [(7, 1), (10, 1), (15, 1)],
  term ((-9 : Rat) / 10) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((51148 : Rat) / 105) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2084 : Rat) / 35) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((38134528 : Rat) / 53375) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-6144 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((2048 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((36572 : Rat) / 105) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1492 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((27659024 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)],
  term ((-22272 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((7424 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6032 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-62704 : Rat) / 875) [(7, 1), (11, 2), (13, 1)],
  term ((3072 : Rat) / 35) [(7, 1), (11, 2), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 35) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-9209 : Rat) / 210) [(7, 1), (11, 2), (15, 1)],
  term ((379 : Rat) / 70) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((15925272 : Rat) / 53375) [(7, 1), (12, 1), (13, 1)],
  term ((-9816 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 7) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-352 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((50773 : Rat) / 1050) [(7, 1), (12, 1), (15, 1)],
  term ((-71 : Rat) / 14) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2091752 : Rat) / 10675) [(7, 1), (12, 2), (13, 1)],
  term ((8448 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2816 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-41173 : Rat) / 1050) [(7, 1), (12, 2), (15, 1)],
  term ((603 : Rat) / 70) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-306578 : Rat) / 10675) [(7, 1), (13, 1)],
  term ((1662 : Rat) / 35) [(7, 1), (13, 1), (14, 1)],
  term ((-624 : Rat) / 35) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((633 : Rat) / 35) [(7, 1), (13, 1), (16, 1)],
  term ((-7219 : Rat) / 1680) [(7, 1), (15, 1)],
  term ((1257 : Rat) / 560) [(7, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(7, 2)],
  term ((24 : Rat) / 5) [(7, 2), (8, 1)],
  term ((38134528 : Rat) / 53375) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-6144 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2048 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((51148 : Rat) / 105) [(7, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2084 : Rat) / 35) [(7, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((38134528 : Rat) / 53375) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-6144 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((2048 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((51148 : Rat) / 105) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2084 : Rat) / 35) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 5) [(7, 2), (8, 1), (12, 1)],
  term ((-1104 : Rat) / 5) [(7, 2), (8, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((48 : Rat) / 5) [(7, 2), (8, 1), (14, 1)],
  term ((24 : Rat) / 5) [(7, 2), (8, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (8, 2)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (8, 2), (11, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (8, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (8, 2), (16, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14300448 : Rat) / 53375) [(7, 2), (11, 1), (13, 1)],
  term ((2304 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-12787 : Rat) / 70) [(7, 2), (11, 1), (15, 1)],
  term ((1563 : Rat) / 70) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-628 : Rat) / 5) [(7, 2), (12, 1)],
  term ((552 : Rat) / 5) [(7, 2), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (12, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(7, 2), (14, 1)],
  term ((-9 : Rat) / 5) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 2100 through 2199. -/
theorem rs_R003_ueqv_R003YY_block_19_2100_2199_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_2100_2199
      rs_R003_ueqv_R003YY_block_19_2100_2199 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
