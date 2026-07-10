/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 14:0-30

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_14_0000_0030 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(4, 1)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0000 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 0 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0000 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((13546041600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(0, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0000
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0001 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0001 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (9, 1), (11, 3), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0001
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0002 : Poly :=
[
  term ((860779296 : Rat) / 8578069) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0002 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0002
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0003 : Poly :=
[
  term ((11559911697229640 : Rat) / 75775513394677) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 3 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0003 : Poly :=
[
  term ((23119823394459280 : Rat) / 75775513394677) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-23119823394459280 : Rat) / 75775513394677) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((23119823394459280 : Rat) / 75775513394677) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-11559911697229640 : Rat) / 75775513394677) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((11559911697229640 : Rat) / 75775513394677) [(0, 1), (11, 1), (15, 1)],
  term ((-11559911697229640 : Rat) / 75775513394677) [(0, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0003
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0004 : Poly :=
[
  term ((-23493300000 : Rat) / 150171761) [(0, 1), (11, 2)]
]

/-- Partial product 4 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0004 : Poly :=
[
  term ((-46986600000 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 2)],
  term ((46986600000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2)],
  term ((-46986600000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 3)],
  term ((23493300000 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2)],
  term ((-23493300000 : Rat) / 150171761) [(0, 1), (11, 2)],
  term ((23493300000 : Rat) / 150171761) [(0, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0004
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0005 : Poly :=
[
  term ((157223652167087815 : Rat) / 75775513394677) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 5 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0005 : Poly :=
[
  term ((314447304334175630 : Rat) / 75775513394677) [(0, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-314447304334175630 : Rat) / 75775513394677) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((314447304334175630 : Rat) / 75775513394677) [(0, 1), (5, 1), (11, 3), (15, 2)],
  term ((-157223652167087815 : Rat) / 75775513394677) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((157223652167087815 : Rat) / 75775513394677) [(0, 1), (11, 2), (15, 2)],
  term ((-157223652167087815 : Rat) / 75775513394677) [(0, 1), (11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0005
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0006 : Poly :=
[
  term ((-1131676349127866250 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 1)]
]

/-- Partial product 6 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0006 : Poly :=
[
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (15, 1)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 4), (15, 1)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (15, 1)],
  term ((-1131676349127866250 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 1)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(0, 1), (11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0006
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0007 : Poly :=
[
  term ((13846265908 : Rat) / 25734207) [(0, 1), (15, 2)]
]

/-- Partial product 7 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0007 : Poly :=
[
  term ((27692531816 : Rat) / 25734207) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-27692531816 : Rat) / 25734207) [(0, 1), (4, 1), (15, 2)],
  term ((27692531816 : Rat) / 25734207) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-13846265908 : Rat) / 25734207) [(0, 1), (10, 2), (15, 2)],
  term ((-13846265908 : Rat) / 25734207) [(0, 1), (11, 2), (15, 2)],
  term ((13846265908 : Rat) / 25734207) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0007
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0008 : Poly :=
[
  term ((146701653600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 8 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0008 : Poly :=
[
  term ((293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1)],
  term ((-293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 2)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (2, 1), (10, 2), (11, 1)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0008
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0009 : Poly :=
[
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 9 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0009 : Poly :=
[
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 3), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 2), (11, 2), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0009
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0010 : Poly :=
[
  term ((822900664 : Rat) / 8578069) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 10 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0010 : Poly :=
[
  term ((1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(1, 1), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0010
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0011 : Poly :=
[
  term ((23493300000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 11 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0011 : Poly :=
[
  term ((-46986600000 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((46986600000 : Rat) / 150171761) [(1, 1), (4, 1), (10, 2), (11, 1)],
  term ((46986600000 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 2)],
  term ((23493300000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)],
  term ((-23493300000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3)],
  term ((-23493300000 : Rat) / 150171761) [(1, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0011
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0012 : Poly :=
[
  term ((1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 12 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0012 : Poly :=
[
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 2), (11, 2), (15, 1)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 3), (15, 1)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((-1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (10, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0012
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0013 : Poly :=
[
  term ((1860868520 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 13 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0013 : Poly :=
[
  term ((-3721737040 : Rat) / 8578069) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((3721737040 : Rat) / 8578069) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((3721737040 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1860868520 : Rat) / 8578069) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((1860868520 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)],
  term ((-1860868520 : Rat) / 8578069) [(1, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0013
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0014 : Poly :=
[
  term ((-107867177800 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 14 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0014 : Poly :=
[
  term ((-215734355600 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((215734355600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)],
  term ((-215734355600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2)],
  term ((107867177800 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1)],
  term ((-107867177800 : Rat) / 150171761) [(1, 1), (11, 1)],
  term ((107867177800 : Rat) / 150171761) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0014
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0015 : Poly :=
[
  term ((-10391961449726553845 : Rat) / 2576367455419018) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 15 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0015 : Poly :=
[
  term ((-10391961449726553845 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((10391961449726553845 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((-10391961449726553845 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((10391961449726553845 : Rat) / 2576367455419018) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-10391961449726553845 : Rat) / 2576367455419018) [(1, 1), (11, 2), (15, 1)],
  term ((10391961449726553845 : Rat) / 2576367455419018) [(1, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0015
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0016 : Poly :=
[
  term ((-6866315006 : Rat) / 25734207) [(1, 1), (15, 1)]
]

/-- Partial product 16 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0016 : Poly :=
[
  term ((-13732630012 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((13732630012 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)],
  term ((-13732630012 : Rat) / 25734207) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((6866315006 : Rat) / 25734207) [(1, 1), (10, 2), (15, 1)],
  term ((6866315006 : Rat) / 25734207) [(1, 1), (11, 2), (15, 1)],
  term ((-6866315006 : Rat) / 25734207) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0016
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0017 : Poly :=
[
  term ((-146701653600 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 17 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0017 : Poly :=
[
  term ((-293403307200 : Rat) / 150171761) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((293403307200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-293403307200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0017
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0018 : Poly :=
[
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 18 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0018 : Poly :=
[
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(2, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 3), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(2, 1), (11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0018
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0019 : Poly :=
[
  term ((-822900664 : Rat) / 8578069) [(2, 1), (15, 2)]
]

/-- Partial product 19 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0019 : Poly :=
[
  term ((-1645801328 : Rat) / 8578069) [(2, 1), (4, 1), (10, 1), (15, 2)],
  term ((1645801328 : Rat) / 8578069) [(2, 1), (4, 1), (15, 2)],
  term ((-1645801328 : Rat) / 8578069) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((822900664 : Rat) / 8578069) [(2, 1), (10, 2), (15, 2)],
  term ((822900664 : Rat) / 8578069) [(2, 1), (11, 2), (15, 2)],
  term ((-822900664 : Rat) / 8578069) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0019
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0020 : Poly :=
[
  term ((-24046165200 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 20 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0020 : Poly :=
[
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1)],
  term ((-48092330400 : Rat) / 150171761) [(5, 1), (9, 1), (11, 2)],
  term ((24046165200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)],
  term ((-24046165200 : Rat) / 150171761) [(9, 1), (11, 1)],
  term ((24046165200 : Rat) / 150171761) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0020
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0021 : Poly :=
[
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 21 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0021 : Poly :=
[
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (9, 1), (11, 3), (15, 1)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(9, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0021
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0022 : Poly :=
[
  term ((-624404148 : Rat) / 8578069) [(9, 1), (15, 1)]
]

/-- Partial product 22 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0022 : Poly :=
[
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((624404148 : Rat) / 8578069) [(9, 1), (10, 2), (15, 1)],
  term ((624404148 : Rat) / 8578069) [(9, 1), (11, 2), (15, 1)],
  term ((-624404148 : Rat) / 8578069) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0022
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0023 : Poly :=
[
  term ((-73350826800 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 23 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0023 : Poly :=
[
  term ((146701653600 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(4, 1), (10, 2), (11, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)],
  term ((73350826800 : Rat) / 150171761) [(10, 1), (11, 3), (15, 1)],
  term ((73350826800 : Rat) / 150171761) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0023
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0024 : Poly :=
[
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 24 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0024 : Poly :=
[
  term ((7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (10, 2), (11, 2), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 3), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(10, 1), (11, 4), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(10, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0024
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0025 : Poly :=
[
  term ((-411450332 : Rat) / 8578069) [(10, 1), (15, 2)]
]

/-- Partial product 25 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0025 : Poly :=
[
  term ((822900664 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)],
  term ((-822900664 : Rat) / 8578069) [(4, 1), (10, 2), (15, 2)],
  term ((-822900664 : Rat) / 8578069) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((411450332 : Rat) / 8578069) [(10, 1), (11, 2), (15, 2)],
  term ((-411450332 : Rat) / 8578069) [(10, 1), (15, 2)],
  term ((411450332 : Rat) / 8578069) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0025
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0026 : Poly :=
[
  term ((57798300455903278 : Rat) / 75775513394677) [(11, 1), (15, 1)]
]

/-- Partial product 26 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0026 : Poly :=
[
  term ((115596600911806556 : Rat) / 75775513394677) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-115596600911806556 : Rat) / 75775513394677) [(4, 1), (11, 1), (15, 1)],
  term ((115596600911806556 : Rat) / 75775513394677) [(5, 1), (11, 2), (15, 1)],
  term ((-57798300455903278 : Rat) / 75775513394677) [(10, 2), (11, 1), (15, 1)],
  term ((57798300455903278 : Rat) / 75775513394677) [(11, 1), (15, 1)],
  term ((-57798300455903278 : Rat) / 75775513394677) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0026
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0027 : Poly :=
[
  term ((36675413400 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 27 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0027 : Poly :=
[
  term ((73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2)],
  term ((-73350826800 : Rat) / 150171761) [(4, 1), (11, 2)],
  term ((73350826800 : Rat) / 150171761) [(5, 1), (11, 3)],
  term ((-36675413400 : Rat) / 150171761) [(10, 2), (11, 2)],
  term ((36675413400 : Rat) / 150171761) [(11, 2)],
  term ((-36675413400 : Rat) / 150171761) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0027
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0028 : Poly :=
[
  term ((5328160751731440 : Rat) / 1284330735503) [(11, 2), (15, 2)]
]

/-- Partial product 28 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0028 : Poly :=
[
  term ((10656321503462880 : Rat) / 1284330735503) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-10656321503462880 : Rat) / 1284330735503) [(4, 1), (11, 2), (15, 2)],
  term ((10656321503462880 : Rat) / 1284330735503) [(5, 1), (11, 3), (15, 2)],
  term ((-5328160751731440 : Rat) / 1284330735503) [(10, 2), (11, 2), (15, 2)],
  term ((5328160751731440 : Rat) / 1284330735503) [(11, 2), (15, 2)],
  term ((-5328160751731440 : Rat) / 1284330735503) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0028
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0029 : Poly :=
[
  term ((3533322090916748535 : Rat) / 2576367455419018) [(11, 3), (15, 1)]
]

/-- Partial product 29 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0029 : Poly :=
[
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (11, 4), (15, 1)],
  term ((-3533322090916748535 : Rat) / 2576367455419018) [(10, 2), (11, 3), (15, 1)],
  term ((3533322090916748535 : Rat) / 2576367455419018) [(11, 3), (15, 1)],
  term ((-3533322090916748535 : Rat) / 2576367455419018) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0029
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 14. -/
def rs_R013_ueqv_R013YNNN_coefficient_14_0030 : Poly :=
[
  term ((2967376 : Rat) / 145391) [(15, 2)]
]

/-- Partial product 30 for generator 14. -/
def rs_R013_ueqv_R013YNNN_partial_14_0030 : Poly :=
[
  term ((5934752 : Rat) / 145391) [(4, 1), (10, 1), (15, 2)],
  term ((-5934752 : Rat) / 145391) [(4, 1), (15, 2)],
  term ((5934752 : Rat) / 145391) [(5, 1), (11, 1), (15, 2)],
  term ((-2967376 : Rat) / 145391) [(10, 2), (15, 2)],
  term ((-2967376 : Rat) / 145391) [(11, 2), (15, 2)],
  term ((2967376 : Rat) / 145391) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 14. -/
theorem rs_R013_ueqv_R013YNNN_partial_14_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_14_0030
        rs_R013_ueqv_R013YNNN_generator_14_0000_0030 =
      rs_R013_ueqv_R013YNNN_partial_14_0030 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_14_0000_0030 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_14_0000,
  rs_R013_ueqv_R013YNNN_partial_14_0001,
  rs_R013_ueqv_R013YNNN_partial_14_0002,
  rs_R013_ueqv_R013YNNN_partial_14_0003,
  rs_R013_ueqv_R013YNNN_partial_14_0004,
  rs_R013_ueqv_R013YNNN_partial_14_0005,
  rs_R013_ueqv_R013YNNN_partial_14_0006,
  rs_R013_ueqv_R013YNNN_partial_14_0007,
  rs_R013_ueqv_R013YNNN_partial_14_0008,
  rs_R013_ueqv_R013YNNN_partial_14_0009,
  rs_R013_ueqv_R013YNNN_partial_14_0010,
  rs_R013_ueqv_R013YNNN_partial_14_0011,
  rs_R013_ueqv_R013YNNN_partial_14_0012,
  rs_R013_ueqv_R013YNNN_partial_14_0013,
  rs_R013_ueqv_R013YNNN_partial_14_0014,
  rs_R013_ueqv_R013YNNN_partial_14_0015,
  rs_R013_ueqv_R013YNNN_partial_14_0016,
  rs_R013_ueqv_R013YNNN_partial_14_0017,
  rs_R013_ueqv_R013YNNN_partial_14_0018,
  rs_R013_ueqv_R013YNNN_partial_14_0019,
  rs_R013_ueqv_R013YNNN_partial_14_0020,
  rs_R013_ueqv_R013YNNN_partial_14_0021,
  rs_R013_ueqv_R013YNNN_partial_14_0022,
  rs_R013_ueqv_R013YNNN_partial_14_0023,
  rs_R013_ueqv_R013YNNN_partial_14_0024,
  rs_R013_ueqv_R013YNNN_partial_14_0025,
  rs_R013_ueqv_R013YNNN_partial_14_0026,
  rs_R013_ueqv_R013YNNN_partial_14_0027,
  rs_R013_ueqv_R013YNNN_partial_14_0028,
  rs_R013_ueqv_R013YNNN_partial_14_0029,
  rs_R013_ueqv_R013YNNN_partial_14_0030
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_14_0000_0030 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((23119823394459280 : Rat) / 75775513394677) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-46986600000 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 2)],
  term ((314447304334175630 : Rat) / 75775513394677) [(0, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((27692531816 : Rat) / 25734207) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-23119823394459280 : Rat) / 75775513394677) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((46986600000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2)],
  term ((-314447304334175630 : Rat) / 75775513394677) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (15, 1)],
  term ((-27692531816 : Rat) / 25734207) [(0, 1), (4, 1), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (9, 1), (11, 3), (15, 1)],
  term ((27692531816 : Rat) / 25734207) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((23119823394459280 : Rat) / 75775513394677) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-46986600000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 3)],
  term ((314447304334175630 : Rat) / 75775513394677) [(0, 1), (5, 1), (11, 3), (15, 2)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 4), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1)],
  term ((-781779923765224176 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(0, 1), (9, 1), (11, 3)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 4), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(0, 1), (9, 1), (15, 1)],
  term ((-11559911697229640 : Rat) / 75775513394677) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((23493300000 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2)],
  term ((-157223652167087815 : Rat) / 75775513394677) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (15, 1)],
  term ((-13846265908 : Rat) / 25734207) [(0, 1), (10, 2), (15, 2)],
  term ((11559911697229640 : Rat) / 75775513394677) [(0, 1), (11, 1), (15, 1)],
  term ((-23493300000 : Rat) / 150171761) [(0, 1), (11, 2)],
  term ((349358125049579681 : Rat) / 227326540184031) [(0, 1), (11, 2), (15, 2)],
  term ((-1328194847980770130 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 1)],
  term ((23493300000 : Rat) / 150171761) [(0, 1), (11, 4)],
  term ((-157223652167087815 : Rat) / 75775513394677) [(0, 1), (11, 4), (15, 2)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(0, 1), (11, 5), (15, 1)],
  term ((13846265908 : Rat) / 25734207) [(0, 1), (15, 2)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1)],
  term ((-293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 2)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 3), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (2, 1), (10, 2), (11, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 2), (11, 2), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)],
  term ((6943067739992547766 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 3)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 4), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(1, 1), (2, 1), (15, 1)],
  term ((-262720955600 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-12655314147982286345 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((-24897841132 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((46986600000 : Rat) / 150171761) [(1, 1), (4, 1), (10, 2), (11, 1)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 2), (11, 2), (15, 1)],
  term ((3721737040 : Rat) / 8578069) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((215734355600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)],
  term ((10391961449726553845 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((13732630012 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)],
  term ((3721737040 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((46986600000 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 2)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 3), (15, 1)],
  term ((-13732630012 : Rat) / 25734207) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-215734355600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2)],
  term ((-10391961449726553845 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((23493300000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)],
  term ((852226446490002530 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-23493300000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3)],
  term ((-1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((1860868520 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)],
  term ((107867177800 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1)],
  term ((10391961449726553845 : Rat) / 2576367455419018) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((6866315006 : Rat) / 25734207) [(1, 1), (10, 2), (15, 1)],
  term ((-23493300000 : Rat) / 150171761) [(1, 1), (10, 3), (11, 1)],
  term ((-1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (10, 3), (11, 2), (15, 1)],
  term ((-1860868520 : Rat) / 8578069) [(1, 1), (10, 3), (15, 1)],
  term ((-107867177800 : Rat) / 150171761) [(1, 1), (11, 1)],
  term ((-29113631117116170403 : Rat) / 7729102366257054) [(1, 1), (11, 2), (15, 1)],
  term ((107867177800 : Rat) / 150171761) [(1, 1), (11, 3)],
  term ((10391961449726553845 : Rat) / 2576367455419018) [(1, 1), (11, 4), (15, 1)],
  term ((-6866315006 : Rat) / 25734207) [(1, 1), (15, 1)],
  term ((-293403307200 : Rat) / 150171761) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(2, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1645801328 : Rat) / 8578069) [(2, 1), (4, 1), (10, 1), (15, 2)],
  term ((293403307200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)],
  term ((1645801328 : Rat) / 8578069) [(2, 1), (4, 1), (15, 2)],
  term ((-1645801328 : Rat) / 8578069) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-293403307200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 3), (15, 2)],
  term ((146701653600 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (15, 2)],
  term ((822900664 : Rat) / 8578069) [(2, 1), (10, 2), (15, 2)],
  term ((-146701653600 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)],
  term ((-6943067739992547766 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)],
  term ((146701653600 : Rat) / 150171761) [(2, 1), (11, 3), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(2, 1), (11, 4), (15, 2)],
  term ((-822900664 : Rat) / 8578069) [(2, 1), (15, 2)],
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (15, 1)],
  term ((3223559122495609852 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2)],
  term ((17754934649806765710 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (15, 1)],
  term ((1173051032 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)],
  term ((-146701653600 : Rat) / 150171761) [(4, 1), (10, 2), (11, 1), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (10, 2), (11, 2), (15, 2)],
  term ((-822900664 : Rat) / 8578069) [(4, 1), (10, 2), (15, 2)],
  term ((-115596600911806556 : Rat) / 75775513394677) [(4, 1), (11, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(4, 1), (11, 2)],
  term ((-10656321503462880 : Rat) / 1284330735503) [(4, 1), (11, 2), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)],
  term ((-5934752 : Rat) / 145391) [(4, 1), (15, 2)],
  term ((-1248808296 : Rat) / 8578069) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-48092330400 : Rat) / 150171761) [(5, 1), (9, 1), (11, 2)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (9, 1), (11, 3), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-146701653600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 3), (15, 2)],
  term ((5934752 : Rat) / 145391) [(5, 1), (11, 1), (15, 2)],
  term ((115596600911806556 : Rat) / 75775513394677) [(5, 1), (11, 2), (15, 1)],
  term ((73350826800 : Rat) / 150171761) [(5, 1), (11, 3)],
  term ((10656321503462880 : Rat) / 1284330735503) [(5, 1), (11, 3), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(5, 1), (11, 4), (15, 1)],
  term ((24046165200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((624404148 : Rat) / 8578069) [(9, 1), (10, 2), (15, 1)],
  term ((-24046165200 : Rat) / 150171761) [(9, 1), (11, 1)],
  term ((-1064540091536457237 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)],
  term ((24046165200 : Rat) / 150171761) [(9, 1), (11, 3)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(9, 1), (11, 4), (15, 1)],
  term ((-624404148 : Rat) / 8578069) [(9, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)],
  term ((-3471533869996273883 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)],
  term ((73350826800 : Rat) / 150171761) [(10, 1), (11, 3), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(10, 1), (11, 4), (15, 2)],
  term ((-411450332 : Rat) / 8578069) [(10, 1), (15, 2)],
  term ((-57798300455903278 : Rat) / 75775513394677) [(10, 2), (11, 1), (15, 1)],
  term ((-36675413400 : Rat) / 150171761) [(10, 2), (11, 2)],
  term ((-5328160751731440 : Rat) / 1284330735503) [(10, 2), (11, 2), (15, 2)],
  term ((-3533322090916748535 : Rat) / 2576367455419018) [(10, 2), (11, 3), (15, 1)],
  term ((-2967376 : Rat) / 145391) [(10, 2), (15, 2)],
  term ((73350826800 : Rat) / 150171761) [(10, 3), (11, 1), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(10, 3), (11, 2), (15, 2)],
  term ((411450332 : Rat) / 8578069) [(10, 3), (15, 2)],
  term ((57798300455903278 : Rat) / 75775513394677) [(11, 1), (15, 1)],
  term ((36675413400 : Rat) / 150171761) [(11, 2)],
  term ((5301948041174432 : Rat) / 1284330735503) [(11, 2), (15, 2)],
  term ((1568179875416037083 : Rat) / 2576367455419018) [(11, 3), (15, 1)],
  term ((-36675413400 : Rat) / 150171761) [(11, 4)],
  term ((-5328160751731440 : Rat) / 1284330735503) [(11, 4), (15, 2)],
  term ((-3533322090916748535 : Rat) / 2576367455419018) [(11, 5), (15, 1)],
  term ((2967376 : Rat) / 145391) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 30. -/
theorem rs_R013_ueqv_R013YNNN_block_14_0000_0030_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_14_0000_0030
      rs_R013_ueqv_R013YNNN_block_14_0000_0030 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
