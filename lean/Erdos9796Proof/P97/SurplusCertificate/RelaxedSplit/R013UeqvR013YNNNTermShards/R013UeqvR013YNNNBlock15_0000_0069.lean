/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 15:0-69

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_15_0000_0069 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(4, 1)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0000 : Poly :=
[
  term ((-165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0000 : Poly :=
[
  term ((331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((-331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)],
  term ((165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0000
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0001 : Poly :=
[
  term ((-7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0001 : Poly :=
[
  term ((-15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0001
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0002 : Poly :=
[
  term ((-5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0002 : Poly :=
[
  term ((-11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((-11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)],
  term ((5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0002
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0003 : Poly :=
[
  term ((-362699016000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0003 : Poly :=
[
  term ((725398032000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-725398032000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-725398032000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-362699016000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)],
  term ((362699016000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((362699016000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0003
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0004 : Poly :=
[
  term ((-331677411137401352 : Rat) / 1288183727709509) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0004 : Poly :=
[
  term ((-663354822274802704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((663354822274802704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-663354822274802704 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((331677411137401352 : Rat) / 1288183727709509) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-331677411137401352 : Rat) / 1288183727709509) [(0, 1), (11, 1), (15, 1)],
  term ((331677411137401352 : Rat) / 1288183727709509) [(0, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0004
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0005 : Poly :=
[
  term ((160247695200 : Rat) / 150171761) [(0, 1), (11, 2)]
]

/-- Partial product 5 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0005 : Poly :=
[
  term ((-320495390400 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2)],
  term ((320495390400 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (14, 1)],
  term ((320495390400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((160247695200 : Rat) / 150171761) [(0, 1), (11, 2)],
  term ((-160247695200 : Rat) / 150171761) [(0, 1), (11, 2), (14, 2)],
  term ((-160247695200 : Rat) / 150171761) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0005
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0006 : Poly :=
[
  term ((-17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0006 : Poly :=
[
  term ((-34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0006
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0007 : Poly :=
[
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 7 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0007 : Poly :=
[
  term ((-3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((-3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 3)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (11, 2), (14, 2), (15, 2)],
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0007
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0008 : Poly :=
[
  term ((7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0008 : Poly :=
[
  term ((15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (14, 1), (15, 1)],
  term ((-15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (15, 1)],
  term ((15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 3), (15, 2)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (11, 3), (14, 2), (15, 1)],
  term ((7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 1)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0008
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0009 : Poly :=
[
  term ((-34751747600 : Rat) / 8578069) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0009 : Poly :=
[
  term ((-69503495200 : Rat) / 8578069) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((69503495200 : Rat) / 8578069) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((-69503495200 : Rat) / 8578069) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((34751747600 : Rat) / 8578069) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-34751747600 : Rat) / 8578069) [(0, 1), (13, 1), (15, 1)],
  term ((34751747600 : Rat) / 8578069) [(0, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0009
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0010 : Poly :=
[
  term ((8968047208 : Rat) / 25734207) [(0, 1), (15, 2)]
]

/-- Partial product 10 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0010 : Poly :=
[
  term ((17936094416 : Rat) / 25734207) [(0, 1), (4, 1), (14, 1), (15, 2)],
  term ((-17936094416 : Rat) / 25734207) [(0, 1), (4, 1), (15, 2)],
  term ((17936094416 : Rat) / 25734207) [(0, 1), (5, 1), (15, 3)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (14, 2), (15, 2)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (15, 2)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0010
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0011 : Poly :=
[
  term ((19009724800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0011 : Poly :=
[
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0011
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0012 : Poly :=
[
  term ((915701751545736760 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0012 : Poly :=
[
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 2), (15, 2)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0012
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0013 : Poly :=
[
  term ((3156045536 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 13 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0013 : Poly :=
[
  term ((6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (2, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0013
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0014 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 14 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0014 : Poly :=
[
  term ((27092083200 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0014
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0015 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 15 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0015 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0015
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0016 : Poly :=
[
  term ((860779296 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 16 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0016 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0016
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0017 : Poly :=
[
  term ((-47617035200 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 17 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0017 : Poly :=
[
  term ((95234070400 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)],
  term ((-95234070400 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (14, 1)],
  term ((-95234070400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-47617035200 : Rat) / 150171761) [(1, 1), (11, 1)],
  term ((47617035200 : Rat) / 150171761) [(1, 1), (11, 1), (14, 2)],
  term ((47617035200 : Rat) / 150171761) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0017
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0018 : Poly :=
[
  term ((-2293720871543337740 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 18 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0018 : Poly :=
[
  term ((-4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((-4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((2293720871543337740 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2293720871543337740 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)],
  term ((2293720871543337740 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0018
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0019 : Poly :=
[
  term ((-9434777584 : Rat) / 25734207) [(1, 1), (15, 1)]
]

/-- Partial product 19 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0019 : Poly :=
[
  term ((-18869555168 : Rat) / 25734207) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((18869555168 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)],
  term ((-18869555168 : Rat) / 25734207) [(1, 1), (5, 1), (15, 2)],
  term ((9434777584 : Rat) / 25734207) [(1, 1), (14, 2), (15, 1)],
  term ((-9434777584 : Rat) / 25734207) [(1, 1), (15, 1)],
  term ((9434777584 : Rat) / 25734207) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0019
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0020 : Poly :=
[
  term ((42835869600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 20 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0020 : Poly :=
[
  term ((-85671739200 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((85671739200 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((42835869600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)],
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((85671739200 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0020
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0021 : Poly :=
[
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 21 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0021 : Poly :=
[
  term ((4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 3)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0021
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0022 : Poly :=
[
  term ((-499743416 : Rat) / 8578069) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 22 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0022 : Poly :=
[
  term ((-999486832 : Rat) / 8578069) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((999486832 : Rat) / 8578069) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 1), (5, 1), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 1), (5, 1), (15, 3)],
  term ((-999486832 : Rat) / 8578069) [(2, 1), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0022
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0023 : Poly :=
[
  term ((227457041600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 23 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0023 : Poly :=
[
  term ((-454914083200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((454914083200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((454914083200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((227457041600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)],
  term ((-227457041600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-227457041600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0023
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0024 : Poly :=
[
  term ((46799220000 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 24 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0024 : Poly :=
[
  term ((93598440000 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-93598440000 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((93598440000 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-46799220000 : Rat) / 150171761) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((46799220000 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)],
  term ((-46799220000 : Rat) / 150171761) [(2, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0024
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0025 : Poly :=
[
  term ((10956645274240451420 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 25 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0025 : Poly :=
[
  term ((21913290548480902840 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-21913290548480902840 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((21913290548480902840 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-10956645274240451420 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((10956645274240451420 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-10956645274240451420 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0025
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0026 : Poly :=
[
  term ((2254326571049270250 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 26 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0026 : Poly :=
[
  term ((4508653142098540500 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-4508653142098540500 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)],
  term ((4508653142098540500 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 3)],
  term ((-2254326571049270250 : Rat) / 1288183727709509) [(2, 1), (11, 2), (14, 2), (15, 2)],
  term ((2254326571049270250 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)],
  term ((-2254326571049270250 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0026
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0027 : Poly :=
[
  term ((85708750672 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 27 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0027 : Poly :=
[
  term ((171417501344 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-171417501344 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((171417501344 : Rat) / 25734207) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-85708750672 : Rat) / 25734207) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((85708750672 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)],
  term ((-85708750672 : Rat) / 25734207) [(2, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0027
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0028 : Poly :=
[
  term ((-1661879320 : Rat) / 8578069) [(2, 1), (15, 2)]
]

/-- Partial product 28 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0028 : Poly :=
[
  term ((-3323758640 : Rat) / 8578069) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((3323758640 : Rat) / 8578069) [(2, 1), (4, 1), (15, 2)],
  term ((-3323758640 : Rat) / 8578069) [(2, 1), (5, 1), (15, 3)],
  term ((1661879320 : Rat) / 8578069) [(2, 1), (14, 2), (15, 2)],
  term ((-1661879320 : Rat) / 8578069) [(2, 1), (15, 2)],
  term ((1661879320 : Rat) / 8578069) [(2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0028
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0029 : Poly :=
[
  term ((117597242600 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 29 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0029 : Poly :=
[
  term ((-235194485200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)],
  term ((235194485200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((235194485200 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((117597242600 : Rat) / 150171761) [(3, 1), (11, 1)],
  term ((-117597242600 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2)],
  term ((-117597242600 : Rat) / 150171761) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0029
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0030 : Poly :=
[
  term ((-5565842800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 30 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0030 : Poly :=
[
  term ((11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((-11131685600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-5565842800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1)],
  term ((5565842800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((5565842800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0030
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0031 : Poly :=
[
  term ((-268107616202220235 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 31 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0031 : Poly :=
[
  term ((536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2)],
  term ((-268107616202220235 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((268107616202220235 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 3)],
  term ((268107616202220235 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0031
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0032 : Poly :=
[
  term ((11329359278864355865 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 32 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0032 : Poly :=
[
  term ((11329359278864355865 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((-11329359278864355865 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((11329359278864355865 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-11329359278864355865 : Rat) / 2576367455419018) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((11329359278864355865 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 1)],
  term ((-11329359278864355865 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0032
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0033 : Poly :=
[
  term ((4447755964 : Rat) / 25734207) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 33 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0033 : Poly :=
[
  term ((-8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((4447755964 : Rat) / 25734207) [(3, 1), (14, 1), (15, 1)],
  term ((-4447755964 : Rat) / 25734207) [(3, 1), (14, 1), (15, 3)],
  term ((-4447755964 : Rat) / 25734207) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0033
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0034 : Poly :=
[
  term ((9639941782 : Rat) / 25734207) [(3, 1), (15, 1)]
]

/-- Partial product 34 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0034 : Poly :=
[
  term ((19279883564 : Rat) / 25734207) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-19279883564 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)],
  term ((19279883564 : Rat) / 25734207) [(3, 1), (5, 1), (15, 2)],
  term ((-9639941782 : Rat) / 25734207) [(3, 1), (14, 2), (15, 1)],
  term ((9639941782 : Rat) / 25734207) [(3, 1), (15, 1)],
  term ((-9639941782 : Rat) / 25734207) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0034
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0035 : Poly :=
[
  term ((-3074827200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 35 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0035 : Poly :=
[
  term ((-6149654400 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((-6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0035
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0036 : Poly :=
[
  term ((1537413600 : Rat) / 150171761) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 36 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0036 : Poly :=
[
  term ((3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (15, 2)],
  term ((-1537413600 : Rat) / 150171761) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((1537413600 : Rat) / 150171761) [(4, 1), (11, 1), (15, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 1), (11, 1), (15, 3)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0036
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0037 : Poly :=
[
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 37 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0037 : Poly :=
[
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0037
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0038 : Poly :=
[
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 38 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0038 : Poly :=
[
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 3)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 4)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (14, 1), (15, 2)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0038
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0039 : Poly :=
[
  term ((-462816688 : Rat) / 8578069) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 39 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0039 : Poly :=
[
  term ((-925633376 : Rat) / 8578069) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 1), (13, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (13, 1), (15, 3)],
  term ((-925633376 : Rat) / 8578069) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((925633376 : Rat) / 8578069) [(4, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0039
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0040 : Poly :=
[
  term ((231408344 : Rat) / 8578069) [(4, 1), (15, 2)]
]

/-- Partial product 40 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0040 : Poly :=
[
  term ((462816688 : Rat) / 8578069) [(4, 1), (5, 1), (15, 3)],
  term ((-231408344 : Rat) / 8578069) [(4, 1), (14, 2), (15, 2)],
  term ((231408344 : Rat) / 8578069) [(4, 1), (15, 2)],
  term ((-231408344 : Rat) / 8578069) [(4, 1), (15, 4)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (14, 1), (15, 2)],
  term ((-462816688 : Rat) / 8578069) [(4, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0040
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0041 : Poly :=
[
  term ((-43604576400 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 41 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0041 : Poly :=
[
  term ((87209152800 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1)],
  term ((-87209152800 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term ((-43604576400 : Rat) / 150171761) [(5, 1), (11, 1)],
  term ((43604576400 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)],
  term ((43604576400 : Rat) / 150171761) [(5, 1), (11, 1), (15, 2)],
  term ((-87209152800 : Rat) / 150171761) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0041
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0042 : Poly :=
[
  term ((-2100440032929350805 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 42 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0042 : Poly :=
[
  term ((-4200880065858701610 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((4200880065858701610 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 1)],
  term ((2100440032929350805 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2100440032929350805 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)],
  term ((2100440032929350805 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 3)],
  term ((-4200880065858701610 : Rat) / 1288183727709509) [(5, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0042
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0043 : Poly :=
[
  term ((384039244 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 43 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0043 : Poly :=
[
  term ((768078488 : Rat) / 8578069) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-768078488 : Rat) / 8578069) [(4, 1), (5, 1), (15, 1)],
  term ((-384039244 : Rat) / 8578069) [(5, 1), (14, 2), (15, 1)],
  term ((384039244 : Rat) / 8578069) [(5, 1), (15, 1)],
  term ((-384039244 : Rat) / 8578069) [(5, 1), (15, 3)],
  term ((768078488 : Rat) / 8578069) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0043
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0044 : Poly :=
[
  term ((-4752431200 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 44 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0044 : Poly :=
[
  term ((9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)],
  term ((-9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4752431200 : Rat) / 150171761) [(7, 1), (11, 1)],
  term ((4752431200 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2)],
  term ((4752431200 : Rat) / 150171761) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0044
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0045 : Poly :=
[
  term ((9504862400 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 45 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0045 : Poly :=
[
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((19009724800 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((9504862400 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1)],
  term ((-9504862400 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9504862400 : Rat) / 150171761) [(7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0045
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0046 : Poly :=
[
  term ((457850875772868380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 46 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0046 : Poly :=
[
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (14, 1), (15, 2)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0046
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0047 : Poly :=
[
  term ((-228925437886434190 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 47 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0047 : Poly :=
[
  term ((-457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (15, 2)],
  term ((228925437886434190 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-228925437886434190 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)],
  term ((228925437886434190 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0047
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0048 : Poly :=
[
  term ((1578022768 : Rat) / 25734207) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 48 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0048 : Poly :=
[
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((1578022768 : Rat) / 25734207) [(7, 1), (14, 1), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(7, 1), (14, 1), (15, 3)],
  term ((-1578022768 : Rat) / 25734207) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0048
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0049 : Poly :=
[
  term ((-789011384 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 49 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0049 : Poly :=
[
  term ((-1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (15, 2)],
  term ((789011384 : Rat) / 25734207) [(7, 1), (14, 2), (15, 1)],
  term ((-789011384 : Rat) / 25734207) [(7, 1), (15, 1)],
  term ((789011384 : Rat) / 25734207) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0049
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0050 : Poly :=
[
  term ((24928763400 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 50 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0050 : Poly :=
[
  term ((49857526800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((49857526800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-24928763400 : Rat) / 150171761) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((24928763400 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)],
  term ((-24928763400 : Rat) / 150171761) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0050
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0051 : Poly :=
[
  term ((2401645741788882285 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 51 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0051 : Poly :=
[
  term ((2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 3)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 2)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0051
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0052 : Poly :=
[
  term ((-724709094 : Rat) / 8578069) [(10, 1), (15, 2)]
]

/-- Partial product 52 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0052 : Poly :=
[
  term ((-1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)],
  term ((-1449418188 : Rat) / 8578069) [(5, 1), (10, 1), (15, 3)],
  term ((724709094 : Rat) / 8578069) [(10, 1), (14, 2), (15, 2)],
  term ((-724709094 : Rat) / 8578069) [(10, 1), (15, 2)],
  term ((724709094 : Rat) / 8578069) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0052
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0053 : Poly :=
[
  term ((1796587200 : Rat) / 8833633) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 53 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0053 : Poly :=
[
  term ((-3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3593174400 : Rat) / 8833633) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1796587200 : Rat) / 8833633) [(11, 1), (12, 1), (13, 1)],
  term ((-1796587200 : Rat) / 8833633) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1796587200 : Rat) / 8833633) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0053
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0054 : Poly :=
[
  term ((-50870320200 : Rat) / 150171761) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 54 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0054 : Poly :=
[
  term ((-101740640400 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((101740640400 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-101740640400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((50870320200 : Rat) / 150171761) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-50870320200 : Rat) / 150171761) [(11, 1), (12, 1), (15, 1)],
  term ((50870320200 : Rat) / 150171761) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0054
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0055 : Poly :=
[
  term ((86473870300 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 55 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0055 : Poly :=
[
  term ((-172947740600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)],
  term ((172947740600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((172947740600 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((86473870300 : Rat) / 150171761) [(11, 1), (13, 1)],
  term ((-86473870300 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)],
  term ((-86473870300 : Rat) / 150171761) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0055
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0056 : Poly :=
[
  term ((-10650178000 : Rat) / 150171761) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 56 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0056 : Poly :=
[
  term ((21300356000 : Rat) / 150171761) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-21300356000 : Rat) / 150171761) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-21300356000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-10650178000 : Rat) / 150171761) [(11, 1), (14, 1), (15, 1)],
  term ((10650178000 : Rat) / 150171761) [(11, 1), (14, 1), (15, 3)],
  term ((10650178000 : Rat) / 150171761) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0056
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0057 : Poly :=
[
  term ((-142893026595421129 : Rat) / 1288183727709509) [(11, 1), (15, 1)]
]

/-- Partial product 57 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0057 : Poly :=
[
  term ((-285786053190842258 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((285786053190842258 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)],
  term ((-285786053190842258 : Rat) / 1288183727709509) [(5, 1), (11, 1), (15, 2)],
  term ((142893026595421129 : Rat) / 1288183727709509) [(11, 1), (14, 2), (15, 1)],
  term ((-142893026595421129 : Rat) / 1288183727709509) [(11, 1), (15, 1)],
  term ((142893026595421129 : Rat) / 1288183727709509) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0057
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0058 : Poly :=
[
  term ((-99361250100 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 58 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0058 : Poly :=
[
  term ((198722500200 : Rat) / 150171761) [(4, 1), (11, 2)],
  term ((-198722500200 : Rat) / 150171761) [(4, 1), (11, 2), (14, 1)],
  term ((-198722500200 : Rat) / 150171761) [(5, 1), (11, 2), (15, 1)],
  term ((-99361250100 : Rat) / 150171761) [(11, 2)],
  term ((99361250100 : Rat) / 150171761) [(11, 2), (14, 2)],
  term ((99361250100 : Rat) / 150171761) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0058
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0059 : Poly :=
[
  term ((86541918052630140 : Rat) / 75775513394677) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 59 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0059 : Poly :=
[
  term ((173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((173083836105260280 : Rat) / 75775513394677) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((86541918052630140 : Rat) / 75775513394677) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(11, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0059
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0060 : Poly :=
[
  term ((-4900864352211187605 : Rat) / 2576367455419018) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 60 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0060 : Poly :=
[
  term ((-4900864352211187605 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((4900864352211187605 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-4900864352211187605 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 3)],
  term ((4900864352211187605 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-4900864352211187605 : Rat) / 2576367455419018) [(11, 2), (12, 1), (15, 2)],
  term ((4900864352211187605 : Rat) / 2576367455419018) [(11, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0060_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0060
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0061 : Poly :=
[
  term ((16661845519541422315 : Rat) / 5152734910838036) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 61 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0061 : Poly :=
[
  term ((16661845519541422315 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-16661845519541422315 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((16661845519541422315 : Rat) / 2576367455419018) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-16661845519541422315 : Rat) / 5152734910838036) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((16661845519541422315 : Rat) / 5152734910838036) [(11, 2), (13, 1), (15, 1)],
  term ((-16661845519541422315 : Rat) / 5152734910838036) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0061_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0061
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0062 : Poly :=
[
  term ((-513020927524099225 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 62 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0062 : Poly :=
[
  term ((1026041855048198450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-1026041855048198450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((-1026041855048198450 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 4)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(11, 2), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0062_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0062
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0063 : Poly :=
[
  term ((-1486900842579729825 : Rat) / 1288183727709509) [(11, 2), (15, 2)]
]

/-- Partial product 63 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0063 : Poly :=
[
  term ((-2973801685159459650 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((2973801685159459650 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)],
  term ((-2973801685159459650 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 3)],
  term ((1486900842579729825 : Rat) / 1288183727709509) [(11, 2), (14, 2), (15, 2)],
  term ((-1486900842579729825 : Rat) / 1288183727709509) [(11, 2), (15, 2)],
  term ((1486900842579729825 : Rat) / 1288183727709509) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0063_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0063
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0064 : Poly :=
[
  term ((-19144994829666132105 : Rat) / 5152734910838036) [(11, 3), (15, 1)]
]

/-- Partial product 64 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0064 : Poly :=
[
  term ((-19144994829666132105 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 1), (15, 1)],
  term ((19144994829666132105 : Rat) / 2576367455419018) [(4, 1), (11, 3), (15, 1)],
  term ((-19144994829666132105 : Rat) / 2576367455419018) [(5, 1), (11, 3), (15, 2)],
  term ((19144994829666132105 : Rat) / 5152734910838036) [(11, 3), (14, 2), (15, 1)],
  term ((-19144994829666132105 : Rat) / 5152734910838036) [(11, 3), (15, 1)],
  term ((19144994829666132105 : Rat) / 5152734910838036) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0064_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0064
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0065 : Poly :=
[
  term ((2273620336 : Rat) / 8578069) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 65 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0065 : Poly :=
[
  term ((4547240672 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4547240672 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((4547240672 : Rat) / 8578069) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2273620336 : Rat) / 8578069) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(12, 1), (13, 1), (15, 1)],
  term ((-2273620336 : Rat) / 8578069) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0065_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0065
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0066 : Poly :=
[
  term ((1244376182 : Rat) / 8578069) [(12, 1), (15, 2)]
]

/-- Partial product 66 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0066 : Poly :=
[
  term ((2488752364 : Rat) / 8578069) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2488752364 : Rat) / 8578069) [(4, 1), (12, 1), (15, 2)],
  term ((2488752364 : Rat) / 8578069) [(5, 1), (12, 1), (15, 3)],
  term ((-1244376182 : Rat) / 8578069) [(12, 1), (14, 2), (15, 2)],
  term ((1244376182 : Rat) / 8578069) [(12, 1), (15, 2)],
  term ((-1244376182 : Rat) / 8578069) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0066_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0066
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0067 : Poly :=
[
  term ((-206417359 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 67 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0067 : Poly :=
[
  term ((-412834718 : Rat) / 25734207) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((412834718 : Rat) / 25734207) [(4, 1), (13, 1), (15, 1)],
  term ((-412834718 : Rat) / 25734207) [(5, 1), (13, 1), (15, 2)],
  term ((206417359 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)],
  term ((-206417359 : Rat) / 25734207) [(13, 1), (15, 1)],
  term ((206417359 : Rat) / 25734207) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0067_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0067
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0068 : Poly :=
[
  term ((-5213716460 : Rat) / 25734207) [(14, 1), (15, 2)]
]

/-- Partial product 68 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0068 : Poly :=
[
  term ((10427432920 : Rat) / 25734207) [(4, 1), (14, 1), (15, 2)],
  term ((-10427432920 : Rat) / 25734207) [(4, 1), (14, 2), (15, 2)],
  term ((-10427432920 : Rat) / 25734207) [(5, 1), (14, 1), (15, 3)],
  term ((-5213716460 : Rat) / 25734207) [(14, 1), (15, 2)],
  term ((5213716460 : Rat) / 25734207) [(14, 1), (15, 4)],
  term ((5213716460 : Rat) / 25734207) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0068_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0068
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013YNNN_coefficient_15_0069 : Poly :=
[
  term ((1507034140 : Rat) / 8578069) [(15, 2)]
]

/-- Partial product 69 for generator 15. -/
def rs_R013_ueqv_R013YNNN_partial_15_0069 : Poly :=
[
  term ((3014068280 : Rat) / 8578069) [(4, 1), (14, 1), (15, 2)],
  term ((-3014068280 : Rat) / 8578069) [(4, 1), (15, 2)],
  term ((3014068280 : Rat) / 8578069) [(5, 1), (15, 3)],
  term ((-1507034140 : Rat) / 8578069) [(14, 2), (15, 2)],
  term ((1507034140 : Rat) / 8578069) [(15, 2)],
  term ((-1507034140 : Rat) / 8578069) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 15. -/
theorem rs_R013_ueqv_R013YNNN_partial_15_0069_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_15_0069
        rs_R013_ueqv_R013YNNN_generator_15_0000_0069 =
      rs_R013_ueqv_R013YNNN_partial_15_0069 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_15_0000_0069 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_15_0000,
  rs_R013_ueqv_R013YNNN_partial_15_0001,
  rs_R013_ueqv_R013YNNN_partial_15_0002,
  rs_R013_ueqv_R013YNNN_partial_15_0003,
  rs_R013_ueqv_R013YNNN_partial_15_0004,
  rs_R013_ueqv_R013YNNN_partial_15_0005,
  rs_R013_ueqv_R013YNNN_partial_15_0006,
  rs_R013_ueqv_R013YNNN_partial_15_0007,
  rs_R013_ueqv_R013YNNN_partial_15_0008,
  rs_R013_ueqv_R013YNNN_partial_15_0009,
  rs_R013_ueqv_R013YNNN_partial_15_0010,
  rs_R013_ueqv_R013YNNN_partial_15_0011,
  rs_R013_ueqv_R013YNNN_partial_15_0012,
  rs_R013_ueqv_R013YNNN_partial_15_0013,
  rs_R013_ueqv_R013YNNN_partial_15_0014,
  rs_R013_ueqv_R013YNNN_partial_15_0015,
  rs_R013_ueqv_R013YNNN_partial_15_0016,
  rs_R013_ueqv_R013YNNN_partial_15_0017,
  rs_R013_ueqv_R013YNNN_partial_15_0018,
  rs_R013_ueqv_R013YNNN_partial_15_0019,
  rs_R013_ueqv_R013YNNN_partial_15_0020,
  rs_R013_ueqv_R013YNNN_partial_15_0021,
  rs_R013_ueqv_R013YNNN_partial_15_0022,
  rs_R013_ueqv_R013YNNN_partial_15_0023,
  rs_R013_ueqv_R013YNNN_partial_15_0024,
  rs_R013_ueqv_R013YNNN_partial_15_0025,
  rs_R013_ueqv_R013YNNN_partial_15_0026,
  rs_R013_ueqv_R013YNNN_partial_15_0027,
  rs_R013_ueqv_R013YNNN_partial_15_0028,
  rs_R013_ueqv_R013YNNN_partial_15_0029,
  rs_R013_ueqv_R013YNNN_partial_15_0030,
  rs_R013_ueqv_R013YNNN_partial_15_0031,
  rs_R013_ueqv_R013YNNN_partial_15_0032,
  rs_R013_ueqv_R013YNNN_partial_15_0033,
  rs_R013_ueqv_R013YNNN_partial_15_0034,
  rs_R013_ueqv_R013YNNN_partial_15_0035,
  rs_R013_ueqv_R013YNNN_partial_15_0036,
  rs_R013_ueqv_R013YNNN_partial_15_0037,
  rs_R013_ueqv_R013YNNN_partial_15_0038,
  rs_R013_ueqv_R013YNNN_partial_15_0039,
  rs_R013_ueqv_R013YNNN_partial_15_0040,
  rs_R013_ueqv_R013YNNN_partial_15_0041,
  rs_R013_ueqv_R013YNNN_partial_15_0042,
  rs_R013_ueqv_R013YNNN_partial_15_0043,
  rs_R013_ueqv_R013YNNN_partial_15_0044,
  rs_R013_ueqv_R013YNNN_partial_15_0045,
  rs_R013_ueqv_R013YNNN_partial_15_0046,
  rs_R013_ueqv_R013YNNN_partial_15_0047,
  rs_R013_ueqv_R013YNNN_partial_15_0048,
  rs_R013_ueqv_R013YNNN_partial_15_0049,
  rs_R013_ueqv_R013YNNN_partial_15_0050,
  rs_R013_ueqv_R013YNNN_partial_15_0051,
  rs_R013_ueqv_R013YNNN_partial_15_0052,
  rs_R013_ueqv_R013YNNN_partial_15_0053,
  rs_R013_ueqv_R013YNNN_partial_15_0054,
  rs_R013_ueqv_R013YNNN_partial_15_0055,
  rs_R013_ueqv_R013YNNN_partial_15_0056,
  rs_R013_ueqv_R013YNNN_partial_15_0057,
  rs_R013_ueqv_R013YNNN_partial_15_0058,
  rs_R013_ueqv_R013YNNN_partial_15_0059,
  rs_R013_ueqv_R013YNNN_partial_15_0060,
  rs_R013_ueqv_R013YNNN_partial_15_0061,
  rs_R013_ueqv_R013YNNN_partial_15_0062,
  rs_R013_ueqv_R013YNNN_partial_15_0063,
  rs_R013_ueqv_R013YNNN_partial_15_0064,
  rs_R013_ueqv_R013YNNN_partial_15_0065,
  rs_R013_ueqv_R013YNNN_partial_15_0066,
  rs_R013_ueqv_R013YNNN_partial_15_0067,
  rs_R013_ueqv_R013YNNN_partial_15_0068,
  rs_R013_ueqv_R013YNNN_partial_15_0069
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_15_0000_0069 : Poly :=
[
  term ((331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((-331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((-331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)],
  term ((165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 3)],
  term ((5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)],
  term ((5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (15, 3)],
  term ((725398032000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-725398032000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-663354822274802704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((663354822274802704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-320495390400 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2)],
  term ((-34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((320495390400 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (14, 1)],
  term ((-3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (14, 1), (15, 1)],
  term ((-15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (15, 1)],
  term ((-69503495200 : Rat) / 8578069) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((69503495200 : Rat) / 8578069) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((17936094416 : Rat) / 25734207) [(0, 1), (4, 1), (14, 1), (15, 2)],
  term ((-17936094416 : Rat) / 25734207) [(0, 1), (4, 1), (15, 2)],
  term ((-725398032000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-663354822274802704 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((320495390400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 3)],
  term ((15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 3), (15, 2)],
  term ((-69503495200 : Rat) / 8578069) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((17936094416 : Rat) / 25734207) [(0, 1), (5, 1), (15, 3)],
  term ((-362699016000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)],
  term ((362699016000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((362699016000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((331677411137401352 : Rat) / 1288183727709509) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-331677411137401352 : Rat) / 1288183727709509) [(0, 1), (11, 1), (15, 1)],
  term ((331677411137401352 : Rat) / 1288183727709509) [(0, 1), (11, 1), (15, 3)],
  term ((160247695200 : Rat) / 150171761) [(0, 1), (11, 2)],
  term ((17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 3)],
  term ((-160247695200 : Rat) / 150171761) [(0, 1), (11, 2), (14, 2)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (11, 2), (14, 2), (15, 2)],
  term ((-3205208681919759970 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 4)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (11, 3), (14, 2), (15, 1)],
  term ((7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 1)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 3)],
  term ((34751747600 : Rat) / 8578069) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-34751747600 : Rat) / 8578069) [(0, 1), (13, 1), (15, 1)],
  term ((34751747600 : Rat) / 8578069) [(0, 1), (13, 1), (15, 3)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (14, 2), (15, 2)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (15, 2)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (15, 4)],
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 2), (15, 2)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((19009724800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-19009724800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 3)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(1, 1), (2, 1), (15, 3)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((95234070400 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)],
  term ((-95234070400 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (14, 1)],
  term ((-4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((-18869555168 : Rat) / 25734207) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((18869555168 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (15, 2)],
  term ((-95234070400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((-18869555168 : Rat) / 25734207) [(1, 1), (5, 1), (15, 2)],
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 3)],
  term ((-860779296 : Rat) / 8578069) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 1), (10, 1), (15, 3)],
  term ((-47617035200 : Rat) / 150171761) [(1, 1), (11, 1)],
  term ((47617035200 : Rat) / 150171761) [(1, 1), (11, 1), (14, 2)],
  term ((47617035200 : Rat) / 150171761) [(1, 1), (11, 1), (15, 2)],
  term ((2293720871543337740 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2293720871543337740 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)],
  term ((2293720871543337740 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 3)],
  term ((9434777584 : Rat) / 25734207) [(1, 1), (14, 2), (15, 1)],
  term ((-9434777584 : Rat) / 25734207) [(1, 1), (15, 1)],
  term ((9434777584 : Rat) / 25734207) [(1, 1), (15, 3)],
  term ((-85671739200 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((85671739200 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-999486832 : Rat) / 8578069) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((999486832 : Rat) / 8578069) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-454914083200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((454914083200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((93598440000 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-93598440000 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((21913290548480902840 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-21913290548480902840 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((4508653142098540500 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-4508653142098540500 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)],
  term ((171417501344 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-171417501344 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-3323758640 : Rat) / 8578069) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((3323758640 : Rat) / 8578069) [(2, 1), (4, 1), (15, 2)],
  term ((42835869600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)],
  term ((454914083200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((50762570400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((21913290548480902840 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((2445241849489781730 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 3)],
  term ((171417501344 : Rat) / 25734207) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((499743416 : Rat) / 8578069) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 1), (5, 1), (15, 1)],
  term ((-2824015224 : Rat) / 8578069) [(2, 1), (5, 1), (15, 3)],
  term ((85671739200 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (15, 2)],
  term ((-999486832 : Rat) / 8578069) [(2, 1), (5, 2), (15, 2)],
  term ((227457041600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)],
  term ((-227457041600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-227457041600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-46799220000 : Rat) / 150171761) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((46799220000 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)],
  term ((-46799220000 : Rat) / 150171761) [(2, 1), (11, 1), (15, 3)],
  term ((-10956645274240451420 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((10956645274240451420 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-10956645274240451420 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 3)],
  term ((-2254326571049270250 : Rat) / 1288183727709509) [(2, 1), (11, 2), (14, 2), (15, 2)],
  term ((2254326571049270250 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)],
  term ((-2254326571049270250 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 4)],
  term ((-85708750672 : Rat) / 25734207) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((85708750672 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)],
  term ((-85708750672 : Rat) / 25734207) [(2, 1), (13, 1), (15, 3)],
  term ((1661879320 : Rat) / 8578069) [(2, 1), (14, 2), (15, 2)],
  term ((-1661879320 : Rat) / 8578069) [(2, 1), (15, 2)],
  term ((1661879320 : Rat) / 8578069) [(2, 1), (15, 4)],
  term ((-235194485200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)],
  term ((246326170800 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((11865574511268796335 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((-11329359278864355865 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((3461457212 : Rat) / 8578069) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-19279883564 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((235194485200 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2)],
  term ((11329359278864355865 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((8895511928 : Rat) / 25734207) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((19279883564 : Rat) / 25734207) [(3, 1), (5, 1), (15, 2)],
  term ((117597242600 : Rat) / 150171761) [(3, 1), (11, 1)],
  term ((-5565842800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1)],
  term ((5565842800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-117597242600 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2)],
  term ((5565842800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 3)],
  term ((-117597242600 : Rat) / 150171761) [(3, 1), (11, 1), (15, 2)],
  term ((-268107616202220235 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((268107616202220235 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 3)],
  term ((-11329359278864355865 : Rat) / 2576367455419018) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((268107616202220235 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 3), (15, 1)],
  term ((11329359278864355865 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 1)],
  term ((-11329359278864355865 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 3)],
  term ((4447755964 : Rat) / 25734207) [(3, 1), (14, 1), (15, 1)],
  term ((-4447755964 : Rat) / 25734207) [(3, 1), (14, 1), (15, 3)],
  term ((-9639941782 : Rat) / 25734207) [(3, 1), (14, 2), (15, 1)],
  term ((-4447755964 : Rat) / 25734207) [(3, 1), (14, 3), (15, 1)],
  term ((9639941782 : Rat) / 25734207) [(3, 1), (15, 1)],
  term ((-9639941782 : Rat) / 25734207) [(3, 1), (15, 3)],
  term ((87209152800 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1)],
  term ((-6149654400 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-87209152800 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (15, 2)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-4200880065858701610 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((4200880065858701610 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 3)],
  term ((-925633376 : Rat) / 8578069) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((768078488 : Rat) / 8578069) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-768078488 : Rat) / 8578069) [(4, 1), (5, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (5, 1), (15, 3)],
  term ((9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)],
  term ((-28514587200 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((-1373552627318605140 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1578022768 : Rat) / 8578069) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (15, 1)],
  term ((49857526800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)],
  term ((-3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-101740640400 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((101740640400 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-176022567800 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)],
  term ((172947740600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-6062948805781074 : Rat) / 75775513394677) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-22837769600 : Rat) / 150171761) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((298974093133180658 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 1), (11, 1), (15, 3)],
  term ((198722500200 : Rat) / 150171761) [(4, 1), (11, 2)],
  term ((173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4900864352211187605 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((4900864352211187605 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((16661845519541422315 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-16958075442106158595 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((-198722500200 : Rat) / 150171761) [(4, 1), (11, 2), (14, 1)],
  term ((-114574107653603600 : Rat) / 75775513394677) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-1100099335689382520 : Rat) / 1288183727709509) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((3047859165800643720 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 4)],
  term ((-19144994829666132105 : Rat) / 2576367455419018) [(4, 1), (11, 3), (14, 1), (15, 1)],
  term ((19144994829666132105 : Rat) / 2576367455419018) [(4, 1), (11, 3), (15, 1)],
  term ((4547240672 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4547240672 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((2488752364 : Rat) / 8578069) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2488752364 : Rat) / 8578069) [(4, 1), (12, 1), (15, 2)],
  term ((-412834718 : Rat) / 25734207) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-975615346 : Rat) / 25734207) [(4, 1), (13, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (13, 1), (15, 3)],
  term ((19469637760 : Rat) / 25734207) [(4, 1), (14, 1), (15, 2)],
  term ((-11121657952 : Rat) / 25734207) [(4, 1), (14, 2), (15, 2)],
  term ((-2782659936 : Rat) / 8578069) [(4, 1), (15, 2)],
  term ((-231408344 : Rat) / 8578069) [(4, 1), (15, 4)],
  term ((6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((-6149654400 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 2), (11, 1), (15, 1)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((296229922564736280 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (14, 1), (15, 2)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)],
  term ((-925633376 : Rat) / 8578069) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((925633376 : Rat) / 8578069) [(4, 2), (13, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 2), (14, 1), (15, 2)],
  term ((-462816688 : Rat) / 8578069) [(4, 2), (15, 2)],
  term ((19009724800 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9504862400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (14, 1), (15, 2)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (15, 2)],
  term ((3156045536 : Rat) / 25734207) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-1578022768 : Rat) / 25734207) [(5, 1), (7, 1), (15, 2)],
  term ((49857526800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 3)],
  term ((-1449418188 : Rat) / 8578069) [(5, 1), (10, 1), (15, 3)],
  term ((-43604576400 : Rat) / 150171761) [(5, 1), (11, 1)],
  term ((3593174400 : Rat) / 8833633) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-101740640400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((172947740600 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-21300356000 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((43604576400 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)],
  term ((88257011884129342 : Rat) / 1288183727709509) [(5, 1), (11, 1), (15, 2)],
  term ((173083836105260280 : Rat) / 75775513394677) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-4900864352211187605 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 3)],
  term ((16661845519541422315 : Rat) / 2576367455419018) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1026041855048198450 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((2100440032929350805 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-3805095351497464605 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)],
  term ((-873361652230108845 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 3)],
  term ((-19144994829666132105 : Rat) / 2576367455419018) [(5, 1), (11, 3), (15, 2)],
  term ((4547240672 : Rat) / 8578069) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((2488752364 : Rat) / 8578069) [(5, 1), (12, 1), (15, 3)],
  term ((-412834718 : Rat) / 25734207) [(5, 1), (13, 1), (15, 2)],
  term ((-10427432920 : Rat) / 25734207) [(5, 1), (14, 1), (15, 3)],
  term ((-384039244 : Rat) / 8578069) [(5, 1), (14, 2), (15, 1)],
  term ((384039244 : Rat) / 8578069) [(5, 1), (15, 1)],
  term ((2630029036 : Rat) / 8578069) [(5, 1), (15, 3)],
  term ((-87209152800 : Rat) / 150171761) [(5, 2), (11, 1), (15, 1)],
  term ((-4200880065858701610 : Rat) / 1288183727709509) [(5, 2), (11, 2), (15, 2)],
  term ((768078488 : Rat) / 8578069) [(5, 2), (15, 2)],
  term ((-4752431200 : Rat) / 150171761) [(7, 1), (11, 1)],
  term ((9504862400 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1)],
  term ((-9504862400 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((4752431200 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2)],
  term ((-9504862400 : Rat) / 150171761) [(7, 1), (11, 1), (14, 3)],
  term ((4752431200 : Rat) / 150171761) [(7, 1), (11, 1), (15, 2)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((228925437886434190 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 3), (15, 1)],
  term ((-228925437886434190 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)],
  term ((228925437886434190 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 3)],
  term ((1578022768 : Rat) / 25734207) [(7, 1), (14, 1), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(7, 1), (14, 1), (15, 3)],
  term ((789011384 : Rat) / 25734207) [(7, 1), (14, 2), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(7, 1), (14, 3), (15, 1)],
  term ((-789011384 : Rat) / 25734207) [(7, 1), (15, 1)],
  term ((789011384 : Rat) / 25734207) [(7, 1), (15, 3)],
  term ((-24928763400 : Rat) / 150171761) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((24928763400 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)],
  term ((-24928763400 : Rat) / 150171761) [(10, 1), (11, 1), (15, 3)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((2401645741788882285 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 2)],
  term ((-2401645741788882285 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 4)],
  term ((724709094 : Rat) / 8578069) [(10, 1), (14, 2), (15, 2)],
  term ((-724709094 : Rat) / 8578069) [(10, 1), (15, 2)],
  term ((724709094 : Rat) / 8578069) [(10, 1), (15, 4)],
  term ((1796587200 : Rat) / 8833633) [(11, 1), (12, 1), (13, 1)],
  term ((-1796587200 : Rat) / 8833633) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1796587200 : Rat) / 8833633) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((50870320200 : Rat) / 150171761) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-50870320200 : Rat) / 150171761) [(11, 1), (12, 1), (15, 1)],
  term ((50870320200 : Rat) / 150171761) [(11, 1), (12, 1), (15, 3)],
  term ((86473870300 : Rat) / 150171761) [(11, 1), (13, 1)],
  term ((-86473870300 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)],
  term ((-86473870300 : Rat) / 150171761) [(11, 1), (13, 1), (15, 2)],
  term ((-10650178000 : Rat) / 150171761) [(11, 1), (14, 1), (15, 1)],
  term ((10650178000 : Rat) / 150171761) [(11, 1), (14, 1), (15, 3)],
  term ((142893026595421129 : Rat) / 1288183727709509) [(11, 1), (14, 2), (15, 1)],
  term ((10650178000 : Rat) / 150171761) [(11, 1), (14, 3), (15, 1)],
  term ((-142893026595421129 : Rat) / 1288183727709509) [(11, 1), (15, 1)],
  term ((142893026595421129 : Rat) / 1288183727709509) [(11, 1), (15, 3)],
  term ((-99361250100 : Rat) / 150171761) [(11, 2)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((86541918052630140 : Rat) / 75775513394677) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((4900864352211187605 : Rat) / 2576367455419018) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-4900864352211187605 : Rat) / 2576367455419018) [(11, 2), (12, 1), (15, 2)],
  term ((4900864352211187605 : Rat) / 2576367455419018) [(11, 2), (12, 1), (15, 4)],
  term ((-16661845519541422315 : Rat) / 5152734910838036) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((16661845519541422315 : Rat) / 5152734910838036) [(11, 2), (13, 1), (15, 1)],
  term ((-16661845519541422315 : Rat) / 5152734910838036) [(11, 2), (13, 1), (15, 3)],
  term ((-513020927524099225 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 4)],
  term ((99361250100 : Rat) / 150171761) [(11, 2), (14, 2)],
  term ((1486900842579729825 : Rat) / 1288183727709509) [(11, 2), (14, 2), (15, 2)],
  term ((513020927524099225 : Rat) / 1288183727709509) [(11, 2), (14, 3), (15, 2)],
  term ((-634573183295672925 : Rat) / 1288183727709509) [(11, 2), (15, 2)],
  term ((1486900842579729825 : Rat) / 1288183727709509) [(11, 2), (15, 4)],
  term ((19144994829666132105 : Rat) / 5152734910838036) [(11, 3), (14, 2), (15, 1)],
  term ((-19144994829666132105 : Rat) / 5152734910838036) [(11, 3), (15, 1)],
  term ((19144994829666132105 : Rat) / 5152734910838036) [(11, 3), (15, 3)],
  term ((-2273620336 : Rat) / 8578069) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2273620336 : Rat) / 8578069) [(12, 1), (13, 1), (15, 1)],
  term ((-2273620336 : Rat) / 8578069) [(12, 1), (13, 1), (15, 3)],
  term ((-1244376182 : Rat) / 8578069) [(12, 1), (14, 2), (15, 2)],
  term ((1244376182 : Rat) / 8578069) [(12, 1), (15, 2)],
  term ((-1244376182 : Rat) / 8578069) [(12, 1), (15, 4)],
  term ((206417359 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)],
  term ((-206417359 : Rat) / 25734207) [(13, 1), (15, 1)],
  term ((206417359 : Rat) / 25734207) [(13, 1), (15, 3)],
  term ((-5213716460 : Rat) / 25734207) [(14, 1), (15, 2)],
  term ((5213716460 : Rat) / 25734207) [(14, 1), (15, 4)],
  term ((-1507034140 : Rat) / 8578069) [(14, 2), (15, 2)],
  term ((5213716460 : Rat) / 25734207) [(14, 3), (15, 2)],
  term ((1507034140 : Rat) / 8578069) [(15, 2)],
  term ((-1507034140 : Rat) / 8578069) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 69. -/
theorem rs_R013_ueqv_R013YNNN_block_15_0000_0069_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_15_0000_0069
      rs_R013_ueqv_R013YNNN_block_15_0000_0069 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
