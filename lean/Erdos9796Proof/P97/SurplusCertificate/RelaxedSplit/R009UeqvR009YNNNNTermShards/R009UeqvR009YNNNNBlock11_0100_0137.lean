/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 11:100-137

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(2, 1)],
  term (2 : Rat) [(2, 1), (6, 1)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0100 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 100 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0100 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0100
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0101 : Poly :=
[
  term ((7819657675 : Rat) / 666166368) [(9, 1), (13, 1)]
]

/-- Partial product 101 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0101 : Poly :=
[
  term ((7819657675 : Rat) / 333083184) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-7819657675 : Rat) / 333083184) [(2, 1), (9, 1), (13, 1)],
  term ((7819657675 : Rat) / 333083184) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-7819657675 : Rat) / 666166368) [(6, 2), (9, 1), (13, 1)],
  term ((-7819657675 : Rat) / 666166368) [(7, 2), (9, 1), (13, 1)],
  term ((7819657675 : Rat) / 666166368) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0101
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0102 : Poly :=
[
  term ((53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 102 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0102 : Poly :=
[
  term ((53777198303881 : Rat) / 40469606856) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0102
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0103 : Poly :=
[
  term ((725 : Rat) / 56) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 103 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0103 : Poly :=
[
  term ((725 : Rat) / 28) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 28) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 28) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 56) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 56) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 56) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0103
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0104 : Poly :=
[
  term ((-1207041584503001491 : Rat) / 626631392558304) [(9, 1), (15, 1)]
]

/-- Partial product 104 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0104 : Poly :=
[
  term ((-1207041584503001491 : Rat) / 313315696279152) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((1207041584503001491 : Rat) / 313315696279152) [(2, 1), (9, 1), (15, 1)],
  term ((-1207041584503001491 : Rat) / 313315696279152) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((1207041584503001491 : Rat) / 626631392558304) [(6, 2), (9, 1), (15, 1)],
  term ((1207041584503001491 : Rat) / 626631392558304) [(7, 2), (9, 1), (15, 1)],
  term ((-1207041584503001491 : Rat) / 626631392558304) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0104
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0105 : Poly :=
[
  term ((-443 : Rat) / 42) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0105 : Poly :=
[
  term ((-443 : Rat) / 21) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 21) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 21) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 42) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 42) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 42) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0105
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0106 : Poly :=
[
  term ((385847904595639 : Rat) / 23208570094752) [(9, 2)]
]

/-- Partial product 106 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0106 : Poly :=
[
  term ((385847904595639 : Rat) / 11604285047376) [(2, 1), (6, 1), (9, 2)],
  term ((-385847904595639 : Rat) / 11604285047376) [(2, 1), (9, 2)],
  term ((385847904595639 : Rat) / 11604285047376) [(3, 1), (7, 1), (9, 2)],
  term ((-385847904595639 : Rat) / 23208570094752) [(6, 2), (9, 2)],
  term ((-385847904595639 : Rat) / 23208570094752) [(7, 2), (9, 2)],
  term ((385847904595639 : Rat) / 23208570094752) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0106
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0107 : Poly :=
[
  term ((-534737724200341 : Rat) / 967023753948) [(10, 1)]
]

/-- Partial product 107 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0107 : Poly :=
[
  term ((-534737724200341 : Rat) / 483511876974) [(2, 1), (6, 1), (10, 1)],
  term ((534737724200341 : Rat) / 483511876974) [(2, 1), (10, 1)],
  term ((-534737724200341 : Rat) / 483511876974) [(3, 1), (7, 1), (10, 1)],
  term ((534737724200341 : Rat) / 967023753948) [(6, 2), (10, 1)],
  term ((534737724200341 : Rat) / 967023753948) [(7, 2), (10, 1)],
  term ((-534737724200341 : Rat) / 967023753948) [(10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0107
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0108 : Poly :=
[
  term ((1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 108 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0108 : Poly :=
[
  term ((1684743857698537 : Rat) / 1598549470812) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1684743857698537 : Rat) / 1598549470812) [(2, 1), (10, 1), (11, 1), (13, 1)],
  term ((1684743857698537 : Rat) / 1598549470812) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1684743857698537 : Rat) / 3197098941624) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((-1684743857698537 : Rat) / 3197098941624) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0108
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0109 : Poly :=
[
  term ((3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0109 : Poly :=
[
  term ((3635 : Rat) / 126) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3635 : Rat) / 126) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3635 : Rat) / 126) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3635 : Rat) / 252) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3635 : Rat) / 252) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0109
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0110 : Poly :=
[
  term ((-20119759249103879 : Rat) / 13054820678298) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 110 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0110 : Poly :=
[
  term ((-20119759249103879 : Rat) / 6527410339149) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((20119759249103879 : Rat) / 6527410339149) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-20119759249103879 : Rat) / 6527410339149) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((20119759249103879 : Rat) / 13054820678298) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((20119759249103879 : Rat) / 13054820678298) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-20119759249103879 : Rat) / 13054820678298) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0110
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0111 : Poly :=
[
  term ((-839 : Rat) / 63) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0111 : Poly :=
[
  term ((-1678 : Rat) / 63) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1678 : Rat) / 63) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1678 : Rat) / 63) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((839 : Rat) / 63) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((839 : Rat) / 63) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-839 : Rat) / 63) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0111
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0112 : Poly :=
[
  term ((55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2)]
]

/-- Partial product 112 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0112 : Poly :=
[
  term ((55678923180283967 : Rat) / 13054820678298) [(2, 1), (6, 1), (10, 1), (11, 2)],
  term ((-55678923180283967 : Rat) / 13054820678298) [(2, 1), (10, 1), (11, 2)],
  term ((55678923180283967 : Rat) / 13054820678298) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(6, 2), (10, 1), (11, 2)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(7, 2), (10, 1), (11, 2)],
  term ((55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0112
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0113 : Poly :=
[
  term ((716928038581163 : Rat) / 3197098941624) [(11, 1), (13, 1)]
]

/-- Partial product 113 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0113 : Poly :=
[
  term ((716928038581163 : Rat) / 1598549470812) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-716928038581163 : Rat) / 1598549470812) [(2, 1), (11, 1), (13, 1)],
  term ((716928038581163 : Rat) / 1598549470812) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-716928038581163 : Rat) / 3197098941624) [(6, 2), (11, 1), (13, 1)],
  term ((-716928038581163 : Rat) / 3197098941624) [(7, 2), (11, 1), (13, 1)],
  term ((716928038581163 : Rat) / 3197098941624) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0113
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0114 : Poly :=
[
  term ((11620346760238949 : Rat) / 39164462034894) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 114 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0114 : Poly :=
[
  term ((11620346760238949 : Rat) / 19582231017447) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-11620346760238949 : Rat) / 19582231017447) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((11620346760238949 : Rat) / 19582231017447) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-11620346760238949 : Rat) / 39164462034894) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-11620346760238949 : Rat) / 39164462034894) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((11620346760238949 : Rat) / 39164462034894) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0114
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0115 : Poly :=
[
  term ((85 : Rat) / 63) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 115 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0115 : Poly :=
[
  term ((170 : Rat) / 63) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((170 : Rat) / 63) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 63) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0115
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0116 : Poly :=
[
  term ((-2615 : Rat) / 252) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 116 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0116 : Poly :=
[
  term ((-2615 : Rat) / 126) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 126) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 126) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 252) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 252) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 252) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0116
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0117 : Poly :=
[
  term ((3388442470714675 : Rat) / 3729948765228) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 117 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0117 : Poly :=
[
  term ((3388442470714675 : Rat) / 1864974382614) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3388442470714675 : Rat) / 1864974382614) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((3388442470714675 : Rat) / 1864974382614) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3388442470714675 : Rat) / 3729948765228) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3388442470714675 : Rat) / 3729948765228) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((3388442470714675 : Rat) / 3729948765228) [(11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0117
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0118 : Poly :=
[
  term ((-16 : Rat) / 9) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0118 : Poly :=
[
  term ((-32 : Rat) / 9) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0118
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0119 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 119 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0119 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0119
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0120 : Poly :=
[
  term ((27479058244847935 : Rat) / 52219282713192) [(11, 1), (15, 1)]
]

/-- Partial product 120 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0120 : Poly :=
[
  term ((27479058244847935 : Rat) / 26109641356596) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-27479058244847935 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 1)],
  term ((27479058244847935 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-27479058244847935 : Rat) / 52219282713192) [(6, 2), (11, 1), (15, 1)],
  term ((-27479058244847935 : Rat) / 52219282713192) [(7, 2), (11, 1), (15, 1)],
  term ((27479058244847935 : Rat) / 52219282713192) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0120
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0121 : Poly :=
[
  term ((503 : Rat) / 63) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0121 : Poly :=
[
  term ((1006 : Rat) / 63) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1006 : Rat) / 63) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1006 : Rat) / 63) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-503 : Rat) / 63) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-503 : Rat) / 63) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((503 : Rat) / 63) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0121
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0122 : Poly :=
[
  term ((108361685007235349 : Rat) / 52219282713192) [(11, 2)]
]

/-- Partial product 122 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0122 : Poly :=
[
  term ((108361685007235349 : Rat) / 26109641356596) [(2, 1), (6, 1), (11, 2)],
  term ((-108361685007235349 : Rat) / 26109641356596) [(2, 1), (11, 2)],
  term ((108361685007235349 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 2)],
  term ((-108361685007235349 : Rat) / 52219282713192) [(6, 2), (11, 2)],
  term ((-108361685007235349 : Rat) / 52219282713192) [(7, 2), (11, 2)],
  term ((108361685007235349 : Rat) / 52219282713192) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0122
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0123 : Poly :=
[
  term ((-33885160769843255 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

/-- Partial product 123 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0123 : Poly :=
[
  term ((-33885160769843255 : Rat) / 13054820678298) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(2, 1), (11, 2), (14, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(3, 1), (7, 1), (11, 2), (14, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(6, 2), (11, 2), (14, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(7, 2), (11, 2), (14, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0123
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0124 : Poly :=
[
  term ((12605919278436877 : Rat) / 26109641356596) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 124 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0124 : Poly :=
[
  term ((12605919278436877 : Rat) / 13054820678298) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12605919278436877 : Rat) / 13054820678298) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((12605919278436877 : Rat) / 13054820678298) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12605919278436877 : Rat) / 26109641356596) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-12605919278436877 : Rat) / 26109641356596) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((12605919278436877 : Rat) / 26109641356596) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0124
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0125 : Poly :=
[
  term ((-247 : Rat) / 63) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0125 : Poly :=
[
  term ((-494 : Rat) / 63) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 63) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 63) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0125
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0126 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 126 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0126 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0126
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0127 : Poly :=
[
  term ((84069103279552807 : Rat) / 44759385182736) [(13, 1), (15, 1)]
]

/-- Partial product 127 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0127 : Poly :=
[
  term ((84069103279552807 : Rat) / 22379692591368) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-84069103279552807 : Rat) / 22379692591368) [(2, 1), (13, 1), (15, 1)],
  term ((84069103279552807 : Rat) / 22379692591368) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-84069103279552807 : Rat) / 44759385182736) [(6, 2), (13, 1), (15, 1)],
  term ((-84069103279552807 : Rat) / 44759385182736) [(7, 2), (13, 1), (15, 1)],
  term ((84069103279552807 : Rat) / 44759385182736) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0127
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0128 : Poly :=
[
  term ((-19987 : Rat) / 504) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0128 : Poly :=
[
  term ((-19987 : Rat) / 252) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((19987 : Rat) / 252) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19987 : Rat) / 252) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19987 : Rat) / 504) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((19987 : Rat) / 504) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19987 : Rat) / 504) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0128
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0129 : Poly :=
[
  term ((-941242657 : Rat) / 333083184) [(13, 2)]
]

/-- Partial product 129 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0129 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(2, 1), (6, 1), (13, 2)],
  term ((941242657 : Rat) / 166541592) [(2, 1), (13, 2)],
  term ((-941242657 : Rat) / 166541592) [(3, 1), (7, 1), (13, 2)],
  term ((941242657 : Rat) / 333083184) [(6, 2), (13, 2)],
  term ((941242657 : Rat) / 333083184) [(7, 2), (13, 2)],
  term ((-941242657 : Rat) / 333083184) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0129
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0130 : Poly :=
[
  term ((-2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1)]
]

/-- Partial product 130 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0130 : Poly :=
[
  term ((-2224986028928059 : Rat) / 1598549470812) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(2, 1), (13, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 2), (13, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(7, 2), (13, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0130
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0131 : Poly :=
[
  term ((1495 : Rat) / 252) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 131 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0131 : Poly :=
[
  term ((1495 : Rat) / 126) [(2, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0131
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0132 : Poly :=
[
  term ((-725 : Rat) / 168) [(13, 2), (16, 1)]
]

/-- Partial product 132 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0132 : Poly :=
[
  term ((-725 : Rat) / 84) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 84) [(2, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 84) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 168) [(6, 2), (13, 2), (16, 1)],
  term ((725 : Rat) / 168) [(7, 2), (13, 2), (16, 1)],
  term ((-725 : Rat) / 168) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0132
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0133 : Poly :=
[
  term ((-1392965408642333 : Rat) / 8703213785532) [(14, 1)]
]

/-- Partial product 133 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0133 : Poly :=
[
  term ((-1392965408642333 : Rat) / 4351606892766) [(2, 1), (6, 1), (14, 1)],
  term ((1392965408642333 : Rat) / 4351606892766) [(2, 1), (14, 1)],
  term ((-1392965408642333 : Rat) / 4351606892766) [(3, 1), (7, 1), (14, 1)],
  term ((1392965408642333 : Rat) / 8703213785532) [(6, 2), (14, 1)],
  term ((1392965408642333 : Rat) / 8703213785532) [(7, 2), (14, 1)],
  term ((-1392965408642333 : Rat) / 8703213785532) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0133
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0134 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(14, 1), (15, 2)]
]

/-- Partial product 134 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0134 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 2), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 2), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0134
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0135 : Poly :=
[
  term ((1994038900525423 : Rat) / 34812855142128) [(14, 2)]
]

/-- Partial product 135 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0135 : Poly :=
[
  term ((1994038900525423 : Rat) / 17406427571064) [(2, 1), (6, 1), (14, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(2, 1), (14, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(3, 1), (7, 1), (14, 2)],
  term ((-1994038900525423 : Rat) / 34812855142128) [(6, 2), (14, 2)],
  term ((-1994038900525423 : Rat) / 34812855142128) [(7, 2), (14, 2)],
  term ((1994038900525423 : Rat) / 34812855142128) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0135
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0136 : Poly :=
[
  term ((-301448495050698467 : Rat) / 104438565426384) [(15, 2)]
]

/-- Partial product 136 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0136 : Poly :=
[
  term ((-301448495050698467 : Rat) / 52219282713192) [(2, 1), (6, 1), (15, 2)],
  term ((301448495050698467 : Rat) / 52219282713192) [(2, 1), (15, 2)],
  term ((-301448495050698467 : Rat) / 52219282713192) [(3, 1), (7, 1), (15, 2)],
  term ((301448495050698467 : Rat) / 104438565426384) [(6, 2), (15, 2)],
  term ((301448495050698467 : Rat) / 104438565426384) [(7, 2), (15, 2)],
  term ((-301448495050698467 : Rat) / 104438565426384) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0136
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0137 : Poly :=
[
  term ((601 : Rat) / 18) [(15, 2), (16, 1)]
]

/-- Partial product 137 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0137 : Poly :=
[
  term ((601 : Rat) / 9) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-601 : Rat) / 9) [(2, 1), (15, 2), (16, 1)],
  term ((601 : Rat) / 9) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-601 : Rat) / 18) [(6, 2), (15, 2), (16, 1)],
  term ((-601 : Rat) / 18) [(7, 2), (15, 2), (16, 1)],
  term ((601 : Rat) / 18) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0137
        rs_R009_ueqv_R009YNNNN_generator_11_0100_0137 =
      rs_R009_ueqv_R009YNNNN_partial_11_0137 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_11_0100_0137 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_11_0100,
  rs_R009_ueqv_R009YNNNN_partial_11_0101,
  rs_R009_ueqv_R009YNNNN_partial_11_0102,
  rs_R009_ueqv_R009YNNNN_partial_11_0103,
  rs_R009_ueqv_R009YNNNN_partial_11_0104,
  rs_R009_ueqv_R009YNNNN_partial_11_0105,
  rs_R009_ueqv_R009YNNNN_partial_11_0106,
  rs_R009_ueqv_R009YNNNN_partial_11_0107,
  rs_R009_ueqv_R009YNNNN_partial_11_0108,
  rs_R009_ueqv_R009YNNNN_partial_11_0109,
  rs_R009_ueqv_R009YNNNN_partial_11_0110,
  rs_R009_ueqv_R009YNNNN_partial_11_0111,
  rs_R009_ueqv_R009YNNNN_partial_11_0112,
  rs_R009_ueqv_R009YNNNN_partial_11_0113,
  rs_R009_ueqv_R009YNNNN_partial_11_0114,
  rs_R009_ueqv_R009YNNNN_partial_11_0115,
  rs_R009_ueqv_R009YNNNN_partial_11_0116,
  rs_R009_ueqv_R009YNNNN_partial_11_0117,
  rs_R009_ueqv_R009YNNNN_partial_11_0118,
  rs_R009_ueqv_R009YNNNN_partial_11_0119,
  rs_R009_ueqv_R009YNNNN_partial_11_0120,
  rs_R009_ueqv_R009YNNNN_partial_11_0121,
  rs_R009_ueqv_R009YNNNN_partial_11_0122,
  rs_R009_ueqv_R009YNNNN_partial_11_0123,
  rs_R009_ueqv_R009YNNNN_partial_11_0124,
  rs_R009_ueqv_R009YNNNN_partial_11_0125,
  rs_R009_ueqv_R009YNNNN_partial_11_0126,
  rs_R009_ueqv_R009YNNNN_partial_11_0127,
  rs_R009_ueqv_R009YNNNN_partial_11_0128,
  rs_R009_ueqv_R009YNNNN_partial_11_0129,
  rs_R009_ueqv_R009YNNNN_partial_11_0130,
  rs_R009_ueqv_R009YNNNN_partial_11_0131,
  rs_R009_ueqv_R009YNNNN_partial_11_0132,
  rs_R009_ueqv_R009YNNNN_partial_11_0133,
  rs_R009_ueqv_R009YNNNN_partial_11_0134,
  rs_R009_ueqv_R009YNNNN_partial_11_0135,
  rs_R009_ueqv_R009YNNNN_partial_11_0136,
  rs_R009_ueqv_R009YNNNN_partial_11_0137
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_11_0100_0137 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((7819657675 : Rat) / 333083184) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 28) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1207041584503001491 : Rat) / 313315696279152) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-443 : Rat) / 21) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((385847904595639 : Rat) / 11604285047376) [(2, 1), (6, 1), (9, 2)],
  term ((-534737724200341 : Rat) / 483511876974) [(2, 1), (6, 1), (10, 1)],
  term ((1684743857698537 : Rat) / 1598549470812) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((3635 : Rat) / 126) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20119759249103879 : Rat) / 6527410339149) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1678 : Rat) / 63) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((55678923180283967 : Rat) / 13054820678298) [(2, 1), (6, 1), (10, 1), (11, 2)],
  term ((716928038581163 : Rat) / 1598549470812) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((11620346760238949 : Rat) / 19582231017447) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 63) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2615 : Rat) / 126) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3388442470714675 : Rat) / 1864974382614) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((27479058244847935 : Rat) / 26109641356596) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((1006 : Rat) / 63) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((108361685007235349 : Rat) / 26109641356596) [(2, 1), (6, 1), (11, 2)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((12605919278436877 : Rat) / 13054820678298) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((84069103279552807 : Rat) / 22379692591368) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-19987 : Rat) / 252) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(2, 1), (6, 1), (13, 2)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((1495 : Rat) / 126) [(2, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1392965408642333 : Rat) / 4351606892766) [(2, 1), (6, 1), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(2, 1), (6, 1), (14, 2)],
  term ((-301448495050698467 : Rat) / 52219282713192) [(2, 1), (6, 1), (15, 2)],
  term ((601 : Rat) / 9) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-7819657675 : Rat) / 333083184) [(2, 1), (9, 1), (13, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 28) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((1207041584503001491 : Rat) / 313315696279152) [(2, 1), (9, 1), (15, 1)],
  term ((443 : Rat) / 21) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-385847904595639 : Rat) / 11604285047376) [(2, 1), (9, 2)],
  term ((534737724200341 : Rat) / 483511876974) [(2, 1), (10, 1)],
  term ((-1684743857698537 : Rat) / 1598549470812) [(2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-3635 : Rat) / 126) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((20119759249103879 : Rat) / 6527410339149) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((1678 : Rat) / 63) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-55678923180283967 : Rat) / 13054820678298) [(2, 1), (10, 1), (11, 2)],
  term ((-716928038581163 : Rat) / 1598549470812) [(2, 1), (11, 1), (13, 1)],
  term ((-11620346760238949 : Rat) / 19582231017447) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2615 : Rat) / 126) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3388442470714675 : Rat) / 1864974382614) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 9) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-27479058244847935 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 1)],
  term ((-1006 : Rat) / 63) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108361685007235349 : Rat) / 26109641356596) [(2, 1), (11, 2)],
  term ((33885160769843255 : Rat) / 13054820678298) [(2, 1), (11, 2), (14, 1)],
  term ((-12605919278436877 : Rat) / 13054820678298) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((494 : Rat) / 63) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-84069103279552807 : Rat) / 22379692591368) [(2, 1), (13, 1), (15, 1)],
  term ((19987 : Rat) / 252) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(2, 1), (13, 2)],
  term ((2224986028928059 : Rat) / 1598549470812) [(2, 1), (13, 2), (14, 1)],
  term ((-1495 : Rat) / 126) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(2, 1), (13, 2), (16, 1)],
  term ((1392965408642333 : Rat) / 4351606892766) [(2, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (14, 1), (15, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(2, 1), (14, 2)],
  term ((301448495050698467 : Rat) / 52219282713192) [(2, 1), (15, 2)],
  term ((-601 : Rat) / 9) [(2, 1), (15, 2), (16, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((7819657675 : Rat) / 333083184) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 28) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1207041584503001491 : Rat) / 313315696279152) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-443 : Rat) / 21) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((385847904595639 : Rat) / 11604285047376) [(3, 1), (7, 1), (9, 2)],
  term ((-534737724200341 : Rat) / 483511876974) [(3, 1), (7, 1), (10, 1)],
  term ((1684743857698537 : Rat) / 1598549470812) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((3635 : Rat) / 126) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20119759249103879 : Rat) / 6527410339149) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1678 : Rat) / 63) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((55678923180283967 : Rat) / 13054820678298) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((716928038581163 : Rat) / 1598549470812) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((11620346760238949 : Rat) / 19582231017447) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 63) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2615 : Rat) / 126) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((3388442470714675 : Rat) / 1864974382614) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((27479058244847935 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((1006 : Rat) / 63) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((108361685007235349 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 2)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(3, 1), (7, 1), (11, 2), (14, 1)],
  term ((12605919278436877 : Rat) / 13054820678298) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((84069103279552807 : Rat) / 22379692591368) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-19987 : Rat) / 252) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(3, 1), (7, 1), (13, 2)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((1495 : Rat) / 126) [(3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1392965408642333 : Rat) / 4351606892766) [(3, 1), (7, 1), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(3, 1), (7, 1), (14, 2)],
  term ((-301448495050698467 : Rat) / 52219282713192) [(3, 1), (7, 1), (15, 2)],
  term ((601 : Rat) / 9) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((-7819657675 : Rat) / 666166368) [(6, 2), (9, 1), (13, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 56) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((1207041584503001491 : Rat) / 626631392558304) [(6, 2), (9, 1), (15, 1)],
  term ((443 : Rat) / 42) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(6, 2), (9, 2)],
  term ((534737724200341 : Rat) / 967023753948) [(6, 2), (10, 1)],
  term ((-1684743857698537 : Rat) / 3197098941624) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3635 : Rat) / 252) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((20119759249103879 : Rat) / 13054820678298) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((839 : Rat) / 63) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(6, 2), (10, 1), (11, 2)],
  term ((-716928038581163 : Rat) / 3197098941624) [(6, 2), (11, 1), (13, 1)],
  term ((-11620346760238949 : Rat) / 39164462034894) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-85 : Rat) / 63) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2615 : Rat) / 252) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3388442470714675 : Rat) / 3729948765228) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 9) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((-27479058244847935 : Rat) / 52219282713192) [(6, 2), (11, 1), (15, 1)],
  term ((-503 : Rat) / 63) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-108361685007235349 : Rat) / 52219282713192) [(6, 2), (11, 2)],
  term ((33885160769843255 : Rat) / 26109641356596) [(6, 2), (11, 2), (14, 1)],
  term ((-12605919278436877 : Rat) / 26109641356596) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((-84069103279552807 : Rat) / 44759385182736) [(6, 2), (13, 1), (15, 1)],
  term ((19987 : Rat) / 504) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 333083184) [(6, 2), (13, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 2), (13, 2), (14, 1)],
  term ((-1495 : Rat) / 252) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(6, 2), (13, 2), (16, 1)],
  term ((1392965408642333 : Rat) / 8703213785532) [(6, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 2), (14, 1), (15, 2)],
  term ((-1994038900525423 : Rat) / 34812855142128) [(6, 2), (14, 2)],
  term ((301448495050698467 : Rat) / 104438565426384) [(6, 2), (15, 2)],
  term ((-601 : Rat) / 18) [(6, 2), (15, 2), (16, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-7819657675 : Rat) / 666166368) [(7, 2), (9, 1), (13, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 56) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((1207041584503001491 : Rat) / 626631392558304) [(7, 2), (9, 1), (15, 1)],
  term ((443 : Rat) / 42) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(7, 2), (9, 2)],
  term ((534737724200341 : Rat) / 967023753948) [(7, 2), (10, 1)],
  term ((-1684743857698537 : Rat) / 3197098941624) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3635 : Rat) / 252) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((20119759249103879 : Rat) / 13054820678298) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((839 : Rat) / 63) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(7, 2), (10, 1), (11, 2)],
  term ((-716928038581163 : Rat) / 3197098941624) [(7, 2), (11, 1), (13, 1)],
  term ((-11620346760238949 : Rat) / 39164462034894) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-85 : Rat) / 63) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2615 : Rat) / 252) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3388442470714675 : Rat) / 3729948765228) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 9) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 2), (11, 1), (14, 2), (15, 1)],
  term ((-27479058244847935 : Rat) / 52219282713192) [(7, 2), (11, 1), (15, 1)],
  term ((-503 : Rat) / 63) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-108361685007235349 : Rat) / 52219282713192) [(7, 2), (11, 2)],
  term ((33885160769843255 : Rat) / 26109641356596) [(7, 2), (11, 2), (14, 1)],
  term ((-12605919278436877 : Rat) / 26109641356596) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((-84069103279552807 : Rat) / 44759385182736) [(7, 2), (13, 1), (15, 1)],
  term ((19987 : Rat) / 504) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 333083184) [(7, 2), (13, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(7, 2), (13, 2), (14, 1)],
  term ((-1495 : Rat) / 252) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(7, 2), (13, 2), (16, 1)],
  term ((1392965408642333 : Rat) / 8703213785532) [(7, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 2), (14, 1), (15, 2)],
  term ((-1994038900525423 : Rat) / 34812855142128) [(7, 2), (14, 2)],
  term ((301448495050698467 : Rat) / 104438565426384) [(7, 2), (15, 2)],
  term ((-601 : Rat) / 18) [(7, 2), (15, 2), (16, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(9, 1), (11, 1), (14, 1)],
  term ((7819657675 : Rat) / 666166368) [(9, 1), (13, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 56) [(9, 1), (13, 1), (16, 1)],
  term ((-1207041584503001491 : Rat) / 626631392558304) [(9, 1), (15, 1)],
  term ((-443 : Rat) / 42) [(9, 1), (15, 1), (16, 1)],
  term ((385847904595639 : Rat) / 23208570094752) [(9, 2)],
  term ((-534737724200341 : Rat) / 967023753948) [(10, 1)],
  term ((1684743857698537 : Rat) / 3197098941624) [(10, 1), (11, 1), (13, 1)],
  term ((3635 : Rat) / 252) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20119759249103879 : Rat) / 13054820678298) [(10, 1), (11, 1), (15, 1)],
  term ((-839 : Rat) / 63) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2)],
  term ((716928038581163 : Rat) / 3197098941624) [(11, 1), (13, 1)],
  term ((11620346760238949 : Rat) / 39164462034894) [(11, 1), (13, 1), (14, 1)],
  term ((85 : Rat) / 63) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2615 : Rat) / 252) [(11, 1), (13, 1), (16, 1)],
  term ((3388442470714675 : Rat) / 3729948765228) [(11, 1), (14, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)],
  term ((27479058244847935 : Rat) / 52219282713192) [(11, 1), (15, 1)],
  term ((503 : Rat) / 63) [(11, 1), (15, 1), (16, 1)],
  term ((108361685007235349 : Rat) / 52219282713192) [(11, 2)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(11, 2), (14, 1)],
  term ((12605919278436877 : Rat) / 26109641356596) [(13, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)],
  term ((84069103279552807 : Rat) / 44759385182736) [(13, 1), (15, 1)],
  term ((-19987 : Rat) / 504) [(13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 333083184) [(13, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1)],
  term ((1495 : Rat) / 252) [(13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(13, 2), (16, 1)],
  term ((-1392965408642333 : Rat) / 8703213785532) [(14, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(14, 1), (15, 2)],
  term ((1994038900525423 : Rat) / 34812855142128) [(14, 2)],
  term ((-301448495050698467 : Rat) / 104438565426384) [(15, 2)],
  term ((601 : Rat) / 18) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 100 through 137. -/
theorem rs_R009_ueqv_R009YNNNN_block_11_0100_0137_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_11_0100_0137
      rs_R009_ueqv_R009YNNNN_block_11_0100_0137 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
