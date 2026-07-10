/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 25:1500-1531

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_25_1500_1531 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1500 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1500 : Poly :=
[
  term ((-763840 : Rat) / 385571) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 1500 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1500 : Poly :=
[
  term ((1527680 : Rat) / 385571) [(0, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-763840 : Rat) / 385571) [(0, 2), (10, 2), (15, 2), (16, 1)],
  term ((1527680 : Rat) / 385571) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-763840 : Rat) / 385571) [(1, 2), (10, 2), (15, 2), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((763840 : Rat) / 385571) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1500 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1500_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1500
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1500 := by
  native_decide

/-- Coefficient term 1501 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1501 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1501 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1501 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1501 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1501_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1501
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1501 := by
  native_decide

/-- Coefficient term 1502 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1502 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1502 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1502 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1502 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1502_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1502
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1502 := by
  native_decide

/-- Coefficient term 1503 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1503 : Poly :=
[
  term ((307200 : Rat) / 52799) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1503 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1503 : Poly :=
[
  term ((-614400 : Rat) / 52799) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((307200 : Rat) / 52799) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-614400 : Rat) / 52799) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((307200 : Rat) / 52799) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-307200 : Rat) / 52799) [(11, 1), (12, 1), (15, 1)],
  term ((614400 : Rat) / 52799) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1503 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1503_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1503
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1503 := by
  native_decide

/-- Coefficient term 1504 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1504 : Poly :=
[
  term ((-29716128 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1504 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1504 : Poly :=
[
  term ((59432256 : Rat) / 385571) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-29716128 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((59432256 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29716128 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((29716128 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-59432256 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1504 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1504_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1504
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1504 := by
  native_decide

/-- Coefficient term 1505 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1505 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1505 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1505 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(0, 1), (11, 1), (12, 3), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 2), (15, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(11, 1), (12, 2), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1505 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1505_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1505
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1505 := by
  native_decide

/-- Coefficient term 1506 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1506 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1506 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1506 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(0, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1506 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1506_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1506
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1506 := by
  native_decide

/-- Coefficient term 1507 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1507 : Poly :=
[
  term ((-33008 : Rat) / 158397) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1507 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1507 : Poly :=
[
  term ((66016 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-33008 : Rat) / 158397) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((66016 : Rat) / 158397) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33008 : Rat) / 158397) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-66016 : Rat) / 158397) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((33008 : Rat) / 158397) [(11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1507 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1507_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1507
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1507 := by
  native_decide

/-- Coefficient term 1508 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1508 : Poly :=
[
  term ((15004040 : Rat) / 385571) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1508 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1508 : Poly :=
[
  term ((-30008080 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15004040 : Rat) / 385571) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30008080 : Rat) / 385571) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15004040 : Rat) / 385571) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((30008080 : Rat) / 385571) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15004040 : Rat) / 385571) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1508 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1508_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1508
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1508 := by
  native_decide

/-- Coefficient term 1509 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1509 : Poly :=
[
  term ((8396552 : Rat) / 158397) [(11, 1), (15, 1)]
]

/-- Partial product 1509 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1509 : Poly :=
[
  term ((-16793104 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((8396552 : Rat) / 158397) [(0, 2), (11, 1), (15, 1)],
  term ((-16793104 : Rat) / 158397) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((8396552 : Rat) / 158397) [(1, 2), (11, 1), (15, 1)],
  term ((16793104 : Rat) / 158397) [(11, 1), (12, 1), (15, 1)],
  term ((-8396552 : Rat) / 158397) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1509 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1509_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1509
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1509 := by
  native_decide

/-- Coefficient term 1510 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1510 : Poly :=
[
  term ((-9250448 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1510 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1510 : Poly :=
[
  term ((18500896 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9250448 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((18500896 : Rat) / 385571) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9250448 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18500896 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9250448 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1510 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1510_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1510
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1510 := by
  native_decide

/-- Coefficient term 1511 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1511 : Poly :=
[
  term ((12258358 : Rat) / 158397) [(12, 1)]
]

/-- Partial product 1511 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1511 : Poly :=
[
  term ((-24516716 : Rat) / 158397) [(0, 1), (12, 2)],
  term ((12258358 : Rat) / 158397) [(0, 2), (12, 1)],
  term ((-24516716 : Rat) / 158397) [(1, 1), (12, 1), (13, 1)],
  term ((12258358 : Rat) / 158397) [(1, 2), (12, 1)],
  term ((-12258358 : Rat) / 158397) [(12, 1)],
  term ((24516716 : Rat) / 158397) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1511 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1511_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1511
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1511 := by
  native_decide

/-- Coefficient term 1512 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1512 : Poly :=
[
  term ((678880 : Rat) / 52799) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1512 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1512 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1512 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1512_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1512
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1512 := by
  native_decide

/-- Coefficient term 1513 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1513 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1513 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1513 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1513 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1513_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1513
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1513 := by
  native_decide

/-- Coefficient term 1514 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1514 : Poly :=
[
  term ((-3381616 : Rat) / 158397) [(12, 1), (14, 1)]
]

/-- Partial product 1514 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1514 : Poly :=
[
  term ((6763232 : Rat) / 158397) [(0, 1), (12, 2), (14, 1)],
  term ((-3381616 : Rat) / 158397) [(0, 2), (12, 1), (14, 1)],
  term ((6763232 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3381616 : Rat) / 158397) [(1, 2), (12, 1), (14, 1)],
  term ((3381616 : Rat) / 158397) [(12, 1), (14, 1)],
  term ((-6763232 : Rat) / 158397) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1514 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1514_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1514
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1514 := by
  native_decide

/-- Coefficient term 1515 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1515 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1515 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1515 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(12, 1), (14, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1515 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1515_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1515
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1515 := by
  native_decide

/-- Coefficient term 1516 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1516 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1516 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1516 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1516 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1516_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1516
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1516 := by
  native_decide

/-- Coefficient term 1517 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1517 : Poly :=
[
  term ((2048000 : Rat) / 158397) [(12, 1), (15, 2)]
]

/-- Partial product 1517 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1517 : Poly :=
[
  term ((-4096000 : Rat) / 158397) [(0, 1), (12, 2), (15, 2)],
  term ((2048000 : Rat) / 158397) [(0, 2), (12, 1), (15, 2)],
  term ((-4096000 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((2048000 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((-2048000 : Rat) / 158397) [(12, 1), (15, 2)],
  term ((4096000 : Rat) / 158397) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1517 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1517_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1517
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1517 := by
  native_decide

/-- Coefficient term 1518 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1518 : Poly :=
[
  term ((25200832 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1518 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1518 : Poly :=
[
  term ((-50401664 : Rat) / 385571) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((25200832 : Rat) / 385571) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-50401664 : Rat) / 385571) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((25200832 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-25200832 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)],
  term ((50401664 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1518 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1518_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1518
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1518 := by
  native_decide

/-- Coefficient term 1519 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1519 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(12, 2), (15, 2)]
]

/-- Partial product 1519 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1519 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(0, 1), (12, 3), (15, 2)],
  term ((4014080 : Rat) / 158397) [(0, 2), (12, 2), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(1, 2), (12, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(12, 2), (15, 2)],
  term ((8028160 : Rat) / 158397) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1519 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1519_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1519
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1519 := by
  native_decide

/-- Coefficient term 1520 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1520 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1520 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1520 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(0, 1), (12, 3), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (12, 2), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (12, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1520 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1520_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1520
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1520 := by
  native_decide

/-- Coefficient term 1521 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1521 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1521 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1521 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1521 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1521_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1521
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1521 := by
  native_decide

/-- Coefficient term 1522 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1522 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1522 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1522 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1522 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1522_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1522
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1522 := by
  native_decide

/-- Coefficient term 1523 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1523 : Poly :=
[
  term ((-5418256 : Rat) / 158397) [(13, 1), (15, 1)]
]

/-- Partial product 1523 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1523 : Poly :=
[
  term ((10836512 : Rat) / 158397) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5418256 : Rat) / 158397) [(0, 2), (13, 1), (15, 1)],
  term ((10836512 : Rat) / 158397) [(1, 1), (13, 2), (15, 1)],
  term ((-5418256 : Rat) / 158397) [(1, 2), (13, 1), (15, 1)],
  term ((-10836512 : Rat) / 158397) [(12, 1), (13, 1), (15, 1)],
  term ((5418256 : Rat) / 158397) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1523 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1523_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1523
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1523 := by
  native_decide

/-- Coefficient term 1524 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1524 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1524 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1524 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1524 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1524_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1524
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1524 := by
  native_decide

/-- Coefficient term 1525 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1525 : Poly :=
[
  term ((678880 : Rat) / 52799) [(13, 2), (15, 2)]
]

/-- Partial product 1525 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1525 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((678880 : Rat) / 52799) [(0, 2), (13, 2), (15, 2)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (13, 3), (15, 2)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 2), (15, 2)],
  term ((1357760 : Rat) / 52799) [(12, 1), (13, 2), (15, 2)],
  term ((-678880 : Rat) / 52799) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1525 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1525_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1525
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1525 := by
  native_decide

/-- Coefficient term 1526 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1526 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1526 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1526 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((18332604 : Rat) / 385571) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1526 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1526_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1526
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1526 := by
  native_decide

/-- Coefficient term 1527 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1527 : Poly :=
[
  term ((-6446438 : Rat) / 158397) [(14, 1)]
]

/-- Partial product 1527 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1527 : Poly :=
[
  term ((12892876 : Rat) / 158397) [(0, 1), (12, 1), (14, 1)],
  term ((-6446438 : Rat) / 158397) [(0, 2), (14, 1)],
  term ((12892876 : Rat) / 158397) [(1, 1), (13, 1), (14, 1)],
  term ((-6446438 : Rat) / 158397) [(1, 2), (14, 1)],
  term ((-12892876 : Rat) / 158397) [(12, 1), (14, 1)],
  term ((6446438 : Rat) / 158397) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1527 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1527_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1527
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1527 := by
  native_decide

/-- Coefficient term 1528 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1528 : Poly :=
[
  term ((-3051520 : Rat) / 158397) [(14, 1), (15, 2)]
]

/-- Partial product 1528 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1528 : Poly :=
[
  term ((6103040 : Rat) / 158397) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3051520 : Rat) / 158397) [(0, 2), (14, 1), (15, 2)],
  term ((6103040 : Rat) / 158397) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3051520 : Rat) / 158397) [(1, 2), (14, 1), (15, 2)],
  term ((-6103040 : Rat) / 158397) [(12, 1), (14, 1), (15, 2)],
  term ((3051520 : Rat) / 158397) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1528 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1528_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1528
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1528 := by
  native_decide

/-- Coefficient term 1529 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1529 : Poly :=
[
  term ((-20214272 : Rat) / 385571) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1529 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1529 : Poly :=
[
  term ((40428544 : Rat) / 385571) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20214272 : Rat) / 385571) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((40428544 : Rat) / 385571) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20214272 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-40428544 : Rat) / 385571) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((20214272 : Rat) / 385571) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1529 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1529_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1529
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1529 := by
  native_decide

/-- Coefficient term 1530 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1530 : Poly :=
[
  term ((-4601456 : Rat) / 158397) [(15, 2)]
]

/-- Partial product 1530 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1530 : Poly :=
[
  term ((9202912 : Rat) / 158397) [(0, 1), (12, 1), (15, 2)],
  term ((-4601456 : Rat) / 158397) [(0, 2), (15, 2)],
  term ((9202912 : Rat) / 158397) [(1, 1), (13, 1), (15, 2)],
  term ((-4601456 : Rat) / 158397) [(1, 2), (15, 2)],
  term ((-9202912 : Rat) / 158397) [(12, 1), (15, 2)],
  term ((4601456 : Rat) / 158397) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1530 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1530_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1530
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1530 := by
  native_decide

/-- Coefficient term 1531 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_1531 : Poly :=
[
  term ((6807860 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 1531 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_1531 : Poly :=
[
  term ((-13615720 : Rat) / 385571) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((6807860 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((-13615720 : Rat) / 385571) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((6807860 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((13615720 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)],
  term ((-6807860 : Rat) / 385571) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1531 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_1531_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_1531
        rs_R005_ueqv_R005NYN_generator_25_1500_1531 =
      rs_R005_ueqv_R005NYN_partial_25_1531 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_25_1500_1531 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_25_1500,
  rs_R005_ueqv_R005NYN_partial_25_1501,
  rs_R005_ueqv_R005NYN_partial_25_1502,
  rs_R005_ueqv_R005NYN_partial_25_1503,
  rs_R005_ueqv_R005NYN_partial_25_1504,
  rs_R005_ueqv_R005NYN_partial_25_1505,
  rs_R005_ueqv_R005NYN_partial_25_1506,
  rs_R005_ueqv_R005NYN_partial_25_1507,
  rs_R005_ueqv_R005NYN_partial_25_1508,
  rs_R005_ueqv_R005NYN_partial_25_1509,
  rs_R005_ueqv_R005NYN_partial_25_1510,
  rs_R005_ueqv_R005NYN_partial_25_1511,
  rs_R005_ueqv_R005NYN_partial_25_1512,
  rs_R005_ueqv_R005NYN_partial_25_1513,
  rs_R005_ueqv_R005NYN_partial_25_1514,
  rs_R005_ueqv_R005NYN_partial_25_1515,
  rs_R005_ueqv_R005NYN_partial_25_1516,
  rs_R005_ueqv_R005NYN_partial_25_1517,
  rs_R005_ueqv_R005NYN_partial_25_1518,
  rs_R005_ueqv_R005NYN_partial_25_1519,
  rs_R005_ueqv_R005NYN_partial_25_1520,
  rs_R005_ueqv_R005NYN_partial_25_1521,
  rs_R005_ueqv_R005NYN_partial_25_1522,
  rs_R005_ueqv_R005NYN_partial_25_1523,
  rs_R005_ueqv_R005NYN_partial_25_1524,
  rs_R005_ueqv_R005NYN_partial_25_1525,
  rs_R005_ueqv_R005NYN_partial_25_1526,
  rs_R005_ueqv_R005NYN_partial_25_1527,
  rs_R005_ueqv_R005NYN_partial_25_1528,
  rs_R005_ueqv_R005NYN_partial_25_1529,
  rs_R005_ueqv_R005NYN_partial_25_1530,
  rs_R005_ueqv_R005NYN_partial_25_1531
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_25_1500_1531 : Poly :=
[
  term ((1527680 : Rat) / 385571) [(0, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((66016 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-30008080 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16793104 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((18500896 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-614400 : Rat) / 52799) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((59432256 : Rat) / 385571) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(0, 1), (11, 1), (12, 3), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(0, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10836512 : Rat) / 158397) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((12892876 : Rat) / 158397) [(0, 1), (12, 1), (14, 1)],
  term ((6103040 : Rat) / 158397) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((40428544 : Rat) / 385571) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9202912 : Rat) / 158397) [(0, 1), (12, 1), (15, 2)],
  term ((-13615720 : Rat) / 385571) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24516716 : Rat) / 158397) [(0, 1), (12, 2)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6763232 : Rat) / 158397) [(0, 1), (12, 2), (14, 1)],
  term ((8028160 : Rat) / 158397) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4096000 : Rat) / 158397) [(0, 1), (12, 2), (15, 2)],
  term ((-50401664 : Rat) / 385571) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(0, 1), (12, 3), (15, 2)],
  term ((39892480 : Rat) / 385571) [(0, 1), (12, 3), (15, 2), (16, 1)],
  term ((-763840 : Rat) / 385571) [(0, 2), (10, 2), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((307200 : Rat) / 52799) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-29716128 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33008 : Rat) / 158397) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((15004040 : Rat) / 385571) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8396552 : Rat) / 158397) [(0, 2), (11, 1), (15, 1)],
  term ((-9250448 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((12258358 : Rat) / 158397) [(0, 2), (12, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3381616 : Rat) / 158397) [(0, 2), (12, 1), (14, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2048000 : Rat) / 158397) [(0, 2), (12, 1), (15, 2)],
  term ((25200832 : Rat) / 385571) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 2), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (12, 2), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5418256 : Rat) / 158397) [(0, 2), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (13, 2), (15, 2)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-6446438 : Rat) / 158397) [(0, 2), (14, 1)],
  term ((-3051520 : Rat) / 158397) [(0, 2), (14, 1), (15, 2)],
  term ((-20214272 : Rat) / 385571) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4601456 : Rat) / 158397) [(0, 2), (15, 2)],
  term ((6807860 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((1527680 : Rat) / 385571) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-614400 : Rat) / 52799) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((59432256 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((66016 : Rat) / 158397) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-30008080 : Rat) / 385571) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16793104 : Rat) / 158397) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((18500896 : Rat) / 385571) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24516716 : Rat) / 158397) [(1, 1), (12, 1), (13, 1)],
  term ((6763232 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((8028160 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4096000 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-50401664 : Rat) / 385571) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((12892876 : Rat) / 158397) [(1, 1), (13, 1), (14, 1)],
  term ((6103040 : Rat) / 158397) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((40428544 : Rat) / 385571) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9202912 : Rat) / 158397) [(1, 1), (13, 1), (15, 2)],
  term ((-13615720 : Rat) / 385571) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((10836512 : Rat) / 158397) [(1, 1), (13, 2), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (13, 3), (15, 2)],
  term ((36665208 : Rat) / 385571) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((-763840 : Rat) / 385571) [(1, 2), (10, 2), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((307200 : Rat) / 52799) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-29716128 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33008 : Rat) / 158397) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((15004040 : Rat) / 385571) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8396552 : Rat) / 158397) [(1, 2), (11, 1), (15, 1)],
  term ((-9250448 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((12258358 : Rat) / 158397) [(1, 2), (12, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3381616 : Rat) / 158397) [(1, 2), (12, 1), (14, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2048000 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((25200832 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 2), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (12, 2), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5418256 : Rat) / 158397) [(1, 2), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 2), (15, 2)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-6446438 : Rat) / 158397) [(1, 2), (14, 1)],
  term ((-3051520 : Rat) / 158397) [(1, 2), (14, 1), (15, 2)],
  term ((-20214272 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4601456 : Rat) / 158397) [(1, 2), (15, 2)],
  term ((6807860 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((763840 : Rat) / 385571) [(10, 2), (15, 2), (16, 1)],
  term ((-10428896 : Rat) / 158397) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((72192080 : Rat) / 385571) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15871504 : Rat) / 158397) [(11, 1), (12, 1), (15, 1)],
  term ((11215232 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((12206080 : Rat) / 158397) [(11, 1), (12, 2), (15, 1)],
  term ((-101616256 : Rat) / 385571) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(11, 1), (12, 3), (15, 1)],
  term ((84368000 : Rat) / 385571) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((33008 : Rat) / 158397) [(11, 1), (14, 1), (15, 1)],
  term ((-15004040 : Rat) / 385571) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8396552 : Rat) / 158397) [(11, 1), (15, 1)],
  term ((9250448 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)],
  term ((-12258358 : Rat) / 158397) [(12, 1)],
  term ((-2036640 : Rat) / 52799) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10836512 : Rat) / 158397) [(12, 1), (13, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(12, 1), (13, 2), (15, 2)],
  term ((-36665208 : Rat) / 385571) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3170420 : Rat) / 52799) [(12, 1), (14, 1)],
  term ((-696320 : Rat) / 52799) [(12, 1), (14, 1), (15, 2)],
  term ((-60374784 : Rat) / 385571) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3750304 : Rat) / 52799) [(12, 1), (15, 2)],
  term ((-11585112 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)],
  term ((24516716 : Rat) / 158397) [(12, 2)],
  term ((1357760 : Rat) / 52799) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6763232 : Rat) / 158397) [(12, 2), (14, 1)],
  term ((-8028160 : Rat) / 158397) [(12, 2), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((81920 : Rat) / 158397) [(12, 2), (15, 2)],
  term ((70347904 : Rat) / 385571) [(12, 2), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(12, 3), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(12, 3), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5418256 : Rat) / 158397) [(13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(13, 2), (15, 2)],
  term ((18332604 : Rat) / 385571) [(13, 2), (15, 2), (16, 1)],
  term ((6446438 : Rat) / 158397) [(14, 1)],
  term ((3051520 : Rat) / 158397) [(14, 1), (15, 2)],
  term ((20214272 : Rat) / 385571) [(14, 1), (15, 2), (16, 1)],
  term ((4601456 : Rat) / 158397) [(15, 2)],
  term ((-6807860 : Rat) / 385571) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1500 through 1531. -/
theorem rs_R005_ueqv_R005NYN_block_25_1500_1531_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_25_1500_1531
      rs_R005_ueqv_R005NYN_block_25_1500_1531 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
