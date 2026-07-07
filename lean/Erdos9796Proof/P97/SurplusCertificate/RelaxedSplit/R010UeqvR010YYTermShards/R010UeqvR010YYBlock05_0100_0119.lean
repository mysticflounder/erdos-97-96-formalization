/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 5:100-119

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_05_0100_0119 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0100 : Poly :=
[
  term ((-16128 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0100 : Poly :=
[
  term ((32256 : Rat) / 25) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16128 : Rat) / 25) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16128 : Rat) / 25) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32256 : Rat) / 25) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((16128 : Rat) / 25) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((16128 : Rat) / 25) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0100_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0100
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0101 : Poly :=
[
  term ((-3584 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0101 : Poly :=
[
  term ((7168 : Rat) / 25) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0101_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0101
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0102 : Poly :=
[
  term ((11584 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0102 : Poly :=
[
  term ((-23168 : Rat) / 5) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((11584 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((11584 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((23168 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11584 : Rat) / 5) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11584 : Rat) / 5) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0102_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0102
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0103 : Poly :=
[
  term ((-896 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0103 : Poly :=
[
  term ((1792 : Rat) / 25) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1792 : Rat) / 25) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0103_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0103
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0104 : Poly :=
[
  term ((-39056 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0104 : Poly :=
[
  term ((78112 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39056 : Rat) / 25) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-39056 : Rat) / 25) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-78112 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((39056 : Rat) / 25) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((39056 : Rat) / 25) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0104_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0104
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0105 : Poly :=
[
  term ((-1792 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0105 : Poly :=
[
  term ((3584 : Rat) / 25) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0105_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0105
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0106 : Poly :=
[
  term ((6852 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0106 : Poly :=
[
  term ((-13704 : Rat) / 25) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6852 : Rat) / 25) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6852 : Rat) / 25) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((13704 : Rat) / 25) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6852 : Rat) / 25) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6852 : Rat) / 25) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0106_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0106
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0107 : Poly :=
[
  term (1 : Rat) [(10, 1), (16, 1)]
]

/-- Partial product 107 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0107 : Poly :=
[
  term (-2 : Rat) [(6, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(6, 2), (10, 1), (16, 1)],
  term (1 : Rat) [(7, 2), (10, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (14, 2), (16, 1)],
  term (-1 : Rat) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0107_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0107
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0108 : Poly :=
[
  term ((9336 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0108 : Poly :=
[
  term ((-18672 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9336 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9336 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18672 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9336 : Rat) / 5) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9336 : Rat) / 5) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0108_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0108
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0109 : Poly :=
[
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0109 : Poly :=
[
  term (-4 : Rat) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0109_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0109
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0110 : Poly :=
[
  term ((-11904 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0110 : Poly :=
[
  term ((23808 : Rat) / 25) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11904 : Rat) / 25) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11904 : Rat) / 25) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11904 : Rat) / 25) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-23808 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((11904 : Rat) / 25) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0110_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0110
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0111 : Poly :=
[
  term ((-34726 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0111 : Poly :=
[
  term ((69452 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34726 : Rat) / 25) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-34726 : Rat) / 25) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69452 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((34726 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((34726 : Rat) / 25) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0111_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0111
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0112 : Poly :=
[
  term ((-3584 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0112 : Poly :=
[
  term ((7168 : Rat) / 25) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0112_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0112
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0113 : Poly :=
[
  term ((-19484 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0113 : Poly :=
[
  term ((38968 : Rat) / 25) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19484 : Rat) / 25) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19484 : Rat) / 25) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19484 : Rat) / 25) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-38968 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((19484 : Rat) / 25) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0113_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0113
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0114 : Poly :=
[
  term ((-1238 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0114 : Poly :=
[
  term ((2476 : Rat) / 25) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1238 : Rat) / 25) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1238 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2476 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1238 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1238 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0114_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0114
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0115 : Poly :=
[
  term ((-2876 : Rat) / 5) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 115 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0115 : Poly :=
[
  term ((5752 : Rat) / 5) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2876 : Rat) / 5) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2876 : Rat) / 5) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5752 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2876 : Rat) / 5) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((2876 : Rat) / 5) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0115_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0115
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0116 : Poly :=
[
  term ((4102 : Rat) / 25) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0116 : Poly :=
[
  term ((-8204 : Rat) / 25) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((4102 : Rat) / 25) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((4102 : Rat) / 25) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4102 : Rat) / 25) [(14, 1), (15, 4), (16, 1)],
  term ((8204 : Rat) / 25) [(14, 2), (15, 2), (16, 1)],
  term ((-4102 : Rat) / 25) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0116_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0116
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0117 : Poly :=
[
  term (10 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 117 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0117 : Poly :=
[
  term (-20 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (10 : Rat) [(6, 2), (14, 1), (16, 1)],
  term (10 : Rat) [(7, 2), (14, 1), (16, 1)],
  term (-10 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (20 : Rat) [(14, 2), (16, 1)],
  term (-10 : Rat) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0117_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0117
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0118 : Poly :=
[
  term ((1372 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 118 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0118 : Poly :=
[
  term ((-2744 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term ((1372 : Rat) / 5) [(6, 2), (15, 2), (16, 1)],
  term ((1372 : Rat) / 5) [(7, 2), (15, 2), (16, 1)],
  term ((2744 : Rat) / 5) [(14, 1), (15, 2), (16, 1)],
  term ((-1372 : Rat) / 5) [(14, 2), (15, 2), (16, 1)],
  term ((-1372 : Rat) / 5) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0118_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0118
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YY_coefficient_05_0119 : Poly :=
[
  term (1 : Rat) [(16, 1)]
]

/-- Partial product 119 for generator 5. -/
def rs_R010_ueqv_R010YY_partial_05_0119 : Poly :=
[
  term (-2 : Rat) [(6, 1), (16, 1)],
  term (1 : Rat) [(6, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term (-1 : Rat) [(14, 2), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 5. -/
theorem rs_R010_ueqv_R010YY_partial_05_0119_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_05_0119
        rs_R010_ueqv_R010YY_generator_05_0100_0119 =
      rs_R010_ueqv_R010YY_partial_05_0119 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_05_0100_0119 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_05_0100,
  rs_R010_ueqv_R010YY_partial_05_0101,
  rs_R010_ueqv_R010YY_partial_05_0102,
  rs_R010_ueqv_R010YY_partial_05_0103,
  rs_R010_ueqv_R010YY_partial_05_0104,
  rs_R010_ueqv_R010YY_partial_05_0105,
  rs_R010_ueqv_R010YY_partial_05_0106,
  rs_R010_ueqv_R010YY_partial_05_0107,
  rs_R010_ueqv_R010YY_partial_05_0108,
  rs_R010_ueqv_R010YY_partial_05_0109,
  rs_R010_ueqv_R010YY_partial_05_0110,
  rs_R010_ueqv_R010YY_partial_05_0111,
  rs_R010_ueqv_R010YY_partial_05_0112,
  rs_R010_ueqv_R010YY_partial_05_0113,
  rs_R010_ueqv_R010YY_partial_05_0114,
  rs_R010_ueqv_R010YY_partial_05_0115,
  rs_R010_ueqv_R010YY_partial_05_0116,
  rs_R010_ueqv_R010YY_partial_05_0117,
  rs_R010_ueqv_R010YY_partial_05_0118,
  rs_R010_ueqv_R010YY_partial_05_0119
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_05_0100_0119 : Poly :=
[
  term ((32256 : Rat) / 25) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23168 : Rat) / 5) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((78112 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13704 : Rat) / 25) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (10, 1), (16, 1)],
  term ((-18672 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((23808 : Rat) / 25) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((69452 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((38968 : Rat) / 25) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2476 : Rat) / 25) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 5) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8204 : Rat) / 25) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term (-20 : Rat) [(6, 1), (14, 1), (16, 1)],
  term ((-2744 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(6, 1), (16, 1)],
  term ((-16128 : Rat) / 25) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11584 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 25) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39056 : Rat) / 25) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6852 : Rat) / 25) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(6, 2), (10, 1), (16, 1)],
  term ((9336 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11904 : Rat) / 25) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34726 : Rat) / 25) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19484 : Rat) / 25) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1238 : Rat) / 25) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2876 : Rat) / 5) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((4102 : Rat) / 25) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term (10 : Rat) [(6, 2), (14, 1), (16, 1)],
  term ((1372 : Rat) / 5) [(6, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(6, 2), (16, 1)],
  term ((-16128 : Rat) / 25) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11584 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 25) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39056 : Rat) / 25) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6852 : Rat) / 25) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 2), (10, 1), (16, 1)],
  term ((9336 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11904 : Rat) / 25) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34726 : Rat) / 25) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19484 : Rat) / 25) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1238 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2876 : Rat) / 5) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((4102 : Rat) / 25) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term (10 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((1372 : Rat) / 5) [(7, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (16, 1)],
  term ((-32256 : Rat) / 25) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((16128 : Rat) / 25) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((16128 : Rat) / 25) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-7168 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((23168 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11584 : Rat) / 5) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11584 : Rat) / 5) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-78112 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((37264 : Rat) / 25) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((39056 : Rat) / 25) [(9, 1), (15, 3), (16, 1)],
  term ((-3584 : Rat) / 25) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((13704 : Rat) / 25) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6852 : Rat) / 25) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6852 : Rat) / 25) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term (2 : Rat) [(10, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(10, 1), (14, 2), (16, 1)],
  term (-1 : Rat) [(10, 1), (15, 2), (16, 1)],
  term ((18672 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9336 : Rat) / 5) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9336 : Rat) / 5) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-69452 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11904 : Rat) / 25) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((10918 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((11904 : Rat) / 25) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((34726 : Rat) / 25) [(11, 1), (15, 3), (16, 1)],
  term ((-7168 : Rat) / 25) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2476 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9276 : Rat) / 25) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7546 : Rat) / 5) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((19484 : Rat) / 25) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((1238 : Rat) / 25) [(13, 1), (15, 3), (16, 1)],
  term ((2876 : Rat) / 5) [(13, 1), (15, 5), (16, 1)],
  term ((2694 : Rat) / 5) [(14, 1), (15, 2), (16, 1)],
  term ((-4102 : Rat) / 25) [(14, 1), (15, 4), (16, 1)],
  term (2 : Rat) [(14, 1), (16, 1)],
  term ((1344 : Rat) / 25) [(14, 2), (15, 2), (16, 1)],
  term (19 : Rat) [(14, 2), (16, 1)],
  term ((-4102 : Rat) / 25) [(14, 3), (15, 2), (16, 1)],
  term (-10 : Rat) [(14, 3), (16, 1)],
  term (-1 : Rat) [(15, 2), (16, 1)],
  term ((-1372 : Rat) / 5) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 100 through 119. -/
theorem rs_R010_ueqv_R010YY_block_05_0100_0119_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_05_0100_0119
      rs_R010_ueqv_R010YY_block_05_0100_0119 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
