/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 17:0-38

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_17_0000_0038 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0000 : Poly :=
[
  term ((-6109752000 : Rat) / 8833633) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 0 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0000 : Poly :=
[
  term ((-12219504000 : Rat) / 8833633) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((6109752000 : Rat) / 8833633) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((-12219504000 : Rat) / 8833633) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((6109752000 : Rat) / 8833633) [(0, 1), (3, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0000
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0001 : Poly :=
[
  term ((-294307817013219900 : Rat) / 75775513394677) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0001 : Poly :=
[
  term ((-588615634026439800 : Rat) / 75775513394677) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-588615634026439800 : Rat) / 75775513394677) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (3, 1), (5, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0001
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0002 : Poly :=
[
  term ((-1322644080 : Rat) / 8578069) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 2 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0002 : Poly :=
[
  term ((-2645288160 : Rat) / 8578069) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((-2645288160 : Rat) / 8578069) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 1), (3, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0002
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0003 : Poly :=
[
  term ((-19009724800 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 3 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0003 : Poly :=
[
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1)],
  term ((19009724800 : Rat) / 150171761) [(0, 1), (4, 2), (5, 1), (11, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (5, 2), (7, 1), (11, 1)],
  term ((19009724800 : Rat) / 150171761) [(0, 1), (5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0003
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0004 : Poly :=
[
  term ((-915701751545736760 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 4 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0004 : Poly :=
[
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(0, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(0, 1), (5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0004
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0005 : Poly :=
[
  term ((-3156045536 : Rat) / 25734207) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 5 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0005 : Poly :=
[
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(0, 1), (4, 2), (5, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (5, 2), (7, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(0, 1), (5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0005
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0006 : Poly :=
[
  term ((19009724800 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 6 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0006 : Poly :=
[
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (4, 1), (5, 2), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 2), (6, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (4, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0006
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0007 : Poly :=
[
  term ((915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 7 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0007 : Poly :=
[
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 2), (6, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0007
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0008 : Poly :=
[
  term ((3156045536 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 8 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0008 : Poly :=
[
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (4, 1), (5, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 2), (6, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (4, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0008
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0009 : Poly :=
[
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 9 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0009 : Poly :=
[
  term ((-76038899200 : Rat) / 150171761) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1)],
  term ((-76038899200 : Rat) / 150171761) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0009
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0010 : Poly :=
[
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 10 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0010 : Poly :=
[
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(1, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0010
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0011 : Poly :=
[
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (15, 1)]
]

/-- Partial product 11 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0011 : Poly :=
[
  term ((-12624182144 : Rat) / 25734207) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 2), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0011
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0012 : Poly :=
[
  term ((119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 12 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0012 : Poly :=
[
  term ((238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0012
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0013 : Poly :=
[
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 13 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0013 : Poly :=
[
  term ((11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0013
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0014 : Poly :=
[
  term ((2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 14 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0014 : Poly :=
[
  term ((5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0014
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0015 : Poly :=
[
  term ((5587408000 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 15 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0015 : Poly :=
[
  term ((11174816000 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1)],
  term ((-5587408000 : Rat) / 150171761) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((11174816000 : Rat) / 150171761) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((-5587408000 : Rat) / 150171761) [(2, 1), (5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0015
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0016 : Poly :=
[
  term ((269146415638834600 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 16 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0016 : Poly :=
[
  term ((538292831277669200 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-269146415638834600 : Rat) / 1288183727709509) [(2, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((538292831277669200 : Rat) / 1288183727709509) [(2, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-269146415638834600 : Rat) / 1288183727709509) [(2, 1), (5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0016
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0017 : Poly :=
[
  term ((4780170080 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 17 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0017 : Poly :=
[
  term ((9560340160 : Rat) / 25734207) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-4780170080 : Rat) / 25734207) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((9560340160 : Rat) / 25734207) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((-4780170080 : Rat) / 25734207) [(2, 1), (5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0017
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0018 : Poly :=
[
  term ((-5587408000 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 18 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0018 : Poly :=
[
  term ((-11174816000 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((5587408000 : Rat) / 150171761) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((-11174816000 : Rat) / 150171761) [(3, 1), (4, 2), (6, 1), (11, 1)],
  term ((5587408000 : Rat) / 150171761) [(3, 1), (4, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0018
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0019 : Poly :=
[
  term ((-269146415638834600 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 19 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0019 : Poly :=
[
  term ((-538292831277669200 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((269146415638834600 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((-538292831277669200 : Rat) / 1288183727709509) [(3, 1), (4, 2), (6, 1), (11, 2), (15, 1)],
  term ((269146415638834600 : Rat) / 1288183727709509) [(3, 1), (4, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0019
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0020 : Poly :=
[
  term ((-4780170080 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 20 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0020 : Poly :=
[
  term ((-9560340160 : Rat) / 25734207) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((4780170080 : Rat) / 25734207) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((-9560340160 : Rat) / 25734207) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term ((4780170080 : Rat) / 25734207) [(3, 1), (4, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0020
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0021 : Poly :=
[
  term ((22745337600 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 21 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0021 : Poly :=
[
  term ((45490675200 : Rat) / 150171761) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-22745337600 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((45490675200 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-22745337600 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0021
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0022 : Poly :=
[
  term ((1095646870165059120 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 22 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0022 : Poly :=
[
  term ((2191293740330118240 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((-1095646870165059120 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((2191293740330118240 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1095646870165059120 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0022
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0023 : Poly :=
[
  term ((648758144 : Rat) / 8578069) [(3, 1), (15, 1)]
]

/-- Partial product 23 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0023 : Poly :=
[
  term ((1297516288 : Rat) / 8578069) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-648758144 : Rat) / 8578069) [(3, 1), (4, 2), (15, 1)],
  term ((1297516288 : Rat) / 8578069) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-648758144 : Rat) / 8578069) [(3, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0023
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0024 : Poly :=
[
  term ((13422316800 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 24 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0024 : Poly :=
[
  term ((26844633600 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((-13422316800 : Rat) / 150171761) [(4, 2), (5, 1), (11, 1)],
  term ((26844633600 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1)],
  term ((-13422316800 : Rat) / 150171761) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0024
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0025 : Poly :=
[
  term ((646555335906902160 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 25 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0025 : Poly :=
[
  term ((1293110671813804320 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-646555335906902160 : Rat) / 1288183727709509) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((1293110671813804320 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-646555335906902160 : Rat) / 1288183727709509) [(5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0025
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0026 : Poly :=
[
  term ((-541374848 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 26 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0026 : Poly :=
[
  term ((-1082749696 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((541374848 : Rat) / 8578069) [(4, 2), (5, 1), (15, 1)],
  term ((-1082749696 : Rat) / 8578069) [(5, 2), (7, 1), (15, 1)],
  term ((541374848 : Rat) / 8578069) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0026
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0027 : Poly :=
[
  term ((26349284400 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 27 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0027 : Poly :=
[
  term ((52698568800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-26349284400 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)],
  term ((52698568800 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1)],
  term ((-26349284400 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0027
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0028 : Poly :=
[
  term ((-16076222400 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 28 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0028 : Poly :=
[
  term ((-32152444800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((16076222400 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-32152444800 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (12, 1)],
  term ((16076222400 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0028
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0029 : Poly :=
[
  term ((-774394430471650380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 29 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0029 : Poly :=
[
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0029
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0030 : Poly :=
[
  term ((1269249614652851655 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 30 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0030 : Poly :=
[
  term ((2538499229305703310 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1269249614652851655 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((2538499229305703310 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-1269249614652851655 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0030
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0031 : Poly :=
[
  term ((-1749490416 : Rat) / 8578069) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 31 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0031 : Poly :=
[
  term ((-3498980832 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-3498980832 : Rat) / 8578069) [(5, 1), (7, 2), (12, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(5, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0031
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0032 : Poly :=
[
  term ((1814161916 : Rat) / 8578069) [(7, 1), (15, 1)]
]

/-- Partial product 32 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0032 : Poly :=
[
  term ((3628323832 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-1814161916 : Rat) / 8578069) [(4, 2), (7, 1), (15, 1)],
  term ((3628323832 : Rat) / 8578069) [(5, 1), (7, 2), (15, 1)],
  term ((-1814161916 : Rat) / 8578069) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0032
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0033 : Poly :=
[
  term ((3818314800 : Rat) / 8833633) [(9, 1), (11, 1)]
]

/-- Partial product 33 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0033 : Poly :=
[
  term ((7636629600 : Rat) / 8833633) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-3818314800 : Rat) / 8833633) [(4, 2), (9, 1), (11, 1)],
  term ((7636629600 : Rat) / 8833633) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-3818314800 : Rat) / 8833633) [(5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0033
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0034 : Poly :=
[
  term ((3117438785601765 : Rat) / 1284330735503) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 34 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0034 : Poly :=
[
  term ((6234877571203530 : Rat) / 1284330735503) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3117438785601765 : Rat) / 1284330735503) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((6234877571203530 : Rat) / 1284330735503) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3117438785601765 : Rat) / 1284330735503) [(5, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0034
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0035 : Poly :=
[
  term ((-9108844 : Rat) / 145391) [(9, 1), (15, 1)]
]

/-- Partial product 35 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0035 : Poly :=
[
  term ((-18217688 : Rat) / 145391) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((9108844 : Rat) / 145391) [(4, 2), (9, 1), (15, 1)],
  term ((-18217688 : Rat) / 145391) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((9108844 : Rat) / 145391) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0035
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0036 : Poly :=
[
  term ((8038111200 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 36 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0036 : Poly :=
[
  term ((16076222400 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-8038111200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((16076222400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-8038111200 : Rat) / 150171761) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0036
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0037 : Poly :=
[
  term ((387197215235825190 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 37 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0037 : Poly :=
[
  term ((774394430471650380 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-387197215235825190 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-387197215235825190 : Rat) / 1288183727709509) [(5, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0037
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013YNNN_coefficient_17_0038 : Poly :=
[
  term ((874745208 : Rat) / 8578069) [(13, 1), (15, 1)]
]

/-- Partial product 38 for generator 17. -/
def rs_R013_ueqv_R013YNNN_partial_17_0038 : Poly :=
[
  term ((1749490416 : Rat) / 8578069) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-874745208 : Rat) / 8578069) [(4, 2), (13, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-874745208 : Rat) / 8578069) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 17. -/
theorem rs_R013_ueqv_R013YNNN_partial_17_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_17_0038
        rs_R013_ueqv_R013YNNN_generator_17_0000_0038 =
      rs_R013_ueqv_R013YNNN_partial_17_0038 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_17_0000_0038 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_17_0000,
  rs_R013_ueqv_R013YNNN_partial_17_0001,
  rs_R013_ueqv_R013YNNN_partial_17_0002,
  rs_R013_ueqv_R013YNNN_partial_17_0003,
  rs_R013_ueqv_R013YNNN_partial_17_0004,
  rs_R013_ueqv_R013YNNN_partial_17_0005,
  rs_R013_ueqv_R013YNNN_partial_17_0006,
  rs_R013_ueqv_R013YNNN_partial_17_0007,
  rs_R013_ueqv_R013YNNN_partial_17_0008,
  rs_R013_ueqv_R013YNNN_partial_17_0009,
  rs_R013_ueqv_R013YNNN_partial_17_0010,
  rs_R013_ueqv_R013YNNN_partial_17_0011,
  rs_R013_ueqv_R013YNNN_partial_17_0012,
  rs_R013_ueqv_R013YNNN_partial_17_0013,
  rs_R013_ueqv_R013YNNN_partial_17_0014,
  rs_R013_ueqv_R013YNNN_partial_17_0015,
  rs_R013_ueqv_R013YNNN_partial_17_0016,
  rs_R013_ueqv_R013YNNN_partial_17_0017,
  rs_R013_ueqv_R013YNNN_partial_17_0018,
  rs_R013_ueqv_R013YNNN_partial_17_0019,
  rs_R013_ueqv_R013YNNN_partial_17_0020,
  rs_R013_ueqv_R013YNNN_partial_17_0021,
  rs_R013_ueqv_R013YNNN_partial_17_0022,
  rs_R013_ueqv_R013YNNN_partial_17_0023,
  rs_R013_ueqv_R013YNNN_partial_17_0024,
  rs_R013_ueqv_R013YNNN_partial_17_0025,
  rs_R013_ueqv_R013YNNN_partial_17_0026,
  rs_R013_ueqv_R013YNNN_partial_17_0027,
  rs_R013_ueqv_R013YNNN_partial_17_0028,
  rs_R013_ueqv_R013YNNN_partial_17_0029,
  rs_R013_ueqv_R013YNNN_partial_17_0030,
  rs_R013_ueqv_R013YNNN_partial_17_0031,
  rs_R013_ueqv_R013YNNN_partial_17_0032,
  rs_R013_ueqv_R013YNNN_partial_17_0033,
  rs_R013_ueqv_R013YNNN_partial_17_0034,
  rs_R013_ueqv_R013YNNN_partial_17_0035,
  rs_R013_ueqv_R013YNNN_partial_17_0036,
  rs_R013_ueqv_R013YNNN_partial_17_0037,
  rs_R013_ueqv_R013YNNN_partial_17_0038
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_17_0000_0038 : Poly :=
[
  term ((-12219504000 : Rat) / 8833633) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-588615634026439800 : Rat) / 75775513394677) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((-2645288160 : Rat) / 8578069) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((6109752000 : Rat) / 8833633) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((-12219504000 : Rat) / 8833633) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-588615634026439800 : Rat) / 75775513394677) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-2645288160 : Rat) / 8578069) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((6109752000 : Rat) / 8833633) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(0, 1), (4, 2), (5, 1), (11, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(0, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(0, 1), (4, 2), (5, 1), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (5, 2), (7, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (5, 2), (7, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(0, 1), (5, 3), (11, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(0, 1), (5, 3), (11, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(0, 1), (5, 3), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (4, 1), (5, 2), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (4, 1), (5, 2), (15, 1)],
  term ((-76038899200 : Rat) / 150171761) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(1, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 2), (6, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 2), (6, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 2), (6, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 2), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (4, 3), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (4, 3), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (4, 3), (15, 1)],
  term ((-76038899200 : Rat) / 150171761) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (5, 2), (15, 1)],
  term ((238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((11174816000 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1)],
  term ((538292831277669200 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((9560340160 : Rat) / 25734207) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-5587408000 : Rat) / 150171761) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((-269146415638834600 : Rat) / 1288183727709509) [(2, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-4780170080 : Rat) / 25734207) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((11174816000 : Rat) / 150171761) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((538292831277669200 : Rat) / 1288183727709509) [(2, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((9560340160 : Rat) / 25734207) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((-5587408000 : Rat) / 150171761) [(2, 1), (5, 3), (11, 1)],
  term ((-269146415638834600 : Rat) / 1288183727709509) [(2, 1), (5, 3), (11, 2), (15, 1)],
  term ((-4780170080 : Rat) / 25734207) [(2, 1), (5, 3), (15, 1)],
  term ((-11174816000 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-538292831277669200 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-9560340160 : Rat) / 25734207) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((5587408000 : Rat) / 150171761) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((269146415638834600 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((4780170080 : Rat) / 25734207) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((45490675200 : Rat) / 150171761) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((2191293740330118240 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((1297516288 : Rat) / 8578069) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-11174816000 : Rat) / 150171761) [(3, 1), (4, 2), (6, 1), (11, 1)],
  term ((-538292831277669200 : Rat) / 1288183727709509) [(3, 1), (4, 2), (6, 1), (11, 2), (15, 1)],
  term ((-9560340160 : Rat) / 25734207) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term ((-22745337600 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((-1095646870165059120 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-648758144 : Rat) / 8578069) [(3, 1), (4, 2), (15, 1)],
  term ((5587408000 : Rat) / 150171761) [(3, 1), (4, 3), (11, 1)],
  term ((269146415638834600 : Rat) / 1288183727709509) [(3, 1), (4, 3), (11, 2), (15, 1)],
  term ((4780170080 : Rat) / 25734207) [(3, 1), (4, 3), (15, 1)],
  term ((45490675200 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((2191293740330118240 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((1297516288 : Rat) / 8578069) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-22745337600 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)],
  term ((-1095646870165059120 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-648758144 : Rat) / 8578069) [(3, 1), (5, 2), (15, 1)],
  term ((26844633600 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((1293110671813804320 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-1082749696 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((52698568800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-32152444800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((2538499229305703310 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3498980832 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((3628323832 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((7636629600 : Rat) / 8833633) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((6234877571203530 : Rat) / 1284330735503) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-18217688 : Rat) / 145391) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((16076222400 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-13422316800 : Rat) / 150171761) [(4, 2), (5, 1), (11, 1)],
  term ((-646555335906902160 : Rat) / 1288183727709509) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((541374848 : Rat) / 8578069) [(4, 2), (5, 1), (15, 1)],
  term ((-26349284400 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)],
  term ((16076222400 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1269249614652851655 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1814161916 : Rat) / 8578069) [(4, 2), (7, 1), (15, 1)],
  term ((-3818314800 : Rat) / 8833633) [(4, 2), (9, 1), (11, 1)],
  term ((-3117438785601765 : Rat) / 1284330735503) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((9108844 : Rat) / 145391) [(4, 2), (9, 1), (15, 1)],
  term ((-8038111200 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((-387197215235825190 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-874745208 : Rat) / 8578069) [(4, 2), (13, 1), (15, 1)],
  term ((7636629600 : Rat) / 8833633) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((6234877571203530 : Rat) / 1284330735503) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-18217688 : Rat) / 145391) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((16076222400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((52698568800 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1)],
  term ((-32152444800 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1), (12, 1)],
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((2538499229305703310 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-3498980832 : Rat) / 8578069) [(5, 1), (7, 2), (12, 1), (15, 1)],
  term ((3628323832 : Rat) / 8578069) [(5, 1), (7, 2), (15, 1)],
  term ((495349200 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1)],
  term ((16076222400 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((23861057160952665 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-2896911612 : Rat) / 8578069) [(5, 2), (7, 1), (15, 1)],
  term ((-3818314800 : Rat) / 8833633) [(5, 2), (9, 1), (11, 1)],
  term ((-3117438785601765 : Rat) / 1284330735503) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((9108844 : Rat) / 145391) [(5, 2), (9, 1), (15, 1)],
  term ((-8038111200 : Rat) / 150171761) [(5, 2), (11, 1), (13, 1)],
  term ((-387197215235825190 : Rat) / 1288183727709509) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-874745208 : Rat) / 8578069) [(5, 2), (13, 1), (15, 1)],
  term ((-13422316800 : Rat) / 150171761) [(5, 3), (11, 1)],
  term ((-646555335906902160 : Rat) / 1288183727709509) [(5, 3), (11, 2), (15, 1)],
  term ((541374848 : Rat) / 8578069) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 38. -/
theorem rs_R013_ueqv_R013YNNN_block_17_0000_0038_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_17_0000_0038
      rs_R013_ueqv_R013YNNN_block_17_0000_0038 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
