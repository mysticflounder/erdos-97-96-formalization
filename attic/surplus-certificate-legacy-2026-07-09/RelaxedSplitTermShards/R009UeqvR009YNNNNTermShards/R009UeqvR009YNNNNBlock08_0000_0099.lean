/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 8:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (10, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0000 : Poly :=
[
  term ((-22240570009072991 : Rat) / 52219282713192) []
]

/-- Partial product 0 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0000 : Poly :=
[
  term ((22240570009072991 : Rat) / 26109641356596) [(0, 1), (2, 1)],
  term ((-22240570009072991 : Rat) / 26109641356596) [(0, 1), (10, 1)],
  term ((22240570009072991 : Rat) / 26109641356596) [(1, 1), (3, 1)],
  term ((-22240570009072991 : Rat) / 26109641356596) [(1, 1), (11, 1)],
  term ((-22240570009072991 : Rat) / 52219282713192) [(2, 2)],
  term ((-22240570009072991 : Rat) / 52219282713192) [(3, 2)],
  term ((22240570009072991 : Rat) / 52219282713192) [(10, 2)],
  term ((22240570009072991 : Rat) / 52219282713192) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0000
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0001 : Poly :=
[
  term ((1046790375791975 : Rat) / 1934047507896) [(0, 1)]
]

/-- Partial product 1 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0001 : Poly :=
[
  term ((-1046790375791975 : Rat) / 967023753948) [(0, 1), (1, 1), (3, 1)],
  term ((1046790375791975 : Rat) / 967023753948) [(0, 1), (1, 1), (11, 1)],
  term ((1046790375791975 : Rat) / 1934047507896) [(0, 1), (2, 2)],
  term ((1046790375791975 : Rat) / 1934047507896) [(0, 1), (3, 2)],
  term ((-1046790375791975 : Rat) / 1934047507896) [(0, 1), (10, 2)],
  term ((-1046790375791975 : Rat) / 1934047507896) [(0, 1), (11, 2)],
  term ((-1046790375791975 : Rat) / 967023753948) [(0, 2), (2, 1)],
  term ((1046790375791975 : Rat) / 967023753948) [(0, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0001
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0002 : Poly :=
[
  term ((242411531398385 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0002 : Poly :=
[
  term ((242411531398385 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((-242411531398385 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (10, 2)],
  term ((-242411531398385 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((242411531398385 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 3)],
  term ((484823062796770 : Rat) / 6527410339149) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-484823062796770 : Rat) / 6527410339149) [(0, 1), (1, 2), (3, 2)],
  term ((-484823062796770 : Rat) / 6527410339149) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((484823062796770 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0002
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0003 : Poly :=
[
  term ((-910502333986129 : Rat) / 2901071261844) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 3 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0003 : Poly :=
[
  term ((-910502333986129 : Rat) / 2901071261844) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((-910502333986129 : Rat) / 2901071261844) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((910502333986129 : Rat) / 2901071261844) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((910502333986129 : Rat) / 2901071261844) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((910502333986129 : Rat) / 1450535630922) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((-910502333986129 : Rat) / 1450535630922) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((910502333986129 : Rat) / 1450535630922) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-910502333986129 : Rat) / 1450535630922) [(0, 2), (1, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0003
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0004 : Poly :=
[
  term ((2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 4 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0004 : Poly :=
[
  term ((2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-2400282914965 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-2400282914965 : Rat) / 6744934476) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((2400282914965 : Rat) / 6744934476) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-2400282914965 : Rat) / 6744934476) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term ((2400282914965 : Rat) / 6744934476) [(0, 2), (1, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0004
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0005 : Poly :=
[
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 5 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0005 : Poly :=
[
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 3)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 2), (11, 2)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0005
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0006 : Poly :=
[
  term ((-98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 6 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0006 : Poly :=
[
  term ((-98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((98924091250783 : Rat) / 532849823604) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((98924091250783 : Rat) / 266424911802) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-98924091250783 : Rat) / 266424911802) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((98924091250783 : Rat) / 266424911802) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((-98924091250783 : Rat) / 266424911802) [(0, 2), (1, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0006
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0007 : Poly :=
[
  term ((355 : Rat) / 42) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0007 : Poly :=
[
  term ((355 : Rat) / 42) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((355 : Rat) / 42) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-355 : Rat) / 42) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-355 : Rat) / 42) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-355 : Rat) / 21) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((355 : Rat) / 21) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-355 : Rat) / 21) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((355 : Rat) / 21) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0007
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0008 : Poly :=
[
  term ((164430006287675 : Rat) / 310829063769) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 8 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0008 : Poly :=
[
  term ((164430006287675 : Rat) / 310829063769) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((164430006287675 : Rat) / 310829063769) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-164430006287675 : Rat) / 310829063769) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-164430006287675 : Rat) / 310829063769) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-328860012575350 : Rat) / 310829063769) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((328860012575350 : Rat) / 310829063769) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-328860012575350 : Rat) / 310829063769) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((328860012575350 : Rat) / 310829063769) [(0, 2), (1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0008
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0009 : Poly :=
[
  term ((-146 : Rat) / 21) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0009 : Poly :=
[
  term ((-146 : Rat) / 21) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-146 : Rat) / 21) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((146 : Rat) / 21) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((146 : Rat) / 21) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((292 : Rat) / 21) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-292 : Rat) / 21) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((292 : Rat) / 21) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-292 : Rat) / 21) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0009
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0010 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2)]
]

/-- Partial product 10 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0010 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (3, 2)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (10, 2)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (11, 2)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (3, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (11, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (2, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0010
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0011 : Poly :=
[
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1)]
]

/-- Partial product 11 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0011 : Poly :=
[
  term ((369246208469699 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((-369246208469699 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (3, 2)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (10, 2)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (11, 2)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 3)],
  term ((-369246208469699 : Rat) / 1450535630922) [(0, 2), (2, 1), (10, 1)],
  term ((369246208469699 : Rat) / 1450535630922) [(0, 2), (2, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0011
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0012 : Poly :=
[
  term ((-1745057488304621 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 12 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0012 : Poly :=
[
  term ((-1745057488304621 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((1745057488304621 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((-1745057488304621 : Rat) / 26109641356596) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((1745057488304621 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((1745057488304621 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (11, 2)],
  term ((-1745057488304621 : Rat) / 26109641356596) [(0, 1), (3, 3), (7, 1)],
  term ((1745057488304621 : Rat) / 13054820678298) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((-1745057488304621 : Rat) / 13054820678298) [(0, 2), (3, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0012
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0013 : Poly :=
[
  term ((-4611584279159 : Rat) / 107918951616) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 13 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0013 : Poly :=
[
  term ((-4611584279159 : Rat) / 53959475808) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((4611584279159 : Rat) / 53959475808) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-4611584279159 : Rat) / 107918951616) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((4611584279159 : Rat) / 107918951616) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((4611584279159 : Rat) / 107918951616) [(0, 1), (3, 1), (9, 1), (11, 2)],
  term ((-4611584279159 : Rat) / 107918951616) [(0, 1), (3, 3), (9, 1)],
  term ((4611584279159 : Rat) / 53959475808) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((-4611584279159 : Rat) / 53959475808) [(0, 2), (3, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0013
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0014 : Poly :=
[
  term ((-204280426333327 : Rat) / 6527410339149) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 14 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0014 : Poly :=
[
  term ((-408560852666654 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((408560852666654 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-204280426333327 : Rat) / 6527410339149) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((204280426333327 : Rat) / 6527410339149) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((204280426333327 : Rat) / 6527410339149) [(0, 1), (3, 1), (11, 3)],
  term ((-204280426333327 : Rat) / 6527410339149) [(0, 1), (3, 3), (11, 1)],
  term ((408560852666654 : Rat) / 6527410339149) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((-408560852666654 : Rat) / 6527410339149) [(0, 2), (3, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0014
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0015 : Poly :=
[
  term ((211228779943109 : Rat) / 4262798588832) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 15 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0015 : Poly :=
[
  term ((211228779943109 : Rat) / 2131399294416) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-211228779943109 : Rat) / 2131399294416) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((211228779943109 : Rat) / 4262798588832) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-211228779943109 : Rat) / 4262798588832) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((-211228779943109 : Rat) / 4262798588832) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((211228779943109 : Rat) / 4262798588832) [(0, 1), (3, 3), (13, 1)],
  term ((-211228779943109 : Rat) / 2131399294416) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((211228779943109 : Rat) / 2131399294416) [(0, 2), (3, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0015
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0016 : Poly :=
[
  term ((-1385 : Rat) / 336) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0016 : Poly :=
[
  term ((-1385 : Rat) / 168) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((1385 : Rat) / 168) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-1385 : Rat) / 336) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((1385 : Rat) / 336) [(0, 1), (3, 1), (10, 2), (13, 1), (16, 1)],
  term ((1385 : Rat) / 336) [(0, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1385 : Rat) / 336) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((1385 : Rat) / 168) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-1385 : Rat) / 168) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0016
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0017 : Poly :=
[
  term ((555493897630853 : Rat) / 5802142523688) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 17 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0017 : Poly :=
[
  term ((555493897630853 : Rat) / 2901071261844) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-555493897630853 : Rat) / 2901071261844) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((555493897630853 : Rat) / 5802142523688) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-555493897630853 : Rat) / 5802142523688) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-555493897630853 : Rat) / 5802142523688) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((555493897630853 : Rat) / 5802142523688) [(0, 1), (3, 3), (15, 1)],
  term ((-555493897630853 : Rat) / 2901071261844) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((555493897630853 : Rat) / 2901071261844) [(0, 2), (3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0017
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0018 : Poly :=
[
  term ((281 : Rat) / 84) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0018 : Poly :=
[
  term ((281 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-281 : Rat) / 42) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((281 : Rat) / 84) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-281 : Rat) / 84) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-281 : Rat) / 84) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((281 : Rat) / 84) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-281 : Rat) / 42) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((281 : Rat) / 42) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0018
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0019 : Poly :=
[
  term ((-2433444203368205 : Rat) / 26109641356596) [(0, 1), (3, 2)]
]

/-- Partial product 19 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0019 : Poly :=
[
  term ((-2433444203368205 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((2433444203368205 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 3)],
  term ((-2433444203368205 : Rat) / 26109641356596) [(0, 1), (2, 2), (3, 2)],
  term ((2433444203368205 : Rat) / 26109641356596) [(0, 1), (3, 2), (10, 2)],
  term ((2433444203368205 : Rat) / 26109641356596) [(0, 1), (3, 2), (11, 2)],
  term ((-2433444203368205 : Rat) / 26109641356596) [(0, 1), (3, 4)],
  term ((2433444203368205 : Rat) / 13054820678298) [(0, 2), (2, 1), (3, 2)],
  term ((-2433444203368205 : Rat) / 13054820678298) [(0, 2), (3, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0019
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0020 : Poly :=
[
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1)]
]

/-- Partial product 20 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0020 : Poly :=
[
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (2, 2), (6, 1)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (3, 2), (6, 1)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (10, 2)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (11, 2)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 2), (2, 1), (6, 1)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 2), (6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0020
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0021 : Poly :=
[
  term ((18257355565865 : Rat) / 13489868952) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 21 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0021 : Poly :=
[
  term ((-18257355565865 : Rat) / 6744934476) [(0, 1), (1, 1), (3, 1), (7, 1), (9, 1)],
  term ((18257355565865 : Rat) / 6744934476) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((18257355565865 : Rat) / 13489868952) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((18257355565865 : Rat) / 13489868952) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((-18257355565865 : Rat) / 13489868952) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((-18257355565865 : Rat) / 13489868952) [(0, 1), (7, 1), (9, 1), (11, 2)],
  term ((-18257355565865 : Rat) / 6744934476) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((18257355565865 : Rat) / 6744934476) [(0, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0021
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0022 : Poly :=
[
  term ((-2969416900085843 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 22 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0022 : Poly :=
[
  term ((2969416900085843 : Rat) / 1450535630922) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-2969416900085843 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((-2969416900085843 : Rat) / 2901071261844) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-2969416900085843 : Rat) / 2901071261844) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((2969416900085843 : Rat) / 2901071261844) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((2969416900085843 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 3)],
  term ((2969416900085843 : Rat) / 1450535630922) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-2969416900085843 : Rat) / 1450535630922) [(0, 2), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0022
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0023 : Poly :=
[
  term ((-746867501558939 : Rat) / 532849823604) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 23 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0023 : Poly :=
[
  term ((746867501558939 : Rat) / 266424911802) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-746867501558939 : Rat) / 266424911802) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-746867501558939 : Rat) / 532849823604) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-746867501558939 : Rat) / 532849823604) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((746867501558939 : Rat) / 532849823604) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((746867501558939 : Rat) / 532849823604) [(0, 1), (7, 1), (11, 2), (13, 1)],
  term ((746867501558939 : Rat) / 266424911802) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-746867501558939 : Rat) / 266424911802) [(0, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0023
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0024 : Poly :=
[
  term ((815 : Rat) / 42) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0024 : Poly :=
[
  term ((-815 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((815 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((815 : Rat) / 42) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((815 : Rat) / 42) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-815 : Rat) / 42) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-815 : Rat) / 42) [(0, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-815 : Rat) / 21) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((815 : Rat) / 21) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0024
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0025 : Poly :=
[
  term ((15345414072456241 : Rat) / 8703213785532) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 25 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0025 : Poly :=
[
  term ((-15345414072456241 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((15345414072456241 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((15345414072456241 : Rat) / 8703213785532) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((15345414072456241 : Rat) / 8703213785532) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-15345414072456241 : Rat) / 8703213785532) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((-15345414072456241 : Rat) / 8703213785532) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((-15345414072456241 : Rat) / 4351606892766) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((15345414072456241 : Rat) / 4351606892766) [(0, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0025
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0026 : Poly :=
[
  term ((-298 : Rat) / 21) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0026 : Poly :=
[
  term ((596 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-596 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-298 : Rat) / 21) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-298 : Rat) / 21) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((298 : Rat) / 21) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((298 : Rat) / 21) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((596 : Rat) / 21) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-596 : Rat) / 21) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0026
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0027 : Poly :=
[
  term ((4778931122581271 : Rat) / 4351606892766) [(0, 1), (7, 2)]
]

/-- Partial product 27 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0027 : Poly :=
[
  term ((-4778931122581271 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (7, 2)],
  term ((4778931122581271 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 2), (11, 1)],
  term ((4778931122581271 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 2)],
  term ((4778931122581271 : Rat) / 4351606892766) [(0, 1), (3, 2), (7, 2)],
  term ((-4778931122581271 : Rat) / 4351606892766) [(0, 1), (7, 2), (10, 2)],
  term ((-4778931122581271 : Rat) / 4351606892766) [(0, 1), (7, 2), (11, 2)],
  term ((-4778931122581271 : Rat) / 2175803446383) [(0, 2), (2, 1), (7, 2)],
  term ((4778931122581271 : Rat) / 2175803446383) [(0, 2), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0027
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0028 : Poly :=
[
  term ((-132504305713 : Rat) / 2202427584) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 28 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0028 : Poly :=
[
  term ((132504305713 : Rat) / 1101213792) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-132504305713 : Rat) / 1101213792) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-132504305713 : Rat) / 2202427584) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-132504305713 : Rat) / 2202427584) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((132504305713 : Rat) / 2202427584) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((132504305713 : Rat) / 2202427584) [(0, 1), (9, 1), (11, 3)],
  term ((132504305713 : Rat) / 1101213792) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-132504305713 : Rat) / 1101213792) [(0, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0028
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0029 : Poly :=
[
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 29 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0029 : Poly :=
[
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0029
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0030 : Poly :=
[
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0030 : Poly :=
[
  term ((115 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((115 : Rat) / 7) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0030
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0031 : Poly :=
[
  term ((-882552400483 : Rat) / 35972983872) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 31 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0031 : Poly :=
[
  term ((882552400483 : Rat) / 17986491936) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-882552400483 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-882552400483 : Rat) / 35972983872) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-882552400483 : Rat) / 35972983872) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((882552400483 : Rat) / 35972983872) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((882552400483 : Rat) / 35972983872) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((882552400483 : Rat) / 17986491936) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-882552400483 : Rat) / 17986491936) [(0, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0031
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0032 : Poly :=
[
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0032 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0032
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0033 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2)]
]

/-- Partial product 33 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0033 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (3, 1), (9, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (2, 2), (9, 2)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (3, 2), (9, 2)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (10, 2)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (11, 2)],
  term ((249803199295 : Rat) / 749437164) [(0, 2), (2, 1), (9, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 2), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0033
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0034 : Poly :=
[
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1)]
]

/-- Partial product 34 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0034 : Poly :=
[
  term ((-9387371864538683 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (2, 2), (10, 1)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (3, 2), (10, 1)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1), (11, 2)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 3)],
  term ((-9387371864538683 : Rat) / 8703213785532) [(0, 2), (2, 1), (10, 1)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0034
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0035 : Poly :=
[
  term ((293225621858755 : Rat) / 4262798588832) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 35 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0035 : Poly :=
[
  term ((-293225621858755 : Rat) / 2131399294416) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((293225621858755 : Rat) / 2131399294416) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((293225621858755 : Rat) / 4262798588832) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((293225621858755 : Rat) / 4262798588832) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-293225621858755 : Rat) / 4262798588832) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((-293225621858755 : Rat) / 4262798588832) [(0, 1), (11, 3), (13, 1)],
  term ((-293225621858755 : Rat) / 2131399294416) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((293225621858755 : Rat) / 2131399294416) [(0, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0035
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0036 : Poly :=
[
  term ((-2815 : Rat) / 336) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 36 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0036 : Poly :=
[
  term ((2815 : Rat) / 168) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2815 : Rat) / 168) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2815 : Rat) / 336) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2815 : Rat) / 336) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((2815 : Rat) / 336) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((2815 : Rat) / 336) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((2815 : Rat) / 168) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2815 : Rat) / 168) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0036
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0037 : Poly :=
[
  term ((-462705210771361 : Rat) / 5802142523688) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 37 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0037 : Poly :=
[
  term ((462705210771361 : Rat) / 2901071261844) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-462705210771361 : Rat) / 2901071261844) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-462705210771361 : Rat) / 5802142523688) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-462705210771361 : Rat) / 5802142523688) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((462705210771361 : Rat) / 5802142523688) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((462705210771361 : Rat) / 5802142523688) [(0, 1), (11, 3), (15, 1)],
  term ((462705210771361 : Rat) / 2901071261844) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-462705210771361 : Rat) / 2901071261844) [(0, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0037
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0038 : Poly :=
[
  term ((607 : Rat) / 84) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0038 : Poly :=
[
  term ((-607 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((607 : Rat) / 42) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((607 : Rat) / 84) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((607 : Rat) / 84) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-607 : Rat) / 84) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-607 : Rat) / 84) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-607 : Rat) / 42) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((607 : Rat) / 42) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0038
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0039 : Poly :=
[
  term ((-1332519555233341 : Rat) / 8703213785532) [(0, 1), (11, 2)]
]

/-- Partial product 39 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0039 : Poly :=
[
  term ((1332519555233341 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((-1332519555233341 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 3)],
  term ((-1332519555233341 : Rat) / 8703213785532) [(0, 1), (2, 2), (11, 2)],
  term ((-1332519555233341 : Rat) / 8703213785532) [(0, 1), (3, 2), (11, 2)],
  term ((1332519555233341 : Rat) / 8703213785532) [(0, 1), (10, 2), (11, 2)],
  term ((1332519555233341 : Rat) / 8703213785532) [(0, 1), (11, 4)],
  term ((1332519555233341 : Rat) / 4351606892766) [(0, 2), (2, 1), (11, 2)],
  term ((-1332519555233341 : Rat) / 4351606892766) [(0, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0039
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0040 : Poly :=
[
  term ((-39685933350263 : Rat) / 1420932862944) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0040 : Poly :=
[
  term ((39685933350263 : Rat) / 710466431472) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-39685933350263 : Rat) / 710466431472) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-39685933350263 : Rat) / 1420932862944) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-39685933350263 : Rat) / 1420932862944) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((39685933350263 : Rat) / 1420932862944) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((39685933350263 : Rat) / 1420932862944) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((39685933350263 : Rat) / 710466431472) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-39685933350263 : Rat) / 710466431472) [(0, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0040
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0041 : Poly :=
[
  term ((195 : Rat) / 112) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0041 : Poly :=
[
  term ((-195 : Rat) / 56) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((195 : Rat) / 56) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((195 : Rat) / 112) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((195 : Rat) / 112) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-195 : Rat) / 112) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-195 : Rat) / 112) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-195 : Rat) / 56) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((195 : Rat) / 56) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0041
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0042 : Poly :=
[
  term ((2424624353532989 : Rat) / 17406427571064) [(0, 1), (14, 1)]
]

/-- Partial product 42 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0042 : Poly :=
[
  term ((-2424624353532989 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((2424624353532989 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((2424624353532989 : Rat) / 17406427571064) [(0, 1), (2, 2), (14, 1)],
  term ((2424624353532989 : Rat) / 17406427571064) [(0, 1), (3, 2), (14, 1)],
  term ((-2424624353532989 : Rat) / 17406427571064) [(0, 1), (10, 2), (14, 1)],
  term ((-2424624353532989 : Rat) / 17406427571064) [(0, 1), (11, 2), (14, 1)],
  term ((-2424624353532989 : Rat) / 8703213785532) [(0, 2), (2, 1), (14, 1)],
  term ((2424624353532989 : Rat) / 8703213785532) [(0, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0042
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0043 : Poly :=
[
  term ((-5504454652897321 : Rat) / 17406427571064) [(0, 1), (15, 2)]
]

/-- Partial product 43 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0043 : Poly :=
[
  term ((5504454652897321 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((-5504454652897321 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-5504454652897321 : Rat) / 17406427571064) [(0, 1), (2, 2), (15, 2)],
  term ((-5504454652897321 : Rat) / 17406427571064) [(0, 1), (3, 2), (15, 2)],
  term ((5504454652897321 : Rat) / 17406427571064) [(0, 1), (10, 2), (15, 2)],
  term ((5504454652897321 : Rat) / 17406427571064) [(0, 1), (11, 2), (15, 2)],
  term ((5504454652897321 : Rat) / 8703213785532) [(0, 2), (2, 1), (15, 2)],
  term ((-5504454652897321 : Rat) / 8703213785532) [(0, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0043
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0044 : Poly :=
[
  term ((-5 : Rat) / 4) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 44 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0044 : Poly :=
[
  term ((5 : Rat) / 2) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 4) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 4) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 4) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 4) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0044
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0045 : Poly :=
[
  term ((125003120951594 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 45 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0045 : Poly :=
[
  term ((250006241903188 : Rat) / 932487191307) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-250006241903188 : Rat) / 932487191307) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((-125003120951594 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (10, 2)],
  term ((-125003120951594 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((125003120951594 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 3)],
  term ((125003120951594 : Rat) / 932487191307) [(1, 1), (2, 3), (3, 1)],
  term ((250006241903188 : Rat) / 932487191307) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-250006241903188 : Rat) / 932487191307) [(1, 2), (2, 1), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0045
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0046 : Poly :=
[
  term ((1962342710988269 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 46 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0046 : Poly :=
[
  term ((1962342710988269 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-1962342710988269 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((1962342710988269 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-1962342710988269 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1), (10, 2)],
  term ((-1962342710988269 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((1962342710988269 : Rat) / 13054820678298) [(1, 1), (2, 3), (7, 1)],
  term ((-1962342710988269 : Rat) / 6527410339149) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((1962342710988269 : Rat) / 6527410339149) [(1, 2), (2, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0046
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0047 : Poly :=
[
  term ((8456381346569 : Rat) / 35972983872) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 47 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0047 : Poly :=
[
  term ((8456381346569 : Rat) / 17986491936) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((-8456381346569 : Rat) / 17986491936) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((8456381346569 : Rat) / 35972983872) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-8456381346569 : Rat) / 35972983872) [(1, 1), (2, 1), (9, 1), (10, 2)],
  term ((-8456381346569 : Rat) / 35972983872) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((8456381346569 : Rat) / 35972983872) [(1, 1), (2, 3), (9, 1)],
  term ((-8456381346569 : Rat) / 17986491936) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((8456381346569 : Rat) / 17986491936) [(1, 2), (2, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0047
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0048 : Poly :=
[
  term ((-9531865693995661 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 48 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0048 : Poly :=
[
  term ((-9531865693995661 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((9531865693995661 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((-9531865693995661 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((9531865693995661 : Rat) / 26109641356596) [(1, 1), (2, 1), (10, 2), (11, 1)],
  term ((9531865693995661 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 3)],
  term ((-9531865693995661 : Rat) / 26109641356596) [(1, 1), (2, 3), (11, 1)],
  term ((9531865693995661 : Rat) / 13054820678298) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-9531865693995661 : Rat) / 13054820678298) [(1, 2), (2, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0048
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0049 : Poly :=
[
  term ((-52929596015021 : Rat) / 202990408992) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 49 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0049 : Poly :=
[
  term ((-52929596015021 : Rat) / 101495204496) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((52929596015021 : Rat) / 101495204496) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-52929596015021 : Rat) / 202990408992) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((52929596015021 : Rat) / 202990408992) [(1, 1), (2, 1), (10, 2), (13, 1)],
  term ((52929596015021 : Rat) / 202990408992) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-52929596015021 : Rat) / 202990408992) [(1, 1), (2, 3), (13, 1)],
  term ((52929596015021 : Rat) / 101495204496) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-52929596015021 : Rat) / 101495204496) [(1, 2), (2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0049
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0050 : Poly :=
[
  term ((535 : Rat) / 112) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0050 : Poly :=
[
  term ((535 : Rat) / 56) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((-535 : Rat) / 56) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((535 : Rat) / 112) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-535 : Rat) / 112) [(1, 1), (2, 1), (10, 2), (13, 1), (16, 1)],
  term ((-535 : Rat) / 112) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((535 : Rat) / 112) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((-535 : Rat) / 56) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((535 : Rat) / 56) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0050
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0051 : Poly :=
[
  term ((220379442307739 : Rat) / 52219282713192) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 51 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0051 : Poly :=
[
  term ((220379442307739 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-220379442307739 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((220379442307739 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-220379442307739 : Rat) / 52219282713192) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-220379442307739 : Rat) / 52219282713192) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((220379442307739 : Rat) / 52219282713192) [(1, 1), (2, 3), (15, 1)],
  term ((-220379442307739 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((220379442307739 : Rat) / 26109641356596) [(1, 2), (2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0051
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0052 : Poly :=
[
  term ((-103 : Rat) / 28) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0052 : Poly :=
[
  term ((-103 : Rat) / 14) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((103 : Rat) / 14) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-103 : Rat) / 28) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((103 : Rat) / 28) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((103 : Rat) / 28) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-103 : Rat) / 28) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((103 : Rat) / 14) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-103 : Rat) / 14) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0052
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0053 : Poly :=
[
  term ((-298831488976427 : Rat) / 2901071261844) [(1, 1), (3, 1)]
]

/-- Partial product 53 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0053 : Poly :=
[
  term ((298831488976427 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((-298831488976427 : Rat) / 1450535630922) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((-298831488976427 : Rat) / 2901071261844) [(1, 1), (2, 2), (3, 1)],
  term ((298831488976427 : Rat) / 2901071261844) [(1, 1), (3, 1), (10, 2)],
  term ((298831488976427 : Rat) / 2901071261844) [(1, 1), (3, 1), (11, 2)],
  term ((-298831488976427 : Rat) / 2901071261844) [(1, 1), (3, 3)],
  term ((-298831488976427 : Rat) / 1450535630922) [(1, 2), (3, 1), (11, 1)],
  term ((298831488976427 : Rat) / 1450535630922) [(1, 2), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0053
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0054 : Poly :=
[
  term ((3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 54 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0054 : Poly :=
[
  term ((-7266121881498226 : Rat) / 19582231017447) [(0, 1), (1, 1), (2, 1), (3, 1), (6, 1)],
  term ((7266121881498226 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (10, 1)],
  term ((3633060940749113 : Rat) / 19582231017447) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((-3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (10, 2)],
  term ((-3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (11, 2)],
  term ((3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 3), (6, 1)],
  term ((7266121881498226 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-7266121881498226 : Rat) / 19582231017447) [(1, 2), (3, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0054
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0055 : Poly :=
[
  term ((640 : Rat) / 63) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 55 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0055 : Poly :=
[
  term ((-1280 : Rat) / 63) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((1280 : Rat) / 63) [(0, 1), (1, 1), (3, 1), (10, 2)],
  term ((640 : Rat) / 63) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((-640 : Rat) / 63) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-640 : Rat) / 63) [(1, 1), (3, 1), (10, 3)],
  term ((640 : Rat) / 63) [(1, 1), (3, 3), (10, 1)],
  term ((1280 : Rat) / 63) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-1280 : Rat) / 63) [(1, 2), (3, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0055
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0056 : Poly :=
[
  term ((-1382388909826009 : Rat) / 26109641356596) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 56 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0056 : Poly :=
[
  term ((1382388909826009 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-1382388909826009 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-1382388909826009 : Rat) / 26109641356596) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((1382388909826009 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 2), (14, 1)],
  term ((1382388909826009 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((-1382388909826009 : Rat) / 26109641356596) [(1, 1), (3, 3), (14, 1)],
  term ((-1382388909826009 : Rat) / 13054820678298) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((1382388909826009 : Rat) / 13054820678298) [(1, 2), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0056
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0057 : Poly :=
[
  term ((-10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 57 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0057 : Poly :=
[
  term ((20375395317189112 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((-20375395317189112 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-10187697658594556 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((-10187697658594556 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (10, 2)],
  term ((10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 2)],
  term ((20375395317189112 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-20375395317189112 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0057
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0058 : Poly :=
[
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 58 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0058 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (2, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (6, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (10, 2)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0058
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0059 : Poly :=
[
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 59 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0059 : Poly :=
[
  term ((-33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (10, 2), (11, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 3)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(1, 2), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0059
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0060 : Poly :=
[
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 60 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0060 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (10, 2), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0060
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0061 : Poly :=
[
  term ((-85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0061 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0061
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0062 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 62 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0062 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 2), (6, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 2), (6, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (10, 2), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0062
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0063 : Poly :=
[
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 63 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0063 : Poly :=
[
  term ((24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (10, 2), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(1, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0063
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0064 : Poly :=
[
  term ((16 : Rat) / 9) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0064 : Poly :=
[
  term ((-32 : Rat) / 9) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0064
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0065 : Poly :=
[
  term ((10889546461818593 : Rat) / 26109641356596) [(1, 1), (7, 1)]
]

/-- Partial product 65 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0065 : Poly :=
[
  term ((-10889546461818593 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term ((10889546461818593 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((10889546461818593 : Rat) / 26109641356596) [(1, 1), (2, 2), (7, 1)],
  term ((10889546461818593 : Rat) / 26109641356596) [(1, 1), (3, 2), (7, 1)],
  term ((-10889546461818593 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 2)],
  term ((-10889546461818593 : Rat) / 26109641356596) [(1, 1), (7, 1), (11, 2)],
  term ((-10889546461818593 : Rat) / 13054820678298) [(1, 2), (3, 1), (7, 1)],
  term ((10889546461818593 : Rat) / 13054820678298) [(1, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0065
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0066 : Poly :=
[
  term ((4555432559686187 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 66 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0066 : Poly :=
[
  term ((-4555432559686187 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((4555432559686187 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((4555432559686187 : Rat) / 13054820678298) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((4555432559686187 : Rat) / 13054820678298) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((-4555432559686187 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-4555432559686187 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 3)],
  term ((-4555432559686187 : Rat) / 6527410339149) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((4555432559686187 : Rat) / 6527410339149) [(1, 2), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0066
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0067 : Poly :=
[
  term ((19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 67 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0067 : Poly :=
[
  term ((-19918597176517 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1)],
  term ((19918597176517 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (10, 1), (14, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(1, 1), (2, 2), (7, 1), (14, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((-19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (10, 2), (14, 1)],
  term ((-19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((-19918597176517 : Rat) / 1450535630922) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((19918597176517 : Rat) / 1450535630922) [(1, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0067
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0068 : Poly :=
[
  term ((6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1)]
]

/-- Partial product 68 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0068 : Poly :=
[
  term ((-6245079982375 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((6245079982375 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((6245079982375 : Rat) / 26979737904) [(1, 1), (2, 2), (9, 1)],
  term ((6245079982375 : Rat) / 26979737904) [(1, 1), (3, 2), (9, 1)],
  term ((-6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1), (10, 2)],
  term ((-6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1), (11, 2)],
  term ((-6245079982375 : Rat) / 13489868952) [(1, 2), (3, 1), (9, 1)],
  term ((6245079982375 : Rat) / 13489868952) [(1, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0068
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0069 : Poly :=
[
  term ((-8534580608957 : Rat) / 35972983872) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 69 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0069 : Poly :=
[
  term ((8534580608957 : Rat) / 17986491936) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((-8534580608957 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-8534580608957 : Rat) / 35972983872) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-8534580608957 : Rat) / 35972983872) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((8534580608957 : Rat) / 35972983872) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((8534580608957 : Rat) / 35972983872) [(1, 1), (9, 1), (10, 3)],
  term ((8534580608957 : Rat) / 17986491936) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-8534580608957 : Rat) / 17986491936) [(1, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0069
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0070 : Poly :=
[
  term ((-21020396170241 : Rat) / 35972983872) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 70 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0070 : Poly :=
[
  term ((21020396170241 : Rat) / 17986491936) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-21020396170241 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-21020396170241 : Rat) / 35972983872) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((-21020396170241 : Rat) / 35972983872) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((21020396170241 : Rat) / 35972983872) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((21020396170241 : Rat) / 35972983872) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((21020396170241 : Rat) / 17986491936) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-21020396170241 : Rat) / 17986491936) [(1, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0070
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0071 : Poly :=
[
  term ((149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 71 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0071 : Poly :=
[
  term ((-299520 : Rat) / 553) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((299520 : Rat) / 553) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((149760 : Rat) / 553) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((149760 : Rat) / 553) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 3)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 3), (11, 1)],
  term ((-299520 : Rat) / 553) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((299520 : Rat) / 553) [(1, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0071
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0072 : Poly :=
[
  term ((342565075615319 : Rat) / 1420932862944) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 72 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0072 : Poly :=
[
  term ((-342565075615319 : Rat) / 710466431472) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((342565075615319 : Rat) / 710466431472) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((342565075615319 : Rat) / 1420932862944) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((342565075615319 : Rat) / 1420932862944) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((-342565075615319 : Rat) / 1420932862944) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-342565075615319 : Rat) / 1420932862944) [(1, 1), (10, 3), (13, 1)],
  term ((-342565075615319 : Rat) / 710466431472) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((342565075615319 : Rat) / 710466431472) [(1, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0072
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0073 : Poly :=
[
  term ((285 : Rat) / 112) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0073 : Poly :=
[
  term ((-285 : Rat) / 56) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((285 : Rat) / 56) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((285 : Rat) / 112) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((285 : Rat) / 112) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-285 : Rat) / 112) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-285 : Rat) / 112) [(1, 1), (10, 3), (13, 1), (16, 1)],
  term ((-285 : Rat) / 56) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((285 : Rat) / 56) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0073
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0074 : Poly :=
[
  term ((-31969291420270963 : Rat) / 52219282713192) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 74 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0074 : Poly :=
[
  term ((31969291420270963 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-31969291420270963 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-31969291420270963 : Rat) / 52219282713192) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-31969291420270963 : Rat) / 52219282713192) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((31969291420270963 : Rat) / 52219282713192) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((31969291420270963 : Rat) / 52219282713192) [(1, 1), (10, 3), (15, 1)],
  term ((31969291420270963 : Rat) / 26109641356596) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-31969291420270963 : Rat) / 26109641356596) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0074
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0075 : Poly :=
[
  term ((-11 : Rat) / 4) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0075 : Poly :=
[
  term ((11 : Rat) / 2) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-11 : Rat) / 4) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 4) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 4) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((11 : Rat) / 4) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((11 : Rat) / 2) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0075
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0076 : Poly :=
[
  term ((89856 : Rat) / 553) [(1, 1), (11, 1)]
]

/-- Partial product 76 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0076 : Poly :=
[
  term ((-179712 : Rat) / 553) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((179712 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((89856 : Rat) / 553) [(1, 1), (2, 2), (11, 1)],
  term ((89856 : Rat) / 553) [(1, 1), (3, 2), (11, 1)],
  term ((-89856 : Rat) / 553) [(1, 1), (10, 2), (11, 1)],
  term ((-89856 : Rat) / 553) [(1, 1), (11, 3)],
  term ((-179712 : Rat) / 553) [(1, 2), (3, 1), (11, 1)],
  term ((179712 : Rat) / 553) [(1, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0076
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0077 : Poly :=
[
  term ((2702110390902865 : Rat) / 13054820678298) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 77 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0077 : Poly :=
[
  term ((-2702110390902865 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((2702110390902865 : Rat) / 6527410339149) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((2702110390902865 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((2702110390902865 : Rat) / 13054820678298) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-2702110390902865 : Rat) / 13054820678298) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((-2702110390902865 : Rat) / 13054820678298) [(1, 1), (11, 3), (14, 1)],
  term ((-2702110390902865 : Rat) / 6527410339149) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((2702110390902865 : Rat) / 6527410339149) [(1, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0077
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0078 : Poly :=
[
  term ((-14620315676843735 : Rat) / 52219282713192) [(1, 1), (13, 1)]
]

/-- Partial product 78 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0078 : Poly :=
[
  term ((14620315676843735 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((-14620315676843735 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((-14620315676843735 : Rat) / 52219282713192) [(1, 1), (2, 2), (13, 1)],
  term ((-14620315676843735 : Rat) / 52219282713192) [(1, 1), (3, 2), (13, 1)],
  term ((14620315676843735 : Rat) / 52219282713192) [(1, 1), (10, 2), (13, 1)],
  term ((14620315676843735 : Rat) / 52219282713192) [(1, 1), (11, 2), (13, 1)],
  term ((14620315676843735 : Rat) / 26109641356596) [(1, 2), (3, 1), (13, 1)],
  term ((-14620315676843735 : Rat) / 26109641356596) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0078
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0079 : Poly :=
[
  term ((884249508821411 : Rat) / 1420932862944) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 79 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0079 : Poly :=
[
  term ((-884249508821411 : Rat) / 710466431472) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)],
  term ((884249508821411 : Rat) / 710466431472) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((884249508821411 : Rat) / 1420932862944) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((884249508821411 : Rat) / 1420932862944) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-884249508821411 : Rat) / 1420932862944) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((-884249508821411 : Rat) / 1420932862944) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-884249508821411 : Rat) / 710466431472) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((884249508821411 : Rat) / 710466431472) [(1, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0079
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0080 : Poly :=
[
  term ((-1695 : Rat) / 112) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 80 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0080 : Poly :=
[
  term ((1695 : Rat) / 56) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1695 : Rat) / 56) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1695 : Rat) / 112) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1695 : Rat) / 112) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((1695 : Rat) / 112) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((1695 : Rat) / 112) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1695 : Rat) / 56) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1695 : Rat) / 56) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0080
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0081 : Poly :=
[
  term ((175 : Rat) / 12) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 81 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0081 : Poly :=
[
  term ((-175 : Rat) / 6) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((175 : Rat) / 6) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((175 : Rat) / 12) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((175 : Rat) / 12) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-175 : Rat) / 12) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-175 : Rat) / 12) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-175 : Rat) / 6) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((175 : Rat) / 6) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0081
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0082 : Poly :=
[
  term ((-41401562551955275 : Rat) / 52219282713192) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 82 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0082 : Poly :=
[
  term ((41401562551955275 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-41401562551955275 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-41401562551955275 : Rat) / 52219282713192) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-41401562551955275 : Rat) / 52219282713192) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((41401562551955275 : Rat) / 52219282713192) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((41401562551955275 : Rat) / 52219282713192) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((41401562551955275 : Rat) / 26109641356596) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-41401562551955275 : Rat) / 26109641356596) [(1, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0082
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0083 : Poly :=
[
  term ((335 : Rat) / 28) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0083 : Poly :=
[
  term ((-335 : Rat) / 14) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((335 : Rat) / 14) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((335 : Rat) / 28) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((335 : Rat) / 28) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-335 : Rat) / 28) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-335 : Rat) / 28) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-335 : Rat) / 14) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((335 : Rat) / 14) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0083
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0084 : Poly :=
[
  term ((274729186150081 : Rat) / 17406427571064) [(1, 1), (15, 1)]
]

/-- Partial product 84 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0084 : Poly :=
[
  term ((-274729186150081 : Rat) / 8703213785532) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((274729186150081 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((274729186150081 : Rat) / 17406427571064) [(1, 1), (2, 2), (15, 1)],
  term ((274729186150081 : Rat) / 17406427571064) [(1, 1), (3, 2), (15, 1)],
  term ((-274729186150081 : Rat) / 17406427571064) [(1, 1), (10, 2), (15, 1)],
  term ((-274729186150081 : Rat) / 17406427571064) [(1, 1), (11, 2), (15, 1)],
  term ((-274729186150081 : Rat) / 8703213785532) [(1, 2), (3, 1), (15, 1)],
  term ((274729186150081 : Rat) / 8703213785532) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0084
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0085 : Poly :=
[
  term ((-253 : Rat) / 21) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0085 : Poly :=
[
  term ((506 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-506 : Rat) / 21) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-253 : Rat) / 21) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-253 : Rat) / 21) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((253 : Rat) / 21) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((253 : Rat) / 21) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((506 : Rat) / 21) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-506 : Rat) / 21) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0085
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0086 : Poly :=
[
  term ((175873676507441 : Rat) / 2901071261844) [(1, 2)]
]

/-- Partial product 86 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0086 : Poly :=
[
  term ((-175873676507441 : Rat) / 1450535630922) [(0, 1), (1, 2), (2, 1)],
  term ((175873676507441 : Rat) / 1450535630922) [(0, 1), (1, 2), (10, 1)],
  term ((175873676507441 : Rat) / 2901071261844) [(1, 2), (2, 2)],
  term ((175873676507441 : Rat) / 2901071261844) [(1, 2), (3, 2)],
  term ((-175873676507441 : Rat) / 2901071261844) [(1, 2), (10, 2)],
  term ((-175873676507441 : Rat) / 2901071261844) [(1, 2), (11, 2)],
  term ((-175873676507441 : Rat) / 1450535630922) [(1, 3), (3, 1)],
  term ((175873676507441 : Rat) / 1450535630922) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0086
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0087 : Poly :=
[
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1)]
]

/-- Partial product 87 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0087 : Poly :=
[
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (2, 1), (6, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (10, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 2), (2, 2), (6, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 2), (3, 2), (6, 1)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (10, 2)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (11, 2)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 3), (3, 1), (6, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0087
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0088 : Poly :=
[
  term ((-4433002304700377 : Rat) / 26109641356596) [(2, 1)]
]

/-- Partial product 88 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0088 : Poly :=
[
  term ((-4433002304700377 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1)],
  term ((4433002304700377 : Rat) / 13054820678298) [(0, 1), (2, 2)],
  term ((4433002304700377 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1)],
  term ((-4433002304700377 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1)],
  term ((-4433002304700377 : Rat) / 26109641356596) [(2, 1), (3, 2)],
  term ((4433002304700377 : Rat) / 26109641356596) [(2, 1), (10, 2)],
  term ((4433002304700377 : Rat) / 26109641356596) [(2, 1), (11, 2)],
  term ((-4433002304700377 : Rat) / 26109641356596) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0088
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0089 : Poly :=
[
  term ((30756238917916247 : Rat) / 39164462034894) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 89 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0089 : Poly :=
[
  term ((30756238917916247 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-30756238917916247 : Rat) / 19582231017447) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((30756238917916247 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-30756238917916247 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-30756238917916247 : Rat) / 39164462034894) [(2, 1), (3, 1), (7, 1), (10, 2)],
  term ((-30756238917916247 : Rat) / 39164462034894) [(2, 1), (3, 1), (7, 1), (11, 2)],
  term ((30756238917916247 : Rat) / 39164462034894) [(2, 1), (3, 3), (7, 1)],
  term ((30756238917916247 : Rat) / 39164462034894) [(2, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0089
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0090 : Poly :=
[
  term ((-2361183283771 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 90 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0090 : Poly :=
[
  term ((-2361183283771 : Rat) / 10117401714) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((2361183283771 : Rat) / 10117401714) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((-2361183283771 : Rat) / 10117401714) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((2361183283771 : Rat) / 10117401714) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((2361183283771 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1), (10, 2)],
  term ((2361183283771 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1), (11, 2)],
  term ((-2361183283771 : Rat) / 20234803428) [(2, 1), (3, 3), (9, 1)],
  term ((-2361183283771 : Rat) / 20234803428) [(2, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0090
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0091 : Poly :=
[
  term ((1106735727985541 : Rat) / 19582231017447) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 91 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0091 : Poly :=
[
  term ((2213471455971082 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-2213471455971082 : Rat) / 19582231017447) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((2213471455971082 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-2213471455971082 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-1106735727985541 : Rat) / 19582231017447) [(2, 1), (3, 1), (10, 2), (11, 1)],
  term ((-1106735727985541 : Rat) / 19582231017447) [(2, 1), (3, 1), (11, 3)],
  term ((1106735727985541 : Rat) / 19582231017447) [(2, 1), (3, 3), (11, 1)],
  term ((1106735727985541 : Rat) / 19582231017447) [(2, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0091
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0092 : Poly :=
[
  term ((115792775905297 : Rat) / 799274735406) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 92 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0092 : Poly :=
[
  term ((115792775905297 : Rat) / 399637367703) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-115792775905297 : Rat) / 399637367703) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((115792775905297 : Rat) / 399637367703) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-115792775905297 : Rat) / 399637367703) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-115792775905297 : Rat) / 799274735406) [(2, 1), (3, 1), (10, 2), (13, 1)],
  term ((-115792775905297 : Rat) / 799274735406) [(2, 1), (3, 1), (11, 2), (13, 1)],
  term ((115792775905297 : Rat) / 799274735406) [(2, 1), (3, 3), (13, 1)],
  term ((115792775905297 : Rat) / 799274735406) [(2, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0092
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0093 : Poly :=
[
  term ((1535 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 93 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0093 : Poly :=
[
  term ((3070 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3070 : Rat) / 63) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((3070 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3070 : Rat) / 63) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-1535 : Rat) / 63) [(2, 1), (3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1535 : Rat) / 63) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((1535 : Rat) / 63) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((1535 : Rat) / 63) [(2, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0093
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0094 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 94 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0094 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 2), (3, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (10, 2), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 3), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 3), (3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0094
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0095 : Poly :=
[
  term ((63845018543594861 : Rat) / 39164462034894) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 95 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0095 : Poly :=
[
  term ((63845018543594861 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-63845018543594861 : Rat) / 19582231017447) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((63845018543594861 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-63845018543594861 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-63845018543594861 : Rat) / 39164462034894) [(2, 1), (3, 1), (10, 2), (15, 1)],
  term ((-63845018543594861 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((63845018543594861 : Rat) / 39164462034894) [(2, 1), (3, 3), (15, 1)],
  term ((63845018543594861 : Rat) / 39164462034894) [(2, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0095
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0096 : Poly :=
[
  term ((-1328 : Rat) / 63) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0096 : Poly :=
[
  term ((-2656 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((2656 : Rat) / 63) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2656 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((2656 : Rat) / 63) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((1328 : Rat) / 63) [(2, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((1328 : Rat) / 63) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1328 : Rat) / 63) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((-1328 : Rat) / 63) [(2, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0096
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0097 : Poly :=
[
  term ((-28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2)]
]

/-- Partial product 97 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0097 : Poly :=
[
  term ((-28547376631104355 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 2), (10, 1)],
  term ((28547376631104355 : Rat) / 39164462034894) [(0, 1), (2, 2), (3, 2)],
  term ((-28547376631104355 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((28547376631104355 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 3)],
  term ((28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2), (10, 2)],
  term ((28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2), (11, 2)],
  term ((-28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 4)],
  term ((-28547376631104355 : Rat) / 78328924069788) [(2, 3), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0097
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0098 : Poly :=
[
  term ((2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1)]
]

/-- Partial product 98 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0098 : Poly :=
[
  term ((2664495422304851 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (10, 1)],
  term ((-2664495422304851 : Rat) / 2901071261844) [(0, 1), (2, 2), (6, 1)],
  term ((-2664495422304851 : Rat) / 2901071261844) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((2664495422304851 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((2664495422304851 : Rat) / 5802142523688) [(2, 1), (3, 2), (6, 1)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1), (10, 2)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1), (11, 2)],
  term ((2664495422304851 : Rat) / 5802142523688) [(2, 3), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0098
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0099 : Poly :=
[
  term ((-27619545035095 : Rat) / 40469606856) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 99 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0099 : Poly :=
[
  term ((-27619545035095 : Rat) / 20234803428) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((27619545035095 : Rat) / 20234803428) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((27619545035095 : Rat) / 20234803428) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((-27619545035095 : Rat) / 20234803428) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((-27619545035095 : Rat) / 40469606856) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((27619545035095 : Rat) / 40469606856) [(2, 1), (7, 1), (9, 1), (10, 2)],
  term ((27619545035095 : Rat) / 40469606856) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((-27619545035095 : Rat) / 40469606856) [(2, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0099
        rs_R009_ueqv_R009YNNNN_generator_08_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_08_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_08_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_08_0000,
  rs_R009_ueqv_R009YNNNN_partial_08_0001,
  rs_R009_ueqv_R009YNNNN_partial_08_0002,
  rs_R009_ueqv_R009YNNNN_partial_08_0003,
  rs_R009_ueqv_R009YNNNN_partial_08_0004,
  rs_R009_ueqv_R009YNNNN_partial_08_0005,
  rs_R009_ueqv_R009YNNNN_partial_08_0006,
  rs_R009_ueqv_R009YNNNN_partial_08_0007,
  rs_R009_ueqv_R009YNNNN_partial_08_0008,
  rs_R009_ueqv_R009YNNNN_partial_08_0009,
  rs_R009_ueqv_R009YNNNN_partial_08_0010,
  rs_R009_ueqv_R009YNNNN_partial_08_0011,
  rs_R009_ueqv_R009YNNNN_partial_08_0012,
  rs_R009_ueqv_R009YNNNN_partial_08_0013,
  rs_R009_ueqv_R009YNNNN_partial_08_0014,
  rs_R009_ueqv_R009YNNNN_partial_08_0015,
  rs_R009_ueqv_R009YNNNN_partial_08_0016,
  rs_R009_ueqv_R009YNNNN_partial_08_0017,
  rs_R009_ueqv_R009YNNNN_partial_08_0018,
  rs_R009_ueqv_R009YNNNN_partial_08_0019,
  rs_R009_ueqv_R009YNNNN_partial_08_0020,
  rs_R009_ueqv_R009YNNNN_partial_08_0021,
  rs_R009_ueqv_R009YNNNN_partial_08_0022,
  rs_R009_ueqv_R009YNNNN_partial_08_0023,
  rs_R009_ueqv_R009YNNNN_partial_08_0024,
  rs_R009_ueqv_R009YNNNN_partial_08_0025,
  rs_R009_ueqv_R009YNNNN_partial_08_0026,
  rs_R009_ueqv_R009YNNNN_partial_08_0027,
  rs_R009_ueqv_R009YNNNN_partial_08_0028,
  rs_R009_ueqv_R009YNNNN_partial_08_0029,
  rs_R009_ueqv_R009YNNNN_partial_08_0030,
  rs_R009_ueqv_R009YNNNN_partial_08_0031,
  rs_R009_ueqv_R009YNNNN_partial_08_0032,
  rs_R009_ueqv_R009YNNNN_partial_08_0033,
  rs_R009_ueqv_R009YNNNN_partial_08_0034,
  rs_R009_ueqv_R009YNNNN_partial_08_0035,
  rs_R009_ueqv_R009YNNNN_partial_08_0036,
  rs_R009_ueqv_R009YNNNN_partial_08_0037,
  rs_R009_ueqv_R009YNNNN_partial_08_0038,
  rs_R009_ueqv_R009YNNNN_partial_08_0039,
  rs_R009_ueqv_R009YNNNN_partial_08_0040,
  rs_R009_ueqv_R009YNNNN_partial_08_0041,
  rs_R009_ueqv_R009YNNNN_partial_08_0042,
  rs_R009_ueqv_R009YNNNN_partial_08_0043,
  rs_R009_ueqv_R009YNNNN_partial_08_0044,
  rs_R009_ueqv_R009YNNNN_partial_08_0045,
  rs_R009_ueqv_R009YNNNN_partial_08_0046,
  rs_R009_ueqv_R009YNNNN_partial_08_0047,
  rs_R009_ueqv_R009YNNNN_partial_08_0048,
  rs_R009_ueqv_R009YNNNN_partial_08_0049,
  rs_R009_ueqv_R009YNNNN_partial_08_0050,
  rs_R009_ueqv_R009YNNNN_partial_08_0051,
  rs_R009_ueqv_R009YNNNN_partial_08_0052,
  rs_R009_ueqv_R009YNNNN_partial_08_0053,
  rs_R009_ueqv_R009YNNNN_partial_08_0054,
  rs_R009_ueqv_R009YNNNN_partial_08_0055,
  rs_R009_ueqv_R009YNNNN_partial_08_0056,
  rs_R009_ueqv_R009YNNNN_partial_08_0057,
  rs_R009_ueqv_R009YNNNN_partial_08_0058,
  rs_R009_ueqv_R009YNNNN_partial_08_0059,
  rs_R009_ueqv_R009YNNNN_partial_08_0060,
  rs_R009_ueqv_R009YNNNN_partial_08_0061,
  rs_R009_ueqv_R009YNNNN_partial_08_0062,
  rs_R009_ueqv_R009YNNNN_partial_08_0063,
  rs_R009_ueqv_R009YNNNN_partial_08_0064,
  rs_R009_ueqv_R009YNNNN_partial_08_0065,
  rs_R009_ueqv_R009YNNNN_partial_08_0066,
  rs_R009_ueqv_R009YNNNN_partial_08_0067,
  rs_R009_ueqv_R009YNNNN_partial_08_0068,
  rs_R009_ueqv_R009YNNNN_partial_08_0069,
  rs_R009_ueqv_R009YNNNN_partial_08_0070,
  rs_R009_ueqv_R009YNNNN_partial_08_0071,
  rs_R009_ueqv_R009YNNNN_partial_08_0072,
  rs_R009_ueqv_R009YNNNN_partial_08_0073,
  rs_R009_ueqv_R009YNNNN_partial_08_0074,
  rs_R009_ueqv_R009YNNNN_partial_08_0075,
  rs_R009_ueqv_R009YNNNN_partial_08_0076,
  rs_R009_ueqv_R009YNNNN_partial_08_0077,
  rs_R009_ueqv_R009YNNNN_partial_08_0078,
  rs_R009_ueqv_R009YNNNN_partial_08_0079,
  rs_R009_ueqv_R009YNNNN_partial_08_0080,
  rs_R009_ueqv_R009YNNNN_partial_08_0081,
  rs_R009_ueqv_R009YNNNN_partial_08_0082,
  rs_R009_ueqv_R009YNNNN_partial_08_0083,
  rs_R009_ueqv_R009YNNNN_partial_08_0084,
  rs_R009_ueqv_R009YNNNN_partial_08_0085,
  rs_R009_ueqv_R009YNNNN_partial_08_0086,
  rs_R009_ueqv_R009YNNNN_partial_08_0087,
  rs_R009_ueqv_R009YNNNN_partial_08_0088,
  rs_R009_ueqv_R009YNNNN_partial_08_0089,
  rs_R009_ueqv_R009YNNNN_partial_08_0090,
  rs_R009_ueqv_R009YNNNN_partial_08_0091,
  rs_R009_ueqv_R009YNNNN_partial_08_0092,
  rs_R009_ueqv_R009YNNNN_partial_08_0093,
  rs_R009_ueqv_R009YNNNN_partial_08_0094,
  rs_R009_ueqv_R009YNNNN_partial_08_0095,
  rs_R009_ueqv_R009YNNNN_partial_08_0096,
  rs_R009_ueqv_R009YNNNN_partial_08_0097,
  rs_R009_ueqv_R009YNNNN_partial_08_0098,
  rs_R009_ueqv_R009YNNNN_partial_08_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_08_0000_0099 : Poly :=
[
  term ((334038848723063 : Rat) / 725267815461) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((-7266121881498226 : Rat) / 19582231017447) [(0, 1), (1, 1), (2, 1), (3, 1), (6, 1)],
  term ((231060470397268 : Rat) / 932487191307) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((1382388909826009 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((20375395317189112 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (2, 1), (6, 1), (9, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term ((170 : Rat) / 63) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-10889546461818593 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term ((-864363282899306 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-19918597176517 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1)],
  term ((-6245079982375 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term ((8495480977763 : Rat) / 8993245968) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((21020396170241 : Rat) / 17986491936) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-16602715403875981 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-356536123860233 : Rat) / 355233215736) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((125 : Rat) / 28) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((1788315047921039 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-13 : Rat) / 7) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-840636189128387 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((-2702110390902865 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((14620315676843735 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((-884249508821411 : Rat) / 710466431472) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)],
  term ((1695 : Rat) / 56) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 6) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((41401562551955275 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-335 : Rat) / 14) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-274729186150081 : Rat) / 8703213785532) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((506 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-1507632161923931 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((-16043891849828237 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((-2252573197121 : Rat) / 7708496544) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((5568654126132971 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((715825151312309 : Rat) / 2131399294416) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-185 : Rat) / 168) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((13591741085856961 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((17 : Rat) / 42) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1046790375791975 : Rat) / 967023753948) [(0, 1), (1, 1), (3, 1)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((7266121881498226 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (10, 1)],
  term ((-18257355565865 : Rat) / 6744934476) [(0, 1), (1, 1), (3, 1), (7, 1), (9, 1)],
  term ((254894842984367 : Rat) / 133212455901) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((746867501558939 : Rat) / 266424911802) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-815 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-15345414072456241 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((596 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4778931122581271 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (7, 2)],
  term ((940563350389 : Rat) / 26979737904) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((115 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((882552400483 : Rat) / 17986491936) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (3, 1), (9, 2)],
  term ((-1597194399771035 : Rat) / 1243316255076) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((-1382388909826009 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-109791130856945 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (10, 2)],
  term ((-836702468527 : Rat) / 21748972392) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((715 : Rat) / 84) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((169699851400369 : Rat) / 483511876974) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-163 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((2695613897569945 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((39685933350263 : Rat) / 710466431472) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-195 : Rat) / 56) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2424624353532989 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((5504454652897321 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((5 : Rat) / 2) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-4704406029265919 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((1579190659891 : Rat) / 5995497312) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-5439969882308 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-22478709072083 : Rat) / 78940714608) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((935 : Rat) / 56) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((2937558483162341 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-191 : Rat) / 14) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((108083972820925 : Rat) / 483511876974) [(0, 1), (1, 1), (3, 3)],
  term ((-20375395317189112 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (6, 1), (9, 1), (10, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((32 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((18257355565865 : Rat) / 6744934476) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((10889546461818593 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((19918597176517 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (10, 1), (14, 1)],
  term ((26416251244619909 : Rat) / 26109641356596) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((-746867501558939 : Rat) / 266424911802) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((815 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((15345414072456241 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-596 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1676110488728519 : Rat) / 967023753948) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((4778931122581271 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 2), (11, 1)],
  term ((6245079982375 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((-21020396170241 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-35204873486731 : Rat) / 53959475808) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-882552400483 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((92 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16093842639797 : Rat) / 53959475808) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((12215711748490811 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((2702110390902865 : Rat) / 6527410339149) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-14620315676843735 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((884249508821411 : Rat) / 710466431472) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1695 : Rat) / 56) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((175 : Rat) / 6) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-41401562551955275 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((335 : Rat) / 14) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((274729186150081 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-506 : Rat) / 21) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((1821802383870013 : Rat) / 4351606892766) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((1423391591849089 : Rat) / 2131399294416) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((-565 : Rat) / 168) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-45781411948435663 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((61 : Rat) / 42) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((1046790375791975 : Rat) / 967023753948) [(0, 1), (1, 1), (11, 1)],
  term ((-39685933350263 : Rat) / 710466431472) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((195 : Rat) / 56) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2424624353532989 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((-5504454652897321 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-5 : Rat) / 2) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((688921986861887 : Rat) / 2131399294416) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((-605 : Rat) / 24) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-5992155808368983 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((899 : Rat) / 42) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-104667904 : Rat) / 243873) [(0, 1), (1, 1), (11, 3)],
  term ((-175873676507441 : Rat) / 1450535630922) [(0, 1), (1, 2), (2, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (2, 1), (6, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 2)],
  term ((910502333986129 : Rat) / 1450535630922) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((-2400282914965 : Rat) / 6744934476) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((-1120619495473511 : Rat) / 6527410339149) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((98924091250783 : Rat) / 266424911802) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-355 : Rat) / 21) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-328860012575350 : Rat) / 310829063769) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((292 : Rat) / 21) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1801698178826815 : Rat) / 26109641356596) [(0, 1), (1, 2), (3, 2)],
  term ((-45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (10, 1)],
  term ((-910502333986129 : Rat) / 1450535630922) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((2400282914965 : Rat) / 6744934476) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((175873676507441 : Rat) / 1450535630922) [(0, 1), (1, 2), (10, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (10, 2)],
  term ((-98924091250783 : Rat) / 266424911802) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((355 : Rat) / 21) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((328860012575350 : Rat) / 310829063769) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-292 : Rat) / 21) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((698241795635651 : Rat) / 2901071261844) [(0, 1), (1, 2), (11, 2)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (3, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (11, 1)],
  term ((22240570009072991 : Rat) / 26109641356596) [(0, 1), (2, 1)],
  term ((30756238917916247 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-2361183283771 : Rat) / 10117401714) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((2213471455971082 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((115792775905297 : Rat) / 399637367703) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((3070 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((63845018543594861 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-2656 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (3, 2)],
  term ((-28547376631104355 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 2), (10, 1)],
  term ((2664495422304851 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (10, 1)],
  term ((-27619545035095 : Rat) / 20234803428) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((-4433002304700377 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (10, 2)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (11, 2)],
  term ((45995349365184833 : Rat) / 52219282713192) [(0, 1), (2, 2)],
  term ((-18322875448082693 : Rat) / 11189846295684) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((61723112243195 : Rat) / 323756854848) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((-2826312734971063 : Rat) / 19582231017447) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-3071682489140177 : Rat) / 12788395766496) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-53275 : Rat) / 1008) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-495761813112725857 : Rat) / 156657848139576) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((11467 : Rat) / 252) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((49794420652104095 : Rat) / 78328924069788) [(0, 1), (2, 2), (3, 2)],
  term ((-396914224780888 : Rat) / 241755938487) [(0, 1), (2, 2), (6, 1)],
  term ((15715879538255 : Rat) / 5781372408) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((-2969416900085843 : Rat) / 2901071261844) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-746867501558939 : Rat) / 532849823604) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((815 : Rat) / 42) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((15345414072456241 : Rat) / 8703213785532) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-298 : Rat) / 21) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((4778931122581271 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 2)],
  term ((-132504305713 : Rat) / 2202427584) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-882552400483 : Rat) / 35972983872) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (2, 2), (9, 2)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (2, 2), (10, 1)],
  term ((293225621858755 : Rat) / 4262798588832) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-2815 : Rat) / 336) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-462705210771361 : Rat) / 5802142523688) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((607 : Rat) / 84) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1332519555233341 : Rat) / 8703213785532) [(0, 1), (2, 2), (11, 2)],
  term ((-39685933350263 : Rat) / 1420932862944) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((195 : Rat) / 112) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((2424624353532989 : Rat) / 17406427571064) [(0, 1), (2, 2), (14, 1)],
  term ((-5504454652897321 : Rat) / 17406427571064) [(0, 1), (2, 2), (15, 2)],
  term ((-5 : Rat) / 4) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 3)],
  term ((1745057488304621 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((1745057488304621 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (11, 2)],
  term ((4611584279159 : Rat) / 107918951616) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((4611584279159 : Rat) / 107918951616) [(0, 1), (3, 1), (9, 1), (11, 2)],
  term ((204280426333327 : Rat) / 6527410339149) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((-211228779943109 : Rat) / 4262798588832) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((1385 : Rat) / 336) [(0, 1), (3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-555493897630853 : Rat) / 5802142523688) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-281 : Rat) / 84) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-211228779943109 : Rat) / 4262798588832) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((1385 : Rat) / 336) [(0, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-555493897630853 : Rat) / 5802142523688) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-281 : Rat) / 84) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((204280426333327 : Rat) / 6527410339149) [(0, 1), (3, 1), (11, 3)],
  term ((1046790375791975 : Rat) / 1934047507896) [(0, 1), (3, 2)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (3, 2), (6, 1)],
  term ((18257355565865 : Rat) / 13489868952) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((-2969416900085843 : Rat) / 2901071261844) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-746867501558939 : Rat) / 532849823604) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((815 : Rat) / 42) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((15345414072456241 : Rat) / 8703213785532) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-298 : Rat) / 21) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((4778931122581271 : Rat) / 4351606892766) [(0, 1), (3, 2), (7, 2)],
  term ((-132504305713 : Rat) / 2202427584) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-882552400483 : Rat) / 35972983872) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (3, 2), (9, 2)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (3, 2), (10, 1)],
  term ((2433444203368205 : Rat) / 26109641356596) [(0, 1), (3, 2), (10, 2)],
  term ((293225621858755 : Rat) / 4262798588832) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-2815 : Rat) / 336) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-462705210771361 : Rat) / 5802142523688) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((607 : Rat) / 84) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-782057231165909 : Rat) / 13054820678298) [(0, 1), (3, 2), (11, 2)],
  term ((-39685933350263 : Rat) / 1420932862944) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((195 : Rat) / 112) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((2424624353532989 : Rat) / 17406427571064) [(0, 1), (3, 2), (14, 1)],
  term ((-5504454652897321 : Rat) / 17406427571064) [(0, 1), (3, 2), (15, 2)],
  term ((-5 : Rat) / 4) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-1745057488304621 : Rat) / 26109641356596) [(0, 1), (3, 3), (7, 1)],
  term ((-4611584279159 : Rat) / 107918951616) [(0, 1), (3, 3), (9, 1)],
  term ((-204280426333327 : Rat) / 6527410339149) [(0, 1), (3, 3), (11, 1)],
  term ((211228779943109 : Rat) / 4262798588832) [(0, 1), (3, 3), (13, 1)],
  term ((-1385 : Rat) / 336) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((555493897630853 : Rat) / 5802142523688) [(0, 1), (3, 3), (15, 1)],
  term ((281 : Rat) / 84) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-2433444203368205 : Rat) / 26109641356596) [(0, 1), (3, 4)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (10, 2)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (11, 2)],
  term ((-18257355565865 : Rat) / 13489868952) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((-18257355565865 : Rat) / 13489868952) [(0, 1), (7, 1), (9, 1), (11, 2)],
  term ((2969416900085843 : Rat) / 2901071261844) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((746867501558939 : Rat) / 532849823604) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((-815 : Rat) / 42) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-15345414072456241 : Rat) / 8703213785532) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((298 : Rat) / 21) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((746867501558939 : Rat) / 532849823604) [(0, 1), (7, 1), (11, 2), (13, 1)],
  term ((-815 : Rat) / 42) [(0, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-15345414072456241 : Rat) / 8703213785532) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((298 : Rat) / 21) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((2969416900085843 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 3)],
  term ((-4778931122581271 : Rat) / 4351606892766) [(0, 1), (7, 2), (10, 2)],
  term ((-4778931122581271 : Rat) / 4351606892766) [(0, 1), (7, 2), (11, 2)],
  term ((132504305713 : Rat) / 2202427584) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((882552400483 : Rat) / 35972983872) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((882552400483 : Rat) / 35972983872) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((132504305713 : Rat) / 2202427584) [(0, 1), (9, 1), (11, 3)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (10, 2)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (11, 2)],
  term ((-22240570009072991 : Rat) / 26109641356596) [(0, 1), (10, 1)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1), (11, 2)],
  term ((-1046790375791975 : Rat) / 1934047507896) [(0, 1), (10, 2)],
  term ((-293225621858755 : Rat) / 4262798588832) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((2815 : Rat) / 336) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((462705210771361 : Rat) / 5802142523688) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-607 : Rat) / 84) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1332519555233341 : Rat) / 8703213785532) [(0, 1), (10, 2), (11, 2)],
  term ((39685933350263 : Rat) / 1420932862944) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-195 : Rat) / 112) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2424624353532989 : Rat) / 17406427571064) [(0, 1), (10, 2), (14, 1)],
  term ((5504454652897321 : Rat) / 17406427571064) [(0, 1), (10, 2), (15, 2)],
  term ((5 : Rat) / 4) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 3)],
  term ((-1046790375791975 : Rat) / 1934047507896) [(0, 1), (11, 2)],
  term ((39685933350263 : Rat) / 1420932862944) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-195 : Rat) / 112) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2424624353532989 : Rat) / 17406427571064) [(0, 1), (11, 2), (14, 1)],
  term ((5504454652897321 : Rat) / 17406427571064) [(0, 1), (11, 2), (15, 2)],
  term ((5 : Rat) / 4) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-293225621858755 : Rat) / 4262798588832) [(0, 1), (11, 3), (13, 1)],
  term ((2815 : Rat) / 336) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((462705210771361 : Rat) / 5802142523688) [(0, 1), (11, 3), (15, 1)],
  term ((-607 : Rat) / 84) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((1332519555233341 : Rat) / 8703213785532) [(0, 1), (11, 4)],
  term ((-484823062796770 : Rat) / 6527410339149) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((910502333986129 : Rat) / 1450535630922) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-2400282914965 : Rat) / 6744934476) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((98924091250783 : Rat) / 266424911802) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((-355 : Rat) / 21) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-328860012575350 : Rat) / 310829063769) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((292 : Rat) / 21) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((484823062796770 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((-910502333986129 : Rat) / 1450535630922) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((2400282914965 : Rat) / 6744934476) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-98924091250783 : Rat) / 266424911802) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((355 : Rat) / 21) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((328860012575350 : Rat) / 310829063769) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-292 : Rat) / 21) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (2, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (10, 1)],
  term ((-1046790375791975 : Rat) / 967023753948) [(0, 2), (2, 1)],
  term ((1745057488304621 : Rat) / 13054820678298) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((4611584279159 : Rat) / 53959475808) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((408560852666654 : Rat) / 6527410339149) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((-211228779943109 : Rat) / 2131399294416) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((1385 : Rat) / 168) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-555493897630853 : Rat) / 2901071261844) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((-281 : Rat) / 42) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((2433444203368205 : Rat) / 13054820678298) [(0, 2), (2, 1), (3, 2)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 2), (2, 1), (6, 1)],
  term ((-18257355565865 : Rat) / 6744934476) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((2969416900085843 : Rat) / 1450535630922) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((746867501558939 : Rat) / 266424911802) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-815 : Rat) / 21) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-15345414072456241 : Rat) / 4351606892766) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((596 : Rat) / 21) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4778931122581271 : Rat) / 2175803446383) [(0, 2), (2, 1), (7, 2)],
  term ((132504305713 : Rat) / 1101213792) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((115 : Rat) / 7) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((882552400483 : Rat) / 17986491936) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 2), (2, 1), (9, 2)],
  term ((-1657549873622411 : Rat) / 1243316255076) [(0, 2), (2, 1), (10, 1)],
  term ((-293225621858755 : Rat) / 2131399294416) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((2815 : Rat) / 168) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((462705210771361 : Rat) / 2901071261844) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-607 : Rat) / 42) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1332519555233341 : Rat) / 4351606892766) [(0, 2), (2, 1), (11, 2)],
  term ((39685933350263 : Rat) / 710466431472) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-195 : Rat) / 56) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2424624353532989 : Rat) / 8703213785532) [(0, 2), (2, 1), (14, 1)],
  term ((5504454652897321 : Rat) / 8703213785532) [(0, 2), (2, 1), (15, 2)],
  term ((5 : Rat) / 2) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((369246208469699 : Rat) / 1450535630922) [(0, 2), (2, 2)],
  term ((-1745057488304621 : Rat) / 13054820678298) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((-4611584279159 : Rat) / 53959475808) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((-408560852666654 : Rat) / 6527410339149) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((211228779943109 : Rat) / 2131399294416) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-1385 : Rat) / 168) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((555493897630853 : Rat) / 2901071261844) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((281 : Rat) / 42) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2433444203368205 : Rat) / 13054820678298) [(0, 2), (3, 2), (10, 1)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 2), (6, 1), (10, 1)],
  term ((18257355565865 : Rat) / 6744934476) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((-2969416900085843 : Rat) / 1450535630922) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-746867501558939 : Rat) / 266424911802) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((815 : Rat) / 21) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((15345414072456241 : Rat) / 4351606892766) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-596 : Rat) / 21) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4778931122581271 : Rat) / 2175803446383) [(0, 2), (7, 2), (10, 1)],
  term ((-132504305713 : Rat) / 1101213792) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-115 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-882552400483 : Rat) / 17986491936) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((92 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 2), (9, 2), (10, 1)],
  term ((1046790375791975 : Rat) / 967023753948) [(0, 2), (10, 1)],
  term ((293225621858755 : Rat) / 2131399294416) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-2815 : Rat) / 168) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-462705210771361 : Rat) / 2901071261844) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((607 : Rat) / 42) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1332519555233341 : Rat) / 4351606892766) [(0, 2), (10, 1), (11, 2)],
  term ((-39685933350263 : Rat) / 710466431472) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((195 : Rat) / 56) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2424624353532989 : Rat) / 8703213785532) [(0, 2), (10, 1), (14, 1)],
  term ((-5504454652897321 : Rat) / 8703213785532) [(0, 2), (10, 1), (15, 2)],
  term ((-5 : Rat) / 2) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 2), (10, 2)],
  term ((4433002304700377 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1)],
  term ((-2664495422304851 : Rat) / 2901071261844) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((27619545035095 : Rat) / 20234803428) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((30756238917916247 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-2361183283771 : Rat) / 10117401714) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((-125003120951594 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (10, 2)],
  term ((115792775905297 : Rat) / 399637367703) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((3070 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((63845018543594861 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-2656 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-411594084012392 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-55625449702867687 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((151665297199793 : Rat) / 323756854848) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-10504915129786669 : Rat) / 8703213785532) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-7039933377915827 : Rat) / 12788395766496) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-44305 : Rat) / 1008) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1)],
  term ((-510099010021835671 : Rat) / 156657848139576) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((9697 : Rat) / 252) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((33797507711071303 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 3)],
  term ((2664495422304851 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-27619545035095 : Rat) / 20234803428) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((-1962342710988269 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1), (10, 2)],
  term ((-1962342710988269 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-8456381346569 : Rat) / 35972983872) [(1, 1), (2, 1), (9, 1), (10, 2)],
  term ((-8456381346569 : Rat) / 35972983872) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((9531865693995661 : Rat) / 26109641356596) [(1, 1), (2, 1), (10, 2), (11, 1)],
  term ((52929596015021 : Rat) / 202990408992) [(1, 1), (2, 1), (10, 2), (13, 1)],
  term ((-535 : Rat) / 112) [(1, 1), (2, 1), (10, 2), (13, 1), (16, 1)],
  term ((-220379442307739 : Rat) / 52219282713192) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((103 : Rat) / 28) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4433002304700377 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1)],
  term ((52929596015021 : Rat) / 202990408992) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-535 : Rat) / 112) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((-220379442307739 : Rat) / 52219282713192) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((103 : Rat) / 28) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((9531865693995661 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 3)],
  term ((-298831488976427 : Rat) / 2901071261844) [(1, 1), (2, 2), (3, 1)],
  term ((3633060940749113 : Rat) / 19582231017447) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((640 : Rat) / 63) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((-1382388909826009 : Rat) / 26109641356596) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-10187697658594556 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 2), (6, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((10889546461818593 : Rat) / 26109641356596) [(1, 1), (2, 2), (7, 1)],
  term ((4555432559686187 : Rat) / 13054820678298) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(1, 1), (2, 2), (7, 1), (14, 1)],
  term ((6245079982375 : Rat) / 26979737904) [(1, 1), (2, 2), (9, 1)],
  term ((-8534580608957 : Rat) / 35972983872) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-21020396170241 : Rat) / 35972983872) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((149760 : Rat) / 553) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((342565075615319 : Rat) / 1420932862944) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((285 : Rat) / 112) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-31969291420270963 : Rat) / 52219282713192) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-11 : Rat) / 4) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((89856 : Rat) / 553) [(1, 1), (2, 2), (11, 1)],
  term ((2702110390902865 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-14620315676843735 : Rat) / 52219282713192) [(1, 1), (2, 2), (13, 1)],
  term ((884249508821411 : Rat) / 1420932862944) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((-1695 : Rat) / 112) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((175 : Rat) / 12) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-41401562551955275 : Rat) / 52219282713192) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((335 : Rat) / 28) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((274729186150081 : Rat) / 17406427571064) [(1, 1), (2, 2), (15, 1)],
  term ((-253 : Rat) / 21) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((125003120951594 : Rat) / 932487191307) [(1, 1), (2, 3), (3, 1)],
  term ((1962342710988269 : Rat) / 13054820678298) [(1, 1), (2, 3), (7, 1)],
  term ((8456381346569 : Rat) / 35972983872) [(1, 1), (2, 3), (9, 1)],
  term ((-9531865693995661 : Rat) / 26109641356596) [(1, 1), (2, 3), (11, 1)],
  term ((-52929596015021 : Rat) / 202990408992) [(1, 1), (2, 3), (13, 1)],
  term ((535 : Rat) / 112) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((220379442307739 : Rat) / 52219282713192) [(1, 1), (2, 3), (15, 1)],
  term ((-103 : Rat) / 28) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((22240570009072991 : Rat) / 26109641356596) [(1, 1), (3, 1)],
  term ((-3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (10, 2)],
  term ((-3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (11, 2)],
  term ((-640 : Rat) / 63) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((298831488976427 : Rat) / 2901071261844) [(1, 1), (3, 1), (10, 2)],
  term ((1382388909826009 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 2), (14, 1)],
  term ((-640 : Rat) / 63) [(1, 1), (3, 1), (10, 3)],
  term ((298831488976427 : Rat) / 2901071261844) [(1, 1), (3, 1), (11, 2)],
  term ((1382388909826009 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((-10187697658594556 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 2), (6, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((10889546461818593 : Rat) / 26109641356596) [(1, 1), (3, 2), (7, 1)],
  term ((4555432559686187 : Rat) / 13054820678298) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((6245079982375 : Rat) / 26979737904) [(1, 1), (3, 2), (9, 1)],
  term ((-8534580608957 : Rat) / 35972983872) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((-21020396170241 : Rat) / 35972983872) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((149760 : Rat) / 553) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((342565075615319 : Rat) / 1420932862944) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((285 : Rat) / 112) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-31969291420270963 : Rat) / 52219282713192) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-11 : Rat) / 4) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((89856 : Rat) / 553) [(1, 1), (3, 2), (11, 1)],
  term ((2702110390902865 : Rat) / 13054820678298) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-14620315676843735 : Rat) / 52219282713192) [(1, 1), (3, 2), (13, 1)],
  term ((884249508821411 : Rat) / 1420932862944) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-1695 : Rat) / 112) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((175 : Rat) / 12) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-41401562551955275 : Rat) / 52219282713192) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((335 : Rat) / 28) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((274729186150081 : Rat) / 17406427571064) [(1, 1), (3, 2), (15, 1)],
  term ((-253 : Rat) / 21) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-298831488976427 : Rat) / 2901071261844) [(1, 1), (3, 3)],
  term ((3633060940749113 : Rat) / 19582231017447) [(1, 1), (3, 3), (6, 1)],
  term ((640 : Rat) / 63) [(1, 1), (3, 3), (10, 1)],
  term ((-1382388909826009 : Rat) / 26109641356596) [(1, 1), (3, 3), (14, 1)],
  term ((10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (10, 2)],
  term ((10187697658594556 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 2)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (10, 2)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (10, 2), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (10, 2), (13, 1)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (10, 2), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (10, 2), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 3)],
  term ((-4555432559686187 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-10889546461818593 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 2)],
  term ((-19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (10, 2), (14, 1)],
  term ((-4555432559686187 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 3)],
  term ((-10889546461818593 : Rat) / 26109641356596) [(1, 1), (7, 1), (11, 2)],
  term ((-19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((8534580608957 : Rat) / 35972983872) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1), (10, 2)],
  term ((21020396170241 : Rat) / 35972983872) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((8534580608957 : Rat) / 35972983872) [(1, 1), (9, 1), (10, 3)],
  term ((-6245079982375 : Rat) / 26979737904) [(1, 1), (9, 1), (11, 2)],
  term ((21020396170241 : Rat) / 35972983872) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((-342565075615319 : Rat) / 1420932862944) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-285 : Rat) / 112) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((31969291420270963 : Rat) / 52219282713192) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((11 : Rat) / 4) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 3)],
  term ((-89856 : Rat) / 553) [(1, 1), (10, 2), (11, 1)],
  term ((-2702110390902865 : Rat) / 13054820678298) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((14620315676843735 : Rat) / 52219282713192) [(1, 1), (10, 2), (13, 1)],
  term ((-884249508821411 : Rat) / 1420932862944) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((1695 : Rat) / 112) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 12) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((41401562551955275 : Rat) / 52219282713192) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((-335 : Rat) / 28) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-274729186150081 : Rat) / 17406427571064) [(1, 1), (10, 2), (15, 1)],
  term ((253 : Rat) / 21) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 3), (11, 1)],
  term ((-342565075615319 : Rat) / 1420932862944) [(1, 1), (10, 3), (13, 1)],
  term ((-285 : Rat) / 112) [(1, 1), (10, 3), (13, 1), (16, 1)],
  term ((31969291420270963 : Rat) / 52219282713192) [(1, 1), (10, 3), (15, 1)],
  term ((11 : Rat) / 4) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((-22240570009072991 : Rat) / 26109641356596) [(1, 1), (11, 1)],
  term ((14620315676843735 : Rat) / 52219282713192) [(1, 1), (11, 2), (13, 1)],
  term ((-884249508821411 : Rat) / 1420932862944) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((1695 : Rat) / 112) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 12) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((41401562551955275 : Rat) / 52219282713192) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-335 : Rat) / 28) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-274729186150081 : Rat) / 17406427571064) [(1, 1), (11, 2), (15, 1)],
  term ((253 : Rat) / 21) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-89856 : Rat) / 553) [(1, 1), (11, 3)],
  term ((-2702110390902865 : Rat) / 13054820678298) [(1, 1), (11, 3), (14, 1)],
  term ((-1962342710988269 : Rat) / 6527410339149) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-8456381346569 : Rat) / 17986491936) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((4343984360213431 : Rat) / 4351606892766) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((52929596015021 : Rat) / 101495204496) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-535 : Rat) / 56) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-220379442307739 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((103 : Rat) / 14) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-250006241903188 : Rat) / 932487191307) [(1, 2), (2, 1), (3, 2)],
  term ((1962342710988269 : Rat) / 6527410339149) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((8456381346569 : Rat) / 17986491936) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-52929596015021 : Rat) / 101495204496) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((535 : Rat) / 56) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((220379442307739 : Rat) / 26109641356596) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-103 : Rat) / 14) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9531865693995661 : Rat) / 13054820678298) [(1, 2), (2, 1), (11, 2)],
  term ((175873676507441 : Rat) / 2901071261844) [(1, 2), (2, 2)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 2), (2, 2), (6, 1)],
  term ((20375395317189112 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((-87123238546533313 : Rat) / 39164462034894) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((170 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-10889546461818593 : Rat) / 13054820678298) [(1, 2), (3, 1), (7, 1)],
  term ((-4555432559686187 : Rat) / 6527410339149) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-19918597176517 : Rat) / 1450535630922) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-6245079982375 : Rat) / 13489868952) [(1, 2), (3, 1), (9, 1)],
  term ((8534580608957 : Rat) / 17986491936) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((21020396170241 : Rat) / 17986491936) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-2594560 : Rat) / 4977) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-342565075615319 : Rat) / 710466431472) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((-285 : Rat) / 56) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((31969291420270963 : Rat) / 26109641356596) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((11 : Rat) / 2) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-770221469635115 : Rat) / 1450535630922) [(1, 2), (3, 1), (11, 1)],
  term ((-2262203230543913 : Rat) / 4351606892766) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((14620315676843735 : Rat) / 26109641356596) [(1, 2), (3, 1), (13, 1)],
  term ((-884249508821411 : Rat) / 710466431472) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((1695 : Rat) / 56) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-175 : Rat) / 6) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((41401562551955275 : Rat) / 26109641356596) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-335 : Rat) / 14) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-274729186150081 : Rat) / 8703213785532) [(1, 2), (3, 1), (15, 1)],
  term ((506 : Rat) / 21) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((85948517162255 : Rat) / 322341251316) [(1, 2), (3, 2)],
  term ((-14669837835356717 : Rat) / 39164462034894) [(1, 2), (3, 2), (6, 1)],
  term ((-1280 : Rat) / 63) [(1, 2), (3, 2), (10, 1)],
  term ((1382388909826009 : Rat) / 13054820678298) [(1, 2), (3, 2), (14, 1)],
  term ((-20375395317189112 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (10, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((16965512730315005 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 2)],
  term ((4555432559686187 : Rat) / 6527410339149) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((10889546461818593 : Rat) / 13054820678298) [(1, 2), (7, 1), (11, 1)],
  term ((19918597176517 : Rat) / 1450535630922) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-8534580608957 : Rat) / 17986491936) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((6245079982375 : Rat) / 13489868952) [(1, 2), (9, 1), (11, 1)],
  term ((-21020396170241 : Rat) / 17986491936) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((342565075615319 : Rat) / 710466431472) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((285 : Rat) / 56) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-31969291420270963 : Rat) / 26109641356596) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-11 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((299520 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((-175873676507441 : Rat) / 2901071261844) [(1, 2), (10, 2)],
  term ((-14620315676843735 : Rat) / 26109641356596) [(1, 2), (11, 1), (13, 1)],
  term ((884249508821411 : Rat) / 710466431472) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1695 : Rat) / 56) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((175 : Rat) / 6) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41401562551955275 : Rat) / 26109641356596) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((335 : Rat) / 14) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((274729186150081 : Rat) / 8703213785532) [(1, 2), (11, 1), (15, 1)],
  term ((-506 : Rat) / 21) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((9707674491265 : Rat) / 36722421036) [(1, 2), (11, 2)],
  term ((2702110390902865 : Rat) / 6527410339149) [(1, 2), (11, 2), (14, 1)],
  term ((-175873676507441 : Rat) / 1450535630922) [(1, 3), (3, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 3), (3, 1), (6, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 3), (6, 1), (11, 1)],
  term ((175873676507441 : Rat) / 1450535630922) [(1, 3), (11, 1)],
  term ((-30756238917916247 : Rat) / 39164462034894) [(2, 1), (3, 1), (7, 1), (10, 2)],
  term ((-30756238917916247 : Rat) / 39164462034894) [(2, 1), (3, 1), (7, 1), (11, 2)],
  term ((2361183283771 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1), (10, 2)],
  term ((2361183283771 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1), (11, 2)],
  term ((-1106735727985541 : Rat) / 19582231017447) [(2, 1), (3, 1), (10, 2), (11, 1)],
  term ((-115792775905297 : Rat) / 799274735406) [(2, 1), (3, 1), (10, 2), (13, 1)],
  term ((-1535 : Rat) / 63) [(2, 1), (3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (10, 2), (14, 1), (15, 1)],
  term ((-63845018543594861 : Rat) / 39164462034894) [(2, 1), (3, 1), (10, 2), (15, 1)],
  term ((1328 : Rat) / 63) [(2, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-115792775905297 : Rat) / 799274735406) [(2, 1), (3, 1), (11, 2), (13, 1)],
  term ((-1535 : Rat) / 63) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-63845018543594861 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((1328 : Rat) / 63) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1106735727985541 : Rat) / 19582231017447) [(2, 1), (3, 1), (11, 3)],
  term ((-4433002304700377 : Rat) / 26109641356596) [(2, 1), (3, 2)],
  term ((2664495422304851 : Rat) / 5802142523688) [(2, 1), (3, 2), (6, 1)],
  term ((-27619545035095 : Rat) / 40469606856) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2), (10, 2)],
  term ((28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2), (11, 2)],
  term ((30756238917916247 : Rat) / 39164462034894) [(2, 1), (3, 3), (7, 1)],
  term ((-2361183283771 : Rat) / 20234803428) [(2, 1), (3, 3), (9, 1)],
  term ((1106735727985541 : Rat) / 19582231017447) [(2, 1), (3, 3), (11, 1)],
  term ((115792775905297 : Rat) / 799274735406) [(2, 1), (3, 3), (13, 1)],
  term ((1535 : Rat) / 63) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 3), (14, 1), (15, 1)],
  term ((63845018543594861 : Rat) / 39164462034894) [(2, 1), (3, 3), (15, 1)],
  term ((-1328 : Rat) / 63) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((-28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 4)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1), (10, 2)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1), (11, 2)],
  term ((27619545035095 : Rat) / 40469606856) [(2, 1), (7, 1), (9, 1), (10, 2)],
  term ((27619545035095 : Rat) / 40469606856) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((4433002304700377 : Rat) / 26109641356596) [(2, 1), (10, 2)],
  term ((4433002304700377 : Rat) / 26109641356596) [(2, 1), (11, 2)],
  term ((-22240570009072991 : Rat) / 52219282713192) [(2, 2)],
  term ((-4433002304700377 : Rat) / 26109641356596) [(2, 3)],
  term ((30756238917916247 : Rat) / 39164462034894) [(2, 3), (3, 1), (7, 1)],
  term ((-2361183283771 : Rat) / 20234803428) [(2, 3), (3, 1), (9, 1)],
  term ((1106735727985541 : Rat) / 19582231017447) [(2, 3), (3, 1), (11, 1)],
  term ((115792775905297 : Rat) / 799274735406) [(2, 3), (3, 1), (13, 1)],
  term ((1535 : Rat) / 63) [(2, 3), (3, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 3), (3, 1), (14, 1), (15, 1)],
  term ((63845018543594861 : Rat) / 39164462034894) [(2, 3), (3, 1), (15, 1)],
  term ((-1328 : Rat) / 63) [(2, 3), (3, 1), (15, 1), (16, 1)],
  term ((-28547376631104355 : Rat) / 78328924069788) [(2, 3), (3, 2)],
  term ((2664495422304851 : Rat) / 5802142523688) [(2, 3), (6, 1)],
  term ((-27619545035095 : Rat) / 40469606856) [(2, 3), (7, 1), (9, 1)],
  term ((-22240570009072991 : Rat) / 52219282713192) [(3, 2)],
  term ((22240570009072991 : Rat) / 52219282713192) [(10, 2)],
  term ((22240570009072991 : Rat) / 52219282713192) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_08_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_08_0000_0099
      rs_R009_ueqv_R009YNNNN_block_08_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
