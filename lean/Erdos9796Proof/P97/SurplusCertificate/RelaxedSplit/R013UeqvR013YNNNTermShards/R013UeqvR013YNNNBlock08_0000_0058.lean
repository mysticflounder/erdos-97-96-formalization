/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 8:0-58

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_08_0000_0058 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (8, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0000 : Poly :=
[
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 0 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0000 : Poly :=
[
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (3, 2), (11, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (8, 2), (11, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 3), (11, 1), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(0, 2), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 2), (2, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0000
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0001 : Poly :=
[
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)]
]

/-- Partial product 1 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0001 : Poly :=
[
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 2)],
  term ((100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 2), (11, 2)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (8, 2), (11, 2)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (9, 2), (11, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 3), (11, 2)],
  term ((100032307200 : Rat) / 150171761) [(0, 2), (2, 1), (8, 1), (11, 2)],
  term ((-100032307200 : Rat) / 150171761) [(0, 2), (2, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0001
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0002 : Poly :=
[
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)]
]

/-- Partial product 2 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0002 : Poly :=
[
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 2), (11, 3), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 2), (11, 3), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 2), (11, 3), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 3), (11, 3), (15, 1)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 2), (2, 1), (8, 1), (11, 3), (15, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 2), (2, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0002
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0003 : Poly :=
[
  term (-576 : Rat) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 3 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0003 : Poly :=
[
  term (1152 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term (-1152 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term (-576 : Rat) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term (-576 : Rat) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term (576 : Rat) [(0, 1), (7, 1), (8, 2), (11, 1)],
  term (576 : Rat) [(0, 1), (7, 1), (9, 2), (11, 1)],
  term (1152 : Rat) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term (-1152 : Rat) [(0, 2), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0003
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0004 : Poly :=
[
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 4 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0004 : Poly :=
[
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-65026429952 : Rat) / 8578069) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0004
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0005 : Poly :=
[
  term ((36698485221 : Rat) / 17156138) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 5 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0005 : Poly :=
[
  term ((-36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-36698485221 : Rat) / 17156138) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-36698485221 : Rat) / 17156138) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((-36698485221 : Rat) / 8578069) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((36698485221 : Rat) / 8578069) [(0, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0005
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0006 : Poly :=
[
  term ((49422491040 : Rat) / 150171761) [(0, 1), (11, 2)]
]

/-- Partial product 6 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0006 : Poly :=
[
  term ((-98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (3, 2), (11, 2)],
  term ((-49422491040 : Rat) / 150171761) [(0, 1), (8, 2), (11, 2)],
  term ((-49422491040 : Rat) / 150171761) [(0, 1), (9, 2), (11, 2)],
  term ((-98844982080 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2)],
  term ((98844982080 : Rat) / 150171761) [(0, 2), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0006
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0007 : Poly :=
[
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1)]
]

/-- Partial product 7 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0007 : Poly :=
[
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1)],
  term ((-15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (3, 2), (11, 2), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (8, 2), (11, 2), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (9, 2), (11, 2), (12, 1)],
  term ((15788236800 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2), (12, 1)],
  term ((-15788236800 : Rat) / 150171761) [(0, 2), (8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0007
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0008 : Poly :=
[
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 8 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0008 : Poly :=
[
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 3), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (8, 2), (11, 3), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (9, 2), (11, 3), (12, 1), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 2), (8, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0008
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0009 : Poly :=
[
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 1)]
]

/-- Partial product 9 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0009 : Poly :=
[
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (15, 1)],
  term ((4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 3), (15, 1)],
  term ((-2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (8, 2), (11, 3), (15, 1)],
  term ((-2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (9, 2), (11, 3), (15, 1)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (15, 1)],
  term ((4761379987056044196 : Rat) / 1288183727709509) [(0, 2), (8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0009
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0010 : Poly :=
[
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 10 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0010 : Poly :=
[
  term ((-4168012800 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (8, 1), (11, 1)],
  term ((4168012800 : Rat) / 150171761) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (8, 2), (11, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (9, 2), (11, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0010
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0011 : Poly :=
[
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 11 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0011 : Poly :=
[
  term ((-200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 2), (7, 1), (11, 2), (15, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (8, 2), (11, 2), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (9, 2), (11, 2), (15, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 3), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0011
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0012 : Poly :=
[
  term ((132427584 : Rat) / 8578069) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 12 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0012 : Poly :=
[
  term ((264855168 : Rat) / 8578069) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (7, 1), (8, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0012
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0013 : Poly :=
[
  term ((2084006400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 13 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0013 : Poly :=
[
  term ((4168012800 : Rat) / 150171761) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1)],
  term ((-4168012800 : Rat) / 150171761) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (9, 2), (11, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (8, 2), (9, 1), (11, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (9, 3), (11, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0013
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0014 : Poly :=
[
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 14 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0014 : Poly :=
[
  term ((200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 2), (11, 2), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (8, 2), (9, 1), (11, 2), (15, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 3), (11, 2), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 3), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0014
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0015 : Poly :=
[
  term ((-132427584 : Rat) / 8578069) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 15 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0015 : Poly :=
[
  term ((-264855168 : Rat) / 8578069) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 1), (9, 3), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0015
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0016 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 16 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0016 : Poly :=
[
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 3), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0016
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0017 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2)]
]

/-- Partial product 17 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0017 : Poly :=
[
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 2), (10, 1), (11, 2)],
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 2)],
  term ((-50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (3, 2), (10, 1), (11, 2)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (8, 2), (10, 1), (11, 2)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (9, 2), (10, 1), (11, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 3), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0017
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0018 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (15, 1)]
]

/-- Partial product 18 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0018 : Poly :=
[
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 3), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 2), (10, 1), (11, 3), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 3), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (3, 2), (10, 1), (11, 3), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (8, 2), (10, 1), (11, 3), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 2), (10, 1), (11, 3), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 3), (10, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0018
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0019 : Poly :=
[
  term ((-397282752 : Rat) / 8578069) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 19 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0019 : Poly :=
[
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-397282752 : Rat) / 8578069) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((397282752 : Rat) / 8578069) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((397282752 : Rat) / 8578069) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-397282752 : Rat) / 8578069) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0019
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0020 : Poly :=
[
  term ((6252019200 : Rat) / 150171761) [(2, 1), (11, 2)]
]

/-- Partial product 20 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0020 : Poly :=
[
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (8, 1), (11, 2)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2)],
  term ((-12504038400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((12504038400 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((6252019200 : Rat) / 150171761) [(2, 1), (3, 2), (11, 2)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (8, 2), (11, 2)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (9, 2), (11, 2)],
  term ((6252019200 : Rat) / 150171761) [(2, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0020
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0021 : Poly :=
[
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 1)]
]

/-- Partial product 21 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0021 : Poly :=
[
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 1), (11, 3), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 3), (15, 1)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (8, 2), (11, 3), (15, 1)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (9, 2), (11, 3), (15, 1)],
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 3), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0021
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0022 : Poly :=
[
  term ((51365310000 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 22 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0022 : Poly :=
[
  term ((-102730620000 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((102730620000 : Rat) / 150171761) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((102730620000 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-102730620000 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)],
  term ((51365310000 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1)],
  term ((-51365310000 : Rat) / 150171761) [(3, 1), (8, 2), (11, 1)],
  term ((-51365310000 : Rat) / 150171761) [(3, 1), (9, 2), (11, 1)],
  term ((51365310000 : Rat) / 150171761) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0022
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0023 : Poly :=
[
  term ((2474275920906006375 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 23 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0023 : Poly :=
[
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((4948551841812012750 : Rat) / 1288183727709509) [(0, 1), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((4948551841812012750 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-2474275920906006375 : Rat) / 1288183727709509) [(3, 1), (8, 2), (11, 2), (15, 1)],
  term ((-2474275920906006375 : Rat) / 1288183727709509) [(3, 1), (9, 2), (11, 2), (15, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(3, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0023
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0024 : Poly :=
[
  term ((323357500 : Rat) / 8578069) [(3, 1), (15, 1)]
]

/-- Partial product 24 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0024 : Poly :=
[
  term ((-646715000 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((646715000 : Rat) / 8578069) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term ((646715000 : Rat) / 8578069) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(1, 1), (3, 2), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(2, 2), (3, 1), (15, 1)],
  term ((-323357500 : Rat) / 8578069) [(3, 1), (8, 2), (15, 1)],
  term ((-323357500 : Rat) / 8578069) [(3, 1), (9, 2), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0024
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0025 : Poly :=
[
  term ((-2898836376 : Rat) / 8578069) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 25 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0025 : Poly :=
[
  term ((5797672752 : Rat) / 8578069) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-5797672752 : Rat) / 8578069) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((5797672752 : Rat) / 8578069) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((-5797672752 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2898836376 : Rat) / 8578069) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-2898836376 : Rat) / 8578069) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((2898836376 : Rat) / 8578069) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((2898836376 : Rat) / 8578069) [(4, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0025
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0026 : Poly :=
[
  term ((99715053600 : Rat) / 150171761) [(4, 1), (11, 2)]
]

/-- Partial product 26 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0026 : Poly :=
[
  term ((-199430107200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((199430107200 : Rat) / 150171761) [(0, 1), (4, 1), (8, 1), (11, 2)],
  term ((-199430107200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((199430107200 : Rat) / 150171761) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((99715053600 : Rat) / 150171761) [(2, 2), (4, 1), (11, 2)],
  term ((99715053600 : Rat) / 150171761) [(3, 2), (4, 1), (11, 2)],
  term ((-99715053600 : Rat) / 150171761) [(4, 1), (8, 2), (11, 2)],
  term ((-99715053600 : Rat) / 150171761) [(4, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0026
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0027 : Poly :=
[
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)]
]

/-- Partial product 27 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0027 : Poly :=
[
  term ((-9606582967155529140 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 3), (15, 1)],
  term ((9606582967155529140 : Rat) / 1288183727709509) [(0, 1), (4, 1), (8, 1), (11, 3), (15, 1)],
  term ((-9606582967155529140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 3), (15, 1)],
  term ((9606582967155529140 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (11, 3), (15, 1)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 3), (15, 1)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 3), (15, 1)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (8, 2), (11, 3), (15, 1)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0027
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0028 : Poly :=
[
  term ((13546041600 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 28 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0028 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (5, 1), (8, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(5, 1), (8, 2), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0028
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0029 : Poly :=
[
  term ((652515181052563920 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 29 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0029 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(5, 1), (8, 2), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(5, 1), (9, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0029
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0030 : Poly :=
[
  term ((-860779296 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 30 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0030 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(2, 2), (5, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 2), (5, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(5, 1), (8, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0030
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0031 : Poly :=
[
  term (384 : Rat) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 31 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0031 : Poly :=
[
  term (-768 : Rat) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term (768 : Rat) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term (-768 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term (768 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term (384 : Rat) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term (384 : Rat) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term (-384 : Rat) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term (-384 : Rat) [(7, 1), (9, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0031
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0032 : Poly :=
[
  term ((2549038544 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 32 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0032 : Poly :=
[
  term ((-5098077088 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((5098077088 : Rat) / 150171761) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((-5098077088 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((5098077088 : Rat) / 150171761) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((2549038544 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((2549038544 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((-2549038544 : Rat) / 150171761) [(7, 1), (8, 2), (11, 1)],
  term ((-2549038544 : Rat) / 150171761) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0032
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0033 : Poly :=
[
  term ((328921600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 33 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0033 : Poly :=
[
  term ((-657843200 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((657843200 : Rat) / 150171761) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-657843200 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((657843200 : Rat) / 150171761) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((328921600 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((328921600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((-328921600 : Rat) / 150171761) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-328921600 : Rat) / 150171761) [(7, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0033
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0034 : Poly :=
[
  term ((15844210708469920 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 34 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0034 : Poly :=
[
  term ((-31688421416939840 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(0, 1), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(1, 1), (7, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(7, 1), (8, 2), (11, 2), (12, 1), (15, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(7, 1), (9, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0034
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0035 : Poly :=
[
  term ((817232416705871495 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 35 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0035 : Poly :=
[
  term ((-1634464833411742990 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((1634464833411742990 : Rat) / 1288183727709509) [(0, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1634464833411742990 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((1634464833411742990 : Rat) / 1288183727709509) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((817232416705871495 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((817232416705871495 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-817232416705871495 : Rat) / 1288183727709509) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((-817232416705871495 : Rat) / 1288183727709509) [(7, 1), (9, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0035
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0036 : Poly :=
[
  term ((4064151872 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 36 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0036 : Poly :=
[
  term ((-8128303744 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0036
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0037 : Poly :=
[
  term ((-9157147868 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 37 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0037 : Poly :=
[
  term ((18314295736 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((-18314295736 : Rat) / 25734207) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((18314295736 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-18314295736 : Rat) / 25734207) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-9157147868 : Rat) / 25734207) [(2, 2), (7, 1), (15, 1)],
  term ((-9157147868 : Rat) / 25734207) [(3, 2), (7, 1), (15, 1)],
  term ((9157147868 : Rat) / 25734207) [(7, 1), (8, 2), (15, 1)],
  term ((9157147868 : Rat) / 25734207) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0037
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0038 : Poly :=
[
  term ((-41438935600 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 38 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0038 : Poly :=
[
  term ((82877871200 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-82877871200 : Rat) / 150171761) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((82877871200 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-82877871200 : Rat) / 150171761) [(1, 1), (9, 2), (11, 1)],
  term ((-41438935600 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1)],
  term ((-41438935600 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1)],
  term ((41438935600 : Rat) / 150171761) [(8, 2), (9, 1), (11, 1)],
  term ((41438935600 : Rat) / 150171761) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0038
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0039 : Poly :=
[
  term ((4101286000 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 39 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0039 : Poly :=
[
  term ((-8202572000 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((8202572000 : Rat) / 150171761) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-8202572000 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((8202572000 : Rat) / 150171761) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((4101286000 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((4101286000 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-4101286000 : Rat) / 150171761) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-4101286000 : Rat) / 150171761) [(9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0039
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0040 : Poly :=
[
  term ((197559660295030075 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 40 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0040 : Poly :=
[
  term ((-395119320590060150 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((395119320590060150 : Rat) / 1288183727709509) [(0, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-395119320590060150 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((395119320590060150 : Rat) / 1288183727709509) [(1, 1), (9, 2), (11, 2), (12, 1), (15, 1)],
  term ((197559660295030075 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((197559660295030075 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-197559660295030075 : Rat) / 1288183727709509) [(8, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-197559660295030075 : Rat) / 1288183727709509) [(9, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0040
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0041 : Poly :=
[
  term ((-1996120738744781095 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 41 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0041 : Poly :=
[
  term ((3992241477489562190 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3992241477489562190 : Rat) / 1288183727709509) [(0, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((3992241477489562190 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3992241477489562190 : Rat) / 1288183727709509) [(1, 1), (9, 2), (11, 2), (15, 1)],
  term ((-1996120738744781095 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-1996120738744781095 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((1996120738744781095 : Rat) / 1288183727709509) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((1996120738744781095 : Rat) / 1288183727709509) [(9, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0041
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0042 : Poly :=
[
  term ((2328155780 : Rat) / 25734207) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 42 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0042 : Poly :=
[
  term ((-4656311560 : Rat) / 25734207) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((4656311560 : Rat) / 25734207) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-4656311560 : Rat) / 25734207) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((4656311560 : Rat) / 25734207) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((2328155780 : Rat) / 25734207) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((2328155780 : Rat) / 25734207) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2328155780 : Rat) / 25734207) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2328155780 : Rat) / 25734207) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0042
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0043 : Poly :=
[
  term ((262718908 : Rat) / 25734207) [(9, 1), (15, 1)]
]

/-- Partial product 43 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0043 : Poly :=
[
  term ((-525437816 : Rat) / 25734207) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((525437816 : Rat) / 25734207) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((-525437816 : Rat) / 25734207) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((525437816 : Rat) / 25734207) [(1, 1), (9, 2), (15, 1)],
  term ((262718908 : Rat) / 25734207) [(2, 2), (9, 1), (15, 1)],
  term ((262718908 : Rat) / 25734207) [(3, 2), (9, 1), (15, 1)],
  term ((-262718908 : Rat) / 25734207) [(8, 2), (9, 1), (15, 1)],
  term ((-262718908 : Rat) / 25734207) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0043
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0044 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 44 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0044 : Poly :=
[
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0044
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0045 : Poly :=
[
  term ((-22924818583 : Rat) / 8578069) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 45 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0045 : Poly :=
[
  term ((45849637166 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-45849637166 : Rat) / 8578069) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((45849637166 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-45849637166 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-22924818583 : Rat) / 8578069) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-22924818583 : Rat) / 8578069) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((22924818583 : Rat) / 8578069) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((22924818583 : Rat) / 8578069) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0045
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0046 : Poly :=
[
  term ((-239750429760 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 46 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0046 : Poly :=
[
  term ((479500859520 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-479500859520 : Rat) / 150171761) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((479500859520 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-479500859520 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-239750429760 : Rat) / 150171761) [(2, 2), (10, 1), (11, 2)],
  term ((-239750429760 : Rat) / 150171761) [(3, 2), (10, 1), (11, 2)],
  term ((239750429760 : Rat) / 150171761) [(8, 2), (10, 1), (11, 2)],
  term ((239750429760 : Rat) / 150171761) [(9, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0046
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0047 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 47 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0047 : Poly :=
[
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (8, 1), (10, 1), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 2), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(2, 2), (10, 1), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(3, 2), (10, 1), (11, 2), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(8, 2), (10, 1), (11, 2), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(9, 2), (10, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0047
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0048 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 48 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0048 : Poly :=
[
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (8, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(8, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 2), (10, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0048
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0049 : Poly :=
[
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 49 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0049 : Poly :=
[
  term ((23097639842221717224 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(0, 1), (8, 1), (10, 1), (11, 3), (15, 1)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 3), (15, 1)],
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 3), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 3), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(8, 2), (10, 1), (11, 3), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(9, 2), (10, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0049
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0050 : Poly :=
[
  term ((40641518720 : Rat) / 25734207) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 50 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0050 : Poly :=
[
  term ((-81283037440 : Rat) / 25734207) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((81283037440 : Rat) / 25734207) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-81283037440 : Rat) / 25734207) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((81283037440 : Rat) / 25734207) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((40641518720 : Rat) / 25734207) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((40641518720 : Rat) / 25734207) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-40641518720 : Rat) / 25734207) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-40641518720 : Rat) / 25734207) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0050
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0051 : Poly :=
[
  term ((2215103800 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 51 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0051 : Poly :=
[
  term ((-4430207600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((4430207600 : Rat) / 150171761) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-4430207600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((4430207600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((2215103800 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)],
  term ((2215103800 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)],
  term ((-2215103800 : Rat) / 150171761) [(8, 2), (11, 1), (13, 1)],
  term ((-2215103800 : Rat) / 150171761) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0051
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0052 : Poly :=
[
  term ((-6172662619 : Rat) / 102936828) [(11, 1), (15, 1)]
]

/-- Partial product 52 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0052 : Poly :=
[
  term ((6172662619 : Rat) / 51468414) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-6172662619 : Rat) / 51468414) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((6172662619 : Rat) / 51468414) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-6172662619 : Rat) / 51468414) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-6172662619 : Rat) / 102936828) [(2, 2), (11, 1), (15, 1)],
  term ((-6172662619 : Rat) / 102936828) [(3, 2), (11, 1), (15, 1)],
  term ((6172662619 : Rat) / 102936828) [(8, 2), (11, 1), (15, 1)],
  term ((6172662619 : Rat) / 102936828) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0052
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0053 : Poly :=
[
  term ((-27021886160 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 53 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0053 : Poly :=
[
  term ((54043772320 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)],
  term ((-54043772320 : Rat) / 150171761) [(0, 1), (8, 1), (11, 2)],
  term ((54043772320 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2)],
  term ((-54043772320 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2)],
  term ((-27021886160 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((-27021886160 : Rat) / 150171761) [(3, 2), (11, 2)],
  term ((27021886160 : Rat) / 150171761) [(8, 2), (11, 2)],
  term ((27021886160 : Rat) / 150171761) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0053
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0054 : Poly :=
[
  term ((3289216000 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 54 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0054 : Poly :=
[
  term ((-6578432000 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((6578432000 : Rat) / 150171761) [(0, 1), (8, 1), (11, 2), (12, 1)],
  term ((-6578432000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((6578432000 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((3289216000 : Rat) / 150171761) [(2, 2), (11, 2), (12, 1)],
  term ((3289216000 : Rat) / 150171761) [(3, 2), (11, 2), (12, 1)],
  term ((-3289216000 : Rat) / 150171761) [(8, 2), (11, 2), (12, 1)],
  term ((-3289216000 : Rat) / 150171761) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0054
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0055 : Poly :=
[
  term ((213403871003499995 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 55 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0055 : Poly :=
[
  term ((-213403871003499995 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((213403871003499995 : Rat) / 1288183727709509) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-213403871003499995 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((213403871003499995 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((213403871003499995 : Rat) / 2576367455419018) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((213403871003499995 : Rat) / 2576367455419018) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-213403871003499995 : Rat) / 2576367455419018) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-213403871003499995 : Rat) / 2576367455419018) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0055
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0056 : Poly :=
[
  term ((158442107084699200 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 56 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0056 : Poly :=
[
  term ((-316884214169398400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(0, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-316884214169398400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((158442107084699200 : Rat) / 1288183727709509) [(2, 2), (11, 3), (12, 1), (15, 1)],
  term ((158442107084699200 : Rat) / 1288183727709509) [(3, 2), (11, 3), (12, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(8, 2), (11, 3), (12, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(9, 2), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0056
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0057 : Poly :=
[
  term ((-1301648958473165417 : Rat) / 1288183727709509) [(11, 3), (15, 1)]
]

/-- Partial product 57 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0057 : Poly :=
[
  term ((2603297916946330834 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((-2603297916946330834 : Rat) / 1288183727709509) [(0, 1), (8, 1), (11, 3), (15, 1)],
  term ((2603297916946330834 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-2603297916946330834 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((-1301648958473165417 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((-1301648958473165417 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)],
  term ((1301648958473165417 : Rat) / 1288183727709509) [(8, 2), (11, 3), (15, 1)],
  term ((1301648958473165417 : Rat) / 1288183727709509) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0057
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 8. -/
def rs_R013_ueqv_R013YNNN_coefficient_08_0058 : Poly :=
[
  term ((3196153826 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 58 for generator 8. -/
def rs_R013_ueqv_R013YNNN_partial_08_0058 : Poly :=
[
  term ((-6392307652 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((6392307652 : Rat) / 25734207) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-6392307652 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((6392307652 : Rat) / 25734207) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((3196153826 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((3196153826 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)],
  term ((-3196153826 : Rat) / 25734207) [(8, 2), (13, 1), (15, 1)],
  term ((-3196153826 : Rat) / 25734207) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 8. -/
theorem rs_R013_ueqv_R013YNNN_partial_08_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_08_0058
        rs_R013_ueqv_R013YNNN_generator_08_0000_0058 =
      rs_R013_ueqv_R013YNNN_partial_08_0058 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_08_0000_0058 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_08_0000,
  rs_R013_ueqv_R013YNNN_partial_08_0001,
  rs_R013_ueqv_R013YNNN_partial_08_0002,
  rs_R013_ueqv_R013YNNN_partial_08_0003,
  rs_R013_ueqv_R013YNNN_partial_08_0004,
  rs_R013_ueqv_R013YNNN_partial_08_0005,
  rs_R013_ueqv_R013YNNN_partial_08_0006,
  rs_R013_ueqv_R013YNNN_partial_08_0007,
  rs_R013_ueqv_R013YNNN_partial_08_0008,
  rs_R013_ueqv_R013YNNN_partial_08_0009,
  rs_R013_ueqv_R013YNNN_partial_08_0010,
  rs_R013_ueqv_R013YNNN_partial_08_0011,
  rs_R013_ueqv_R013YNNN_partial_08_0012,
  rs_R013_ueqv_R013YNNN_partial_08_0013,
  rs_R013_ueqv_R013YNNN_partial_08_0014,
  rs_R013_ueqv_R013YNNN_partial_08_0015,
  rs_R013_ueqv_R013YNNN_partial_08_0016,
  rs_R013_ueqv_R013YNNN_partial_08_0017,
  rs_R013_ueqv_R013YNNN_partial_08_0018,
  rs_R013_ueqv_R013YNNN_partial_08_0019,
  rs_R013_ueqv_R013YNNN_partial_08_0020,
  rs_R013_ueqv_R013YNNN_partial_08_0021,
  rs_R013_ueqv_R013YNNN_partial_08_0022,
  rs_R013_ueqv_R013YNNN_partial_08_0023,
  rs_R013_ueqv_R013YNNN_partial_08_0024,
  rs_R013_ueqv_R013YNNN_partial_08_0025,
  rs_R013_ueqv_R013YNNN_partial_08_0026,
  rs_R013_ueqv_R013YNNN_partial_08_0027,
  rs_R013_ueqv_R013YNNN_partial_08_0028,
  rs_R013_ueqv_R013YNNN_partial_08_0029,
  rs_R013_ueqv_R013YNNN_partial_08_0030,
  rs_R013_ueqv_R013YNNN_partial_08_0031,
  rs_R013_ueqv_R013YNNN_partial_08_0032,
  rs_R013_ueqv_R013YNNN_partial_08_0033,
  rs_R013_ueqv_R013YNNN_partial_08_0034,
  rs_R013_ueqv_R013YNNN_partial_08_0035,
  rs_R013_ueqv_R013YNNN_partial_08_0036,
  rs_R013_ueqv_R013YNNN_partial_08_0037,
  rs_R013_ueqv_R013YNNN_partial_08_0038,
  rs_R013_ueqv_R013YNNN_partial_08_0039,
  rs_R013_ueqv_R013YNNN_partial_08_0040,
  rs_R013_ueqv_R013YNNN_partial_08_0041,
  rs_R013_ueqv_R013YNNN_partial_08_0042,
  rs_R013_ueqv_R013YNNN_partial_08_0043,
  rs_R013_ueqv_R013YNNN_partial_08_0044,
  rs_R013_ueqv_R013YNNN_partial_08_0045,
  rs_R013_ueqv_R013YNNN_partial_08_0046,
  rs_R013_ueqv_R013YNNN_partial_08_0047,
  rs_R013_ueqv_R013YNNN_partial_08_0048,
  rs_R013_ueqv_R013YNNN_partial_08_0049,
  rs_R013_ueqv_R013YNNN_partial_08_0050,
  rs_R013_ueqv_R013YNNN_partial_08_0051,
  rs_R013_ueqv_R013YNNN_partial_08_0052,
  rs_R013_ueqv_R013YNNN_partial_08_0053,
  rs_R013_ueqv_R013YNNN_partial_08_0054,
  rs_R013_ueqv_R013YNNN_partial_08_0055,
  rs_R013_ueqv_R013YNNN_partial_08_0056,
  rs_R013_ueqv_R013YNNN_partial_08_0057,
  rs_R013_ueqv_R013YNNN_partial_08_0058
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_08_0000_0058 : Poly :=
[
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 2)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term (1152 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (15, 1)],
  term (-1152 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (15, 1)],
  term ((-102730620000 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (3, 2), (11, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 2), (11, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 2), (11, 3), (15, 1)],
  term ((5797672752 : Rat) / 8578069) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-199430107200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((-9606582967155529140 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 3), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((-4168012800 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (8, 1), (11, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term (-768 : Rat) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-5098077088 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((-657843200 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1634464833411742990 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((18314295736 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((4168012800 : Rat) / 150171761) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 3), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (8, 1), (11, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 1), (11, 3), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (8, 2), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 2), (11, 3), (15, 1)],
  term ((82877871200 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-8202572000 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-395119320590060150 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((3992241477489562190 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4656311560 : Rat) / 25734207) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-525437816 : Rat) / 25734207) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (9, 2), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 2), (11, 3), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((45849637166 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((479500859520 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-81283037440 : Rat) / 25734207) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4430207600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((6172662619 : Rat) / 51468414) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((54043772320 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)],
  term ((-6578432000 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((-213403871003499995 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-316884214169398400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((2603297916946330834 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((-6392307652 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-82330921536 : Rat) / 150171761) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-4168012800 : Rat) / 150171761) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 2), (9, 1), (11, 2), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 2), (10, 1), (11, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 2), (10, 1), (11, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 2), (10, 1), (11, 3), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((38287616229 : Rat) / 17156138) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((36918452640 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (12, 1), (15, 1)],
  term ((1778368287941040018 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 3), (11, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 3), (11, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 3), (11, 3), (15, 1)],
  term ((102730620000 : Rat) / 150171761) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((4948551841812012750 : Rat) / 1288183727709509) [(0, 1), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((646715000 : Rat) / 8578069) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term (-576 : Rat) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (3, 2), (11, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (3, 2), (11, 2), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 3), (12, 1), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 3), (15, 1)],
  term ((-5797672752 : Rat) / 8578069) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((199430107200 : Rat) / 150171761) [(0, 1), (4, 1), (8, 1), (11, 2)],
  term ((9606582967155529140 : Rat) / 1288183727709509) [(0, 1), (4, 1), (8, 1), (11, 3), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (5, 1), (8, 1), (11, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term (768 : Rat) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((5098077088 : Rat) / 150171761) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((657843200 : Rat) / 150171761) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(0, 1), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((1634464833411742990 : Rat) / 1288183727709509) [(0, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-18314295736 : Rat) / 25734207) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term (576 : Rat) [(0, 1), (7, 1), (8, 2), (11, 1)],
  term (576 : Rat) [(0, 1), (7, 1), (9, 2), (11, 1)],
  term ((-82877871200 : Rat) / 150171761) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((8202572000 : Rat) / 150171761) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((395119320590060150 : Rat) / 1288183727709509) [(0, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3992241477489562190 : Rat) / 1288183727709509) [(0, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((4656311560 : Rat) / 25734207) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((525437816 : Rat) / 25734207) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-45849637166 : Rat) / 8578069) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-479500859520 : Rat) / 150171761) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (8, 1), (10, 1), (11, 2), (12, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (8, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(0, 1), (8, 1), (10, 1), (11, 3), (15, 1)],
  term ((81283037440 : Rat) / 25734207) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((4430207600 : Rat) / 150171761) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-6172662619 : Rat) / 51468414) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-54043772320 : Rat) / 150171761) [(0, 1), (8, 1), (11, 2)],
  term ((6578432000 : Rat) / 150171761) [(0, 1), (8, 1), (11, 2), (12, 1)],
  term ((213403871003499995 : Rat) / 1288183727709509) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(0, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-2603297916946330834 : Rat) / 1288183727709509) [(0, 1), (8, 1), (11, 3), (15, 1)],
  term ((6392307652 : Rat) / 25734207) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-36698485221 : Rat) / 17156138) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-49422491040 : Rat) / 150171761) [(0, 1), (8, 2), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (8, 2), (11, 2), (12, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (8, 2), (11, 3), (12, 1), (15, 1)],
  term ((-2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (8, 2), (11, 3), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-36698485221 : Rat) / 17156138) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((-49422491040 : Rat) / 150171761) [(0, 1), (9, 2), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (9, 2), (11, 2), (12, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (9, 2), (11, 3), (12, 1), (15, 1)],
  term ((-2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (9, 2), (11, 3), (15, 1)],
  term (1152 : Rat) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-6356524032 : Rat) / 8578069) [(0, 2), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((100032307200 : Rat) / 150171761) [(0, 2), (2, 1), (8, 1), (11, 2)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 2), (2, 1), (8, 1), (11, 3), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-36698485221 : Rat) / 8578069) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-98844982080 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2)],
  term ((15788236800 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2), (12, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 2), (2, 2), (11, 1), (15, 1)],
  term ((-100032307200 : Rat) / 150171761) [(0, 2), (2, 2), (11, 2)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 2), (2, 2), (11, 3), (15, 1)],
  term (-1152 : Rat) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((-65026429952 : Rat) / 8578069) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((36698485221 : Rat) / 8578069) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((98844982080 : Rat) / 150171761) [(0, 2), (8, 1), (11, 2)],
  term ((-15788236800 : Rat) / 150171761) [(0, 2), (8, 1), (11, 2), (12, 1)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 2), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((4761379987056044196 : Rat) / 1288183727709509) [(0, 2), (8, 1), (11, 3), (15, 1)],
  term ((4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 3), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((-4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (9, 2), (11, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 2), (11, 2), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((5797672752 : Rat) / 8578069) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((-199430107200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((-9606582967155529140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 3), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term (-768 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((-5098077088 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-657843200 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1634464833411742990 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((18314295736 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((8069934400 : Rat) / 6529207) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-8202572000 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((-395119320590060150 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((388730144317459780 : Rat) / 56007988161283) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4656311560 : Rat) / 25734207) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((1414707184 : Rat) / 25734207) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((45849637166 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((479500859520 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 2), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 3), (15, 1)],
  term ((-81283037440 : Rat) / 25734207) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4430207600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((6172662619 : Rat) / 51468414) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((54043772320 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2)],
  term ((-6578432000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((-213403871003499995 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-316884214169398400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((2603297916946330834 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-6392307652 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-102730620000 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(1, 1), (3, 2), (15, 1)],
  term ((-5797672752 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((199430107200 : Rat) / 150171761) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((9606582967155529140 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (11, 3), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term (768 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((5098077088 : Rat) / 150171761) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((657843200 : Rat) / 150171761) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(1, 1), (7, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1634464833411742990 : Rat) / 1288183727709509) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-18314295736 : Rat) / 25734207) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-45849637166 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-479500859520 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((81283037440 : Rat) / 25734207) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((4430207600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-6172662619 : Rat) / 51468414) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-54043772320 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2)],
  term ((6578432000 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((213403871003499995 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-2603297916946330834 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((6392307652 : Rat) / 25734207) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-82877871200 : Rat) / 150171761) [(1, 1), (9, 2), (11, 1)],
  term ((8202572000 : Rat) / 150171761) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((395119320590060150 : Rat) / 1288183727709509) [(1, 1), (9, 2), (11, 2), (12, 1), (15, 1)],
  term ((-3992241477489562190 : Rat) / 1288183727709509) [(1, 1), (9, 2), (11, 2), (15, 1)],
  term ((4656311560 : Rat) / 25734207) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((525437816 : Rat) / 25734207) [(1, 1), (9, 2), (15, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (3, 2), (10, 1), (11, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (3, 2), (10, 1), (11, 3), (15, 1)],
  term ((-397282752 : Rat) / 8578069) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((6252019200 : Rat) / 150171761) [(2, 1), (3, 2), (11, 2)],
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 3), (15, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (8, 2), (11, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (8, 2), (11, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (7, 1), (8, 2), (15, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (9, 2), (11, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (9, 2), (11, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (8, 2), (9, 1), (11, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (8, 2), (9, 1), (11, 2), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (8, 2), (10, 1), (11, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (8, 2), (10, 1), (11, 3), (15, 1)],
  term ((397282752 : Rat) / 8578069) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (8, 2), (11, 2)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (8, 2), (11, 3), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (9, 2), (10, 1), (11, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 2), (10, 1), (11, 3), (15, 1)],
  term ((397282752 : Rat) / 8578069) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (9, 2), (11, 2)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (9, 2), (11, 3), (15, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (9, 3), (11, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 3), (11, 2), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 1), (9, 3), (15, 1)],
  term ((51365310000 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(2, 2), (3, 1), (15, 1)],
  term ((-2898836376 : Rat) / 8578069) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((99715053600 : Rat) / 150171761) [(2, 2), (4, 1), (11, 2)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 3), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(2, 2), (5, 1), (15, 1)],
  term (384 : Rat) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((2549038544 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((328921600 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((817232416705871495 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-9157147868 : Rat) / 25734207) [(2, 2), (7, 1), (15, 1)],
  term ((-41438935600 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1)],
  term ((4101286000 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((197559660295030075 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1996120738744781095 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((2328155780 : Rat) / 25734207) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((262718908 : Rat) / 25734207) [(2, 2), (9, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22924818583 : Rat) / 8578069) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-239750429760 : Rat) / 150171761) [(2, 2), (10, 1), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(2, 2), (10, 1), (11, 2), (12, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 3), (15, 1)],
  term ((40641518720 : Rat) / 25734207) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((2215103800 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)],
  term ((-6172662619 : Rat) / 102936828) [(2, 2), (11, 1), (15, 1)],
  term ((-27021886160 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((3289216000 : Rat) / 150171761) [(2, 2), (11, 2), (12, 1)],
  term ((213403871003499995 : Rat) / 2576367455419018) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((158442107084699200 : Rat) / 1288183727709509) [(2, 2), (11, 3), (12, 1), (15, 1)],
  term ((-1301648958473165417 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((3196153826 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 3), (7, 1), (11, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 3), (7, 1), (11, 2), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 3), (7, 1), (15, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 3), (9, 1), (11, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 3), (9, 1), (11, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 3), (9, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 3), (10, 1), (11, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(2, 3), (10, 1), (11, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 3), (10, 1), (11, 3), (15, 1)],
  term ((-397282752 : Rat) / 8578069) [(2, 3), (11, 1), (15, 1)],
  term ((6252019200 : Rat) / 150171761) [(2, 3), (11, 2)],
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 3), (11, 3), (15, 1)],
  term ((-51365310000 : Rat) / 150171761) [(3, 1), (8, 2), (11, 1)],
  term ((-2474275920906006375 : Rat) / 1288183727709509) [(3, 1), (8, 2), (11, 2), (15, 1)],
  term ((-323357500 : Rat) / 8578069) [(3, 1), (8, 2), (15, 1)],
  term ((-51365310000 : Rat) / 150171761) [(3, 1), (9, 2), (11, 1)],
  term ((-2474275920906006375 : Rat) / 1288183727709509) [(3, 1), (9, 2), (11, 2), (15, 1)],
  term ((-323357500 : Rat) / 8578069) [(3, 1), (9, 2), (15, 1)],
  term ((-2898836376 : Rat) / 8578069) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((99715053600 : Rat) / 150171761) [(3, 2), (4, 1), (11, 2)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 3), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 2), (5, 1), (15, 1)],
  term (384 : Rat) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((2549038544 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((328921600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((817232416705871495 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-9157147868 : Rat) / 25734207) [(3, 2), (7, 1), (15, 1)],
  term ((-41438935600 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1)],
  term ((4101286000 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((197559660295030075 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1996120738744781095 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((2328155780 : Rat) / 25734207) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((262718908 : Rat) / 25734207) [(3, 2), (9, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22924818583 : Rat) / 8578069) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-239750429760 : Rat) / 150171761) [(3, 2), (10, 1), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(3, 2), (10, 1), (11, 2), (12, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 3), (15, 1)],
  term ((40641518720 : Rat) / 25734207) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((2215103800 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)],
  term ((-6172662619 : Rat) / 102936828) [(3, 2), (11, 1), (15, 1)],
  term ((-27021886160 : Rat) / 150171761) [(3, 2), (11, 2)],
  term ((3289216000 : Rat) / 150171761) [(3, 2), (11, 2), (12, 1)],
  term ((213403871003499995 : Rat) / 2576367455419018) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((158442107084699200 : Rat) / 1288183727709509) [(3, 2), (11, 3), (12, 1), (15, 1)],
  term ((-1301648958473165417 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)],
  term ((3196153826 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)],
  term ((51365310000 : Rat) / 150171761) [(3, 3), (11, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(3, 3), (11, 2), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(3, 3), (15, 1)],
  term ((2898836376 : Rat) / 8578069) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((-99715053600 : Rat) / 150171761) [(4, 1), (8, 2), (11, 2)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (8, 2), (11, 3), (15, 1)],
  term ((2898836376 : Rat) / 8578069) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((-99715053600 : Rat) / 150171761) [(4, 1), (9, 2), (11, 2)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (9, 2), (11, 3), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(5, 1), (8, 2), (11, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(5, 1), (8, 2), (11, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(5, 1), (8, 2), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(5, 1), (9, 2), (11, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(5, 1), (9, 2), (15, 1)],
  term (-384 : Rat) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((-2549038544 : Rat) / 150171761) [(7, 1), (8, 2), (11, 1)],
  term ((-328921600 : Rat) / 150171761) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(7, 1), (8, 2), (11, 2), (12, 1), (15, 1)],
  term ((-817232416705871495 : Rat) / 1288183727709509) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((9157147868 : Rat) / 25734207) [(7, 1), (8, 2), (15, 1)],
  term (-384 : Rat) [(7, 1), (9, 2), (10, 1), (11, 1)],
  term ((-2549038544 : Rat) / 150171761) [(7, 1), (9, 2), (11, 1)],
  term ((-328921600 : Rat) / 150171761) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(7, 1), (9, 2), (11, 2), (12, 1), (15, 1)],
  term ((-817232416705871495 : Rat) / 1288183727709509) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((9157147868 : Rat) / 25734207) [(7, 1), (9, 2), (15, 1)],
  term ((41438935600 : Rat) / 150171761) [(8, 2), (9, 1), (11, 1)],
  term ((-4101286000 : Rat) / 150171761) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-197559660295030075 : Rat) / 1288183727709509) [(8, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1996120738744781095 : Rat) / 1288183727709509) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2328155780 : Rat) / 25734207) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-262718908 : Rat) / 25734207) [(8, 2), (9, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((22924818583 : Rat) / 8578069) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((239750429760 : Rat) / 150171761) [(8, 2), (10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(8, 2), (10, 1), (11, 2), (12, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(8, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(8, 2), (10, 1), (11, 3), (15, 1)],
  term ((-40641518720 : Rat) / 25734207) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2215103800 : Rat) / 150171761) [(8, 2), (11, 1), (13, 1)],
  term ((6172662619 : Rat) / 102936828) [(8, 2), (11, 1), (15, 1)],
  term ((27021886160 : Rat) / 150171761) [(8, 2), (11, 2)],
  term ((-3289216000 : Rat) / 150171761) [(8, 2), (11, 2), (12, 1)],
  term ((-213403871003499995 : Rat) / 2576367455419018) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(8, 2), (11, 3), (12, 1), (15, 1)],
  term ((1301648958473165417 : Rat) / 1288183727709509) [(8, 2), (11, 3), (15, 1)],
  term ((-3196153826 : Rat) / 25734207) [(8, 2), (13, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((22924818583 : Rat) / 8578069) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((239750429760 : Rat) / 150171761) [(9, 2), (10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(9, 2), (10, 1), (11, 2), (12, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(9, 2), (10, 1), (11, 3), (15, 1)],
  term ((-40641518720 : Rat) / 25734207) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2215103800 : Rat) / 150171761) [(9, 2), (11, 1), (13, 1)],
  term ((6172662619 : Rat) / 102936828) [(9, 2), (11, 1), (15, 1)],
  term ((27021886160 : Rat) / 150171761) [(9, 2), (11, 2)],
  term ((-3289216000 : Rat) / 150171761) [(9, 2), (11, 2), (12, 1)],
  term ((-213403871003499995 : Rat) / 2576367455419018) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(9, 2), (11, 3), (12, 1), (15, 1)],
  term ((1301648958473165417 : Rat) / 1288183727709509) [(9, 2), (11, 3), (15, 1)],
  term ((-3196153826 : Rat) / 25734207) [(9, 2), (13, 1), (15, 1)],
  term ((41438935600 : Rat) / 150171761) [(9, 3), (11, 1)],
  term ((-4101286000 : Rat) / 150171761) [(9, 3), (11, 1), (12, 1)],
  term ((-197559660295030075 : Rat) / 1288183727709509) [(9, 3), (11, 2), (12, 1), (15, 1)],
  term ((1996120738744781095 : Rat) / 1288183727709509) [(9, 3), (11, 2), (15, 1)],
  term ((-2328155780 : Rat) / 25734207) [(9, 3), (12, 1), (15, 1)],
  term ((-262718908 : Rat) / 25734207) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 0 through 58. -/
theorem rs_R013_ueqv_R013YNNN_block_08_0000_0058_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_08_0000_0058
      rs_R013_ueqv_R013YNNN_block_08_0000_0058 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
