/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 1:100-127

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 1 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_01_0100_0127 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0100 : Poly :=
[
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 100 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0100 : Poly :=
[
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(9, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0100_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0100
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0101 : Poly :=
[
  term ((41475035726524143 : Rat) / 11931351291544832) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0101 : Poly :=
[
  term ((41475035726524143 : Rat) / 11931351291544832) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41475035726524143 : Rat) / 11931351291544832) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41475035726524143 : Rat) / 11931351291544832) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41475035726524143 : Rat) / 11931351291544832) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0101_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0101
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0102 : Poly :=
[
  term ((15067740895983964277 : Rat) / 5320126744314095616) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0102 : Poly :=
[
  term ((15067740895983964277 : Rat) / 5320126744314095616) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((15067740895983964277 : Rat) / 5320126744314095616) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15067740895983964277 : Rat) / 5320126744314095616) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15067740895983964277 : Rat) / 5320126744314095616) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0102_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0102
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0103 : Poly :=
[
  term ((-194779229468703341413013 : Rat) / 1212988897703613800448) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 103 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0103 : Poly :=
[
  term ((-194779229468703341413013 : Rat) / 1212988897703613800448) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-194779229468703341413013 : Rat) / 1212988897703613800448) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((194779229468703341413013 : Rat) / 1212988897703613800448) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((194779229468703341413013 : Rat) / 1212988897703613800448) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0103_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0103
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0104 : Poly :=
[
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 104 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0104 : Poly :=
[
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(9, 3), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0104_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0104
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0105 : Poly :=
[
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0105 : Poly :=
[
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0105_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0105
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0106 : Poly :=
[
  term ((105635733207325 : Rat) / 730490895400704) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0106 : Poly :=
[
  term ((105635733207325 : Rat) / 730490895400704) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0106_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0106
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0107 : Poly :=
[
  term ((-21609457707230532185 : Rat) / 572704861994151936) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0107 : Poly :=
[
  term ((-21609457707230532185 : Rat) / 572704861994151936) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21609457707230532185 : Rat) / 572704861994151936) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((21609457707230532185 : Rat) / 572704861994151936) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((21609457707230532185 : Rat) / 572704861994151936) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0107_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0107
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0108 : Poly :=
[
  term ((549299257489439991 : Rat) / 47725405166179328) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 108 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0108 : Poly :=
[
  term ((549299257489439991 : Rat) / 47725405166179328) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0108_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0108
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0109 : Poly :=
[
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0109 : Poly :=
[
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 4), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0109_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0109
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0110 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0110 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0110_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0110
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0111 : Poly :=
[
  term ((23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0111 : Poly :=
[
  term ((23088038262747441 : Rat) / 1491418911443104) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0111_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0111
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0112 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0112 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0112_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0112
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0113 : Poly :=
[
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 113 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0113 : Poly :=
[
  term ((-724990340615301 : Rat) / 213059844491872) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0113_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0113
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0114 : Poly :=
[
  term ((-4745606333800715 : Rat) / 1704478755934976) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0114 : Poly :=
[
  term ((-4745606333800715 : Rat) / 1704478755934976) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4745606333800715 : Rat) / 1704478755934976) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((4745606333800715 : Rat) / 1704478755934976) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((4745606333800715 : Rat) / 1704478755934976) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0114_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0114
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0115 : Poly :=
[
  term ((26736106314205401 : Rat) / 6817915023739904) [(10, 1), (16, 1)]
]

/-- Partial product 115 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0115 : Poly :=
[
  term ((26736106314205401 : Rat) / 6817915023739904) [(0, 2), (10, 1), (16, 1)],
  term ((26736106314205401 : Rat) / 6817915023739904) [(1, 2), (10, 1), (16, 1)],
  term ((-26736106314205401 : Rat) / 6817915023739904) [(8, 2), (10, 1), (16, 1)],
  term ((-26736106314205401 : Rat) / 6817915023739904) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0115_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0115
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0116 : Poly :=
[
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 2), (16, 1)]
]

/-- Partial product 116 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0116 : Poly :=
[
  term ((3249908850494927 : Rat) / 1704478755934976) [(0, 2), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(1, 2), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(8, 2), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0116_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0116
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0117 : Poly :=
[
  term ((-1062822789958340848111 : Rat) / 25270602035491954176) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 117 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0117 : Poly :=
[
  term ((-1062822789958340848111 : Rat) / 25270602035491954176) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1062822789958340848111 : Rat) / 25270602035491954176) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((1062822789958340848111 : Rat) / 25270602035491954176) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((1062822789958340848111 : Rat) / 25270602035491954176) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0117_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0117
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0118 : Poly :=
[
  term ((3885792868816470719335 : Rat) / 16391741860859645952) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0118 : Poly :=
[
  term ((3885792868816470719335 : Rat) / 16391741860859645952) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((3885792868816470719335 : Rat) / 16391741860859645952) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3885792868816470719335 : Rat) / 16391741860859645952) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3885792868816470719335 : Rat) / 16391741860859645952) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0118_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0118
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0119 : Poly :=
[
  term ((-72777139141045149 : Rat) / 11931351291544832) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 119 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0119 : Poly :=
[
  term ((-72777139141045149 : Rat) / 11931351291544832) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0119_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0119
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0120 : Poly :=
[
  term ((-724990340615301 : Rat) / 213059844491872) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 120 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0120 : Poly :=
[
  term ((-724990340615301 : Rat) / 213059844491872) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0120_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0120
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0121 : Poly :=
[
  term ((-47568512233010621929 : Rat) / 1330031686078523904) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0121 : Poly :=
[
  term ((-47568512233010621929 : Rat) / 1330031686078523904) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((-47568512233010621929 : Rat) / 1330031686078523904) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((47568512233010621929 : Rat) / 1330031686078523904) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((47568512233010621929 : Rat) / 1330031686078523904) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0121_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0121
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0122 : Poly :=
[
  term ((764303375406176125217 : Rat) / 101082408141967816704) [(11, 2), (16, 1)]
]

/-- Partial product 122 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0122 : Poly :=
[
  term ((764303375406176125217 : Rat) / 101082408141967816704) [(0, 2), (11, 2), (16, 1)],
  term ((764303375406176125217 : Rat) / 101082408141967816704) [(1, 2), (11, 2), (16, 1)],
  term ((-764303375406176125217 : Rat) / 101082408141967816704) [(8, 2), (11, 2), (16, 1)],
  term ((-764303375406176125217 : Rat) / 101082408141967816704) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0122_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0122
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0123 : Poly :=
[
  term ((-5555875982145105689 : Rat) / 429528646495613952) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0123 : Poly :=
[
  term ((-5555875982145105689 : Rat) / 429528646495613952) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5555875982145105689 : Rat) / 429528646495613952) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((5555875982145105689 : Rat) / 429528646495613952) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((5555875982145105689 : Rat) / 429528646495613952) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0123_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0123
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0124 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0124 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0124_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0124
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0125 : Poly :=
[
  term ((-724990340615301 : Rat) / 121748482566784) [(14, 1), (16, 1)]
]

/-- Partial product 125 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0125 : Poly :=
[
  term ((-724990340615301 : Rat) / 121748482566784) [(0, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 121748482566784) [(1, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 121748482566784) [(8, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 121748482566784) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0125_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0125
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0126 : Poly :=
[
  term ((49667328316711233173 : Rat) / 859057292991227904) [(15, 2), (16, 1)]
]

/-- Partial product 126 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0126 : Poly :=
[
  term ((49667328316711233173 : Rat) / 859057292991227904) [(0, 2), (15, 2), (16, 1)],
  term ((49667328316711233173 : Rat) / 859057292991227904) [(1, 2), (15, 2), (16, 1)],
  term ((-49667328316711233173 : Rat) / 859057292991227904) [(8, 2), (15, 2), (16, 1)],
  term ((-49667328316711233173 : Rat) / 859057292991227904) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0126_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0126
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYY_coefficient_01_0127 : Poly :=
[
  term ((128543352304231057 : Rat) / 122722470427318272) [(16, 1)]
]

/-- Partial product 127 for generator 1. -/
def rs_R010_ueqv_R010NYY_partial_01_0127 : Poly :=
[
  term ((128543352304231057 : Rat) / 122722470427318272) [(0, 2), (16, 1)],
  term ((128543352304231057 : Rat) / 122722470427318272) [(1, 2), (16, 1)],
  term ((-128543352304231057 : Rat) / 122722470427318272) [(8, 2), (16, 1)],
  term ((-128543352304231057 : Rat) / 122722470427318272) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 1. -/
theorem rs_R010_ueqv_R010NYY_partial_01_0127_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_01_0127
        rs_R010_ueqv_R010NYY_generator_01_0100_0127 =
      rs_R010_ueqv_R010NYY_partial_01_0127 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_01_0100_0127 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_01_0100,
  rs_R010_ueqv_R010NYY_partial_01_0101,
  rs_R010_ueqv_R010NYY_partial_01_0102,
  rs_R010_ueqv_R010NYY_partial_01_0103,
  rs_R010_ueqv_R010NYY_partial_01_0104,
  rs_R010_ueqv_R010NYY_partial_01_0105,
  rs_R010_ueqv_R010NYY_partial_01_0106,
  rs_R010_ueqv_R010NYY_partial_01_0107,
  rs_R010_ueqv_R010NYY_partial_01_0108,
  rs_R010_ueqv_R010NYY_partial_01_0109,
  rs_R010_ueqv_R010NYY_partial_01_0110,
  rs_R010_ueqv_R010NYY_partial_01_0111,
  rs_R010_ueqv_R010NYY_partial_01_0112,
  rs_R010_ueqv_R010NYY_partial_01_0113,
  rs_R010_ueqv_R010NYY_partial_01_0114,
  rs_R010_ueqv_R010NYY_partial_01_0115,
  rs_R010_ueqv_R010NYY_partial_01_0116,
  rs_R010_ueqv_R010NYY_partial_01_0117,
  rs_R010_ueqv_R010NYY_partial_01_0118,
  rs_R010_ueqv_R010NYY_partial_01_0119,
  rs_R010_ueqv_R010NYY_partial_01_0120,
  rs_R010_ueqv_R010NYY_partial_01_0121,
  rs_R010_ueqv_R010NYY_partial_01_0122,
  rs_R010_ueqv_R010NYY_partial_01_0123,
  rs_R010_ueqv_R010NYY_partial_01_0124,
  rs_R010_ueqv_R010NYY_partial_01_0125,
  rs_R010_ueqv_R010NYY_partial_01_0126,
  rs_R010_ueqv_R010NYY_partial_01_0127
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_01_0100_0127 : Poly :=
[
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((41475035726524143 : Rat) / 11931351291544832) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15067740895983964277 : Rat) / 5320126744314095616) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-194779229468703341413013 : Rat) / 1212988897703613800448) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-21609457707230532185 : Rat) / 572704861994151936) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-4745606333800715 : Rat) / 1704478755934976) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((26736106314205401 : Rat) / 6817915023739904) [(0, 2), (10, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(0, 2), (10, 2), (16, 1)],
  term ((-1062822789958340848111 : Rat) / 25270602035491954176) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((3885792868816470719335 : Rat) / 16391741860859645952) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-47568512233010621929 : Rat) / 1330031686078523904) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((764303375406176125217 : Rat) / 101082408141967816704) [(0, 2), (11, 2), (16, 1)],
  term ((-5555875982145105689 : Rat) / 429528646495613952) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 121748482566784) [(0, 2), (14, 1), (16, 1)],
  term ((49667328316711233173 : Rat) / 859057292991227904) [(0, 2), (15, 2), (16, 1)],
  term ((128543352304231057 : Rat) / 122722470427318272) [(0, 2), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((41475035726524143 : Rat) / 11931351291544832) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15067740895983964277 : Rat) / 5320126744314095616) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-194779229468703341413013 : Rat) / 1212988897703613800448) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-21609457707230532185 : Rat) / 572704861994151936) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-4745606333800715 : Rat) / 1704478755934976) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((26736106314205401 : Rat) / 6817915023739904) [(1, 2), (10, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(1, 2), (10, 2), (16, 1)],
  term ((-1062822789958340848111 : Rat) / 25270602035491954176) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((3885792868816470719335 : Rat) / 16391741860859645952) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-47568512233010621929 : Rat) / 1330031686078523904) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((764303375406176125217 : Rat) / 101082408141967816704) [(1, 2), (11, 2), (16, 1)],
  term ((-5555875982145105689 : Rat) / 429528646495613952) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 121748482566784) [(1, 2), (14, 1), (16, 1)],
  term ((49667328316711233173 : Rat) / 859057292991227904) [(1, 2), (15, 2), (16, 1)],
  term ((128543352304231057 : Rat) / 122722470427318272) [(1, 2), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-41475035726524143 : Rat) / 11931351291544832) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15067740895983964277 : Rat) / 5320126744314095616) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((194779229468703341413013 : Rat) / 1212988897703613800448) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((21609457707230532185 : Rat) / 572704861994151936) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((4745606333800715 : Rat) / 1704478755934976) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-26736106314205401 : Rat) / 6817915023739904) [(8, 2), (10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(8, 2), (10, 2), (16, 1)],
  term ((1062822789958340848111 : Rat) / 25270602035491954176) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3885792868816470719335 : Rat) / 16391741860859645952) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((47568512233010621929 : Rat) / 1330031686078523904) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((-764303375406176125217 : Rat) / 101082408141967816704) [(8, 2), (11, 2), (16, 1)],
  term ((5555875982145105689 : Rat) / 429528646495613952) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 121748482566784) [(8, 2), (14, 1), (16, 1)],
  term ((-49667328316711233173 : Rat) / 859057292991227904) [(8, 2), (15, 2), (16, 1)],
  term ((-128543352304231057 : Rat) / 122722470427318272) [(8, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((4745606333800715 : Rat) / 1704478755934976) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-26736106314205401 : Rat) / 6817915023739904) [(9, 2), (10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(9, 2), (10, 2), (16, 1)],
  term ((1062822789958340848111 : Rat) / 25270602035491954176) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3885792868816470719335 : Rat) / 16391741860859645952) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((47568512233010621929 : Rat) / 1330031686078523904) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-764303375406176125217 : Rat) / 101082408141967816704) [(9, 2), (11, 2), (16, 1)],
  term ((5555875982145105689 : Rat) / 429528646495613952) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 121748482566784) [(9, 2), (14, 1), (16, 1)],
  term ((-49667328316711233173 : Rat) / 859057292991227904) [(9, 2), (15, 2), (16, 1)],
  term ((-128543352304231057 : Rat) / 122722470427318272) [(9, 2), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(9, 3), (10, 1), (11, 1), (16, 1)],
  term ((-41475035726524143 : Rat) / 11931351291544832) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15067740895983964277 : Rat) / 5320126744314095616) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((194779229468703341413013 : Rat) / 1212988897703613800448) [(9, 3), (11, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(9, 3), (11, 2), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(9, 3), (13, 1), (16, 1)],
  term ((21609457707230532185 : Rat) / 572704861994151936) [(9, 3), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(9, 3), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 4), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 4), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 4), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 100 through 127. -/
theorem rs_R010_ueqv_R010NYY_block_01_0100_0127_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_01_0100_0127
      rs_R010_ueqv_R010NYY_block_01_0100_0127 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
