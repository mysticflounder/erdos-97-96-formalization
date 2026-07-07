/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 10:0-73

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_10_0000_0073 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0000 : Poly :=
[
  term ((61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 0 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0000 : Poly :=
[
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (4, 2), (11, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0000
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0001 : Poly :=
[
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0001 : Poly :=
[
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 2), (11, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0001
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0002 : Poly :=
[
  term ((1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 2 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0002 : Poly :=
[
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0002
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0003 : Poly :=
[
  term ((-1956187600 : Rat) / 6529207) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 3 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0003 : Poly :=
[
  term ((-3912375200 : Rat) / 6529207) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((1956187600 : Rat) / 6529207) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((1956187600 : Rat) / 6529207) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((-3912375200 : Rat) / 6529207) [(0, 1), (3, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0003
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0004 : Poly :=
[
  term ((-94229897093094745 : Rat) / 56007988161283) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 4 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0004 : Poly :=
[
  term ((-188459794186189490 : Rat) / 56007988161283) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((94229897093094745 : Rat) / 56007988161283) [(0, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((94229897093094745 : Rat) / 56007988161283) [(0, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-188459794186189490 : Rat) / 56007988161283) [(0, 1), (3, 2), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0004
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0005 : Poly :=
[
  term ((-9683458516 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 5 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0005 : Poly :=
[
  term ((-19366917032 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((9683458516 : Rat) / 25734207) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((9683458516 : Rat) / 25734207) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((-19366917032 : Rat) / 25734207) [(0, 1), (3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0005
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0006 : Poly :=
[
  term ((19009724800 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 6 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0006 : Poly :=
[
  term ((38019449600 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(0, 1), (4, 2), (5, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(0, 1), (5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0006
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0007 : Poly :=
[
  term ((915701751545736760 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 7 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0007 : Poly :=
[
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(0, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(0, 1), (5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0007
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0008 : Poly :=
[
  term ((3156045536 : Rat) / 25734207) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 8 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0008 : Poly :=
[
  term ((6312091072 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(0, 1), (4, 2), (5, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(0, 1), (5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0008
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0009 : Poly :=
[
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 9 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0009 : Poly :=
[
  term ((-76038899200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-76038899200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0009
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0010 : Poly :=
[
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 10 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0010 : Poly :=
[
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 2), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (5, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0010
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0011 : Poly :=
[
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 11 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0011 : Poly :=
[
  term ((-12624182144 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0011
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0012 : Poly :=
[
  term ((-21076676000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 12 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0012 : Poly :=
[
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((21076676000 : Rat) / 150171761) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((21076676000 : Rat) / 150171761) [(0, 1), (5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0012
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0013 : Poly :=
[
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 13 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0013 : Poly :=
[
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (5, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0013
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0014 : Poly :=
[
  term ((-1848197080 : Rat) / 25734207) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 14 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0014 : Poly :=
[
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 1), (5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0014
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0015 : Poly :=
[
  term ((87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 15 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0015 : Poly :=
[
  term ((175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (5, 2), (11, 1)],
  term ((175656368800 : Rat) / 150171761) [(1, 1), (2, 2), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0015
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0016 : Poly :=
[
  term ((4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 16 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0016 : Poly :=
[
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 2), (11, 2), (15, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 2), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0016
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0017 : Poly :=
[
  term ((8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 17 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0017 : Poly :=
[
  term ((16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(1, 1), (2, 2), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0017
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0018 : Poly :=
[
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 18 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0018 : Poly :=
[
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((19009724800 : Rat) / 150171761) [(1, 1), (4, 1), (5, 2), (11, 1)],
  term ((19009724800 : Rat) / 150171761) [(1, 1), (4, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0018
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0019 : Poly :=
[
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 19 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0019 : Poly :=
[
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0019
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0020 : Poly :=
[
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 20 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0020 : Poly :=
[
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(1, 1), (4, 1), (5, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(1, 1), (4, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0020
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0021 : Poly :=
[
  term ((-89895135600 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 21 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0021 : Poly :=
[
  term ((-179790271200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-179790271200 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((89895135600 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1)],
  term ((89895135600 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0021
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0022 : Poly :=
[
  term ((-39953238400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 22 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0022 : Poly :=
[
  term ((-79906476800 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((-79906476800 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((39953238400 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((39953238400 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0022
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0023 : Poly :=
[
  term ((-1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 23 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0023 : Poly :=
[
  term ((-3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0023
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0024 : Poly :=
[
  term ((-4330264324729283595 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 24 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0024 : Poly :=
[
  term ((-8660528649458567190 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((-8660528649458567190 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((4330264324729283595 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((4330264324729283595 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0024
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0025 : Poly :=
[
  term ((-3618965408 : Rat) / 25734207) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 25 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0025 : Poly :=
[
  term ((-7237930816 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-7237930816 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((3618965408 : Rat) / 25734207) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((3618965408 : Rat) / 25734207) [(1, 1), (5, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0025
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0026 : Poly :=
[
  term ((-2292126604 : Rat) / 8578069) [(1, 1), (15, 1)]
]

/-- Partial product 26 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0026 : Poly :=
[
  term ((-4584253208 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-4584253208 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((2292126604 : Rat) / 8578069) [(1, 1), (4, 2), (15, 1)],
  term ((2292126604 : Rat) / 8578069) [(1, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0026
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0027 : Poly :=
[
  term ((5544277600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 27 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0027 : Poly :=
[
  term ((11088555200 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((-5544277600 : Rat) / 150171761) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((-5544277600 : Rat) / 150171761) [(2, 1), (5, 3), (11, 1)],
  term ((11088555200 : Rat) / 150171761) [(2, 2), (4, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0027
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0028 : Poly :=
[
  term ((267068816765605870 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 28 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0028 : Poly :=
[
  term ((534137633531211740 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-267068816765605870 : Rat) / 1288183727709509) [(2, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-267068816765605870 : Rat) / 1288183727709509) [(2, 1), (5, 3), (11, 2), (15, 1)],
  term ((534137633531211740 : Rat) / 1288183727709509) [(2, 2), (4, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0028
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0029 : Poly :=
[
  term ((-13675682008 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 29 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0029 : Poly :=
[
  term ((-27351364016 : Rat) / 25734207) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((13675682008 : Rat) / 25734207) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((13675682008 : Rat) / 25734207) [(2, 1), (5, 3), (15, 1)],
  term ((-27351364016 : Rat) / 25734207) [(2, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0029
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0030 : Poly :=
[
  term ((11174816000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 30 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0030 : Poly :=
[
  term ((22349632000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-11174816000 : Rat) / 150171761) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((-11174816000 : Rat) / 150171761) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((22349632000 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0030
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0031 : Poly :=
[
  term ((538292831277669200 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 31 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0031 : Poly :=
[
  term ((1076585662555338400 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-538292831277669200 : Rat) / 1288183727709509) [(2, 1), (4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-538292831277669200 : Rat) / 1288183727709509) [(2, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((1076585662555338400 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0031
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0032 : Poly :=
[
  term ((9560340160 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 32 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0032 : Poly :=
[
  term ((19120680320 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-9560340160 : Rat) / 25734207) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((-9560340160 : Rat) / 25734207) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((19120680320 : Rat) / 25734207) [(2, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0032
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0033 : Poly :=
[
  term ((237491371600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 33 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0033 : Poly :=
[
  term ((474982743200 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-237491371600 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((-237491371600 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (13, 1)],
  term ((474982743200 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0033
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0034 : Poly :=
[
  term ((-12215363200 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 34 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0034 : Poly :=
[
  term ((-24430726400 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((12215363200 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((12215363200 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-24430726400 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0034
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0035 : Poly :=
[
  term ((11440000696439300545 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 35 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0035 : Poly :=
[
  term ((22880001392878601090 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-11440000696439300545 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-11440000696439300545 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (13, 1), (15, 1)],
  term ((22880001392878601090 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0035
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0036 : Poly :=
[
  term ((-588416170969888840 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 36 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0036 : Poly :=
[
  term ((-1176832341939777680 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((588416170969888840 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (15, 2)],
  term ((588416170969888840 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (15, 2)],
  term ((-1176832341939777680 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0036
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0037 : Poly :=
[
  term ((78171421772 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 37 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0037 : Poly :=
[
  term ((156342843544 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-78171421772 : Rat) / 25734207) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((-78171421772 : Rat) / 25734207) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((156342843544 : Rat) / 25734207) [(2, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0037
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0038 : Poly :=
[
  term ((6011852896 : Rat) / 25734207) [(2, 1), (15, 2)]
]

/-- Partial product 38 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0038 : Poly :=
[
  term ((12023705792 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((-6011852896 : Rat) / 25734207) [(2, 1), (4, 2), (15, 2)],
  term ((-6011852896 : Rat) / 25734207) [(2, 1), (5, 2), (15, 2)],
  term ((12023705792 : Rat) / 25734207) [(2, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0038
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0039 : Poly :=
[
  term ((-5544277600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 39 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0039 : Poly :=
[
  term ((-11088555200 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((5544277600 : Rat) / 150171761) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((5544277600 : Rat) / 150171761) [(3, 1), (4, 3), (11, 1)],
  term ((-11088555200 : Rat) / 150171761) [(3, 2), (4, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0039
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0040 : Poly :=
[
  term ((-267068816765605870 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 40 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0040 : Poly :=
[
  term ((-534137633531211740 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((267068816765605870 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((267068816765605870 : Rat) / 1288183727709509) [(3, 1), (4, 3), (11, 2), (15, 1)],
  term ((-534137633531211740 : Rat) / 1288183727709509) [(3, 2), (4, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0040
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0041 : Poly :=
[
  term ((13675682008 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 41 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0041 : Poly :=
[
  term ((27351364016 : Rat) / 25734207) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((-13675682008 : Rat) / 25734207) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((-13675682008 : Rat) / 25734207) [(3, 1), (4, 3), (15, 1)],
  term ((27351364016 : Rat) / 25734207) [(3, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0041
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0042 : Poly :=
[
  term ((520273600 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 42 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0042 : Poly :=
[
  term ((1040547200 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-520273600 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((-520273600 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)],
  term ((1040547200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0042
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0043 : Poly :=
[
  term ((119691878800 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 43 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0043 : Poly :=
[
  term ((239383757600 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-119691878800 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((-119691878800 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((239383757600 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0043
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0044 : Poly :=
[
  term ((5765578629679059685 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 44 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0044 : Poly :=
[
  term ((11531157259358119370 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5765578629679059685 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((-5765578629679059685 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((11531157259358119370 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0044
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0045 : Poly :=
[
  term ((25061669846109820 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 45 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0045 : Poly :=
[
  term ((50123339692219640 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-25061669846109820 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-25061669846109820 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((50123339692219640 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0045
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0046 : Poly :=
[
  term ((23810628476 : Rat) / 25734207) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 46 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0046 : Poly :=
[
  term ((47621256952 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-23810628476 : Rat) / 25734207) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-23810628476 : Rat) / 25734207) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((47621256952 : Rat) / 25734207) [(3, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0046
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0047 : Poly :=
[
  term ((-7786096528 : Rat) / 25734207) [(3, 1), (15, 1)]
]

/-- Partial product 47 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0047 : Poly :=
[
  term ((-15572193056 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((7786096528 : Rat) / 25734207) [(3, 1), (4, 2), (15, 1)],
  term ((7786096528 : Rat) / 25734207) [(3, 1), (5, 2), (15, 1)],
  term ((-15572193056 : Rat) / 25734207) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0047
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0048 : Poly :=
[
  term ((19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 48 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0048 : Poly :=
[
  term ((38019449600 : Rat) / 150171761) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (5, 2), (7, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(4, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0048
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0049 : Poly :=
[
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 49 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0049 : Poly :=
[
  term ((1831403503091473520 : Rat) / 1288183727709509) [(2, 1), (4, 2), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 3), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0049
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0050 : Poly :=
[
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 50 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0050 : Poly :=
[
  term ((6312091072 : Rat) / 25734207) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (5, 2), (7, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(4, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0050
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0051 : Poly :=
[
  term ((-16586553600 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 51 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0051 : Poly :=
[
  term ((-33173107200 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-33173107200 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)],
  term ((16586553600 : Rat) / 150171761) [(4, 2), (5, 1), (11, 1)],
  term ((16586553600 : Rat) / 150171761) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0051
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0052 : Poly :=
[
  term ((-798977173179658320 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 52 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0052 : Poly :=
[
  term ((-1597954346359316640 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-1597954346359316640 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((798977173179658320 : Rat) / 1288183727709509) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((798977173179658320 : Rat) / 1288183727709509) [(5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0052
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0053 : Poly :=
[
  term ((3801144736 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 53 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0053 : Poly :=
[
  term ((7602289472 : Rat) / 8578069) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((7602289472 : Rat) / 8578069) [(3, 1), (5, 2), (15, 1)],
  term ((-3801144736 : Rat) / 8578069) [(4, 2), (5, 1), (15, 1)],
  term ((-3801144736 : Rat) / 8578069) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0053
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0054 : Poly :=
[
  term ((-29485989200 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 54 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0054 : Poly :=
[
  term ((-58971978400 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-58971978400 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((29485989200 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)],
  term ((29485989200 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0054
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0055 : Poly :=
[
  term ((16076222400 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 55 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0055 : Poly :=
[
  term ((32152444800 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((32152444800 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((-16076222400 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-16076222400 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0055
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0056 : Poly :=
[
  term ((774394430471650380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 56 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0056 : Poly :=
[
  term ((1548788860943300760 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((1548788860943300760 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0056
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0057 : Poly :=
[
  term ((-1420345230694695665 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 57 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0057 : Poly :=
[
  term ((-2840690461389391330 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-2840690461389391330 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((1420345230694695665 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((1420345230694695665 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0057
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0058 : Poly :=
[
  term ((1749490416 : Rat) / 8578069) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 58 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0058 : Poly :=
[
  term ((3498980832 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((3498980832 : Rat) / 8578069) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(5, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0058
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0059 : Poly :=
[
  term ((-12378590284 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 59 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0059 : Poly :=
[
  term ((-24757180568 : Rat) / 25734207) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-24757180568 : Rat) / 25734207) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((12378590284 : Rat) / 25734207) [(4, 2), (7, 1), (15, 1)],
  term ((12378590284 : Rat) / 25734207) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0059
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0060 : Poly :=
[
  term ((-51365310000 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 60 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0060 : Poly :=
[
  term ((-102730620000 : Rat) / 150171761) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-102730620000 : Rat) / 150171761) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((51365310000 : Rat) / 150171761) [(4, 2), (9, 1), (11, 1)],
  term ((51365310000 : Rat) / 150171761) [(5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0060_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0060
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0061 : Poly :=
[
  term ((-2474275920906006375 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 61 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0061 : Poly :=
[
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(2, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(5, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0061_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0061
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0062 : Poly :=
[
  term ((-323357500 : Rat) / 8578069) [(9, 1), (15, 1)]
]

/-- Partial product 62 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0062 : Poly :=
[
  term ((-646715000 : Rat) / 8578069) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(4, 2), (9, 1), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0062_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0062
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0063 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 63 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0063 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(5, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0063_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0063
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0064 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 64 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0064 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(2, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(4, 2), (10, 1), (11, 2), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(5, 2), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0064_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0064
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0065 : Poly :=
[
  term ((860779296 : Rat) / 8578069) [(10, 1), (15, 2)]
]

/-- Partial product 65 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0065 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(2, 1), (4, 1), (10, 1), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(4, 2), (10, 1), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(5, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0065_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0065
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0066 : Poly :=
[
  term ((-76376138800 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 66 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0066 : Poly :=
[
  term ((-152752277600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-152752277600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((76376138800 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((76376138800 : Rat) / 150171761) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0066_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0066
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0067 : Poly :=
[
  term ((175732841255574528 : Rat) / 1288183727709509) [(11, 1), (15, 1)]
]

/-- Partial product 67 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0067 : Poly :=
[
  term ((351465682511149056 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((351465682511149056 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-175732841255574528 : Rat) / 1288183727709509) [(4, 2), (11, 1), (15, 1)],
  term ((-175732841255574528 : Rat) / 1288183727709509) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0067_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0067
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0068 : Poly :=
[
  term ((-6773020800 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 68 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0068 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 2)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 2)],
  term ((6773020800 : Rat) / 150171761) [(4, 2), (11, 2)],
  term ((6773020800 : Rat) / 150171761) [(5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0068_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0068
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0069 : Poly :=
[
  term ((-3679051896398852935 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 69 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0069 : Poly :=
[
  term ((-7358103792797705870 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-7358103792797705870 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((3679051896398852935 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((3679051896398852935 : Rat) / 1288183727709509) [(5, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0069_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0069
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0070 : Poly :=
[
  term ((623885045447538495 : Rat) / 1288183727709509) [(11, 2), (15, 2)]
]

/-- Partial product 70 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0070 : Poly :=
[
  term ((1247770090895076990 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)],
  term ((1247770090895076990 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-623885045447538495 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)],
  term ((-623885045447538495 : Rat) / 1288183727709509) [(5, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0070_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0070
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0071 : Poly :=
[
  term ((-326257590526281960 : Rat) / 1288183727709509) [(11, 3), (15, 1)]
]

/-- Partial product 71 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0071 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 3), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 3), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(4, 2), (11, 3), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(5, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0071_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0071
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0072 : Poly :=
[
  term ((-30690016436 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 72 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0072 : Poly :=
[
  term ((-61380032872 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-61380032872 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((30690016436 : Rat) / 25734207) [(4, 2), (13, 1), (15, 1)],
  term ((30690016436 : Rat) / 25734207) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0072_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0072
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 10. -/
def rs_R013_ueqv_R013YNNN_coefficient_10_0073 : Poly :=
[
  term ((-3607712196 : Rat) / 8578069) [(15, 2)]
]

/-- Partial product 73 for generator 10. -/
def rs_R013_ueqv_R013YNNN_partial_10_0073 : Poly :=
[
  term ((-7215424392 : Rat) / 8578069) [(2, 1), (4, 1), (15, 2)],
  term ((-7215424392 : Rat) / 8578069) [(3, 1), (5, 1), (15, 2)],
  term ((3607712196 : Rat) / 8578069) [(4, 2), (15, 2)],
  term ((3607712196 : Rat) / 8578069) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 10. -/
theorem rs_R013_ueqv_R013YNNN_partial_10_0073_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_10_0073
        rs_R013_ueqv_R013YNNN_generator_10_0000_0073 =
      rs_R013_ueqv_R013YNNN_partial_10_0073 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_10_0000_0073 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_10_0000,
  rs_R013_ueqv_R013YNNN_partial_10_0001,
  rs_R013_ueqv_R013YNNN_partial_10_0002,
  rs_R013_ueqv_R013YNNN_partial_10_0003,
  rs_R013_ueqv_R013YNNN_partial_10_0004,
  rs_R013_ueqv_R013YNNN_partial_10_0005,
  rs_R013_ueqv_R013YNNN_partial_10_0006,
  rs_R013_ueqv_R013YNNN_partial_10_0007,
  rs_R013_ueqv_R013YNNN_partial_10_0008,
  rs_R013_ueqv_R013YNNN_partial_10_0009,
  rs_R013_ueqv_R013YNNN_partial_10_0010,
  rs_R013_ueqv_R013YNNN_partial_10_0011,
  rs_R013_ueqv_R013YNNN_partial_10_0012,
  rs_R013_ueqv_R013YNNN_partial_10_0013,
  rs_R013_ueqv_R013YNNN_partial_10_0014,
  rs_R013_ueqv_R013YNNN_partial_10_0015,
  rs_R013_ueqv_R013YNNN_partial_10_0016,
  rs_R013_ueqv_R013YNNN_partial_10_0017,
  rs_R013_ueqv_R013YNNN_partial_10_0018,
  rs_R013_ueqv_R013YNNN_partial_10_0019,
  rs_R013_ueqv_R013YNNN_partial_10_0020,
  rs_R013_ueqv_R013YNNN_partial_10_0021,
  rs_R013_ueqv_R013YNNN_partial_10_0022,
  rs_R013_ueqv_R013YNNN_partial_10_0023,
  rs_R013_ueqv_R013YNNN_partial_10_0024,
  rs_R013_ueqv_R013YNNN_partial_10_0025,
  rs_R013_ueqv_R013YNNN_partial_10_0026,
  rs_R013_ueqv_R013YNNN_partial_10_0027,
  rs_R013_ueqv_R013YNNN_partial_10_0028,
  rs_R013_ueqv_R013YNNN_partial_10_0029,
  rs_R013_ueqv_R013YNNN_partial_10_0030,
  rs_R013_ueqv_R013YNNN_partial_10_0031,
  rs_R013_ueqv_R013YNNN_partial_10_0032,
  rs_R013_ueqv_R013YNNN_partial_10_0033,
  rs_R013_ueqv_R013YNNN_partial_10_0034,
  rs_R013_ueqv_R013YNNN_partial_10_0035,
  rs_R013_ueqv_R013YNNN_partial_10_0036,
  rs_R013_ueqv_R013YNNN_partial_10_0037,
  rs_R013_ueqv_R013YNNN_partial_10_0038,
  rs_R013_ueqv_R013YNNN_partial_10_0039,
  rs_R013_ueqv_R013YNNN_partial_10_0040,
  rs_R013_ueqv_R013YNNN_partial_10_0041,
  rs_R013_ueqv_R013YNNN_partial_10_0042,
  rs_R013_ueqv_R013YNNN_partial_10_0043,
  rs_R013_ueqv_R013YNNN_partial_10_0044,
  rs_R013_ueqv_R013YNNN_partial_10_0045,
  rs_R013_ueqv_R013YNNN_partial_10_0046,
  rs_R013_ueqv_R013YNNN_partial_10_0047,
  rs_R013_ueqv_R013YNNN_partial_10_0048,
  rs_R013_ueqv_R013YNNN_partial_10_0049,
  rs_R013_ueqv_R013YNNN_partial_10_0050,
  rs_R013_ueqv_R013YNNN_partial_10_0051,
  rs_R013_ueqv_R013YNNN_partial_10_0052,
  rs_R013_ueqv_R013YNNN_partial_10_0053,
  rs_R013_ueqv_R013YNNN_partial_10_0054,
  rs_R013_ueqv_R013YNNN_partial_10_0055,
  rs_R013_ueqv_R013YNNN_partial_10_0056,
  rs_R013_ueqv_R013YNNN_partial_10_0057,
  rs_R013_ueqv_R013YNNN_partial_10_0058,
  rs_R013_ueqv_R013YNNN_partial_10_0059,
  rs_R013_ueqv_R013YNNN_partial_10_0060,
  rs_R013_ueqv_R013YNNN_partial_10_0061,
  rs_R013_ueqv_R013YNNN_partial_10_0062,
  rs_R013_ueqv_R013YNNN_partial_10_0063,
  rs_R013_ueqv_R013YNNN_partial_10_0064,
  rs_R013_ueqv_R013YNNN_partial_10_0065,
  rs_R013_ueqv_R013YNNN_partial_10_0066,
  rs_R013_ueqv_R013YNNN_partial_10_0067,
  rs_R013_ueqv_R013YNNN_partial_10_0068,
  rs_R013_ueqv_R013YNNN_partial_10_0069,
  rs_R013_ueqv_R013YNNN_partial_10_0070,
  rs_R013_ueqv_R013YNNN_partial_10_0071,
  rs_R013_ueqv_R013YNNN_partial_10_0072,
  rs_R013_ueqv_R013YNNN_partial_10_0073
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_10_0000_0073 : Poly :=
[
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (4, 2), (11, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 2), (11, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (5, 2), (11, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 2), (11, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term ((-3912375200 : Rat) / 6529207) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-188459794186189490 : Rat) / 56007988161283) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-19366917032 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-76038899200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((1956187600 : Rat) / 6529207) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((94229897093094745 : Rat) / 56007988161283) [(0, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((9683458516 : Rat) / 25734207) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((-76038899200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((83011764400 : Rat) / 150171761) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((3998691136232652655 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((15995549588 : Rat) / 25734207) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((-3912375200 : Rat) / 6529207) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((-188459794186189490 : Rat) / 56007988161283) [(0, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-19366917032 : Rat) / 25734207) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(0, 1), (4, 2), (5, 1), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(0, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(0, 1), (4, 2), (5, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 2), (7, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((21076676000 : Rat) / 150171761) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (5, 2), (7, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (5, 2), (7, 1), (15, 1)],
  term ((21076676000 : Rat) / 150171761) [(0, 1), (5, 2), (11, 1), (13, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (5, 2), (11, 2), (13, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(0, 1), (5, 3), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(0, 1), (5, 3), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(0, 1), (5, 3), (15, 1)],
  term ((175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((-179790271200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-79906476800 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((-3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8660528649458567190 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((-7237930816 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-4584253208 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-7402802000 : Rat) / 8833633) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((-356594260520083025 : Rat) / 75775513394677) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((-14496319340 : Rat) / 25734207) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (5, 2), (11, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 2), (11, 2), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((175656368800 : Rat) / 150171761) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 2), (4, 1), (11, 2), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((-179790271200 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-79906476800 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8660528649458567190 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-7237930816 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-4584253208 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(1, 1), (4, 1), (5, 2), (11, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(1, 1), (4, 1), (5, 2), (15, 1)],
  term ((89895135600 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1)],
  term ((39953238400 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((4330264324729283595 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((3618965408 : Rat) / 25734207) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((2292126604 : Rat) / 8578069) [(1, 1), (4, 2), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(1, 1), (4, 3), (11, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 3), (11, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(1, 1), (4, 3), (15, 1)],
  term ((89895135600 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1)],
  term ((39953238400 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((4330264324729283595 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((3618965408 : Rat) / 25734207) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((2292126604 : Rat) / 8578069) [(1, 1), (5, 2), (15, 1)],
  term ((1040547200 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((239383757600 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((11531157259358119370 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((50123339692219640 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((47621256952 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-15572193056 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-11088555200 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((-534137633531211740 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((27351364016 : Rat) / 25734207) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((22349632000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((1076585662555338400 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((19120680320 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((474982743200 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-24430726400 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((22880001392878601090 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1176832341939777680 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((156342843544 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((12023705792 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((11088555200 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((534137633531211740 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-27351364016 : Rat) / 25734207) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((-33173107200 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-1597954346359316640 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((7602289472 : Rat) / 8578069) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-58971978400 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((32152444800 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((1548788860943300760 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2840690461389391330 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((3498980832 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-24757180568 : Rat) / 25734207) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-102730620000 : Rat) / 150171761) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(2, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(2, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(2, 1), (4, 1), (10, 1), (15, 2)],
  term ((-152752277600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((351465682511149056 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 2)],
  term ((-7358103792797705870 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((1247770090895076990 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 3), (15, 1)],
  term ((-61380032872 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-7215424392 : Rat) / 8578069) [(2, 1), (4, 1), (15, 2)],
  term ((-5544277600 : Rat) / 150171761) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((-267068816765605870 : Rat) / 1288183727709509) [(2, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((13675682008 : Rat) / 25734207) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((26844633600 : Rat) / 150171761) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-1082749696 : Rat) / 8578069) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((-237491371600 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((12215363200 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((-11440000696439300545 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((588416170969888840 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (15, 2)],
  term ((-78171421772 : Rat) / 25734207) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((-6011852896 : Rat) / 25734207) [(2, 1), (4, 2), (15, 2)],
  term ((-11174816000 : Rat) / 150171761) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((-538292831277669200 : Rat) / 1288183727709509) [(2, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-9560340160 : Rat) / 25734207) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((-237491371600 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (13, 1)],
  term ((12215363200 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-11440000696439300545 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (13, 1), (15, 1)],
  term ((588416170969888840 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (15, 2)],
  term ((-78171421772 : Rat) / 25734207) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((-6011852896 : Rat) / 25734207) [(2, 1), (5, 2), (15, 2)],
  term ((-5544277600 : Rat) / 150171761) [(2, 1), (5, 3), (11, 1)],
  term ((-267068816765605870 : Rat) / 1288183727709509) [(2, 1), (5, 3), (11, 2), (15, 1)],
  term ((13675682008 : Rat) / 25734207) [(2, 1), (5, 3), (15, 1)],
  term ((11088555200 : Rat) / 150171761) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((534137633531211740 : Rat) / 1288183727709509) [(2, 2), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-27351364016 : Rat) / 25734207) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((22349632000 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((1076585662555338400 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((19120680320 : Rat) / 25734207) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((474982743200 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-24430726400 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((22880001392878601090 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1176832341939777680 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (15, 2)],
  term ((156342843544 : Rat) / 25734207) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((12023705792 : Rat) / 25734207) [(2, 2), (4, 1), (15, 2)],
  term ((38019449600 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((5544277600 : Rat) / 150171761) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((267068816765605870 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((-13675682008 : Rat) / 25734207) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((-520273600 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((-119691878800 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((-5765578629679059685 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((-25061669846109820 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-23810628476 : Rat) / 25734207) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((7786096528 : Rat) / 25734207) [(3, 1), (4, 2), (15, 1)],
  term ((5544277600 : Rat) / 150171761) [(3, 1), (4, 3), (11, 1)],
  term ((267068816765605870 : Rat) / 1288183727709509) [(3, 1), (4, 3), (11, 2), (15, 1)],
  term ((-13675682008 : Rat) / 25734207) [(3, 1), (4, 3), (15, 1)],
  term ((-58971978400 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((32152444800 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((1548788860943300760 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2840690461389391330 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((3498980832 : Rat) / 8578069) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-24757180568 : Rat) / 25734207) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-102730620000 : Rat) / 150171761) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((-152752277600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((351465682511149056 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 2)],
  term ((-7358103792797705870 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((1247770090895076990 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 3), (15, 1)],
  term ((-61380032872 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-7215424392 : Rat) / 8578069) [(3, 1), (5, 1), (15, 2)],
  term ((-1464929600 : Rat) / 6529207) [(3, 1), (5, 2), (11, 1)],
  term ((-119691878800 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((-5765578629679059685 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((-70565913748062020 : Rat) / 56007988161283) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-23810628476 : Rat) / 25734207) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((30592964944 : Rat) / 25734207) [(3, 1), (5, 2), (15, 1)],
  term ((-11088555200 : Rat) / 150171761) [(3, 2), (4, 1), (5, 1), (11, 1)],
  term ((-534137633531211740 : Rat) / 1288183727709509) [(3, 2), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((27351364016 : Rat) / 25734207) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((1040547200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((239383757600 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((11531157259358119370 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((50123339692219640 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((47621256952 : Rat) / 25734207) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-15572193056 : Rat) / 25734207) [(3, 2), (5, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (5, 2), (7, 1), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (5, 2), (7, 1), (15, 1)],
  term ((16586553600 : Rat) / 150171761) [(4, 2), (5, 1), (11, 1)],
  term ((798977173179658320 : Rat) / 1288183727709509) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-3801144736 : Rat) / 8578069) [(4, 2), (5, 1), (15, 1)],
  term ((29485989200 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)],
  term ((-16076222400 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((1420345230694695665 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((12378590284 : Rat) / 25734207) [(4, 2), (7, 1), (15, 1)],
  term ((51365310000 : Rat) / 150171761) [(4, 2), (9, 1), (11, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(4, 2), (9, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(4, 2), (10, 1), (11, 2), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(4, 2), (10, 1), (15, 2)],
  term ((76376138800 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((-175732841255574528 : Rat) / 1288183727709509) [(4, 2), (11, 1), (15, 1)],
  term ((6773020800 : Rat) / 150171761) [(4, 2), (11, 2)],
  term ((3679051896398852935 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-623885045447538495 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(4, 2), (11, 3), (15, 1)],
  term ((30690016436 : Rat) / 25734207) [(4, 2), (13, 1), (15, 1)],
  term ((3607712196 : Rat) / 8578069) [(4, 2), (15, 2)],
  term ((-19009724800 : Rat) / 150171761) [(4, 3), (7, 1), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 3), (7, 1), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(4, 3), (7, 1), (15, 1)],
  term ((29485989200 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1)],
  term ((-16076222400 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((1420345230694695665 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((12378590284 : Rat) / 25734207) [(5, 2), (7, 1), (15, 1)],
  term ((51365310000 : Rat) / 150171761) [(5, 2), (9, 1), (11, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(5, 2), (9, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(5, 2), (10, 1), (11, 2), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(5, 2), (10, 1), (15, 2)],
  term ((76376138800 : Rat) / 150171761) [(5, 2), (11, 1), (13, 1)],
  term ((-175732841255574528 : Rat) / 1288183727709509) [(5, 2), (11, 1), (15, 1)],
  term ((6773020800 : Rat) / 150171761) [(5, 2), (11, 2)],
  term ((3679051896398852935 : Rat) / 1288183727709509) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-623885045447538495 : Rat) / 1288183727709509) [(5, 2), (11, 2), (15, 2)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(5, 2), (11, 3), (15, 1)],
  term ((30690016436 : Rat) / 25734207) [(5, 2), (13, 1), (15, 1)],
  term ((3607712196 : Rat) / 8578069) [(5, 2), (15, 2)],
  term ((16586553600 : Rat) / 150171761) [(5, 3), (11, 1)],
  term ((798977173179658320 : Rat) / 1288183727709509) [(5, 3), (11, 2), (15, 1)],
  term ((-3801144736 : Rat) / 8578069) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 73. -/
theorem rs_R013_ueqv_R013YNNN_block_10_0000_0073_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_10_0000_0073
      rs_R013_ueqv_R013YNNN_block_10_0000_0073 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
