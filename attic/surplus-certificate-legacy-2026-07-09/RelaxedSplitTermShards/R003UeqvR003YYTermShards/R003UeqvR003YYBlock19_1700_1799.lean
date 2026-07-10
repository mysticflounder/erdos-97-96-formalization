/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:1700-1799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_1700_1799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1700 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1700 : Poly :=
[
  term ((-24 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1700 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1700 : Poly :=
[
  term ((-48 : Rat) / 35) [(3, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1700 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1700_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1700
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1700 := by
  native_decide

/-- Coefficient term 1701 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1701 : Poly :=
[
  term ((-48 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1701 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1701 : Poly :=
[
  term ((-96 : Rat) / 35) [(3, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((48 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1701 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1701_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1701
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1701 := by
  native_decide

/-- Coefficient term 1702 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1702 : Poly :=
[
  term ((2256 : Rat) / 35) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 1702 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1702 : Poly :=
[
  term ((4512 : Rat) / 35) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-2256 : Rat) / 35) [(3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1702 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1702_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1702
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1702 := by
  native_decide

/-- Coefficient term 1703 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1703 : Poly :=
[
  term ((64 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1703 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1703 : Poly :=
[
  term ((128 : Rat) / 35) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-64 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1703 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1703_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1703
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1703 := by
  native_decide

/-- Coefficient term 1704 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1704 : Poly :=
[
  term ((-264 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1704 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1704 : Poly :=
[
  term ((-528 : Rat) / 35) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((264 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1704 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1704_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1704
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1704 := by
  native_decide

/-- Coefficient term 1705 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1705 : Poly :=
[
  term ((-542 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1705 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1705 : Poly :=
[
  term ((-1084 : Rat) / 35) [(3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((542 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1705 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1705_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1705
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1705 := by
  native_decide

/-- Coefficient term 1706 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1706 : Poly :=
[
  term (-27 : Rat) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 1706 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1706 : Poly :=
[
  term (-54 : Rat) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term (27 : Rat) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1706 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1706_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1706
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1706 := by
  native_decide

/-- Coefficient term 1707 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1707 : Poly :=
[
  term (3 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1707 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1707 : Poly :=
[
  term (6 : Rat) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1707 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1707_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1707
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1707 := by
  native_decide

/-- Coefficient term 1708 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1708 : Poly :=
[
  term ((513 : Rat) / 10) [(3, 1), (12, 2), (15, 1)]
]

/-- Partial product 1708 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1708 : Poly :=
[
  term ((513 : Rat) / 5) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((-513 : Rat) / 10) [(3, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1708 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1708_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1708
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1708 := by
  native_decide

/-- Coefficient term 1709 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1709 : Poly :=
[
  term ((-81 : Rat) / 10) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1709 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1709 : Poly :=
[
  term ((-81 : Rat) / 5) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((81 : Rat) / 10) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1709 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1709_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1709
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1709 := by
  native_decide

/-- Coefficient term 1710 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1710 : Poly :=
[
  term ((834 : Rat) / 35) [(3, 1), (13, 1)]
]

/-- Partial product 1710 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1710 : Poly :=
[
  term ((1668 : Rat) / 35) [(3, 1), (8, 1), (13, 1)],
  term ((-834 : Rat) / 35) [(3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1710 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1710_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1710
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1710 := by
  native_decide

/-- Coefficient term 1711 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1711 : Poly :=
[
  term ((-626 : Rat) / 35) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 1711 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1711 : Poly :=
[
  term ((-1252 : Rat) / 35) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((626 : Rat) / 35) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1711 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1711_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1711
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1711 := by
  native_decide

/-- Coefficient term 1712 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1712 : Poly :=
[
  term ((-6 : Rat) / 35) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1712 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1712 : Poly :=
[
  term ((-12 : Rat) / 35) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((6 : Rat) / 35) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1712 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1712_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1712
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1712 := by
  native_decide

/-- Coefficient term 1713 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1713 : Poly :=
[
  term ((-22 : Rat) / 7) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 1713 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1713 : Poly :=
[
  term ((-44 : Rat) / 7) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((22 : Rat) / 7) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1713 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1713_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1713
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1713 := by
  native_decide

/-- Coefficient term 1714 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1714 : Poly :=
[
  term ((513 : Rat) / 10) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 1714 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1714 : Poly :=
[
  term ((513 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((-513 : Rat) / 10) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1714 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1714_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1714
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1714 := by
  native_decide

/-- Coefficient term 1715 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1715 : Poly :=
[
  term ((-81 : Rat) / 10) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1715 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1715 : Poly :=
[
  term ((-81 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((81 : Rat) / 10) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1715 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1715_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1715
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1715 := by
  native_decide

/-- Coefficient term 1716 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1716 : Poly :=
[
  term ((162 : Rat) / 5) [(3, 1), (15, 1)]
]

/-- Partial product 1716 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1716 : Poly :=
[
  term ((324 : Rat) / 5) [(3, 1), (8, 1), (15, 1)],
  term ((-162 : Rat) / 5) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1716 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1716_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1716
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1716 := by
  native_decide

/-- Coefficient term 1717 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1717 : Poly :=
[
  term ((-18 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1717 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1717 : Poly :=
[
  term ((-36 : Rat) / 5) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1717 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1717_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1717
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1717 := by
  native_decide

/-- Coefficient term 1718 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1718 : Poly :=
[
  term ((-864 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 1718 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1718 : Poly :=
[
  term ((-1728 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1718 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1718_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1718
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1718 := by
  native_decide

/-- Coefficient term 1719 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1719 : Poly :=
[
  term ((-432 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 1719 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1719 : Poly :=
[
  term ((-864 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((432 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1719 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1719_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1719
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1719 := by
  native_decide

/-- Coefficient term 1720 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1720 : Poly :=
[
  term ((144 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1720 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1720 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1720 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1720_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1720
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1720 := by
  native_decide

/-- Coefficient term 1721 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1721 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 1721 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1721 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1721 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1721_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1721
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1721 := by
  native_decide

/-- Coefficient term 1722 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1722 : Poly :=
[
  term ((-54 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 1722 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1722 : Poly :=
[
  term ((-108 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((54 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1722 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1722_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1722
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1722 := by
  native_decide

/-- Coefficient term 1723 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1723 : Poly :=
[
  term ((6 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1723 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1723 : Poly :=
[
  term ((12 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1723 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1723_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1723
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1723 := by
  native_decide

/-- Coefficient term 1724 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1724 : Poly :=
[
  term ((-2592 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 1724 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1724 : Poly :=
[
  term ((-5184 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((2592 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1724 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1724_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1724
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1724 := by
  native_decide

/-- Coefficient term 1725 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1725 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1725 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1725 : Poly :=
[
  term ((3456 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1725 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1725_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1725
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1725 := by
  native_decide

/-- Coefficient term 1726 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1726 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1726 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1726 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1726 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1726_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1726
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1726 := by
  native_decide

/-- Coefficient term 1727 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1727 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1727 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1727 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1727 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1727_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1727
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1727 := by
  native_decide

/-- Coefficient term 1728 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1728 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1728 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1728 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1728 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1728_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1728
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1728 := by
  native_decide

/-- Coefficient term 1729 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1729 : Poly :=
[
  term ((-1296 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1729 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1729 : Poly :=
[
  term ((-2592 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((1296 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1729 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1729_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1729
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1729 := by
  native_decide

/-- Coefficient term 1730 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1730 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1730 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1730 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1730 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1730_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1730
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1730 := by
  native_decide

/-- Coefficient term 1731 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1731 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1731 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1731 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1731 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1731_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1731
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1731 := by
  native_decide

/-- Coefficient term 1732 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1732 : Poly :=
[
  term ((108 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1732 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1732 : Poly :=
[
  term ((216 : Rat) / 5) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1732 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1732_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1732
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1732 := by
  native_decide

/-- Coefficient term 1733 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1733 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1733 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1733 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1733 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1733_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1733
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1733 := by
  native_decide

/-- Coefficient term 1734 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1734 : Poly :=
[
  term ((-162 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1734 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1734 : Poly :=
[
  term ((-324 : Rat) / 5) [(3, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((162 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1734 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1734_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1734
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1734 := by
  native_decide

/-- Coefficient term 1735 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1735 : Poly :=
[
  term ((18 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1735 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1735 : Poly :=
[
  term ((36 : Rat) / 5) [(3, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1735 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1735_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1735
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1735 := by
  native_decide

/-- Coefficient term 1736 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1736 : Poly :=
[
  term ((2592 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 1736 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1736 : Poly :=
[
  term ((-2592 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term ((5184 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1736 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1736_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1736
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1736 := by
  native_decide

/-- Coefficient term 1737 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1737 : Poly :=
[
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 1737 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1737 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-3456 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1737 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1737_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1737
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1737 := by
  native_decide

/-- Coefficient term 1738 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1738 : Poly :=
[
  term ((-864 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1738 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1738 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1738 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1738_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1738
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1738 := by
  native_decide

/-- Coefficient term 1739 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1739 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1739 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1739 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1739 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1739_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1739
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1739 := by
  native_decide

/-- Coefficient term 1740 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1740 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1740 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1740 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1740 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1740_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1740
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1740 := by
  native_decide

/-- Coefficient term 1741 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1741 : Poly :=
[
  term ((1296 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1741 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1741 : Poly :=
[
  term ((-1296 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((2592 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1741 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1741_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1741
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1741 := by
  native_decide

/-- Coefficient term 1742 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1742 : Poly :=
[
  term ((-432 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1742 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1742 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1742 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1742_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1742
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1742 := by
  native_decide

/-- Coefficient term 1743 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1743 : Poly :=
[
  term ((-864 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1743 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1743 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1743 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1743_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1743
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1743 := by
  native_decide

/-- Coefficient term 1744 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1744 : Poly :=
[
  term ((-108 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1744 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1744 : Poly :=
[
  term ((108 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-216 : Rat) / 5) [(3, 2), (7, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1744 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1744_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1744
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1744 := by
  native_decide

/-- Coefficient term 1745 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1745 : Poly :=
[
  term ((12 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1745 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1745 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(3, 2), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1745 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1745_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1745
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1745 := by
  native_decide

/-- Coefficient term 1746 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1746 : Poly :=
[
  term ((162 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1746 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1746 : Poly :=
[
  term ((-162 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((324 : Rat) / 5) [(3, 2), (7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1746 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1746_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1746
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1746 := by
  native_decide

/-- Coefficient term 1747 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1747 : Poly :=
[
  term ((-18 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1747 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1747 : Poly :=
[
  term ((18 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(3, 2), (7, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1747 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1747_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1747
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1747 := by
  native_decide

/-- Coefficient term 1748 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1748 : Poly :=
[
  term ((-432 : Rat) / 35) [(3, 2), (7, 1), (11, 1)]
]

/-- Partial product 1748 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1748 : Poly :=
[
  term ((-864 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term ((432 : Rat) / 35) [(3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1748 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1748_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1748
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1748 := by
  native_decide

/-- Coefficient term 1749 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1749 : Poly :=
[
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 1749 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1749 : Poly :=
[
  term ((-3456 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1749 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1749_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1749
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1749 := by
  native_decide

/-- Coefficient term 1750 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1750 : Poly :=
[
  term ((-864 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1750 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1750 : Poly :=
[
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((864 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1750 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1750_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1750
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1750 := by
  native_decide

/-- Coefficient term 1751 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1751 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1751 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1751 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1751 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1751_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1751
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1751 := by
  native_decide

/-- Coefficient term 1752 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1752 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1752 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1752 : Poly :=
[
  term ((1152 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1752 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1752_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1752
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1752 := by
  native_decide

/-- Coefficient term 1753 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1753 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2)]
]

/-- Partial product 1753 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1753 : Poly :=
[
  term ((3456 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 2)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1753 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1753_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1753
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1753 := by
  native_decide

/-- Coefficient term 1754 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1754 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2), (14, 1)]
]

/-- Partial product 1754 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1754 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1754 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1754_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1754
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1754 := by
  native_decide

/-- Coefficient term 1755 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1755 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1755 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1755 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1755 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1755_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1755
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1755 := by
  native_decide

/-- Coefficient term 1756 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1756 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1756 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1756 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1756 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1756_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1756
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1756 := by
  native_decide

/-- Coefficient term 1757 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1757 : Poly :=
[
  term ((-216 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 1757 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1757 : Poly :=
[
  term ((-432 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((216 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1757 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1757_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1757
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1757 := by
  native_decide

/-- Coefficient term 1758 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1758 : Poly :=
[
  term ((72 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1758 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1758 : Poly :=
[
  term ((144 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1758 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1758_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1758
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1758 := by
  native_decide

/-- Coefficient term 1759 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1759 : Poly :=
[
  term ((144 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 1759 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1759 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1759 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1759_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1759
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1759 := by
  native_decide

/-- Coefficient term 1760 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1760 : Poly :=
[
  term ((-108 : Rat) / 5) [(3, 2), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1760 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1760 : Poly :=
[
  term ((-216 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((108 : Rat) / 5) [(3, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1760 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1760_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1760
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1760 := by
  native_decide

/-- Coefficient term 1761 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1761 : Poly :=
[
  term ((12 : Rat) / 5) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1761 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1761 : Poly :=
[
  term ((24 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1761 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1761_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1761
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1761 := by
  native_decide

/-- Coefficient term 1762 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1762 : Poly :=
[
  term ((108 : Rat) / 5) [(3, 2), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 1762 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1762 : Poly :=
[
  term ((216 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1762 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1762_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1762
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1762 := by
  native_decide

/-- Coefficient term 1763 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1763 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1763 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1763 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1763 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1763_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1763
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1763 := by
  native_decide

/-- Coefficient term 1764 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1764 : Poly :=
[
  term ((-27 : Rat) / 5) [(3, 2), (7, 1), (15, 1)]
]

/-- Partial product 1764 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1764 : Poly :=
[
  term ((-54 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((27 : Rat) / 5) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1764 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1764_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1764
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1764 := by
  native_decide

/-- Coefficient term 1765 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1765 : Poly :=
[
  term ((3 : Rat) / 5) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1765 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1765 : Poly :=
[
  term ((6 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 5) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1765 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1765_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1765
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1765 := by
  native_decide

/-- Coefficient term 1766 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1766 : Poly :=
[
  term ((-1728 : Rat) / 35) [(3, 2), (9, 1), (11, 1)]
]

/-- Partial product 1766 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1766 : Poly :=
[
  term ((-3456 : Rat) / 35) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1766 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1766_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1766
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1766 := by
  native_decide

/-- Coefficient term 1767 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1767 : Poly :=
[
  term ((-864 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1767 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1767 : Poly :=
[
  term ((-1728 : Rat) / 35) [(3, 2), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((864 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1767 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1767_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1767
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1767 := by
  native_decide

/-- Coefficient term 1768 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1768 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1768 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1768 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1768 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1768_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1768
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1768 := by
  native_decide

/-- Coefficient term 1769 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1769 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1769 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1769 : Poly :=
[
  term ((1152 : Rat) / 35) [(3, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1769 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1769_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1769
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1769 := by
  native_decide

/-- Coefficient term 1770 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1770 : Poly :=
[
  term ((-108 : Rat) / 5) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 1770 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1770 : Poly :=
[
  term ((-216 : Rat) / 5) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((108 : Rat) / 5) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1770 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1770_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1770
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1770 := by
  native_decide

/-- Coefficient term 1771 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1771 : Poly :=
[
  term ((12 : Rat) / 5) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1771 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1771 : Poly :=
[
  term ((24 : Rat) / 5) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1771 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1771_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1771
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1771 := by
  native_decide

/-- Coefficient term 1772 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1772 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1772 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1772 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1772 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1772_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1772
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1772 := by
  native_decide

/-- Coefficient term 1773 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1773 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1773 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1773 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1773 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1773_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1773
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1773 := by
  native_decide

/-- Coefficient term 1774 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1774 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1774 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1774 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1774 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1774_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1774
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1774 := by
  native_decide

/-- Coefficient term 1775 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1775 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1775 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1775 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1775 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1775_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1775
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1775 := by
  native_decide

/-- Coefficient term 1776 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1776 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (11, 1), (13, 1)]
]

/-- Partial product 1776 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1776 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1776 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1776_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1776
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1776 := by
  native_decide

/-- Coefficient term 1777 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1777 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1777 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1777 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1777 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1777_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1777
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1777 := by
  native_decide

/-- Coefficient term 1778 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1778 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1778 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1778 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1778 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1778_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1778
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1778 := by
  native_decide

/-- Coefficient term 1779 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1779 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1779 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1779 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1779 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1779_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1779
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1779 := by
  native_decide

/-- Coefficient term 1780 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1780 : Poly :=
[
  term ((54 : Rat) / 5) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1780 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1780 : Poly :=
[
  term ((108 : Rat) / 5) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1780 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1780_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1780
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1780 := by
  native_decide

/-- Coefficient term 1781 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1781 : Poly :=
[
  term ((-6 : Rat) / 5) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1781 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1781 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 5) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1781 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1781_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1781
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1781 := by
  native_decide

/-- Coefficient term 1782 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1782 : Poly :=
[
  term ((54 : Rat) / 5) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 1782 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1782 : Poly :=
[
  term ((108 : Rat) / 5) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1782 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1782_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1782
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1782 := by
  native_decide

/-- Coefficient term 1783 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1783 : Poly :=
[
  term ((-6 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1783 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1783 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1783 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1783_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1783
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1783 := by
  native_decide

/-- Coefficient term 1784 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1784 : Poly :=
[
  term ((3 : Rat) / 5) [(4, 1)]
]

/-- Partial product 1784 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1784 : Poly :=
[
  term ((-3 : Rat) / 5) [(4, 1)],
  term ((6 : Rat) / 5) [(4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1784 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1784_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1784
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1784 := by
  native_decide

/-- Coefficient term 1785 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1785 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1785 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1785 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1785 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1785_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1785
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1785 := by
  native_decide

/-- Coefficient term 1786 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1786 : Poly :=
[
  term ((-294912 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (13, 2)]
]

/-- Partial product 1786 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1786 : Poly :=
[
  term ((-589824 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 2)],
  term ((294912 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1786 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1786_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1786
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1786 := by
  native_decide

/-- Coefficient term 1787 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1787 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (11, 1), (13, 2)]
]

/-- Partial product 1787 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1787 : Poly :=
[
  term ((221184 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1787 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1787_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1787
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1787 := by
  native_decide

/-- Coefficient term 1788 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1788 : Poly :=
[
  term ((25344 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 1788 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1788 : Poly :=
[
  term ((50688 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-25344 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1788 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1788_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1788
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1788 := by
  native_decide

/-- Coefficient term 1789 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1789 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 3)]
]

/-- Partial product 1789 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1789 : Poly :=
[
  term ((663552 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (13, 3)],
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1789 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1789_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1789
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1789 := by
  native_decide

/-- Coefficient term 1790 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1790 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1790 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1790 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1790 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1790_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1790
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1790 := by
  native_decide

/-- Coefficient term 1791 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1791 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 2)]
]

/-- Partial product 1791 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1791 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1791 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1791_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1791
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1791 := by
  native_decide

/-- Coefficient term 1792 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1792 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 1792 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1792 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1792 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1792_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1792
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1792 := by
  native_decide

/-- Coefficient term 1793 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1793 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2)]
]

/-- Partial product 1793 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1793 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1793 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1793_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1793
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1793 := by
  native_decide

/-- Coefficient term 1794 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1794 : Poly :=
[
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 2)]
]

/-- Partial product 1794 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1794 : Poly :=
[
  term ((-239616 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 2)],
  term ((479232 : Rat) / 7625) [(4, 1), (5, 1), (8, 2), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1794 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1794_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1794
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1794 := by
  native_decide

/-- Coefficient term 1795 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1795 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 1795 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1795 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (8, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1795 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1795_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1795
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1795 := by
  native_decide

/-- Coefficient term 1796 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1796 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (13, 3)]
]

/-- Partial product 1796 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1796 : Poly :=
[
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (13, 3)],
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (8, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1796 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1796_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1796
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1796 := by
  native_decide

/-- Coefficient term 1797 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1797 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (10, 1), (13, 2)]
]

/-- Partial product 1797 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1797 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1797 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1797_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1797
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1797 := by
  native_decide

/-- Coefficient term 1798 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1798 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1798 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1798 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1798 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1798_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1798
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1798 := by
  native_decide

/-- Coefficient term 1799 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1799 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1799 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1799 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1799 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1799_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1799
        rs_R003_ueqv_R003YY_generator_19_1700_1799 =
      rs_R003_ueqv_R003YY_partial_19_1799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_1700_1799 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_1700,
  rs_R003_ueqv_R003YY_partial_19_1701,
  rs_R003_ueqv_R003YY_partial_19_1702,
  rs_R003_ueqv_R003YY_partial_19_1703,
  rs_R003_ueqv_R003YY_partial_19_1704,
  rs_R003_ueqv_R003YY_partial_19_1705,
  rs_R003_ueqv_R003YY_partial_19_1706,
  rs_R003_ueqv_R003YY_partial_19_1707,
  rs_R003_ueqv_R003YY_partial_19_1708,
  rs_R003_ueqv_R003YY_partial_19_1709,
  rs_R003_ueqv_R003YY_partial_19_1710,
  rs_R003_ueqv_R003YY_partial_19_1711,
  rs_R003_ueqv_R003YY_partial_19_1712,
  rs_R003_ueqv_R003YY_partial_19_1713,
  rs_R003_ueqv_R003YY_partial_19_1714,
  rs_R003_ueqv_R003YY_partial_19_1715,
  rs_R003_ueqv_R003YY_partial_19_1716,
  rs_R003_ueqv_R003YY_partial_19_1717,
  rs_R003_ueqv_R003YY_partial_19_1718,
  rs_R003_ueqv_R003YY_partial_19_1719,
  rs_R003_ueqv_R003YY_partial_19_1720,
  rs_R003_ueqv_R003YY_partial_19_1721,
  rs_R003_ueqv_R003YY_partial_19_1722,
  rs_R003_ueqv_R003YY_partial_19_1723,
  rs_R003_ueqv_R003YY_partial_19_1724,
  rs_R003_ueqv_R003YY_partial_19_1725,
  rs_R003_ueqv_R003YY_partial_19_1726,
  rs_R003_ueqv_R003YY_partial_19_1727,
  rs_R003_ueqv_R003YY_partial_19_1728,
  rs_R003_ueqv_R003YY_partial_19_1729,
  rs_R003_ueqv_R003YY_partial_19_1730,
  rs_R003_ueqv_R003YY_partial_19_1731,
  rs_R003_ueqv_R003YY_partial_19_1732,
  rs_R003_ueqv_R003YY_partial_19_1733,
  rs_R003_ueqv_R003YY_partial_19_1734,
  rs_R003_ueqv_R003YY_partial_19_1735,
  rs_R003_ueqv_R003YY_partial_19_1736,
  rs_R003_ueqv_R003YY_partial_19_1737,
  rs_R003_ueqv_R003YY_partial_19_1738,
  rs_R003_ueqv_R003YY_partial_19_1739,
  rs_R003_ueqv_R003YY_partial_19_1740,
  rs_R003_ueqv_R003YY_partial_19_1741,
  rs_R003_ueqv_R003YY_partial_19_1742,
  rs_R003_ueqv_R003YY_partial_19_1743,
  rs_R003_ueqv_R003YY_partial_19_1744,
  rs_R003_ueqv_R003YY_partial_19_1745,
  rs_R003_ueqv_R003YY_partial_19_1746,
  rs_R003_ueqv_R003YY_partial_19_1747,
  rs_R003_ueqv_R003YY_partial_19_1748,
  rs_R003_ueqv_R003YY_partial_19_1749,
  rs_R003_ueqv_R003YY_partial_19_1750,
  rs_R003_ueqv_R003YY_partial_19_1751,
  rs_R003_ueqv_R003YY_partial_19_1752,
  rs_R003_ueqv_R003YY_partial_19_1753,
  rs_R003_ueqv_R003YY_partial_19_1754,
  rs_R003_ueqv_R003YY_partial_19_1755,
  rs_R003_ueqv_R003YY_partial_19_1756,
  rs_R003_ueqv_R003YY_partial_19_1757,
  rs_R003_ueqv_R003YY_partial_19_1758,
  rs_R003_ueqv_R003YY_partial_19_1759,
  rs_R003_ueqv_R003YY_partial_19_1760,
  rs_R003_ueqv_R003YY_partial_19_1761,
  rs_R003_ueqv_R003YY_partial_19_1762,
  rs_R003_ueqv_R003YY_partial_19_1763,
  rs_R003_ueqv_R003YY_partial_19_1764,
  rs_R003_ueqv_R003YY_partial_19_1765,
  rs_R003_ueqv_R003YY_partial_19_1766,
  rs_R003_ueqv_R003YY_partial_19_1767,
  rs_R003_ueqv_R003YY_partial_19_1768,
  rs_R003_ueqv_R003YY_partial_19_1769,
  rs_R003_ueqv_R003YY_partial_19_1770,
  rs_R003_ueqv_R003YY_partial_19_1771,
  rs_R003_ueqv_R003YY_partial_19_1772,
  rs_R003_ueqv_R003YY_partial_19_1773,
  rs_R003_ueqv_R003YY_partial_19_1774,
  rs_R003_ueqv_R003YY_partial_19_1775,
  rs_R003_ueqv_R003YY_partial_19_1776,
  rs_R003_ueqv_R003YY_partial_19_1777,
  rs_R003_ueqv_R003YY_partial_19_1778,
  rs_R003_ueqv_R003YY_partial_19_1779,
  rs_R003_ueqv_R003YY_partial_19_1780,
  rs_R003_ueqv_R003YY_partial_19_1781,
  rs_R003_ueqv_R003YY_partial_19_1782,
  rs_R003_ueqv_R003YY_partial_19_1783,
  rs_R003_ueqv_R003YY_partial_19_1784,
  rs_R003_ueqv_R003YY_partial_19_1785,
  rs_R003_ueqv_R003YY_partial_19_1786,
  rs_R003_ueqv_R003YY_partial_19_1787,
  rs_R003_ueqv_R003YY_partial_19_1788,
  rs_R003_ueqv_R003YY_partial_19_1789,
  rs_R003_ueqv_R003YY_partial_19_1790,
  rs_R003_ueqv_R003YY_partial_19_1791,
  rs_R003_ueqv_R003YY_partial_19_1792,
  rs_R003_ueqv_R003YY_partial_19_1793,
  rs_R003_ueqv_R003YY_partial_19_1794,
  rs_R003_ueqv_R003YY_partial_19_1795,
  rs_R003_ueqv_R003YY_partial_19_1796,
  rs_R003_ueqv_R003YY_partial_19_1797,
  rs_R003_ueqv_R003YY_partial_19_1798,
  rs_R003_ueqv_R003YY_partial_19_1799
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_1700_1799 : Poly :=
[
  term ((-48 : Rat) / 35) [(3, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((4512 : Rat) / 35) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((128 : Rat) / 35) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-528 : Rat) / 35) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1084 : Rat) / 35) [(3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term (-54 : Rat) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term (6 : Rat) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((513 : Rat) / 5) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((-81 : Rat) / 5) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((1668 : Rat) / 35) [(3, 1), (8, 1), (13, 1)],
  term ((-1252 : Rat) / 35) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 35) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44 : Rat) / 7) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((513 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((-81 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((324 : Rat) / 5) [(3, 1), (8, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2256 : Rat) / 35) [(3, 1), (12, 1), (13, 1)],
  term ((-64 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((264 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((542 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term (27 : Rat) [(3, 1), (12, 1), (15, 1)],
  term (-3 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-513 : Rat) / 10) [(3, 1), (12, 2), (15, 1)],
  term ((81 : Rat) / 10) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-834 : Rat) / 35) [(3, 1), (13, 1)],
  term ((626 : Rat) / 35) [(3, 1), (13, 1), (14, 1)],
  term ((6 : Rat) / 35) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((22 : Rat) / 7) [(3, 1), (13, 1), (16, 1)],
  term ((-513 : Rat) / 10) [(3, 1), (13, 2), (15, 1)],
  term ((81 : Rat) / 10) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-162 : Rat) / 5) [(3, 1), (15, 1)],
  term ((18 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((288 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1)],
  term ((432 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((54 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5184 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((3456 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2592 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((216 : Rat) / 5) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-324 : Rat) / 5) [(3, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((36 : Rat) / 5) [(3, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2592 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((288 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1296 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((162 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((288 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((3456 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 2)],
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((576 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((5184 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1)],
  term ((-3456 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (12, 1), (14, 1)],
  term ((576 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((2592 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (14, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(3, 2), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 2), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((324 : Rat) / 5) [(3, 2), (7, 1), (8, 2), (15, 1)],
  term ((-36 : Rat) / 5) [(3, 2), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((432 : Rat) / 35) [(3, 2), (7, 1), (11, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((864 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((288 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((216 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-72 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((108 : Rat) / 5) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((27 : Rat) / 5) [(3, 2), (7, 1), (15, 1)],
  term ((-3 : Rat) / 5) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 35) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((576 : Rat) / 35) [(3, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(3, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((108 : Rat) / 5) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 5) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (9, 1), (11, 1)],
  term ((864 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((108 : Rat) / 5) [(3, 2), (9, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (11, 1), (13, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((6 : Rat) / 5) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (13, 1), (15, 1)],
  term ((6 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 5) [(4, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-589824 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 2)],
  term ((221184 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (13, 2)],
  term ((50688 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((663552 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (8, 1), (13, 3)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((294912 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (11, 1), (13, 2)],
  term ((-25344 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 3)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (8, 2), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-239616 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 2)],
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (13, 3)],
  term ((479232 : Rat) / 7625) [(4, 1), (5, 1), (8, 2), (9, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (8, 2), (11, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (8, 2), (13, 3)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (10, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((6 : Rat) / 5) [(4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 1700 through 1799. -/
theorem rs_R003_ueqv_R003YY_block_19_1700_1799_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_1700_1799
      rs_R003_ueqv_R003YY_block_19_1700_1799 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
