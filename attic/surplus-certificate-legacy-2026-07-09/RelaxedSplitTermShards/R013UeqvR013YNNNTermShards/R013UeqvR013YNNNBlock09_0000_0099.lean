/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 9:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_09_0000_0099 : Poly :=
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
def rs_R013_ueqv_R013YNNN_coefficient_09_0000 : Poly :=
[
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 0 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0000 : Poly :=
[
  term ((-6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 3), (11, 1), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(0, 2), (2, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0000
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0001 : Poly :=
[
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)]
]

/-- Partial product 1 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0001 : Poly :=
[
  term ((100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 2), (11, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (13, 2)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 3), (11, 2)],
  term ((-100032307200 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2), (12, 1)],
  term ((100032307200 : Rat) / 150171761) [(0, 2), (2, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0001
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0002 : Poly :=
[
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0002 : Poly :=
[
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 3), (13, 1), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 2), (11, 3), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 2), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (13, 2), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 3), (11, 3), (15, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 2), (2, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0002
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0003 : Poly :=
[
  term ((61029914400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0003 : Poly :=
[
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((-122059828800 : Rat) / 150171761) [(0, 2), (2, 1), (5, 1), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0003
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0004 : Poly :=
[
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0004 : Poly :=
[
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (2, 2), (5, 1), (11, 2), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 2), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0004
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0005 : Poly :=
[
  term ((1822387496 : Rat) / 8578069) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0005 : Poly :=
[
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 2), (2, 1), (5, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0005
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0006 : Poly :=
[
  term (576 : Rat) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0006 : Poly :=
[
  term (-1152 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term (576 : Rat) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term (576 : Rat) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term (-576 : Rat) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term (-576 : Rat) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term (-1152 : Rat) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term (1152 : Rat) [(0, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0006
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0007 : Poly :=
[
  term ((32513214976 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0007 : Poly :=
[
  term ((-65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (11, 1), (12, 3), (15, 1)],
  term ((-65026429952 : Rat) / 8578069) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 2), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0007
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0008 : Poly :=
[
  term ((-27409964400 : Rat) / 6529207) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0008 : Poly :=
[
  term ((54819928800 : Rat) / 6529207) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-54819928800 : Rat) / 6529207) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-27409964400 : Rat) / 6529207) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-27409964400 : Rat) / 6529207) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((27409964400 : Rat) / 6529207) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((27409964400 : Rat) / 6529207) [(0, 1), (11, 1), (13, 3)],
  term ((54819928800 : Rat) / 6529207) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-54819928800 : Rat) / 6529207) [(0, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0008
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0009 : Poly :=
[
  term ((-36698485221 : Rat) / 17156138) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0009 : Poly :=
[
  term ((36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36698485221 : Rat) / 17156138) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-36698485221 : Rat) / 17156138) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((36698485221 : Rat) / 8578069) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-36698485221 : Rat) / 8578069) [(0, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0009
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0010 : Poly :=
[
  term ((-49422491040 : Rat) / 150171761) [(0, 1), (11, 2)]
]

/-- Partial product 10 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0010 : Poly :=
[
  term ((98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((-98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((-49422491040 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2)],
  term ((-49422491040 : Rat) / 150171761) [(0, 1), (3, 2), (11, 2)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (11, 2), (13, 2)],
  term ((98844982080 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2)],
  term ((-98844982080 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0010
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0011 : Poly :=
[
  term ((7894118400 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0011 : Poly :=
[
  term ((-15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1)],
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (3, 2), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (13, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (11, 2), (12, 3)],
  term ((-15788236800 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2), (12, 1)],
  term ((15788236800 : Rat) / 150171761) [(0, 2), (11, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0011
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0012 : Poly :=
[
  term ((-1320342754824430155 : Rat) / 56007988161283) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0012 : Poly :=
[
  term ((2640685509648860310 : Rat) / 56007988161283) [(0, 1), (1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2640685509648860310 : Rat) / 56007988161283) [(0, 1), (1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-1320342754824430155 : Rat) / 56007988161283) [(0, 1), (2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1320342754824430155 : Rat) / 56007988161283) [(0, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((1320342754824430155 : Rat) / 56007988161283) [(0, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((1320342754824430155 : Rat) / 56007988161283) [(0, 1), (11, 2), (13, 3), (15, 1)],
  term ((2640685509648860310 : Rat) / 56007988161283) [(0, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2640685509648860310 : Rat) / 56007988161283) [(0, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0012
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0013 : Poly :=
[
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0013 : Poly :=
[
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (13, 2), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 3), (15, 1)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0013
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0014 : Poly :=
[
  term ((-2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0014 : Poly :=
[
  term ((4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (15, 1)],
  term ((-2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 3), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (11, 3), (13, 2), (15, 1)],
  term ((4761379987056044196 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (15, 1)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0014
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0015 : Poly :=
[
  term ((-103733034708 : Rat) / 8578069) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0015 : Poly :=
[
  term ((207466069416 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-207466069416 : Rat) / 8578069) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-103733034708 : Rat) / 8578069) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-103733034708 : Rat) / 8578069) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((103733034708 : Rat) / 8578069) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((103733034708 : Rat) / 8578069) [(0, 1), (13, 3), (15, 1)],
  term ((207466069416 : Rat) / 8578069) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-207466069416 : Rat) / 8578069) [(0, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0015
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0016 : Poly :=
[
  term ((61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0016 : Poly :=
[
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((61029914400 : Rat) / 150171761) [(1, 1), (2, 3), (11, 1)],
  term ((-122059828800 : Rat) / 150171761) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0016
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0017 : Poly :=
[
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0017 : Poly :=
[
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 2), (11, 2), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 3), (11, 2), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0017
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0018 : Poly :=
[
  term ((1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0018 : Poly :=
[
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(1, 1), (2, 3), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(1, 2), (2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0018
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0019 : Poly :=
[
  term ((33762040000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0019 : Poly :=
[
  term ((-67524080000 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((67524080000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((33762040000 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((33762040000 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-33762040000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-33762040000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 3)],
  term ((-67524080000 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((67524080000 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0019
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0020 : Poly :=
[
  term ((1626323341816985500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0020 : Poly :=
[
  term ((-3252646683633971000 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((3252646683633971000 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((1626323341816985500 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)],
  term ((1626323341816985500 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((-1626323341816985500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-1626323341816985500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 3), (15, 1)],
  term ((-3252646683633971000 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((3252646683633971000 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0020
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0021 : Poly :=
[
  term ((55855950320 : Rat) / 25734207) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0021 : Poly :=
[
  term ((-111711900640 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((111711900640 : Rat) / 25734207) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((55855950320 : Rat) / 25734207) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((55855950320 : Rat) / 25734207) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-55855950320 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-55855950320 : Rat) / 25734207) [(1, 1), (12, 3), (15, 1)],
  term ((-111711900640 : Rat) / 25734207) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((111711900640 : Rat) / 25734207) [(1, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0021
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0022 : Poly :=
[
  term ((42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0022 : Poly :=
[
  term ((85671739200 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((-85671739200 : Rat) / 150171761) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((85671739200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-85671739200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 2)],
  term ((42835869600 : Rat) / 150171761) [(2, 1), (3, 3), (11, 1)],
  term ((42835869600 : Rat) / 150171761) [(2, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0022
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0023 : Poly :=
[
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0023 : Poly :=
[
  term ((4126822585217517540 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(0, 1), (2, 2), (3, 1), (11, 2), (15, 1)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 3), (11, 2), (15, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 3), (3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0023
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0024 : Poly :=
[
  term ((-499743416 : Rat) / 8578069) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0024 : Poly :=
[
  term ((-999486832 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((999486832 : Rat) / 8578069) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-999486832 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((999486832 : Rat) / 8578069) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 1), (3, 3), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0024
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0025 : Poly :=
[
  term ((-1864952000 : Rat) / 8833633) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0025 : Poly :=
[
  term ((-3729904000 : Rat) / 8833633) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((3729904000 : Rat) / 8833633) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((3729904000 : Rat) / 8833633) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((-3729904000 : Rat) / 8833633) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((-1864952000 : Rat) / 8833633) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((1864952000 : Rat) / 8833633) [(2, 1), (5, 1), (11, 1), (12, 2)],
  term ((1864952000 : Rat) / 8833633) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((-1864952000 : Rat) / 8833633) [(2, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0025
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0026 : Poly :=
[
  term ((-89835062364959900 : Rat) / 75775513394677) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0026 : Poly :=
[
  term ((-179670124729919800 : Rat) / 75775513394677) [(0, 1), (2, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((179670124729919800 : Rat) / 75775513394677) [(0, 1), (2, 2), (5, 1), (11, 2), (15, 1)],
  term ((179670124729919800 : Rat) / 75775513394677) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-179670124729919800 : Rat) / 75775513394677) [(1, 1), (2, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-89835062364959900 : Rat) / 75775513394677) [(2, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((89835062364959900 : Rat) / 75775513394677) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((89835062364959900 : Rat) / 75775513394677) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-89835062364959900 : Rat) / 75775513394677) [(2, 3), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0026
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0027 : Poly :=
[
  term ((-7396281680 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 27 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0027 : Poly :=
[
  term ((-14792563360 : Rat) / 25734207) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((14792563360 : Rat) / 25734207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((14792563360 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((-14792563360 : Rat) / 25734207) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-7396281680 : Rat) / 25734207) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((7396281680 : Rat) / 25734207) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((7396281680 : Rat) / 25734207) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((-7396281680 : Rat) / 25734207) [(2, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0027
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0028 : Poly :=
[
  term ((-79414186400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 28 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0028 : Poly :=
[
  term ((-158828372800 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((158828372800 : Rat) / 150171761) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((158828372800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-158828372800 : Rat) / 150171761) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-79414186400 : Rat) / 150171761) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((79414186400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((79414186400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 2)],
  term ((-79414186400 : Rat) / 150171761) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0028
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0029 : Poly :=
[
  term ((-3825395177949110930 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 29 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0029 : Poly :=
[
  term ((-7650790355898221860 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((7650790355898221860 : Rat) / 1288183727709509) [(0, 1), (2, 2), (7, 1), (11, 2), (15, 1)],
  term ((7650790355898221860 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-7650790355898221860 : Rat) / 1288183727709509) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3825395177949110930 : Rat) / 1288183727709509) [(2, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((3825395177949110930 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((3825395177949110930 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-3825395177949110930 : Rat) / 1288183727709509) [(2, 3), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0029
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0030 : Poly :=
[
  term ((4827393992 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 30 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0030 : Poly :=
[
  term ((9654787984 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-9654787984 : Rat) / 25734207) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-9654787984 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((9654787984 : Rat) / 25734207) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((4827393992 : Rat) / 25734207) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((-4827393992 : Rat) / 25734207) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((-4827393992 : Rat) / 25734207) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((4827393992 : Rat) / 25734207) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0030
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0031 : Poly :=
[
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 31 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0031 : Poly :=
[
  term ((-4168012800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((4168012800 : Rat) / 150171761) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((-4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (12, 2)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((-2084006400 : Rat) / 150171761) [(2, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0031
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0032 : Poly :=
[
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 32 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0032 : Poly :=
[
  term ((-200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 2), (9, 1), (11, 2), (15, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (3, 2), (9, 1), (11, 2), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 3), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0032
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0033 : Poly :=
[
  term ((132427584 : Rat) / 8578069) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 33 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0033 : Poly :=
[
  term ((264855168 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0033
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0034 : Poly :=
[
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 34 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0034 : Poly :=
[
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 2), (10, 1), (11, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (3, 2), (10, 1), (11, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 3), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0034
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0035 : Poly :=
[
  term ((25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2)]
]

/-- Partial product 35 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0035 : Poly :=
[
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2), (12, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 2), (10, 1), (11, 2)],
  term ((-50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 2)],
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 2), (13, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (3, 2), (10, 1), (11, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 2)],
  term ((25008076800 : Rat) / 150171761) [(2, 3), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0035
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0036 : Poly :=
[
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (15, 1)]
]

/-- Partial product 36 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0036 : Poly :=
[
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 2), (10, 1), (11, 3), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 3), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (3, 2), (10, 1), (11, 3), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 2), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 3), (10, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0036
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0037 : Poly :=
[
  term ((-8880512000 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 37 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0037 : Poly :=
[
  term ((-17761024000 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((17761024000 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((17761024000 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-17761024000 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((-8880512000 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((8880512000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((8880512000 : Rat) / 150171761) [(2, 1), (11, 1), (13, 3)],
  term ((-8880512000 : Rat) / 150171761) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0037
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0038 : Poly :=
[
  term ((976123607416101072 : Rat) / 1288183727709509) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 38 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0038 : Poly :=
[
  term ((1952247214832202144 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1952247214832202144 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-1952247214832202144 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((1952247214832202144 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((976123607416101072 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-976123607416101072 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-976123607416101072 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((976123607416101072 : Rat) / 1288183727709509) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0038
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0039 : Poly :=
[
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (11, 2)]
]

/-- Partial product 39 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0039 : Poly :=
[
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2)],
  term ((12504038400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-12504038400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (3, 2), (11, 2)],
  term ((6252019200 : Rat) / 150171761) [(2, 1), (11, 2), (12, 2)],
  term ((6252019200 : Rat) / 150171761) [(2, 1), (11, 2), (13, 2)],
  term ((-6252019200 : Rat) / 150171761) [(2, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0039
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0040 : Poly :=
[
  term ((-427775808360094400 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0040 : Poly :=
[
  term ((-855551616720188800 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((855551616720188800 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (13, 1), (15, 1)],
  term ((855551616720188800 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-855551616720188800 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((-427775808360094400 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((427775808360094400 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((427775808360094400 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 3), (15, 1)],
  term ((-427775808360094400 : Rat) / 1288183727709509) [(2, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0040
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0041 : Poly :=
[
  term ((5146400677295674665 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 41 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0041 : Poly :=
[
  term ((10292801354591349330 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (15, 2)],
  term ((-10292801354591349330 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (15, 2)],
  term ((-10292801354591349330 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (15, 2)],
  term ((10292801354591349330 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)],
  term ((5146400677295674665 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (15, 2)],
  term ((-5146400677295674665 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 2), (15, 2)],
  term ((-5146400677295674665 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 2), (15, 2)],
  term ((5146400677295674665 : Rat) / 1288183727709509) [(2, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0041
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0042 : Poly :=
[
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 1)]
]

/-- Partial product 42 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0042 : Poly :=
[
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 3), (13, 1), (15, 1)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 3), (15, 1)],
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 1), (11, 3), (12, 2), (15, 1)],
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 1), (11, 3), (13, 2), (15, 1)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 3), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0042
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0043 : Poly :=
[
  term ((173783360 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 43 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0043 : Poly :=
[
  term ((347566720 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-347566720 : Rat) / 25734207) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-347566720 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((347566720 : Rat) / 25734207) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((173783360 : Rat) / 25734207) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-173783360 : Rat) / 25734207) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-173783360 : Rat) / 25734207) [(2, 1), (13, 3), (15, 1)],
  term ((173783360 : Rat) / 25734207) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0043
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0044 : Poly :=
[
  term ((3780091268 : Rat) / 8578069) [(2, 1), (15, 2)]
]

/-- Partial product 44 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0044 : Poly :=
[
  term ((7560182536 : Rat) / 8578069) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-7560182536 : Rat) / 8578069) [(0, 1), (2, 2), (15, 2)],
  term ((-7560182536 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((7560182536 : Rat) / 8578069) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((3780091268 : Rat) / 8578069) [(2, 1), (3, 2), (15, 2)],
  term ((-3780091268 : Rat) / 8578069) [(2, 1), (12, 2), (15, 2)],
  term ((-3780091268 : Rat) / 8578069) [(2, 1), (13, 2), (15, 2)],
  term ((3780091268 : Rat) / 8578069) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0044
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0045 : Poly :=
[
  term ((-11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 45 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0045 : Poly :=
[
  term ((22263371200 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-22263371200 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-22263371200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1)],
  term ((22263371200 : Rat) / 150171761) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((-11131685600 : Rat) / 150171761) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (12, 2)],
  term ((11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (13, 2)],
  term ((-11131685600 : Rat) / 150171761) [(3, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0045
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0046 : Poly :=
[
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 46 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0046 : Poly :=
[
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (3, 2), (4, 1), (11, 2), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(2, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 3), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0046
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0047 : Poly :=
[
  term ((8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 47 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0047 : Poly :=
[
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (12, 2), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0047
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0048 : Poly :=
[
  term ((-15588708800 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 48 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0048 : Poly :=
[
  term ((31177417600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((-31177417600 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-31177417600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((31177417600 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)],
  term ((-15588708800 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1)],
  term ((15588708800 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2)],
  term ((15588708800 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2)],
  term ((-15588708800 : Rat) / 150171761) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0048
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0049 : Poly :=
[
  term ((69910426400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 49 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0049 : Poly :=
[
  term ((-139820852800 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((139820852800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((139820852800 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-139820852800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((69910426400 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-69910426400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-69910426400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 3)],
  term ((69910426400 : Rat) / 150171761) [(3, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0049
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0050 : Poly :=
[
  term ((-191693968400 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 50 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0050 : Poly :=
[
  term ((383387936800 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-383387936800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-383387936800 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((383387936800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-191693968400 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((191693968400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((191693968400 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-191693968400 : Rat) / 150171761) [(3, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0050
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0051 : Poly :=
[
  term ((3367597404976073930 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 51 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0051 : Poly :=
[
  term ((-6735194809952147860 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((6735194809952147860 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((6735194809952147860 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-6735194809952147860 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((3367597404976073930 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3367597404976073930 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-3367597404976073930 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 3), (15, 1)],
  term ((3367597404976073930 : Rat) / 1288183727709509) [(3, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0051
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0052 : Poly :=
[
  term ((-9233931814974676205 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 52 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0052 : Poly :=
[
  term ((18467863629949352410 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-18467863629949352410 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-18467863629949352410 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((18467863629949352410 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (14, 1), (15, 1)],
  term ((-9233931814974676205 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((9233931814974676205 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((9233931814974676205 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-9233931814974676205 : Rat) / 1288183727709509) [(3, 3), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0052
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0053 : Poly :=
[
  term ((-750910815526190060 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 53 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0053 : Poly :=
[
  term ((1501821631052380120 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-1501821631052380120 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1501821631052380120 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((1501821631052380120 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((-750910815526190060 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((750910815526190060 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((750910815526190060 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-750910815526190060 : Rat) / 1288183727709509) [(3, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0053
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0054 : Poly :=
[
  term ((5293379128 : Rat) / 25734207) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 54 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0054 : Poly :=
[
  term ((-10586758256 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((10586758256 : Rat) / 25734207) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((10586758256 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10586758256 : Rat) / 25734207) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((5293379128 : Rat) / 25734207) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-5293379128 : Rat) / 25734207) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5293379128 : Rat) / 25734207) [(3, 1), (12, 3), (15, 1)],
  term ((5293379128 : Rat) / 25734207) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0054
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0055 : Poly :=
[
  term ((-12152160508 : Rat) / 25734207) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 55 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0055 : Poly :=
[
  term ((24304321016 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-24304321016 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-24304321016 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((24304321016 : Rat) / 25734207) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-12152160508 : Rat) / 25734207) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((12152160508 : Rat) / 25734207) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((12152160508 : Rat) / 25734207) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12152160508 : Rat) / 25734207) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0055
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0056 : Poly :=
[
  term ((-8954265376 : Rat) / 25734207) [(3, 1), (15, 1)]
]

/-- Partial product 56 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0056 : Poly :=
[
  term ((17908530752 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-17908530752 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-17908530752 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((17908530752 : Rat) / 25734207) [(1, 1), (3, 2), (15, 1)],
  term ((-8954265376 : Rat) / 25734207) [(2, 2), (3, 1), (15, 1)],
  term ((8954265376 : Rat) / 25734207) [(3, 1), (12, 2), (15, 1)],
  term ((8954265376 : Rat) / 25734207) [(3, 1), (13, 2), (15, 1)],
  term ((-8954265376 : Rat) / 25734207) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0056
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0057 : Poly :=
[
  term ((19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 57 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0057 : Poly :=
[
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((19009724800 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((19009724800 : Rat) / 150171761) [(3, 2), (4, 1), (7, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (12, 2)],
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0057
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0058 : Poly :=
[
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 58 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0058 : Poly :=
[
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(3, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0058
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0059 : Poly :=
[
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 59 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0059 : Poly :=
[
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0059
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0060 : Poly :=
[
  term ((367744999592473336 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 60 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0060 : Poly :=
[
  term ((-735489999184946672 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((735489999184946672 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-735489999184946672 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((735489999184946672 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((367744999592473336 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((367744999592473336 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-367744999592473336 : Rat) / 1288183727709509) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-367744999592473336 : Rat) / 1288183727709509) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0060_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0060
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0061 : Poly :=
[
  term ((-99715053600 : Rat) / 150171761) [(4, 1), (11, 2)]
]

/-- Partial product 61 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0061 : Poly :=
[
  term ((199430107200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((-199430107200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 1)],
  term ((199430107200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((-199430107200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((-99715053600 : Rat) / 150171761) [(2, 2), (4, 1), (11, 2)],
  term ((-99715053600 : Rat) / 150171761) [(3, 2), (4, 1), (11, 2)],
  term ((99715053600 : Rat) / 150171761) [(4, 1), (11, 2), (12, 2)],
  term ((99715053600 : Rat) / 150171761) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0061_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0061
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0062 : Poly :=
[
  term ((-379486519141296290 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 62 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0062 : Poly :=
[
  term ((758973038282592580 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (15, 2)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((758973038282592580 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 2), (15, 2)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-379486519141296290 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (15, 2)],
  term ((-379486519141296290 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 2), (15, 2)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 2), (15, 2)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0062_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0062
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0063 : Poly :=
[
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)]
]

/-- Partial product 63 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0063 : Poly :=
[
  term ((9606582967155529140 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 3), (15, 1)],
  term ((-9606582967155529140 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 1), (15, 1)],
  term ((9606582967155529140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 3), (15, 1)],
  term ((-9606582967155529140 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (15, 1)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 3), (15, 1)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 3), (15, 1)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 3), (12, 2), (15, 1)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0063_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0063
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0064 : Poly :=
[
  term ((-12051557464 : Rat) / 25734207) [(4, 1), (15, 2)]
]

/-- Partial product 64 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0064 : Poly :=
[
  term ((24103114928 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((-24103114928 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((24103114928 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((-24103114928 : Rat) / 25734207) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((-12051557464 : Rat) / 25734207) [(2, 2), (4, 1), (15, 2)],
  term ((-12051557464 : Rat) / 25734207) [(3, 2), (4, 1), (15, 2)],
  term ((12051557464 : Rat) / 25734207) [(4, 1), (12, 2), (15, 2)],
  term ((12051557464 : Rat) / 25734207) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0064_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0064
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0065 : Poly :=
[
  term ((-146701653600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 65 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0065 : Poly :=
[
  term ((293403307200 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1)],
  term ((-293403307200 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((-293403307200 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-146701653600 : Rat) / 150171761) [(2, 2), (5, 1), (10, 1), (11, 1)],
  term ((-146701653600 : Rat) / 150171761) [(3, 2), (5, 1), (10, 1), (11, 1)],
  term ((146701653600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 2)],
  term ((146701653600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0065_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0065
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0066 : Poly :=
[
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 66 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0066 : Poly :=
[
  term ((14133288363666994140 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(2, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(3, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0066_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0066
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0067 : Poly :=
[
  term ((-822900664 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 67 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0067 : Poly :=
[
  term ((1645801328 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(5, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0067_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0067
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0068 : Poly :=
[
  term ((36760027200 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 68 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0068 : Poly :=
[
  term ((-73520054400 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1)],
  term ((73520054400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((-73520054400 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((73520054400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((36760027200 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((36760027200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((-36760027200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2)],
  term ((-36760027200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0068_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0068
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0069 : Poly :=
[
  term ((-122059828800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 69 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0069 : Poly :=
[
  term ((244119657600 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-244119657600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((244119657600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-244119657600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-122059828800 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((-122059828800 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((122059828800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((122059828800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0069_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0069
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0070 : Poly :=
[
  term ((154579692800 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 70 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0070 : Poly :=
[
  term ((-309159385600 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((309159385600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-309159385600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1)],
  term ((309159385600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((154579692800 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((154579692800 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((-154579692800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-154579692800 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0070_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0070
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0071 : Poly :=
[
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 71 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0071 : Poly :=
[
  term ((11759286386463918120 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-11759286386463918120 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((11759286386463918120 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-11759286386463918120 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0071_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0071
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0072 : Poly :=
[
  term ((7446130700974793360 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 72 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0072 : Poly :=
[
  term ((-14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-14892261401949586720 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((7446130700974793360 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((7446130700974793360 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0072_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0072
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0073 : Poly :=
[
  term ((1770736906928233140 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 73 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0073 : Poly :=
[
  term ((-3541473813856466280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((3541473813856466280 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3541473813856466280 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((3541473813856466280 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((1770736906928233140 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((1770736906928233140 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-1770736906928233140 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1770736906928233140 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0073_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0073
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0074 : Poly :=
[
  term ((-3644774992 : Rat) / 8578069) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 74 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0074 : Poly :=
[
  term ((7289549984 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-7289549984 : Rat) / 8578069) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((7289549984 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-7289549984 : Rat) / 8578069) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0074_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0074
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0075 : Poly :=
[
  term ((14520259456 : Rat) / 25734207) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 75 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0075 : Poly :=
[
  term ((-29040518912 : Rat) / 25734207) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((29040518912 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-29040518912 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((29040518912 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((14520259456 : Rat) / 25734207) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((14520259456 : Rat) / 25734207) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0075_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0075
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0076 : Poly :=
[
  term ((5013279568 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 76 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0076 : Poly :=
[
  term ((-10026559136 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((10026559136 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-10026559136 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((10026559136 : Rat) / 8578069) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((5013279568 : Rat) / 8578069) [(2, 2), (5, 1), (15, 1)],
  term ((5013279568 : Rat) / 8578069) [(3, 2), (5, 1), (15, 1)],
  term ((-5013279568 : Rat) / 8578069) [(5, 1), (12, 2), (15, 1)],
  term ((-5013279568 : Rat) / 8578069) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0076_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0076
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0077 : Poly :=
[
  term (-384 : Rat) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 77 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0077 : Poly :=
[
  term (768 : Rat) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term (-768 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term (768 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term (-768 : Rat) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term (-384 : Rat) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term (-384 : Rat) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term (384 : Rat) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term (384 : Rat) [(7, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0077_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0077
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0078 : Poly :=
[
  term ((-40568488144 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 78 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0078 : Poly :=
[
  term ((81136976288 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((-81136976288 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((81136976288 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-81136976288 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-40568488144 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((-40568488144 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((40568488144 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2)],
  term ((40568488144 : Rat) / 150171761) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0078_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0078
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0079 : Poly :=
[
  term ((-328921600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 79 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0079 : Poly :=
[
  term ((657843200 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-657843200 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((657843200 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((-657843200 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-328921600 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-328921600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((328921600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((328921600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0079_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0079
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0080 : Poly :=
[
  term ((124976936000 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 80 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0080 : Poly :=
[
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((249953872000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-249953872000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((249953872000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((124976936000 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((124976936000 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-124976936000 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-124976936000 : Rat) / 150171761) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0080_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0080
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0081 : Poly :=
[
  term ((-15844210708469920 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 81 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0081 : Poly :=
[
  term ((31688421416939840 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0081_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0081
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0082 : Poly :=
[
  term ((6020160754669075700 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 82 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0082 : Poly :=
[
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(7, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0082_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0082
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0083 : Poly :=
[
  term ((-2648635919797345015 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 83 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0083 : Poly :=
[
  term ((5297271839594690030 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-5297271839594690030 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((5297271839594690030 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-5297271839594690030 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2648635919797345015 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-2648635919797345015 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((2648635919797345015 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((2648635919797345015 : Rat) / 1288183727709509) [(7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0083_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0083
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0084 : Poly :=
[
  term ((-4064151872 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 84 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0084 : Poly :=
[
  term ((8128303744 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0084_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0084
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0085 : Poly :=
[
  term ((-16761444560 : Rat) / 25734207) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 85 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0085 : Poly :=
[
  term ((33522889120 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-33522889120 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((33522889120 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-33522889120 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16761444560 : Rat) / 25734207) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-16761444560 : Rat) / 25734207) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0085_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0085
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0086 : Poly :=
[
  term ((2845056796 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 86 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0086 : Poly :=
[
  term ((-5690113592 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((5690113592 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-5690113592 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((5690113592 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((2845056796 : Rat) / 25734207) [(2, 2), (7, 1), (15, 1)],
  term ((2845056796 : Rat) / 25734207) [(3, 2), (7, 1), (15, 1)],
  term ((-2845056796 : Rat) / 25734207) [(7, 1), (12, 2), (15, 1)],
  term ((-2845056796 : Rat) / 25734207) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0086_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0086
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0087 : Poly :=
[
  term ((106350287200 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 87 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0087 : Poly :=
[
  term ((-212700574400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((212700574400 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-212700574400 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((212700574400 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((106350287200 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1)],
  term ((106350287200 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1)],
  term ((-106350287200 : Rat) / 150171761) [(9, 1), (11, 1), (12, 2)],
  term ((-106350287200 : Rat) / 150171761) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0087_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0087
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0088 : Poly :=
[
  term ((-4101286000 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 88 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0088 : Poly :=
[
  term ((8202572000 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-8202572000 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((8202572000 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((-8202572000 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4101286000 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-4101286000 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((4101286000 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((4101286000 : Rat) / 150171761) [(9, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0088_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0088
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0089 : Poly :=
[
  term ((-197559660295030075 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 89 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0089 : Poly :=
[
  term ((395119320590060150 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-395119320590060150 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((395119320590060150 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-395119320590060150 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-197559660295030075 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-197559660295030075 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((197559660295030075 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((197559660295030075 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0089_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0089
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0090 : Poly :=
[
  term ((5122911840703351390 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 90 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0090 : Poly :=
[
  term ((-10245823681406702780 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((10245823681406702780 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-10245823681406702780 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((10245823681406702780 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((5122911840703351390 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((5122911840703351390 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-5122911840703351390 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-5122911840703351390 : Rat) / 1288183727709509) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0090_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0090
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0091 : Poly :=
[
  term ((-2328155780 : Rat) / 25734207) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 91 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0091 : Poly :=
[
  term ((4656311560 : Rat) / 25734207) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-4656311560 : Rat) / 25734207) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((4656311560 : Rat) / 25734207) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((-4656311560 : Rat) / 25734207) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2328155780 : Rat) / 25734207) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2328155780 : Rat) / 25734207) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((2328155780 : Rat) / 25734207) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((2328155780 : Rat) / 25734207) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0091_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0091
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0092 : Poly :=
[
  term ((-1874984296 : Rat) / 25734207) [(9, 1), (15, 1)]
]

/-- Partial product 92 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0092 : Poly :=
[
  term ((3749968592 : Rat) / 25734207) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-3749968592 : Rat) / 25734207) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((3749968592 : Rat) / 25734207) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-3749968592 : Rat) / 25734207) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1874984296 : Rat) / 25734207) [(2, 2), (9, 1), (15, 1)],
  term ((-1874984296 : Rat) / 25734207) [(3, 2), (9, 1), (15, 1)],
  term ((1874984296 : Rat) / 25734207) [(9, 1), (12, 2), (15, 1)],
  term ((1874984296 : Rat) / 25734207) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0092_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0092
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0093 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 93 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0093 : Poly :=
[
  term ((32513214976 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0093_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0093
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0094 : Poly :=
[
  term ((4584878404687862663 : Rat) / 1288183727709509) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 94 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0094 : Poly :=
[
  term ((-9169756809375725326 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((9169756809375725326 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9169756809375725326 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((9169756809375725326 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((4584878404687862663 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((4584878404687862663 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-4584878404687862663 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-4584878404687862663 : Rat) / 1288183727709509) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0094_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0094
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0095 : Poly :=
[
  term ((239750429760 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 95 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0095 : Poly :=
[
  term ((-479500859520 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((479500859520 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-479500859520 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((479500859520 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((239750429760 : Rat) / 150171761) [(2, 2), (10, 1), (11, 2)],
  term ((239750429760 : Rat) / 150171761) [(3, 2), (10, 1), (11, 2)],
  term ((-239750429760 : Rat) / 150171761) [(10, 1), (11, 2), (12, 2)],
  term ((-239750429760 : Rat) / 150171761) [(10, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0095_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0095
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0096 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 96 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0096 : Poly :=
[
  term ((7894118400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 2)],
  term ((7894118400 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((-3947059200 : Rat) / 150171761) [(2, 2), (10, 1), (11, 2), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(3, 2), (10, 1), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (13, 2)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0096_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0096
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0097 : Poly :=
[
  term ((6414129000780933150 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 97 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0097 : Poly :=
[
  term ((-12828258001561866300 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (15, 2)],
  term ((12828258001561866300 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-12828258001561866300 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 2), (15, 2)],
  term ((12828258001561866300 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((6414129000780933150 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 2), (15, 2)],
  term ((6414129000780933150 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 2), (15, 2)],
  term ((-6414129000780933150 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 2), (15, 2)],
  term ((-6414129000780933150 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0097_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0097
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0098 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 98 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0098 : Poly :=
[
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (13, 2), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0098_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0098
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0099 : Poly :=
[
  term ((11548819921110858612 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 99 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0099 : Poly :=
[
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 3), (15, 1)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 3), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 3), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 2), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(10, 1), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0099_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0099
        rs_R013_ueqv_R013YNNN_generator_09_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_09_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_09_0000_0099 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_09_0000,
  rs_R013_ueqv_R013YNNN_partial_09_0001,
  rs_R013_ueqv_R013YNNN_partial_09_0002,
  rs_R013_ueqv_R013YNNN_partial_09_0003,
  rs_R013_ueqv_R013YNNN_partial_09_0004,
  rs_R013_ueqv_R013YNNN_partial_09_0005,
  rs_R013_ueqv_R013YNNN_partial_09_0006,
  rs_R013_ueqv_R013YNNN_partial_09_0007,
  rs_R013_ueqv_R013YNNN_partial_09_0008,
  rs_R013_ueqv_R013YNNN_partial_09_0009,
  rs_R013_ueqv_R013YNNN_partial_09_0010,
  rs_R013_ueqv_R013YNNN_partial_09_0011,
  rs_R013_ueqv_R013YNNN_partial_09_0012,
  rs_R013_ueqv_R013YNNN_partial_09_0013,
  rs_R013_ueqv_R013YNNN_partial_09_0014,
  rs_R013_ueqv_R013YNNN_partial_09_0015,
  rs_R013_ueqv_R013YNNN_partial_09_0016,
  rs_R013_ueqv_R013YNNN_partial_09_0017,
  rs_R013_ueqv_R013YNNN_partial_09_0018,
  rs_R013_ueqv_R013YNNN_partial_09_0019,
  rs_R013_ueqv_R013YNNN_partial_09_0020,
  rs_R013_ueqv_R013YNNN_partial_09_0021,
  rs_R013_ueqv_R013YNNN_partial_09_0022,
  rs_R013_ueqv_R013YNNN_partial_09_0023,
  rs_R013_ueqv_R013YNNN_partial_09_0024,
  rs_R013_ueqv_R013YNNN_partial_09_0025,
  rs_R013_ueqv_R013YNNN_partial_09_0026,
  rs_R013_ueqv_R013YNNN_partial_09_0027,
  rs_R013_ueqv_R013YNNN_partial_09_0028,
  rs_R013_ueqv_R013YNNN_partial_09_0029,
  rs_R013_ueqv_R013YNNN_partial_09_0030,
  rs_R013_ueqv_R013YNNN_partial_09_0031,
  rs_R013_ueqv_R013YNNN_partial_09_0032,
  rs_R013_ueqv_R013YNNN_partial_09_0033,
  rs_R013_ueqv_R013YNNN_partial_09_0034,
  rs_R013_ueqv_R013YNNN_partial_09_0035,
  rs_R013_ueqv_R013YNNN_partial_09_0036,
  rs_R013_ueqv_R013YNNN_partial_09_0037,
  rs_R013_ueqv_R013YNNN_partial_09_0038,
  rs_R013_ueqv_R013YNNN_partial_09_0039,
  rs_R013_ueqv_R013YNNN_partial_09_0040,
  rs_R013_ueqv_R013YNNN_partial_09_0041,
  rs_R013_ueqv_R013YNNN_partial_09_0042,
  rs_R013_ueqv_R013YNNN_partial_09_0043,
  rs_R013_ueqv_R013YNNN_partial_09_0044,
  rs_R013_ueqv_R013YNNN_partial_09_0045,
  rs_R013_ueqv_R013YNNN_partial_09_0046,
  rs_R013_ueqv_R013YNNN_partial_09_0047,
  rs_R013_ueqv_R013YNNN_partial_09_0048,
  rs_R013_ueqv_R013YNNN_partial_09_0049,
  rs_R013_ueqv_R013YNNN_partial_09_0050,
  rs_R013_ueqv_R013YNNN_partial_09_0051,
  rs_R013_ueqv_R013YNNN_partial_09_0052,
  rs_R013_ueqv_R013YNNN_partial_09_0053,
  rs_R013_ueqv_R013YNNN_partial_09_0054,
  rs_R013_ueqv_R013YNNN_partial_09_0055,
  rs_R013_ueqv_R013YNNN_partial_09_0056,
  rs_R013_ueqv_R013YNNN_partial_09_0057,
  rs_R013_ueqv_R013YNNN_partial_09_0058,
  rs_R013_ueqv_R013YNNN_partial_09_0059,
  rs_R013_ueqv_R013YNNN_partial_09_0060,
  rs_R013_ueqv_R013YNNN_partial_09_0061,
  rs_R013_ueqv_R013YNNN_partial_09_0062,
  rs_R013_ueqv_R013YNNN_partial_09_0063,
  rs_R013_ueqv_R013YNNN_partial_09_0064,
  rs_R013_ueqv_R013YNNN_partial_09_0065,
  rs_R013_ueqv_R013YNNN_partial_09_0066,
  rs_R013_ueqv_R013YNNN_partial_09_0067,
  rs_R013_ueqv_R013YNNN_partial_09_0068,
  rs_R013_ueqv_R013YNNN_partial_09_0069,
  rs_R013_ueqv_R013YNNN_partial_09_0070,
  rs_R013_ueqv_R013YNNN_partial_09_0071,
  rs_R013_ueqv_R013YNNN_partial_09_0072,
  rs_R013_ueqv_R013YNNN_partial_09_0073,
  rs_R013_ueqv_R013YNNN_partial_09_0074,
  rs_R013_ueqv_R013YNNN_partial_09_0075,
  rs_R013_ueqv_R013YNNN_partial_09_0076,
  rs_R013_ueqv_R013YNNN_partial_09_0077,
  rs_R013_ueqv_R013YNNN_partial_09_0078,
  rs_R013_ueqv_R013YNNN_partial_09_0079,
  rs_R013_ueqv_R013YNNN_partial_09_0080,
  rs_R013_ueqv_R013YNNN_partial_09_0081,
  rs_R013_ueqv_R013YNNN_partial_09_0082,
  rs_R013_ueqv_R013YNNN_partial_09_0083,
  rs_R013_ueqv_R013YNNN_partial_09_0084,
  rs_R013_ueqv_R013YNNN_partial_09_0085,
  rs_R013_ueqv_R013YNNN_partial_09_0086,
  rs_R013_ueqv_R013YNNN_partial_09_0087,
  rs_R013_ueqv_R013YNNN_partial_09_0088,
  rs_R013_ueqv_R013YNNN_partial_09_0089,
  rs_R013_ueqv_R013YNNN_partial_09_0090,
  rs_R013_ueqv_R013YNNN_partial_09_0091,
  rs_R013_ueqv_R013YNNN_partial_09_0092,
  rs_R013_ueqv_R013YNNN_partial_09_0093,
  rs_R013_ueqv_R013YNNN_partial_09_0094,
  rs_R013_ueqv_R013YNNN_partial_09_0095,
  rs_R013_ueqv_R013YNNN_partial_09_0096,
  rs_R013_ueqv_R013YNNN_partial_09_0097,
  rs_R013_ueqv_R013YNNN_partial_09_0098,
  rs_R013_ueqv_R013YNNN_partial_09_0099
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_09_0000_0099 : Poly :=
[
  term ((-6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 2)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((54535748800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((2626996509597988060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 3), (13, 1), (15, 1)],
  term ((-100777575664 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 2), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1)],
  term (-1152 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((54819928800 : Rat) / 6529207) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((-15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1)],
  term ((2640685509648860310 : Rat) / 56007988161283) [(0, 1), (1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (15, 1)],
  term ((207466069416 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1)],
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((67524080000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-54819928800 : Rat) / 6529207) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1)],
  term ((3252646683633971000 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((-2640685509648860310 : Rat) / 56007988161283) [(0, 1), (1, 1), (11, 2), (13, 2), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (13, 1), (15, 1)],
  term ((111711900640 : Rat) / 25734207) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-207466069416 : Rat) / 8578069) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((22263371200 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((31177417600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((-54149113600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((383387936800 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-2608372224734630320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((18467863629949352410 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((1501821631052380120 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-13585218752 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((24304321016 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((17908530752 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 2), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 2), (11, 3), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-735489999184946672 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((199430107200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((758973038282592580 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (15, 2)],
  term ((9606582967155529140 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 3), (15, 1)],
  term ((24103114928 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((293403307200 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1)],
  term ((-73520054400 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1)],
  term ((180711289600 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-309159385600 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((8704894266055281520 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-3541473813856466280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((7076086592 : Rat) / 25734207) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-29040518912 : Rat) / 25734207) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-10026559136 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term (768 : Rat) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((81136976288 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((-9304148800 : Rat) / 8833633) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-448182466734193060 : Rat) / 75775513394677) [(0, 1), (2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((5297271839594690030 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((17783091728 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((33522889120 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-5690113592 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((-212700574400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((4034559200 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((194345418727732790 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-10245823681406702780 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((5450877064 : Rat) / 25734207) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((3749968592 : Rat) / 25734207) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((29334952960 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9169756809375725326 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-479500859520 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((57910272000 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2), (12, 1)],
  term ((-12828258001561866300 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (15, 2)],
  term ((2789547879351206400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-17761024000 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((1952247214832202144 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((-855551616720188800 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((10292801354591349330 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (15, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (13, 2)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 2), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (13, 2), (15, 1)],
  term ((347566720 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((7560182536 : Rat) / 8578069) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-85671739200 : Rat) / 150171761) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(0, 1), (2, 2), (3, 1), (11, 2), (15, 1)],
  term ((999486832 : Rat) / 8578069) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((124438282400 : Rat) / 150171761) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((5994213717024616130 : Rat) / 1288183727709509) [(0, 1), (2, 2), (5, 1), (11, 2), (15, 1)],
  term ((20259725848 : Rat) / 25734207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((245327307136 : Rat) / 150171761) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((7650790355898221860 : Rat) / 1288183727709509) [(0, 1), (2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-9654787984 : Rat) / 25734207) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((4168012800 : Rat) / 150171761) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(0, 1), (2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 2), (10, 1), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 2), (10, 1), (11, 3), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-612668157200 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-9415570581334448469 : Rat) / 2576367455419018) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-36918452640 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (2, 2), (11, 2), (12, 1)],
  term ((-29512331744241704765 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-10292801354591349330 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (12, 1), (15, 1)],
  term ((-1778368287941040018 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 3), (15, 1)],
  term ((-311546670844 : Rat) / 25734207) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-7560182536 : Rat) / 8578069) [(0, 1), (2, 2), (15, 2)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 3), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 3), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 3), (11, 3), (15, 1)],
  term ((-22263371200 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-31177417600 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-383387936800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((139820852800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((-18467863629949352410 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1501821631052380120 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((6735194809952147860 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-24304321016 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17908530752 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((10586758256 : Rat) / 25734207) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term (576 : Rat) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-27409964400 : Rat) / 6529207) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-36698485221 : Rat) / 17156138) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-49422491040 : Rat) / 150171761) [(0, 1), (3, 2), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (3, 2), (11, 2), (12, 1)],
  term ((-1320342754824430155 : Rat) / 56007988161283) [(0, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 3), (12, 1), (15, 1)],
  term ((-2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 3), (15, 1)],
  term ((-103733034708 : Rat) / 8578069) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((735489999184946672 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-199430107200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2), (12, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-9606582967155529140 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (12, 1), (15, 1)],
  term ((-24103114928 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((-293403307200 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((73520054400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((309159385600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-305149572000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((3541473813856466280 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-14699107983079897650 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((29040518912 : Rat) / 25734207) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((10026559136 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-9111937480 : Rat) / 8578069) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term (-768 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-81136976288 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((249953872000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-87156777536 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term (-576 : Rat) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-5297271839594690030 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-33522889120 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((5690113592 : Rat) / 25734207) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((212700574400 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-8202572000 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((10245823681406702780 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-395119320590060150 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-3749968592 : Rat) / 25734207) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-4656311560 : Rat) / 25734207) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((9169756809375725326 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((479500859520 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((12828258001561866300 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 2)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((27409964400 : Rat) / 6529207) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (11, 1), (12, 3), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((27409964400 : Rat) / 6529207) [(0, 1), (11, 1), (13, 3)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (13, 2)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2)],
  term ((1320342754824430155 : Rat) / 56007988161283) [(0, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (11, 2), (12, 3)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (11, 2), (13, 2)],
  term ((1320342754824430155 : Rat) / 56007988161283) [(0, 1), (11, 2), (13, 3), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (13, 2), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 3), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (11, 3), (13, 2), (15, 1)],
  term ((103733034708 : Rat) / 8578069) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((103733034708 : Rat) / 8578069) [(0, 1), (13, 3), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(0, 2), (2, 1), (5, 1), (11, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 2), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 2), (2, 1), (5, 1), (15, 1)],
  term (-1152 : Rat) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-58669905920 : Rat) / 8578069) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((54819928800 : Rat) / 6529207) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((36698485221 : Rat) / 8578069) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((98844982080 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2)],
  term ((-115820544000 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2), (12, 1)],
  term ((2640685509648860310 : Rat) / 56007988161283) [(0, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5579095758702412800 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((4761379987056044196 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (15, 1)],
  term ((207466069416 : Rat) / 8578069) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(0, 2), (2, 2), (11, 1), (15, 1)],
  term ((100032307200 : Rat) / 150171761) [(0, 2), (2, 2), (11, 2)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(0, 2), (2, 2), (11, 3), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term (1152 : Rat) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-54819928800 : Rat) / 6529207) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-36698485221 : Rat) / 8578069) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 2), (11, 1), (12, 2), (15, 1)],
  term ((-98844982080 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((-2640685509648860310 : Rat) / 56007988161283) [(0, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((15788236800 : Rat) / 150171761) [(0, 2), (11, 2), (12, 2)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 2), (15, 1)],
  term ((-207466069416 : Rat) / 8578069) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((3729904000 : Rat) / 8833633) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((179670124729919800 : Rat) / 75775513394677) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((14792563360 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((158828372800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((7650790355898221860 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-9654787984 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (10, 1), (11, 3), (15, 1)],
  term ((103432763200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-1952247214832202144 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((4982374201937706340 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-10292801354591349330 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((-3346027216 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-7560182536 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-24641824800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-1187000988601538010 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((2821874328 : Rat) / 8578069) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-3729904000 : Rat) / 8833633) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((-179670124729919800 : Rat) / 75775513394677) [(1, 1), (2, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-14792563360 : Rat) / 25734207) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-158828372800 : Rat) / 150171761) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-7650790355898221860 : Rat) / 1288183727709509) [(1, 1), (2, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((9654787984 : Rat) / 25734207) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-4168012800 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 2), (13, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((1952247214832202144 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-78790938400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((10292801354591349330 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3795373213336168330 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 3), (13, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((7560182536 : Rat) / 8578069) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-5119595768 : Rat) / 25734207) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((33762040000 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((1626323341816985500 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)],
  term ((55855950320 : Rat) / 25734207) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(1, 1), (2, 3), (11, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 3), (11, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(1, 1), (2, 3), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((-22263371200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1)],
  term ((-735489999184946672 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((199430107200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((758973038282592580 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 2), (15, 2)],
  term ((9606582967155529140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 3), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((24103114928 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((-73520054400 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((244119657600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-309159385600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1)],
  term ((11759286386463918120 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-14892261401949586720 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-3541473813856466280 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((7289549984 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-29040518912 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((-10026559136 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term (768 : Rat) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((81136976288 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((657843200 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((-249953872000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((5297271839594690030 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((33522889120 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-5690113592 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-212700574400 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((8202572000 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((395119320590060150 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-10245823681406702780 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((4656311560 : Rat) / 25734207) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((3749968592 : Rat) / 25734207) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9169756809375725326 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-479500859520 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 2), (12, 1)],
  term ((-12828258001561866300 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 2), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 3), (15, 1)],
  term ((139820852800 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-31177417600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-383387936800 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((6735194809952147860 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18467863629949352410 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1501821631052380120 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((10586758256 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-24304321016 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-17908530752 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((22263371200 : Rat) / 150171761) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (3, 2), (4, 1), (11, 2), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((31177417600 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)],
  term ((-106058812800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((383387936800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-5108871468135162360 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((18467863629949352410 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (14, 1), (15, 1)],
  term ((1501821631052380120 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((15089730688 : Rat) / 8578069) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((24304321016 : Rat) / 25734207) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((17908530752 : Rat) / 25734207) [(1, 1), (3, 2), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((735489999184946672 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-199430107200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-9606582967155529140 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (15, 1)],
  term ((-24103114928 : Rat) / 25734207) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((-293403307200 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-244119657600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((73520054400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((309159385600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-11759286386463918120 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((3541473813856466280 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-7289549984 : Rat) / 8578069) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((29040518912 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((10026559136 : Rat) / 8578069) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term (-768 : Rat) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-657843200 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-81136976288 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((249953872000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5297271839594690030 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33522889120 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((5690113592 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-8202572000 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((212700574400 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-395119320590060150 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((10245823681406702780 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4656311560 : Rat) / 25734207) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3749968592 : Rat) / 25734207) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((9169756809375725326 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((479500859520 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((12828258001561866300 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((-33762040000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-33762040000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 3)],
  term ((-1626323341816985500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-1626323341816985500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 3), (15, 1)],
  term ((-55855950320 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-55855950320 : Rat) / 25734207) [(1, 1), (12, 3), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-67524080000 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((-3252646683633971000 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-111711900640 : Rat) / 25734207) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((67524080000 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((3252646683633971000 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((111711900640 : Rat) / 25734207) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 2)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-1864952000 : Rat) / 8833633) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((-89835062364959900 : Rat) / 75775513394677) [(2, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-7396281680 : Rat) / 25734207) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-79414186400 : Rat) / 150171761) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-3825395177949110930 : Rat) / 1288183727709509) [(2, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((4827393992 : Rat) / 25734207) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (3, 2), (9, 1), (11, 2), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (3, 2), (10, 1), (11, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (3, 2), (10, 1), (11, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (3, 2), (10, 1), (11, 3), (15, 1)],
  term ((-8880512000 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((976123607416101072 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (3, 2), (11, 2)],
  term ((-427775808360094400 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((5146400677295674665 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (15, 2)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 3), (15, 1)],
  term ((173783360 : Rat) / 25734207) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((3780091268 : Rat) / 8578069) [(2, 1), (3, 2), (15, 2)],
  term ((42835869600 : Rat) / 150171761) [(2, 1), (3, 3), (11, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 3), (11, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 1), (3, 3), (15, 1)],
  term ((1864952000 : Rat) / 8833633) [(2, 1), (5, 1), (11, 1), (12, 2)],
  term ((1864952000 : Rat) / 8833633) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((89835062364959900 : Rat) / 75775513394677) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((89835062364959900 : Rat) / 75775513394677) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((7396281680 : Rat) / 25734207) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((7396281680 : Rat) / 25734207) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((79414186400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((79414186400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 2)],
  term ((3825395177949110930 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((3825395177949110930 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-4827393992 : Rat) / 25734207) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((-4827393992 : Rat) / 25734207) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (12, 2)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 2), (15, 1)],
  term ((8880512000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((-976123607416101072 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-976123607416101072 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((8880512000 : Rat) / 150171761) [(2, 1), (11, 1), (13, 3)],
  term ((6252019200 : Rat) / 150171761) [(2, 1), (11, 2), (12, 2)],
  term ((427775808360094400 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-5146400677295674665 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 2), (15, 2)],
  term ((6252019200 : Rat) / 150171761) [(2, 1), (11, 2), (13, 2)],
  term ((-5146400677295674665 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 2), (15, 2)],
  term ((427775808360094400 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 3), (15, 1)],
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 1), (11, 3), (12, 2), (15, 1)],
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 1), (11, 3), (13, 2), (15, 1)],
  term ((-173783360 : Rat) / 25734207) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-3780091268 : Rat) / 8578069) [(2, 1), (12, 2), (15, 2)],
  term ((-3780091268 : Rat) / 8578069) [(2, 1), (13, 2), (15, 2)],
  term ((-173783360 : Rat) / 25734207) [(2, 1), (13, 3), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(2, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-15588708800 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1)],
  term ((69910426400 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-191693968400 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((3367597404976073930 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-9233931814974676205 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-750910815526190060 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((5293379128 : Rat) / 25734207) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-12152160508 : Rat) / 25734207) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-8954265376 : Rat) / 25734207) [(2, 2), (3, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((367744999592473336 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-99715053600 : Rat) / 150171761) [(2, 2), (4, 1), (11, 2)],
  term ((-379486519141296290 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (15, 2)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 3), (15, 1)],
  term ((-12051557464 : Rat) / 25734207) [(2, 2), (4, 1), (15, 2)],
  term ((-146701653600 : Rat) / 150171761) [(2, 2), (5, 1), (10, 1), (11, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(2, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((36760027200 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((-122059828800 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((154579692800 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((7446130700974793360 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((1770736906928233140 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((14520259456 : Rat) / 25734207) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((5013279568 : Rat) / 8578069) [(2, 2), (5, 1), (15, 1)],
  term (-384 : Rat) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((-40568488144 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((-328921600 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((124976936000 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2648635919797345015 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-16761444560 : Rat) / 25734207) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((2845056796 : Rat) / 25734207) [(2, 2), (7, 1), (15, 1)],
  term ((106350287200 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1)],
  term ((-4101286000 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-197559660295030075 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((5122911840703351390 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2328155780 : Rat) / 25734207) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1874984296 : Rat) / 25734207) [(2, 2), (9, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4584878404687862663 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((239750429760 : Rat) / 150171761) [(2, 2), (10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(2, 2), (10, 1), (11, 2), (12, 1)],
  term ((6414129000780933150 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 3), (15, 1)],
  term ((42835869600 : Rat) / 150171761) [(2, 3), (3, 1), (11, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 3), (3, 1), (11, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 3), (3, 1), (15, 1)],
  term ((-1864952000 : Rat) / 8833633) [(2, 3), (5, 1), (11, 1)],
  term ((-89835062364959900 : Rat) / 75775513394677) [(2, 3), (5, 1), (11, 2), (15, 1)],
  term ((-7396281680 : Rat) / 25734207) [(2, 3), (5, 1), (15, 1)],
  term ((-79414186400 : Rat) / 150171761) [(2, 3), (7, 1), (11, 1)],
  term ((-3825395177949110930 : Rat) / 1288183727709509) [(2, 3), (7, 1), (11, 2), (15, 1)],
  term ((4827393992 : Rat) / 25734207) [(2, 3), (7, 1), (15, 1)],
  term ((-2084006400 : Rat) / 150171761) [(2, 3), (9, 1), (11, 1)],
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 3), (9, 1), (11, 2), (15, 1)],
  term ((132427584 : Rat) / 8578069) [(2, 3), (9, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 3), (10, 1), (11, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 3), (10, 1), (11, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 3), (10, 1), (11, 3), (15, 1)],
  term ((-8880512000 : Rat) / 150171761) [(2, 3), (11, 1), (13, 1)],
  term ((976123607416101072 : Rat) / 1288183727709509) [(2, 3), (11, 1), (15, 1)],
  term ((-6252019200 : Rat) / 150171761) [(2, 3), (11, 2)],
  term ((-427775808360094400 : Rat) / 1288183727709509) [(2, 3), (11, 2), (13, 1), (15, 1)],
  term ((5146400677295674665 : Rat) / 1288183727709509) [(2, 3), (11, 2), (15, 2)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 3), (11, 3), (15, 1)],
  term ((173783360 : Rat) / 25734207) [(2, 3), (13, 1), (15, 1)],
  term ((3780091268 : Rat) / 8578069) [(2, 3), (15, 2)],
  term ((11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (12, 2)],
  term ((11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (13, 2)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (12, 2), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-69910426400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((15588708800 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2)],
  term ((191693968400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-69910426400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 3)],
  term ((15588708800 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2)],
  term ((191693968400 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3367597404976073930 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((9233931814974676205 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((750910815526190060 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-3367597404976073930 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 3), (15, 1)],
  term ((9233931814974676205 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((750910815526190060 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-5293379128 : Rat) / 25734207) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((12152160508 : Rat) / 25734207) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((8954265376 : Rat) / 25734207) [(3, 1), (12, 2), (15, 1)],
  term ((-5293379128 : Rat) / 25734207) [(3, 1), (12, 3), (15, 1)],
  term ((12152160508 : Rat) / 25734207) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((8954265376 : Rat) / 25734207) [(3, 1), (13, 2), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(3, 2), (4, 1), (7, 1), (11, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(3, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((367744999592473336 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-99715053600 : Rat) / 150171761) [(3, 2), (4, 1), (11, 2)],
  term ((-379486519141296290 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 2), (15, 2)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 3), (15, 1)],
  term ((-12051557464 : Rat) / 25734207) [(3, 2), (4, 1), (15, 2)],
  term ((-146701653600 : Rat) / 150171761) [(3, 2), (5, 1), (10, 1), (11, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(3, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((36760027200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((-122059828800 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((154579692800 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((7446130700974793360 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((1770736906928233140 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((14520259456 : Rat) / 25734207) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((5013279568 : Rat) / 8578069) [(3, 2), (5, 1), (15, 1)],
  term (-384 : Rat) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((-40568488144 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((-328921600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((124976936000 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2648635919797345015 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-16761444560 : Rat) / 25734207) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((2845056796 : Rat) / 25734207) [(3, 2), (7, 1), (15, 1)],
  term ((106350287200 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1)],
  term ((-4101286000 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-197559660295030075 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((5122911840703351390 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2328155780 : Rat) / 25734207) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1874984296 : Rat) / 25734207) [(3, 2), (9, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4584878404687862663 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((239750429760 : Rat) / 150171761) [(3, 2), (10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(3, 2), (10, 1), (11, 2), (12, 1)],
  term ((6414129000780933150 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 3), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(3, 3), (4, 1), (11, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 3), (4, 1), (11, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(3, 3), (4, 1), (15, 1)],
  term ((-15588708800 : Rat) / 150171761) [(3, 3), (11, 1)],
  term ((69910426400 : Rat) / 150171761) [(3, 3), (11, 1), (12, 1)],
  term ((-191693968400 : Rat) / 150171761) [(3, 3), (11, 1), (14, 1)],
  term ((3367597404976073930 : Rat) / 1288183727709509) [(3, 3), (11, 2), (12, 1), (15, 1)],
  term ((-9233931814974676205 : Rat) / 1288183727709509) [(3, 3), (11, 2), (14, 1), (15, 1)],
  term ((-750910815526190060 : Rat) / 1288183727709509) [(3, 3), (11, 2), (15, 1)],
  term ((5293379128 : Rat) / 25734207) [(3, 3), (12, 1), (15, 1)],
  term ((-12152160508 : Rat) / 25734207) [(3, 3), (14, 1), (15, 1)],
  term ((-8954265376 : Rat) / 25734207) [(3, 3), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (12, 2)],
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-367744999592473336 : Rat) / 1288183727709509) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-367744999592473336 : Rat) / 1288183727709509) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((99715053600 : Rat) / 150171761) [(4, 1), (11, 2), (12, 2)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 2), (15, 2)],
  term ((99715053600 : Rat) / 150171761) [(4, 1), (11, 2), (13, 2)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 2), (15, 2)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 3), (12, 2), (15, 1)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 3), (13, 2), (15, 1)],
  term ((12051557464 : Rat) / 25734207) [(4, 1), (12, 2), (15, 2)],
  term ((12051557464 : Rat) / 25734207) [(4, 1), (13, 2), (15, 2)],
  term ((146701653600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 2)],
  term ((146701653600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (13, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((-36760027200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2)],
  term ((-154579692800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((122059828800 : Rat) / 150171761) [(5, 1), (11, 1), (12, 3)],
  term ((-36760027200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2)],
  term ((-154579692800 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-1770736906928233140 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 3), (15, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-1770736906928233140 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-5013279568 : Rat) / 8578069) [(5, 1), (12, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(5, 1), (12, 3), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-5013279568 : Rat) / 8578069) [(5, 1), (13, 2), (15, 1)],
  term (384 : Rat) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term (384 : Rat) [(7, 1), (10, 1), (11, 1), (13, 2)],
  term ((328921600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((40568488144 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2)],
  term ((-124976936000 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((328921600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 3)],
  term ((40568488144 : Rat) / 150171761) [(7, 1), (11, 1), (13, 2)],
  term ((-124976936000 : Rat) / 150171761) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((2648635919797345015 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 3), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(7, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((2648635919797345015 : Rat) / 1288183727709509) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2845056796 : Rat) / 25734207) [(7, 1), (12, 2), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(7, 1), (12, 3), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2845056796 : Rat) / 25734207) [(7, 1), (13, 2), (15, 1)],
  term ((4101286000 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-106350287200 : Rat) / 150171761) [(9, 1), (11, 1), (12, 2)],
  term ((4101286000 : Rat) / 150171761) [(9, 1), (11, 1), (12, 3)],
  term ((-106350287200 : Rat) / 150171761) [(9, 1), (11, 1), (13, 2)],
  term ((197559660295030075 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-5122911840703351390 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((197559660295030075 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 3), (15, 1)],
  term ((-5122911840703351390 : Rat) / 1288183727709509) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((2328155780 : Rat) / 25734207) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((1874984296 : Rat) / 25734207) [(9, 1), (12, 2), (15, 1)],
  term ((2328155780 : Rat) / 25734207) [(9, 1), (12, 3), (15, 1)],
  term ((1874984296 : Rat) / 25734207) [(9, 1), (13, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4584878404687862663 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 3), (15, 1)],
  term ((-4584878404687862663 : Rat) / 1288183727709509) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (13, 2)],
  term ((-239750429760 : Rat) / 150171761) [(10, 1), (11, 2), (12, 2)],
  term ((-6414129000780933150 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 2), (15, 2)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 3)],
  term ((-239750429760 : Rat) / 150171761) [(10, 1), (11, 2), (13, 2)],
  term ((-6414129000780933150 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 2), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (13, 2), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 2), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 3), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(10, 1), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 99. -/
theorem rs_R013_ueqv_R013YNNN_block_09_0000_0099_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_09_0000_0099
      rs_R013_ueqv_R013YNNN_block_09_0000_0099 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
