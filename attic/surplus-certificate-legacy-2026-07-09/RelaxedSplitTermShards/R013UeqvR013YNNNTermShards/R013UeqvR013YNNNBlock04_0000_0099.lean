/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 4:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_04_0000_0099 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0000 : Poly :=
[
  term (-3 : Rat) []
]

/-- Partial product 0 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0000 : Poly :=
[
  term (6 : Rat) [(6, 1)],
  term (-3 : Rat) [(6, 2)],
  term (-3 : Rat) [(7, 2)],
  term (-6 : Rat) [(12, 1)],
  term (3 : Rat) [(12, 2)],
  term (3 : Rat) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0000
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0001 : Poly :=
[
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)]
]

/-- Partial product 1 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0001 : Poly :=
[
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (6, 1), (10, 1), (11, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (6, 2), (10, 1), (11, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (7, 2), (10, 1), (11, 1)],
  term ((100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (12, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (12, 2)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0001
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0002 : Poly :=
[
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 2 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0002 : Poly :=
[
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0002
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0003 : Poly :=
[
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 3 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0003 : Poly :=
[
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (6, 1), (10, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (6, 2), (10, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (7, 2), (10, 1), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 2), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0003
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0004 : Poly :=
[
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)]
]

/-- Partial product 4 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0004 : Poly :=
[
  term ((100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1), (12, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (6, 2), (11, 1), (12, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (7, 2), (11, 1), (12, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (13, 2)],
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0004
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0005 : Poly :=
[
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 5 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0005 : Poly :=
[
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0005
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0006 : Poly :=
[
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 6 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0006 : Poly :=
[
  term ((-6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (6, 2), (12, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (7, 2), (12, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 2), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0006
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0007 : Poly :=
[
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (10, 1)]
]

/-- Partial product 7 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0007 : Poly :=
[
  term (1152 : Rat) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term (-576 : Rat) [(0, 1), (1, 1), (6, 2), (7, 1), (10, 1)],
  term (-1152 : Rat) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term (576 : Rat) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 2)],
  term (576 : Rat) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 2)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0007
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0008 : Poly :=
[
  term (576 : Rat) [(0, 1), (1, 1), (7, 1), (12, 1)]
]

/-- Partial product 8 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0008 : Poly :=
[
  term (-1152 : Rat) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term (576 : Rat) [(0, 1), (1, 1), (6, 2), (7, 1), (12, 1)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 2)],
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (12, 3)],
  term (576 : Rat) [(0, 1), (1, 1), (7, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0008
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0009 : Poly :=
[
  term ((-11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1)]
]

/-- Partial product 9 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0009 : Poly :=
[
  term ((23214846720 : Rat) / 150171761) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (6, 2), (10, 1), (11, 1)],
  term ((-11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (7, 2), (10, 1), (11, 1)],
  term ((-23214846720 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 2)],
  term ((11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0009
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0010 : Poly :=
[
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 10 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0010 : Poly :=
[
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (6, 2), (10, 1), (11, 1), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (7, 2), (10, 1), (11, 1), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0010
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0011 : Poly :=
[
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 11 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0011 : Poly :=
[
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 2), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 2), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0011
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0012 : Poly :=
[
  term ((-559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 12 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0012 : Poly :=
[
  term ((1118263206175914864 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((-1118263206175914864 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0012
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0013 : Poly :=
[
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 13 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0013 : Poly :=
[
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (6, 2), (10, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (7, 2), (10, 1), (12, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0013
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0014 : Poly :=
[
  term ((33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (10, 1), (15, 1)]
]

/-- Partial product 14 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0014 : Poly :=
[
  term ((-33053710229 : Rat) / 8578069) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (6, 2), (10, 1), (15, 1)],
  term ((33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (7, 2), (10, 1), (15, 1)],
  term ((33053710229 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0014
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0015 : Poly :=
[
  term ((11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1)]
]

/-- Partial product 15 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0015 : Poly :=
[
  term ((-23214846720 : Rat) / 150171761) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (6, 2), (11, 1), (12, 1)],
  term ((11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (7, 2), (11, 1), (12, 1)],
  term ((-11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 2)],
  term ((23214846720 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0015
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0016 : Poly :=
[
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)]
]

/-- Partial product 16 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0016 : Poly :=
[
  term ((-15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (6, 2), (11, 1), (12, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (7, 2), (11, 1), (12, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2), (13, 2)],
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 3)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0016
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0017 : Poly :=
[
  term ((559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 17 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0017 : Poly :=
[
  term ((-1118263206175914864 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((1118263206175914864 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0017
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0018 : Poly :=
[
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)]
]

/-- Partial product 18 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0018 : Poly :=
[
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 1), (11, 2), (12, 2), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 2), (11, 2), (12, 2), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 2), (11, 2), (12, 2), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (13, 2), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 3), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0018
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0019 : Poly :=
[
  term ((-33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (12, 1), (15, 1)]
]

/-- Partial product 19 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0019 : Poly :=
[
  term ((33053710229 : Rat) / 8578069) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (6, 2), (12, 1), (15, 1)],
  term ((-33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (7, 2), (12, 1), (15, 1)],
  term ((33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-33053710229 : Rat) / 8578069) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0019
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0020 : Poly :=
[
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (12, 2), (15, 1)]
]

/-- Partial product 20 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0020 : Poly :=
[
  term ((-65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (6, 2), (12, 2), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (7, 2), (12, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (12, 2), (13, 2), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (12, 3), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0020
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0021 : Poly :=
[
  term ((6109752000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (11, 1)]
]

/-- Partial product 21 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0021 : Poly :=
[
  term ((-12219504000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((6109752000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (6, 2), (11, 1)],
  term ((6109752000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (7, 2), (11, 1)],
  term ((12219504000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((-6109752000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-6109752000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0021
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0022 : Poly :=
[
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 22 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0022 : Poly :=
[
  term ((-588615634026439800 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 2), (15, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (6, 2), (11, 2), (15, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (7, 2), (11, 2), (15, 1)],
  term ((588615634026439800 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0022
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0023 : Poly :=
[
  term ((1322644080 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (15, 1)]
]

/-- Partial product 23 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0023 : Poly :=
[
  term ((-2645288160 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (6, 2), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (7, 2), (15, 1)],
  term ((2645288160 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0023
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0024 : Poly :=
[
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 24 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0024 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (9, 1), (10, 1), (11, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (9, 1), (10, 1), (11, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0024
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0025 : Poly :=
[
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 25 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0025 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0025
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0026 : Poly :=
[
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 26 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0026 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0026
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0027 : Poly :=
[
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1)]
]

/-- Partial product 27 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0027 : Poly :=
[
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (9, 1), (11, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (9, 1), (11, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 2)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0027
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0028 : Poly :=
[
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 28 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0028 : Poly :=
[
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0028
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0029 : Poly :=
[
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (15, 1)]
]

/-- Partial product 29 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0029 : Poly :=
[
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (9, 1), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (9, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0029
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0030 : Poly :=
[
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 30 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0030 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0030
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0031 : Poly :=
[
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 31 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0031 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (10, 1), (11, 2), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (10, 1), (11, 2), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (10, 1), (11, 2), (15, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (12, 2), (15, 2)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0031
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0032 : Poly :=
[
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (15, 2)]
]

/-- Partial product 32 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0032 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (10, 1), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (10, 1), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (10, 1), (15, 2)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (12, 1), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (12, 2), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0032
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0033 : Poly :=
[
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 33 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0033 : Poly :=
[
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (11, 1), (14, 1), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (11, 1), (14, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0033
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0034 : Poly :=
[
  term ((-2780979264 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 34 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0034 : Poly :=
[
  term ((5561958528 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2780979264 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-2780979264 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (11, 1), (15, 1)],
  term ((-5561958528 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((2780979264 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1)],
  term ((2780979264 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0034
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0035 : Poly :=
[
  term ((43764134400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)]
]

/-- Partial product 35 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0035 : Poly :=
[
  term ((-87528268800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (11, 2)],
  term ((43764134400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (11, 2)],
  term ((43764134400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (11, 2)],
  term ((87528268800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((-43764134400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 2)],
  term ((-43764134400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0035
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0036 : Poly :=
[
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (14, 1)]
]

/-- Partial product 36 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0036 : Poly :=
[
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (11, 2), (14, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (11, 2), (14, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (11, 2), (14, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1), (14, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 2), (14, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0036
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0037 : Poly :=
[
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 37 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0037 : Poly :=
[
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (11, 3), (14, 1), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (11, 3), (14, 1), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (11, 3), (14, 1), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0037
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0038 : Poly :=
[
  term ((2108125969554437280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)]
]

/-- Partial product 38 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0038 : Poly :=
[
  term ((-4216251939108874560 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (11, 3), (15, 1)],
  term ((2108125969554437280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (11, 3), (15, 1)],
  term ((2108125969554437280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (11, 3), (15, 1)],
  term ((4216251939108874560 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((-2108125969554437280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 2), (15, 1)],
  term ((-2108125969554437280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0038
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0039 : Poly :=
[
  term ((-165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1)]
]

/-- Partial product 39 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0039 : Poly :=
[
  term ((331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (6, 2), (11, 1)],
  term ((-165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (7, 2), (11, 1)],
  term ((-331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 2)],
  term ((165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0039
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0040 : Poly :=
[
  term ((-7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 40 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0040 : Poly :=
[
  term ((15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((-7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (6, 2), (11, 2), (15, 1)],
  term ((-7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (7, 2), (11, 2), (15, 1)],
  term ((-15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0040
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0041 : Poly :=
[
  term ((-5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (15, 1)]
]

/-- Partial product 41 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0041 : Poly :=
[
  term ((11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (6, 2), (15, 1)],
  term ((-5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (7, 2), (15, 1)],
  term ((-11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (12, 2), (15, 1)],
  term ((5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0041
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0042 : Poly :=
[
  term ((4244800000 : Rat) / 8833633) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 42 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0042 : Poly :=
[
  term ((-8489600000 : Rat) / 8833633) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((4244800000 : Rat) / 8833633) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((4244800000 : Rat) / 8833633) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((8489600000 : Rat) / 8833633) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-4244800000 : Rat) / 8833633) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((-4244800000 : Rat) / 8833633) [(0, 1), (3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0042
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0043 : Poly :=
[
  term ((47789922400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 43 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0043 : Poly :=
[
  term ((-95579844800 : Rat) / 150171761) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((47789922400 : Rat) / 150171761) [(0, 1), (3, 1), (6, 2), (11, 1), (12, 1)],
  term ((47789922400 : Rat) / 150171761) [(0, 1), (3, 1), (7, 2), (11, 1), (12, 1)],
  term ((-47789922400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 2)],
  term ((95579844800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((-47789922400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0043
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0044 : Poly :=
[
  term ((186788054400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 44 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0044 : Poly :=
[
  term ((-373576108800 : Rat) / 150171761) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((186788054400 : Rat) / 150171761) [(0, 1), (3, 1), (6, 2), (11, 1), (14, 1)],
  term ((186788054400 : Rat) / 150171761) [(0, 1), (3, 1), (7, 2), (11, 1), (14, 1)],
  term ((373576108800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-186788054400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-186788054400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0044
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0045 : Poly :=
[
  term ((2302048878051871630 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 45 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0045 : Poly :=
[
  term ((-4604097756103743260 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((2302048878051871630 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((2302048878051871630 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((-2302048878051871630 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((4604097756103743260 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2302048878051871630 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0045
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0046 : Poly :=
[
  term ((8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 46 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0046 : Poly :=
[
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0046
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0047 : Poly :=
[
  term ((204472754648260000 : Rat) / 75775513394677) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 47 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0047 : Poly :=
[
  term ((-408945509296520000 : Rat) / 75775513394677) [(0, 1), (3, 1), (6, 1), (11, 2), (15, 1)],
  term ((204472754648260000 : Rat) / 75775513394677) [(0, 1), (3, 1), (6, 2), (11, 2), (15, 1)],
  term ((204472754648260000 : Rat) / 75775513394677) [(0, 1), (3, 1), (7, 2), (11, 2), (15, 1)],
  term ((408945509296520000 : Rat) / 75775513394677) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-204472754648260000 : Rat) / 75775513394677) [(0, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-204472754648260000 : Rat) / 75775513394677) [(0, 1), (3, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0047
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0048 : Poly :=
[
  term ((141208943048 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 48 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0048 : Poly :=
[
  term ((-282417886096 : Rat) / 25734207) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((141208943048 : Rat) / 25734207) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1)],
  term ((141208943048 : Rat) / 25734207) [(0, 1), (3, 1), (7, 2), (12, 1), (15, 1)],
  term ((-141208943048 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (13, 2), (15, 1)],
  term ((282417886096 : Rat) / 25734207) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-141208943048 : Rat) / 25734207) [(0, 1), (3, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0048
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0049 : Poly :=
[
  term ((2490981536 : Rat) / 8578069) [(0, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 49 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0049 : Poly :=
[
  term ((-4981963072 : Rat) / 8578069) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((2490981536 : Rat) / 8578069) [(0, 1), (3, 1), (6, 2), (14, 1), (15, 1)],
  term ((2490981536 : Rat) / 8578069) [(0, 1), (3, 1), (7, 2), (14, 1), (15, 1)],
  term ((4981963072 : Rat) / 8578069) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2490981536 : Rat) / 8578069) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2490981536 : Rat) / 8578069) [(0, 1), (3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0049
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0050 : Poly :=
[
  term ((-3428349440 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 50 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0050 : Poly :=
[
  term ((6856698880 : Rat) / 25734207) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-3428349440 : Rat) / 25734207) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((-3428349440 : Rat) / 25734207) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((-6856698880 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((3428349440 : Rat) / 25734207) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((3428349440 : Rat) / 25734207) [(0, 1), (3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0050
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0051 : Poly :=
[
  term ((-362699016000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 1)]
]

/-- Partial product 51 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0051 : Poly :=
[
  term ((725398032000 : Rat) / 150171761) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-362699016000 : Rat) / 150171761) [(0, 1), (4, 1), (6, 2), (11, 1), (13, 1)],
  term ((-362699016000 : Rat) / 150171761) [(0, 1), (4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-725398032000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((362699016000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 2), (13, 1)],
  term ((362699016000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0051
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0052 : Poly :=
[
  term ((-331677411137401352 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 52 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0052 : Poly :=
[
  term ((663354822274802704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-331677411137401352 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 2), (11, 1), (15, 1)],
  term ((-331677411137401352 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-663354822274802704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((331677411137401352 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 2), (15, 1)],
  term ((331677411137401352 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0052
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0053 : Poly :=
[
  term ((160247695200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2)]
]

/-- Partial product 53 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0053 : Poly :=
[
  term ((-320495390400 : Rat) / 150171761) [(0, 1), (4, 1), (6, 1), (11, 2)],
  term ((160247695200 : Rat) / 150171761) [(0, 1), (4, 1), (6, 2), (11, 2)],
  term ((160247695200 : Rat) / 150171761) [(0, 1), (4, 1), (7, 2), (11, 2)],
  term ((320495390400 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 1)],
  term ((-160247695200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 2)],
  term ((-160247695200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0053
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0054 : Poly :=
[
  term ((-17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 54 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0054 : Poly :=
[
  term ((34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0054
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0055 : Poly :=
[
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (15, 2)]
]

/-- Partial product 55 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0055 : Poly :=
[
  term ((3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 1), (11, 2), (15, 2)],
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 2), (11, 2), (15, 2)],
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 2), (11, 2), (15, 2)],
  term ((-3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 2), (15, 2)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0055
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0056 : Poly :=
[
  term ((7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (15, 1)]
]

/-- Partial product 56 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0056 : Poly :=
[
  term ((-15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 1), (11, 3), (15, 1)],
  term ((7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 2), (11, 3), (15, 1)],
  term ((7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 2), (11, 3), (15, 1)],
  term ((15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 1), (15, 1)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 2), (15, 1)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0056
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0057 : Poly :=
[
  term ((-34751747600 : Rat) / 8578069) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 57 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0057 : Poly :=
[
  term ((69503495200 : Rat) / 8578069) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-34751747600 : Rat) / 8578069) [(0, 1), (4, 1), (6, 2), (13, 1), (15, 1)],
  term ((-34751747600 : Rat) / 8578069) [(0, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-69503495200 : Rat) / 8578069) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((34751747600 : Rat) / 8578069) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1)],
  term ((34751747600 : Rat) / 8578069) [(0, 1), (4, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0057
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0058 : Poly :=
[
  term ((8968047208 : Rat) / 25734207) [(0, 1), (4, 1), (15, 2)]
]

/-- Partial product 58 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0058 : Poly :=
[
  term ((-17936094416 : Rat) / 25734207) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (4, 1), (6, 2), (15, 2)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (4, 1), (7, 2), (15, 2)],
  term ((17936094416 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (4, 1), (12, 2), (15, 2)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0058
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0059 : Poly :=
[
  term ((-155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1)]
]

/-- Partial product 59 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0059 : Poly :=
[
  term ((310403428000 : Rat) / 150171761) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1)],
  term ((-155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (6, 2), (10, 1), (11, 1)],
  term ((-155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (7, 2), (10, 1), (11, 1)],
  term ((-310403428000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 2)],
  term ((155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0059
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0060 : Poly :=
[
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 60 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0060 : Poly :=
[
  term ((14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((-14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0060_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0060
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0061 : Poly :=
[
  term ((-5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 61 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0061 : Poly :=
[
  term ((10299513560 : Rat) / 25734207) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (6, 2), (10, 1), (15, 1)],
  term ((-5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (7, 2), (10, 1), (15, 1)],
  term ((-10299513560 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (12, 2), (15, 1)],
  term ((5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0061_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0061
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0062 : Poly :=
[
  term ((5342047600 : Rat) / 6529207) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 62 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0062 : Poly :=
[
  term ((-10684095200 : Rat) / 6529207) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((5342047600 : Rat) / 6529207) [(0, 1), (5, 1), (6, 2), (11, 1)],
  term ((5342047600 : Rat) / 6529207) [(0, 1), (5, 1), (7, 2), (11, 1)],
  term ((10684095200 : Rat) / 6529207) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((-5342047600 : Rat) / 6529207) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-5342047600 : Rat) / 6529207) [(0, 1), (5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0062_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0062
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0063 : Poly :=
[
  term ((456746067200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 63 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0063 : Poly :=
[
  term ((-913492134400 : Rat) / 150171761) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((456746067200 : Rat) / 150171761) [(0, 1), (5, 1), (6, 2), (11, 1), (12, 1)],
  term ((456746067200 : Rat) / 150171761) [(0, 1), (5, 1), (7, 2), (11, 1), (12, 1)],
  term ((-456746067200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((913492134400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-456746067200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0063_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0063
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0064 : Poly :=
[
  term ((38002621600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 64 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0064 : Poly :=
[
  term ((-76005243200 : Rat) / 150171761) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((38002621600 : Rat) / 150171761) [(0, 1), (5, 1), (6, 2), (11, 1), (14, 1)],
  term ((38002621600 : Rat) / 150171761) [(0, 1), (5, 1), (7, 2), (11, 1), (14, 1)],
  term ((76005243200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-38002621600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-38002621600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0064_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0064
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0065 : Poly :=
[
  term ((22001537536549018640 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 65 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0065 : Poly :=
[
  term ((-44003075073098037280 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((22001537536549018640 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((22001537536549018640 : Rat) / 1288183727709509) [(0, 1), (5, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((-22001537536549018640 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((44003075073098037280 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-22001537536549018640 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0065_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0065
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0066 : Poly :=
[
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 66 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0066 : Poly :=
[
  term ((-3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (5, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0066_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0066
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0067 : Poly :=
[
  term ((257327362475057995 : Rat) / 56007988161283) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 67 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0067 : Poly :=
[
  term ((-514654724950115990 : Rat) / 56007988161283) [(0, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((257327362475057995 : Rat) / 56007988161283) [(0, 1), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((257327362475057995 : Rat) / 56007988161283) [(0, 1), (5, 1), (7, 2), (11, 2), (15, 1)],
  term ((514654724950115990 : Rat) / 56007988161283) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-257327362475057995 : Rat) / 56007988161283) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-257327362475057995 : Rat) / 56007988161283) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0067_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0067
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0068 : Poly :=
[
  term ((110192629024 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 68 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0068 : Poly :=
[
  term ((-220385258048 : Rat) / 25734207) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((110192629024 : Rat) / 25734207) [(0, 1), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((110192629024 : Rat) / 25734207) [(0, 1), (5, 1), (7, 2), (12, 1), (15, 1)],
  term ((-110192629024 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((220385258048 : Rat) / 25734207) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-110192629024 : Rat) / 25734207) [(0, 1), (5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0068_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0068
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0069 : Poly :=
[
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 69 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0069 : Poly :=
[
  term ((17936094416 : Rat) / 25734207) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (5, 1), (6, 2), (14, 1), (15, 1)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-17936094416 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0069_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0069
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0070 : Poly :=
[
  term ((-516091364 : Rat) / 25734207) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 70 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0070 : Poly :=
[
  term ((1032182728 : Rat) / 25734207) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((-516091364 : Rat) / 25734207) [(0, 1), (5, 1), (6, 2), (15, 1)],
  term ((-516091364 : Rat) / 25734207) [(0, 1), (5, 1), (7, 2), (15, 1)],
  term ((-1032182728 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((516091364 : Rat) / 25734207) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((516091364 : Rat) / 25734207) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0070_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0070
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0071 : Poly :=
[
  term (-96 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1)]
]

/-- Partial product 71 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0071 : Poly :=
[
  term (192 : Rat) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term (-96 : Rat) [(0, 1), (6, 2), (7, 1), (10, 1), (11, 1)],
  term (-192 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term (96 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 2)],
  term (96 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 2)],
  term (-96 : Rat) [(0, 1), (7, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0071_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0071
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0072 : Poly :=
[
  term (-480 : Rat) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 72 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0072 : Poly :=
[
  term (960 : Rat) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term (-480 : Rat) [(0, 1), (6, 2), (7, 1), (11, 1)],
  term (-960 : Rat) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term (480 : Rat) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term (480 : Rat) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term (-480 : Rat) [(0, 1), (7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0072_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0072
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0073 : Poly :=
[
  term ((124976936000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 73 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0073 : Poly :=
[
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((124976936000 : Rat) / 150171761) [(0, 1), (6, 2), (7, 1), (11, 1), (12, 1)],
  term ((-124976936000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((249953872000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-124976936000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 3)],
  term ((124976936000 : Rat) / 150171761) [(0, 1), (7, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0073_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0073
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0074 : Poly :=
[
  term (192 : Rat) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 74 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0074 : Poly :=
[
  term (-384 : Rat) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term (192 : Rat) [(0, 1), (6, 2), (7, 1), (11, 1), (14, 1)],
  term (384 : Rat) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term (-192 : Rat) [(0, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term (-192 : Rat) [(0, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term (192 : Rat) [(0, 1), (7, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0074_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0074
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0075 : Poly :=
[
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 75 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0075 : Poly :=
[
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (6, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 3), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0075_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0075
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0076 : Poly :=
[
  term ((-21702412304 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 76 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0076 : Poly :=
[
  term ((43404824608 : Rat) / 25734207) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-21702412304 : Rat) / 25734207) [(0, 1), (6, 2), (7, 1), (12, 1), (15, 1)],
  term ((21702412304 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-43404824608 : Rat) / 25734207) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((21702412304 : Rat) / 25734207) [(0, 1), (7, 1), (12, 3), (15, 1)],
  term ((-21702412304 : Rat) / 25734207) [(0, 1), (7, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0076_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0076
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0077 : Poly :=
[
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 77 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0077 : Poly :=
[
  term ((865280966400 : Rat) / 150171761) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-865280966400 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0077_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0077
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0078 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 78 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0078 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0078_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0078
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0079 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 79 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0079 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0079_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0079
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0080 : Poly :=
[
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 80 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0080 : Poly :=
[
  term ((41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0080_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0080
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0081 : Poly :=
[
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 81 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0081 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(0, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0081_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0081
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0082 : Poly :=
[
  term ((5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 82 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0082 : Poly :=
[
  term ((-10086797184 : Rat) / 8578069) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (10, 1), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (10, 1), (15, 1)],
  term ((10086797184 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0082_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0082
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0083 : Poly :=
[
  term ((432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 83 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0083 : Poly :=
[
  term ((-865280966400 : Rat) / 150171761) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (11, 1)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (11, 1)],
  term ((865280966400 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0083_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0083
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0084 : Poly :=
[
  term ((15519571200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 84 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0084 : Poly :=
[
  term ((-31039142400 : Rat) / 150171761) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((15519571200 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (11, 1), (12, 1)],
  term ((15519571200 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (11, 1), (12, 1)],
  term ((-15519571200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((31039142400 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-15519571200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0084_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0084
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0085 : Poly :=
[
  term ((747580445303383440 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 85 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0085 : Poly :=
[
  term ((-1495160890606766880 : Rat) / 1288183727709509) [(0, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((747580445303383440 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((747580445303383440 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-747580445303383440 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((1495160890606766880 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-747580445303383440 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0085_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0085
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0086 : Poly :=
[
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 86 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0086 : Poly :=
[
  term ((-41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (11, 2), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (11, 2), (15, 1)],
  term ((41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0086_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0086
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0087 : Poly :=
[
  term ((7267524448 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 87 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0087 : Poly :=
[
  term ((-14535048896 : Rat) / 8578069) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((7267524448 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (12, 1), (15, 1)],
  term ((7267524448 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (12, 1), (15, 1)],
  term ((-7267524448 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((14535048896 : Rat) / 8578069) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-7267524448 : Rat) / 8578069) [(0, 1), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0087_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0087
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0088 : Poly :=
[
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 88 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0088 : Poly :=
[
  term ((10086797184 : Rat) / 8578069) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-10086797184 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0088_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0088
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0089 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 89 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0089 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(0, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (6, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (7, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0089_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0089
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0090 : Poly :=
[
  term ((-11314483974111990971 : Rat) / 15458204732514108) [(0, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 90 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0090 : Poly :=
[
  term ((11314483974111990971 : Rat) / 7729102366257054) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-11314483974111990971 : Rat) / 15458204732514108) [(0, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((-11314483974111990971 : Rat) / 15458204732514108) [(0, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-11314483974111990971 : Rat) / 7729102366257054) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((11314483974111990971 : Rat) / 15458204732514108) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((11314483974111990971 : Rat) / 15458204732514108) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0090_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0090
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0091 : Poly :=
[
  term ((229870109440 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2)]
]

/-- Partial product 91 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0091 : Poly :=
[
  term ((-459740218880 : Rat) / 150171761) [(0, 1), (6, 1), (10, 1), (11, 2)],
  term ((229870109440 : Rat) / 150171761) [(0, 1), (6, 2), (10, 1), (11, 2)],
  term ((229870109440 : Rat) / 150171761) [(0, 1), (7, 2), (10, 1), (11, 2)],
  term ((459740218880 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-229870109440 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 2)],
  term ((-229870109440 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0091_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0091
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0092 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 92 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0092 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (6, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (6, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (7, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 2), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0092_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0092
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0093 : Poly :=
[
  term ((-10958674105629509895 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 93 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0093 : Poly :=
[
  term ((21917348211259019790 : Rat) / 1288183727709509) [(0, 1), (6, 1), (10, 1), (11, 2), (15, 2)],
  term ((-10958674105629509895 : Rat) / 1288183727709509) [(0, 1), (6, 2), (10, 1), (11, 2), (15, 2)],
  term ((-10958674105629509895 : Rat) / 1288183727709509) [(0, 1), (7, 2), (10, 1), (11, 2), (15, 2)],
  term ((-21917348211259019790 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((10958674105629509895 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 2), (15, 2)],
  term ((10958674105629509895 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0093_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0093
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0094 : Poly :=
[
  term ((11072883171997218928 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (15, 1)]
]

/-- Partial product 94 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0094 : Poly :=
[
  term ((-22145766343994437856 : Rat) / 1288183727709509) [(0, 1), (6, 1), (10, 1), (11, 3), (15, 1)],
  term ((11072883171997218928 : Rat) / 1288183727709509) [(0, 1), (6, 2), (10, 1), (11, 3), (15, 1)],
  term ((11072883171997218928 : Rat) / 1288183727709509) [(0, 1), (7, 2), (10, 1), (11, 3), (15, 1)],
  term ((22145766343994437856 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-11072883171997218928 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((-11072883171997218928 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0094_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0094
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0095 : Poly :=
[
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 95 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0095 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(0, 1), (6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (6, 2), (10, 1), (12, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (7, 2), (10, 1), (12, 1), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (10, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0095_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0095
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0096 : Poly :=
[
  term ((245722436 : Rat) / 8578069) [(0, 1), (10, 1), (15, 2)]
]

/-- Partial product 96 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0096 : Poly :=
[
  term ((-491444872 : Rat) / 8578069) [(0, 1), (6, 1), (10, 1), (15, 2)],
  term ((245722436 : Rat) / 8578069) [(0, 1), (6, 2), (10, 1), (15, 2)],
  term ((245722436 : Rat) / 8578069) [(0, 1), (7, 2), (10, 1), (15, 2)],
  term ((491444872 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-245722436 : Rat) / 8578069) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((-245722436 : Rat) / 8578069) [(0, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0096_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0096
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0097 : Poly :=
[
  term ((-398621411600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 97 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0097 : Poly :=
[
  term ((797242823200 : Rat) / 150171761) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-398621411600 : Rat) / 150171761) [(0, 1), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-398621411600 : Rat) / 150171761) [(0, 1), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 3)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0097_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0097
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0098 : Poly :=
[
  term ((8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 98 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0098 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (6, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0098_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0098
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013YNNN_coefficient_04_0099 : Poly :=
[
  term ((-3334867898796039704 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 99 for generator 4. -/
def rs_R013_ueqv_R013YNNN_partial_04_0099 : Poly :=
[
  term ((6669735797592079408 : Rat) / 1288183727709509) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3334867898796039704 : Rat) / 1288183727709509) [(0, 1), (6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3334867898796039704 : Rat) / 1288183727709509) [(0, 1), (7, 2), (11, 1), (12, 1), (15, 1)],
  term ((3334867898796039704 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6669735797592079408 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((3334867898796039704 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 4. -/
theorem rs_R013_ueqv_R013YNNN_partial_04_0099_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_04_0099
        rs_R013_ueqv_R013YNNN_generator_04_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_04_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_04_0000_0099 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_04_0000,
  rs_R013_ueqv_R013YNNN_partial_04_0001,
  rs_R013_ueqv_R013YNNN_partial_04_0002,
  rs_R013_ueqv_R013YNNN_partial_04_0003,
  rs_R013_ueqv_R013YNNN_partial_04_0004,
  rs_R013_ueqv_R013YNNN_partial_04_0005,
  rs_R013_ueqv_R013YNNN_partial_04_0006,
  rs_R013_ueqv_R013YNNN_partial_04_0007,
  rs_R013_ueqv_R013YNNN_partial_04_0008,
  rs_R013_ueqv_R013YNNN_partial_04_0009,
  rs_R013_ueqv_R013YNNN_partial_04_0010,
  rs_R013_ueqv_R013YNNN_partial_04_0011,
  rs_R013_ueqv_R013YNNN_partial_04_0012,
  rs_R013_ueqv_R013YNNN_partial_04_0013,
  rs_R013_ueqv_R013YNNN_partial_04_0014,
  rs_R013_ueqv_R013YNNN_partial_04_0015,
  rs_R013_ueqv_R013YNNN_partial_04_0016,
  rs_R013_ueqv_R013YNNN_partial_04_0017,
  rs_R013_ueqv_R013YNNN_partial_04_0018,
  rs_R013_ueqv_R013YNNN_partial_04_0019,
  rs_R013_ueqv_R013YNNN_partial_04_0020,
  rs_R013_ueqv_R013YNNN_partial_04_0021,
  rs_R013_ueqv_R013YNNN_partial_04_0022,
  rs_R013_ueqv_R013YNNN_partial_04_0023,
  rs_R013_ueqv_R013YNNN_partial_04_0024,
  rs_R013_ueqv_R013YNNN_partial_04_0025,
  rs_R013_ueqv_R013YNNN_partial_04_0026,
  rs_R013_ueqv_R013YNNN_partial_04_0027,
  rs_R013_ueqv_R013YNNN_partial_04_0028,
  rs_R013_ueqv_R013YNNN_partial_04_0029,
  rs_R013_ueqv_R013YNNN_partial_04_0030,
  rs_R013_ueqv_R013YNNN_partial_04_0031,
  rs_R013_ueqv_R013YNNN_partial_04_0032,
  rs_R013_ueqv_R013YNNN_partial_04_0033,
  rs_R013_ueqv_R013YNNN_partial_04_0034,
  rs_R013_ueqv_R013YNNN_partial_04_0035,
  rs_R013_ueqv_R013YNNN_partial_04_0036,
  rs_R013_ueqv_R013YNNN_partial_04_0037,
  rs_R013_ueqv_R013YNNN_partial_04_0038,
  rs_R013_ueqv_R013YNNN_partial_04_0039,
  rs_R013_ueqv_R013YNNN_partial_04_0040,
  rs_R013_ueqv_R013YNNN_partial_04_0041,
  rs_R013_ueqv_R013YNNN_partial_04_0042,
  rs_R013_ueqv_R013YNNN_partial_04_0043,
  rs_R013_ueqv_R013YNNN_partial_04_0044,
  rs_R013_ueqv_R013YNNN_partial_04_0045,
  rs_R013_ueqv_R013YNNN_partial_04_0046,
  rs_R013_ueqv_R013YNNN_partial_04_0047,
  rs_R013_ueqv_R013YNNN_partial_04_0048,
  rs_R013_ueqv_R013YNNN_partial_04_0049,
  rs_R013_ueqv_R013YNNN_partial_04_0050,
  rs_R013_ueqv_R013YNNN_partial_04_0051,
  rs_R013_ueqv_R013YNNN_partial_04_0052,
  rs_R013_ueqv_R013YNNN_partial_04_0053,
  rs_R013_ueqv_R013YNNN_partial_04_0054,
  rs_R013_ueqv_R013YNNN_partial_04_0055,
  rs_R013_ueqv_R013YNNN_partial_04_0056,
  rs_R013_ueqv_R013YNNN_partial_04_0057,
  rs_R013_ueqv_R013YNNN_partial_04_0058,
  rs_R013_ueqv_R013YNNN_partial_04_0059,
  rs_R013_ueqv_R013YNNN_partial_04_0060,
  rs_R013_ueqv_R013YNNN_partial_04_0061,
  rs_R013_ueqv_R013YNNN_partial_04_0062,
  rs_R013_ueqv_R013YNNN_partial_04_0063,
  rs_R013_ueqv_R013YNNN_partial_04_0064,
  rs_R013_ueqv_R013YNNN_partial_04_0065,
  rs_R013_ueqv_R013YNNN_partial_04_0066,
  rs_R013_ueqv_R013YNNN_partial_04_0067,
  rs_R013_ueqv_R013YNNN_partial_04_0068,
  rs_R013_ueqv_R013YNNN_partial_04_0069,
  rs_R013_ueqv_R013YNNN_partial_04_0070,
  rs_R013_ueqv_R013YNNN_partial_04_0071,
  rs_R013_ueqv_R013YNNN_partial_04_0072,
  rs_R013_ueqv_R013YNNN_partial_04_0073,
  rs_R013_ueqv_R013YNNN_partial_04_0074,
  rs_R013_ueqv_R013YNNN_partial_04_0075,
  rs_R013_ueqv_R013YNNN_partial_04_0076,
  rs_R013_ueqv_R013YNNN_partial_04_0077,
  rs_R013_ueqv_R013YNNN_partial_04_0078,
  rs_R013_ueqv_R013YNNN_partial_04_0079,
  rs_R013_ueqv_R013YNNN_partial_04_0080,
  rs_R013_ueqv_R013YNNN_partial_04_0081,
  rs_R013_ueqv_R013YNNN_partial_04_0082,
  rs_R013_ueqv_R013YNNN_partial_04_0083,
  rs_R013_ueqv_R013YNNN_partial_04_0084,
  rs_R013_ueqv_R013YNNN_partial_04_0085,
  rs_R013_ueqv_R013YNNN_partial_04_0086,
  rs_R013_ueqv_R013YNNN_partial_04_0087,
  rs_R013_ueqv_R013YNNN_partial_04_0088,
  rs_R013_ueqv_R013YNNN_partial_04_0089,
  rs_R013_ueqv_R013YNNN_partial_04_0090,
  rs_R013_ueqv_R013YNNN_partial_04_0091,
  rs_R013_ueqv_R013YNNN_partial_04_0092,
  rs_R013_ueqv_R013YNNN_partial_04_0093,
  rs_R013_ueqv_R013YNNN_partial_04_0094,
  rs_R013_ueqv_R013YNNN_partial_04_0095,
  rs_R013_ueqv_R013YNNN_partial_04_0096,
  rs_R013_ueqv_R013YNNN_partial_04_0097,
  rs_R013_ueqv_R013YNNN_partial_04_0098,
  rs_R013_ueqv_R013YNNN_partial_04_0099
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_04_0000_0099 : Poly :=
[
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (6, 1), (10, 1), (11, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (6, 1), (10, 1), (15, 1)],
  term ((100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1), (12, 1)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (6, 2), (10, 1), (11, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (6, 2), (10, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (6, 2), (11, 1), (12, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (6, 2), (12, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (7, 2), (10, 1), (11, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (7, 2), (10, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (7, 2), (11, 1), (12, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (7, 2), (12, 1), (15, 1)],
  term ((100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (12, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (12, 2)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1), (13, 2)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 1), (12, 2), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 2), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (13, 2)],
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 3)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 3), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 2), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 3), (15, 1)],
  term (1152 : Rat) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term (-1152 : Rat) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((23214846720 : Rat) / 150171761) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((1118263206175914864 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-33053710229 : Rat) / 8578069) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-23214846720 : Rat) / 150171761) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-1118263206175914864 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 1), (11, 2), (12, 2), (15, 1)],
  term ((33053710229 : Rat) / 8578069) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1)],
  term (-576 : Rat) [(0, 1), (1, 1), (6, 2), (7, 1), (10, 1)],
  term (576 : Rat) [(0, 1), (1, 1), (6, 2), (7, 1), (12, 1)],
  term ((-11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (6, 2), (10, 1), (11, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (6, 2), (10, 1), (11, 1), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 2), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (6, 2), (10, 1), (12, 1), (15, 1)],
  term ((33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (6, 2), (10, 1), (15, 1)],
  term ((11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (6, 2), (11, 1), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (6, 2), (11, 1), (12, 2)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (6, 2), (11, 2), (12, 2), (15, 1)],
  term ((-33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (6, 2), (12, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (6, 2), (12, 2), (15, 1)],
  term (-1152 : Rat) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term (576 : Rat) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 2)],
  term (576 : Rat) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 2)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 2)],
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (12, 3)],
  term ((-11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (7, 2), (10, 1), (11, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (7, 2), (10, 1), (11, 1), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 2), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (7, 2), (10, 1), (12, 1), (15, 1)],
  term ((33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (7, 2), (10, 1), (15, 1)],
  term ((11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (7, 2), (11, 1), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (7, 2), (11, 1), (12, 2)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 2), (11, 2), (12, 2), (15, 1)],
  term ((-33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (7, 2), (12, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (7, 2), (12, 2), (15, 1)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 3), (10, 1)],
  term (576 : Rat) [(0, 1), (1, 1), (7, 3), (12, 1)],
  term ((-23214846720 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-4180813440 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 3)],
  term ((11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-1118263206175914864 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-201390510918598728 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 3), (15, 1)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((33053710229 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-163106570133 : Rat) / 17156138) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (12, 3), (15, 1)],
  term ((-33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-11607423360 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 2)],
  term ((23214846720 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2), (13, 2)],
  term ((4180813440 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 3)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 4)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (13, 2), (15, 1)],
  term ((1118263206175914864 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((201390510918598728 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 3), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 4), (15, 1)],
  term ((33053710229 : Rat) / 17156138) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (12, 2), (13, 2), (15, 1)],
  term ((-33053710229 : Rat) / 8578069) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((163106570133 : Rat) / 17156138) [(0, 1), (1, 1), (12, 3), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (12, 4), (15, 1)],
  term ((-12219504000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-588615634026439800 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-2645288160 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((6109752000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (6, 2), (11, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (6, 2), (11, 2), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (6, 2), (15, 1)],
  term ((6109752000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (7, 2), (11, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (7, 2), (11, 2), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (7, 2), (15, 1)],
  term ((12219504000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((-6109752000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-6109752000 : Rat) / 8833633) [(0, 1), (2, 1), (3, 1), (11, 1), (13, 2)],
  term ((588615634026439800 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(0, 1), (2, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((2645288160 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (10, 1), (11, 2), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (10, 1), (15, 2)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((5561958528 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-87528268800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (11, 2)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (11, 2), (14, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (11, 3), (14, 1), (15, 1)],
  term ((-4216251939108874560 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (11, 3), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (9, 1), (10, 1), (11, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (9, 1), (11, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (9, 1), (11, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (9, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (10, 1), (11, 2), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (10, 1), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2780979264 : Rat) / 8578069) [(0, 1), (2, 1), (6, 2), (11, 1), (15, 1)],
  term ((43764134400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (11, 2)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (6, 2), (11, 2), (14, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (11, 3), (14, 1), (15, 1)],
  term ((2108125969554437280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 2), (11, 3), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (9, 1), (10, 1), (11, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (9, 1), (11, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (9, 1), (11, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (9, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (10, 1), (11, 2), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (10, 1), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2780979264 : Rat) / 8578069) [(0, 1), (2, 1), (7, 2), (11, 1), (15, 1)],
  term ((43764134400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (11, 2)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (7, 2), (11, 2), (14, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (11, 3), (14, 1), (15, 1)],
  term ((2108125969554437280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 2), (11, 3), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 2)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (13, 2), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (12, 2), (15, 2)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (13, 2), (15, 2)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (12, 1), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (12, 2), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (13, 2), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5561958528 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((2780979264 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((2780979264 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1)],
  term ((87528268800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1), (14, 1)],
  term ((-43764134400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 2)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 2), (14, 1)],
  term ((-43764134400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (13, 2)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (13, 2), (14, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((4216251939108874560 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-2108125969554437280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 2), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (13, 2), (14, 1), (15, 1)],
  term ((-2108125969554437280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (13, 2), (15, 1)],
  term ((331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (6, 2), (11, 1)],
  term ((-7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (6, 2), (11, 2), (15, 1)],
  term ((-5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (6, 2), (15, 1)],
  term ((-165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (7, 2), (11, 1)],
  term ((-7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (7, 2), (11, 2), (15, 1)],
  term ((-5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (7, 2), (15, 1)],
  term ((-331422756800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 2)],
  term ((165711378400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (13, 2)],
  term ((-15964691866758467660 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((7982345933379233830 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((-11249495056 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (12, 2), (15, 1)],
  term ((5624747528 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-8489600000 : Rat) / 8833633) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((-95579844800 : Rat) / 150171761) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-373576108800 : Rat) / 150171761) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-4604097756103743260 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((-408945509296520000 : Rat) / 75775513394677) [(0, 1), (3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-282417886096 : Rat) / 25734207) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-4981963072 : Rat) / 8578069) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((6856698880 : Rat) / 25734207) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((4244800000 : Rat) / 8833633) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((47789922400 : Rat) / 150171761) [(0, 1), (3, 1), (6, 2), (11, 1), (12, 1)],
  term ((186788054400 : Rat) / 150171761) [(0, 1), (3, 1), (6, 2), (11, 1), (14, 1)],
  term ((2302048878051871630 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((204472754648260000 : Rat) / 75775513394677) [(0, 1), (3, 1), (6, 2), (11, 2), (15, 1)],
  term ((141208943048 : Rat) / 25734207) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1)],
  term ((2490981536 : Rat) / 8578069) [(0, 1), (3, 1), (6, 2), (14, 1), (15, 1)],
  term ((-3428349440 : Rat) / 25734207) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((4244800000 : Rat) / 8833633) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((47789922400 : Rat) / 150171761) [(0, 1), (3, 1), (7, 2), (11, 1), (12, 1)],
  term ((186788054400 : Rat) / 150171761) [(0, 1), (3, 1), (7, 2), (11, 1), (14, 1)],
  term ((2302048878051871630 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((204472754648260000 : Rat) / 75775513394677) [(0, 1), (3, 1), (7, 2), (11, 2), (15, 1)],
  term ((141208943048 : Rat) / 25734207) [(0, 1), (3, 1), (7, 2), (12, 1), (15, 1)],
  term ((2490981536 : Rat) / 8578069) [(0, 1), (3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-3428349440 : Rat) / 25734207) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((8489600000 : Rat) / 8833633) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-47789922400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 2)],
  term ((373576108800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((23418244800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((-186788054400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-47789922400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 3)],
  term ((-4244800000 : Rat) / 8833633) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((-186788054400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2302048878051871630 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((408945509296520000 : Rat) / 75775513394677) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((1128060927083323260 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2302048878051871630 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 3), (15, 1)],
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-204472754648260000 : Rat) / 75775513394677) [(0, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-141208943048 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (13, 2), (15, 1)],
  term ((4981963072 : Rat) / 8578069) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6856698880 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-2490981536 : Rat) / 8578069) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((95282078512 : Rat) / 8578069) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-141208943048 : Rat) / 25734207) [(0, 1), (3, 1), (12, 3), (15, 1)],
  term ((-2490981536 : Rat) / 8578069) [(0, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((3428349440 : Rat) / 25734207) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((725398032000 : Rat) / 150171761) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((663354822274802704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-320495390400 : Rat) / 150171761) [(0, 1), (4, 1), (6, 1), (11, 2)],
  term ((34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 1), (11, 2), (15, 2)],
  term ((-15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 1), (11, 3), (15, 1)],
  term ((69503495200 : Rat) / 8578069) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-17936094416 : Rat) / 25734207) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((-362699016000 : Rat) / 150171761) [(0, 1), (4, 1), (6, 2), (11, 1), (13, 1)],
  term ((-331677411137401352 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 2), (11, 1), (15, 1)],
  term ((160247695200 : Rat) / 150171761) [(0, 1), (4, 1), (6, 2), (11, 2)],
  term ((-17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 2), (11, 2), (15, 2)],
  term ((7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (4, 1), (6, 2), (11, 3), (15, 1)],
  term ((-34751747600 : Rat) / 8578069) [(0, 1), (4, 1), (6, 2), (13, 1), (15, 1)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (4, 1), (6, 2), (15, 2)],
  term ((-362699016000 : Rat) / 150171761) [(0, 1), (4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-331677411137401352 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 2), (11, 1), (15, 1)],
  term ((160247695200 : Rat) / 150171761) [(0, 1), (4, 1), (7, 2), (11, 2)],
  term ((-17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 2), (11, 2), (15, 2)],
  term ((7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 2), (11, 3), (15, 1)],
  term ((-34751747600 : Rat) / 8578069) [(0, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (4, 1), (7, 2), (15, 2)],
  term ((-725398032000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-663354822274802704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((362699016000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 2), (13, 1)],
  term ((331677411137401352 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 2), (15, 1)],
  term ((331677411137401352 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (13, 2), (15, 1)],
  term ((362699016000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 3)],
  term ((320495390400 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 1)],
  term ((-34942549429765043400 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-160247695200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 2)],
  term ((17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 2), (15, 2)],
  term ((-160247695200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (13, 2)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 2), (15, 2)],
  term ((17471274714882521700 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 3), (15, 1)],
  term ((15438318725772121980 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 1), (15, 1)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 2), (15, 1)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (13, 2), (15, 1)],
  term ((-69503495200 : Rat) / 8578069) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((17936094416 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((34751747600 : Rat) / 8578069) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (4, 1), (12, 2), (15, 2)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (4, 1), (13, 2), (15, 2)],
  term ((34751747600 : Rat) / 8578069) [(0, 1), (4, 1), (13, 3), (15, 1)],
  term ((310403428000 : Rat) / 150171761) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1)],
  term ((14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((10299513560 : Rat) / 25734207) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-10684095200 : Rat) / 6529207) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((-913492134400 : Rat) / 150171761) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-76005243200 : Rat) / 150171761) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-44003075073098037280 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((-514654724950115990 : Rat) / 56007988161283) [(0, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-220385258048 : Rat) / 25734207) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((17936094416 : Rat) / 25734207) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((1032182728 : Rat) / 25734207) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((-155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (6, 2), (10, 1), (11, 1)],
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((-5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (6, 2), (10, 1), (15, 1)],
  term ((5342047600 : Rat) / 6529207) [(0, 1), (5, 1), (6, 2), (11, 1)],
  term ((456746067200 : Rat) / 150171761) [(0, 1), (5, 1), (6, 2), (11, 1), (12, 1)],
  term ((38002621600 : Rat) / 150171761) [(0, 1), (5, 1), (6, 2), (11, 1), (14, 1)],
  term ((22001537536549018640 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (5, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((257327362475057995 : Rat) / 56007988161283) [(0, 1), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((110192629024 : Rat) / 25734207) [(0, 1), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (5, 1), (6, 2), (14, 1), (15, 1)],
  term ((-516091364 : Rat) / 25734207) [(0, 1), (5, 1), (6, 2), (15, 1)],
  term ((-155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (7, 2), (10, 1), (11, 1)],
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((-5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (7, 2), (10, 1), (15, 1)],
  term ((5342047600 : Rat) / 6529207) [(0, 1), (5, 1), (7, 2), (11, 1)],
  term ((456746067200 : Rat) / 150171761) [(0, 1), (5, 1), (7, 2), (11, 1), (12, 1)],
  term ((38002621600 : Rat) / 150171761) [(0, 1), (5, 1), (7, 2), (11, 1), (14, 1)],
  term ((22001537536549018640 : Rat) / 1288183727709509) [(0, 1), (5, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (5, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((257327362475057995 : Rat) / 56007988161283) [(0, 1), (5, 1), (7, 2), (11, 2), (15, 1)],
  term ((110192629024 : Rat) / 25734207) [(0, 1), (5, 1), (7, 2), (12, 1), (15, 1)],
  term ((-8968047208 : Rat) / 25734207) [(0, 1), (5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-516091364 : Rat) / 25734207) [(0, 1), (5, 1), (7, 2), (15, 1)],
  term ((-310403428000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 2)],
  term ((155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 2)],
  term ((-14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((-10299513560 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (12, 2), (15, 1)],
  term ((5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (13, 2), (15, 1)],
  term ((10684095200 : Rat) / 6529207) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((-456746067200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((76005243200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((790625039600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-38002621600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-456746067200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 3)],
  term ((-5342047600 : Rat) / 6529207) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((-38002621600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 2), (14, 1)],
  term ((-22001537536549018640 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((3661185790806382340 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((514654724950115990 : Rat) / 56007988161283) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((645500775189350905 : Rat) / 21833622503551) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-22001537536549018640 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 3), (15, 1)],
  term ((-1830592895403191170 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-257327362475057995 : Rat) / 56007988161283) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-110192629024 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-17936094416 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1032182728 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((3744090668 : Rat) / 436173) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-110192629024 : Rat) / 25734207) [(0, 1), (5, 1), (12, 3), (15, 1)],
  term ((8968047208 : Rat) / 25734207) [(0, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((516091364 : Rat) / 25734207) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term (192 : Rat) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term (960 : Rat) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term (-384 : Rat) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((43404824608 : Rat) / 25734207) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((865280966400 : Rat) / 150171761) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-10086797184 : Rat) / 8578069) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-865280966400 : Rat) / 150171761) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((-31039142400 : Rat) / 150171761) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1495160890606766880 : Rat) / 1288183727709509) [(0, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-14535048896 : Rat) / 8578069) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((10086797184 : Rat) / 8578069) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((11314483974111990971 : Rat) / 7729102366257054) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-459740218880 : Rat) / 150171761) [(0, 1), (6, 1), (10, 1), (11, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (6, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((21917348211259019790 : Rat) / 1288183727709509) [(0, 1), (6, 1), (10, 1), (11, 2), (15, 2)],
  term ((-22145766343994437856 : Rat) / 1288183727709509) [(0, 1), (6, 1), (10, 1), (11, 3), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-491444872 : Rat) / 8578069) [(0, 1), (6, 1), (10, 1), (15, 2)],
  term ((797242823200 : Rat) / 150171761) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6669735797592079408 : Rat) / 1288183727709509) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term (-96 : Rat) [(0, 1), (6, 2), (7, 1), (10, 1), (11, 1)],
  term (-480 : Rat) [(0, 1), (6, 2), (7, 1), (11, 1)],
  term ((124976936000 : Rat) / 150171761) [(0, 1), (6, 2), (7, 1), (11, 1), (12, 1)],
  term (192 : Rat) [(0, 1), (6, 2), (7, 1), (11, 1), (14, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (6, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-21702412304 : Rat) / 25734207) [(0, 1), (6, 2), (7, 1), (12, 1), (15, 1)],
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (10, 1), (15, 1)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (11, 1)],
  term ((15519571200 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (11, 1), (12, 1)],
  term ((747580445303383440 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (11, 2), (15, 1)],
  term ((7267524448 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (6, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-11314483974111990971 : Rat) / 15458204732514108) [(0, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((229870109440 : Rat) / 150171761) [(0, 1), (6, 2), (10, 1), (11, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (6, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-10958674105629509895 : Rat) / 1288183727709509) [(0, 1), (6, 2), (10, 1), (11, 2), (15, 2)],
  term ((11072883171997218928 : Rat) / 1288183727709509) [(0, 1), (6, 2), (10, 1), (11, 3), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (6, 2), (10, 1), (12, 1), (15, 2)],
  term ((245722436 : Rat) / 8578069) [(0, 1), (6, 2), (10, 1), (15, 2)],
  term ((-398621411600 : Rat) / 150171761) [(0, 1), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (6, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3334867898796039704 : Rat) / 1288183727709509) [(0, 1), (6, 2), (11, 1), (12, 1), (15, 1)],
  term (-192 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term (96 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 2)],
  term (96 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 2)],
  term (-960 : Rat) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-124976936000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term (384 : Rat) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((322036317280 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term (-192 : Rat) [(0, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-124976936000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 3)],
  term (480 : Rat) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term (-192 : Rat) [(0, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 3), (15, 1)],
  term ((21702412304 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-43404824608 : Rat) / 25734207) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((21702412304 : Rat) / 25734207) [(0, 1), (7, 1), (12, 3), (15, 1)],
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (10, 1), (15, 1)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (11, 1)],
  term ((15519571200 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (11, 1), (12, 1)],
  term ((747580445303383440 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (11, 2), (15, 1)],
  term ((7267524448 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (12, 1), (15, 1)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (7, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-11314483974111990971 : Rat) / 15458204732514108) [(0, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((229870109440 : Rat) / 150171761) [(0, 1), (7, 2), (10, 1), (11, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (7, 2), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-10958674105629509895 : Rat) / 1288183727709509) [(0, 1), (7, 2), (10, 1), (11, 2), (15, 2)],
  term ((11072883171997218928 : Rat) / 1288183727709509) [(0, 1), (7, 2), (10, 1), (11, 3), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (7, 2), (10, 1), (12, 1), (15, 2)],
  term ((245722436 : Rat) / 8578069) [(0, 1), (7, 2), (10, 1), (15, 2)],
  term ((-398621411600 : Rat) / 150171761) [(0, 1), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3334867898796039704 : Rat) / 1288183727709509) [(0, 1), (7, 2), (11, 1), (12, 1), (15, 1)],
  term (-96 : Rat) [(0, 1), (7, 3), (10, 1), (11, 1)],
  term (-480 : Rat) [(0, 1), (7, 3), (11, 1)],
  term ((124976936000 : Rat) / 150171761) [(0, 1), (7, 3), (11, 1), (12, 1)],
  term (192 : Rat) [(0, 1), (7, 3), (11, 1), (14, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 3), (11, 2), (12, 1), (15, 1)],
  term ((-21702412304 : Rat) / 25734207) [(0, 1), (7, 3), (12, 1), (15, 1)],
  term ((-865280966400 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((428693424000 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 3)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((20650236832094443800 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 3), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((10086797184 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-21300006080 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 3), (15, 1)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((865280966400 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-15519571200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-401601340800 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-15519571200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 3)],
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-747580445303383440 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-19345206469989315960 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-747580445303383440 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 3), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-7267524448 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-10086797184 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((19578447488 : Rat) / 8578069) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-7267524448 : Rat) / 8578069) [(0, 1), (9, 1), (12, 3), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-11314483974111990971 : Rat) / 7729102366257054) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((10908186220135773371 : Rat) / 15458204732514108) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (12, 3), (15, 1)],
  term ((11314483974111990971 : Rat) / 15458204732514108) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((459740218880 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-21917348211259019790 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-229870109440 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 2)],
  term ((10768543577127870855 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 2), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 3), (15, 2)],
  term ((-229870109440 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (13, 2)],
  term ((10958674105629509895 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (13, 2), (15, 2)],
  term ((22145766343994437856 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-11072883171997218928 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((-11072883171997218928 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (13, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (13, 2), (15, 2)],
  term ((491444872 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-16502329924 : Rat) / 8578069) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (10, 1), (12, 3), (15, 2)],
  term ((-245722436 : Rat) / 8578069) [(0, 1), (10, 1), (13, 2), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((3334867898796039704 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 3)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-6669735797592079408 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 3), (13, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((3334867898796039704 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 3), (15, 1)],
  term (6 : Rat) [(6, 1)],
  term (-3 : Rat) [(6, 2)],
  term (-3 : Rat) [(7, 2)],
  term (-6 : Rat) [(12, 1)],
  term (3 : Rat) [(12, 2)],
  term (3 : Rat) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 0 through 99. -/
theorem rs_R013_ueqv_R013YNNN_block_04_0000_0099_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_04_0000_0099
      rs_R013_ueqv_R013YNNN_block_04_0000_0099 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
