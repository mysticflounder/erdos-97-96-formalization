/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 7:100-123

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_07_0100_0123 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0100 : Poly :=
[
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0100 : Poly :=
[
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(2, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0100_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0100
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0101 : Poly :=
[
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0101 : Poly :=
[
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0101_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0101
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0102 : Poly :=
[
  term ((-105635733207325 : Rat) / 730490895400704) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0102 : Poly :=
[
  term ((-105635733207325 : Rat) / 365245447700352) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((105635733207325 : Rat) / 365245447700352) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 365245447700352) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0102_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0102
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0103 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0103 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0103_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0103
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0104 : Poly :=
[
  term ((5400599085003903887 : Rat) / 572704861994151936) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0104 : Poly :=
[
  term ((5400599085003903887 : Rat) / 286352430997075968) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5400599085003903887 : Rat) / 286352430997075968) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((5400599085003903887 : Rat) / 286352430997075968) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5400599085003903887 : Rat) / 572704861994151936) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5400599085003903887 : Rat) / 572704861994151936) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((5400599085003903887 : Rat) / 572704861994151936) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0104_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0104
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0105 : Poly :=
[
  term ((-549299257489439991 : Rat) / 47725405166179328) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 105 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0105 : Poly :=
[
  term ((-549299257489439991 : Rat) / 23862702583089664) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 23862702583089664) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-549299257489439991 : Rat) / 23862702583089664) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0105_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0105
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0106 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0106 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(0, 1), (2, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(0, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(1, 1), (3, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(3, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0106_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0106
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0107 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0107 : Poly :=
[
  term ((41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0107_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0107
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0108 : Poly :=
[
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0108 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(0, 1), (2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0108_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0108
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0109 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0109 : Poly :=
[
  term ((23088038262747441 : Rat) / 372854727860776) [(0, 1), (2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0109_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0109
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0110 : Poly :=
[
  term ((53417767260921 : Rat) / 60874241283392) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0110 : Poly :=
[
  term ((53417767260921 : Rat) / 30437120641696) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-53417767260921 : Rat) / 30437120641696) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((53417767260921 : Rat) / 30437120641696) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-53417767260921 : Rat) / 60874241283392) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-53417767260921 : Rat) / 60874241283392) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((53417767260921 : Rat) / 60874241283392) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0110_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0110
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0111 : Poly :=
[
  term ((-17805922420307 : Rat) / 243496965133568) [(10, 1), (16, 1)]
]

/-- Partial product 111 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0111 : Poly :=
[
  term ((-17805922420307 : Rat) / 121748482566784) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((17805922420307 : Rat) / 121748482566784) [(0, 1), (10, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 121748482566784) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((17805922420307 : Rat) / 243496965133568) [(2, 2), (10, 1), (16, 1)],
  term ((17805922420307 : Rat) / 243496965133568) [(3, 2), (10, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 243496965133568) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0111_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0111
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0112 : Poly :=
[
  term ((483081880664724578339 : Rat) / 12635301017745977088) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0112 : Poly :=
[
  term ((483081880664724578339 : Rat) / 6317650508872988544) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-483081880664724578339 : Rat) / 6317650508872988544) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((483081880664724578339 : Rat) / 6317650508872988544) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-483081880664724578339 : Rat) / 12635301017745977088) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-483081880664724578339 : Rat) / 12635301017745977088) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((483081880664724578339 : Rat) / 12635301017745977088) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0112_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0112
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0113 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0113 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0113_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0113
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0114 : Poly :=
[
  term ((-22410393731151729761765 : Rat) / 606494448851806900224) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0114 : Poly :=
[
  term ((-22410393731151729761765 : Rat) / 303247224425903450112) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((22410393731151729761765 : Rat) / 303247224425903450112) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22410393731151729761765 : Rat) / 303247224425903450112) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((22410393731151729761765 : Rat) / 606494448851806900224) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((22410393731151729761765 : Rat) / 606494448851806900224) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22410393731151729761765 : Rat) / 606494448851806900224) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0114_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0114
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0115 : Poly :=
[
  term ((72777139141045149 : Rat) / 11931351291544832) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 115 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0115 : Poly :=
[
  term ((72777139141045149 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-72777139141045149 : Rat) / 5965675645772416) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((72777139141045149 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0115_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0115
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0116 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 116 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0116 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0116_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0116
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0117 : Poly :=
[
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 117 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0117 : Poly :=
[
  term ((210735806759522018859 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-210735806759522018859 : Rat) / 4211767005915325696) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((210735806759522018859 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0117_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0117
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0118 : Poly :=
[
  term ((-1774961441339780299775 : Rat) / 101082408141967816704) [(11, 2), (16, 1)]
]

/-- Partial product 118 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0118 : Poly :=
[
  term ((-1774961441339780299775 : Rat) / 50541204070983908352) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((1774961441339780299775 : Rat) / 50541204070983908352) [(0, 1), (11, 2), (16, 1)],
  term ((-1774961441339780299775 : Rat) / 50541204070983908352) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((1774961441339780299775 : Rat) / 101082408141967816704) [(2, 2), (11, 2), (16, 1)],
  term ((1774961441339780299775 : Rat) / 101082408141967816704) [(3, 2), (11, 2), (16, 1)],
  term ((-1774961441339780299775 : Rat) / 101082408141967816704) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0118_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0118
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0119 : Poly :=
[
  term ((108002022700487081 : Rat) / 11608882337719296) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0119 : Poly :=
[
  term ((108002022700487081 : Rat) / 5804441168859648) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108002022700487081 : Rat) / 5804441168859648) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((108002022700487081 : Rat) / 5804441168859648) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108002022700487081 : Rat) / 11608882337719296) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-108002022700487081 : Rat) / 11608882337719296) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((108002022700487081 : Rat) / 11608882337719296) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0119_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0119
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0120 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 120 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0120 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0120_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0120
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0121 : Poly :=
[
  term ((-13309184894211347 : Rat) / 2556718133902464) [(14, 1), (16, 1)]
]

/-- Partial product 121 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0121 : Poly :=
[
  term ((-13309184894211347 : Rat) / 1278359066951232) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((13309184894211347 : Rat) / 1278359066951232) [(0, 1), (14, 1), (16, 1)],
  term ((-13309184894211347 : Rat) / 1278359066951232) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((13309184894211347 : Rat) / 2556718133902464) [(2, 2), (14, 1), (16, 1)],
  term ((13309184894211347 : Rat) / 2556718133902464) [(3, 2), (14, 1), (16, 1)],
  term ((-13309184894211347 : Rat) / 2556718133902464) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0121_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0121
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0122 : Poly :=
[
  term ((-3534350192127797099 : Rat) / 859057292991227904) [(15, 2), (16, 1)]
]

/-- Partial product 122 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0122 : Poly :=
[
  term ((-3534350192127797099 : Rat) / 429528646495613952) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((3534350192127797099 : Rat) / 429528646495613952) [(0, 1), (15, 2), (16, 1)],
  term ((-3534350192127797099 : Rat) / 429528646495613952) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((3534350192127797099 : Rat) / 859057292991227904) [(2, 2), (15, 2), (16, 1)],
  term ((3534350192127797099 : Rat) / 859057292991227904) [(3, 2), (15, 2), (16, 1)],
  term ((-3534350192127797099 : Rat) / 859057292991227904) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0122_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0122
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010NYY_coefficient_07_0123 : Poly :=
[
  term ((267028701921311135 : Rat) / 122722470427318272) [(16, 1)]
]

/-- Partial product 123 for generator 7. -/
def rs_R010_ueqv_R010NYY_partial_07_0123 : Poly :=
[
  term ((267028701921311135 : Rat) / 61361235213659136) [(0, 1), (2, 1), (16, 1)],
  term ((-267028701921311135 : Rat) / 61361235213659136) [(0, 1), (16, 1)],
  term ((267028701921311135 : Rat) / 61361235213659136) [(1, 1), (3, 1), (16, 1)],
  term ((-267028701921311135 : Rat) / 122722470427318272) [(2, 2), (16, 1)],
  term ((-267028701921311135 : Rat) / 122722470427318272) [(3, 2), (16, 1)],
  term ((267028701921311135 : Rat) / 122722470427318272) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 7. -/
theorem rs_R010_ueqv_R010NYY_partial_07_0123_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_07_0123
        rs_R010_ueqv_R010NYY_generator_07_0100_0123 =
      rs_R010_ueqv_R010NYY_partial_07_0123 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_07_0100_0123 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_07_0100,
  rs_R010_ueqv_R010NYY_partial_07_0101,
  rs_R010_ueqv_R010NYY_partial_07_0102,
  rs_R010_ueqv_R010NYY_partial_07_0103,
  rs_R010_ueqv_R010NYY_partial_07_0104,
  rs_R010_ueqv_R010NYY_partial_07_0105,
  rs_R010_ueqv_R010NYY_partial_07_0106,
  rs_R010_ueqv_R010NYY_partial_07_0107,
  rs_R010_ueqv_R010NYY_partial_07_0108,
  rs_R010_ueqv_R010NYY_partial_07_0109,
  rs_R010_ueqv_R010NYY_partial_07_0110,
  rs_R010_ueqv_R010NYY_partial_07_0111,
  rs_R010_ueqv_R010NYY_partial_07_0112,
  rs_R010_ueqv_R010NYY_partial_07_0113,
  rs_R010_ueqv_R010NYY_partial_07_0114,
  rs_R010_ueqv_R010NYY_partial_07_0115,
  rs_R010_ueqv_R010NYY_partial_07_0116,
  rs_R010_ueqv_R010NYY_partial_07_0117,
  rs_R010_ueqv_R010NYY_partial_07_0118,
  rs_R010_ueqv_R010NYY_partial_07_0119,
  rs_R010_ueqv_R010NYY_partial_07_0120,
  rs_R010_ueqv_R010NYY_partial_07_0121,
  rs_R010_ueqv_R010NYY_partial_07_0122,
  rs_R010_ueqv_R010NYY_partial_07_0123
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_07_0100_0123 : Poly :=
[
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 365245447700352) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5400599085003903887 : Rat) / 286352430997075968) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 23862702583089664) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(0, 1), (2, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(0, 1), (2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(0, 1), (2, 1), (9, 2), (15, 2), (16, 1)],
  term ((53417767260921 : Rat) / 30437120641696) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 121748482566784) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((483081880664724578339 : Rat) / 6317650508872988544) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22410393731151729761765 : Rat) / 303247224425903450112) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((72777139141045149 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (2, 1), (11, 2), (14, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1774961441339780299775 : Rat) / 50541204070983908352) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((108002022700487081 : Rat) / 5804441168859648) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13309184894211347 : Rat) / 1278359066951232) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-3534350192127797099 : Rat) / 429528646495613952) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((267028701921311135 : Rat) / 61361235213659136) [(0, 1), (2, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((105635733207325 : Rat) / 365245447700352) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5400599085003903887 : Rat) / 286352430997075968) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 23862702583089664) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(0, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((-53417767260921 : Rat) / 30437120641696) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((17805922420307 : Rat) / 121748482566784) [(0, 1), (10, 1), (16, 1)],
  term ((-483081880664724578339 : Rat) / 6317650508872988544) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((22410393731151729761765 : Rat) / 303247224425903450112) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72777139141045149 : Rat) / 5965675645772416) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 4211767005915325696) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((1774961441339780299775 : Rat) / 50541204070983908352) [(0, 1), (11, 2), (16, 1)],
  term ((-108002022700487081 : Rat) / 5804441168859648) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((13309184894211347 : Rat) / 1278359066951232) [(0, 1), (14, 1), (16, 1)],
  term ((3534350192127797099 : Rat) / 429528646495613952) [(0, 1), (15, 2), (16, 1)],
  term ((-267028701921311135 : Rat) / 61361235213659136) [(0, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 365245447700352) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5400599085003903887 : Rat) / 286352430997075968) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 23862702583089664) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(1, 1), (3, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((53417767260921 : Rat) / 30437120641696) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 121748482566784) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((483081880664724578339 : Rat) / 6317650508872988544) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22410393731151729761765 : Rat) / 303247224425903450112) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((72777139141045149 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1774961441339780299775 : Rat) / 50541204070983908352) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((108002022700487081 : Rat) / 5804441168859648) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13309184894211347 : Rat) / 1278359066951232) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-3534350192127797099 : Rat) / 429528646495613952) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((267028701921311135 : Rat) / 61361235213659136) [(1, 1), (3, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(2, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5400599085003903887 : Rat) / 572704861994151936) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-53417767260921 : Rat) / 60874241283392) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((17805922420307 : Rat) / 243496965133568) [(2, 2), (10, 1), (16, 1)],
  term ((-483081880664724578339 : Rat) / 12635301017745977088) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((22410393731151729761765 : Rat) / 606494448851806900224) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((1774961441339780299775 : Rat) / 101082408141967816704) [(2, 2), (11, 2), (16, 1)],
  term ((-108002022700487081 : Rat) / 11608882337719296) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((13309184894211347 : Rat) / 2556718133902464) [(2, 2), (14, 1), (16, 1)],
  term ((3534350192127797099 : Rat) / 859057292991227904) [(2, 2), (15, 2), (16, 1)],
  term ((-267028701921311135 : Rat) / 122722470427318272) [(2, 2), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5400599085003903887 : Rat) / 572704861994151936) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(3, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-53417767260921 : Rat) / 60874241283392) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((17805922420307 : Rat) / 243496965133568) [(3, 2), (10, 1), (16, 1)],
  term ((-483081880664724578339 : Rat) / 12635301017745977088) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((22410393731151729761765 : Rat) / 606494448851806900224) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-72777139141045149 : Rat) / 11931351291544832) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((-210735806759522018859 : Rat) / 8423534011830651392) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((1774961441339780299775 : Rat) / 101082408141967816704) [(3, 2), (11, 2), (16, 1)],
  term ((-108002022700487081 : Rat) / 11608882337719296) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((13309184894211347 : Rat) / 2556718133902464) [(3, 2), (14, 1), (16, 1)],
  term ((3534350192127797099 : Rat) / 859057292991227904) [(3, 2), (15, 2), (16, 1)],
  term ((-267028701921311135 : Rat) / 122722470427318272) [(3, 2), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(9, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5400599085003903887 : Rat) / 572704861994151936) [(9, 1), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (15, 2), (16, 1)],
  term ((53417767260921 : Rat) / 60874241283392) [(10, 1), (15, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 243496965133568) [(10, 1), (16, 1)],
  term ((483081880664724578339 : Rat) / 12635301017745977088) [(11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22410393731151729761765 : Rat) / 606494448851806900224) [(11, 1), (15, 1), (16, 1)],
  term ((72777139141045149 : Rat) / 11931351291544832) [(11, 1), (15, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 2), (14, 1), (16, 1)],
  term ((210735806759522018859 : Rat) / 8423534011830651392) [(11, 2), (15, 2), (16, 1)],
  term ((-1774961441339780299775 : Rat) / 101082408141967816704) [(11, 2), (16, 1)],
  term ((108002022700487081 : Rat) / 11608882337719296) [(13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(14, 1), (15, 2), (16, 1)],
  term ((-13309184894211347 : Rat) / 2556718133902464) [(14, 1), (16, 1)],
  term ((-3534350192127797099 : Rat) / 859057292991227904) [(15, 2), (16, 1)],
  term ((267028701921311135 : Rat) / 122722470427318272) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 100 through 123. -/
theorem rs_R010_ueqv_R010NYY_block_07_0100_0123_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_07_0100_0123
      rs_R010_ueqv_R010NYY_block_07_0100_0123 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
