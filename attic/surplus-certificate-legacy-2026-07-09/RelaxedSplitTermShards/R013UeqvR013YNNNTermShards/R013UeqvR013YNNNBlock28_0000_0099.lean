/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 28:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_28_0000_0099 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0000 : Poly :=
[
  term ((-87828184400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 0 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0000 : Poly :=
[
  term ((-175656368800 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((87828184400 : Rat) / 150171761) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-175656368800 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((87828184400 : Rat) / 150171761) [(0, 1), (3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0000
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0001 : Poly :=
[
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0001 : Poly :=
[
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (15, 2)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (3, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0001
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0002 : Poly :=
[
  term ((-8184228268 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 2 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0002 : Poly :=
[
  term ((-16368456536 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((8184228268 : Rat) / 25734207) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-16368456536 : Rat) / 25734207) [(0, 1), (3, 2), (15, 2)],
  term ((8184228268 : Rat) / 25734207) [(0, 1), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0002
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0003 : Poly :=
[
  term ((154579692800 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 3 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0003 : Poly :=
[
  term ((309159385600 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((-154579692800 : Rat) / 150171761) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((309159385600 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-154579692800 : Rat) / 150171761) [(0, 1), (3, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0003
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0004 : Poly :=
[
  term ((7446130700974793360 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 4 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0004 : Poly :=
[
  term ((14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(0, 1), (2, 2), (5, 1), (11, 2), (15, 1)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(0, 1), (3, 2), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0004
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0005 : Poly :=
[
  term ((14520259456 : Rat) / 25734207) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 5 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0005 : Poly :=
[
  term ((29040518912 : Rat) / 25734207) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((29040518912 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-14520259456 : Rat) / 25734207) [(0, 1), (3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0005
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0006 : Poly :=
[
  term ((124976936000 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 6 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0006 : Poly :=
[
  term ((249953872000 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-124976936000 : Rat) / 150171761) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((249953872000 : Rat) / 150171761) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-124976936000 : Rat) / 150171761) [(0, 1), (3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0006
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0007 : Poly :=
[
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 7 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0007 : Poly :=
[
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (2, 2), (7, 1), (11, 2), (15, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 1), (11, 2), (15, 2)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (3, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0007
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0008 : Poly :=
[
  term ((-16761444560 : Rat) / 25734207) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 8 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0008 : Poly :=
[
  term ((-33522889120 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-33522889120 : Rat) / 25734207) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((16761444560 : Rat) / 25734207) [(0, 1), (3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0008
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0009 : Poly :=
[
  term ((-398621411600 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 9 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0009 : Poly :=
[
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0009
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0010 : Poly :=
[
  term ((-186788054400 : Rat) / 150171761) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 10 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0010 : Poly :=
[
  term ((-373576108800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((186788054400 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-373576108800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((186788054400 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0010
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0011 : Poly :=
[
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 11 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0011 : Poly :=
[
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0011
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0012 : Poly :=
[
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 12 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0012 : Poly :=
[
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (14, 1), (15, 2)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (15, 2)],
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 3)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0012
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0013 : Poly :=
[
  term ((-222347142652 : Rat) / 25734207) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 13 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0013 : Poly :=
[
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((222347142652 : Rat) / 25734207) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((222347142652 : Rat) / 25734207) [(0, 1), (3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0013
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0014 : Poly :=
[
  term ((-2490981536 : Rat) / 8578069) [(0, 1), (15, 2)]
]

/-- Partial product 14 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0014 : Poly :=
[
  term ((-4981963072 : Rat) / 8578069) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((2490981536 : Rat) / 8578069) [(0, 1), (2, 2), (15, 2)],
  term ((-4981963072 : Rat) / 8578069) [(0, 1), (3, 1), (15, 3)],
  term ((2490981536 : Rat) / 8578069) [(0, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0014
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0015 : Poly :=
[
  term ((87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 15 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0015 : Poly :=
[
  term ((175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((175656368800 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0015
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0016 : Poly :=
[
  term ((4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 16 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0016 : Poly :=
[
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (15, 2)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (14, 1), (15, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0016
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0017 : Poly :=
[
  term ((8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 17 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0017 : Poly :=
[
  term ((16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0017
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0018 : Poly :=
[
  term ((-7878039200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 18 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0018 : Poly :=
[
  term ((-15756078400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1)],
  term ((7878039200 : Rat) / 150171761) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((-15756078400 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((7878039200 : Rat) / 150171761) [(1, 1), (3, 2), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0018
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0019 : Poly :=
[
  term ((-379486519141296290 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 19 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0019 : Poly :=
[
  term ((-758973038282592580 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(1, 1), (2, 2), (4, 1), (11, 2), (15, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 2), (15, 2)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(1, 1), (3, 2), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0019
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0020 : Poly :=
[
  term ((-12051557464 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 20 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0020 : Poly :=
[
  term ((-24103114928 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((12051557464 : Rat) / 25734207) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-24103114928 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((12051557464 : Rat) / 25734207) [(1, 1), (3, 2), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0020
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0021 : Poly :=
[
  term ((146701653600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 21 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0021 : Poly :=
[
  term ((293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (3, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0021
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0022 : Poly :=
[
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 22 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0022 : Poly :=
[
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 2), (10, 1), (11, 2), (15, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 2), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (3, 2), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0022
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0023 : Poly :=
[
  term ((822900664 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 23 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0023 : Poly :=
[
  term ((1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (3, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0023
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0024 : Poly :=
[
  term ((-243710679600 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 24 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0024 : Poly :=
[
  term ((-487421359200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((243710679600 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1)],
  term ((-487421359200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((243710679600 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0024
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0025 : Poly :=
[
  term ((159137520800 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 25 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0025 : Poly :=
[
  term ((318275041600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((-159137520800 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((318275041600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-159137520800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0025
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0026 : Poly :=
[
  term ((175656368800 : Rat) / 150171761) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 26 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0026 : Poly :=
[
  term ((351312737600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((351312737600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0026
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0027 : Poly :=
[
  term ((7665682068853838210 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 27 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0027 : Poly :=
[
  term ((15331364137707676420 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (15, 2)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0027
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0028 : Poly :=
[
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 28 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0028 : Poly :=
[
  term ((16922795702999751620 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (14, 1), (15, 1)],
  term ((16922795702999751620 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (14, 1), (15, 2)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0028
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0029 : Poly :=
[
  term ((-11739585845036633895 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 29 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0029 : Poly :=
[
  term ((-23479171690073267790 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((11739585845036633895 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (15, 1)],
  term ((-23479171690073267790 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((11739585845036633895 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0029
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0030 : Poly :=
[
  term ((68986039096 : Rat) / 25734207) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 30 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0030 : Poly :=
[
  term ((137972078192 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-68986039096 : Rat) / 25734207) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((137972078192 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-68986039096 : Rat) / 25734207) [(1, 1), (3, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0030
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0031 : Poly :=
[
  term ((16368456536 : Rat) / 25734207) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 31 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0031 : Poly :=
[
  term ((32736913072 : Rat) / 25734207) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((32736913072 : Rat) / 25734207) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (3, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0031
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0032 : Poly :=
[
  term ((-1179992764 : Rat) / 8578069) [(1, 1), (15, 1)]
]

/-- Partial product 32 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0032 : Poly :=
[
  term ((-2359985528 : Rat) / 8578069) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((1179992764 : Rat) / 8578069) [(1, 1), (2, 2), (15, 1)],
  term ((-2359985528 : Rat) / 8578069) [(1, 1), (3, 1), (15, 2)],
  term ((1179992764 : Rat) / 8578069) [(1, 1), (3, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0032
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0033 : Poly :=
[
  term ((-15873657200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 33 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0033 : Poly :=
[
  term ((-31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((15873657200 : Rat) / 150171761) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((-31747314400 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((15873657200 : Rat) / 150171761) [(2, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0033
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0034 : Poly :=
[
  term ((-764636829538773515 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 34 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0034 : Poly :=
[
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 3), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0034
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0035 : Poly :=
[
  term ((-12926066884 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 35 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0035 : Poly :=
[
  term ((-25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((12926066884 : Rat) / 25734207) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-25852133768 : Rat) / 25734207) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(2, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0035
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0036 : Poly :=
[
  term ((-70323376800 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 36 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0036 : Poly :=
[
  term ((-140646753600 : Rat) / 150171761) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((70323376800 : Rat) / 150171761) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-140646753600 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((70323376800 : Rat) / 150171761) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0036
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0037 : Poly :=
[
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 37 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0037 : Poly :=
[
  term ((-6774978595205210820 : Rat) / 1288183727709509) [(2, 1), (3, 1), (7, 1), (11, 2), (15, 2)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-6774978595205210820 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(2, 3), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0037
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0038 : Poly :=
[
  term ((4928338968 : Rat) / 8578069) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 38 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0038 : Poly :=
[
  term ((9856677936 : Rat) / 8578069) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-4928338968 : Rat) / 8578069) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((9856677936 : Rat) / 8578069) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-4928338968 : Rat) / 8578069) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0038
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0039 : Poly :=
[
  term ((-22376914400 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 39 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0039 : Poly :=
[
  term ((-44753828800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((22376914400 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-44753828800 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((22376914400 : Rat) / 150171761) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0039
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0040 : Poly :=
[
  term ((59739164000 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 40 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0040 : Poly :=
[
  term ((119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-59739164000 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((119478328000 : Rat) / 150171761) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-59739164000 : Rat) / 150171761) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0040
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0041 : Poly :=
[
  term ((-1077899860510817030 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 41 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0041 : Poly :=
[
  term ((-2155799721021634060 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((1077899860510817030 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2155799721021634060 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1077899860510817030 : Rat) / 1288183727709509) [(2, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0041
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0042 : Poly :=
[
  term ((2877645925241275550 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 42 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0042 : Poly :=
[
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 3)],
  term ((-2877645925241275550 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (15, 2)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 2), (11, 2), (14, 1), (15, 2)],
  term ((-2877645925241275550 : Rat) / 1288183727709509) [(2, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0042
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0043 : Poly :=
[
  term ((-2475568168 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 43 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0043 : Poly :=
[
  term ((-4951136336 : Rat) / 25734207) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((2475568168 : Rat) / 25734207) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-4951136336 : Rat) / 25734207) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((2475568168 : Rat) / 25734207) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0043
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0044 : Poly :=
[
  term ((1270014280 : Rat) / 25734207) [(2, 1), (15, 2)]
]

/-- Partial product 44 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0044 : Poly :=
[
  term ((2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (15, 3)],
  term ((-1270014280 : Rat) / 25734207) [(2, 1), (3, 2), (15, 2)],
  term ((2540028560 : Rat) / 25734207) [(2, 2), (14, 1), (15, 2)],
  term ((-1270014280 : Rat) / 25734207) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0044
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0045 : Poly :=
[
  term ((15873657200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 45 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0045 : Poly :=
[
  term ((31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-15873657200 : Rat) / 150171761) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((31747314400 : Rat) / 150171761) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-15873657200 : Rat) / 150171761) [(3, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0045
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0046 : Poly :=
[
  term ((764636829538773515 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 46 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0046 : Poly :=
[
  term ((1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((-764636829538773515 : Rat) / 1288183727709509) [(2, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((1529273659077547030 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 2), (15, 2)],
  term ((-764636829538773515 : Rat) / 1288183727709509) [(3, 3), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0046
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0047 : Poly :=
[
  term ((12926066884 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 47 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0047 : Poly :=
[
  term ((25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-12926066884 : Rat) / 25734207) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((25852133768 : Rat) / 25734207) [(3, 2), (4, 1), (15, 2)],
  term ((-12926066884 : Rat) / 25734207) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0047
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0048 : Poly :=
[
  term ((2435289800 : Rat) / 8833633) [(3, 1), (11, 1)]
]

/-- Partial product 48 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0048 : Poly :=
[
  term ((4870579600 : Rat) / 8833633) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-2435289800 : Rat) / 8833633) [(2, 2), (3, 1), (11, 1)],
  term ((4870579600 : Rat) / 8833633) [(3, 2), (11, 1), (15, 1)],
  term ((-2435289800 : Rat) / 8833633) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0048
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0049 : Poly :=
[
  term ((-36071499200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 49 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0049 : Poly :=
[
  term ((-72142998400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((36071499200 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-72142998400 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((36071499200 : Rat) / 150171761) [(3, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0049
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0050 : Poly :=
[
  term ((47262687600 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 50 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0050 : Poly :=
[
  term ((94525375200 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-47262687600 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((94525375200 : Rat) / 150171761) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-47262687600 : Rat) / 150171761) [(3, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0050
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0051 : Poly :=
[
  term ((-1737570393355754540 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 51 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0051 : Poly :=
[
  term ((-3475140786711509080 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1737570393355754540 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3475140786711509080 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((1737570393355754540 : Rat) / 1288183727709509) [(3, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0051
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0052 : Poly :=
[
  term ((2276651885990425995 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 52 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0052 : Poly :=
[
  term ((4553303771980851990 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2276651885990425995 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((4553303771980851990 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 1), (15, 2)],
  term ((-2276651885990425995 : Rat) / 1288183727709509) [(3, 3), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0052
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0053 : Poly :=
[
  term ((234616666873732645 : Rat) / 151551026789354) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 53 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0053 : Poly :=
[
  term ((234616666873732645 : Rat) / 75775513394677) [(2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-234616666873732645 : Rat) / 151551026789354) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((234616666873732645 : Rat) / 75775513394677) [(3, 2), (11, 2), (15, 2)],
  term ((-234616666873732645 : Rat) / 151551026789354) [(3, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0053
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0054 : Poly :=
[
  term ((5402702096 : Rat) / 25734207) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 54 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0054 : Poly :=
[
  term ((10805404192 : Rat) / 25734207) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5402702096 : Rat) / 25734207) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((10805404192 : Rat) / 25734207) [(3, 2), (12, 1), (15, 2)],
  term ((-5402702096 : Rat) / 25734207) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0054
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0055 : Poly :=
[
  term ((-2357367796 : Rat) / 8578069) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 55 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0055 : Poly :=
[
  term ((-4714735592 : Rat) / 8578069) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((2357367796 : Rat) / 8578069) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-4714735592 : Rat) / 8578069) [(3, 2), (14, 1), (15, 2)],
  term ((2357367796 : Rat) / 8578069) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0055
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0056 : Poly :=
[
  term ((-3221449618 : Rat) / 25734207) [(3, 1), (15, 1)]
]

/-- Partial product 56 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0056 : Poly :=
[
  term ((-6442899236 : Rat) / 25734207) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((3221449618 : Rat) / 25734207) [(2, 2), (3, 1), (15, 1)],
  term ((-6442899236 : Rat) / 25734207) [(3, 2), (15, 2)],
  term ((3221449618 : Rat) / 25734207) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0056
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0057 : Poly :=
[
  term ((-42835869600 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 57 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0057 : Poly :=
[
  term ((-85671739200 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((42835869600 : Rat) / 150171761) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((-85671739200 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((42835869600 : Rat) / 150171761) [(3, 2), (4, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0057
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0058 : Poly :=
[
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 58 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0058 : Poly :=
[
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 2), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (11, 2), (15, 2)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(3, 2), (4, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0058
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0059 : Poly :=
[
  term ((499743416 : Rat) / 8578069) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 59 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0059 : Poly :=
[
  term ((999486832 : Rat) / 8578069) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((999486832 : Rat) / 8578069) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((-499743416 : Rat) / 8578069) [(3, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0059
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0060 : Poly :=
[
  term ((13422316800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 60 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0060 : Poly :=
[
  term ((26844633600 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-13422316800 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((26844633600 : Rat) / 150171761) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((-13422316800 : Rat) / 150171761) [(3, 2), (4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0060_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0060
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0061 : Poly :=
[
  term ((646555335906902160 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 61 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0061 : Poly :=
[
  term ((1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-646555335906902160 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((1293110671813804320 : Rat) / 1288183727709509) [(3, 1), (4, 1), (7, 1), (11, 2), (15, 2)],
  term ((-646555335906902160 : Rat) / 1288183727709509) [(3, 2), (4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0061_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0061
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0062 : Poly :=
[
  term ((-541374848 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 62 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0062 : Poly :=
[
  term ((-1082749696 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((541374848 : Rat) / 8578069) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((-1082749696 : Rat) / 8578069) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((541374848 : Rat) / 8578069) [(3, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0062_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0062
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0063 : Poly :=
[
  term ((1866394400 : Rat) / 8833633) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 63 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0063 : Poly :=
[
  term ((3732788800 : Rat) / 8833633) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1866394400 : Rat) / 8833633) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((3732788800 : Rat) / 8833633) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1866394400 : Rat) / 8833633) [(3, 2), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0063_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0063
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0064 : Poly :=
[
  term ((-18966594400 : Rat) / 150171761) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 64 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0064 : Poly :=
[
  term ((-37933188800 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((18966594400 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-37933188800 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((18966594400 : Rat) / 150171761) [(3, 2), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0064_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0064
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0065 : Poly :=
[
  term ((89904543023955530 : Rat) / 75775513394677) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 65 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0065 : Poly :=
[
  term ((179809086047911060 : Rat) / 75775513394677) [(2, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-89904543023955530 : Rat) / 75775513394677) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((179809086047911060 : Rat) / 75775513394677) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-89904543023955530 : Rat) / 75775513394677) [(3, 2), (4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0065_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0065
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0066 : Poly :=
[
  term ((-913624152672508030 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 66 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0066 : Poly :=
[
  term ((-1827248305345016060 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((913624152672508030 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (15, 2)],
  term ((-1827248305345016060 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 3)],
  term ((913624152672508030 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0066_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0066
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0067 : Poly :=
[
  term ((-20453903944 : Rat) / 25734207) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 67 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0067 : Poly :=
[
  term ((-40907807888 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((20453903944 : Rat) / 25734207) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-40907807888 : Rat) / 25734207) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((20453903944 : Rat) / 25734207) [(3, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0067_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0067
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0068 : Poly :=
[
  term ((15299806552 : Rat) / 25734207) [(4, 1), (15, 2)]
]

/-- Partial product 68 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0068 : Poly :=
[
  term ((30599613104 : Rat) / 25734207) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-15299806552 : Rat) / 25734207) [(2, 2), (4, 1), (15, 2)],
  term ((30599613104 : Rat) / 25734207) [(3, 1), (4, 1), (15, 3)],
  term ((-15299806552 : Rat) / 25734207) [(3, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0068_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0068
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0069 : Poly :=
[
  term ((-146701653600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 69 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0069 : Poly :=
[
  term ((-293403307200 : Rat) / 150171761) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((146701653600 : Rat) / 150171761) [(2, 2), (5, 1), (10, 1), (11, 1)],
  term ((-293403307200 : Rat) / 150171761) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(3, 2), (5, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0069_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0069
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0070 : Poly :=
[
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 70 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0070 : Poly :=
[
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(2, 1), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(2, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(3, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(3, 2), (5, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0070_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0070
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0071 : Poly :=
[
  term ((-822900664 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 71 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0071 : Poly :=
[
  term ((-1645801328 : Rat) / 8578069) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((822900664 : Rat) / 8578069) [(3, 2), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0071_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0071
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0072 : Poly :=
[
  term ((-97211942800 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 72 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0072 : Poly :=
[
  term ((-194423885600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((97211942800 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((-194423885600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((97211942800 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0072_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0072
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0073 : Poly :=
[
  term ((85168122400 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 73 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0073 : Poly :=
[
  term ((170336244800 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-85168122400 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((170336244800 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-85168122400 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0073_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0073
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0074 : Poly :=
[
  term ((122832378400 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 74 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0074 : Poly :=
[
  term ((245664756800 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((-122832378400 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((245664756800 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-122832378400 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0074_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0074
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0075 : Poly :=
[
  term ((4102563276325899130 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 75 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0075 : Poly :=
[
  term ((8205126552651798260 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4102563276325899130 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((8205126552651798260 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (12, 1), (15, 2)],
  term ((-4102563276325899130 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0075_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0075
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0076 : Poly :=
[
  term ((5916857041897246330 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 76 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0076 : Poly :=
[
  term ((11833714083794492660 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-5916857041897246330 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((11833714083794492660 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2)],
  term ((-5916857041897246330 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0076_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0076
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0077 : Poly :=
[
  term ((-4682716200769196485 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 77 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0077 : Poly :=
[
  term ((-9365432401538392970 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((4682716200769196485 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((-9365432401538392970 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((4682716200769196485 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0077_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0077
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0078 : Poly :=
[
  term ((14599636088 : Rat) / 25734207) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 78 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0078 : Poly :=
[
  term ((29199272176 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-14599636088 : Rat) / 25734207) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((29199272176 : Rat) / 25734207) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-14599636088 : Rat) / 25734207) [(3, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0078_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0078
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0079 : Poly :=
[
  term ((-11331874312 : Rat) / 25734207) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 79 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0079 : Poly :=
[
  term ((-22663748624 : Rat) / 25734207) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((11331874312 : Rat) / 25734207) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-22663748624 : Rat) / 25734207) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((11331874312 : Rat) / 25734207) [(3, 2), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0079_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0079
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0080 : Poly :=
[
  term ((311389924 : Rat) / 25734207) [(5, 1), (15, 1)]
]

/-- Partial product 80 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0080 : Poly :=
[
  term ((622779848 : Rat) / 25734207) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-311389924 : Rat) / 25734207) [(2, 2), (5, 1), (15, 1)],
  term ((622779848 : Rat) / 25734207) [(3, 1), (5, 1), (15, 2)],
  term ((-311389924 : Rat) / 25734207) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0080_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0080
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0081 : Poly :=
[
  term ((-11600014800 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 81 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0081 : Poly :=
[
  term ((-23200029600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((11600014800 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((-23200029600 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((11600014800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0081_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0081
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0082 : Poly :=
[
  term ((25388341200 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 82 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0082 : Poly :=
[
  term ((50776682400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-25388341200 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((50776682400 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-25388341200 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0082_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0082
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0083 : Poly :=
[
  term ((-15669817600 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 83 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0083 : Poly :=
[
  term ((-31339635200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((15669817600 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-31339635200 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((15669817600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0083_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0083
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0084 : Poly :=
[
  term ((1222960813492723065 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 84 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0084 : Poly :=
[
  term ((2445921626985446130 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1222960813492723065 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((2445921626985446130 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (12, 1), (15, 2)],
  term ((-1222960813492723065 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0084_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0084
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0085 : Poly :=
[
  term ((-754817840536135120 : Rat) / 1288183727709509) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 85 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0085 : Poly :=
[
  term ((-1509635681072270240 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((754817840536135120 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1509635681072270240 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (14, 1), (15, 2)],
  term ((754817840536135120 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0085_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0085
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0086 : Poly :=
[
  term ((-558774731463575385 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 86 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0086 : Poly :=
[
  term ((-1117549462927150770 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((558774731463575385 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-1117549462927150770 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (15, 2)],
  term ((558774731463575385 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0086_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0086
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0087 : Poly :=
[
  term ((2623673188 : Rat) / 8578069) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 87 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0087 : Poly :=
[
  term ((5247346376 : Rat) / 8578069) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2623673188 : Rat) / 8578069) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((5247346376 : Rat) / 8578069) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-2623673188 : Rat) / 8578069) [(3, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0087_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0087
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0088 : Poly :=
[
  term ((12808589248 : Rat) / 25734207) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 88 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0088 : Poly :=
[
  term ((25617178496 : Rat) / 25734207) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-12808589248 : Rat) / 25734207) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((25617178496 : Rat) / 25734207) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-12808589248 : Rat) / 25734207) [(3, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0088_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0088
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0089 : Poly :=
[
  term ((-1210104132 : Rat) / 8578069) [(7, 1), (15, 1)]
]

/-- Partial product 89 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0089 : Poly :=
[
  term ((-2420208264 : Rat) / 8578069) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((1210104132 : Rat) / 8578069) [(2, 2), (7, 1), (15, 1)],
  term ((-2420208264 : Rat) / 8578069) [(3, 1), (7, 1), (15, 2)],
  term ((1210104132 : Rat) / 8578069) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0089_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0089
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0090 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 90 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0090 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((13546041600 : Rat) / 150171761) [(3, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0090_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0090
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0091 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 91 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0091 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 2), (15, 2)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (15, 3)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0091_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0091
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0092 : Poly :=
[
  term ((860779296 : Rat) / 8578069) [(10, 1), (15, 2)]
]

/-- Partial product 92 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0092 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(2, 2), (10, 1), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (10, 1), (15, 3)],
  term ((-860779296 : Rat) / 8578069) [(3, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0092_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0092
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0093 : Poly :=
[
  term ((239483890800 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 93 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0093 : Poly :=
[
  term ((478967781600 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-239483890800 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((478967781600 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-239483890800 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0093_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0093
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0094 : Poly :=
[
  term ((10127214400 : Rat) / 8833633) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 94 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0094 : Poly :=
[
  term ((20254428800 : Rat) / 8833633) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10127214400 : Rat) / 8833633) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((20254428800 : Rat) / 8833633) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10127214400 : Rat) / 8833633) [(3, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0094_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0094
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0095 : Poly :=
[
  term ((2513567800 : Rat) / 8833633) [(11, 1), (13, 1)]
]

/-- Partial product 95 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0095 : Poly :=
[
  term ((5027135600 : Rat) / 8833633) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2513567800 : Rat) / 8833633) [(2, 2), (11, 1), (13, 1)],
  term ((5027135600 : Rat) / 8833633) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2513567800 : Rat) / 8833633) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0095_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0095
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0096 : Poly :=
[
  term ((-443375240400 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 96 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0096 : Poly :=
[
  term ((-886750480800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((443375240400 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-886750480800 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((443375240400 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0096_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0096
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0097 : Poly :=
[
  term ((-67309726400 : Rat) / 150171761) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 97 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0097 : Poly :=
[
  term ((-134619452800 : Rat) / 150171761) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((67309726400 : Rat) / 150171761) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-134619452800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((67309726400 : Rat) / 150171761) [(3, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0097_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0097
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0098 : Poly :=
[
  term ((54162820864979184 : Rat) / 75775513394677) [(11, 1), (15, 1)]
]

/-- Partial product 98 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0098 : Poly :=
[
  term ((108325641729958368 : Rat) / 75775513394677) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-54162820864979184 : Rat) / 75775513394677) [(2, 2), (11, 1), (15, 1)],
  term ((108325641729958368 : Rat) / 75775513394677) [(3, 1), (11, 1), (15, 2)],
  term ((-54162820864979184 : Rat) / 75775513394677) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0098_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0098
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0099 : Poly :=
[
  term ((-6773020800 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 99 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0099 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(2, 1), (11, 2), (14, 1)],
  term ((6773020800 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (11, 2), (15, 1)],
  term ((6773020800 : Rat) / 150171761) [(3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0099_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0099
        rs_R013_ueqv_R013YNNN_generator_28_0000_0099 =
      rs_R013_ueqv_R013YNNN_partial_28_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_28_0000_0099 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_28_0000,
  rs_R013_ueqv_R013YNNN_partial_28_0001,
  rs_R013_ueqv_R013YNNN_partial_28_0002,
  rs_R013_ueqv_R013YNNN_partial_28_0003,
  rs_R013_ueqv_R013YNNN_partial_28_0004,
  rs_R013_ueqv_R013YNNN_partial_28_0005,
  rs_R013_ueqv_R013YNNN_partial_28_0006,
  rs_R013_ueqv_R013YNNN_partial_28_0007,
  rs_R013_ueqv_R013YNNN_partial_28_0008,
  rs_R013_ueqv_R013YNNN_partial_28_0009,
  rs_R013_ueqv_R013YNNN_partial_28_0010,
  rs_R013_ueqv_R013YNNN_partial_28_0011,
  rs_R013_ueqv_R013YNNN_partial_28_0012,
  rs_R013_ueqv_R013YNNN_partial_28_0013,
  rs_R013_ueqv_R013YNNN_partial_28_0014,
  rs_R013_ueqv_R013YNNN_partial_28_0015,
  rs_R013_ueqv_R013YNNN_partial_28_0016,
  rs_R013_ueqv_R013YNNN_partial_28_0017,
  rs_R013_ueqv_R013YNNN_partial_28_0018,
  rs_R013_ueqv_R013YNNN_partial_28_0019,
  rs_R013_ueqv_R013YNNN_partial_28_0020,
  rs_R013_ueqv_R013YNNN_partial_28_0021,
  rs_R013_ueqv_R013YNNN_partial_28_0022,
  rs_R013_ueqv_R013YNNN_partial_28_0023,
  rs_R013_ueqv_R013YNNN_partial_28_0024,
  rs_R013_ueqv_R013YNNN_partial_28_0025,
  rs_R013_ueqv_R013YNNN_partial_28_0026,
  rs_R013_ueqv_R013YNNN_partial_28_0027,
  rs_R013_ueqv_R013YNNN_partial_28_0028,
  rs_R013_ueqv_R013YNNN_partial_28_0029,
  rs_R013_ueqv_R013YNNN_partial_28_0030,
  rs_R013_ueqv_R013YNNN_partial_28_0031,
  rs_R013_ueqv_R013YNNN_partial_28_0032,
  rs_R013_ueqv_R013YNNN_partial_28_0033,
  rs_R013_ueqv_R013YNNN_partial_28_0034,
  rs_R013_ueqv_R013YNNN_partial_28_0035,
  rs_R013_ueqv_R013YNNN_partial_28_0036,
  rs_R013_ueqv_R013YNNN_partial_28_0037,
  rs_R013_ueqv_R013YNNN_partial_28_0038,
  rs_R013_ueqv_R013YNNN_partial_28_0039,
  rs_R013_ueqv_R013YNNN_partial_28_0040,
  rs_R013_ueqv_R013YNNN_partial_28_0041,
  rs_R013_ueqv_R013YNNN_partial_28_0042,
  rs_R013_ueqv_R013YNNN_partial_28_0043,
  rs_R013_ueqv_R013YNNN_partial_28_0044,
  rs_R013_ueqv_R013YNNN_partial_28_0045,
  rs_R013_ueqv_R013YNNN_partial_28_0046,
  rs_R013_ueqv_R013YNNN_partial_28_0047,
  rs_R013_ueqv_R013YNNN_partial_28_0048,
  rs_R013_ueqv_R013YNNN_partial_28_0049,
  rs_R013_ueqv_R013YNNN_partial_28_0050,
  rs_R013_ueqv_R013YNNN_partial_28_0051,
  rs_R013_ueqv_R013YNNN_partial_28_0052,
  rs_R013_ueqv_R013YNNN_partial_28_0053,
  rs_R013_ueqv_R013YNNN_partial_28_0054,
  rs_R013_ueqv_R013YNNN_partial_28_0055,
  rs_R013_ueqv_R013YNNN_partial_28_0056,
  rs_R013_ueqv_R013YNNN_partial_28_0057,
  rs_R013_ueqv_R013YNNN_partial_28_0058,
  rs_R013_ueqv_R013YNNN_partial_28_0059,
  rs_R013_ueqv_R013YNNN_partial_28_0060,
  rs_R013_ueqv_R013YNNN_partial_28_0061,
  rs_R013_ueqv_R013YNNN_partial_28_0062,
  rs_R013_ueqv_R013YNNN_partial_28_0063,
  rs_R013_ueqv_R013YNNN_partial_28_0064,
  rs_R013_ueqv_R013YNNN_partial_28_0065,
  rs_R013_ueqv_R013YNNN_partial_28_0066,
  rs_R013_ueqv_R013YNNN_partial_28_0067,
  rs_R013_ueqv_R013YNNN_partial_28_0068,
  rs_R013_ueqv_R013YNNN_partial_28_0069,
  rs_R013_ueqv_R013YNNN_partial_28_0070,
  rs_R013_ueqv_R013YNNN_partial_28_0071,
  rs_R013_ueqv_R013YNNN_partial_28_0072,
  rs_R013_ueqv_R013YNNN_partial_28_0073,
  rs_R013_ueqv_R013YNNN_partial_28_0074,
  rs_R013_ueqv_R013YNNN_partial_28_0075,
  rs_R013_ueqv_R013YNNN_partial_28_0076,
  rs_R013_ueqv_R013YNNN_partial_28_0077,
  rs_R013_ueqv_R013YNNN_partial_28_0078,
  rs_R013_ueqv_R013YNNN_partial_28_0079,
  rs_R013_ueqv_R013YNNN_partial_28_0080,
  rs_R013_ueqv_R013YNNN_partial_28_0081,
  rs_R013_ueqv_R013YNNN_partial_28_0082,
  rs_R013_ueqv_R013YNNN_partial_28_0083,
  rs_R013_ueqv_R013YNNN_partial_28_0084,
  rs_R013_ueqv_R013YNNN_partial_28_0085,
  rs_R013_ueqv_R013YNNN_partial_28_0086,
  rs_R013_ueqv_R013YNNN_partial_28_0087,
  rs_R013_ueqv_R013YNNN_partial_28_0088,
  rs_R013_ueqv_R013YNNN_partial_28_0089,
  rs_R013_ueqv_R013YNNN_partial_28_0090,
  rs_R013_ueqv_R013YNNN_partial_28_0091,
  rs_R013_ueqv_R013YNNN_partial_28_0092,
  rs_R013_ueqv_R013YNNN_partial_28_0093,
  rs_R013_ueqv_R013YNNN_partial_28_0094,
  rs_R013_ueqv_R013YNNN_partial_28_0095,
  rs_R013_ueqv_R013YNNN_partial_28_0096,
  rs_R013_ueqv_R013YNNN_partial_28_0097,
  rs_R013_ueqv_R013YNNN_partial_28_0098,
  rs_R013_ueqv_R013YNNN_partial_28_0099
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_28_0000_0099 : Poly :=
[
  term ((-175656368800 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-16368456536 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((309159385600 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((29040518912 : Rat) / 25734207) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((249953872000 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-33522889120 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-373576108800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (14, 1), (15, 2)],
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4981963072 : Rat) / 8578069) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((87828184400 : Rat) / 150171761) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (2, 2), (3, 1), (11, 2), (15, 1)],
  term ((8184228268 : Rat) / 25734207) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-154579692800 : Rat) / 150171761) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(0, 1), (2, 2), (5, 1), (11, 2), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-124976936000 : Rat) / 150171761) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (2, 2), (7, 1), (11, 2), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((186788054400 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (13, 1), (15, 1)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (15, 2)],
  term ((222347142652 : Rat) / 25734207) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((2490981536 : Rat) / 8578069) [(0, 1), (2, 2), (15, 2)],
  term ((309159385600 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((29040518912 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((249953872000 : Rat) / 150171761) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 1), (11, 2), (15, 2)],
  term ((-33522889120 : Rat) / 25734207) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-373576108800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 3)],
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-4981963072 : Rat) / 8578069) [(0, 1), (3, 1), (15, 3)],
  term ((-154579692800 : Rat) / 150171761) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(0, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-124976936000 : Rat) / 150171761) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((11131685600 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (15, 2)],
  term ((222347142652 : Rat) / 25734207) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(0, 1), (3, 2), (15, 2)],
  term ((87828184400 : Rat) / 150171761) [(0, 1), (3, 3), (11, 1)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (3, 3), (11, 2), (15, 1)],
  term ((8184228268 : Rat) / 25734207) [(0, 1), (3, 3), (15, 1)],
  term ((175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (15, 2)],
  term ((16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-15756078400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((-24103114928 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((318275041600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((-487421359200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((351312737600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-23479171690073267790 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((16922795702999751620 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)],
  term ((137972078192 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2359985528 : Rat) / 8578069) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((32736913072 : Rat) / 25734207) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((7878039200 : Rat) / 150171761) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(1, 1), (2, 2), (4, 1), (11, 2), (15, 1)],
  term ((12051557464 : Rat) / 25734207) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 2), (10, 1), (11, 2), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((243710679600 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1)],
  term ((-159137520800 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)],
  term ((11739585845036633895 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (15, 1)],
  term ((-68986039096 : Rat) / 25734207) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((1179992764 : Rat) / 8578069) [(1, 1), (2, 2), (15, 1)],
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 3), (11, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 3), (11, 2), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 3), (15, 1)],
  term ((-15756078400 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 2), (15, 2)],
  term ((-24103114928 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 2), (15, 2)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((318275041600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((351312737600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-487421359200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (15, 2)],
  term ((16922795702999751620 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (14, 1), (15, 2)],
  term ((-23479171690073267790 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((137972078192 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((32736913072 : Rat) / 25734207) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-2359985528 : Rat) / 8578069) [(1, 1), (3, 1), (15, 2)],
  term ((7878039200 : Rat) / 150171761) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(1, 1), (3, 2), (4, 1), (11, 2), (15, 1)],
  term ((12051557464 : Rat) / 25734207) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (3, 2), (10, 1), (11, 2), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((243710679600 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)],
  term ((-159137520800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (14, 1), (15, 1)],
  term ((11739585845036633895 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((-68986039096 : Rat) / 25734207) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((1179992764 : Rat) / 8578069) [(1, 1), (3, 2), (15, 1)],
  term ((31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((-140646753600 : Rat) / 150171761) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-6774978595205210820 : Rat) / 1288183727709509) [(2, 1), (3, 1), (7, 1), (11, 2), (15, 2)],
  term ((9856677936 : Rat) / 8578069) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-72142998400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-44753828800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((4870579600 : Rat) / 8833633) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((94525375200 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((119478328000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-3475140786711509080 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-2155799721021634060 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((234616666873732645 : Rat) / 75775513394677) [(2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((4553303771980851990 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (14, 2), (15, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 3)],
  term ((10805404192 : Rat) / 25734207) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4951136336 : Rat) / 25734207) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-6442899236 : Rat) / 25734207) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-4714735592 : Rat) / 8578069) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 1), (3, 1), (15, 3)],
  term ((15873657200 : Rat) / 150171761) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((70323376800 : Rat) / 150171761) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-4928338968 : Rat) / 8578069) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((22376914400 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-59739164000 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((1077899860510817030 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2877645925241275550 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (15, 2)],
  term ((2475568168 : Rat) / 25734207) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-1270014280 : Rat) / 25734207) [(2, 1), (3, 2), (15, 2)],
  term ((-85671739200 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((999486832 : Rat) / 8578069) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((26844633600 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1082749696 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((3732788800 : Rat) / 8833633) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-37933188800 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((179809086047911060 : Rat) / 75775513394677) [(2, 1), (4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1827248305345016060 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (14, 1), (15, 2)],
  term ((-40907807888 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((30599613104 : Rat) / 25734207) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-293403307200 : Rat) / 150171761) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(2, 1), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((170336244800 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-194423885600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((245664756800 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((8205126552651798260 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-9365432401538392970 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((11833714083794492660 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((29199272176 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((622779848 : Rat) / 25734207) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-22663748624 : Rat) / 25734207) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((50776682400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-23200029600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-31339635200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((2445921626985446130 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1117549462927150770 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1509635681072270240 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((5247346376 : Rat) / 8578069) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2420208264 : Rat) / 8578069) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((25617178496 : Rat) / 25734207) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((478967781600 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((20254428800 : Rat) / 8833633) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((5027135600 : Rat) / 8833633) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-886750480800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((108325641729958368 : Rat) / 75775513394677) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-134619452800 : Rat) / 150171761) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(2, 1), (11, 2), (14, 1)],
  term ((-15873657200 : Rat) / 150171761) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((-764636829538773515 : Rat) / 1288183727709509) [(2, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-12926066884 : Rat) / 25734207) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-2435289800 : Rat) / 8833633) [(2, 2), (3, 1), (11, 1)],
  term ((36071499200 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-47262687600 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((1737570393355754540 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2276651885990425995 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-234616666873732645 : Rat) / 151551026789354) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-5402702096 : Rat) / 25734207) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((2357367796 : Rat) / 8578069) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((3221449618 : Rat) / 25734207) [(2, 2), (3, 1), (15, 1)],
  term ((42835869600 : Rat) / 150171761) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 2), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-13422316800 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((-646555335906902160 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((541374848 : Rat) / 8578069) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((-1866394400 : Rat) / 8833633) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((18966594400 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-89904543023955530 : Rat) / 75775513394677) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((913624152672508030 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (15, 2)],
  term ((20453903944 : Rat) / 25734207) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-15299806552 : Rat) / 25734207) [(2, 2), (4, 1), (15, 2)],
  term ((146701653600 : Rat) / 150171761) [(2, 2), (5, 1), (10, 1), (11, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(2, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((97211942800 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((-85168122400 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((-154579692800 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((-4102563276325899130 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((4682716200769196485 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((-14599636088 : Rat) / 25734207) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-311389924 : Rat) / 25734207) [(2, 2), (5, 1), (15, 1)],
  term ((11600014800 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((-25388341200 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-124976936000 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-1222960813492723065 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((558774731463575385 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-2623673188 : Rat) / 8578069) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((1210104132 : Rat) / 8578069) [(2, 2), (7, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 2), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(2, 2), (10, 1), (15, 2)],
  term ((-239483890800 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-10127214400 : Rat) / 8833633) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2513567800 : Rat) / 8833633) [(2, 2), (11, 1), (13, 1)],
  term ((398621411600 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((186788054400 : Rat) / 150171761) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-54162820864979184 : Rat) / 75775513394677) [(2, 2), (11, 1), (15, 1)],
  term ((6773020800 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((-2155799721021634060 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 2), (11, 2), (14, 1), (15, 2)],
  term ((-4951136336 : Rat) / 25734207) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 2), (14, 1), (15, 2)],
  term ((15873657200 : Rat) / 150171761) [(2, 3), (5, 1), (11, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 3), (5, 1), (11, 2), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(2, 3), (5, 1), (15, 1)],
  term ((70323376800 : Rat) / 150171761) [(2, 3), (7, 1), (11, 1)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(2, 3), (7, 1), (11, 2), (15, 1)],
  term ((-4928338968 : Rat) / 8578069) [(2, 3), (7, 1), (15, 1)],
  term ((22376914400 : Rat) / 150171761) [(2, 3), (11, 1), (13, 1)],
  term ((-59739164000 : Rat) / 150171761) [(2, 3), (11, 1), (15, 1)],
  term ((1077899860510817030 : Rat) / 1288183727709509) [(2, 3), (11, 2), (13, 1), (15, 1)],
  term ((-2877645925241275550 : Rat) / 1288183727709509) [(2, 3), (11, 2), (15, 2)],
  term ((2475568168 : Rat) / 25734207) [(2, 3), (13, 1), (15, 1)],
  term ((-1270014280 : Rat) / 25734207) [(2, 3), (15, 2)],
  term ((-85671739200 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (11, 2), (15, 2)],
  term ((999486832 : Rat) / 8578069) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((26844633600 : Rat) / 150171761) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((1293110671813804320 : Rat) / 1288183727709509) [(3, 1), (4, 1), (7, 1), (11, 2), (15, 2)],
  term ((-1082749696 : Rat) / 8578069) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((3732788800 : Rat) / 8833633) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-37933188800 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((179809086047911060 : Rat) / 75775513394677) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1827248305345016060 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 3)],
  term ((-40907807888 : Rat) / 25734207) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((30599613104 : Rat) / 25734207) [(3, 1), (4, 1), (15, 3)],
  term ((-293403307200 : Rat) / 150171761) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(3, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1645801328 : Rat) / 8578069) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((170336244800 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((245664756800 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-194423885600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((8205126552651798260 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (12, 1), (15, 2)],
  term ((11833714083794492660 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2)],
  term ((-9365432401538392970 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((29199272176 : Rat) / 25734207) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-22663748624 : Rat) / 25734207) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((622779848 : Rat) / 25734207) [(3, 1), (5, 1), (15, 2)],
  term ((50776682400 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-31339635200 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-23200029600 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((2445921626985446130 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (12, 1), (15, 2)],
  term ((-1509635681072270240 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (14, 1), (15, 2)],
  term ((-1117549462927150770 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (15, 2)],
  term ((5247346376 : Rat) / 8578069) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((25617178496 : Rat) / 25734207) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-2420208264 : Rat) / 8578069) [(3, 1), (7, 1), (15, 2)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (15, 3)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (10, 1), (15, 3)],
  term ((478967781600 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((20254428800 : Rat) / 8833633) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-886750480800 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5027135600 : Rat) / 8833633) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-134619452800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((108325641729958368 : Rat) / 75775513394677) [(3, 1), (11, 1), (15, 2)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (11, 2), (15, 1)],
  term ((42835869600 : Rat) / 150171761) [(3, 2), (4, 1), (5, 1), (11, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(3, 2), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((-13422316800 : Rat) / 150171761) [(3, 2), (4, 1), (7, 1), (11, 1)],
  term ((-646555335906902160 : Rat) / 1288183727709509) [(3, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((541374848 : Rat) / 8578069) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((-1866394400 : Rat) / 8833633) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((50713908800 : Rat) / 150171761) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-89904543023955530 : Rat) / 75775513394677) [(3, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((2442897811750055060 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 2), (15, 2)],
  term ((20453903944 : Rat) / 25734207) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((10552327216 : Rat) / 25734207) [(3, 2), (4, 1), (15, 2)],
  term ((146701653600 : Rat) / 150171761) [(3, 2), (5, 1), (10, 1), (11, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(3, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((97211942800 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((-85168122400 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-122832378400 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((-4102563276325899130 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5916857041897246330 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((4682716200769196485 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-14599636088 : Rat) / 25734207) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((11331874312 : Rat) / 25734207) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-311389924 : Rat) / 25734207) [(3, 2), (5, 1), (15, 1)],
  term ((11600014800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((-25388341200 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((15669817600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-1222960813492723065 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((754817840536135120 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((558774731463575385 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-2623673188 : Rat) / 8578069) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-12808589248 : Rat) / 25734207) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((1210104132 : Rat) / 8578069) [(3, 2), (7, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 2), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(3, 2), (10, 1), (15, 2)],
  term ((-239483890800 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-244305643200 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2513567800 : Rat) / 8833633) [(3, 2), (11, 1), (13, 1)],
  term ((443375240400 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((161835101600 : Rat) / 150171761) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-12382652986186784 : Rat) / 75775513394677) [(3, 2), (11, 1), (15, 1)],
  term ((6773020800 : Rat) / 150171761) [(3, 2), (11, 2)],
  term ((-3475140786711509080 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((4553303771980851990 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 1), (15, 2)],
  term ((234616666873732645 : Rat) / 75775513394677) [(3, 2), (11, 2), (15, 2)],
  term ((10805404192 : Rat) / 25734207) [(3, 2), (12, 1), (15, 2)],
  term ((-4714735592 : Rat) / 8578069) [(3, 2), (14, 1), (15, 2)],
  term ((-6442899236 : Rat) / 25734207) [(3, 2), (15, 2)],
  term ((-15873657200 : Rat) / 150171761) [(3, 3), (4, 1), (11, 1)],
  term ((-764636829538773515 : Rat) / 1288183727709509) [(3, 3), (4, 1), (11, 2), (15, 1)],
  term ((-12926066884 : Rat) / 25734207) [(3, 3), (4, 1), (15, 1)],
  term ((-2435289800 : Rat) / 8833633) [(3, 3), (11, 1)],
  term ((36071499200 : Rat) / 150171761) [(3, 3), (11, 1), (12, 1)],
  term ((-47262687600 : Rat) / 150171761) [(3, 3), (11, 1), (14, 1)],
  term ((1737570393355754540 : Rat) / 1288183727709509) [(3, 3), (11, 2), (12, 1), (15, 1)],
  term ((-2276651885990425995 : Rat) / 1288183727709509) [(3, 3), (11, 2), (14, 1), (15, 1)],
  term ((-234616666873732645 : Rat) / 151551026789354) [(3, 3), (11, 2), (15, 1)],
  term ((-5402702096 : Rat) / 25734207) [(3, 3), (12, 1), (15, 1)],
  term ((2357367796 : Rat) / 8578069) [(3, 3), (14, 1), (15, 1)],
  term ((3221449618 : Rat) / 25734207) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 0 through 99. -/
theorem rs_R013_ueqv_R013YNNN_block_28_0000_0099_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_28_0000_0099
      rs_R013_ueqv_R013YNNN_block_28_0000_0099 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
