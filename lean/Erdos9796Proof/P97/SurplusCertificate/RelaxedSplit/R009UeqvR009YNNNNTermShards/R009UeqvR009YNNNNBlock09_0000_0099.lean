/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 9:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 : Poly :=
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

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0000 : Poly :=
[
  term ((30922865197688651 : Rat) / 52219282713192) []
]

/-- Partial product 0 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0000 : Poly :=
[
  term ((-30922865197688651 : Rat) / 26109641356596) [(0, 1), (2, 1)],
  term ((30922865197688651 : Rat) / 26109641356596) [(0, 1), (12, 1)],
  term ((-30922865197688651 : Rat) / 26109641356596) [(1, 1), (3, 1)],
  term ((30922865197688651 : Rat) / 26109641356596) [(1, 1), (13, 1)],
  term ((30922865197688651 : Rat) / 52219282713192) [(2, 2)],
  term ((30922865197688651 : Rat) / 52219282713192) [(3, 2)],
  term ((-30922865197688651 : Rat) / 52219282713192) [(12, 2)],
  term ((-30922865197688651 : Rat) / 52219282713192) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0000
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0001 : Poly :=
[
  term ((-11370274111255853 : Rat) / 17406427571064) [(0, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0001 : Poly :=
[
  term ((11370274111255853 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1)],
  term ((-11370274111255853 : Rat) / 8703213785532) [(0, 1), (1, 1), (13, 1)],
  term ((-11370274111255853 : Rat) / 17406427571064) [(0, 1), (2, 2)],
  term ((-11370274111255853 : Rat) / 17406427571064) [(0, 1), (3, 2)],
  term ((11370274111255853 : Rat) / 17406427571064) [(0, 1), (12, 2)],
  term ((11370274111255853 : Rat) / 17406427571064) [(0, 1), (13, 2)],
  term ((11370274111255853 : Rat) / 8703213785532) [(0, 2), (2, 1)],
  term ((-11370274111255853 : Rat) / 8703213785532) [(0, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0001
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0002 : Poly :=
[
  term ((-2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0002 : Poly :=
[
  term ((-2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1), (12, 2)],
  term ((2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((-2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 3)],
  term ((-2076886323547345 : Rat) / 26109641356596) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((2076886323547345 : Rat) / 26109641356596) [(0, 1), (1, 2), (3, 2)],
  term ((2076886323547345 : Rat) / 26109641356596) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((-2076886323547345 : Rat) / 26109641356596) [(0, 2), (1, 1), (3, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0002
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0003 : Poly :=
[
  term ((1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0003 : Poly :=
[
  term ((1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((-1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((-1388685846372571 : Rat) / 2175803446383) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((1388685846372571 : Rat) / 2175803446383) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-1388685846372571 : Rat) / 2175803446383) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((1388685846372571 : Rat) / 2175803446383) [(0, 2), (1, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0003
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0004 : Poly :=
[
  term ((-2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0004 : Poly :=
[
  term ((-2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((2400282914965 : Rat) / 6744934476) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((-2400282914965 : Rat) / 6744934476) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((2400282914965 : Rat) / 6744934476) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term ((-2400282914965 : Rat) / 6744934476) [(0, 2), (1, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0004
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0005 : Poly :=
[
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0005 : Poly :=
[
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0005
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0006 : Poly :=
[
  term ((98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0006 : Poly :=
[
  term ((98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (13, 3)],
  term ((-98924091250783 : Rat) / 266424911802) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((98924091250783 : Rat) / 266424911802) [(0, 1), (1, 2), (13, 2)],
  term ((-98924091250783 : Rat) / 266424911802) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((98924091250783 : Rat) / 266424911802) [(0, 2), (1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0006
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0007 : Poly :=
[
  term ((-355 : Rat) / 42) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0007 : Poly :=
[
  term ((-355 : Rat) / 42) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-355 : Rat) / 42) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((355 : Rat) / 42) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((355 : Rat) / 42) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((355 : Rat) / 21) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-355 : Rat) / 21) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((355 : Rat) / 21) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-355 : Rat) / 21) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0007
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0008 : Poly :=
[
  term ((-342738705292465 : Rat) / 644682502632) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0008 : Poly :=
[
  term ((-342738705292465 : Rat) / 644682502632) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-342738705292465 : Rat) / 644682502632) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((342738705292465 : Rat) / 644682502632) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((342738705292465 : Rat) / 644682502632) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((342738705292465 : Rat) / 322341251316) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-342738705292465 : Rat) / 322341251316) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((342738705292465 : Rat) / 322341251316) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-342738705292465 : Rat) / 322341251316) [(0, 2), (1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0008
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0009 : Poly :=
[
  term ((146 : Rat) / 21) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0009 : Poly :=
[
  term ((146 : Rat) / 21) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((146 : Rat) / 21) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-146 : Rat) / 21) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-146 : Rat) / 21) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-292 : Rat) / 21) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((292 : Rat) / 21) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-292 : Rat) / 21) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((292 : Rat) / 21) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0009
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0010 : Poly :=
[
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2)]
]

/-- Partial product 10 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0010 : Poly :=
[
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 2)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (3, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (12, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (13, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (3, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (13, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (2, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0010
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0011 : Poly :=
[
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0011 : Poly :=
[
  term ((-369246208469699 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((369246208469699 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (3, 2)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (12, 2)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (13, 2)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 3)],
  term ((369246208469699 : Rat) / 1450535630922) [(0, 2), (2, 1), (12, 1)],
  term ((-369246208469699 : Rat) / 1450535630922) [(0, 2), (2, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0011
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0012 : Poly :=
[
  term ((13348740088950953 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0012 : Poly :=
[
  term ((13348740088950953 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-13348740088950953 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((13348740088950953 : Rat) / 52219282713192) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((-13348740088950953 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1), (12, 2)],
  term ((-13348740088950953 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1), (13, 2)],
  term ((13348740088950953 : Rat) / 52219282713192) [(0, 1), (3, 3), (7, 1)],
  term ((-13348740088950953 : Rat) / 26109641356596) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((13348740088950953 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0012
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0013 : Poly :=
[
  term ((2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0013 : Poly :=
[
  term ((2700046754119 : Rat) / 7708496544) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-2700046754119 : Rat) / 7708496544) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((2700046754119 : Rat) / 15416993088) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((-2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1), (12, 2)],
  term ((-2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((2700046754119 : Rat) / 15416993088) [(0, 1), (3, 3), (9, 1)],
  term ((-2700046754119 : Rat) / 7708496544) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((2700046754119 : Rat) / 7708496544) [(0, 2), (3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0013
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0014 : Poly :=
[
  term ((-2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0014 : Poly :=
[
  term ((-2500010837845201 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((2500010837845201 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-2500010837845201 : Rat) / 52219282713192) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((-2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 3), (11, 1)],
  term ((2500010837845201 : Rat) / 26109641356596) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((-2500010837845201 : Rat) / 26109641356596) [(0, 2), (3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0014
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0015 : Poly :=
[
  term ((-811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0015 : Poly :=
[
  term ((-811459086674035 : Rat) / 2131399294416) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((811459086674035 : Rat) / 2131399294416) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-811459086674035 : Rat) / 4262798588832) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (13, 3)],
  term ((-811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 3), (13, 1)],
  term ((811459086674035 : Rat) / 2131399294416) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((-811459086674035 : Rat) / 2131399294416) [(0, 2), (3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0015
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0016 : Poly :=
[
  term ((2095 : Rat) / 336) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0016 : Poly :=
[
  term ((2095 : Rat) / 168) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-2095 : Rat) / 168) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((2095 : Rat) / 336) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-2095 : Rat) / 336) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2095 : Rat) / 336) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term ((2095 : Rat) / 336) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((-2095 : Rat) / 168) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((2095 : Rat) / 168) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0016
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0017 : Poly :=
[
  term ((3625065790056947 : Rat) / 26109641356596) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0017 : Poly :=
[
  term ((3625065790056947 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-3625065790056947 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((3625065790056947 : Rat) / 26109641356596) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-3625065790056947 : Rat) / 26109641356596) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-3625065790056947 : Rat) / 26109641356596) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((3625065790056947 : Rat) / 26109641356596) [(0, 1), (3, 3), (15, 1)],
  term ((-3625065790056947 : Rat) / 13054820678298) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((3625065790056947 : Rat) / 13054820678298) [(0, 2), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0017
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0018 : Poly :=
[
  term ((-415 : Rat) / 84) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0018 : Poly :=
[
  term ((-415 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((415 : Rat) / 42) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-415 : Rat) / 84) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((415 : Rat) / 84) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((415 : Rat) / 84) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-415 : Rat) / 84) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((415 : Rat) / 42) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-415 : Rat) / 42) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0018
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0019 : Poly :=
[
  term ((3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2)]
]

/-- Partial product 19 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0019 : Poly :=
[
  term ((3759648208782605 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-3759648208782605 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 3)],
  term ((3759648208782605 : Rat) / 52219282713192) [(0, 1), (2, 2), (3, 2)],
  term ((-3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2), (12, 2)],
  term ((-3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2), (13, 2)],
  term ((3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 4)],
  term ((-3759648208782605 : Rat) / 26109641356596) [(0, 2), (2, 1), (3, 2)],
  term ((3759648208782605 : Rat) / 26109641356596) [(0, 2), (3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0019
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0020 : Poly :=
[
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0020 : Poly :=
[
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (6, 1), (13, 1)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (2, 2), (6, 1)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (3, 2), (6, 1)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (12, 2)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (13, 2)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 2), (2, 1), (6, 1)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 2), (6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0020
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0021 : Poly :=
[
  term ((-41195805866345 : Rat) / 26979737904) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0021 : Poly :=
[
  term ((41195805866345 : Rat) / 13489868952) [(0, 1), (1, 1), (3, 1), (7, 1), (9, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((41195805866345 : Rat) / 26979737904) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(0, 2), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0021
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0022 : Poly :=
[
  term ((3770747598677953 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0022 : Poly :=
[
  term ((-3770747598677953 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((3770747598677953 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((3770747598677953 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((3770747598677953 : Rat) / 4351606892766) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-3770747598677953 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-3770747598677953 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((-3770747598677953 : Rat) / 2175803446383) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((3770747598677953 : Rat) / 2175803446383) [(0, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0022
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0023 : Poly :=
[
  term ((1679838738623195 : Rat) / 1065699647208) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0023 : Poly :=
[
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((1679838738623195 : Rat) / 1065699647208) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(0, 1), (7, 1), (13, 3)],
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(0, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0023
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0024 : Poly :=
[
  term ((-2615 : Rat) / 84) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0024 : Poly :=
[
  term ((2615 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 42) [(0, 1), (1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-2615 : Rat) / 84) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((2615 : Rat) / 42) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 42) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0024
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0025 : Poly :=
[
  term ((-8127955008006389 : Rat) / 5802142523688) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0025 : Poly :=
[
  term ((8127955008006389 : Rat) / 2901071261844) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-8127955008006389 : Rat) / 2901071261844) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-8127955008006389 : Rat) / 5802142523688) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-8127955008006389 : Rat) / 5802142523688) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((8127955008006389 : Rat) / 5802142523688) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((8127955008006389 : Rat) / 5802142523688) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((8127955008006389 : Rat) / 2901071261844) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-8127955008006389 : Rat) / 2901071261844) [(0, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0025
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0026 : Poly :=
[
  term ((503 : Rat) / 21) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0026 : Poly :=
[
  term ((-1006 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((1006 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((503 : Rat) / 21) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((503 : Rat) / 21) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-503 : Rat) / 21) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-503 : Rat) / 21) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1006 : Rat) / 21) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((1006 : Rat) / 21) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0026
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0027 : Poly :=
[
  term ((-11857694119158851 : Rat) / 8703213785532) [(0, 1), (7, 2)]
]

/-- Partial product 27 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0027 : Poly :=
[
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (7, 2)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(0, 1), (2, 2), (7, 2)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(0, 1), (3, 2), (7, 2)],
  term ((11857694119158851 : Rat) / 8703213785532) [(0, 1), (7, 2), (12, 2)],
  term ((11857694119158851 : Rat) / 8703213785532) [(0, 1), (7, 2), (13, 2)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 2), (2, 1), (7, 2)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 2), (7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0027
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0028 : Poly :=
[
  term ((-9438216529885 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 28 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0028 : Poly :=
[
  term ((9438216529885 : Rat) / 26979737904) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-9438216529885 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-9438216529885 : Rat) / 53959475808) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-9438216529885 : Rat) / 53959475808) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((9438216529885 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((9438216529885 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((9438216529885 : Rat) / 26979737904) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-9438216529885 : Rat) / 26979737904) [(0, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0028
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0029 : Poly :=
[
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 29 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0029 : Poly :=
[
  term ((108242905555 : Rat) / 374718582) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (13, 3)],
  term ((108242905555 : Rat) / 374718582) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0029
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0030 : Poly :=
[
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0030 : Poly :=
[
  term ((-115 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((115 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (13, 2), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((115 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0030
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0031 : Poly :=
[
  term ((121071751281143 : Rat) / 107918951616) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 31 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0031 : Poly :=
[
  term ((-121071751281143 : Rat) / 53959475808) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((121071751281143 : Rat) / 53959475808) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((121071751281143 : Rat) / 107918951616) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((121071751281143 : Rat) / 107918951616) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-121071751281143 : Rat) / 107918951616) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-121071751281143 : Rat) / 107918951616) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-121071751281143 : Rat) / 53959475808) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((121071751281143 : Rat) / 53959475808) [(0, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0031
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0032 : Poly :=
[
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0032 : Poly :=
[
  term ((92 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0032
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0033 : Poly :=
[
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2)]
]

/-- Partial product 33 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0033 : Poly :=
[
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (3, 1), (9, 2)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (2, 2), (9, 2)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (3, 2), (9, 2)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 2)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (13, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 2), (2, 1), (9, 2)],
  term ((249803199295 : Rat) / 749437164) [(0, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0033
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0034 : Poly :=
[
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1)]
]

/-- Partial product 34 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0034 : Poly :=
[
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((-9387371864538683 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (2, 2), (10, 1)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (3, 2), (10, 1)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1), (12, 2)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1), (13, 2)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 2), (2, 1), (10, 1)],
  term ((-9387371864538683 : Rat) / 8703213785532) [(0, 2), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0034
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0035 : Poly :=
[
  term ((409147947228343 : Rat) / 2131399294416) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 35 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0035 : Poly :=
[
  term ((-409147947228343 : Rat) / 1065699647208) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((409147947228343 : Rat) / 1065699647208) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((409147947228343 : Rat) / 2131399294416) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((409147947228343 : Rat) / 2131399294416) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-409147947228343 : Rat) / 2131399294416) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-409147947228343 : Rat) / 2131399294416) [(0, 1), (11, 1), (13, 3)],
  term ((-409147947228343 : Rat) / 1065699647208) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((409147947228343 : Rat) / 1065699647208) [(0, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0035
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0036 : Poly :=
[
  term ((605 : Rat) / 168) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 36 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0036 : Poly :=
[
  term ((-605 : Rat) / 84) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((605 : Rat) / 84) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((605 : Rat) / 168) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((605 : Rat) / 168) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-605 : Rat) / 168) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-605 : Rat) / 168) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-605 : Rat) / 84) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((605 : Rat) / 84) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0036
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0037 : Poly :=
[
  term ((-6268129881324529 : Rat) / 17406427571064) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 37 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0037 : Poly :=
[
  term ((6268129881324529 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-6268129881324529 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6268129881324529 : Rat) / 17406427571064) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-6268129881324529 : Rat) / 17406427571064) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((6268129881324529 : Rat) / 17406427571064) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((6268129881324529 : Rat) / 17406427571064) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((6268129881324529 : Rat) / 8703213785532) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-6268129881324529 : Rat) / 8703213785532) [(0, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0037
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0038 : Poly :=
[
  term ((-149 : Rat) / 42) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0038 : Poly :=
[
  term ((149 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-149 : Rat) / 21) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149 : Rat) / 42) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-149 : Rat) / 42) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((149 : Rat) / 42) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((149 : Rat) / 42) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((149 : Rat) / 21) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-149 : Rat) / 21) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0038
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0039 : Poly :=
[
  term ((1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2)]
]

/-- Partial product 39 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0039 : Poly :=
[
  term ((-1803909535892029 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((1803909535892029 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((1803909535892029 : Rat) / 8703213785532) [(0, 1), (2, 2), (11, 2)],
  term ((1803909535892029 : Rat) / 8703213785532) [(0, 1), (3, 2), (11, 2)],
  term ((-1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2), (12, 2)],
  term ((-1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2), (13, 2)],
  term ((-1803909535892029 : Rat) / 4351606892766) [(0, 2), (2, 1), (11, 2)],
  term ((1803909535892029 : Rat) / 4351606892766) [(0, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0039
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0040 : Poly :=
[
  term ((-4769602097387717 : Rat) / 4262798588832) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0040 : Poly :=
[
  term ((4769602097387717 : Rat) / 2131399294416) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-4769602097387717 : Rat) / 2131399294416) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-4769602097387717 : Rat) / 4262798588832) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-4769602097387717 : Rat) / 4262798588832) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((4769602097387717 : Rat) / 4262798588832) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((4769602097387717 : Rat) / 4262798588832) [(0, 1), (13, 3), (15, 1)],
  term ((4769602097387717 : Rat) / 2131399294416) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-4769602097387717 : Rat) / 2131399294416) [(0, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0040
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0041 : Poly :=
[
  term ((10985 : Rat) / 336) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0041 : Poly :=
[
  term ((-10985 : Rat) / 168) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 168) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((10985 : Rat) / 336) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 336) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 336) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 336) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 168) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 168) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0041
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0042 : Poly :=
[
  term ((-2424624353532989 : Rat) / 17406427571064) [(0, 1), (14, 1)]
]

/-- Partial product 42 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0042 : Poly :=
[
  term ((2424624353532989 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((-2424624353532989 : Rat) / 8703213785532) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((-2424624353532989 : Rat) / 17406427571064) [(0, 1), (2, 2), (14, 1)],
  term ((-2424624353532989 : Rat) / 17406427571064) [(0, 1), (3, 2), (14, 1)],
  term ((2424624353532989 : Rat) / 17406427571064) [(0, 1), (12, 2), (14, 1)],
  term ((2424624353532989 : Rat) / 17406427571064) [(0, 1), (13, 2), (14, 1)],
  term ((2424624353532989 : Rat) / 8703213785532) [(0, 2), (2, 1), (14, 1)],
  term ((-2424624353532989 : Rat) / 8703213785532) [(0, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0042
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0043 : Poly :=
[
  term ((30071251642097437 : Rat) / 17406427571064) [(0, 1), (15, 2)]
]

/-- Partial product 43 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0043 : Poly :=
[
  term ((-30071251642097437 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((30071251642097437 : Rat) / 8703213785532) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((30071251642097437 : Rat) / 17406427571064) [(0, 1), (2, 2), (15, 2)],
  term ((30071251642097437 : Rat) / 17406427571064) [(0, 1), (3, 2), (15, 2)],
  term ((-30071251642097437 : Rat) / 17406427571064) [(0, 1), (12, 2), (15, 2)],
  term ((-30071251642097437 : Rat) / 17406427571064) [(0, 1), (13, 2), (15, 2)],
  term ((-30071251642097437 : Rat) / 8703213785532) [(0, 2), (2, 1), (15, 2)],
  term ((30071251642097437 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0043
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0044 : Poly :=
[
  term ((-2201 : Rat) / 84) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 44 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0044 : Poly :=
[
  term ((2201 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-2201 : Rat) / 42) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2201 : Rat) / 84) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-2201 : Rat) / 84) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((2201 : Rat) / 84) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((2201 : Rat) / 84) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((2201 : Rat) / 42) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-2201 : Rat) / 42) [(0, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0044
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0045 : Poly :=
[
  term ((-17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 45 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0045 : Poly :=
[
  term ((-17863087094824457 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1)],
  term ((17863087094824457 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1), (12, 2)],
  term ((17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((-17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 3)],
  term ((-17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 3), (3, 1)],
  term ((-17863087094824457 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((17863087094824457 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0045
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0046 : Poly :=
[
  term ((-2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 46 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0046 : Poly :=
[
  term ((-2034064852007831 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term ((2034064852007831 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((-2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1), (12, 2)],
  term ((2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((-2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 3), (7, 1)],
  term ((2034064852007831 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-2034064852007831 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0046
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0047 : Poly :=
[
  term ((-29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 47 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0047 : Poly :=
[
  term ((-29804779978493 : Rat) / 53959475808) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1)],
  term ((29804779978493 : Rat) / 53959475808) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1), (12, 2)],
  term ((29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1), (13, 2)],
  term ((-29804779978493 : Rat) / 107918951616) [(1, 1), (2, 3), (9, 1)],
  term ((29804779978493 : Rat) / 53959475808) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-29804779978493 : Rat) / 53959475808) [(1, 2), (2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0047
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0048 : Poly :=
[
  term ((1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 48 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0048 : Poly :=
[
  term ((1546237556623301 : Rat) / 3729948765228) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-1546237556623301 : Rat) / 3729948765228) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 3), (11, 1)],
  term ((-1546237556623301 : Rat) / 3729948765228) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((1546237556623301 : Rat) / 3729948765228) [(1, 2), (2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0048
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0049 : Poly :=
[
  term ((1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 49 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0049 : Poly :=
[
  term ((1255706151605783 : Rat) / 2131399294416) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((-1255706151605783 : Rat) / 2131399294416) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((-1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (13, 3)],
  term ((1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 3), (13, 1)],
  term ((-1255706151605783 : Rat) / 2131399294416) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((1255706151605783 : Rat) / 2131399294416) [(1, 2), (2, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0049
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0050 : Poly :=
[
  term ((-4835 : Rat) / 336) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0050 : Poly :=
[
  term ((-4835 : Rat) / 168) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((4835 : Rat) / 168) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-4835 : Rat) / 336) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((4835 : Rat) / 336) [(1, 1), (2, 1), (12, 2), (13, 1), (16, 1)],
  term ((4835 : Rat) / 336) [(1, 1), (2, 1), (13, 3), (16, 1)],
  term ((-4835 : Rat) / 336) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((4835 : Rat) / 168) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-4835 : Rat) / 168) [(1, 2), (2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0050
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0051 : Poly :=
[
  term ((20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 51 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0051 : Poly :=
[
  term ((20197029797692999 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-20197029797692999 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 3), (15, 1)],
  term ((-20197029797692999 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((20197029797692999 : Rat) / 26109641356596) [(1, 2), (2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0051
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0052 : Poly :=
[
  term ((995 : Rat) / 84) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0052 : Poly :=
[
  term ((995 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-995 : Rat) / 42) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((995 : Rat) / 84) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-995 : Rat) / 84) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-995 : Rat) / 84) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((995 : Rat) / 84) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-995 : Rat) / 42) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((995 : Rat) / 42) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0052
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0053 : Poly :=
[
  term ((767179650943919 : Rat) / 2486632510152) [(1, 1), (3, 1)]
]

/-- Partial product 53 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0053 : Poly :=
[
  term ((-767179650943919 : Rat) / 1243316255076) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((767179650943919 : Rat) / 1243316255076) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((767179650943919 : Rat) / 2486632510152) [(1, 1), (2, 2), (3, 1)],
  term ((-767179650943919 : Rat) / 2486632510152) [(1, 1), (3, 1), (12, 2)],
  term ((-767179650943919 : Rat) / 2486632510152) [(1, 1), (3, 1), (13, 2)],
  term ((767179650943919 : Rat) / 2486632510152) [(1, 1), (3, 3)],
  term ((767179650943919 : Rat) / 1243316255076) [(1, 2), (3, 1), (13, 1)],
  term ((-767179650943919 : Rat) / 1243316255076) [(1, 2), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0053
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0054 : Poly :=
[
  term ((-3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 54 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0054 : Poly :=
[
  term ((7266121881498226 : Rat) / 19582231017447) [(0, 1), (1, 1), (2, 1), (3, 1), (6, 1)],
  term ((-7266121881498226 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1)],
  term ((-3633060940749113 : Rat) / 19582231017447) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (12, 2)],
  term ((3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (13, 2)],
  term ((-3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 3), (6, 1)],
  term ((-7266121881498226 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((7266121881498226 : Rat) / 19582231017447) [(1, 2), (3, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0054
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0055 : Poly :=
[
  term ((317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 55 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0055 : Poly :=
[
  term ((-317737054294735 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((317737054294735 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1)],
  term ((317737054294735 : Rat) / 8703213785532) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((-317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (12, 2)],
  term ((-317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (13, 2)],
  term ((317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 3), (10, 1)],
  term ((317737054294735 : Rat) / 4351606892766) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((-317737054294735 : Rat) / 4351606892766) [(1, 2), (3, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0055
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0056 : Poly :=
[
  term ((-579016817225395 : Rat) / 2486632510152) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 56 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0056 : Poly :=
[
  term ((579016817225395 : Rat) / 1243316255076) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-579016817225395 : Rat) / 1243316255076) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-579016817225395 : Rat) / 2486632510152) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((579016817225395 : Rat) / 2486632510152) [(1, 1), (3, 1), (12, 2), (14, 1)],
  term ((579016817225395 : Rat) / 2486632510152) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-579016817225395 : Rat) / 2486632510152) [(1, 1), (3, 3), (14, 1)],
  term ((-579016817225395 : Rat) / 1243316255076) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((579016817225395 : Rat) / 1243316255076) [(1, 2), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0056
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0057 : Poly :=
[
  term ((10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 57 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0057 : Poly :=
[
  term ((-20375395317189112 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((20375395317189112 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((10187697658594556 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((10187697658594556 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((-10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 2)],
  term ((-10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((-20375395317189112 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((20375395317189112 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0057
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0058 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 58 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0058 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (2, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0058
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0059 : Poly :=
[
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 59 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0059 : Poly :=
[
  term ((33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((33885160769843255 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(1, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0059
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0060 : Poly :=
[
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 60 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0060 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (13, 3)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0060
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0061 : Poly :=
[
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0061 : Poly :=
[
  term ((-170 : Rat) / 63) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0061
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0062 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 62 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0062 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 2), (6, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (3, 2), (6, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0062
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0063 : Poly :=
[
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 63 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0063 : Poly :=
[
  term ((-24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(1, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0063
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0064 : Poly :=
[
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0064 : Poly :=
[
  term ((32 : Rat) / 9) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0064
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0065 : Poly :=
[
  term ((-748340303195557 : Rat) / 1864974382614) [(1, 1), (7, 1)]
]

/-- Partial product 65 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0065 : Poly :=
[
  term ((748340303195557 : Rat) / 932487191307) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term ((-748340303195557 : Rat) / 932487191307) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-748340303195557 : Rat) / 1864974382614) [(1, 1), (2, 2), (7, 1)],
  term ((-748340303195557 : Rat) / 1864974382614) [(1, 1), (3, 2), (7, 1)],
  term ((748340303195557 : Rat) / 1864974382614) [(1, 1), (7, 1), (12, 2)],
  term ((748340303195557 : Rat) / 1864974382614) [(1, 1), (7, 1), (13, 2)],
  term ((748340303195557 : Rat) / 932487191307) [(1, 2), (3, 1), (7, 1)],
  term ((-748340303195557 : Rat) / 932487191307) [(1, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0065
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0066 : Poly :=
[
  term ((-9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 66 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0066 : Poly :=
[
  term ((9026606790637963 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-9026606790637963 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-9026606790637963 : Rat) / 26109641356596) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((-9026606790637963 : Rat) / 26109641356596) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((9026606790637963 : Rat) / 13054820678298) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-9026606790637963 : Rat) / 13054820678298) [(1, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0066
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0067 : Poly :=
[
  term ((-2572563435336311 : Rat) / 17406427571064) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 67 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0067 : Poly :=
[
  term ((2572563435336311 : Rat) / 8703213785532) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1)],
  term ((-2572563435336311 : Rat) / 8703213785532) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-2572563435336311 : Rat) / 17406427571064) [(1, 1), (2, 2), (7, 1), (14, 1)],
  term ((-2572563435336311 : Rat) / 17406427571064) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((2572563435336311 : Rat) / 17406427571064) [(1, 1), (7, 1), (12, 2), (14, 1)],
  term ((2572563435336311 : Rat) / 17406427571064) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((2572563435336311 : Rat) / 8703213785532) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-2572563435336311 : Rat) / 8703213785532) [(1, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0067
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0068 : Poly :=
[
  term ((-6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1)]
]

/-- Partial product 68 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0068 : Poly :=
[
  term ((6245079982375 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((-6245079982375 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((-6245079982375 : Rat) / 26979737904) [(1, 1), (2, 2), (9, 1)],
  term ((-6245079982375 : Rat) / 26979737904) [(1, 1), (3, 2), (9, 1)],
  term ((6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1), (12, 2)],
  term ((6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1), (13, 2)],
  term ((6245079982375 : Rat) / 13489868952) [(1, 2), (3, 1), (9, 1)],
  term ((-6245079982375 : Rat) / 13489868952) [(1, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0068
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0069 : Poly :=
[
  term ((7113960675575 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 69 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0069 : Poly :=
[
  term ((-7113960675575 : Rat) / 8993245968) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((7113960675575 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((7113960675575 : Rat) / 17986491936) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((7113960675575 : Rat) / 17986491936) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((-7113960675575 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-7113960675575 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-7113960675575 : Rat) / 8993245968) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((7113960675575 : Rat) / 8993245968) [(1, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0069
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0070 : Poly :=
[
  term ((-38202511878271 : Rat) / 107918951616) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 70 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0070 : Poly :=
[
  term ((38202511878271 : Rat) / 53959475808) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-38202511878271 : Rat) / 53959475808) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-38202511878271 : Rat) / 107918951616) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((-38202511878271 : Rat) / 107918951616) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((38202511878271 : Rat) / 107918951616) [(1, 1), (9, 1), (12, 2), (14, 1)],
  term ((38202511878271 : Rat) / 107918951616) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((38202511878271 : Rat) / 53959475808) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-38202511878271 : Rat) / 53959475808) [(1, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0070
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0071 : Poly :=
[
  term ((-59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 71 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0071 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((119808 : Rat) / 553) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0071
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0072 : Poly :=
[
  term ((-289451492341829 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 72 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0072 : Poly :=
[
  term ((289451492341829 : Rat) / 355233215736) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-289451492341829 : Rat) / 355233215736) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-289451492341829 : Rat) / 710466431472) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((-289451492341829 : Rat) / 710466431472) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((289451492341829 : Rat) / 710466431472) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((289451492341829 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 3)],
  term ((289451492341829 : Rat) / 355233215736) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((-289451492341829 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0072
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0073 : Poly :=
[
  term ((585 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0073 : Poly :=
[
  term ((-585 : Rat) / 28) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((585 : Rat) / 28) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((585 : Rat) / 56) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((585 : Rat) / 56) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-585 : Rat) / 56) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-585 : Rat) / 56) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((-585 : Rat) / 28) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((585 : Rat) / 28) [(1, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0073
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0074 : Poly :=
[
  term ((19330400855593763 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 74 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0074 : Poly :=
[
  term ((-19330400855593763 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((19330400855593763 : Rat) / 13054820678298) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((19330400855593763 : Rat) / 26109641356596) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((19330400855593763 : Rat) / 26109641356596) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-19330400855593763 : Rat) / 26109641356596) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-19330400855593763 : Rat) / 26109641356596) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-19330400855593763 : Rat) / 13054820678298) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((19330400855593763 : Rat) / 13054820678298) [(1, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0074
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0075 : Poly :=
[
  term ((-113 : Rat) / 14) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0075 : Poly :=
[
  term ((113 : Rat) / 7) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-113 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-113 : Rat) / 14) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-113 : Rat) / 14) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((113 : Rat) / 14) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((113 : Rat) / 14) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((113 : Rat) / 7) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-113 : Rat) / 7) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0075
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0076 : Poly :=
[
  term ((-2231620312987207 : Rat) / 8703213785532) [(1, 1), (11, 1)]
]

/-- Partial product 76 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0076 : Poly :=
[
  term ((2231620312987207 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((-2231620312987207 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-2231620312987207 : Rat) / 8703213785532) [(1, 1), (2, 2), (11, 1)],
  term ((-2231620312987207 : Rat) / 8703213785532) [(1, 1), (3, 2), (11, 1)],
  term ((2231620312987207 : Rat) / 8703213785532) [(1, 1), (11, 1), (12, 2)],
  term ((2231620312987207 : Rat) / 8703213785532) [(1, 1), (11, 1), (13, 2)],
  term ((2231620312987207 : Rat) / 4351606892766) [(1, 2), (3, 1), (11, 1)],
  term ((-2231620312987207 : Rat) / 4351606892766) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0076
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0077 : Poly :=
[
  term ((-2384914308836225 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 77 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0077 : Poly :=
[
  term ((2384914308836225 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-2384914308836225 : Rat) / 26109641356596) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2384914308836225 : Rat) / 52219282713192) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-2384914308836225 : Rat) / 52219282713192) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((2384914308836225 : Rat) / 52219282713192) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((2384914308836225 : Rat) / 52219282713192) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((2384914308836225 : Rat) / 26109641356596) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-2384914308836225 : Rat) / 26109641356596) [(1, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0077
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0078 : Poly :=
[
  term ((14620315676843735 : Rat) / 52219282713192) [(1, 1), (13, 1)]
]

/-- Partial product 78 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0078 : Poly :=
[
  term ((-14620315676843735 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((14620315676843735 : Rat) / 26109641356596) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((14620315676843735 : Rat) / 52219282713192) [(1, 1), (2, 2), (13, 1)],
  term ((14620315676843735 : Rat) / 52219282713192) [(1, 1), (3, 2), (13, 1)],
  term ((-14620315676843735 : Rat) / 52219282713192) [(1, 1), (12, 2), (13, 1)],
  term ((-14620315676843735 : Rat) / 52219282713192) [(1, 1), (13, 3)],
  term ((-14620315676843735 : Rat) / 26109641356596) [(1, 2), (3, 1), (13, 1)],
  term ((14620315676843735 : Rat) / 26109641356596) [(1, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0078
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0079 : Poly :=
[
  term ((1545034311283165 : Rat) / 4262798588832) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 79 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0079 : Poly :=
[
  term ((-1545034311283165 : Rat) / 2131399294416) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)],
  term ((1545034311283165 : Rat) / 2131399294416) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((1545034311283165 : Rat) / 4262798588832) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((1545034311283165 : Rat) / 4262798588832) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-1545034311283165 : Rat) / 4262798588832) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1545034311283165 : Rat) / 4262798588832) [(1, 1), (13, 3), (14, 1)],
  term ((-1545034311283165 : Rat) / 2131399294416) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((1545034311283165 : Rat) / 2131399294416) [(1, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0079
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0080 : Poly :=
[
  term ((-2785 : Rat) / 336) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 80 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0080 : Poly :=
[
  term ((2785 : Rat) / 168) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2785 : Rat) / 168) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2785 : Rat) / 336) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2785 : Rat) / 336) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((2785 : Rat) / 336) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2785 : Rat) / 336) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((2785 : Rat) / 168) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2785 : Rat) / 168) [(1, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0080
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0081 : Poly :=
[
  term ((-175 : Rat) / 12) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 81 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0081 : Poly :=
[
  term ((175 : Rat) / 6) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-175 : Rat) / 6) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-175 : Rat) / 12) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-175 : Rat) / 12) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((175 : Rat) / 12) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((175 : Rat) / 12) [(1, 1), (13, 3), (16, 1)],
  term ((175 : Rat) / 6) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-175 : Rat) / 6) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0081
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0082 : Poly :=
[
  term ((-36814971085011167 : Rat) / 52219282713192) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 82 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0082 : Poly :=
[
  term ((36814971085011167 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-36814971085011167 : Rat) / 26109641356596) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-36814971085011167 : Rat) / 52219282713192) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-36814971085011167 : Rat) / 52219282713192) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((36814971085011167 : Rat) / 52219282713192) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((36814971085011167 : Rat) / 52219282713192) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((36814971085011167 : Rat) / 26109641356596) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-36814971085011167 : Rat) / 26109641356596) [(1, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0082
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0083 : Poly :=
[
  term ((529 : Rat) / 84) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0083 : Poly :=
[
  term ((-529 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((529 : Rat) / 42) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((529 : Rat) / 84) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((529 : Rat) / 84) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-529 : Rat) / 84) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-529 : Rat) / 84) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-529 : Rat) / 42) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((529 : Rat) / 42) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0083
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0084 : Poly :=
[
  term ((-9631774695566783 : Rat) / 26109641356596) [(1, 1), (15, 1)]
]

/-- Partial product 84 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0084 : Poly :=
[
  term ((9631774695566783 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((-9631774695566783 : Rat) / 13054820678298) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-9631774695566783 : Rat) / 26109641356596) [(1, 1), (2, 2), (15, 1)],
  term ((-9631774695566783 : Rat) / 26109641356596) [(1, 1), (3, 2), (15, 1)],
  term ((9631774695566783 : Rat) / 26109641356596) [(1, 1), (12, 2), (15, 1)],
  term ((9631774695566783 : Rat) / 26109641356596) [(1, 1), (13, 2), (15, 1)],
  term ((9631774695566783 : Rat) / 13054820678298) [(1, 2), (3, 1), (15, 1)],
  term ((-9631774695566783 : Rat) / 13054820678298) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0084
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0085 : Poly :=
[
  term ((253 : Rat) / 21) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0085 : Poly :=
[
  term ((-506 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((506 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((253 : Rat) / 21) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((253 : Rat) / 21) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-253 : Rat) / 21) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-253 : Rat) / 21) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-506 : Rat) / 21) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((506 : Rat) / 21) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0085
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0086 : Poly :=
[
  term ((-175873676507441 : Rat) / 2901071261844) [(1, 2)]
]

/-- Partial product 86 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0086 : Poly :=
[
  term ((175873676507441 : Rat) / 1450535630922) [(0, 1), (1, 2), (2, 1)],
  term ((-175873676507441 : Rat) / 1450535630922) [(0, 1), (1, 2), (12, 1)],
  term ((-175873676507441 : Rat) / 2901071261844) [(1, 2), (2, 2)],
  term ((-175873676507441 : Rat) / 2901071261844) [(1, 2), (3, 2)],
  term ((175873676507441 : Rat) / 2901071261844) [(1, 2), (12, 2)],
  term ((175873676507441 : Rat) / 2901071261844) [(1, 2), (13, 2)],
  term ((175873676507441 : Rat) / 1450535630922) [(1, 3), (3, 1)],
  term ((-175873676507441 : Rat) / 1450535630922) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0086
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0087 : Poly :=
[
  term ((45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1)]
]

/-- Partial product 87 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0087 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 1), (12, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 2)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1), (3, 2)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1), (12, 2)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1), (13, 2)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 3)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 3), (2, 1), (3, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 3), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0087
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0088 : Poly :=
[
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1)]
]

/-- Partial product 88 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0088 : Poly :=
[
  term ((-45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (2, 1), (6, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (12, 1)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (2, 2), (6, 1)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (3, 2), (6, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (12, 2)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (13, 2)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 3), (3, 1), (6, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0088
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0089 : Poly :=
[
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (14, 1)]
]

/-- Partial product 89 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0089 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 2), (14, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (3, 2), (14, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 2), (12, 2), (14, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 2), (13, 2), (14, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 3), (3, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0089
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0090 : Poly :=
[
  term ((2199055021364855 : Rat) / 26109641356596) [(2, 1)]
]

/-- Partial product 90 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0090 : Poly :=
[
  term ((2199055021364855 : Rat) / 13054820678298) [(0, 1), (2, 1), (12, 1)],
  term ((-2199055021364855 : Rat) / 13054820678298) [(0, 1), (2, 2)],
  term ((-2199055021364855 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1)],
  term ((2199055021364855 : Rat) / 13054820678298) [(1, 1), (2, 1), (13, 1)],
  term ((2199055021364855 : Rat) / 26109641356596) [(2, 1), (3, 2)],
  term ((-2199055021364855 : Rat) / 26109641356596) [(2, 1), (12, 2)],
  term ((-2199055021364855 : Rat) / 26109641356596) [(2, 1), (13, 2)],
  term ((2199055021364855 : Rat) / 26109641356596) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0090
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0091 : Poly :=
[
  term ((-35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 91 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0091 : Poly :=
[
  term ((-70690683689524370 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1)],
  term ((70690683689524370 : Rat) / 19582231017447) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((-70690683689524370 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((70690683689524370 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (12, 2)],
  term ((35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (13, 2)],
  term ((-35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 3), (7, 1)],
  term ((-35345341844762185 : Rat) / 19582231017447) [(2, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0091
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0092 : Poly :=
[
  term ((-4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 92 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0092 : Poly :=
[
  term ((-4598551068761 : Rat) / 40469606856) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1)],
  term ((4598551068761 : Rat) / 40469606856) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((-4598551068761 : Rat) / 40469606856) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)],
  term ((4598551068761 : Rat) / 40469606856) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (13, 2)],
  term ((-4598551068761 : Rat) / 80939213712) [(2, 1), (3, 3), (9, 1)],
  term ((-4598551068761 : Rat) / 80939213712) [(2, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0092
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0093 : Poly :=
[
  term ((36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 93 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0093 : Poly :=
[
  term ((36306455678017967 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((-36306455678017967 : Rat) / 19582231017447) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((36306455678017967 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-36306455678017967 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1), (13, 2)],
  term ((36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 3), (11, 1)],
  term ((36306455678017967 : Rat) / 39164462034894) [(2, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0093
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0094 : Poly :=
[
  term ((95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 94 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0094 : Poly :=
[
  term ((95140102894763 : Rat) / 1598549470812) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((-95140102894763 : Rat) / 1598549470812) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((95140102894763 : Rat) / 1598549470812) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((-95140102894763 : Rat) / 1598549470812) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (12, 2), (13, 1)],
  term ((-95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (13, 3)],
  term ((95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 3), (13, 1)],
  term ((95140102894763 : Rat) / 3197098941624) [(2, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0094
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0095 : Poly :=
[
  term ((-9095 : Rat) / 252) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 95 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0095 : Poly :=
[
  term ((-9095 : Rat) / 126) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((9095 : Rat) / 126) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-9095 : Rat) / 126) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((9095 : Rat) / 126) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((9095 : Rat) / 252) [(2, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((9095 : Rat) / 252) [(2, 1), (3, 1), (13, 3), (16, 1)],
  term ((-9095 : Rat) / 252) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((-9095 : Rat) / 252) [(2, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0095
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0096 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 96 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0096 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 3), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 3), (3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0096
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0097 : Poly :=
[
  term ((-231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 97 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0097 : Poly :=
[
  term ((-231195579038557549 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((231195579038557549 : Rat) / 39164462034894) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((231195579038557549 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 3), (15, 1)],
  term ((-231195579038557549 : Rat) / 78328924069788) [(2, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0097
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0098 : Poly :=
[
  term ((1943 : Rat) / 63) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0098 : Poly :=
[
  term ((3886 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3886 : Rat) / 63) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((3886 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3886 : Rat) / 63) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1943 : Rat) / 63) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1943 : Rat) / 63) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((1943 : Rat) / 63) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((1943 : Rat) / 63) [(2, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0098
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0099 : Poly :=
[
  term ((21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2)]
]

/-- Partial product 99 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0099 : Poly :=
[
  term ((43858889654176910 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 2), (12, 1)],
  term ((-43858889654176910 : Rat) / 19582231017447) [(0, 1), (2, 2), (3, 2)],
  term ((43858889654176910 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-43858889654176910 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 3)],
  term ((-21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2), (12, 2)],
  term ((-21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2), (13, 2)],
  term ((21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 4)],
  term ((21929444827088455 : Rat) / 19582231017447) [(2, 3), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0099
        rs_R009_ueqv_R009YNNNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_09_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_09_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_09_0000,
  rs_R009_ueqv_R009YNNNN_partial_09_0001,
  rs_R009_ueqv_R009YNNNN_partial_09_0002,
  rs_R009_ueqv_R009YNNNN_partial_09_0003,
  rs_R009_ueqv_R009YNNNN_partial_09_0004,
  rs_R009_ueqv_R009YNNNN_partial_09_0005,
  rs_R009_ueqv_R009YNNNN_partial_09_0006,
  rs_R009_ueqv_R009YNNNN_partial_09_0007,
  rs_R009_ueqv_R009YNNNN_partial_09_0008,
  rs_R009_ueqv_R009YNNNN_partial_09_0009,
  rs_R009_ueqv_R009YNNNN_partial_09_0010,
  rs_R009_ueqv_R009YNNNN_partial_09_0011,
  rs_R009_ueqv_R009YNNNN_partial_09_0012,
  rs_R009_ueqv_R009YNNNN_partial_09_0013,
  rs_R009_ueqv_R009YNNNN_partial_09_0014,
  rs_R009_ueqv_R009YNNNN_partial_09_0015,
  rs_R009_ueqv_R009YNNNN_partial_09_0016,
  rs_R009_ueqv_R009YNNNN_partial_09_0017,
  rs_R009_ueqv_R009YNNNN_partial_09_0018,
  rs_R009_ueqv_R009YNNNN_partial_09_0019,
  rs_R009_ueqv_R009YNNNN_partial_09_0020,
  rs_R009_ueqv_R009YNNNN_partial_09_0021,
  rs_R009_ueqv_R009YNNNN_partial_09_0022,
  rs_R009_ueqv_R009YNNNN_partial_09_0023,
  rs_R009_ueqv_R009YNNNN_partial_09_0024,
  rs_R009_ueqv_R009YNNNN_partial_09_0025,
  rs_R009_ueqv_R009YNNNN_partial_09_0026,
  rs_R009_ueqv_R009YNNNN_partial_09_0027,
  rs_R009_ueqv_R009YNNNN_partial_09_0028,
  rs_R009_ueqv_R009YNNNN_partial_09_0029,
  rs_R009_ueqv_R009YNNNN_partial_09_0030,
  rs_R009_ueqv_R009YNNNN_partial_09_0031,
  rs_R009_ueqv_R009YNNNN_partial_09_0032,
  rs_R009_ueqv_R009YNNNN_partial_09_0033,
  rs_R009_ueqv_R009YNNNN_partial_09_0034,
  rs_R009_ueqv_R009YNNNN_partial_09_0035,
  rs_R009_ueqv_R009YNNNN_partial_09_0036,
  rs_R009_ueqv_R009YNNNN_partial_09_0037,
  rs_R009_ueqv_R009YNNNN_partial_09_0038,
  rs_R009_ueqv_R009YNNNN_partial_09_0039,
  rs_R009_ueqv_R009YNNNN_partial_09_0040,
  rs_R009_ueqv_R009YNNNN_partial_09_0041,
  rs_R009_ueqv_R009YNNNN_partial_09_0042,
  rs_R009_ueqv_R009YNNNN_partial_09_0043,
  rs_R009_ueqv_R009YNNNN_partial_09_0044,
  rs_R009_ueqv_R009YNNNN_partial_09_0045,
  rs_R009_ueqv_R009YNNNN_partial_09_0046,
  rs_R009_ueqv_R009YNNNN_partial_09_0047,
  rs_R009_ueqv_R009YNNNN_partial_09_0048,
  rs_R009_ueqv_R009YNNNN_partial_09_0049,
  rs_R009_ueqv_R009YNNNN_partial_09_0050,
  rs_R009_ueqv_R009YNNNN_partial_09_0051,
  rs_R009_ueqv_R009YNNNN_partial_09_0052,
  rs_R009_ueqv_R009YNNNN_partial_09_0053,
  rs_R009_ueqv_R009YNNNN_partial_09_0054,
  rs_R009_ueqv_R009YNNNN_partial_09_0055,
  rs_R009_ueqv_R009YNNNN_partial_09_0056,
  rs_R009_ueqv_R009YNNNN_partial_09_0057,
  rs_R009_ueqv_R009YNNNN_partial_09_0058,
  rs_R009_ueqv_R009YNNNN_partial_09_0059,
  rs_R009_ueqv_R009YNNNN_partial_09_0060,
  rs_R009_ueqv_R009YNNNN_partial_09_0061,
  rs_R009_ueqv_R009YNNNN_partial_09_0062,
  rs_R009_ueqv_R009YNNNN_partial_09_0063,
  rs_R009_ueqv_R009YNNNN_partial_09_0064,
  rs_R009_ueqv_R009YNNNN_partial_09_0065,
  rs_R009_ueqv_R009YNNNN_partial_09_0066,
  rs_R009_ueqv_R009YNNNN_partial_09_0067,
  rs_R009_ueqv_R009YNNNN_partial_09_0068,
  rs_R009_ueqv_R009YNNNN_partial_09_0069,
  rs_R009_ueqv_R009YNNNN_partial_09_0070,
  rs_R009_ueqv_R009YNNNN_partial_09_0071,
  rs_R009_ueqv_R009YNNNN_partial_09_0072,
  rs_R009_ueqv_R009YNNNN_partial_09_0073,
  rs_R009_ueqv_R009YNNNN_partial_09_0074,
  rs_R009_ueqv_R009YNNNN_partial_09_0075,
  rs_R009_ueqv_R009YNNNN_partial_09_0076,
  rs_R009_ueqv_R009YNNNN_partial_09_0077,
  rs_R009_ueqv_R009YNNNN_partial_09_0078,
  rs_R009_ueqv_R009YNNNN_partial_09_0079,
  rs_R009_ueqv_R009YNNNN_partial_09_0080,
  rs_R009_ueqv_R009YNNNN_partial_09_0081,
  rs_R009_ueqv_R009YNNNN_partial_09_0082,
  rs_R009_ueqv_R009YNNNN_partial_09_0083,
  rs_R009_ueqv_R009YNNNN_partial_09_0084,
  rs_R009_ueqv_R009YNNNN_partial_09_0085,
  rs_R009_ueqv_R009YNNNN_partial_09_0086,
  rs_R009_ueqv_R009YNNNN_partial_09_0087,
  rs_R009_ueqv_R009YNNNN_partial_09_0088,
  rs_R009_ueqv_R009YNNNN_partial_09_0089,
  rs_R009_ueqv_R009YNNNN_partial_09_0090,
  rs_R009_ueqv_R009YNNNN_partial_09_0091,
  rs_R009_ueqv_R009YNNNN_partial_09_0092,
  rs_R009_ueqv_R009YNNNN_partial_09_0093,
  rs_R009_ueqv_R009YNNNN_partial_09_0094,
  rs_R009_ueqv_R009YNNNN_partial_09_0095,
  rs_R009_ueqv_R009YNNNN_partial_09_0096,
  rs_R009_ueqv_R009YNNNN_partial_09_0097,
  rs_R009_ueqv_R009YNNNN_partial_09_0098,
  rs_R009_ueqv_R009YNNNN_partial_09_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_09_0000_0099 : Poly :=
[
  term ((-7585734807425627 : Rat) / 8703213785532) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((7266121881498226 : Rat) / 19582231017447) [(0, 1), (1, 1), (2, 1), (3, 1), (6, 1)],
  term ((-317737054294735 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-17863087094824457 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1)],
  term ((579016817225395 : Rat) / 1243316255076) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-20375395317189112 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (2, 1), (6, 1), (9, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((32 : Rat) / 9) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((748340303195557 : Rat) / 932487191307) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term ((9026606790637963 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-2034064852007831 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term ((2572563435336311 : Rat) / 8703213785532) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1)],
  term ((6245079982375 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((-7113960675575 : Rat) / 8993245968) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((-29804779978493 : Rat) / 53959475808) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1)],
  term ((38202511878271 : Rat) / 53959475808) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((289451492341829 : Rat) / 355233215736) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-585 : Rat) / 28) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((-19330400855593763 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((113 : Rat) / 7) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((2231620312987207 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((1546237556623301 : Rat) / 3729948765228) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((2384914308836225 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((1255706151605783 : Rat) / 2131399294416) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((-4835 : Rat) / 168) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((20197029797692999 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((995 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7973883924389153 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((-1545034311283165 : Rat) / 2131399294416) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)],
  term ((2785 : Rat) / 168) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((175 : Rat) / 6) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((36814971085011167 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-529 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((9631774695566783 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((-506 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((11216429288700523 : Rat) / 17406427571064) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((10366179930243257 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((20203648318633 : Rat) / 53959475808) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-14034548012903669 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((-860009786602651 : Rat) / 2131399294416) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((3415 : Rat) / 168) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-68155894724075663 : Rat) / 52219282713192) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-703 : Rat) / 42) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((11370274111255853 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((-7266121881498226 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 1), (1, 1), (3, 1), (7, 1), (9, 1)],
  term ((-3770747598677953 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-11493893017264267 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((2615 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((8127955008006389 : Rat) / 2901071261844) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-1006 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (7, 2)],
  term ((9438216529885 : Rat) / 26979737904) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((34487305678753 : Rat) / 53959475808) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-121071751281143 : Rat) / 53959475808) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((92 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (3, 1), (9, 2)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((317737054294735 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1)],
  term ((-2783141232208801 : Rat) / 5802142523688) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-605 : Rat) / 84) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((6268129881324529 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((149 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1803909535892029 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((767179650943919 : Rat) / 1243316255076) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((-579016817225395 : Rat) / 1243316255076) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1), (12, 2)],
  term ((87570343030817903 : Rat) / 34812855142128) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-4215 : Rat) / 56) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35607722599933025 : Rat) / 104438565426384) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((2095 : Rat) / 168) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((2424624353532989 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((-30071251642097437 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((2201 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-5016625010715527 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((-28501458938693 : Rat) / 53959475808) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-710874278695361 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((74189209967311603 : Rat) / 104438565426384) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-3515 : Rat) / 168) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-42262098288917453 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((101 : Rat) / 6) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1370883248730365 : Rat) / 7459897530456) [(0, 1), (1, 1), (3, 3)],
  term ((20375395317189112 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((170 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (6, 1), (13, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-9026606790637963 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((3770747598677953 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-748340303195557 : Rat) / 932487191307) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-2572563435336311 : Rat) / 8703213785532) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-8127955008006389 : Rat) / 2901071261844) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((1006 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((73979983114301129 : Rat) / 26109641356596) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((-2615 : Rat) / 42) [(0, 1), (1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((7113960675575 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-9438216529885 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-6245079982375 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((-38202511878271 : Rat) / 53959475808) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((121071751281143 : Rat) / 53959475808) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1496461685015 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((115 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (13, 2), (16, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-289451492341829 : Rat) / 355233215736) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((585 : Rat) / 28) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((19330400855593763 : Rat) / 13054820678298) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-113 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9387371864538683 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((-2231620312987207 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-2384914308836225 : Rat) / 26109641356596) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-6268129881324529 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-149 : Rat) / 21) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26470019647269931 : Rat) / 52219282713192) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((605 : Rat) / 84) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((1803909535892029 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((14620315676843735 : Rat) / 26109641356596) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((1545034311283165 : Rat) / 2131399294416) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2785 : Rat) / 168) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 6) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36814971085011167 : Rat) / 26109641356596) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((529 : Rat) / 42) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9631774695566783 : Rat) / 13054820678298) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((506 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((355 : Rat) / 42) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((342738705292465 : Rat) / 644682502632) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-146 : Rat) / 21) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11370274111255853 : Rat) / 8703213785532) [(0, 1), (1, 1), (13, 1)],
  term ((-2424624353532989 : Rat) / 8703213785532) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((30071251642097437 : Rat) / 8703213785532) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-2201 : Rat) / 42) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-178186832514618803 : Rat) / 104438565426384) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((9817 : Rat) / 168) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (13, 3)],
  term ((355 : Rat) / 42) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((175873676507441 : Rat) / 1450535630922) [(0, 1), (1, 2), (2, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (2, 1), (6, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 1), (12, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 2)],
  term ((-1388685846372571 : Rat) / 2175803446383) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((2400282914965 : Rat) / 6744934476) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-3923815755374693 : Rat) / 8703213785532) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((355 : Rat) / 21) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((342738705292465 : Rat) / 322341251316) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-292 : Rat) / 21) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((484823062796770 : Rat) / 6527410339149) [(0, 1), (1, 2), (3, 2)],
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (12, 1)],
  term ((1388685846372571 : Rat) / 2175803446383) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-2400282914965 : Rat) / 6744934476) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-175873676507441 : Rat) / 1450535630922) [(0, 1), (1, 2), (12, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (12, 2)],
  term ((-342738705292465 : Rat) / 322341251316) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((292 : Rat) / 21) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((9832155014936999 : Rat) / 26109641356596) [(0, 1), (1, 2), (13, 2)],
  term ((-355 : Rat) / 21) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (3, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (13, 1)],
  term ((-30922865197688651 : Rat) / 26109641356596) [(0, 1), (2, 1)],
  term ((-70690683689524370 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-4598551068761 : Rat) / 40469606856) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1)],
  term ((36306455678017967 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((95140102894763 : Rat) / 1598549470812) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((-9095 : Rat) / 126) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((3886 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (3, 2)],
  term ((43858889654176910 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 2), (12, 1)],
  term ((2199055021364855 : Rat) / 13054820678298) [(0, 1), (2, 1), (12, 1)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (12, 2)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (13, 2)],
  term ((-6129577488460997 : Rat) / 7459897530456) [(0, 1), (2, 2)],
  term ((605571689783047819 : Rat) / 156657848139576) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((93489390386587 : Rat) / 323756854848) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((-42564525419668477 : Rat) / 22379692591368) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-3195498083180209 : Rat) / 12788395766496) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((79045 : Rat) / 1008) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 2), (3, 1), (14, 1), (15, 1)],
  term ((9658497049944611 : Rat) / 1598549470812) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-16789 : Rat) / 252) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-339592172607067465 : Rat) / 156657848139576) [(0, 1), (2, 2), (3, 2)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (2, 2), (6, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((3770747598677953 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-2615 : Rat) / 84) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-8127955008006389 : Rat) / 5802142523688) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((503 : Rat) / 21) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(0, 1), (2, 2), (7, 2)],
  term ((-9438216529885 : Rat) / 53959475808) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((115 : Rat) / 14) [(0, 1), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((121071751281143 : Rat) / 107918951616) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (2, 2), (9, 2)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (2, 2), (10, 1)],
  term ((409147947228343 : Rat) / 2131399294416) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((605 : Rat) / 168) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6268129881324529 : Rat) / 17406427571064) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-149 : Rat) / 42) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1803909535892029 : Rat) / 8703213785532) [(0, 1), (2, 2), (11, 2)],
  term ((-4769602097387717 : Rat) / 4262798588832) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((10985 : Rat) / 336) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2424624353532989 : Rat) / 17406427571064) [(0, 1), (2, 2), (14, 1)],
  term ((30071251642097437 : Rat) / 17406427571064) [(0, 1), (2, 2), (15, 2)],
  term ((-2201 : Rat) / 84) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 3)],
  term ((-13348740088950953 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1), (12, 2)],
  term ((-13348740088950953 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1), (13, 2)],
  term ((-2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1), (12, 2)],
  term ((-2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((-2095 : Rat) / 336) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3625065790056947 : Rat) / 26109641356596) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((415 : Rat) / 84) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3625065790056947 : Rat) / 26109641356596) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((415 : Rat) / 84) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (13, 3)],
  term ((-2095 : Rat) / 336) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term ((-11370274111255853 : Rat) / 17406427571064) [(0, 1), (3, 2)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (3, 2), (6, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((3770747598677953 : Rat) / 4351606892766) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-2615 : Rat) / 84) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-8127955008006389 : Rat) / 5802142523688) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((503 : Rat) / 21) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(0, 1), (3, 2), (7, 2)],
  term ((-9438216529885 : Rat) / 53959475808) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((115 : Rat) / 14) [(0, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((121071751281143 : Rat) / 107918951616) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (3, 2), (9, 2)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (3, 2), (10, 1)],
  term ((409147947228343 : Rat) / 2131399294416) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((605 : Rat) / 168) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6268129881324529 : Rat) / 17406427571064) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-149 : Rat) / 42) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((1803909535892029 : Rat) / 8703213785532) [(0, 1), (3, 2), (11, 2)],
  term ((-3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2), (12, 2)],
  term ((-4769602097387717 : Rat) / 4262798588832) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((10985 : Rat) / 336) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2), (13, 2)],
  term ((-2424624353532989 : Rat) / 17406427571064) [(0, 1), (3, 2), (14, 1)],
  term ((30071251642097437 : Rat) / 17406427571064) [(0, 1), (3, 2), (15, 2)],
  term ((-2201 : Rat) / 84) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((13348740088950953 : Rat) / 52219282713192) [(0, 1), (3, 3), (7, 1)],
  term ((2700046754119 : Rat) / 15416993088) [(0, 1), (3, 3), (9, 1)],
  term ((-2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 3), (11, 1)],
  term ((-811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 3), (13, 1)],
  term ((2095 : Rat) / 336) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((3625065790056947 : Rat) / 26109641356596) [(0, 1), (3, 3), (15, 1)],
  term ((-415 : Rat) / 84) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 4)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (12, 2)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (13, 2)],
  term ((41195805866345 : Rat) / 26979737904) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((41195805866345 : Rat) / 26979737904) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((-3770747598677953 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-3770747598677953 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((2615 : Rat) / 84) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((8127955008006389 : Rat) / 5802142523688) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-503 : Rat) / 21) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((8127955008006389 : Rat) / 5802142523688) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-503 : Rat) / 21) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(0, 1), (7, 1), (13, 3)],
  term ((2615 : Rat) / 84) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(0, 1), (7, 2), (12, 2)],
  term ((11857694119158851 : Rat) / 8703213785532) [(0, 1), (7, 2), (13, 2)],
  term ((9438216529885 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((9438216529885 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-121071751281143 : Rat) / 107918951616) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-121071751281143 : Rat) / 107918951616) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (13, 3)],
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 2)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (13, 2)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1), (12, 2)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1), (13, 2)],
  term ((-409147947228343 : Rat) / 2131399294416) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-605 : Rat) / 168) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((6268129881324529 : Rat) / 17406427571064) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((149 : Rat) / 42) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((6268129881324529 : Rat) / 17406427571064) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((149 : Rat) / 42) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-409147947228343 : Rat) / 2131399294416) [(0, 1), (11, 1), (13, 3)],
  term ((-605 : Rat) / 168) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2), (12, 2)],
  term ((-1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2), (13, 2)],
  term ((30922865197688651 : Rat) / 26109641356596) [(0, 1), (12, 1)],
  term ((11370274111255853 : Rat) / 17406427571064) [(0, 1), (12, 2)],
  term ((4769602097387717 : Rat) / 4262798588832) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-10985 : Rat) / 336) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2424624353532989 : Rat) / 17406427571064) [(0, 1), (12, 2), (14, 1)],
  term ((-30071251642097437 : Rat) / 17406427571064) [(0, 1), (12, 2), (15, 2)],
  term ((2201 : Rat) / 84) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((11370274111255853 : Rat) / 17406427571064) [(0, 1), (13, 2)],
  term ((2424624353532989 : Rat) / 17406427571064) [(0, 1), (13, 2), (14, 1)],
  term ((-30071251642097437 : Rat) / 17406427571064) [(0, 1), (13, 2), (15, 2)],
  term ((2201 : Rat) / 84) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((4769602097387717 : Rat) / 4262798588832) [(0, 1), (13, 3), (15, 1)],
  term ((-10985 : Rat) / 336) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((2076886323547345 : Rat) / 26109641356596) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((-1388685846372571 : Rat) / 2175803446383) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((2400282914965 : Rat) / 6744934476) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-98924091250783 : Rat) / 266424911802) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((355 : Rat) / 21) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((342738705292465 : Rat) / 322341251316) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-292 : Rat) / 21) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-2076886323547345 : Rat) / 26109641356596) [(0, 2), (1, 1), (3, 1), (12, 1)],
  term ((1388685846372571 : Rat) / 2175803446383) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((-2400282914965 : Rat) / 6744934476) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((98924091250783 : Rat) / 266424911802) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((-355 : Rat) / 21) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-342738705292465 : Rat) / 322341251316) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((292 : Rat) / 21) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (2, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (12, 1)],
  term ((11370274111255853 : Rat) / 8703213785532) [(0, 2), (2, 1)],
  term ((-13348740088950953 : Rat) / 26109641356596) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((-2700046754119 : Rat) / 7708496544) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((2500010837845201 : Rat) / 26109641356596) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((811459086674035 : Rat) / 2131399294416) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((-2095 : Rat) / 168) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-3625065790056947 : Rat) / 13054820678298) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((415 : Rat) / 42) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-3759648208782605 : Rat) / 26109641356596) [(0, 2), (2, 1), (3, 2)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 2), (2, 1), (6, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((-3770747598677953 : Rat) / 2175803446383) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((2615 : Rat) / 42) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((8127955008006389 : Rat) / 2901071261844) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-1006 : Rat) / 21) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 2), (2, 1), (7, 2)],
  term ((9438216529885 : Rat) / 26979737904) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((-115 : Rat) / 7) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-121071751281143 : Rat) / 53959475808) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((92 : Rat) / 7) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 2), (2, 1), (9, 2)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 2), (2, 1), (10, 1)],
  term ((-409147947228343 : Rat) / 1065699647208) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-605 : Rat) / 84) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((6268129881324529 : Rat) / 8703213785532) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((149 : Rat) / 21) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1803909535892029 : Rat) / 4351606892766) [(0, 2), (2, 1), (11, 2)],
  term ((369246208469699 : Rat) / 1450535630922) [(0, 2), (2, 1), (12, 1)],
  term ((4769602097387717 : Rat) / 2131399294416) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-10985 : Rat) / 168) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((2424624353532989 : Rat) / 8703213785532) [(0, 2), (2, 1), (14, 1)],
  term ((-30071251642097437 : Rat) / 8703213785532) [(0, 2), (2, 1), (15, 2)],
  term ((2201 : Rat) / 42) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-369246208469699 : Rat) / 1450535630922) [(0, 2), (2, 2)],
  term ((13348740088950953 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (12, 1)],
  term ((2700046754119 : Rat) / 7708496544) [(0, 2), (3, 1), (9, 1), (12, 1)],
  term ((-2500010837845201 : Rat) / 26109641356596) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((-811459086674035 : Rat) / 2131399294416) [(0, 2), (3, 1), (12, 1), (13, 1)],
  term ((2095 : Rat) / 168) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((3625065790056947 : Rat) / 13054820678298) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-415 : Rat) / 42) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((3759648208782605 : Rat) / 26109641356596) [(0, 2), (3, 2), (12, 1)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 2), (6, 1), (12, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((3770747598677953 : Rat) / 2175803446383) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-2615 : Rat) / 42) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8127955008006389 : Rat) / 2901071261844) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((1006 : Rat) / 21) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 2), (7, 2), (12, 1)],
  term ((-9438216529885 : Rat) / 26979737904) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((115 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((121071751281143 : Rat) / 53959475808) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 2), (9, 2), (12, 1)],
  term ((-9387371864538683 : Rat) / 8703213785532) [(0, 2), (10, 1), (12, 1)],
  term ((409147947228343 : Rat) / 1065699647208) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((605 : Rat) / 84) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6268129881324529 : Rat) / 8703213785532) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-149 : Rat) / 21) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1803909535892029 : Rat) / 4351606892766) [(0, 2), (11, 2), (12, 1)],
  term ((-11370274111255853 : Rat) / 8703213785532) [(0, 2), (12, 1)],
  term ((-4769602097387717 : Rat) / 2131399294416) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((10985 : Rat) / 168) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2424624353532989 : Rat) / 8703213785532) [(0, 2), (12, 1), (14, 1)],
  term ((30071251642097437 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)],
  term ((-2201 : Rat) / 42) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2199055021364855 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1)],
  term ((-70690683689524370 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((-4598551068761 : Rat) / 40469606856) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)],
  term ((36306455678017967 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1), (12, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((3886 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((62912991368160145 : Rat) / 156657848139576) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((-9095 : Rat) / 126) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((559423274960171467 : Rat) / 156657848139576) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-7517990197913 : Rat) / 46250979264) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-257980656735054415 : Rat) / 156657848139576) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((172308705876107125 : Rat) / 69625710284256) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((58255 : Rat) / 1008) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1)],
  term ((985373405547309193 : Rat) / 156657848139576) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-12559 : Rat) / 252) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-57780054073984093 : Rat) / 22379692591368) [(1, 1), (2, 1), (3, 3)],
  term ((2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1), (12, 2)],
  term ((2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1), (12, 2)],
  term ((29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1), (13, 2)],
  term ((-1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((-1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((4835 : Rat) / 336) [(1, 1), (2, 1), (12, 2), (13, 1), (16, 1)],
  term ((-20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-995 : Rat) / 84) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((2199055021364855 : Rat) / 13054820678298) [(1, 1), (2, 1), (13, 1)],
  term ((-20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-995 : Rat) / 84) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (13, 3)],
  term ((4835 : Rat) / 336) [(1, 1), (2, 1), (13, 3), (16, 1)],
  term ((767179650943919 : Rat) / 2486632510152) [(1, 1), (2, 2), (3, 1)],
  term ((-3633060940749113 : Rat) / 19582231017447) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((317737054294735 : Rat) / 8703213785532) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((-579016817225395 : Rat) / 2486632510152) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((10187697658594556 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((85 : Rat) / 63) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 2), (6, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-748340303195557 : Rat) / 1864974382614) [(1, 1), (2, 2), (7, 1)],
  term ((-9026606790637963 : Rat) / 26109641356596) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((-2572563435336311 : Rat) / 17406427571064) [(1, 1), (2, 2), (7, 1), (14, 1)],
  term ((-6245079982375 : Rat) / 26979737904) [(1, 1), (2, 2), (9, 1)],
  term ((7113960675575 : Rat) / 17986491936) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-38202511878271 : Rat) / 107918951616) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((-289451492341829 : Rat) / 710466431472) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((585 : Rat) / 56) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((19330400855593763 : Rat) / 26109641356596) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-113 : Rat) / 14) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2231620312987207 : Rat) / 8703213785532) [(1, 1), (2, 2), (11, 1)],
  term ((-2384914308836225 : Rat) / 52219282713192) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((14620315676843735 : Rat) / 52219282713192) [(1, 1), (2, 2), (13, 1)],
  term ((1545034311283165 : Rat) / 4262798588832) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((-2785 : Rat) / 336) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 12) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-36814971085011167 : Rat) / 52219282713192) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((529 : Rat) / 84) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9631774695566783 : Rat) / 26109641356596) [(1, 1), (2, 2), (15, 1)],
  term ((253 : Rat) / 21) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 3), (3, 1)],
  term ((-2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 3), (7, 1)],
  term ((-29804779978493 : Rat) / 107918951616) [(1, 1), (2, 3), (9, 1)],
  term ((1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 3), (11, 1)],
  term ((1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 3), (13, 1)],
  term ((-4835 : Rat) / 336) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 3), (15, 1)],
  term ((995 : Rat) / 84) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-30922865197688651 : Rat) / 26109641356596) [(1, 1), (3, 1)],
  term ((3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (12, 2)],
  term ((3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (13, 2)],
  term ((-317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (12, 2)],
  term ((-317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (13, 2)],
  term ((-767179650943919 : Rat) / 2486632510152) [(1, 1), (3, 1), (12, 2)],
  term ((579016817225395 : Rat) / 2486632510152) [(1, 1), (3, 1), (12, 2), (14, 1)],
  term ((-767179650943919 : Rat) / 2486632510152) [(1, 1), (3, 1), (13, 2)],
  term ((579016817225395 : Rat) / 2486632510152) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((10187697658594556 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((85 : Rat) / 63) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (3, 2), (6, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((-748340303195557 : Rat) / 1864974382614) [(1, 1), (3, 2), (7, 1)],
  term ((-9026606790637963 : Rat) / 26109641356596) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((-2572563435336311 : Rat) / 17406427571064) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((-6245079982375 : Rat) / 26979737904) [(1, 1), (3, 2), (9, 1)],
  term ((7113960675575 : Rat) / 17986491936) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((-38202511878271 : Rat) / 107918951616) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-289451492341829 : Rat) / 710466431472) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((585 : Rat) / 56) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((19330400855593763 : Rat) / 26109641356596) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-113 : Rat) / 14) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2231620312987207 : Rat) / 8703213785532) [(1, 1), (3, 2), (11, 1)],
  term ((-2384914308836225 : Rat) / 52219282713192) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((14620315676843735 : Rat) / 52219282713192) [(1, 1), (3, 2), (13, 1)],
  term ((1545034311283165 : Rat) / 4262798588832) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-2785 : Rat) / 336) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 12) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-36814971085011167 : Rat) / 52219282713192) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((529 : Rat) / 84) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9631774695566783 : Rat) / 26109641356596) [(1, 1), (3, 2), (15, 1)],
  term ((253 : Rat) / 21) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((767179650943919 : Rat) / 2486632510152) [(1, 1), (3, 3)],
  term ((-3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 3), (6, 1)],
  term ((317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 3), (10, 1)],
  term ((-579016817225395 : Rat) / 2486632510152) [(1, 1), (3, 3), (14, 1)],
  term ((-10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 2)],
  term ((-10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((-85 : Rat) / 63) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((16 : Rat) / 9) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((16 : Rat) / 9) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (13, 3)],
  term ((-85 : Rat) / 63) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((748340303195557 : Rat) / 1864974382614) [(1, 1), (7, 1), (12, 2)],
  term ((2572563435336311 : Rat) / 17406427571064) [(1, 1), (7, 1), (12, 2), (14, 1)],
  term ((748340303195557 : Rat) / 1864974382614) [(1, 1), (7, 1), (13, 2)],
  term ((2572563435336311 : Rat) / 17406427571064) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-7113960675575 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-7113960675575 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1), (12, 2)],
  term ((38202511878271 : Rat) / 107918951616) [(1, 1), (9, 1), (12, 2), (14, 1)],
  term ((6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1), (13, 2)],
  term ((38202511878271 : Rat) / 107918951616) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((289451492341829 : Rat) / 710466431472) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((-585 : Rat) / 56) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-19330400855593763 : Rat) / 26109641356596) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((113 : Rat) / 14) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-19330400855593763 : Rat) / 26109641356596) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((113 : Rat) / 14) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((289451492341829 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 3)],
  term ((-585 : Rat) / 56) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((2231620312987207 : Rat) / 8703213785532) [(1, 1), (11, 1), (12, 2)],
  term ((2384914308836225 : Rat) / 52219282713192) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((2231620312987207 : Rat) / 8703213785532) [(1, 1), (11, 1), (13, 2)],
  term ((2384914308836225 : Rat) / 52219282713192) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-14620315676843735 : Rat) / 52219282713192) [(1, 1), (12, 2), (13, 1)],
  term ((-1545034311283165 : Rat) / 4262798588832) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((2785 : Rat) / 336) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((175 : Rat) / 12) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((36814971085011167 : Rat) / 52219282713192) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-529 : Rat) / 84) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((9631774695566783 : Rat) / 26109641356596) [(1, 1), (12, 2), (15, 1)],
  term ((-253 : Rat) / 21) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((30922865197688651 : Rat) / 26109641356596) [(1, 1), (13, 1)],
  term ((36814971085011167 : Rat) / 52219282713192) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-529 : Rat) / 84) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9631774695566783 : Rat) / 26109641356596) [(1, 1), (13, 2), (15, 1)],
  term ((-253 : Rat) / 21) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14620315676843735 : Rat) / 52219282713192) [(1, 1), (13, 3)],
  term ((-1545034311283165 : Rat) / 4262798588832) [(1, 1), (13, 3), (14, 1)],
  term ((2785 : Rat) / 336) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((175 : Rat) / 12) [(1, 1), (13, 3), (16, 1)],
  term ((2034064852007831 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((29804779978493 : Rat) / 53959475808) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-1546237556623301 : Rat) / 3729948765228) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-132981949807981195 : Rat) / 104438565426384) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((4835 : Rat) / 168) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-20197029797692999 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-995 : Rat) / 42) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((35863768262009179 : Rat) / 52219282713192) [(1, 2), (2, 1), (3, 2)],
  term ((-2034064852007831 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-29804779978493 : Rat) / 53959475808) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((1546237556623301 : Rat) / 3729948765228) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1), (12, 2)],
  term ((20197029797692999 : Rat) / 26109641356596) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((995 : Rat) / 42) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((61254413283962837 : Rat) / 104438565426384) [(1, 2), (2, 1), (13, 2)],
  term ((-4835 : Rat) / 168) [(1, 2), (2, 1), (13, 2), (16, 1)],
  term ((-175873676507441 : Rat) / 2901071261844) [(1, 2), (2, 2)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (2, 2), (6, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 2), (14, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 3)],
  term ((-20375395317189112 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-7001611383270655 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((748340303195557 : Rat) / 932487191307) [(1, 2), (3, 1), (7, 1)],
  term ((9026606790637963 : Rat) / 13054820678298) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((2572563435336311 : Rat) / 8703213785532) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((6245079982375 : Rat) / 13489868952) [(1, 2), (3, 1), (9, 1)],
  term ((-7113960675575 : Rat) / 8993245968) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((38202511878271 : Rat) / 53959475808) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((5151357113976187 : Rat) / 5802142523688) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((-585 : Rat) / 28) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-19330400855593763 : Rat) / 13054820678298) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((113 : Rat) / 7) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((2231620312987207 : Rat) / 4351606892766) [(1, 2), (3, 1), (11, 1)],
  term ((2384914308836225 : Rat) / 26109641356596) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((372614248244641 : Rat) / 6527410339149) [(1, 2), (3, 1), (13, 1)],
  term ((-17763441985686895 : Rat) / 14919795060912) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((2785 : Rat) / 168) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((175 : Rat) / 6) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((36814971085011167 : Rat) / 26109641356596) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-529 : Rat) / 42) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((9631774695566783 : Rat) / 13054820678298) [(1, 2), (3, 1), (15, 1)],
  term ((-506 : Rat) / 21) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1474469646532439 : Rat) / 2175803446383) [(1, 2), (3, 2)],
  term ((14669837835356717 : Rat) / 39164462034894) [(1, 2), (3, 2), (6, 1)],
  term ((-317737054294735 : Rat) / 4351606892766) [(1, 2), (3, 2), (10, 1)],
  term ((895596750040975 : Rat) / 1934047507896) [(1, 2), (3, 2), (14, 1)],
  term ((20375395317189112 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (12, 2)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((27339830464267213 : Rat) / 39164462034894) [(1, 2), (6, 1), (13, 2)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-9026606790637963 : Rat) / 13054820678298) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-748340303195557 : Rat) / 932487191307) [(1, 2), (7, 1), (13, 1)],
  term ((-2572563435336311 : Rat) / 8703213785532) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((7113960675575 : Rat) / 8993245968) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-6245079982375 : Rat) / 13489868952) [(1, 2), (9, 1), (13, 1)],
  term ((-38202511878271 : Rat) / 53959475808) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((19330400855593763 : Rat) / 13054820678298) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-113 : Rat) / 7) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-289451492341829 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 2)],
  term ((585 : Rat) / 28) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-2231620312987207 : Rat) / 4351606892766) [(1, 2), (11, 1), (13, 1)],
  term ((-2384914308836225 : Rat) / 26109641356596) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((175873676507441 : Rat) / 2901071261844) [(1, 2), (12, 2)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 2), (12, 2), (14, 1)],
  term ((-36814971085011167 : Rat) / 26109641356596) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((529 : Rat) / 42) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9631774695566783 : Rat) / 13054820678298) [(1, 2), (13, 1), (15, 1)],
  term ((506 : Rat) / 21) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((4050794691352676 : Rat) / 6527410339149) [(1, 2), (13, 2)],
  term ((75981869397595615 : Rat) / 104438565426384) [(1, 2), (13, 2), (14, 1)],
  term ((-2785 : Rat) / 168) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-175 : Rat) / 6) [(1, 2), (13, 2), (16, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 3), (2, 1), (3, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 3), (2, 1), (13, 1)],
  term ((175873676507441 : Rat) / 1450535630922) [(1, 3), (3, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 3), (3, 1), (6, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 3), (3, 1), (14, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 3), (6, 1), (13, 1)],
  term ((-175873676507441 : Rat) / 1450535630922) [(1, 3), (13, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 3), (13, 1), (14, 1)],
  term ((35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (12, 2)],
  term ((35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (13, 2)],
  term ((4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (13, 2)],
  term ((-36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1), (13, 2)],
  term ((-95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (12, 2), (13, 1)],
  term ((9095 : Rat) / 252) [(2, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-1943 : Rat) / 63) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-1943 : Rat) / 63) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (13, 3)],
  term ((9095 : Rat) / 252) [(2, 1), (3, 1), (13, 3), (16, 1)],
  term ((2199055021364855 : Rat) / 26109641356596) [(2, 1), (3, 2)],
  term ((-21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2), (12, 2)],
  term ((-21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2), (13, 2)],
  term ((-35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 3), (7, 1)],
  term ((-4598551068761 : Rat) / 80939213712) [(2, 1), (3, 3), (9, 1)],
  term ((36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 3), (11, 1)],
  term ((95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 3), (13, 1)],
  term ((-9095 : Rat) / 252) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 3), (14, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 3), (15, 1)],
  term ((1943 : Rat) / 63) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 4)],
  term ((-2199055021364855 : Rat) / 26109641356596) [(2, 1), (12, 2)],
  term ((-2199055021364855 : Rat) / 26109641356596) [(2, 1), (13, 2)],
  term ((30922865197688651 : Rat) / 52219282713192) [(2, 2)],
  term ((2199055021364855 : Rat) / 26109641356596) [(2, 3)],
  term ((-35345341844762185 : Rat) / 19582231017447) [(2, 3), (3, 1), (7, 1)],
  term ((-4598551068761 : Rat) / 80939213712) [(2, 3), (3, 1), (9, 1)],
  term ((36306455678017967 : Rat) / 39164462034894) [(2, 3), (3, 1), (11, 1)],
  term ((95140102894763 : Rat) / 3197098941624) [(2, 3), (3, 1), (13, 1)],
  term ((-9095 : Rat) / 252) [(2, 3), (3, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 3), (3, 1), (14, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 78328924069788) [(2, 3), (3, 1), (15, 1)],
  term ((1943 : Rat) / 63) [(2, 3), (3, 1), (15, 1), (16, 1)],
  term ((21929444827088455 : Rat) / 19582231017447) [(2, 3), (3, 2)],
  term ((30922865197688651 : Rat) / 52219282713192) [(3, 2)],
  term ((-30922865197688651 : Rat) / 52219282713192) [(12, 2)],
  term ((-30922865197688651 : Rat) / 52219282713192) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_09_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_09_0000_0099
      rs_R009_ueqv_R009YNNNN_block_09_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
