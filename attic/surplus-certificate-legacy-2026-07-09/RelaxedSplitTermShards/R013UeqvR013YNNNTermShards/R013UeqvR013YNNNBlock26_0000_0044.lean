/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 26:0-44

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_26_0000_0044 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (12, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (13, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0000 : Poly :=
[
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 0 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0000 : Poly :=
[
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (4, 2), (11, 1)],
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (5, 2), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 3), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 3), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0000
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0001 : Poly :=
[
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0001 : Poly :=
[
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 2), (11, 2), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 2), (11, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 3), (11, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 2), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 3), (1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0001
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0002 : Poly :=
[
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 2 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0002 : Poly :=
[
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 3), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0002
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0003 : Poly :=
[
  term ((171121470000 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 3 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0003 : Poly :=
[
  term ((-342242940000 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((171121470000 : Rat) / 150171761) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((342242940000 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-171121470000 : Rat) / 150171761) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((342242940000 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-171121470000 : Rat) / 150171761) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((-342242940000 : Rat) / 150171761) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((171121470000 : Rat) / 150171761) [(0, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0003
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0004 : Poly :=
[
  term ((8242950987174798375 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 4 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0004 : Poly :=
[
  term ((-16485901974349596750 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((8242950987174798375 : Rat) / 1288183727709509) [(0, 1), (1, 2), (3, 1), (11, 2), (15, 1)],
  term ((16485901974349596750 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8242950987174798375 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((16485901974349596750 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8242950987174798375 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-16485901974349596750 : Rat) / 1288183727709509) [(0, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((8242950987174798375 : Rat) / 1288183727709509) [(0, 3), (3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0004
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0005 : Poly :=
[
  term ((-1379877700 : Rat) / 8578069) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 5 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0005 : Poly :=
[
  term ((2759755400 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-1379877700 : Rat) / 8578069) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-2759755400 : Rat) / 8578069) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((1379877700 : Rat) / 8578069) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((-2759755400 : Rat) / 8578069) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((1379877700 : Rat) / 8578069) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((2759755400 : Rat) / 8578069) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-1379877700 : Rat) / 8578069) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0005
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0006 : Poly :=
[
  term ((21076676000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 6 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0006 : Poly :=
[
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((21076676000 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((42153352000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-21076676000 : Rat) / 150171761) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((42153352000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((-21076676000 : Rat) / 150171761) [(0, 1), (5, 2), (11, 1), (13, 1)],
  term ((-42153352000 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((21076676000 : Rat) / 150171761) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0006
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0007 : Poly :=
[
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 7 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0007 : Poly :=
[
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 2), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (13, 1), (15, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0007
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0008 : Poly :=
[
  term ((1848197080 : Rat) / 25734207) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 8 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0008 : Poly :=
[
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0008
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0009 : Poly :=
[
  term ((-49061641200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 9 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0009 : Poly :=
[
  term ((98123282400 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-49061641200 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-98123282400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((49061641200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((-98123282400 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((49061641200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 2), (11, 1)],
  term ((98123282400 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-49061641200 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0009
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0010 : Poly :=
[
  term ((-2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 10 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0010 : Poly :=
[
  term ((4726615587885678630 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2363307793942839315 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-4726615587885678630 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((-4726615587885678630 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 2), (11, 2), (15, 1)],
  term ((4726615587885678630 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2363307793942839315 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0010
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0011 : Poly :=
[
  term ((5024652692 : Rat) / 8578069) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 11 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0011 : Poly :=
[
  term ((-10049305384 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((5024652692 : Rat) / 8578069) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((10049305384 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-5024652692 : Rat) / 8578069) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((10049305384 : Rat) / 8578069) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-5024652692 : Rat) / 8578069) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((-10049305384 : Rat) / 8578069) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((5024652692 : Rat) / 8578069) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0011
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0012 : Poly :=
[
  term ((131168231600 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 12 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0012 : Poly :=
[
  term ((-262336463200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((131168231600 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1)],
  term ((262336463200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 1)],
  term ((-131168231600 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1)],
  term ((262336463200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-131168231600 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1)],
  term ((-262336463200 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((131168231600 : Rat) / 150171761) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0012
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0013 : Poly :=
[
  term ((-21076676000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 13 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0013 : Poly :=
[
  term ((42153352000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-21076676000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((-42153352000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((21076676000 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((-42153352000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((21076676000 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((42153352000 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-21076676000 : Rat) / 150171761) [(1, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0013
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0014 : Poly :=
[
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 14 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0014 : Poly :=
[
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 2), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(1, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0014
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0015 : Poly :=
[
  term ((6318396541083901295 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 15 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0015 : Poly :=
[
  term ((-12636793082167802590 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((6318396541083901295 : Rat) / 1288183727709509) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((12636793082167802590 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6318396541083901295 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((12636793082167802590 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-6318396541083901295 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((-12636793082167802590 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((6318396541083901295 : Rat) / 1288183727709509) [(1, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0015
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0016 : Poly :=
[
  term ((-1848197080 : Rat) / 25734207) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 16 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0016 : Poly :=
[
  term ((3696394160 : Rat) / 25734207) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0016
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0017 : Poly :=
[
  term ((-7758598508 : Rat) / 25734207) [(1, 1), (15, 1)]
]

/-- Partial product 17 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0017 : Poly :=
[
  term ((15517197016 : Rat) / 25734207) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-7758598508 : Rat) / 25734207) [(0, 2), (1, 1), (15, 1)],
  term ((-15517197016 : Rat) / 25734207) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((7758598508 : Rat) / 25734207) [(1, 1), (4, 2), (15, 1)],
  term ((-15517197016 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((7758598508 : Rat) / 25734207) [(1, 1), (5, 2), (15, 1)],
  term ((15517197016 : Rat) / 25734207) [(1, 2), (13, 1), (15, 1)],
  term ((-7758598508 : Rat) / 25734207) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0017
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0018 : Poly :=
[
  term ((-119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 18 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0018 : Poly :=
[
  term ((238956656000 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((-119478328000 : Rat) / 150171761) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((238956656000 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-119478328000 : Rat) / 150171761) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((-238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0018
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0019 : Poly :=
[
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 19 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0019 : Poly :=
[
  term ((11510583700965102200 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(0, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((11510583700965102200 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0019
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0020 : Poly :=
[
  term ((-2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 20 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0020 : Poly :=
[
  term ((5080057120 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((-5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0020
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0021 : Poly :=
[
  term ((-2367950000 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 21 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0021 : Poly :=
[
  term ((4735900000 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2367950000 : Rat) / 150171761) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((4735900000 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((-2367950000 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-4735900000 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((2367950000 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((-4735900000 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((2367950000 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0021
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0022 : Poly :=
[
  term ((116896827200 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 22 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0022 : Poly :=
[
  term ((-233793654400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((116896827200 : Rat) / 150171761) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-233793654400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((116896827200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((233793654400 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-116896827200 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((233793654400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-116896827200 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0022
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0023 : Poly :=
[
  term ((-114064563552899375 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 23 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0023 : Poly :=
[
  term ((228129127105798750 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0023
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0024 : Poly :=
[
  term ((5630940507733143140 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 24 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0024 : Poly :=
[
  term ((-11261881015466286280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (15, 2)],
  term ((5630940507733143140 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 2), (15, 2)],
  term ((-11261881015466286280 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)],
  term ((5630940507733143140 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (15, 2)],
  term ((11261881015466286280 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-5630940507733143140 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (15, 2)],
  term ((11261881015466286280 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-5630940507733143140 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0024
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0025 : Poly :=
[
  term ((12876303500 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 25 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0025 : Poly :=
[
  term ((-25752607000 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-25752607000 : Rat) / 25734207) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((25752607000 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((25752607000 : Rat) / 25734207) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(2, 1), (5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0025
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0026 : Poly :=
[
  term ((-5854267856 : Rat) / 25734207) [(2, 1), (15, 2)]
]

/-- Partial product 26 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0026 : Poly :=
[
  term ((11708535712 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-5854267856 : Rat) / 25734207) [(0, 2), (2, 1), (15, 2)],
  term ((11708535712 : Rat) / 25734207) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-5854267856 : Rat) / 25734207) [(1, 2), (2, 1), (15, 2)],
  term ((-11708535712 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((5854267856 : Rat) / 25734207) [(2, 1), (4, 2), (15, 2)],
  term ((-11708535712 : Rat) / 25734207) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((5854267856 : Rat) / 25734207) [(2, 1), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0026
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0027 : Poly :=
[
  term ((-54011092000 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 27 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0027 : Poly :=
[
  term ((108022184000 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-54011092000 : Rat) / 150171761) [(0, 2), (3, 1), (11, 1)],
  term ((108022184000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-54011092000 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1)],
  term ((-108022184000 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (12, 1)],
  term ((54011092000 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((-108022184000 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((54011092000 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0027
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0028 : Poly :=
[
  term ((2367950000 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 28 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0028 : Poly :=
[
  term ((-4735900000 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((2367950000 : Rat) / 150171761) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((-4735900000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((2367950000 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((4735900000 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (12, 2)],
  term ((-2367950000 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((4735900000 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2367950000 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0028
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0029 : Poly :=
[
  term ((114064563552899375 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 29 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0029 : Poly :=
[
  term ((-228129127105798750 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(0, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0029
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0030 : Poly :=
[
  term ((-2601723700245146650 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 30 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0030 : Poly :=
[
  term ((5203447400490293300 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2601723700245146650 : Rat) / 1288183727709509) [(0, 2), (3, 1), (11, 2), (15, 1)],
  term ((5203447400490293300 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2601723700245146650 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((-5203447400490293300 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((2601723700245146650 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-5203447400490293300 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((2601723700245146650 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0030
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0031 : Poly :=
[
  term ((-12876303500 : Rat) / 25734207) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 31 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0031 : Poly :=
[
  term ((25752607000 : Rat) / 25734207) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((25752607000 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-25752607000 : Rat) / 25734207) [(3, 1), (4, 1), (12, 2), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-25752607000 : Rat) / 25734207) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(3, 1), (5, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0031
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0032 : Poly :=
[
  term ((19555965160 : Rat) / 25734207) [(3, 1), (15, 1)]
]

/-- Partial product 32 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0032 : Poly :=
[
  term ((-39111930320 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((19555965160 : Rat) / 25734207) [(0, 2), (3, 1), (15, 1)],
  term ((-39111930320 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((19555965160 : Rat) / 25734207) [(1, 2), (3, 1), (15, 1)],
  term ((39111930320 : Rat) / 25734207) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-19555965160 : Rat) / 25734207) [(3, 1), (4, 2), (15, 1)],
  term ((39111930320 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-19555965160 : Rat) / 25734207) [(3, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0032
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0033 : Poly :=
[
  term ((1537413600 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 33 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0033 : Poly :=
[
  term ((-3074827200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((1537413600 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1)],
  term ((-3074827200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((1537413600 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (12, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (5, 1), (11, 1)],
  term ((3074827200 : Rat) / 150171761) [(5, 2), (11, 1), (13, 1)],
  term ((-1537413600 : Rat) / 150171761) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0033
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0034 : Poly :=
[
  term ((74057480641184070 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 34 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0034 : Poly :=
[
  term ((-148114961282368140 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0034
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0035 : Poly :=
[
  term ((231408344 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 35 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0035 : Poly :=
[
  term ((-462816688 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(0, 2), (5, 1), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(1, 2), (5, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (5, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(5, 2), (13, 1), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0035
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0036 : Poly :=
[
  term ((-8038111200 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 36 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0036 : Poly :=
[
  term ((16076222400 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-8038111200 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1)],
  term ((16076222400 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-8038111200 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1)],
  term ((-16076222400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((8038111200 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)],
  term ((-16076222400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((8038111200 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0036
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0037 : Poly :=
[
  term ((-387197215235825190 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 37 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0037 : Poly :=
[
  term ((774394430471650380 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-387197215235825190 : Rat) / 1288183727709509) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-387197215235825190 : Rat) / 1288183727709509) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((387197215235825190 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((387197215235825190 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0037
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0038 : Poly :=
[
  term ((-874745208 : Rat) / 8578069) [(7, 1), (15, 1)]
]

/-- Partial product 38 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0038 : Poly :=
[
  term ((1749490416 : Rat) / 8578069) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-874745208 : Rat) / 8578069) [(0, 2), (7, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-874745208 : Rat) / 8578069) [(1, 2), (7, 1), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((874745208 : Rat) / 8578069) [(4, 2), (7, 1), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((874745208 : Rat) / 8578069) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0038
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0039 : Poly :=
[
  term ((-3437734800 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 39 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0039 : Poly :=
[
  term ((6875469600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3437734800 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((6875469600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2)],
  term ((-3437734800 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((-6875469600 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((3437734800 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((-6875469600 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2)],
  term ((3437734800 : Rat) / 150171761) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0039
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0040 : Poly :=
[
  term ((-147777875600 : Rat) / 150171761) [(11, 1), (15, 1)]
]

/-- Partial product 40 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0040 : Poly :=
[
  term ((295555751200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-147777875600 : Rat) / 150171761) [(0, 2), (11, 1), (15, 1)],
  term ((295555751200 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-147777875600 : Rat) / 150171761) [(1, 2), (11, 1), (15, 1)],
  term ((-295555751200 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((147777875600 : Rat) / 150171761) [(4, 2), (11, 1), (15, 1)],
  term ((-295555751200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((147777875600 : Rat) / 150171761) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0040
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0041 : Poly :=
[
  term ((-165596283524826885 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 41 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0041 : Poly :=
[
  term ((331192567049653770 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-165596283524826885 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((331192567049653770 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-165596283524826885 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-331192567049653770 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((165596283524826885 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-331192567049653770 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((165596283524826885 : Rat) / 1288183727709509) [(5, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0041
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0042 : Poly :=
[
  term ((-7118485982849577845 : Rat) / 1288183727709509) [(11, 2), (15, 2)]
]

/-- Partial product 42 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0042 : Poly :=
[
  term ((14236971965699155690 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-7118485982849577845 : Rat) / 1288183727709509) [(0, 2), (11, 2), (15, 2)],
  term ((14236971965699155690 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-7118485982849577845 : Rat) / 1288183727709509) [(1, 2), (11, 2), (15, 2)],
  term ((-14236971965699155690 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((7118485982849577845 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)],
  term ((-14236971965699155690 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((7118485982849577845 : Rat) / 1288183727709509) [(5, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0042
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0043 : Poly :=
[
  term ((-3771356692 : Rat) / 8578069) [(13, 1), (15, 1)]
]

/-- Partial product 43 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0043 : Poly :=
[
  term ((7542713384 : Rat) / 8578069) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3771356692 : Rat) / 8578069) [(0, 2), (13, 1), (15, 1)],
  term ((7542713384 : Rat) / 8578069) [(1, 1), (13, 2), (15, 1)],
  term ((-3771356692 : Rat) / 8578069) [(1, 2), (13, 1), (15, 1)],
  term ((-7542713384 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((3771356692 : Rat) / 8578069) [(4, 2), (13, 1), (15, 1)],
  term ((-7542713384 : Rat) / 8578069) [(5, 1), (13, 2), (15, 1)],
  term ((3771356692 : Rat) / 8578069) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0043
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 26. -/
def rs_R013_ueqv_R013YNNN_coefficient_26_0044 : Poly :=
[
  term ((3692594468 : Rat) / 25734207) [(15, 2)]
]

/-- Partial product 44 for generator 26. -/
def rs_R013_ueqv_R013YNNN_partial_26_0044 : Poly :=
[
  term ((-7385188936 : Rat) / 25734207) [(0, 1), (12, 1), (15, 2)],
  term ((3692594468 : Rat) / 25734207) [(0, 2), (15, 2)],
  term ((-7385188936 : Rat) / 25734207) [(1, 1), (13, 1), (15, 2)],
  term ((3692594468 : Rat) / 25734207) [(1, 2), (15, 2)],
  term ((7385188936 : Rat) / 25734207) [(4, 1), (12, 1), (15, 2)],
  term ((-3692594468 : Rat) / 25734207) [(4, 2), (15, 2)],
  term ((7385188936 : Rat) / 25734207) [(5, 1), (13, 1), (15, 2)],
  term ((-3692594468 : Rat) / 25734207) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 26. -/
theorem rs_R013_ueqv_R013YNNN_partial_26_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_26_0044
        rs_R013_ueqv_R013YNNN_generator_26_0000_0044 =
      rs_R013_ueqv_R013YNNN_partial_26_0044 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_26_0000_0044 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_26_0000,
  rs_R013_ueqv_R013YNNN_partial_26_0001,
  rs_R013_ueqv_R013YNNN_partial_26_0002,
  rs_R013_ueqv_R013YNNN_partial_26_0003,
  rs_R013_ueqv_R013YNNN_partial_26_0004,
  rs_R013_ueqv_R013YNNN_partial_26_0005,
  rs_R013_ueqv_R013YNNN_partial_26_0006,
  rs_R013_ueqv_R013YNNN_partial_26_0007,
  rs_R013_ueqv_R013YNNN_partial_26_0008,
  rs_R013_ueqv_R013YNNN_partial_26_0009,
  rs_R013_ueqv_R013YNNN_partial_26_0010,
  rs_R013_ueqv_R013YNNN_partial_26_0011,
  rs_R013_ueqv_R013YNNN_partial_26_0012,
  rs_R013_ueqv_R013YNNN_partial_26_0013,
  rs_R013_ueqv_R013YNNN_partial_26_0014,
  rs_R013_ueqv_R013YNNN_partial_26_0015,
  rs_R013_ueqv_R013YNNN_partial_26_0016,
  rs_R013_ueqv_R013YNNN_partial_26_0017,
  rs_R013_ueqv_R013YNNN_partial_26_0018,
  rs_R013_ueqv_R013YNNN_partial_26_0019,
  rs_R013_ueqv_R013YNNN_partial_26_0020,
  rs_R013_ueqv_R013YNNN_partial_26_0021,
  rs_R013_ueqv_R013YNNN_partial_26_0022,
  rs_R013_ueqv_R013YNNN_partial_26_0023,
  rs_R013_ueqv_R013YNNN_partial_26_0024,
  rs_R013_ueqv_R013YNNN_partial_26_0025,
  rs_R013_ueqv_R013YNNN_partial_26_0026,
  rs_R013_ueqv_R013YNNN_partial_26_0027,
  rs_R013_ueqv_R013YNNN_partial_26_0028,
  rs_R013_ueqv_R013YNNN_partial_26_0029,
  rs_R013_ueqv_R013YNNN_partial_26_0030,
  rs_R013_ueqv_R013YNNN_partial_26_0031,
  rs_R013_ueqv_R013YNNN_partial_26_0032,
  rs_R013_ueqv_R013YNNN_partial_26_0033,
  rs_R013_ueqv_R013YNNN_partial_26_0034,
  rs_R013_ueqv_R013YNNN_partial_26_0035,
  rs_R013_ueqv_R013YNNN_partial_26_0036,
  rs_R013_ueqv_R013YNNN_partial_26_0037,
  rs_R013_ueqv_R013YNNN_partial_26_0038,
  rs_R013_ueqv_R013YNNN_partial_26_0039,
  rs_R013_ueqv_R013YNNN_partial_26_0040,
  rs_R013_ueqv_R013YNNN_partial_26_0041,
  rs_R013_ueqv_R013YNNN_partial_26_0042,
  rs_R013_ueqv_R013YNNN_partial_26_0043,
  rs_R013_ueqv_R013YNNN_partial_26_0044
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_26_0000_0044 : Poly :=
[
  term ((98123282400 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((4726615587885678630 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-10049305384 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-342242940000 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-16485901974349596750 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((2759755400 : Rat) / 8578069) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (4, 2), (11, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 2), (11, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(0, 1), (1, 1), (5, 2), (11, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 2), (11, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term ((-262336463200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((42153352000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-12636793082167802590 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 2), (15, 1)],
  term ((15517197016 : Rat) / 25734207) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((171121470000 : Rat) / 150171761) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((8242950987174798375 : Rat) / 1288183727709509) [(0, 1), (1, 2), (3, 1), (11, 2), (15, 1)],
  term ((-1379877700 : Rat) / 8578069) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((8419794400 : Rat) / 8833633) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((405582961397473030 : Rat) / 75775513394677) [(0, 1), (1, 2), (11, 2), (13, 1), (15, 1)],
  term ((12782522056 : Rat) / 25734207) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(0, 1), (1, 3), (11, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 1), (1, 3), (11, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 1), (1, 3), (15, 1)],
  term ((238956656000 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((11510583700965102200 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((4735900000 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-233793654400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11261881015466286280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (15, 2)],
  term ((-25752607000 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((11708535712 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((342242940000 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((16485901974349596750 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2759755400 : Rat) / 8578069) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-171121470000 : Rat) / 150171761) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((-8242950987174798375 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((1379877700 : Rat) / 8578069) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((342242940000 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((16485901974349596750 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2759755400 : Rat) / 8578069) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-171121470000 : Rat) / 150171761) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((-8242950987174798375 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((1379877700 : Rat) / 8578069) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((108022184000 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-4735900000 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((5203447400490293300 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-39111930320 : Rat) / 25734207) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((25752607000 : Rat) / 25734207) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((42153352000 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21076676000 : Rat) / 150171761) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((-3074827200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((42153352000 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-21076676000 : Rat) / 150171761) [(0, 1), (5, 2), (11, 1), (13, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 1), (5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((16076222400 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((6875469600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((295555751200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((331192567049653770 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((14236971965699155690 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((7542713384 : Rat) / 8578069) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-7385188936 : Rat) / 25734207) [(0, 1), (12, 1), (15, 2)],
  term ((-49061641200 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-2363307793942839315 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((5024652692 : Rat) / 8578069) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((131168231600 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1)],
  term ((100983152800 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((4864376042706876610 : Rat) / 1288183727709509) [(0, 2), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((6318396541083901295 : Rat) / 1288183727709509) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((9086127896 : Rat) / 25734207) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-7758598508 : Rat) / 25734207) [(0, 2), (1, 1), (15, 1)],
  term ((-119478328000 : Rat) / 150171761) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(0, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((-2367950000 : Rat) / 150171761) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((116896827200 : Rat) / 150171761) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((5630940507733143140 : Rat) / 1288183727709509) [(0, 2), (2, 1), (11, 2), (15, 2)],
  term ((12876303500 : Rat) / 25734207) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-5854267856 : Rat) / 25734207) [(0, 2), (2, 1), (15, 2)],
  term ((-54011092000 : Rat) / 150171761) [(0, 2), (3, 1), (11, 1)],
  term ((-339874990000 : Rat) / 150171761) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((-16371837410796697375 : Rat) / 1288183727709509) [(0, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2601723700245146650 : Rat) / 1288183727709509) [(0, 2), (3, 1), (11, 2), (15, 1)],
  term ((-4597037300 : Rat) / 25734207) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((19555965160 : Rat) / 25734207) [(0, 2), (3, 1), (15, 1)],
  term ((1537413600 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(0, 2), (5, 1), (15, 1)],
  term ((-8038111200 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1)],
  term ((-387197215235825190 : Rat) / 1288183727709509) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((-874745208 : Rat) / 8578069) [(0, 2), (7, 1), (15, 1)],
  term ((-42153352000 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3437734800 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((-147777875600 : Rat) / 150171761) [(0, 2), (11, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-165596283524826885 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((-7118485982849577845 : Rat) / 1288183727709509) [(0, 2), (11, 2), (15, 2)],
  term ((-3696394160 : Rat) / 25734207) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3771356692 : Rat) / 8578069) [(0, 2), (13, 1), (15, 1)],
  term ((3692594468 : Rat) / 25734207) [(0, 2), (15, 2)],
  term ((-61029914400 : Rat) / 150171761) [(0, 3), (1, 1), (11, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(0, 3), (1, 1), (11, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(0, 3), (1, 1), (15, 1)],
  term ((171121470000 : Rat) / 150171761) [(0, 3), (3, 1), (11, 1)],
  term ((8242950987174798375 : Rat) / 1288183727709509) [(0, 3), (3, 1), (11, 2), (15, 1)],
  term ((-1379877700 : Rat) / 8578069) [(0, 3), (3, 1), (15, 1)],
  term ((21076676000 : Rat) / 150171761) [(0, 3), (11, 1), (13, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 3), (11, 2), (13, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 3), (13, 1), (15, 1)],
  term ((238956656000 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((11510583700965102200 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-98123282400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((-4726615587885678630 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((10049305384 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((49061641200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((-5024652692 : Rat) / 8578069) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-98123282400 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((-4726615587885678630 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((10049305384 : Rat) / 8578069) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((49061641200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 2), (11, 1)],
  term ((2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 2), (11, 2), (15, 1)],
  term ((-5024652692 : Rat) / 8578069) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((-233793654400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((4735900000 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((-11261881015466286280 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((11708535712 : Rat) / 25734207) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-25752607000 : Rat) / 25734207) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-4735900000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((108022184000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((5203447400490293300 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((25752607000 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-39111930320 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((262336463200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 1)],
  term ((-42153352000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((12636793082167802590 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((-15517197016 : Rat) / 25734207) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((-131168231600 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1)],
  term ((21076676000 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((-6318396541083901295 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((7758598508 : Rat) / 25734207) [(1, 1), (4, 2), (15, 1)],
  term ((-42153352000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((259261636000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((12488678120885434450 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16905647080 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-131168231600 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1)],
  term ((21076676000 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((-6318396541083901295 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((7758598508 : Rat) / 25734207) [(1, 1), (5, 2), (15, 1)],
  term ((16076222400 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((295555751200 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((6875469600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2)],
  term ((14236971965699155690 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((331192567049653770 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-7385188936 : Rat) / 25734207) [(1, 1), (13, 1), (15, 2)],
  term ((7542713384 : Rat) / 8578069) [(1, 1), (13, 2), (15, 1)],
  term ((-119478328000 : Rat) / 150171761) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((95755332400 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((116896827200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((4612551024332779255 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((5630940507733143140 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (15, 2)],
  term ((-17271612652 : Rat) / 25734207) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-5854267856 : Rat) / 25734207) [(1, 2), (2, 1), (15, 2)],
  term ((-54011092000 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1)],
  term ((2367950000 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2601723700245146650 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((19555965160 : Rat) / 25734207) [(1, 2), (3, 1), (15, 1)],
  term ((1537413600 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(1, 2), (5, 1), (15, 1)],
  term ((-8038111200 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1)],
  term ((-387197215235825190 : Rat) / 1288183727709509) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((-874745208 : Rat) / 8578069) [(1, 2), (7, 1), (15, 1)],
  term ((42153352000 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-265774198000 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((-147777875600 : Rat) / 150171761) [(1, 2), (11, 1), (15, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-12802389365692629475 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-7118485982849577845 : Rat) / 1288183727709509) [(1, 2), (11, 2), (15, 2)],
  term ((3696394160 : Rat) / 25734207) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((4203126940 : Rat) / 25734207) [(1, 2), (13, 1), (15, 1)],
  term ((3692594468 : Rat) / 25734207) [(1, 2), (15, 2)],
  term ((-49061641200 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1)],
  term ((-2363307793942839315 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (15, 1)],
  term ((5024652692 : Rat) / 8578069) [(1, 3), (2, 1), (15, 1)],
  term ((131168231600 : Rat) / 150171761) [(1, 3), (11, 1)],
  term ((-21076676000 : Rat) / 150171761) [(1, 3), (11, 1), (12, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(1, 3), (11, 2), (12, 1), (15, 1)],
  term ((6318396541083901295 : Rat) / 1288183727709509) [(1, 3), (11, 2), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(1, 3), (12, 1), (15, 1)],
  term ((-7758598508 : Rat) / 25734207) [(1, 3), (15, 1)],
  term ((-238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((-238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((-4735900000 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((233793654400 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((11261881015466286280 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((25752607000 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11708535712 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((2367950000 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((-116896827200 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5630940507733143140 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (15, 2)],
  term ((-12876303500 : Rat) / 25734207) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((5854267856 : Rat) / 25734207) [(2, 1), (4, 2), (15, 2)],
  term ((233793654400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4735900000 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((11261881015466286280 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-11708535712 : Rat) / 25734207) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((25752607000 : Rat) / 25734207) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((2367950000 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (13, 1)],
  term ((-116896827200 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5630940507733143140 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (15, 2)],
  term ((-12876303500 : Rat) / 25734207) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((5854267856 : Rat) / 25734207) [(2, 1), (5, 2), (15, 2)],
  term ((-108022184000 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (12, 1)],
  term ((4735900000 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (12, 2)],
  term ((-5203447400490293300 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((39111930320 : Rat) / 25734207) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-25752607000 : Rat) / 25734207) [(3, 1), (4, 1), (12, 2), (15, 1)],
  term ((54011092000 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((-2367950000 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((2601723700245146650 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-19555965160 : Rat) / 25734207) [(3, 1), (4, 2), (15, 1)],
  term ((4735900000 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-108022184000 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5203447400490293300 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-25752607000 : Rat) / 25734207) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((39111930320 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((54011092000 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)],
  term ((-2367950000 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((2601723700245146650 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-19555965160 : Rat) / 25734207) [(3, 1), (5, 2), (15, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (12, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-16076222400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-6875469600 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-295555751200 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-331192567049653770 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-14236971965699155690 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-7542713384 : Rat) / 8578069) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((7385188936 : Rat) / 25734207) [(4, 1), (12, 1), (15, 2)],
  term ((-1537413600 : Rat) / 150171761) [(4, 2), (5, 1), (11, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(4, 2), (5, 1), (15, 1)],
  term ((8038111200 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)],
  term ((387197215235825190 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((874745208 : Rat) / 8578069) [(4, 2), (7, 1), (15, 1)],
  term ((3437734800 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((147777875600 : Rat) / 150171761) [(4, 2), (11, 1), (15, 1)],
  term ((165596283524826885 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((7118485982849577845 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)],
  term ((3771356692 : Rat) / 8578069) [(4, 2), (13, 1), (15, 1)],
  term ((-3692594468 : Rat) / 25734207) [(4, 2), (15, 2)],
  term ((-16076222400 : Rat) / 150171761) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-295555751200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6875469600 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2)],
  term ((-14236971965699155690 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-331192567049653770 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((7385188936 : Rat) / 25734207) [(5, 1), (13, 1), (15, 2)],
  term ((-7542713384 : Rat) / 8578069) [(5, 1), (13, 2), (15, 1)],
  term ((8038111200 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1)],
  term ((387197215235825190 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (15, 1)],
  term ((874745208 : Rat) / 8578069) [(5, 2), (7, 1), (15, 1)],
  term ((6512562000 : Rat) / 150171761) [(5, 2), (11, 1), (13, 1)],
  term ((147777875600 : Rat) / 150171761) [(5, 2), (11, 1), (15, 1)],
  term ((313711244807195025 : Rat) / 1288183727709509) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((7118485982849577845 : Rat) / 1288183727709509) [(5, 2), (11, 2), (15, 2)],
  term ((4234173380 : Rat) / 8578069) [(5, 2), (13, 1), (15, 1)],
  term ((-3692594468 : Rat) / 25734207) [(5, 2), (15, 2)],
  term ((-1537413600 : Rat) / 150171761) [(5, 3), (11, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(5, 3), (11, 2), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 0 through 44. -/
theorem rs_R013_ueqv_R013YNNN_block_26_0000_0044_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_26_0000_0044
      rs_R013_ueqv_R013YNNN_block_26_0000_0044 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
