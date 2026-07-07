/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 28:100-112

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_28_0100_0112 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0100 : Poly :=
[
  term ((11535980693026547835 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 100 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0100 : Poly :=
[
  term ((23071961386053095670 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11535980693026547835 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((23071961386053095670 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-11535980693026547835 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0100_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0100
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0101 : Poly :=
[
  term ((487829679909895780 : Rat) / 75775513394677) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 101 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0101 : Poly :=
[
  term ((975659359819791560 : Rat) / 75775513394677) [(2, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-487829679909895780 : Rat) / 75775513394677) [(2, 2), (11, 2), (12, 1), (15, 2)],
  term ((975659359819791560 : Rat) / 75775513394677) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((-487829679909895780 : Rat) / 75775513394677) [(3, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0101_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0101
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0102 : Poly :=
[
  term ((-21357462482902020105 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 102 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0102 : Poly :=
[
  term ((-42714924965804040210 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((21357462482902020105 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-42714924965804040210 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((21357462482902020105 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0102_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0102
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0103 : Poly :=
[
  term ((242157996636433595 : Rat) / 151551026789354) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 103 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0103 : Poly :=
[
  term ((242157996636433595 : Rat) / 75775513394677) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-242157996636433595 : Rat) / 151551026789354) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((242157996636433595 : Rat) / 75775513394677) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-242157996636433595 : Rat) / 151551026789354) [(3, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0103_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0103
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0104 : Poly :=
[
  term ((-3242321233421765180 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 104 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0104 : Poly :=
[
  term ((-6484642466843530360 : Rat) / 1288183727709509) [(2, 1), (11, 2), (14, 2), (15, 2)],
  term ((3242321233421765180 : Rat) / 1288183727709509) [(2, 2), (11, 2), (14, 1), (15, 2)],
  term ((-6484642466843530360 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 3)],
  term ((3242321233421765180 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0104_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0104
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0105 : Poly :=
[
  term ((282801889248594150 : Rat) / 75775513394677) [(11, 2), (15, 2)]
]

/-- Partial product 105 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0105 : Poly :=
[
  term ((565603778497188300 : Rat) / 75775513394677) [(2, 1), (11, 2), (14, 1), (15, 2)],
  term ((-282801889248594150 : Rat) / 75775513394677) [(2, 2), (11, 2), (15, 2)],
  term ((565603778497188300 : Rat) / 75775513394677) [(3, 1), (11, 2), (15, 3)],
  term ((-282801889248594150 : Rat) / 75775513394677) [(3, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0105_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0105
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0106 : Poly :=
[
  term ((-326257590526281960 : Rat) / 1288183727709509) [(11, 3), (15, 1)]
]

/-- Partial product 106 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0106 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(2, 1), (11, 3), (14, 1), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (11, 3), (15, 2)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0106_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0106
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0107 : Poly :=
[
  term ((51120367852 : Rat) / 8578069) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 107 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0107 : Poly :=
[
  term ((102240735704 : Rat) / 8578069) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-51120367852 : Rat) / 8578069) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((102240735704 : Rat) / 8578069) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-51120367852 : Rat) / 8578069) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0107_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0107
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0108 : Poly :=
[
  term ((94391079376 : Rat) / 25734207) [(12, 1), (15, 2)]
]

/-- Partial product 108 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0108 : Poly :=
[
  term ((188782158752 : Rat) / 25734207) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-94391079376 : Rat) / 25734207) [(2, 2), (12, 1), (15, 2)],
  term ((188782158752 : Rat) / 25734207) [(3, 1), (12, 1), (15, 3)],
  term ((-94391079376 : Rat) / 25734207) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0108_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0108
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0109 : Poly :=
[
  term ((-75766092996 : Rat) / 8578069) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 109 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0109 : Poly :=
[
  term ((-151532185992 : Rat) / 8578069) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((75766092996 : Rat) / 8578069) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-151532185992 : Rat) / 8578069) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((75766092996 : Rat) / 8578069) [(3, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0109_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0109
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0110 : Poly :=
[
  term ((3315755842 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 110 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0110 : Poly :=
[
  term ((6631511684 : Rat) / 25734207) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3315755842 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((6631511684 : Rat) / 25734207) [(3, 1), (13, 1), (15, 2)],
  term ((-3315755842 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0110_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0110
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0111 : Poly :=
[
  term ((-4932916048 : Rat) / 25734207) [(14, 1), (15, 2)]
]

/-- Partial product 111 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0111 : Poly :=
[
  term ((-9865832096 : Rat) / 25734207) [(2, 1), (14, 2), (15, 2)],
  term ((4932916048 : Rat) / 25734207) [(2, 2), (14, 1), (15, 2)],
  term ((-9865832096 : Rat) / 25734207) [(3, 1), (14, 1), (15, 3)],
  term ((4932916048 : Rat) / 25734207) [(3, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0111_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0111
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 28. -/
def rs_R013_ueqv_R013YNNN_coefficient_28_0112 : Poly :=
[
  term ((-3572719560 : Rat) / 8578069) [(15, 2)]
]

/-- Partial product 112 for generator 28. -/
def rs_R013_ueqv_R013YNNN_partial_28_0112 : Poly :=
[
  term ((-7145439120 : Rat) / 8578069) [(2, 1), (14, 1), (15, 2)],
  term ((3572719560 : Rat) / 8578069) [(2, 2), (15, 2)],
  term ((-7145439120 : Rat) / 8578069) [(3, 1), (15, 3)],
  term ((3572719560 : Rat) / 8578069) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 28. -/
theorem rs_R013_ueqv_R013YNNN_partial_28_0112_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_28_0112
        rs_R013_ueqv_R013YNNN_generator_28_0100_0112 =
      rs_R013_ueqv_R013YNNN_partial_28_0112 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_28_0100_0112 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_28_0100,
  rs_R013_ueqv_R013YNNN_partial_28_0101,
  rs_R013_ueqv_R013YNNN_partial_28_0102,
  rs_R013_ueqv_R013YNNN_partial_28_0103,
  rs_R013_ueqv_R013YNNN_partial_28_0104,
  rs_R013_ueqv_R013YNNN_partial_28_0105,
  rs_R013_ueqv_R013YNNN_partial_28_0106,
  rs_R013_ueqv_R013YNNN_partial_28_0107,
  rs_R013_ueqv_R013YNNN_partial_28_0108,
  rs_R013_ueqv_R013YNNN_partial_28_0109,
  rs_R013_ueqv_R013YNNN_partial_28_0110,
  rs_R013_ueqv_R013YNNN_partial_28_0111,
  rs_R013_ueqv_R013YNNN_partial_28_0112
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_28_0100_0112 : Poly :=
[
  term ((23071961386053095670 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((975659359819791560 : Rat) / 75775513394677) [(2, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((242157996636433595 : Rat) / 75775513394677) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-42714924965804040210 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((565603778497188300 : Rat) / 75775513394677) [(2, 1), (11, 2), (14, 1), (15, 2)],
  term ((-6484642466843530360 : Rat) / 1288183727709509) [(2, 1), (11, 2), (14, 2), (15, 2)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(2, 1), (11, 3), (14, 1), (15, 1)],
  term ((102240735704 : Rat) / 8578069) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((188782158752 : Rat) / 25734207) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((6631511684 : Rat) / 25734207) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-151532185992 : Rat) / 8578069) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-7145439120 : Rat) / 8578069) [(2, 1), (14, 1), (15, 2)],
  term ((-9865832096 : Rat) / 25734207) [(2, 1), (14, 2), (15, 2)],
  term ((-11535980693026547835 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-487829679909895780 : Rat) / 75775513394677) [(2, 2), (11, 2), (12, 1), (15, 2)],
  term ((21357462482902020105 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-242157996636433595 : Rat) / 151551026789354) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((3242321233421765180 : Rat) / 1288183727709509) [(2, 2), (11, 2), (14, 1), (15, 2)],
  term ((-282801889248594150 : Rat) / 75775513394677) [(2, 2), (11, 2), (15, 2)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((-51120367852 : Rat) / 8578069) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-94391079376 : Rat) / 25734207) [(2, 2), (12, 1), (15, 2)],
  term ((75766092996 : Rat) / 8578069) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3315755842 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((4932916048 : Rat) / 25734207) [(2, 2), (14, 1), (15, 2)],
  term ((3572719560 : Rat) / 8578069) [(2, 2), (15, 2)],
  term ((23071961386053095670 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((975659359819791560 : Rat) / 75775513394677) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((-42714924965804040210 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((242157996636433595 : Rat) / 75775513394677) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-6484642466843530360 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 3)],
  term ((565603778497188300 : Rat) / 75775513394677) [(3, 1), (11, 2), (15, 3)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (11, 3), (15, 2)],
  term ((102240735704 : Rat) / 8578069) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((188782158752 : Rat) / 25734207) [(3, 1), (12, 1), (15, 3)],
  term ((-151532185992 : Rat) / 8578069) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((6631511684 : Rat) / 25734207) [(3, 1), (13, 1), (15, 2)],
  term ((-9865832096 : Rat) / 25734207) [(3, 1), (14, 1), (15, 3)],
  term ((-7145439120 : Rat) / 8578069) [(3, 1), (15, 3)],
  term ((-11535980693026547835 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-487829679909895780 : Rat) / 75775513394677) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((21357462482902020105 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-242157996636433595 : Rat) / 151551026789354) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((3242321233421765180 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 1), (15, 2)],
  term ((-282801889248594150 : Rat) / 75775513394677) [(3, 2), (11, 2), (15, 2)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)],
  term ((-51120367852 : Rat) / 8578069) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-94391079376 : Rat) / 25734207) [(3, 2), (12, 1), (15, 2)],
  term ((75766092996 : Rat) / 8578069) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3315755842 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)],
  term ((4932916048 : Rat) / 25734207) [(3, 2), (14, 1), (15, 2)],
  term ((3572719560 : Rat) / 8578069) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 100 through 112. -/
theorem rs_R013_ueqv_R013YNNN_block_28_0100_0112_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_28_0100_0112
      rs_R013_ueqv_R013YNNN_block_28_0100_0112 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
