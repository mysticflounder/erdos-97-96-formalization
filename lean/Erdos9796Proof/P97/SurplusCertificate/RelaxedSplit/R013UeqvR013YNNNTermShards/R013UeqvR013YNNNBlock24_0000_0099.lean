/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 24:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_24_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0000 : Poly :=
[
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 0 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0000 : Poly :=
[
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 3), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 3), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0000
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0001 : Poly :=
[
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0001 : Poly :=
[
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (14, 2), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (15, 3)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (15, 2)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 3), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 3), (11, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 2), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 3), (1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0001
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0002 : Poly :=
[
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0002 : Poly :=
[
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (15, 3)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 3), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0002
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0003 : Poly :=
[
  term ((12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0003 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 2)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (1, 2), (2, 1), (9, 1), (11, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 2), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 3), (2, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0003
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0004 : Poly :=
[
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 4 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0004 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (1, 2), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 3)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 3), (15, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 2), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 3), (2, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0004
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0005 : Poly :=
[
  term ((-794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (15, 1)]
]

/-- Partial product 5 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0005 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (15, 3)],
  term ((1589131008 : Rat) / 8578069) [(0, 2), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 3), (2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0005
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0006 : Poly :=
[
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0006 : Poly :=
[
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((3178262016 : Rat) / 8578069) [(0, 2), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 3), (2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0006
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0007 : Poly :=
[
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)]
]

/-- Partial product 7 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0007 : Poly :=
[
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 3)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (1, 2), (2, 1), (11, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2), (14, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (14, 2)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 2), (2, 1), (10, 1), (11, 2)],
  term ((25008076800 : Rat) / 150171761) [(0, 3), (2, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0007
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0008 : Poly :=
[
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0008 : Poly :=
[
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 4), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (1, 2), (2, 1), (11, 3), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (14, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 3)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 4), (15, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 2), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 3), (2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0008
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0009 : Poly :=
[
  term ((-94791954400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0009 : Poly :=
[
  term ((189583908800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((-94791954400 : Rat) / 150171761) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-189583908800 : Rat) / 150171761) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((94791954400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((94791954400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-189583908800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((189583908800 : Rat) / 150171761) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-94791954400 : Rat) / 150171761) [(0, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0009
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0010 : Poly :=
[
  term ((-4566144938432965030 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0010 : Poly :=
[
  term ((9132289876865930060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-4566144938432965030 : Rat) / 1288183727709509) [(0, 1), (1, 2), (3, 1), (11, 2), (15, 1)],
  term ((-9132289876865930060 : Rat) / 1288183727709509) [(0, 1), (3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((4566144938432965030 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (14, 2), (15, 1)],
  term ((4566144938432965030 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 3)],
  term ((-9132289876865930060 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 3), (15, 2)],
  term ((9132289876865930060 : Rat) / 1288183727709509) [(0, 2), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4566144938432965030 : Rat) / 1288183727709509) [(0, 3), (3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0010
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0011 : Poly :=
[
  term ((-61323112808 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 11 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0011 : Poly :=
[
  term ((122646225616 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-61323112808 : Rat) / 25734207) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-122646225616 : Rat) / 25734207) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-122646225616 : Rat) / 25734207) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((61323112808 : Rat) / 25734207) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((61323112808 : Rat) / 25734207) [(0, 1), (3, 1), (15, 3)],
  term ((122646225616 : Rat) / 25734207) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-61323112808 : Rat) / 25734207) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0011
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0012 : Poly :=
[
  term ((-155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 12 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0012 : Poly :=
[
  term ((310403428000 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 2)],
  term ((-155201714000 : Rat) / 150171761) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((-310403428000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (14, 2)],
  term ((155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-310403428000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((310403428000 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((-155201714000 : Rat) / 150171761) [(0, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0012
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0013 : Poly :=
[
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0013 : Poly :=
[
  term ((14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 3), (15, 1)],
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (1, 2), (5, 1), (11, 2), (15, 1)],
  term ((-14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 3)],
  term ((-14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 3), (15, 2)],
  term ((14952187140836514850 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 3), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0013
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0014 : Poly :=
[
  term ((-5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0014 : Poly :=
[
  term ((10299513560 : Rat) / 25734207) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-5149756780 : Rat) / 25734207) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((-10299513560 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-10299513560 : Rat) / 25734207) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (15, 3)],
  term ((10299513560 : Rat) / 25734207) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-5149756780 : Rat) / 25734207) [(0, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0014
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0015 : Poly :=
[
  term (-384 : Rat) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 15 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0015 : Poly :=
[
  term (768 : Rat) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term (-384 : Rat) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term (-768 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (384 : Rat) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term (384 : Rat) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term (-768 : Rat) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term (768 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term (-384 : Rat) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0015
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0016 : Poly :=
[
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0016 : Poly :=
[
  term ((865280966400 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-865280966400 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-865280966400 : Rat) / 150171761) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((865280966400 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-432640483200 : Rat) / 150171761) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0016
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0017 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 17 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0017 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 3), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0017
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0018 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0018 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (1, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 3)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 3), (12, 1), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 3), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0018
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0019 : Poly :=
[
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 19 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0019 : Poly :=
[
  term ((41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (15, 3)],
  term ((-41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 3), (15, 2)],
  term ((41680734721192165680 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 3), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0019
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0020 : Poly :=
[
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0020 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((16256607488 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 3), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0020
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0021 : Poly :=
[
  term ((5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 21 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0021 : Poly :=
[
  term ((-10086797184 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((10086797184 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((10086797184 : Rat) / 8578069) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (15, 3)],
  term ((-10086797184 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0021
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0022 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0022 : Poly :=
[
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((32513214976 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0022
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0023 : Poly :=
[
  term ((329957620200 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 23 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0023 : Poly :=
[
  term ((-659915240400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((329957620200 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((659915240400 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-329957620200 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-329957620200 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((659915240400 : Rat) / 150171761) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-659915240400 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((329957620200 : Rat) / 150171761) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0023
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0024 : Poly :=
[
  term ((5489113808496453375 : Rat) / 1288183727709509) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 24 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0024 : Poly :=
[
  term ((-10978227616992906750 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((5489113808496453375 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((10978227616992906750 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-5489113808496453375 : Rat) / 1288183727709509) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-5489113808496453375 : Rat) / 1288183727709509) [(0, 1), (11, 1), (15, 3)],
  term ((10978227616992906750 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)],
  term ((-10978227616992906750 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((5489113808496453375 : Rat) / 1288183727709509) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0024
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0025 : Poly :=
[
  term ((287234302560 : Rat) / 150171761) [(0, 1), (11, 2)]
]

/-- Partial product 25 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0025 : Poly :=
[
  term ((-574468605120 : Rat) / 150171761) [(0, 1), (1, 1), (11, 3)],
  term ((287234302560 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2)],
  term ((574468605120 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((-287234302560 : Rat) / 150171761) [(0, 1), (11, 2), (14, 2)],
  term ((-287234302560 : Rat) / 150171761) [(0, 1), (11, 2), (15, 2)],
  term ((574468605120 : Rat) / 150171761) [(0, 1), (11, 3), (15, 1)],
  term ((-574468605120 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((287234302560 : Rat) / 150171761) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0025
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0026 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1)]
]

/-- Partial product 26 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0026 : Poly :=
[
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 3), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 2)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((7894118400 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 3), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0026
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0027 : Poly :=
[
  term ((31788231963568770105 : Rat) / 2576367455419018) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 27 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0027 : Poly :=
[
  term ((-31788231963568770105 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (13, 1), (15, 1)],
  term ((31788231963568770105 : Rat) / 2576367455419018) [(0, 1), (1, 2), (11, 2), (13, 1), (15, 1)],
  term ((31788231963568770105 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-31788231963568770105 : Rat) / 2576367455419018) [(0, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-31788231963568770105 : Rat) / 2576367455419018) [(0, 1), (11, 2), (13, 1), (15, 3)],
  term ((31788231963568770105 : Rat) / 1288183727709509) [(0, 1), (11, 3), (13, 1), (15, 2)],
  term ((-31788231963568770105 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((31788231963568770105 : Rat) / 2576367455419018) [(0, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0027
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0028 : Poly :=
[
  term ((9229178073914009025 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 28 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0028 : Poly :=
[
  term ((-18458356147828018050 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (15, 2)],
  term ((9229178073914009025 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (15, 2)],
  term ((18458356147828018050 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-9229178073914009025 : Rat) / 1288183727709509) [(0, 1), (11, 2), (14, 2), (15, 2)],
  term ((-9229178073914009025 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 4)],
  term ((18458356147828018050 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 3)],
  term ((-18458356147828018050 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((9229178073914009025 : Rat) / 1288183727709509) [(0, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0028
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0029 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 29 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0029 : Poly :=
[
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 4), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 3)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (11, 4), (12, 1), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 3), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0029
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0030 : Poly :=
[
  term ((13836126336674274222 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 1)]
]

/-- Partial product 30 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0030 : Poly :=
[
  term ((-27672252673348548444 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 4), (15, 1)],
  term ((13836126336674274222 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 3), (15, 1)],
  term ((27672252673348548444 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-13836126336674274222 : Rat) / 1288183727709509) [(0, 1), (11, 3), (14, 2), (15, 1)],
  term ((-13836126336674274222 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 3)],
  term ((27672252673348548444 : Rat) / 1288183727709509) [(0, 1), (11, 4), (15, 2)],
  term ((-27672252673348548444 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((13836126336674274222 : Rat) / 1288183727709509) [(0, 3), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0030
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0031 : Poly :=
[
  term ((52370180018 : Rat) / 8578069) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 31 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0031 : Poly :=
[
  term ((-104740360036 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((52370180018 : Rat) / 8578069) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((104740360036 : Rat) / 8578069) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((104740360036 : Rat) / 8578069) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-52370180018 : Rat) / 8578069) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-52370180018 : Rat) / 8578069) [(0, 1), (13, 1), (15, 3)],
  term ((-104740360036 : Rat) / 8578069) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((52370180018 : Rat) / 8578069) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0031
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0032 : Poly :=
[
  term ((-3936896860 : Rat) / 8578069) [(0, 1), (15, 2)]
]

/-- Partial product 32 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0032 : Poly :=
[
  term ((7873793720 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-3936896860 : Rat) / 8578069) [(0, 1), (1, 2), (15, 2)],
  term ((-7873793720 : Rat) / 8578069) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-7873793720 : Rat) / 8578069) [(0, 1), (11, 1), (15, 3)],
  term ((3936896860 : Rat) / 8578069) [(0, 1), (14, 2), (15, 2)],
  term ((3936896860 : Rat) / 8578069) [(0, 1), (15, 4)],
  term ((7873793720 : Rat) / 8578069) [(0, 2), (10, 1), (15, 2)],
  term ((-3936896860 : Rat) / 8578069) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0032
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0033 : Poly :=
[
  term ((569399266800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 33 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0033 : Poly :=
[
  term ((-1138798533600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((569399266800 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((1138798533600 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((-569399266800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-569399266800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((1138798533600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-1138798533600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2)],
  term ((569399266800 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0033
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0034 : Poly :=
[
  term ((27428061764345914035 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 34 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0034 : Poly :=
[
  term ((-54856123528691828070 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((27428061764345914035 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((54856123528691828070 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-27428061764345914035 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)],
  term ((-27428061764345914035 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 3)],
  term ((54856123528691828070 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 3), (15, 2)],
  term ((-54856123528691828070 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (15, 1)],
  term ((27428061764345914035 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0034
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0035 : Poly :=
[
  term ((101910647212 : Rat) / 8578069) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 35 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0035 : Poly :=
[
  term ((-203821294424 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((101910647212 : Rat) / 8578069) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((203821294424 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((203821294424 : Rat) / 8578069) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-101910647212 : Rat) / 8578069) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-101910647212 : Rat) / 8578069) [(1, 1), (2, 1), (15, 3)],
  term ((-203821294424 : Rat) / 8578069) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((101910647212 : Rat) / 8578069) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0035
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0036 : Poly :=
[
  term ((-91214993200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 36 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0036 : Poly :=
[
  term ((182429986400 : Rat) / 150171761) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-91214993200 : Rat) / 150171761) [(0, 2), (1, 1), (4, 1), (11, 1)],
  term ((-182429986400 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1)],
  term ((91214993200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (14, 2)],
  term ((91214993200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((-182429986400 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((182429986400 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2)],
  term ((-91214993200 : Rat) / 150171761) [(1, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0036
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0037 : Poly :=
[
  term ((-4393842094993004215 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 37 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0037 : Poly :=
[
  term ((8787684189986008430 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4393842094993004215 : Rat) / 1288183727709509) [(0, 2), (1, 1), (4, 1), (11, 2), (15, 1)],
  term ((-8787684189986008430 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((4393842094993004215 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((4393842094993004215 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 3)],
  term ((-8787684189986008430 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (15, 2)],
  term ((8787684189986008430 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 3), (15, 1)],
  term ((-4393842094993004215 : Rat) / 1288183727709509) [(1, 3), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0037
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0038 : Poly :=
[
  term ((11377563916 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 38 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0038 : Poly :=
[
  term ((-22755127832 : Rat) / 25734207) [(0, 1), (1, 1), (4, 1), (10, 1), (15, 1)],
  term ((11377563916 : Rat) / 25734207) [(0, 2), (1, 1), (4, 1), (15, 1)],
  term ((22755127832 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((22755127832 : Rat) / 25734207) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((-11377563916 : Rat) / 25734207) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((-11377563916 : Rat) / 25734207) [(1, 1), (4, 1), (15, 3)],
  term ((-22755127832 : Rat) / 25734207) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((11377563916 : Rat) / 25734207) [(1, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0038
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0039 : Poly :=
[
  term ((13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 39 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0039 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)],
  term ((13546041600 : Rat) / 150171761) [(1, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0039
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0040 : Poly :=
[
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 40 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0040 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 2), (11, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 2), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 3)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 3), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0040
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0041 : Poly :=
[
  term ((-860779296 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 41 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0041 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((860779296 : Rat) / 8578069) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 1), (10, 1), (15, 3)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0041
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0042 : Poly :=
[
  term ((45856133000 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 42 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0042 : Poly :=
[
  term ((-91712266000 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((45856133000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1)],
  term ((91712266000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-45856133000 : Rat) / 150171761) [(1, 1), (11, 1), (14, 2)],
  term ((-45856133000 : Rat) / 150171761) [(1, 1), (11, 1), (15, 2)],
  term ((91712266000 : Rat) / 150171761) [(1, 1), (11, 2), (15, 1)],
  term ((-91712266000 : Rat) / 150171761) [(1, 2), (11, 2)],
  term ((45856133000 : Rat) / 150171761) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0042
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0043 : Poly :=
[
  term ((-334233601000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 43 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0043 : Poly :=
[
  term ((668467202000 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-334233601000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((-668467202000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((334233601000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((334233601000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-668467202000 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((668467202000 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)],
  term ((-334233601000 : Rat) / 150171761) [(1, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0043
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0044 : Poly :=
[
  term ((46986600000 : Rat) / 150171761) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 44 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0044 : Poly :=
[
  term ((-93973200000 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((46986600000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((93973200000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((-46986600000 : Rat) / 150171761) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-46986600000 : Rat) / 150171761) [(1, 1), (11, 1), (14, 3)],
  term ((93973200000 : Rat) / 150171761) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-93973200000 : Rat) / 150171761) [(1, 2), (11, 2), (14, 1)],
  term ((46986600000 : Rat) / 150171761) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0044
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0045 : Poly :=
[
  term ((-32200181441988988025 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 45 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0045 : Poly :=
[
  term ((32200181441988988025 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-32200181441988988025 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-32200181441988988025 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((32200181441988988025 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((32200181441988988025 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (15, 3)],
  term ((-32200181441988988025 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (15, 2)],
  term ((32200181441988988025 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)],
  term ((-32200181441988988025 : Rat) / 2576367455419018) [(1, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0045
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0046 : Poly :=
[
  term ((2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 46 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0046 : Poly :=
[
  term ((-4526705396511465000 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(0, 2), (1, 1), (11, 2), (14, 1), (15, 1)],
  term ((4526705396511465000 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 1), (15, 3)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 3), (15, 1)],
  term ((4526705396511465000 : Rat) / 1288183727709509) [(1, 1), (11, 3), (14, 1), (15, 2)],
  term ((-4526705396511465000 : Rat) / 1288183727709509) [(1, 2), (11, 3), (14, 1), (15, 1)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(1, 3), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0046
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0047 : Poly :=
[
  term ((4417795812300687325 : Rat) / 2576367455419018) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 47 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0047 : Poly :=
[
  term ((-4417795812300687325 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((4417795812300687325 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((4417795812300687325 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4417795812300687325 : Rat) / 2576367455419018) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-4417795812300687325 : Rat) / 2576367455419018) [(1, 1), (11, 2), (15, 3)],
  term ((4417795812300687325 : Rat) / 1288183727709509) [(1, 1), (11, 3), (15, 2)],
  term ((-4417795812300687325 : Rat) / 1288183727709509) [(1, 2), (11, 3), (15, 1)],
  term ((4417795812300687325 : Rat) / 2576367455419018) [(1, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0047
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0048 : Poly :=
[
  term ((-209944514390 : Rat) / 25734207) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 48 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0048 : Poly :=
[
  term ((419889028780 : Rat) / 25734207) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-209944514390 : Rat) / 25734207) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-419889028780 : Rat) / 25734207) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-419889028780 : Rat) / 25734207) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((209944514390 : Rat) / 25734207) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((209944514390 : Rat) / 25734207) [(1, 1), (12, 1), (15, 3)],
  term ((419889028780 : Rat) / 25734207) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-209944514390 : Rat) / 25734207) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0048
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0049 : Poly :=
[
  term ((3721737040 : Rat) / 8578069) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 49 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0049 : Poly :=
[
  term ((-7443474080 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((3721737040 : Rat) / 8578069) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((7443474080 : Rat) / 8578069) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((7443474080 : Rat) / 8578069) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3721737040 : Rat) / 8578069) [(1, 1), (14, 1), (15, 3)],
  term ((-3721737040 : Rat) / 8578069) [(1, 1), (14, 3), (15, 1)],
  term ((-7443474080 : Rat) / 8578069) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((3721737040 : Rat) / 8578069) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0049
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0050 : Poly :=
[
  term ((-7246637330 : Rat) / 25734207) [(1, 1), (15, 1)]
]

/-- Partial product 50 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0050 : Poly :=
[
  term ((14493274660 : Rat) / 25734207) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-7246637330 : Rat) / 25734207) [(0, 2), (1, 1), (15, 1)],
  term ((-14493274660 : Rat) / 25734207) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-14493274660 : Rat) / 25734207) [(1, 1), (11, 1), (15, 2)],
  term ((7246637330 : Rat) / 25734207) [(1, 1), (14, 2), (15, 1)],
  term ((7246637330 : Rat) / 25734207) [(1, 1), (15, 3)],
  term ((14493274660 : Rat) / 25734207) [(1, 2), (11, 1), (15, 1)],
  term ((-7246637330 : Rat) / 25734207) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0050
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0051 : Poly :=
[
  term ((-338989205600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 51 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0051 : Poly :=
[
  term ((677978411200 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-338989205600 : Rat) / 150171761) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((677978411200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-338989205600 : Rat) / 150171761) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-677978411200 : Rat) / 150171761) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((338989205600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((338989205600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-677978411200 : Rat) / 150171761) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0051
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0052 : Poly :=
[
  term ((-16329169022111139470 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 52 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0052 : Poly :=
[
  term ((32658338044222278940 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-16329169022111139470 : Rat) / 1288183727709509) [(0, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((32658338044222278940 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((-16329169022111139470 : Rat) / 1288183727709509) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-32658338044222278940 : Rat) / 1288183727709509) [(2, 1), (3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((16329169022111139470 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (14, 2), (15, 1)],
  term ((16329169022111139470 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 3)],
  term ((-32658338044222278940 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0052
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0053 : Poly :=
[
  term ((-95015657512 : Rat) / 25734207) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 53 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0053 : Poly :=
[
  term ((190031315024 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-95015657512 : Rat) / 25734207) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((190031315024 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-95015657512 : Rat) / 25734207) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-190031315024 : Rat) / 25734207) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-190031315024 : Rat) / 25734207) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((95015657512 : Rat) / 25734207) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((95015657512 : Rat) / 25734207) [(2, 1), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0053
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0054 : Poly :=
[
  term ((437949075600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 54 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0054 : Poly :=
[
  term ((-875898151200 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1)],
  term ((437949075600 : Rat) / 150171761) [(0, 2), (2, 1), (5, 1), (11, 1)],
  term ((-875898151200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 2)],
  term ((437949075600 : Rat) / 150171761) [(1, 2), (2, 1), (5, 1), (11, 1)],
  term ((875898151200 : Rat) / 150171761) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-437949075600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((-437949075600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((875898151200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0054
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0055 : Poly :=
[
  term ((21096083180265517845 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 55 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0055 : Poly :=
[
  term ((-42192166360531035690 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((21096083180265517845 : Rat) / 1288183727709509) [(0, 2), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-42192166360531035690 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 3), (15, 1)],
  term ((21096083180265517845 : Rat) / 1288183727709509) [(1, 2), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((42192166360531035690 : Rat) / 1288183727709509) [(2, 1), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-21096083180265517845 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-21096083180265517845 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 3)],
  term ((42192166360531035690 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0055
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0056 : Poly :=
[
  term ((31434791284 : Rat) / 8578069) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 56 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0056 : Poly :=
[
  term ((-62869582568 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1)],
  term ((31434791284 : Rat) / 8578069) [(0, 2), (2, 1), (5, 1), (15, 1)],
  term ((-62869582568 : Rat) / 8578069) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((31434791284 : Rat) / 8578069) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((62869582568 : Rat) / 8578069) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((62869582568 : Rat) / 8578069) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-31434791284 : Rat) / 8578069) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-31434791284 : Rat) / 8578069) [(2, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0056
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0057 : Poly :=
[
  term ((77330180000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 57 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0057 : Poly :=
[
  term ((-154660360000 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((77330180000 : Rat) / 150171761) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-154660360000 : Rat) / 150171761) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((77330180000 : Rat) / 150171761) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((154660360000 : Rat) / 150171761) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-77330180000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-77330180000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((154660360000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0057
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0058 : Poly :=
[
  term ((3725008227017947250 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 58 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0058 : Poly :=
[
  term ((-7450016454035894500 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((3725008227017947250 : Rat) / 1288183727709509) [(0, 2), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-7450016454035894500 : Rat) / 1288183727709509) [(1, 1), (2, 1), (7, 1), (11, 3), (15, 1)],
  term ((3725008227017947250 : Rat) / 1288183727709509) [(1, 2), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((7450016454035894500 : Rat) / 1288183727709509) [(2, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-3725008227017947250 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-3725008227017947250 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 3)],
  term ((7450016454035894500 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0058
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0059 : Poly :=
[
  term ((-4430111240 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 59 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0059 : Poly :=
[
  term ((8860222480 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-4430111240 : Rat) / 25734207) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((8860222480 : Rat) / 25734207) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4430111240 : Rat) / 25734207) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-8860222480 : Rat) / 25734207) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8860222480 : Rat) / 25734207) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((4430111240 : Rat) / 25734207) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((4430111240 : Rat) / 25734207) [(2, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0059
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0060 : Poly :=
[
  term ((12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 60 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0060 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 2), (11, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 2), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-25008076800 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 2)],
  term ((12504038400 : Rat) / 150171761) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0060_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0060
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0061 : Poly :=
[
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 61 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0061 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 2), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 3)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 3), (15, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0061_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0061
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0062 : Poly :=
[
  term ((-794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 62 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0062 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 2), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(1, 2), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (15, 3)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0062_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0062
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0063 : Poly :=
[
  term ((-41680128000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 63 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0063 : Poly :=
[
  term ((83360256000 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-41680128000 : Rat) / 150171761) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((83360256000 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((-41680128000 : Rat) / 150171761) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-83360256000 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((41680128000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((41680128000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-83360256000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0063_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0063
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0064 : Poly :=
[
  term ((-2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 64 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0064 : Poly :=
[
  term ((4015478037246547200 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2007739018623273600 : Rat) / 1288183727709509) [(0, 2), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((4015478037246547200 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((-2007739018623273600 : Rat) / 1288183727709509) [(1, 2), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4015478037246547200 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 3)],
  term ((-4015478037246547200 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0064_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0064
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0065 : Poly :=
[
  term ((2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 65 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0065 : Poly :=
[
  term ((-5297103360 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((2648551680 : Rat) / 8578069) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-5297103360 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((2648551680 : Rat) / 8578069) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((5297103360 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((5297103360 : Rat) / 8578069) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0065_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0065
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0066 : Poly :=
[
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 66 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0066 : Poly :=
[
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 2), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (15, 3)],
  term ((-3178262016 : Rat) / 8578069) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((-3178262016 : Rat) / 8578069) [(2, 1), (10, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0066_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0066
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0067 : Poly :=
[
  term ((25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2)]
]

/-- Partial product 67 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0067 : Poly :=
[
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (10, 2), (11, 2)],
  term ((25008076800 : Rat) / 150171761) [(0, 2), (2, 1), (10, 1), (11, 2)],
  term ((-50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 3)],
  term ((25008076800 : Rat) / 150171761) [(1, 2), (2, 1), (10, 1), (11, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (14, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((50016153600 : Rat) / 150171761) [(2, 1), (10, 1), (11, 3), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(2, 1), (10, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0067_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0067
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0068 : Poly :=
[
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (15, 1)]
]

/-- Partial product 68 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0068 : Poly :=
[
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 2), (11, 3), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 2), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 4), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(1, 2), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (14, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (15, 3)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 4), (15, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0068_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0068
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0069 : Poly :=
[
  term ((-942974795800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 69 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0069 : Poly :=
[
  term ((1885949591600 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-942974795800 : Rat) / 150171761) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((1885949591600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-942974795800 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-1885949591600 : Rat) / 150171761) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((942974795800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((942974795800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1885949591600 : Rat) / 150171761) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0069_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0069
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0070 : Poly :=
[
  term ((-561621475480599312 : Rat) / 1288183727709509) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 70 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0070 : Poly :=
[
  term ((1123242950961198624 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-561621475480599312 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((1123242950961198624 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-561621475480599312 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-1123242950961198624 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((561621475480599312 : Rat) / 1288183727709509) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((561621475480599312 : Rat) / 1288183727709509) [(2, 1), (11, 1), (15, 3)],
  term ((-1123242950961198624 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0070_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0070
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0071 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (11, 2)]
]

/-- Partial product 71 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0071 : Poly :=
[
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-25008076800 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2)],
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 3)],
  term ((-25008076800 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2)],
  term ((-50016153600 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (14, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (11, 2), (14, 2)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (11, 2), (15, 2)],
  term ((-50016153600 : Rat) / 150171761) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0071_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0071
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0072 : Poly :=
[
  term ((-90846520006175308295 : Rat) / 2576367455419018) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 72 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0072 : Poly :=
[
  term ((90846520006175308295 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-90846520006175308295 : Rat) / 2576367455419018) [(0, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((90846520006175308295 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 3), (13, 1), (15, 1)],
  term ((-90846520006175308295 : Rat) / 2576367455419018) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-90846520006175308295 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((90846520006175308295 : Rat) / 2576367455419018) [(2, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((90846520006175308295 : Rat) / 2576367455419018) [(2, 1), (11, 2), (13, 1), (15, 3)],
  term ((-90846520006175308295 : Rat) / 1288183727709509) [(2, 1), (11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0072_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0072
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0073 : Poly :=
[
  term ((-4493885496243110745 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 73 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0073 : Poly :=
[
  term ((8987770992486221490 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (15, 2)],
  term ((-4493885496243110745 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 2), (15, 2)],
  term ((8987770992486221490 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 3), (15, 2)],
  term ((-4493885496243110745 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (15, 2)],
  term ((-8987770992486221490 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((4493885496243110745 : Rat) / 1288183727709509) [(2, 1), (11, 2), (14, 2), (15, 2)],
  term ((4493885496243110745 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 4)],
  term ((-8987770992486221490 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0073_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0073
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0074 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 1)]
]

/-- Partial product 74 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0074 : Poly :=
[
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 4), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (11, 3), (14, 2), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 3)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0074_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0074
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0075 : Poly :=
[
  term ((-459762964106 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 75 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0075 : Poly :=
[
  term ((919525928212 : Rat) / 25734207) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-459762964106 : Rat) / 25734207) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((919525928212 : Rat) / 25734207) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-459762964106 : Rat) / 25734207) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-919525928212 : Rat) / 25734207) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-919525928212 : Rat) / 25734207) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((459762964106 : Rat) / 25734207) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((459762964106 : Rat) / 25734207) [(2, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0075_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0075
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0076 : Poly :=
[
  term ((-4640870564 : Rat) / 8578069) [(2, 1), (15, 2)]
]

/-- Partial product 76 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0076 : Poly :=
[
  term ((9281741128 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-4640870564 : Rat) / 8578069) [(0, 2), (2, 1), (15, 2)],
  term ((9281741128 : Rat) / 8578069) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-4640870564 : Rat) / 8578069) [(1, 2), (2, 1), (15, 2)],
  term ((-9281741128 : Rat) / 8578069) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-9281741128 : Rat) / 8578069) [(2, 1), (11, 1), (15, 3)],
  term ((4640870564 : Rat) / 8578069) [(2, 1), (14, 2), (15, 2)],
  term ((4640870564 : Rat) / 8578069) [(2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0076_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0076
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0077 : Poly :=
[
  term ((-37929955600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 77 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0077 : Poly :=
[
  term ((75859911200 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (10, 1), (11, 1)],
  term ((-37929955600 : Rat) / 150171761) [(0, 2), (3, 1), (4, 1), (11, 1)],
  term ((75859911200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((-37929955600 : Rat) / 150171761) [(1, 2), (3, 1), (4, 1), (11, 1)],
  term ((-75859911200 : Rat) / 150171761) [(3, 1), (4, 1), (10, 1), (11, 1), (14, 1)],
  term ((37929955600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((37929955600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-75859911200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0077_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0077
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0078 : Poly :=
[
  term ((-1827092561538398845 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 78 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0078 : Poly :=
[
  term ((3654185123076797690 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1827092561538398845 : Rat) / 1288183727709509) [(0, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((3654185123076797690 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 3), (15, 1)],
  term ((-1827092561538398845 : Rat) / 1288183727709509) [(1, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-3654185123076797690 : Rat) / 1288183727709509) [(3, 1), (4, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1827092561538398845 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((1827092561538398845 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 3)],
  term ((-3654185123076797690 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0078_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0078
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0079 : Poly :=
[
  term ((6178446148 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 79 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0079 : Poly :=
[
  term ((-12356892296 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1)],
  term ((6178446148 : Rat) / 25734207) [(0, 2), (3, 1), (4, 1), (15, 1)],
  term ((-12356892296 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((6178446148 : Rat) / 25734207) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((12356892296 : Rat) / 25734207) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((12356892296 : Rat) / 25734207) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-6178446148 : Rat) / 25734207) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-6178446148 : Rat) / 25734207) [(3, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0079_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0079
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0080 : Poly :=
[
  term ((-17044064800 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 80 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0080 : Poly :=
[
  term ((34088129600 : Rat) / 150171761) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((-17044064800 : Rat) / 150171761) [(0, 2), (3, 1), (11, 1)],
  term ((34088129600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2)],
  term ((-17044064800 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1)],
  term ((-34088129600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((17044064800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2)],
  term ((17044064800 : Rat) / 150171761) [(3, 1), (11, 1), (15, 2)],
  term ((-34088129600 : Rat) / 150171761) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0080_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0080
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0081 : Poly :=
[
  term ((407337569000 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 81 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0081 : Poly :=
[
  term ((-814675138000 : Rat) / 150171761) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((407337569000 : Rat) / 150171761) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((-814675138000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((407337569000 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((814675138000 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-407337569000 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-407337569000 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((814675138000 : Rat) / 150171761) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0081_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0081
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0082 : Poly :=
[
  term ((39243043161117451225 : Rat) / 2576367455419018) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 82 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0082 : Poly :=
[
  term ((-39243043161117451225 : Rat) / 1288183727709509) [(0, 1), (3, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((39243043161117451225 : Rat) / 2576367455419018) [(0, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-39243043161117451225 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((39243043161117451225 : Rat) / 2576367455419018) [(1, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((39243043161117451225 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-39243043161117451225 : Rat) / 2576367455419018) [(3, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-39243043161117451225 : Rat) / 2576367455419018) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((39243043161117451225 : Rat) / 1288183727709509) [(3, 1), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0082_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0082
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0083 : Poly :=
[
  term ((-821015567296326010 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 83 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0083 : Poly :=
[
  term ((1642031134592652020 : Rat) / 1288183727709509) [(0, 1), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-821015567296326010 : Rat) / 1288183727709509) [(0, 2), (3, 1), (11, 2), (15, 1)],
  term ((1642031134592652020 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-821015567296326010 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((-1642031134592652020 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((821015567296326010 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((821015567296326010 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 3)],
  term ((-1642031134592652020 : Rat) / 1288183727709509) [(3, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0083_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0083
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0084 : Poly :=
[
  term ((209886972790 : Rat) / 25734207) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 84 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0084 : Poly :=
[
  term ((-419773945580 : Rat) / 25734207) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((209886972790 : Rat) / 25734207) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-419773945580 : Rat) / 25734207) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((209886972790 : Rat) / 25734207) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((419773945580 : Rat) / 25734207) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((419773945580 : Rat) / 25734207) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-209886972790 : Rat) / 25734207) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-209886972790 : Rat) / 25734207) [(3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0084_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0084
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0085 : Poly :=
[
  term ((-69237328136 : Rat) / 25734207) [(3, 1), (15, 1)]
]

/-- Partial product 85 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0085 : Poly :=
[
  term ((138474656272 : Rat) / 25734207) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-69237328136 : Rat) / 25734207) [(0, 2), (3, 1), (15, 1)],
  term ((138474656272 : Rat) / 25734207) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-69237328136 : Rat) / 25734207) [(1, 2), (3, 1), (15, 1)],
  term ((-138474656272 : Rat) / 25734207) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-138474656272 : Rat) / 25734207) [(3, 1), (11, 1), (15, 2)],
  term ((69237328136 : Rat) / 25734207) [(3, 1), (14, 2), (15, 1)],
  term ((69237328136 : Rat) / 25734207) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0085_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0085
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0086 : Poly :=
[
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 86 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0086 : Poly :=
[
  term ((38019449600 : Rat) / 150171761) [(0, 1), (4, 1), (7, 1), (10, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(0, 2), (4, 1), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 1), (7, 1), (11, 2)],
  term ((-19009724800 : Rat) / 150171761) [(1, 2), (4, 1), (7, 1), (11, 1)],
  term ((-38019449600 : Rat) / 150171761) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-38019449600 : Rat) / 150171761) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0086_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0086
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0087 : Poly :=
[
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 87 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0087 : Poly :=
[
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(0, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 1), (7, 1), (11, 3), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(4, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 3)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0087_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0087
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0088 : Poly :=
[
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 88 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0088 : Poly :=
[
  term ((6312091072 : Rat) / 25734207) [(0, 1), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0088_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0088
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0089 : Poly :=
[
  term ((61638372000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 89 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0089 : Poly :=
[
  term ((-123276744000 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 1)],
  term ((61638372000 : Rat) / 150171761) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term ((-123276744000 : Rat) / 150171761) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((61638372000 : Rat) / 150171761) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((123276744000 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-61638372000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-61638372000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((123276744000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0089_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0089
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0090 : Poly :=
[
  term ((2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 90 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0090 : Poly :=
[
  term ((-5938262210174415300 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2969131105087207650 : Rat) / 1288183727709509) [(0, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-5938262210174415300 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (11, 3), (15, 1)],
  term ((2969131105087207650 : Rat) / 1288183727709509) [(1, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((5938262210174415300 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 3)],
  term ((5938262210174415300 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0090_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0090
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0091 : Poly :=
[
  term ((388029000 : Rat) / 8578069) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 91 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0091 : Poly :=
[
  term ((-776058000 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((388029000 : Rat) / 8578069) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((-776058000 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((388029000 : Rat) / 8578069) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((776058000 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((776058000 : Rat) / 8578069) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-388029000 : Rat) / 8578069) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-388029000 : Rat) / 8578069) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0091_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0091
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0092 : Poly :=
[
  term ((-21076676000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 92 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0092 : Poly :=
[
  term ((42153352000 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-21076676000 : Rat) / 150171761) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((42153352000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((-21076676000 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((-42153352000 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((21076676000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((21076676000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-42153352000 : Rat) / 150171761) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0092_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0092
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0093 : Poly :=
[
  term ((317467632095253132 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 93 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0093 : Poly :=
[
  term ((-634935264190506264 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((317467632095253132 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((-634935264190506264 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((317467632095253132 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((634935264190506264 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-317467632095253132 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-317467632095253132 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 3)],
  term ((634935264190506264 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0093_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0093
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0094 : Poly :=
[
  term ((49857526800 : Rat) / 150171761) [(4, 1), (11, 2)]
]

/-- Partial product 94 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0094 : Poly :=
[
  term ((-99715053600 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 2)],
  term ((49857526800 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2)],
  term ((-99715053600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 3)],
  term ((49857526800 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2)],
  term ((99715053600 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (14, 1)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (11, 2), (14, 2)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (11, 2), (15, 2)],
  term ((99715053600 : Rat) / 150171761) [(4, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0094_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0094
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0095 : Poly :=
[
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 95 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0095 : Poly :=
[
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(4, 1), (11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0095_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0095
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0096 : Poly :=
[
  term ((6010040759883067995 : Rat) / 2576367455419018) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 96 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0096 : Poly :=
[
  term ((-6010040759883067995 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((6010040759883067995 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 2), (15, 2)],
  term ((-6010040759883067995 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (15, 2)],
  term ((6010040759883067995 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 2), (15, 2)],
  term ((6010040759883067995 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-6010040759883067995 : Rat) / 2576367455419018) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((-6010040759883067995 : Rat) / 2576367455419018) [(4, 1), (11, 2), (15, 4)],
  term ((6010040759883067995 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0096_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0096
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0097 : Poly :=
[
  term ((2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)]
]

/-- Partial product 97 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0097 : Poly :=
[
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 3), (15, 1)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 4), (15, 1)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 3), (15, 1)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (11, 3), (14, 2), (15, 1)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 3)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0097_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0097
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0098 : Poly :=
[
  term ((-1848197080 : Rat) / 25734207) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 98 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0098 : Poly :=
[
  term ((3696394160 : Rat) / 25734207) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((1848197080 : Rat) / 25734207) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0098_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0098
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0099 : Poly :=
[
  term ((-888073578 : Rat) / 8578069) [(4, 1), (15, 2)]
]

/-- Partial product 99 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0099 : Poly :=
[
  term ((1776147156 : Rat) / 8578069) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-888073578 : Rat) / 8578069) [(0, 2), (4, 1), (15, 2)],
  term ((1776147156 : Rat) / 8578069) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((-888073578 : Rat) / 8578069) [(1, 2), (4, 1), (15, 2)],
  term ((-1776147156 : Rat) / 8578069) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1776147156 : Rat) / 8578069) [(4, 1), (11, 1), (15, 3)],
  term ((888073578 : Rat) / 8578069) [(4, 1), (14, 2), (15, 2)],
  term ((888073578 : Rat) / 8578069) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0099_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0099
        rs_R013_ueqv_R013YNNN_generator_24_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_24_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_24_0000_0099 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_24_0000,
  rs_R013_ueqv_R013YNNN_partial_24_0001,
  rs_R013_ueqv_R013YNNN_partial_24_0002,
  rs_R013_ueqv_R013YNNN_partial_24_0003,
  rs_R013_ueqv_R013YNNN_partial_24_0004,
  rs_R013_ueqv_R013YNNN_partial_24_0005,
  rs_R013_ueqv_R013YNNN_partial_24_0006,
  rs_R013_ueqv_R013YNNN_partial_24_0007,
  rs_R013_ueqv_R013YNNN_partial_24_0008,
  rs_R013_ueqv_R013YNNN_partial_24_0009,
  rs_R013_ueqv_R013YNNN_partial_24_0010,
  rs_R013_ueqv_R013YNNN_partial_24_0011,
  rs_R013_ueqv_R013YNNN_partial_24_0012,
  rs_R013_ueqv_R013YNNN_partial_24_0013,
  rs_R013_ueqv_R013YNNN_partial_24_0014,
  rs_R013_ueqv_R013YNNN_partial_24_0015,
  rs_R013_ueqv_R013YNNN_partial_24_0016,
  rs_R013_ueqv_R013YNNN_partial_24_0017,
  rs_R013_ueqv_R013YNNN_partial_24_0018,
  rs_R013_ueqv_R013YNNN_partial_24_0019,
  rs_R013_ueqv_R013YNNN_partial_24_0020,
  rs_R013_ueqv_R013YNNN_partial_24_0021,
  rs_R013_ueqv_R013YNNN_partial_24_0022,
  rs_R013_ueqv_R013YNNN_partial_24_0023,
  rs_R013_ueqv_R013YNNN_partial_24_0024,
  rs_R013_ueqv_R013YNNN_partial_24_0025,
  rs_R013_ueqv_R013YNNN_partial_24_0026,
  rs_R013_ueqv_R013YNNN_partial_24_0027,
  rs_R013_ueqv_R013YNNN_partial_24_0028,
  rs_R013_ueqv_R013YNNN_partial_24_0029,
  rs_R013_ueqv_R013YNNN_partial_24_0030,
  rs_R013_ueqv_R013YNNN_partial_24_0031,
  rs_R013_ueqv_R013YNNN_partial_24_0032,
  rs_R013_ueqv_R013YNNN_partial_24_0033,
  rs_R013_ueqv_R013YNNN_partial_24_0034,
  rs_R013_ueqv_R013YNNN_partial_24_0035,
  rs_R013_ueqv_R013YNNN_partial_24_0036,
  rs_R013_ueqv_R013YNNN_partial_24_0037,
  rs_R013_ueqv_R013YNNN_partial_24_0038,
  rs_R013_ueqv_R013YNNN_partial_24_0039,
  rs_R013_ueqv_R013YNNN_partial_24_0040,
  rs_R013_ueqv_R013YNNN_partial_24_0041,
  rs_R013_ueqv_R013YNNN_partial_24_0042,
  rs_R013_ueqv_R013YNNN_partial_24_0043,
  rs_R013_ueqv_R013YNNN_partial_24_0044,
  rs_R013_ueqv_R013YNNN_partial_24_0045,
  rs_R013_ueqv_R013YNNN_partial_24_0046,
  rs_R013_ueqv_R013YNNN_partial_24_0047,
  rs_R013_ueqv_R013YNNN_partial_24_0048,
  rs_R013_ueqv_R013YNNN_partial_24_0049,
  rs_R013_ueqv_R013YNNN_partial_24_0050,
  rs_R013_ueqv_R013YNNN_partial_24_0051,
  rs_R013_ueqv_R013YNNN_partial_24_0052,
  rs_R013_ueqv_R013YNNN_partial_24_0053,
  rs_R013_ueqv_R013YNNN_partial_24_0054,
  rs_R013_ueqv_R013YNNN_partial_24_0055,
  rs_R013_ueqv_R013YNNN_partial_24_0056,
  rs_R013_ueqv_R013YNNN_partial_24_0057,
  rs_R013_ueqv_R013YNNN_partial_24_0058,
  rs_R013_ueqv_R013YNNN_partial_24_0059,
  rs_R013_ueqv_R013YNNN_partial_24_0060,
  rs_R013_ueqv_R013YNNN_partial_24_0061,
  rs_R013_ueqv_R013YNNN_partial_24_0062,
  rs_R013_ueqv_R013YNNN_partial_24_0063,
  rs_R013_ueqv_R013YNNN_partial_24_0064,
  rs_R013_ueqv_R013YNNN_partial_24_0065,
  rs_R013_ueqv_R013YNNN_partial_24_0066,
  rs_R013_ueqv_R013YNNN_partial_24_0067,
  rs_R013_ueqv_R013YNNN_partial_24_0068,
  rs_R013_ueqv_R013YNNN_partial_24_0069,
  rs_R013_ueqv_R013YNNN_partial_24_0070,
  rs_R013_ueqv_R013YNNN_partial_24_0071,
  rs_R013_ueqv_R013YNNN_partial_24_0072,
  rs_R013_ueqv_R013YNNN_partial_24_0073,
  rs_R013_ueqv_R013YNNN_partial_24_0074,
  rs_R013_ueqv_R013YNNN_partial_24_0075,
  rs_R013_ueqv_R013YNNN_partial_24_0076,
  rs_R013_ueqv_R013YNNN_partial_24_0077,
  rs_R013_ueqv_R013YNNN_partial_24_0078,
  rs_R013_ueqv_R013YNNN_partial_24_0079,
  rs_R013_ueqv_R013YNNN_partial_24_0080,
  rs_R013_ueqv_R013YNNN_partial_24_0081,
  rs_R013_ueqv_R013YNNN_partial_24_0082,
  rs_R013_ueqv_R013YNNN_partial_24_0083,
  rs_R013_ueqv_R013YNNN_partial_24_0084,
  rs_R013_ueqv_R013YNNN_partial_24_0085,
  rs_R013_ueqv_R013YNNN_partial_24_0086,
  rs_R013_ueqv_R013YNNN_partial_24_0087,
  rs_R013_ueqv_R013YNNN_partial_24_0088,
  rs_R013_ueqv_R013YNNN_partial_24_0089,
  rs_R013_ueqv_R013YNNN_partial_24_0090,
  rs_R013_ueqv_R013YNNN_partial_24_0091,
  rs_R013_ueqv_R013YNNN_partial_24_0092,
  rs_R013_ueqv_R013YNNN_partial_24_0093,
  rs_R013_ueqv_R013YNNN_partial_24_0094,
  rs_R013_ueqv_R013YNNN_partial_24_0095,
  rs_R013_ueqv_R013YNNN_partial_24_0096,
  rs_R013_ueqv_R013YNNN_partial_24_0097,
  rs_R013_ueqv_R013YNNN_partial_24_0098,
  rs_R013_ueqv_R013YNNN_partial_24_0099
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_24_0000_0099 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((-1138798533600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-54856123528691828070 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((-203821294424 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 3)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 4), (15, 1)],
  term ((122646225616 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((189583908800 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((9132289876865930060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 3), (15, 1)],
  term ((182429986400 : Rat) / 150171761) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 1)],
  term ((8787684189986008430 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((-22755127832 : Rat) / 25734207) [(0, 1), (1, 1), (4, 1), (10, 1), (15, 1)],
  term ((10299513560 : Rat) / 25734207) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1)],
  term ((310403428000 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 2)],
  term ((14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 3), (15, 1)],
  term (768 : Rat) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10086797184 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((865280966400 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (15, 1)],
  term ((-91712266000 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((668467202000 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-216033028800 : Rat) / 150171761) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((32200181441988988025 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-10406348589743424060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4417795812300687325 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((419889028780 : Rat) / 25734207) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-11088249072 : Rat) / 8578069) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((14493274660 : Rat) / 25734207) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 2), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-104740360036 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((1158598006473033608 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-659915240400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-12025265250567493950 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (15, 3)],
  term ((-574468605120 : Rat) / 150171761) [(0, 1), (1, 1), (11, 3)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 3), (12, 1)],
  term ((-31788231963568770105 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-24337999341059977110 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 4), (12, 1), (15, 1)],
  term ((-27672252673348548444 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 4), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (15, 3)],
  term ((12504038400 : Rat) / 150171761) [(0, 1), (1, 2), (2, 1), (9, 1), (11, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 1), (1, 2), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 1), (1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (1, 2), (2, 1), (11, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (1, 2), (2, 1), (11, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (1, 2), (2, 1), (11, 3), (15, 1)],
  term ((-94791954400 : Rat) / 150171761) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-4566144938432965030 : Rat) / 1288183727709509) [(0, 1), (1, 2), (3, 1), (11, 2), (15, 1)],
  term ((-61323112808 : Rat) / 25734207) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-155201714000 : Rat) / 150171761) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (1, 2), (5, 1), (11, 2), (15, 1)],
  term ((-5149756780 : Rat) / 25734207) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term (-384 : Rat) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-432640483200 : Rat) / 150171761) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (1, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (1, 2), (9, 1), (12, 1), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (1, 2), (11, 1), (12, 1), (15, 1)],
  term ((329957620200 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((6036456087493854287 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((409294131360 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2), (12, 1)],
  term ((31788231963568770105 : Rat) / 2576367455419018) [(0, 1), (1, 2), (11, 2), (13, 1), (15, 1)],
  term ((9229178073914009025 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 3), (12, 1), (15, 1)],
  term ((19715769529906233282 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 3), (15, 1)],
  term ((52370180018 : Rat) / 8578069) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-3936896860 : Rat) / 8578069) [(0, 1), (1, 2), (15, 2)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 3), (11, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 3), (11, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 3), (15, 1)],
  term ((677978411200 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((32658338044222278940 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((190031315024 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-875898151200 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1)],
  term ((-42192166360531035690 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-62869582568 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1)],
  term ((-154660360000 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-7450016454035894500 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((8860222480 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((83360256000 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((4015478037246547200 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5297103360 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (10, 2), (11, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-345903106104914688 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 3)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 3), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (15, 3)],
  term ((1885949591600 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1123242950961198624 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((90846520006175308295 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 2), (14, 1)],
  term ((8987770992486221490 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (15, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((919525928212 : Rat) / 25734207) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((9281741128 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((3178262016 : Rat) / 8578069) [(0, 1), (2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (10, 2), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 2), (11, 3), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((-25008076800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (14, 2)],
  term ((-691806212209829376 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (14, 2), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 3)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 4), (15, 2)],
  term ((75859911200 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (10, 1), (11, 1)],
  term ((3654185123076797690 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((-12356892296 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1)],
  term ((34088129600 : Rat) / 150171761) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((-814675138000 : Rat) / 150171761) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((-189583908800 : Rat) / 150171761) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-39243043161117451225 : Rat) / 1288183727709509) [(0, 1), (3, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-9132289876865930060 : Rat) / 1288183727709509) [(0, 1), (3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1642031134592652020 : Rat) / 1288183727709509) [(0, 1), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-419773945580 : Rat) / 25734207) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-122646225616 : Rat) / 25734207) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((138474656272 : Rat) / 25734207) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((94791954400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((-15978603904293868976 : Rat) / 3864551183128527) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((4566144938432965030 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-189583908800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((4566144938432965030 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 3)],
  term ((-9132289876865930060 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 3), (15, 2)],
  term ((61323112808 : Rat) / 25734207) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((61323112808 : Rat) / 25734207) [(0, 1), (3, 1), (15, 3)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (4, 1), (7, 1), (10, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-123276744000 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 1)],
  term ((-5938262210174415300 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-776058000 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((42153352000 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-634935264190506264 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-99715053600 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 2)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-6010040759883067995 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((1776147156 : Rat) / 8578069) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-310403428000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-10299513560 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((155201714000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (14, 2)],
  term ((2447296946082218840 : Rat) / 3864551183128527) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-310403428000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((7476093570418257425 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 3)],
  term ((-14952187140836514850 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 3), (15, 2)],
  term ((5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((5149756780 : Rat) / 25734207) [(0, 1), (5, 1), (15, 3)],
  term (-768 : Rat) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term (384 : Rat) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term (384 : Rat) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term (-768 : Rat) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-865280966400 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((10086797184 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-2424354301276403968 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((432640483200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((5225972013054061824 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 3)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-865280966400 : Rat) / 150171761) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((20840367360596082840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (15, 3)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 3), (12, 1), (15, 2)],
  term ((-41680734721192165680 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 3), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-5043398592 : Rat) / 8578069) [(0, 1), (9, 1), (15, 3)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((659915240400 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((10978227616992906750 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((31788231963568770105 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((574468605120 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((18458356147828018050 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((27672252673348548444 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((104740360036 : Rat) / 8578069) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7873793720 : Rat) / 8578069) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-329957620200 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((12898645081228749596 : Rat) / 1288183727709509) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5489113808496453375 : Rat) / 1288183727709509) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-6671535277179594295 : Rat) / 1288183727709509) [(0, 1), (11, 1), (15, 3)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 2)],
  term ((-4848708602552807936 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-31788231963568770105 : Rat) / 2576367455419018) [(0, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((659915240400 : Rat) / 150171761) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-31788231963568770105 : Rat) / 2576367455419018) [(0, 1), (11, 2), (13, 1), (15, 3)],
  term ((-287234302560 : Rat) / 150171761) [(0, 1), (11, 2), (14, 2)],
  term ((-9229178073914009025 : Rat) / 1288183727709509) [(0, 1), (11, 2), (14, 2), (15, 2)],
  term ((8514311950466350110 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)],
  term ((-9229178073914009025 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 4)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 3)],
  term ((31788231963568770105 : Rat) / 1288183727709509) [(0, 1), (11, 3), (13, 1), (15, 2)],
  term ((-13836126336674274222 : Rat) / 1288183727709509) [(0, 1), (11, 3), (14, 2), (15, 1)],
  term ((574468605120 : Rat) / 150171761) [(0, 1), (11, 3), (15, 1)],
  term ((4622229811153743828 : Rat) / 1288183727709509) [(0, 1), (11, 3), (15, 3)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (11, 4), (12, 1), (15, 2)],
  term ((27672252673348548444 : Rat) / 1288183727709509) [(0, 1), (11, 4), (15, 2)],
  term ((-52370180018 : Rat) / 8578069) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-52370180018 : Rat) / 8578069) [(0, 1), (13, 1), (15, 3)],
  term ((3936896860 : Rat) / 8578069) [(0, 1), (14, 2), (15, 2)],
  term ((3936896860 : Rat) / 8578069) [(0, 1), (15, 4)],
  term ((569399266800 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((27428061764345914035 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((101910647212 : Rat) / 8578069) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-91214993200 : Rat) / 150171761) [(0, 2), (1, 1), (4, 1), (11, 1)],
  term ((-4393842094993004215 : Rat) / 1288183727709509) [(0, 2), (1, 1), (4, 1), (11, 2), (15, 1)],
  term ((11377563916 : Rat) / 25734207) [(0, 2), (1, 1), (4, 1), (15, 1)],
  term ((135605870400 : Rat) / 150171761) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((6532158374284522980 : Rat) / 1288183727709509) [(0, 2), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((2783995696 : Rat) / 8578069) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((45856133000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1)],
  term ((-334233601000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((46986600000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-32200181441988988025 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(0, 2), (1, 1), (11, 2), (14, 1), (15, 1)],
  term ((4417795812300687325 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((-209944514390 : Rat) / 25734207) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((3721737040 : Rat) / 8578069) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-7246637330 : Rat) / 25734207) [(0, 2), (1, 1), (15, 1)],
  term ((-338989205600 : Rat) / 150171761) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((-16329169022111139470 : Rat) / 1288183727709509) [(0, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-95015657512 : Rat) / 25734207) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((437949075600 : Rat) / 150171761) [(0, 2), (2, 1), (5, 1), (11, 1)],
  term ((21096083180265517845 : Rat) / 1288183727709509) [(0, 2), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((31434791284 : Rat) / 8578069) [(0, 2), (2, 1), (5, 1), (15, 1)],
  term ((77330180000 : Rat) / 150171761) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((3725008227017947250 : Rat) / 1288183727709509) [(0, 2), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-4430111240 : Rat) / 25734207) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(0, 2), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(0, 2), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(0, 2), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-41680128000 : Rat) / 150171761) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-2007739018623273600 : Rat) / 1288183727709509) [(0, 2), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((2648551680 : Rat) / 8578069) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(0, 2), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 2), (2, 1), (10, 1), (11, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 2), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-942974795800 : Rat) / 150171761) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-561621475480599312 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(0, 2), (2, 1), (11, 2)],
  term ((-90846520006175308295 : Rat) / 2576367455419018) [(0, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4493885496243110745 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 2), (15, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 3), (15, 1)],
  term ((-459762964106 : Rat) / 25734207) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-4640870564 : Rat) / 8578069) [(0, 2), (2, 1), (15, 2)],
  term ((-37929955600 : Rat) / 150171761) [(0, 2), (3, 1), (4, 1), (11, 1)],
  term ((-1827092561538398845 : Rat) / 1288183727709509) [(0, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((6178446148 : Rat) / 25734207) [(0, 2), (3, 1), (4, 1), (15, 1)],
  term ((189583908800 : Rat) / 150171761) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((9132289876865930060 : Rat) / 1288183727709509) [(0, 2), (3, 1), (10, 1), (11, 2), (15, 1)],
  term ((122646225616 : Rat) / 25734207) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-17044064800 : Rat) / 150171761) [(0, 2), (3, 1), (11, 1)],
  term ((407337569000 : Rat) / 150171761) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((39243043161117451225 : Rat) / 2576367455419018) [(0, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-821015567296326010 : Rat) / 1288183727709509) [(0, 2), (3, 1), (11, 2), (15, 1)],
  term ((209886972790 : Rat) / 25734207) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-69237328136 : Rat) / 25734207) [(0, 2), (3, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(0, 2), (4, 1), (7, 1), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(0, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((61638372000 : Rat) / 150171761) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term ((2969131105087207650 : Rat) / 1288183727709509) [(0, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((388029000 : Rat) / 8578069) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((-21076676000 : Rat) / 150171761) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((317467632095253132 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((49857526800 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((6010040759883067995 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 2), (15, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 3), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((-888073578 : Rat) / 8578069) [(0, 2), (4, 1), (15, 2)],
  term ((310403428000 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((14952187140836514850 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((10299513560 : Rat) / 25734207) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term (768 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((865280966400 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((41680734721192165680 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-10086797184 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-659915240400 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-10978227616992906750 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-574468605120 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((-31788231963568770105 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-18458356147828018050 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-27672252673348548444 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((-104740360036 : Rat) / 8578069) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((7873793720 : Rat) / 8578069) [(0, 2), (10, 1), (15, 2)],
  term ((-61029914400 : Rat) / 150171761) [(0, 3), (1, 1), (11, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 3), (1, 1), (11, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 3), (1, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(0, 3), (2, 1), (9, 1), (11, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(0, 3), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(0, 3), (2, 1), (9, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(0, 3), (2, 1), (11, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(0, 3), (2, 1), (11, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(0, 3), (2, 1), (11, 3), (15, 1)],
  term ((-94791954400 : Rat) / 150171761) [(0, 3), (3, 1), (11, 1)],
  term ((-4566144938432965030 : Rat) / 1288183727709509) [(0, 3), (3, 1), (11, 2), (15, 1)],
  term ((-61323112808 : Rat) / 25734207) [(0, 3), (3, 1), (15, 1)],
  term ((-155201714000 : Rat) / 150171761) [(0, 3), (5, 1), (11, 1)],
  term ((-7476093570418257425 : Rat) / 1288183727709509) [(0, 3), (5, 1), (11, 2), (15, 1)],
  term ((-5149756780 : Rat) / 25734207) [(0, 3), (5, 1), (15, 1)],
  term (-384 : Rat) [(0, 3), (7, 1), (11, 1)],
  term ((-432640483200 : Rat) / 150171761) [(0, 3), (9, 1), (11, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 3), (9, 1), (11, 1), (12, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 3), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-20840367360596082840 : Rat) / 1288183727709509) [(0, 3), (9, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 3), (9, 1), (12, 1), (15, 1)],
  term ((5043398592 : Rat) / 8578069) [(0, 3), (9, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 3), (11, 1), (12, 1), (15, 1)],
  term ((329957620200 : Rat) / 150171761) [(0, 3), (11, 1), (13, 1)],
  term ((5489113808496453375 : Rat) / 1288183727709509) [(0, 3), (11, 1), (15, 1)],
  term ((287234302560 : Rat) / 150171761) [(0, 3), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(0, 3), (11, 2), (12, 1)],
  term ((31788231963568770105 : Rat) / 2576367455419018) [(0, 3), (11, 2), (13, 1), (15, 1)],
  term ((9229178073914009025 : Rat) / 1288183727709509) [(0, 3), (11, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 3), (11, 3), (12, 1), (15, 1)],
  term ((13836126336674274222 : Rat) / 1288183727709509) [(0, 3), (11, 3), (15, 1)],
  term ((52370180018 : Rat) / 8578069) [(0, 3), (13, 1), (15, 1)],
  term ((-3936896860 : Rat) / 8578069) [(0, 3), (15, 2)],
  term ((190031315024 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((677978411200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((32658338044222278940 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 3), (15, 1)],
  term ((-62869582568 : Rat) / 8578069) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((-875898151200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 2)],
  term ((-42192166360531035690 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 3), (15, 1)],
  term ((8860222480 : Rat) / 25734207) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-154660360000 : Rat) / 150171761) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-7450016454035894500 : Rat) / 1288183727709509) [(1, 1), (2, 1), (7, 1), (11, 3), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-5297103360 : Rat) / 8578069) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((83360256000 : Rat) / 150171761) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((4015478037246547200 : Rat) / 1288183727709509) [(1, 1), (2, 1), (9, 1), (11, 3), (15, 1)],
  term ((1138798533600 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((54856123528691828070 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (11, 2), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 3)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 4), (15, 1)],
  term ((203821294424 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((919525928212 : Rat) / 25734207) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-569399266800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((27117711924129637872 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((1885949591600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-27428061764345914035 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)],
  term ((10891935349280817024 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-27428061764345914035 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 3)],
  term ((50016153600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 3)],
  term ((90846520006175308295 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 3), (13, 1), (15, 1)],
  term ((63843894521178049560 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 3), (15, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 4), (15, 1)],
  term ((-101910647212 : Rat) / 8578069) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-101910647212 : Rat) / 8578069) [(1, 1), (2, 1), (15, 3)],
  term ((-12356892296 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((75859911200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((3654185123076797690 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 3), (15, 1)],
  term ((-419773945580 : Rat) / 25734207) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((138474656272 : Rat) / 25734207) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((34088129600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2)],
  term ((-814675138000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((-39243043161117451225 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((1642031134592652020 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (4, 1), (7, 1), (11, 2)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 1), (7, 1), (11, 3), (15, 1)],
  term ((-776058000 : Rat) / 8578069) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-123276744000 : Rat) / 150171761) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((-5938262210174415300 : Rat) / 1288183727709509) [(1, 1), (4, 1), (9, 1), (11, 3), (15, 1)],
  term ((-182429986400 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1)],
  term ((-8787684189986008430 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((22755127832 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((91214993200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (14, 2)],
  term ((111266179211168300 : Rat) / 65500867510653) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((42153352000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((4393842094993004215 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((-129401898541103992 : Rat) / 75775513394677) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((4393842094993004215 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 3)],
  term ((-99715053600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 3)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (15, 1)],
  term ((-14753464556200475 : Rat) / 1284330735503) [(1, 1), (4, 1), (11, 3), (15, 2)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 4), (15, 1)],
  term ((-11377563916 : Rat) / 25734207) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((-11377563916 : Rat) / 25734207) [(1, 1), (4, 1), (15, 3)],
  term ((-668467202000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((91712266000 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((80427158400 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((-374728364946990912 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-32200181441988988025 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((4417795812300687325 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((3874190215458901080 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 3)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((-419889028780 : Rat) / 25734207) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-14493274660 : Rat) / 25734207) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((8304253376 : Rat) / 8578069) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 1), (10, 1), (15, 3)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((334233601000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-54454238201982874580 : Rat) / 3864551183128527) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((714745313676054880 : Rat) / 1288183727709509) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-45856133000 : Rat) / 150171761) [(1, 1), (11, 1), (14, 2)],
  term ((-46986600000 : Rat) / 150171761) [(1, 1), (11, 1), (14, 3)],
  term ((-3356551797190407260 : Rat) / 3864551183128527) [(1, 1), (11, 1), (15, 2)],
  term ((32200181441988988025 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-668467202000 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((32200181441988988025 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (15, 3)],
  term ((93973200000 : Rat) / 150171761) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 1), (15, 3)],
  term ((-4417795812300687325 : Rat) / 2576367455419018) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 3), (15, 1)],
  term ((91712266000 : Rat) / 150171761) [(1, 1), (11, 2), (15, 1)],
  term ((-4417795812300687325 : Rat) / 2576367455419018) [(1, 1), (11, 2), (15, 3)],
  term ((-32200181441988988025 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (15, 2)],
  term ((4526705396511465000 : Rat) / 1288183727709509) [(1, 1), (11, 3), (14, 1), (15, 2)],
  term ((4417795812300687325 : Rat) / 1288183727709509) [(1, 1), (11, 3), (15, 2)],
  term ((209944514390 : Rat) / 25734207) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((209944514390 : Rat) / 25734207) [(1, 1), (12, 1), (15, 3)],
  term ((-3721737040 : Rat) / 8578069) [(1, 1), (14, 1), (15, 3)],
  term ((7246637330 : Rat) / 25734207) [(1, 1), (14, 2), (15, 1)],
  term ((-3721737040 : Rat) / 8578069) [(1, 1), (14, 3), (15, 1)],
  term ((7246637330 : Rat) / 25734207) [(1, 1), (15, 3)],
  term ((-338989205600 : Rat) / 150171761) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-16329169022111139470 : Rat) / 1288183727709509) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-95015657512 : Rat) / 25734207) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((437949075600 : Rat) / 150171761) [(1, 2), (2, 1), (5, 1), (11, 1)],
  term ((21096083180265517845 : Rat) / 1288183727709509) [(1, 2), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((31434791284 : Rat) / 8578069) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((77330180000 : Rat) / 150171761) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((3725008227017947250 : Rat) / 1288183727709509) [(1, 2), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-4430111240 : Rat) / 25734207) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(1, 2), (2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(1, 2), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-41680128000 : Rat) / 150171761) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-2007739018623273600 : Rat) / 1288183727709509) [(1, 2), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((2648551680 : Rat) / 8578069) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(1, 2), (2, 1), (10, 1), (11, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(1, 2), (2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-942974795800 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-31169824188432159976 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-1163806610400 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2)],
  term ((-90846520006175308295 : Rat) / 2576367455419018) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4493885496243110745 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (15, 2)],
  term ((-56060766939865792230 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (15, 1)],
  term ((-459762964106 : Rat) / 25734207) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-4640870564 : Rat) / 8578069) [(1, 2), (2, 1), (15, 2)],
  term ((-37929955600 : Rat) / 150171761) [(1, 2), (3, 1), (4, 1), (11, 1)],
  term ((-1827092561538398845 : Rat) / 1288183727709509) [(1, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((6178446148 : Rat) / 25734207) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((-17044064800 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1)],
  term ((407337569000 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((39243043161117451225 : Rat) / 2576367455419018) [(1, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-821015567296326010 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((209886972790 : Rat) / 25734207) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-69237328136 : Rat) / 25734207) [(1, 2), (3, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(1, 2), (4, 1), (7, 1), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(1, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((61638372000 : Rat) / 150171761) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((2969131105087207650 : Rat) / 1288183727709509) [(1, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((388029000 : Rat) / 8578069) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-21076676000 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((-2464774722025792756 : Rat) / 3864551183128527) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((232287513200 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((6010040759883067995 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 2), (15, 2)],
  term ((11189329931774890715 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 3), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-888073578 : Rat) / 8578069) [(1, 2), (4, 1), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (15, 1)],
  term ((419889028780 : Rat) / 25734207) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-7443474080 : Rat) / 8578069) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((14493274660 : Rat) / 25734207) [(1, 2), (11, 1), (15, 1)],
  term ((-91712266000 : Rat) / 150171761) [(1, 2), (11, 2)],
  term ((668467202000 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)],
  term ((-93973200000 : Rat) / 150171761) [(1, 2), (11, 2), (14, 1)],
  term ((32200181441988988025 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)],
  term ((-4526705396511465000 : Rat) / 1288183727709509) [(1, 2), (11, 3), (14, 1), (15, 1)],
  term ((-4417795812300687325 : Rat) / 1288183727709509) [(1, 2), (11, 3), (15, 1)],
  term ((569399266800 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1)],
  term ((27428061764345914035 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (15, 1)],
  term ((101910647212 : Rat) / 8578069) [(1, 3), (2, 1), (15, 1)],
  term ((-91214993200 : Rat) / 150171761) [(1, 3), (4, 1), (11, 1)],
  term ((-4393842094993004215 : Rat) / 1288183727709509) [(1, 3), (4, 1), (11, 2), (15, 1)],
  term ((11377563916 : Rat) / 25734207) [(1, 3), (4, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(1, 3), (10, 1), (11, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 3), (10, 1), (11, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 3), (10, 1), (15, 1)],
  term ((45856133000 : Rat) / 150171761) [(1, 3), (11, 1)],
  term ((-334233601000 : Rat) / 150171761) [(1, 3), (11, 1), (12, 1)],
  term ((46986600000 : Rat) / 150171761) [(1, 3), (11, 1), (14, 1)],
  term ((-32200181441988988025 : Rat) / 2576367455419018) [(1, 3), (11, 2), (12, 1), (15, 1)],
  term ((2263352698255732500 : Rat) / 1288183727709509) [(1, 3), (11, 2), (14, 1), (15, 1)],
  term ((4417795812300687325 : Rat) / 2576367455419018) [(1, 3), (11, 2), (15, 1)],
  term ((-209944514390 : Rat) / 25734207) [(1, 3), (12, 1), (15, 1)],
  term ((3721737040 : Rat) / 8578069) [(1, 3), (14, 1), (15, 1)],
  term ((-7246637330 : Rat) / 25734207) [(1, 3), (15, 1)],
  term ((-677978411200 : Rat) / 150171761) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-32658338044222278940 : Rat) / 1288183727709509) [(2, 1), (3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-190031315024 : Rat) / 25734207) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((338989205600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-19813718834623878064 : Rat) / 3864551183128527) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((16329169022111139470 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-677978411200 : Rat) / 150171761) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((16329169022111139470 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 3)],
  term ((-32658338044222278940 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 3), (15, 2)],
  term ((95015657512 : Rat) / 25734207) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((95015657512 : Rat) / 25734207) [(2, 1), (3, 1), (15, 3)],
  term ((875898151200 : Rat) / 150171761) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((42192166360531035690 : Rat) / 1288183727709509) [(2, 1), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((62869582568 : Rat) / 8578069) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-437949075600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((5684478538588445848 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-21096083180265517845 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((875898151200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-21096083180265517845 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 3)],
  term ((42192166360531035690 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 3), (15, 2)],
  term ((-31434791284 : Rat) / 8578069) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-31434791284 : Rat) / 8578069) [(2, 1), (5, 1), (15, 3)],
  term ((154660360000 : Rat) / 150171761) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((7450016454035894500 : Rat) / 1288183727709509) [(2, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-8860222480 : Rat) / 25734207) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-77330180000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-3320586072140647280 : Rat) / 3864551183128527) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-3725008227017947250 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((154660360000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3725008227017947250 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 3)],
  term ((7450016454035894500 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 3), (15, 2)],
  term ((4430111240 : Rat) / 25734207) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((4430111240 : Rat) / 25734207) [(2, 1), (7, 1), (15, 3)],
  term ((-83360256000 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-345903106104914688 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-4015478037246547200 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 3)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 3), (15, 2)],
  term ((5297103360 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (15, 3)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (14, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((41680128000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((1153010353683048960 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-83360256000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 3)],
  term ((-4015478037246547200 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 3), (15, 2)],
  term ((-2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (15, 3)],
  term ((-1885949591600 : Rat) / 150171761) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1123242950961198624 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (15, 3)],
  term ((-90846520006175308295 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (14, 1)],
  term ((-8987770992486221490 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (14, 2)],
  term ((-691806212209829376 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (14, 2), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (15, 3)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 4), (15, 2)],
  term ((-919525928212 : Rat) / 25734207) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9281741128 : Rat) / 8578069) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3178262016 : Rat) / 8578069) [(2, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(2, 1), (10, 2), (11, 2), (14, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 3), (14, 1), (15, 1)],
  term ((942974795800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-113820119333855690732 : Rat) / 3864551183128527) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((561621475480599312 : Rat) / 1288183727709509) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-832233934857287096 : Rat) / 1288183727709509) [(2, 1), (11, 1), (15, 3)],
  term ((90846520006175308295 : Rat) / 2576367455419018) [(2, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1885949591600 : Rat) / 150171761) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((90846520006175308295 : Rat) / 2576367455419018) [(2, 1), (11, 2), (13, 1), (15, 3)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (11, 2), (14, 2)],
  term ((4493885496243110745 : Rat) / 1288183727709509) [(2, 1), (11, 2), (14, 2), (15, 2)],
  term ((-908721942613499424 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)],
  term ((4493885496243110745 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 4)],
  term ((-90846520006175308295 : Rat) / 1288183727709509) [(2, 1), (11, 3), (13, 1), (15, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (11, 3), (14, 2), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(2, 1), (11, 3), (15, 1)],
  term ((-7783127581312257330 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 3)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (11, 4), (15, 2)],
  term ((459762964106 : Rat) / 25734207) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((459762964106 : Rat) / 25734207) [(2, 1), (13, 1), (15, 3)],
  term ((4640870564 : Rat) / 8578069) [(2, 1), (14, 2), (15, 2)],
  term ((4640870564 : Rat) / 8578069) [(2, 1), (15, 4)],
  term ((-75859911200 : Rat) / 150171761) [(3, 1), (4, 1), (10, 1), (11, 1), (14, 1)],
  term ((-3654185123076797690 : Rat) / 1288183727709509) [(3, 1), (4, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((12356892296 : Rat) / 25734207) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((37929955600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((2831753605488862456 : Rat) / 3864551183128527) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((1827092561538398845 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((-75859911200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((1827092561538398845 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 3)],
  term ((-3654185123076797690 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 3), (15, 2)],
  term ((-6178446148 : Rat) / 25734207) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-6178446148 : Rat) / 25734207) [(3, 1), (4, 1), (15, 3)],
  term ((814675138000 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-34088129600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((39243043161117451225 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1642031134592652020 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((419773945580 : Rat) / 25734207) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-138474656272 : Rat) / 25734207) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-407337569000 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((52555683310143983380 : Rat) / 3864551183128527) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((17044064800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2)],
  term ((-20356367494551321392 : Rat) / 3864551183128527) [(3, 1), (11, 1), (15, 2)],
  term ((-39243043161117451225 : Rat) / 2576367455419018) [(3, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((814675138000 : Rat) / 150171761) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-39243043161117451225 : Rat) / 2576367455419018) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((821015567296326010 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-34088129600 : Rat) / 150171761) [(3, 1), (11, 2), (15, 1)],
  term ((821015567296326010 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 3)],
  term ((39243043161117451225 : Rat) / 1288183727709509) [(3, 1), (11, 3), (12, 1), (15, 2)],
  term ((-1642031134592652020 : Rat) / 1288183727709509) [(3, 1), (11, 3), (15, 2)],
  term ((-209886972790 : Rat) / 25734207) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-209886972790 : Rat) / 25734207) [(3, 1), (12, 1), (15, 3)],
  term ((69237328136 : Rat) / 25734207) [(3, 1), (14, 2), (15, 1)],
  term ((69237328136 : Rat) / 25734207) [(3, 1), (15, 3)],
  term ((-38019449600 : Rat) / 150171761) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(4, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((-458697638858384192 : Rat) / 3864551183128527) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 3)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 3), (15, 2)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (15, 3)],
  term ((123276744000 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((5938262210174415300 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((776058000 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-61638372000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-412196211565530000 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((123276744000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-2969131105087207650 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 3)],
  term ((5938262210174415300 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 3), (15, 2)],
  term ((-388029000 : Rat) / 8578069) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-388029000 : Rat) / 8578069) [(4, 1), (9, 1), (15, 3)],
  term ((-42153352000 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((634935264190506264 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((99715053600 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (14, 1)],
  term ((6010040759883067995 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1776147156 : Rat) / 8578069) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((21076676000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-12702477301383760 : Rat) / 3864551183128527) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-317467632095253132 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-584194778306914848 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 3)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-42153352000 : Rat) / 150171761) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((-49857526800 : Rat) / 150171761) [(4, 1), (11, 2), (14, 2)],
  term ((-6010040759883067995 : Rat) / 2576367455419018) [(4, 1), (11, 2), (14, 2), (15, 2)],
  term ((207253959130757064 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)],
  term ((-6010040759883067995 : Rat) / 2576367455419018) [(4, 1), (11, 2), (15, 4)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(4, 1), (11, 3), (13, 1), (15, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (11, 3), (14, 2), (15, 1)],
  term ((99715053600 : Rat) / 150171761) [(4, 1), (11, 3), (15, 1)],
  term ((3608395018094185710 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 3)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 4), (15, 2)],
  term ((1848197080 : Rat) / 25734207) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(4, 1), (13, 1), (15, 3)],
  term ((888073578 : Rat) / 8578069) [(4, 1), (14, 2), (15, 2)],
  term ((888073578 : Rat) / 8578069) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 99. -/
theorem rs_R013_ueqv_R013YNNN_block_24_0000_0099_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_24_0000_0099
      rs_R013_ueqv_R013YNNN_block_24_0000_0099 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
