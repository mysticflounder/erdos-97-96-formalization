/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 20:100-103

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_20_0100_0103 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 20. -/
def rs_R013_ueqv_R013YNNN_coefficient_20_0100 : Poly :=
[
  term ((213403871003499995 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 100 for generator 20. -/
def rs_R013_ueqv_R013YNNN_partial_20_0100 : Poly :=
[
  term ((213403871003499995 : Rat) / 1288183727709509) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-213403871003499995 : Rat) / 2576367455419018) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((213403871003499995 : Rat) / 1288183727709509) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-213403871003499995 : Rat) / 2576367455419018) [(7, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 20. -/
theorem rs_R013_ueqv_R013YNNN_partial_20_0100_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_20_0100
        rs_R013_ueqv_R013YNNN_generator_20_0100_0103 =
      rs_R013_ueqv_R013YNNN_partial_20_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 20. -/
def rs_R013_ueqv_R013YNNN_coefficient_20_0101 : Poly :=
[
  term ((158442107084699200 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 101 for generator 20. -/
def rs_R013_ueqv_R013YNNN_partial_20_0101 : Poly :=
[
  term ((316884214169398400 : Rat) / 1288183727709509) [(6, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(6, 2), (11, 3), (12, 1), (15, 1)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(7, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(7, 2), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 20. -/
theorem rs_R013_ueqv_R013YNNN_partial_20_0101_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_20_0101
        rs_R013_ueqv_R013YNNN_generator_20_0100_0103 =
      rs_R013_ueqv_R013YNNN_partial_20_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 20. -/
def rs_R013_ueqv_R013YNNN_coefficient_20_0102 : Poly :=
[
  term ((-1301648958473165417 : Rat) / 1288183727709509) [(11, 3), (15, 1)]
]

/-- Partial product 102 for generator 20. -/
def rs_R013_ueqv_R013YNNN_partial_20_0102 : Poly :=
[
  term ((-2603297916946330834 : Rat) / 1288183727709509) [(6, 1), (8, 1), (11, 3), (15, 1)],
  term ((1301648958473165417 : Rat) / 1288183727709509) [(6, 2), (11, 3), (15, 1)],
  term ((-2603297916946330834 : Rat) / 1288183727709509) [(7, 1), (9, 1), (11, 3), (15, 1)],
  term ((1301648958473165417 : Rat) / 1288183727709509) [(7, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 20. -/
theorem rs_R013_ueqv_R013YNNN_partial_20_0102_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_20_0102
        rs_R013_ueqv_R013YNNN_generator_20_0100_0103 =
      rs_R013_ueqv_R013YNNN_partial_20_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 20. -/
def rs_R013_ueqv_R013YNNN_coefficient_20_0103 : Poly :=
[
  term ((3196153826 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 103 for generator 20. -/
def rs_R013_ueqv_R013YNNN_partial_20_0103 : Poly :=
[
  term ((6392307652 : Rat) / 25734207) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-3196153826 : Rat) / 25734207) [(6, 2), (13, 1), (15, 1)],
  term ((6392307652 : Rat) / 25734207) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3196153826 : Rat) / 25734207) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 20. -/
theorem rs_R013_ueqv_R013YNNN_partial_20_0103_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_20_0103
        rs_R013_ueqv_R013YNNN_generator_20_0100_0103 =
      rs_R013_ueqv_R013YNNN_partial_20_0103 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_20_0100_0103 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_20_0100,
  rs_R013_ueqv_R013YNNN_partial_20_0101,
  rs_R013_ueqv_R013YNNN_partial_20_0102,
  rs_R013_ueqv_R013YNNN_partial_20_0103
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_20_0100_0103 : Poly :=
[
  term ((213403871003499995 : Rat) / 1288183727709509) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(6, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-2603297916946330834 : Rat) / 1288183727709509) [(6, 1), (8, 1), (11, 3), (15, 1)],
  term ((6392307652 : Rat) / 25734207) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-213403871003499995 : Rat) / 2576367455419018) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(6, 2), (11, 3), (12, 1), (15, 1)],
  term ((1301648958473165417 : Rat) / 1288183727709509) [(6, 2), (11, 3), (15, 1)],
  term ((-3196153826 : Rat) / 25734207) [(6, 2), (13, 1), (15, 1)],
  term ((213403871003499995 : Rat) / 1288183727709509) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(7, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-2603297916946330834 : Rat) / 1288183727709509) [(7, 1), (9, 1), (11, 3), (15, 1)],
  term ((6392307652 : Rat) / 25734207) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-213403871003499995 : Rat) / 2576367455419018) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(7, 2), (11, 3), (12, 1), (15, 1)],
  term ((1301648958473165417 : Rat) / 1288183727709509) [(7, 2), (11, 3), (15, 1)],
  term ((-3196153826 : Rat) / 25734207) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 100 through 103. -/
theorem rs_R013_ueqv_R013YNNN_block_20_0100_0103_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_20_0100_0103
      rs_R013_ueqv_R013YNNN_block_20_0100_0103 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
