/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 21:0-95

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_21_0000_0095 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0000 : Poly :=
[
  term ((-12437088980 : Rat) / 150171761) []
]

/-- Partial product 0 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0000 : Poly :=
[
  term ((-24874177960 : Rat) / 150171761) [(8, 1), (10, 1)],
  term ((-24874177960 : Rat) / 150171761) [(9, 1), (11, 1)],
  term ((12437088980 : Rat) / 150171761) [(10, 2)],
  term ((12437088980 : Rat) / 150171761) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0000
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0001 : Poly :=
[
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0001 : Poly :=
[
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 1)],
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 2), (11, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0001
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0002 : Poly :=
[
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0002 : Poly :=
[
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 2), (11, 2), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0002
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0003 : Poly :=
[
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (15, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0003 : Poly :=
[
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0003
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0004 : Poly :=
[
  term (576 : Rat) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0004 : Poly :=
[
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1)],
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0004
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0005 : Poly :=
[
  term ((-49422491040 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 5 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0005 : Poly :=
[
  term ((-98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0005
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0006 : Poly :=
[
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0006 : Poly :=
[
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0006
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0007 : Poly :=
[
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 7 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0007 : Poly :=
[
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 4), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0007
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0008 : Poly :=
[
  term ((-2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (15, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0008 : Poly :=
[
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 2), (11, 2), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0008
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0009 : Poly :=
[
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (12, 1), (15, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0009 : Poly :=
[
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0009
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0010 : Poly :=
[
  term ((-36698485221 : Rat) / 17156138) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 10 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0010 : Poly :=
[
  term ((-36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0010
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0011 : Poly :=
[
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 11 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0011 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 2), (11, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0011
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0012 : Poly :=
[
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (15, 2)]
]

/-- Partial product 12 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0012 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 3), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 2), (11, 2), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0012
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0013 : Poly :=
[
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (15, 2)]
]

/-- Partial product 13 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0013 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (8, 1), (10, 1), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (10, 2), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0013
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0014 : Poly :=
[
  term ((13546041600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 14 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0014 : Poly :=
[
  term ((27092083200 : Rat) / 150171761) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-13546041600 : Rat) / 150171761) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0014
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0015 : Poly :=
[
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 15 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0015 : Poly :=
[
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (9, 1), (11, 3), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0015
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0016 : Poly :=
[
  term ((-860779296 : Rat) / 8578069) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 16 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0016 : Poly :=
[
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0016
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0017 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 17 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0017 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0017
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0018 : Poly :=
[
  term ((419094441600 : Rat) / 150171761) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 18 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0018 : Poly :=
[
  term ((838188883200 : Rat) / 150171761) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((838188883200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-419094441600 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-419094441600 : Rat) / 150171761) [(0, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0018
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0019 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 19 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0019 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 3), (12, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (11, 4), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0019
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0020 : Poly :=
[
  term ((20187852179543518920 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 20 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0020 : Poly :=
[
  term ((40375704359087037840 : Rat) / 1288183727709509) [(0, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((40375704359087037840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 3), (15, 2)],
  term ((-20187852179543518920 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((-20187852179543518920 : Rat) / 1288183727709509) [(0, 1), (11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0020
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0021 : Poly :=
[
  term ((8128303744 : Rat) / 8578069) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 21 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0021 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (10, 2), (12, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0021
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0022 : Poly :=
[
  term ((-4182619296 : Rat) / 8578069) [(0, 1), (15, 2)]
]

/-- Partial product 22 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0022 : Poly :=
[
  term ((-8365238592 : Rat) / 8578069) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-8365238592 : Rat) / 8578069) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((4182619296 : Rat) / 8578069) [(0, 1), (10, 2), (15, 2)],
  term ((4182619296 : Rat) / 8578069) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0022
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0023 : Poly :=
[
  term ((25008076800 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 1)]
]

/-- Partial product 23 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0023 : Poly :=
[
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 1)],
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 2)],
  term ((-25008076800 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 3)],
  term ((-25008076800 : Rat) / 150171761) [(1, 1), (2, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0023
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0024 : Poly :=
[
  term ((1204643411173964160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 24 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0024 : Poly :=
[
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 4), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0024
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0025 : Poly :=
[
  term ((-1589131008 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 25 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0025 : Poly :=
[
  term ((-3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (8, 1), (10, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(1, 1), (2, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0025
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0026 : Poly :=
[
  term ((-113261095200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 26 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0026 : Poly :=
[
  term ((-226522190400 : Rat) / 150171761) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((-226522190400 : Rat) / 150171761) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((113261095200 : Rat) / 150171761) [(1, 1), (4, 1), (10, 2), (11, 1)],
  term ((113261095200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0026
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0027 : Poly :=
[
  term ((-5455806664630328490 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 27 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0027 : Poly :=
[
  term ((-10911613329260656980 : Rat) / 1288183727709509) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-10911613329260656980 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (11, 3), (15, 1)],
  term ((5455806664630328490 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 2), (11, 2), (15, 1)],
  term ((5455806664630328490 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0027
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0028 : Poly :=
[
  term ((3759615672 : Rat) / 8578069) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 28 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0028 : Poly :=
[
  term ((7519231344 : Rat) / 8578069) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((7519231344 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3759615672 : Rat) / 8578069) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((-3759615672 : Rat) / 8578069) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0028
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0029 : Poly :=
[
  term (96 : Rat) [(1, 1), (7, 1)]
]

/-- Partial product 29 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0029 : Poly :=
[
  term (192 : Rat) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (10, 2)],
  term (-96 : Rat) [(1, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0029
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0030 : Poly :=
[
  term (-384 : Rat) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 30 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0030 : Poly :=
[
  term (-768 : Rat) [(1, 1), (7, 1), (8, 1), (10, 2)],
  term (-768 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term (384 : Rat) [(1, 1), (7, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0030
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0031 : Poly :=
[
  term ((239750429760 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 31 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0031 : Poly :=
[
  term ((479500859520 : Rat) / 150171761) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((479500859520 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-239750429760 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3)],
  term ((-239750429760 : Rat) / 150171761) [(1, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0031
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0032 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 32 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0032 : Poly :=
[
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (8, 1), (10, 2), (11, 1), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (10, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0032
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0033 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 33 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0033 : Poly :=
[
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (8, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (10, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0033
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0034 : Poly :=
[
  term ((11548819921110858612 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 34 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0034 : Poly :=
[
  term ((23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(1, 1), (10, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0034
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0035 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 35 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0035 : Poly :=
[
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (10, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0035
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0036 : Poly :=
[
  term ((22924818583 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 36 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0036 : Poly :=
[
  term ((45849637166 : Rat) / 8578069) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((45849637166 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-22924818583 : Rat) / 8578069) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-22924818583 : Rat) / 8578069) [(1, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0036
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0037 : Poly :=
[
  term ((-182525334640 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 37 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0037 : Poly :=
[
  term ((-365050669280 : Rat) / 150171761) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-365050669280 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2)],
  term ((182525334640 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1)],
  term ((182525334640 : Rat) / 150171761) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0037
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0038 : Poly :=
[
  term ((-4275980800 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 38 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0038 : Poly :=
[
  term ((-8551961600 : Rat) / 150171761) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-8551961600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((4275980800 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((4275980800 : Rat) / 150171761) [(1, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0038
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0039 : Poly :=
[
  term ((-205974739210108960 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 39 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0039 : Poly :=
[
  term ((-411949478420217920 : Rat) / 1288183727709509) [(1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-411949478420217920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 1), (11, 4), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0039
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0040 : Poly :=
[
  term ((-8792277131298594043 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 40 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0040 : Poly :=
[
  term ((-17584554262597188086 : Rat) / 1288183727709509) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-17584554262597188086 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((8792277131298594043 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((8792277131298594043 : Rat) / 1288183727709509) [(1, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0040
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0041 : Poly :=
[
  term ((-52833974336 : Rat) / 25734207) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 41 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0041 : Poly :=
[
  term ((-105667948672 : Rat) / 25734207) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-105667948672 : Rat) / 25734207) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0041
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0042 : Poly :=
[
  term ((31268378395 : Rat) / 102936828) [(1, 1), (15, 1)]
]

/-- Partial product 42 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0042 : Poly :=
[
  term ((31268378395 : Rat) / 51468414) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((31268378395 : Rat) / 51468414) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-31268378395 : Rat) / 102936828) [(1, 1), (10, 2), (15, 1)],
  term ((-31268378395 : Rat) / 102936828) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0042
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0043 : Poly :=
[
  term ((-2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 43 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0043 : Poly :=
[
  term ((-4168012800 : Rat) / 150171761) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-4168012800 : Rat) / 150171761) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0043
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0044 : Poly :=
[
  term ((-100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 44 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0044 : Poly :=
[
  term ((-200773901862327360 : Rat) / 1288183727709509) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(2, 1), (7, 1), (9, 1), (11, 3), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (10, 2), (11, 2), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0044
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0045 : Poly :=
[
  term ((132427584 : Rat) / 8578069) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 45 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0045 : Poly :=
[
  term ((264855168 : Rat) / 8578069) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0045
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0046 : Poly :=
[
  term ((1042003200 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 46 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0046 : Poly :=
[
  term ((2084006400 : Rat) / 150171761) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1042003200 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((-1042003200 : Rat) / 150171761) [(2, 1), (9, 1), (11, 3)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0046
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0047 : Poly :=
[
  term ((50193475465581840 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 47 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0047 : Poly :=
[
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-50193475465581840 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-50193475465581840 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 4), (15, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0047
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0048 : Poly :=
[
  term ((-66213792 : Rat) / 8578069) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 48 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0048 : Poly :=
[
  term ((-132427584 : Rat) / 8578069) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((66213792 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((66213792 : Rat) / 8578069) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0048
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0049 : Poly :=
[
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 49 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0049 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 3), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0049
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0050 : Poly :=
[
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 50 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0050 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (8, 1), (10, 2), (11, 2), (15, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 3), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 4), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0050
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0051 : Poly :=
[
  term ((794565504 : Rat) / 8578069) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 51 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0051 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(2, 1), (8, 1), (10, 2), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0051
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0052 : Poly :=
[
  term ((163798733212753728 : Rat) / 1288183727709509) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 52 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0052 : Poly :=
[
  term ((327597466425507456 : Rat) / 1288183727709509) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((327597466425507456 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-163798733212753728 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-163798733212753728 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0052
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0053 : Poly :=
[
  term ((6252019200 : Rat) / 150171761) [(2, 1), (11, 2)]
]

/-- Partial product 53 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0053 : Poly :=
[
  term ((12504038400 : Rat) / 150171761) [(2, 1), (8, 1), (10, 1), (11, 2)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 3)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (10, 2), (11, 2)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0053
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0054 : Poly :=
[
  term ((1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 54 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0054 : Poly :=
[
  term ((2509673773279092000 : Rat) / 1288183727709509) [(2, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((2509673773279092000 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 3), (15, 2)],
  term ((-1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (15, 2)],
  term ((-1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0054
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0055 : Poly :=
[
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 1)]
]

/-- Partial product 55 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0055 : Poly :=
[
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (8, 1), (10, 1), (11, 3), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 4), (15, 1)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 3), (15, 1)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0055
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0056 : Poly :=
[
  term ((-1655344800 : Rat) / 8578069) [(2, 1), (15, 2)]
]

/-- Partial product 56 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0056 : Poly :=
[
  term ((-3310689600 : Rat) / 8578069) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-3310689600 : Rat) / 8578069) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((1655344800 : Rat) / 8578069) [(2, 1), (10, 2), (15, 2)],
  term ((1655344800 : Rat) / 8578069) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0056
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0057 : Poly :=
[
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 57 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0057 : Poly :=
[
  term ((-96184660800 : Rat) / 150171761) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-96184660800 : Rat) / 150171761) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (10, 2), (11, 1), (15, 1)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0057
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0058 : Poly :=
[
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 58 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0058 : Poly :=
[
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 3), (15, 2)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (10, 2), (11, 2), (15, 2)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0058
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0059 : Poly :=
[
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (15, 2)]
]

/-- Partial product 59 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0059 : Poly :=
[
  term ((-2497616592 : Rat) / 8578069) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-2497616592 : Rat) / 8578069) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (10, 2), (15, 2)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0059
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0060 : Poly :=
[
  term ((24046165200 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 60 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0060 : Poly :=
[
  term ((48092330400 : Rat) / 150171761) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((48092330400 : Rat) / 150171761) [(5, 1), (9, 1), (11, 2)],
  term ((-24046165200 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1)],
  term ((-24046165200 : Rat) / 150171761) [(5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0060_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0060
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0061 : Poly :=
[
  term ((1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 61 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0061 : Poly :=
[
  term ((2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (9, 1), (11, 3), (15, 1)],
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0061_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0061
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0062 : Poly :=
[
  term ((624404148 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 62 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0062 : Poly :=
[
  term ((1248808296 : Rat) / 8578069) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-624404148 : Rat) / 8578069) [(5, 1), (10, 2), (15, 1)],
  term ((-624404148 : Rat) / 8578069) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0062_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0062
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0063 : Poly :=
[
  term (-176 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 63 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0063 : Poly :=
[
  term (-352 : Rat) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term (176 : Rat) [(7, 1), (9, 1), (10, 2)],
  term (176 : Rat) [(7, 1), (9, 1), (11, 2)],
  term (-352 : Rat) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0063_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0063
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0064 : Poly :=
[
  term ((5500603169 : Rat) / 8578069) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 64 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0064 : Poly :=
[
  term ((11001206338 : Rat) / 8578069) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((11001206338 : Rat) / 8578069) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5500603169 : Rat) / 8578069) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-5500603169 : Rat) / 8578069) [(7, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0064_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0064
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0065 : Poly :=
[
  term ((-32498571236 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 65 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0065 : Poly :=
[
  term ((-64997142472 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-64997142472 : Rat) / 150171761) [(7, 1), (9, 1), (11, 2)],
  term ((32498571236 : Rat) / 150171761) [(7, 1), (10, 2), (11, 1)],
  term ((32498571236 : Rat) / 150171761) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0065_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0065
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0066 : Poly :=
[
  term ((328921600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 66 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0066 : Poly :=
[
  term ((657843200 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((657843200 : Rat) / 150171761) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-328921600 : Rat) / 150171761) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-328921600 : Rat) / 150171761) [(7, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0066_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0066
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0067 : Poly :=
[
  term ((15844210708469920 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 67 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0067 : Poly :=
[
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(7, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(7, 1), (11, 4), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0067_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0067
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0068 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 68 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0068 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (9, 1), (11, 3), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(7, 1), (10, 2), (11, 2), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(7, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0068_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0068
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0069 : Poly :=
[
  term ((4064151872 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 69 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0069 : Poly :=
[
  term ((8128303744 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0069_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0069
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0070 : Poly :=
[
  term ((-6478684912 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 70 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0070 : Poly :=
[
  term ((-12957369824 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-12957369824 : Rat) / 25734207) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((6478684912 : Rat) / 25734207) [(7, 1), (10, 2), (15, 1)],
  term ((6478684912 : Rat) / 25734207) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0070_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0070
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0071 : Poly :=
[
  term (32 : Rat) [(7, 2)]
]

/-- Partial product 71 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0071 : Poly :=
[
  term (64 : Rat) [(7, 2), (8, 1), (10, 1)],
  term (64 : Rat) [(7, 2), (9, 1), (11, 1)],
  term (-32 : Rat) [(7, 2), (10, 2)],
  term (-32 : Rat) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0071_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0071
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0072 : Poly :=
[
  term ((-3853613921 : Rat) / 17156138) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 72 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0072 : Poly :=
[
  term ((-3853613921 : Rat) / 8578069) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((3853613921 : Rat) / 17156138) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((3853613921 : Rat) / 17156138) [(9, 1), (10, 3), (15, 1)],
  term ((-3853613921 : Rat) / 8578069) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0072_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0072
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0073 : Poly :=
[
  term ((9041041090 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 73 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0073 : Poly :=
[
  term ((18082082180 : Rat) / 150171761) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-9041041090 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)],
  term ((-9041041090 : Rat) / 150171761) [(9, 1), (11, 3)],
  term ((18082082180 : Rat) / 150171761) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0073_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0073
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0074 : Poly :=
[
  term ((-164460800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 74 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0074 : Poly :=
[
  term ((-328921600 : Rat) / 150171761) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((164460800 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((164460800 : Rat) / 150171761) [(9, 1), (11, 3), (12, 1)],
  term ((-328921600 : Rat) / 150171761) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0074_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0074
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0075 : Poly :=
[
  term ((-7922105354234960 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 75 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0075 : Poly :=
[
  term ((-15844210708469920 : Rat) / 1288183727709509) [(8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((7922105354234960 : Rat) / 1288183727709509) [(9, 1), (11, 4), (12, 1), (15, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(9, 2), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0075_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0075
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0076 : Poly :=
[
  term ((3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 76 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0076 : Poly :=
[
  term ((3484068180475701389 : Rat) / 5152734910838036) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (11, 4), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0076_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0076
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0077 : Poly :=
[
  term ((-2032075936 : Rat) / 25734207) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 77 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0077 : Poly :=
[
  term ((-4064151872 : Rat) / 25734207) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2032075936 : Rat) / 25734207) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((2032075936 : Rat) / 25734207) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0077_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0077
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0078 : Poly :=
[
  term ((1386479552 : Rat) / 25734207) [(9, 1), (15, 1)]
]

/-- Partial product 78 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0078 : Poly :=
[
  term ((2772959104 : Rat) / 25734207) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1386479552 : Rat) / 25734207) [(9, 1), (10, 2), (15, 1)],
  term ((-1386479552 : Rat) / 25734207) [(9, 1), (11, 2), (15, 1)],
  term ((2772959104 : Rat) / 25734207) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0078_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0078
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0079 : Poly :=
[
  term (80 : Rat) [(9, 2)]
]

/-- Partial product 79 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0079 : Poly :=
[
  term (160 : Rat) [(8, 1), (9, 2), (10, 1)],
  term (-80 : Rat) [(9, 2), (10, 2)],
  term (-80 : Rat) [(9, 2), (11, 2)],
  term (160 : Rat) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0079_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0079
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0080 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 80 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0080 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(10, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0080_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0080
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0081 : Poly :=
[
  term ((-81400409880 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 81 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0081 : Poly :=
[
  term ((-162800819760 : Rat) / 150171761) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-162800819760 : Rat) / 150171761) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((81400409880 : Rat) / 150171761) [(10, 1), (11, 3), (15, 1)],
  term ((81400409880 : Rat) / 150171761) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0081_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0081
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0082 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 82 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0082 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(8, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 3), (12, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 4), (12, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 3), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0082_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0082
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0083 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 83 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0083 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(8, 1), (10, 2), (11, 2), (15, 2)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 3), (15, 2)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(10, 1), (11, 4), (15, 2)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(10, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0083_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0083
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0084 : Poly :=
[
  term ((8128303744 : Rat) / 8578069) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 84 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0084 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(10, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0084_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0084
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0085 : Poly :=
[
  term ((-26095795363 : Rat) / 17156138) [(10, 1), (15, 2)]
]

/-- Partial product 85 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0085 : Poly :=
[
  term ((-26095795363 : Rat) / 8578069) [(8, 1), (10, 2), (15, 2)],
  term ((-26095795363 : Rat) / 8578069) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((26095795363 : Rat) / 17156138) [(10, 1), (11, 2), (15, 2)],
  term ((26095795363 : Rat) / 17156138) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0085_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0085
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0086 : Poly :=
[
  term ((-608910087499491392 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 86 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0086 : Poly :=
[
  term ((-1217820174998982784 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1217820174998982784 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((608910087499491392 : Rat) / 1288183727709509) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((608910087499491392 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0086_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0086
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0087 : Poly :=
[
  term ((35654290754345261 : Rat) / 151551026789354) [(11, 1), (15, 1)]
]

/-- Partial product 87 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0087 : Poly :=
[
  term ((35654290754345261 : Rat) / 75775513394677) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((35654290754345261 : Rat) / 75775513394677) [(9, 1), (11, 2), (15, 1)],
  term ((-35654290754345261 : Rat) / 151551026789354) [(10, 2), (11, 1), (15, 1)],
  term ((-35654290754345261 : Rat) / 151551026789354) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0087_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0087
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0088 : Poly :=
[
  term ((40700204940 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 88 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0088 : Poly :=
[
  term ((81400409880 : Rat) / 150171761) [(8, 1), (10, 1), (11, 2)],
  term ((81400409880 : Rat) / 150171761) [(9, 1), (11, 3)],
  term ((-40700204940 : Rat) / 150171761) [(10, 2), (11, 2)],
  term ((-40700204940 : Rat) / 150171761) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0088_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0088
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0089 : Poly :=
[
  term ((-986764800 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 89 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0089 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(9, 1), (11, 3), (12, 1)],
  term ((986764800 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1)],
  term ((986764800 : Rat) / 150171761) [(11, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0089_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0089
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0090 : Poly :=
[
  term ((7922105354234960 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 90 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0090 : Poly :=
[
  term ((15844210708469920 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(9, 1), (11, 3), (12, 1), (15, 2)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(11, 4), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0090_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0090
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0091 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(11, 2), (15, 2)]
]

/-- Partial product 91 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0091 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(9, 1), (11, 3), (15, 2)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(10, 2), (11, 2), (15, 2)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0091_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0091
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0092 : Poly :=
[
  term ((-47532632125409760 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 92 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0092 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(9, 1), (11, 4), (12, 1), (15, 1)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (15, 1)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(11, 5), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0092_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0092
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0093 : Poly :=
[
  term ((7842143817216848487 : Rat) / 5152734910838036) [(11, 3), (15, 1)]
]

/-- Partial product 93 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0093 : Poly :=
[
  term ((7842143817216848487 : Rat) / 2576367455419018) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (11, 4), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(10, 2), (11, 3), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0093_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0093
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0094 : Poly :=
[
  term ((2032075936 : Rat) / 25734207) [(12, 1), (15, 2)]
]

/-- Partial product 94 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0094 : Poly :=
[
  term ((4064151872 : Rat) / 25734207) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((4064151872 : Rat) / 25734207) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2032075936 : Rat) / 25734207) [(10, 2), (12, 1), (15, 2)],
  term ((-2032075936 : Rat) / 25734207) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0094_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0094
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 21. -/
def rs_R013_ueqv_R013YNNN_coefficient_21_0095 : Poly :=
[
  term ((-1386479552 : Rat) / 25734207) [(15, 2)]
]

/-- Partial product 95 for generator 21. -/
def rs_R013_ueqv_R013YNNN_partial_21_0095 : Poly :=
[
  term ((-2772959104 : Rat) / 25734207) [(8, 1), (10, 1), (15, 2)],
  term ((-2772959104 : Rat) / 25734207) [(9, 1), (11, 1), (15, 2)],
  term ((1386479552 : Rat) / 25734207) [(10, 2), (15, 2)],
  term ((1386479552 : Rat) / 25734207) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 21. -/
theorem rs_R013_ueqv_R013YNNN_partial_21_0095_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_21_0095
        rs_R013_ueqv_R013YNNN_generator_21_0000_0095 =
      rs_R013_ueqv_R013YNNN_partial_21_0095 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_21_0000_0095 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_21_0000,
  rs_R013_ueqv_R013YNNN_partial_21_0001,
  rs_R013_ueqv_R013YNNN_partial_21_0002,
  rs_R013_ueqv_R013YNNN_partial_21_0003,
  rs_R013_ueqv_R013YNNN_partial_21_0004,
  rs_R013_ueqv_R013YNNN_partial_21_0005,
  rs_R013_ueqv_R013YNNN_partial_21_0006,
  rs_R013_ueqv_R013YNNN_partial_21_0007,
  rs_R013_ueqv_R013YNNN_partial_21_0008,
  rs_R013_ueqv_R013YNNN_partial_21_0009,
  rs_R013_ueqv_R013YNNN_partial_21_0010,
  rs_R013_ueqv_R013YNNN_partial_21_0011,
  rs_R013_ueqv_R013YNNN_partial_21_0012,
  rs_R013_ueqv_R013YNNN_partial_21_0013,
  rs_R013_ueqv_R013YNNN_partial_21_0014,
  rs_R013_ueqv_R013YNNN_partial_21_0015,
  rs_R013_ueqv_R013YNNN_partial_21_0016,
  rs_R013_ueqv_R013YNNN_partial_21_0017,
  rs_R013_ueqv_R013YNNN_partial_21_0018,
  rs_R013_ueqv_R013YNNN_partial_21_0019,
  rs_R013_ueqv_R013YNNN_partial_21_0020,
  rs_R013_ueqv_R013YNNN_partial_21_0021,
  rs_R013_ueqv_R013YNNN_partial_21_0022,
  rs_R013_ueqv_R013YNNN_partial_21_0023,
  rs_R013_ueqv_R013YNNN_partial_21_0024,
  rs_R013_ueqv_R013YNNN_partial_21_0025,
  rs_R013_ueqv_R013YNNN_partial_21_0026,
  rs_R013_ueqv_R013YNNN_partial_21_0027,
  rs_R013_ueqv_R013YNNN_partial_21_0028,
  rs_R013_ueqv_R013YNNN_partial_21_0029,
  rs_R013_ueqv_R013YNNN_partial_21_0030,
  rs_R013_ueqv_R013YNNN_partial_21_0031,
  rs_R013_ueqv_R013YNNN_partial_21_0032,
  rs_R013_ueqv_R013YNNN_partial_21_0033,
  rs_R013_ueqv_R013YNNN_partial_21_0034,
  rs_R013_ueqv_R013YNNN_partial_21_0035,
  rs_R013_ueqv_R013YNNN_partial_21_0036,
  rs_R013_ueqv_R013YNNN_partial_21_0037,
  rs_R013_ueqv_R013YNNN_partial_21_0038,
  rs_R013_ueqv_R013YNNN_partial_21_0039,
  rs_R013_ueqv_R013YNNN_partial_21_0040,
  rs_R013_ueqv_R013YNNN_partial_21_0041,
  rs_R013_ueqv_R013YNNN_partial_21_0042,
  rs_R013_ueqv_R013YNNN_partial_21_0043,
  rs_R013_ueqv_R013YNNN_partial_21_0044,
  rs_R013_ueqv_R013YNNN_partial_21_0045,
  rs_R013_ueqv_R013YNNN_partial_21_0046,
  rs_R013_ueqv_R013YNNN_partial_21_0047,
  rs_R013_ueqv_R013YNNN_partial_21_0048,
  rs_R013_ueqv_R013YNNN_partial_21_0049,
  rs_R013_ueqv_R013YNNN_partial_21_0050,
  rs_R013_ueqv_R013YNNN_partial_21_0051,
  rs_R013_ueqv_R013YNNN_partial_21_0052,
  rs_R013_ueqv_R013YNNN_partial_21_0053,
  rs_R013_ueqv_R013YNNN_partial_21_0054,
  rs_R013_ueqv_R013YNNN_partial_21_0055,
  rs_R013_ueqv_R013YNNN_partial_21_0056,
  rs_R013_ueqv_R013YNNN_partial_21_0057,
  rs_R013_ueqv_R013YNNN_partial_21_0058,
  rs_R013_ueqv_R013YNNN_partial_21_0059,
  rs_R013_ueqv_R013YNNN_partial_21_0060,
  rs_R013_ueqv_R013YNNN_partial_21_0061,
  rs_R013_ueqv_R013YNNN_partial_21_0062,
  rs_R013_ueqv_R013YNNN_partial_21_0063,
  rs_R013_ueqv_R013YNNN_partial_21_0064,
  rs_R013_ueqv_R013YNNN_partial_21_0065,
  rs_R013_ueqv_R013YNNN_partial_21_0066,
  rs_R013_ueqv_R013YNNN_partial_21_0067,
  rs_R013_ueqv_R013YNNN_partial_21_0068,
  rs_R013_ueqv_R013YNNN_partial_21_0069,
  rs_R013_ueqv_R013YNNN_partial_21_0070,
  rs_R013_ueqv_R013YNNN_partial_21_0071,
  rs_R013_ueqv_R013YNNN_partial_21_0072,
  rs_R013_ueqv_R013YNNN_partial_21_0073,
  rs_R013_ueqv_R013YNNN_partial_21_0074,
  rs_R013_ueqv_R013YNNN_partial_21_0075,
  rs_R013_ueqv_R013YNNN_partial_21_0076,
  rs_R013_ueqv_R013YNNN_partial_21_0077,
  rs_R013_ueqv_R013YNNN_partial_21_0078,
  rs_R013_ueqv_R013YNNN_partial_21_0079,
  rs_R013_ueqv_R013YNNN_partial_21_0080,
  rs_R013_ueqv_R013YNNN_partial_21_0081,
  rs_R013_ueqv_R013YNNN_partial_21_0082,
  rs_R013_ueqv_R013YNNN_partial_21_0083,
  rs_R013_ueqv_R013YNNN_partial_21_0084,
  rs_R013_ueqv_R013YNNN_partial_21_0085,
  rs_R013_ueqv_R013YNNN_partial_21_0086,
  rs_R013_ueqv_R013YNNN_partial_21_0087,
  rs_R013_ueqv_R013YNNN_partial_21_0088,
  rs_R013_ueqv_R013YNNN_partial_21_0089,
  rs_R013_ueqv_R013YNNN_partial_21_0090,
  rs_R013_ueqv_R013YNNN_partial_21_0091,
  rs_R013_ueqv_R013YNNN_partial_21_0092,
  rs_R013_ueqv_R013YNNN_partial_21_0093,
  rs_R013_ueqv_R013YNNN_partial_21_0094,
  rs_R013_ueqv_R013YNNN_partial_21_0095
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_21_0000_0095 : Poly :=
[
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-100032307200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 2)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 2), (11, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 2), (11, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 3)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 4), (15, 1)],
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1)],
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((-98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1)],
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-36698485221 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-98844982080 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((15788236800 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-4761379987056044196 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (15, 1)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (10, 2), (12, 1), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((36698485221 : Rat) / 17156138) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((49422491040 : Rat) / 150171761) [(0, 1), (1, 1), (11, 3)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 3), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 4), (12, 1), (15, 1)],
  term ((2380689993528022098 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 4), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (8, 1), (10, 1), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 3), (15, 2)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (10, 2), (11, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 2), (11, 2), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (10, 2), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 4), (15, 2)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (9, 1), (11, 3), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 3)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 4), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((838188883200 : Rat) / 150171761) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((40375704359087037840 : Rat) / 1288183727709509) [(0, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-8365238592 : Rat) / 8578069) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8365238592 : Rat) / 8578069) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((838188883200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 3), (12, 1), (15, 2)],
  term ((40375704359087037840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 3), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-419094441600 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-20187852179543518920 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (10, 2), (12, 1), (15, 2)],
  term ((4182619296 : Rat) / 8578069) [(0, 1), (10, 2), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((4182619296 : Rat) / 8578069) [(0, 1), (11, 2), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((-419094441600 : Rat) / 150171761) [(0, 1), (11, 3), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (11, 4), (12, 1), (15, 2)],
  term ((-20187852179543518920 : Rat) / 1288183727709509) [(0, 1), (11, 4), (15, 2)],
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (8, 1), (10, 2), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 3)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 4), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(1, 1), (2, 1), (10, 3), (11, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 3), (11, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(1, 1), (2, 1), (10, 3), (15, 1)],
  term ((-226522190400 : Rat) / 150171761) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1)],
  term ((-10911613329260656980 : Rat) / 1288183727709509) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((7519231344 : Rat) / 8578069) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((7519231344 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-226522190400 : Rat) / 150171761) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((-10911613329260656980 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (11, 3), (15, 1)],
  term ((113261095200 : Rat) / 150171761) [(1, 1), (4, 1), (10, 2), (11, 1)],
  term ((5455806664630328490 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 2), (11, 2), (15, 1)],
  term ((-3759615672 : Rat) / 8578069) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((-3759615672 : Rat) / 8578069) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((113261095200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 3)],
  term ((5455806664630328490 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 4), (15, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term (-768 : Rat) [(1, 1), (7, 1), (8, 1), (10, 2)],
  term (-768 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term (-96 : Rat) [(1, 1), (7, 1), (10, 2)],
  term (384 : Rat) [(1, 1), (7, 1), (10, 3)],
  term (-96 : Rat) [(1, 1), (7, 1), (11, 2)],
  term ((-365050669280 : Rat) / 150171761) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-8551961600 : Rat) / 150171761) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-411949478420217920 : Rat) / 1288183727709509) [(1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-17584554262597188086 : Rat) / 1288183727709509) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-105667948672 : Rat) / 25734207) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((31268378395 : Rat) / 51468414) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((479500859520 : Rat) / 150171761) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (8, 1), (10, 2), (11, 1), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (8, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((45849637166 : Rat) / 8578069) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((45849637166 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((479500859520 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((23097639842221717224 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-105667948672 : Rat) / 25734207) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((31268378395 : Rat) / 51468414) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-365050669280 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2)],
  term ((-8551961600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-411949478420217920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-17584554262597188086 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-22924818583 : Rat) / 8578069) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-239750429760 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3), (12, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (12, 1), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((182525334640 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1)],
  term ((4275980800 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((8792277131298594043 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-31268378395 : Rat) / 102936828) [(1, 1), (10, 2), (15, 1)],
  term ((-239750429760 : Rat) / 150171761) [(1, 1), (10, 3), (11, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (10, 3), (11, 1), (12, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (10, 3), (11, 2), (12, 1), (15, 1)],
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(1, 1), (10, 3), (11, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (10, 3), (12, 1), (15, 1)],
  term ((-22924818583 : Rat) / 8578069) [(1, 1), (10, 3), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-31268378395 : Rat) / 102936828) [(1, 1), (11, 2), (15, 1)],
  term ((182525334640 : Rat) / 150171761) [(1, 1), (11, 3)],
  term ((4275980800 : Rat) / 150171761) [(1, 1), (11, 3), (12, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 1), (11, 4), (12, 1), (15, 1)],
  term ((8792277131298594043 : Rat) / 1288183727709509) [(1, 1), (11, 4), (15, 1)],
  term ((-4168012800 : Rat) / 150171761) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(2, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((264855168 : Rat) / 8578069) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4168012800 : Rat) / 150171761) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((-200773901862327360 : Rat) / 1288183727709509) [(2, 1), (7, 1), (9, 1), (11, 3), (15, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (10, 2), (11, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 3)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 4), (15, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((327597466425507456 : Rat) / 1288183727709509) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (8, 1), (10, 1), (11, 2)],
  term ((2509673773279092000 : Rat) / 1288183727709509) [(2, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (8, 1), (10, 1), (11, 3), (15, 1)],
  term ((-3310689600 : Rat) / 8578069) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (8, 1), (10, 2), (11, 2), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (8, 1), (10, 2), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 3), (15, 2)],
  term ((-1042003200 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((-50193475465581840 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((66213792 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-3310689600 : Rat) / 8578069) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((337540908172635168 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((11462035200 : Rat) / 150171761) [(2, 1), (9, 1), (11, 3)],
  term ((2509673773279092000 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 3), (15, 2)],
  term ((552128230121400240 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 4), (15, 1)],
  term ((-132427584 : Rat) / 8578069) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((2084006400 : Rat) / 150171761) [(2, 1), (9, 2), (11, 2)],
  term ((100386950931163680 : Rat) / 1288183727709509) [(2, 1), (9, 2), (11, 3), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 3), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 4), (15, 2)],
  term ((-163798733212753728 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (10, 2), (11, 2)],
  term ((-1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (15, 2)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 3), (15, 1)],
  term ((1655344800 : Rat) / 8578069) [(2, 1), (10, 2), (15, 2)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 3), (11, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 3), (11, 2), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (10, 3), (15, 2)],
  term ((1655344800 : Rat) / 8578069) [(2, 1), (11, 2), (15, 2)],
  term ((-163798733212753728 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 1)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (11, 4)],
  term ((-1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (11, 4), (15, 2)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (11, 5), (15, 1)],
  term ((-96184660800 : Rat) / 150171761) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-2497616592 : Rat) / 8578069) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-2497616592 : Rat) / 8578069) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-96184660800 : Rat) / 150171761) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 3), (15, 2)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (10, 2), (11, 1), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (10, 2), (11, 2), (15, 2)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (10, 2), (15, 2)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (11, 2), (15, 2)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (11, 3), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (11, 4), (15, 2)],
  term ((48092330400 : Rat) / 150171761) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((48092330400 : Rat) / 150171761) [(5, 1), (9, 1), (11, 2)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (9, 1), (11, 3), (15, 1)],
  term ((-24046165200 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1)],
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-624404148 : Rat) / 8578069) [(5, 1), (10, 2), (15, 1)],
  term ((-624404148 : Rat) / 8578069) [(5, 1), (11, 2), (15, 1)],
  term ((-24046165200 : Rat) / 150171761) [(5, 1), (11, 3)],
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (11, 4), (15, 1)],
  term (-352 : Rat) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-64997142472 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((657843200 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-12957369824 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((11001206338 : Rat) / 8578069) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((11001206338 : Rat) / 8578069) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term (176 : Rat) [(7, 1), (9, 1), (10, 2)],
  term ((8128303744 : Rat) / 25734207) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12957369824 : Rat) / 25734207) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-38566912536 : Rat) / 150171761) [(7, 1), (9, 1), (11, 2)],
  term ((657843200 : Rat) / 150171761) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (9, 1), (11, 3), (15, 1)],
  term (-352 : Rat) [(7, 1), (9, 2), (11, 1)],
  term ((-5500603169 : Rat) / 8578069) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((32498571236 : Rat) / 150171761) [(7, 1), (10, 2), (11, 1)],
  term ((-328921600 : Rat) / 150171761) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(7, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(7, 1), (10, 2), (11, 2), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((6478684912 : Rat) / 25734207) [(7, 1), (10, 2), (15, 1)],
  term ((-5500603169 : Rat) / 8578069) [(7, 1), (10, 3), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((6478684912 : Rat) / 25734207) [(7, 1), (11, 2), (15, 1)],
  term ((32498571236 : Rat) / 150171761) [(7, 1), (11, 3)],
  term ((-328921600 : Rat) / 150171761) [(7, 1), (11, 3), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(7, 1), (11, 4), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(7, 1), (11, 4), (15, 1)],
  term (64 : Rat) [(7, 2), (8, 1), (10, 1)],
  term (64 : Rat) [(7, 2), (9, 1), (11, 1)],
  term (-32 : Rat) [(7, 2), (10, 2)],
  term (-32 : Rat) [(7, 2), (11, 2)],
  term ((18082082180 : Rat) / 150171761) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-328921600 : Rat) / 150171761) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2772959104 : Rat) / 25734207) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3853613921 : Rat) / 8578069) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term (160 : Rat) [(8, 1), (9, 2), (10, 1)],
  term ((-24874177960 : Rat) / 150171761) [(8, 1), (10, 1)],
  term ((-1217820174998982784 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((35654290754345261 : Rat) / 75775513394677) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((81400409880 : Rat) / 150171761) [(8, 1), (10, 1), (11, 2)],
  term ((-1973529600 : Rat) / 150171761) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-2772959104 : Rat) / 25734207) [(8, 1), (10, 1), (15, 2)],
  term ((3947059200 : Rat) / 150171761) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-162800819760 : Rat) / 150171761) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(8, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(8, 1), (10, 2), (11, 2), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-26095795363 : Rat) / 8578069) [(8, 1), (10, 2), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-26095795363 : Rat) / 8578069) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((3947059200 : Rat) / 150171761) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2214329341585001999 : Rat) / 2576367455419018) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 3), (12, 1), (15, 2)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 3), (15, 2)],
  term ((-9041041090 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)],
  term ((164460800 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((2032075936 : Rat) / 25734207) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1386479552 : Rat) / 25734207) [(9, 1), (10, 2), (15, 1)],
  term ((3853613921 : Rat) / 17156138) [(9, 1), (10, 3), (15, 1)],
  term ((-24874177960 : Rat) / 150171761) [(9, 1), (11, 1)],
  term ((4064151872 : Rat) / 25734207) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2772959104 : Rat) / 25734207) [(9, 1), (11, 1), (15, 2)],
  term ((-3348300103202105056 : Rat) / 3864551183128527) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((94715220738663367 : Rat) / 227326540184031) [(9, 1), (11, 2), (15, 1)],
  term ((72359368790 : Rat) / 150171761) [(9, 1), (11, 3)],
  term ((-1809068800 : Rat) / 150171761) [(9, 1), (11, 3), (12, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(9, 1), (11, 3), (12, 1), (15, 2)],
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(9, 1), (11, 3), (15, 2)],
  term ((-87143158896584560 : Rat) / 1288183727709509) [(9, 1), (11, 4), (12, 1), (15, 1)],
  term ((27884507088391692559 : Rat) / 10305469821676072) [(9, 1), (11, 4), (15, 1)],
  term ((-3853613921 : Rat) / 8578069) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term (-80 : Rat) [(9, 2), (10, 2)],
  term ((-4064151872 : Rat) / 25734207) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2772959104 : Rat) / 25734207) [(9, 2), (11, 1), (15, 1)],
  term ((6068341300 : Rat) / 150171761) [(9, 2), (11, 2)],
  term ((-328921600 : Rat) / 150171761) [(9, 2), (11, 2), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(9, 2), (11, 3), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(9, 2), (11, 3), (15, 1)],
  term (160 : Rat) [(9, 3), (11, 1)],
  term ((-8128303744 : Rat) / 8578069) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((26095795363 : Rat) / 17156138) [(10, 1), (11, 2), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((81400409880 : Rat) / 150171761) [(10, 1), (11, 3), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 4), (12, 1), (15, 2)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(10, 1), (11, 4), (15, 2)],
  term ((12437088980 : Rat) / 150171761) [(10, 2)],
  term ((608910087499491392 : Rat) / 1288183727709509) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-35654290754345261 : Rat) / 151551026789354) [(10, 2), (11, 1), (15, 1)],
  term ((-40700204940 : Rat) / 150171761) [(10, 2), (11, 2)],
  term ((986764800 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(10, 2), (11, 2), (15, 2)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(10, 2), (11, 3), (15, 1)],
  term ((-2032075936 : Rat) / 25734207) [(10, 2), (12, 1), (15, 2)],
  term ((1386479552 : Rat) / 25734207) [(10, 2), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(10, 3), (11, 1), (12, 1), (15, 1)],
  term ((81400409880 : Rat) / 150171761) [(10, 3), (11, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 3), (11, 2), (12, 1), (15, 2)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(10, 3), (11, 2), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(10, 3), (12, 1), (15, 2)],
  term ((26095795363 : Rat) / 17156138) [(10, 3), (15, 2)],
  term ((12437088980 : Rat) / 150171761) [(11, 2)],
  term ((-2032075936 : Rat) / 25734207) [(11, 2), (12, 1), (15, 2)],
  term ((1386479552 : Rat) / 25734207) [(11, 2), (15, 2)],
  term ((608910087499491392 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)],
  term ((-35654290754345261 : Rat) / 151551026789354) [(11, 3), (15, 1)],
  term ((-40700204940 : Rat) / 150171761) [(11, 4)],
  term ((986764800 : Rat) / 150171761) [(11, 4), (12, 1)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(11, 4), (12, 1), (15, 2)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(11, 4), (15, 2)],
  term ((47532632125409760 : Rat) / 1288183727709509) [(11, 5), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 95. -/
theorem rs_R013_ueqv_R013YNNN_block_21_0000_0095_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_21_0000_0095
      rs_R013_ueqv_R013YNNN_block_21_0000_0095 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
