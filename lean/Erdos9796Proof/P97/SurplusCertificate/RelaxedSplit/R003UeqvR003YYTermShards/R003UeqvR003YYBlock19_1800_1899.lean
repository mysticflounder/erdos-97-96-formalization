/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:1800-1899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_1800_1899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1800 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1800 : Poly :=
[
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 1800 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1800 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 2)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1800 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1800_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1800
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1800 := by
  native_decide

/-- Coefficient term 1801 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1801 : Poly :=
[
  term ((285696 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)]
]

/-- Partial product 1801 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1801 : Poly :=
[
  term ((571392 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 2)],
  term ((-285696 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1801 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1801_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1801
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1801 := by
  native_decide

/-- Coefficient term 1802 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1802 : Poly :=
[
  term ((-239616 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (12, 1), (13, 1)]
]

/-- Partial product 1802 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1802 : Poly :=
[
  term ((-479232 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1802 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1802_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1802
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1802 := by
  native_decide

/-- Coefficient term 1803 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1803 : Poly :=
[
  term ((-239616 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (13, 1)]
]

/-- Partial product 1803 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1803 : Poly :=
[
  term ((-479232 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1)],
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1803 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1803_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1803
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1803 := by
  native_decide

/-- Coefficient term 1804 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1804 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1804 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1804 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1804 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1804_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1804
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1804 := by
  native_decide

/-- Coefficient term 1805 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1805 : Poly :=
[
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 1805 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1805 : Poly :=
[
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1805 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1805_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1805
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1805 := by
  native_decide

/-- Coefficient term 1806 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1806 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 1), (5, 1), (11, 1), (13, 2)]
]

/-- Partial product 1806 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1806 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 2)],
  term ((-13824 : Rat) / 7625) [(4, 1), (5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1806 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1806_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1806
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1806 := by
  native_decide

/-- Coefficient term 1807 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1807 : Poly :=
[
  term ((4608 : Rat) / 1525) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 1807 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1807 : Poly :=
[
  term ((9216 : Rat) / 1525) [(4, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-4608 : Rat) / 1525) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1807 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1807_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1807
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1807 := by
  native_decide

/-- Coefficient term 1808 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1808 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 2), (13, 1)]
]

/-- Partial product 1808 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1808 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (12, 2), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1808 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1808_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1808
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1808 := by
  native_decide

/-- Coefficient term 1809 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1809 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 1809 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1809 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1809 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1809_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1809
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1809 := by
  native_decide

/-- Coefficient term 1810 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1810 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (13, 3)]
]

/-- Partial product 1810 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1810 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (13, 3)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1810 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1810_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1810
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1810 := by
  native_decide

/-- Coefficient term 1811 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1811 : Poly :=
[
  term ((-2496 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1811 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1811 : Poly :=
[
  term ((-4992 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((2496 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1811 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1811_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1811
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1811 := by
  native_decide

/-- Coefficient term 1812 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1812 : Poly :=
[
  term ((4992 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 1812 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1812 : Poly :=
[
  term ((9984 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-4992 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1812 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1812_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1812
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1812 := by
  native_decide

/-- Coefficient term 1813 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1813 : Poly :=
[
  term ((-65832 : Rat) / 53375) [(4, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 1813 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1813 : Poly :=
[
  term ((-131664 : Rat) / 53375) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((65832 : Rat) / 53375) [(4, 1), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1813 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1813_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1813
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1813 := by
  native_decide

/-- Coefficient term 1814 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1814 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1814 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1814 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1814 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1814_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1814
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1814 := by
  native_decide

/-- Coefficient term 1815 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1815 : Poly :=
[
  term ((-279936 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1815 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1815 : Poly :=
[
  term ((-559872 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((279936 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1815 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1815_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1815
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1815 := by
  native_decide

/-- Coefficient term 1816 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1816 : Poly :=
[
  term ((2112 : Rat) / 427) [(4, 1), (6, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 1816 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1816 : Poly :=
[
  term ((4224 : Rat) / 427) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-2112 : Rat) / 427) [(4, 1), (6, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1816 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1816_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1816
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1816 := by
  native_decide

/-- Coefficient term 1817 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1817 : Poly :=
[
  term ((138192 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1817 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1817 : Poly :=
[
  term ((276384 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-138192 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1817 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1817_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1817
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1817 := by
  native_decide

/-- Coefficient term 1818 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1818 : Poly :=
[
  term ((-17448 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1818 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1818 : Poly :=
[
  term ((-34896 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((17448 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1818 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1818_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1818
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1818 := by
  native_decide

/-- Coefficient term 1819 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1819 : Poly :=
[
  term ((-173568 : Rat) / 53375) [(4, 1), (6, 1), (10, 1), (13, 2)]
]

/-- Partial product 1819 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1819 : Poly :=
[
  term ((-347136 : Rat) / 53375) [(4, 1), (6, 1), (8, 1), (10, 1), (13, 2)],
  term ((173568 : Rat) / 53375) [(4, 1), (6, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1819 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1819_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1819
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1819 := by
  native_decide

/-- Coefficient term 1820 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1820 : Poly :=
[
  term ((1248 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1820 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1820 : Poly :=
[
  term ((2496 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1248 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1820 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1820_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1820
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1820 := by
  native_decide

/-- Coefficient term 1821 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1821 : Poly :=
[
  term ((1008 : Rat) / 1525) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1821 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1821 : Poly :=
[
  term ((2016 : Rat) / 1525) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1008 : Rat) / 1525) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1821 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1821_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1821
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1821 := by
  native_decide

/-- Coefficient term 1822 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1822 : Poly :=
[
  term ((306816 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (13, 3)]
]

/-- Partial product 1822 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1822 : Poly :=
[
  term ((613632 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 3)],
  term ((-306816 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1822 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1822_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1822
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1822 := by
  native_decide

/-- Coefficient term 1823 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1823 : Poly :=
[
  term ((108096 : Rat) / 10675) [(4, 1), (6, 1), (11, 2), (13, 2)]
]

/-- Partial product 1823 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1823 : Poly :=
[
  term ((216192 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (11, 2), (13, 2)],
  term ((-108096 : Rat) / 10675) [(4, 1), (6, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1823 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1823_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1823
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1823 := by
  native_decide

/-- Coefficient term 1824 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1824 : Poly :=
[
  term ((-42624 : Rat) / 2135) [(4, 1), (6, 1), (12, 1), (13, 2)]
]

/-- Partial product 1824 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1824 : Poly :=
[
  term ((-85248 : Rat) / 2135) [(4, 1), (6, 1), (8, 1), (12, 1), (13, 2)],
  term ((42624 : Rat) / 2135) [(4, 1), (6, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1824 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1824_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1824
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1824 := by
  native_decide

/-- Coefficient term 1825 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1825 : Poly :=
[
  term ((899832 : Rat) / 53375) [(4, 1), (6, 1), (13, 2)]
]

/-- Partial product 1825 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1825 : Poly :=
[
  term ((1799664 : Rat) / 53375) [(4, 1), (6, 1), (8, 1), (13, 2)],
  term ((-899832 : Rat) / 53375) [(4, 1), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1825 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1825_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1825
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1825 := by
  native_decide

/-- Coefficient term 1826 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1826 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 1826 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1826 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (7, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1826 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1826_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1826
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1826 := by
  native_decide

/-- Coefficient term 1827 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1827 : Poly :=
[
  term ((45312 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 1827 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1827 : Poly :=
[
  term ((-45312 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((90624 : Rat) / 10675) [(4, 1), (7, 1), (8, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1827 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1827_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1827
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1827 := by
  native_decide

/-- Coefficient term 1828 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1828 : Poly :=
[
  term ((-2112 : Rat) / 427) [(4, 1), (7, 1), (8, 1), (11, 2), (13, 1)]
]

/-- Partial product 1828 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1828 : Poly :=
[
  term ((2112 : Rat) / 427) [(4, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-4224 : Rat) / 427) [(4, 1), (7, 1), (8, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1828 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1828_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1828
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1828 := by
  native_decide

/-- Coefficient term 1829 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1829 : Poly :=
[
  term ((-138192 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1829 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1829 : Poly :=
[
  term ((138192 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-276384 : Rat) / 10675) [(4, 1), (7, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1829 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1829_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1829
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1829 := by
  native_decide

/-- Coefficient term 1830 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1830 : Poly :=
[
  term ((17448 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1830 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1830 : Poly :=
[
  term ((-17448 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((34896 : Rat) / 10675) [(4, 1), (7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1830 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1830_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1830
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1830 := by
  native_decide

/-- Coefficient term 1831 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1831 : Poly :=
[
  term ((2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1831 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1831 : Poly :=
[
  term ((4992 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1831 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1831_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1831
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1831 := by
  native_decide

/-- Coefficient term 1832 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1832 : Poly :=
[
  term ((2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1832 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1832 : Poly :=
[
  term ((4992 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1832 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1832_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1832
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1832 := by
  native_decide

/-- Coefficient term 1833 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1833 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1833 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1833 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1833 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1833_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1833
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1833 := by
  native_decide

/-- Coefficient term 1834 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1834 : Poly :=
[
  term ((9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1834 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1834 : Poly :=
[
  term ((19968 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1834 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1834_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1834
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1834 := by
  native_decide

/-- Coefficient term 1835 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1835 : Poly :=
[
  term ((6528 : Rat) / 2135) [(4, 1), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 1835 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1835 : Poly :=
[
  term ((13056 : Rat) / 2135) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-6528 : Rat) / 2135) [(4, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1835 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1835_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1835
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1835 := by
  native_decide

/-- Coefficient term 1836 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1836 : Poly :=
[
  term ((-1056 : Rat) / 427) [(4, 1), (7, 1), (11, 2), (13, 1)]
]

/-- Partial product 1836 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1836 : Poly :=
[
  term ((-2112 : Rat) / 427) [(4, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((1056 : Rat) / 427) [(4, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1836 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1836_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1836
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1836 := by
  native_decide

/-- Coefficient term 1837 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1837 : Poly :=
[
  term ((-268368 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1837 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1837 : Poly :=
[
  term ((-536736 : Rat) / 53375) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((268368 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1837 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1837_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1837
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1837 := by
  native_decide

/-- Coefficient term 1838 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1838 : Poly :=
[
  term ((913632 : Rat) / 53375) [(4, 1), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1838 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1838 : Poly :=
[
  term ((1827264 : Rat) / 53375) [(4, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-913632 : Rat) / 53375) [(4, 1), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1838 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1838_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1838
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1838 := by
  native_decide

/-- Coefficient term 1839 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1839 : Poly :=
[
  term ((120732 : Rat) / 53375) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 1839 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1839 : Poly :=
[
  term ((241464 : Rat) / 53375) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-120732 : Rat) / 53375) [(4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1839 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1839_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1839
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1839 := by
  native_decide

/-- Coefficient term 1840 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1840 : Poly :=
[
  term ((2496 : Rat) / 10675) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1840 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1840 : Poly :=
[
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1840 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1840_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1840
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1840 := by
  native_decide

/-- Coefficient term 1841 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1841 : Poly :=
[
  term ((-4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1841 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1841 : Poly :=
[
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1841 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1841_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1841
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1841 := by
  native_decide

/-- Coefficient term 1842 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1842 : Poly :=
[
  term ((-3744 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 1842 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1842 : Poly :=
[
  term ((-7488 : Rat) / 10675) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((3744 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1842 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1842_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1842
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1842 := by
  native_decide

/-- Coefficient term 1843 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1843 : Poly :=
[
  term ((6 : Rat) / 5) [(4, 1), (8, 1)]
]

/-- Partial product 1843 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1843 : Poly :=
[
  term ((-6 : Rat) / 5) [(4, 1), (8, 1)],
  term ((12 : Rat) / 5) [(4, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1843 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1843_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1843
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1843 := by
  native_decide

/-- Coefficient term 1844 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1844 : Poly :=
[
  term ((232128 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1844 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1844 : Poly :=
[
  term ((-232128 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((464256 : Rat) / 10675) [(4, 1), (8, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1844 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1844_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1844
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1844 := by
  native_decide

/-- Coefficient term 1845 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1845 : Poly :=
[
  term ((-528 : Rat) / 427) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1845 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1845 : Poly :=
[
  term ((528 : Rat) / 427) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1056 : Rat) / 427) [(4, 1), (8, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1845 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1845_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1845
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1845 := by
  native_decide

/-- Coefficient term 1846 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1846 : Poly :=
[
  term ((48048 : Rat) / 7625) [(4, 1), (8, 1), (10, 1), (13, 2)]
]

/-- Partial product 1846 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1846 : Poly :=
[
  term ((-48048 : Rat) / 7625) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((96096 : Rat) / 7625) [(4, 1), (8, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1846 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1846_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1846
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1846 := by
  native_decide

/-- Coefficient term 1847 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1847 : Poly :=
[
  term ((118224 : Rat) / 53375) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1847 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1847 : Poly :=
[
  term ((-118224 : Rat) / 53375) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((236448 : Rat) / 53375) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1847 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1847_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1847
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1847 := by
  native_decide

/-- Coefficient term 1848 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1848 : Poly :=
[
  term ((-24912 : Rat) / 10675) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1848 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1848 : Poly :=
[
  term ((24912 : Rat) / 10675) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-49824 : Rat) / 10675) [(4, 1), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1848 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1848_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1848
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1848 := by
  native_decide

/-- Coefficient term 1849 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1849 : Poly :=
[
  term ((-153408 : Rat) / 10675) [(4, 1), (8, 1), (11, 1), (13, 3)]
]

/-- Partial product 1849 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1849 : Poly :=
[
  term ((153408 : Rat) / 10675) [(4, 1), (8, 1), (11, 1), (13, 3)],
  term ((-306816 : Rat) / 10675) [(4, 1), (8, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1849 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1849_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1849
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1849 := by
  native_decide

/-- Coefficient term 1850 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1850 : Poly :=
[
  term ((25152 : Rat) / 10675) [(4, 1), (8, 1), (11, 2), (13, 2)]
]

/-- Partial product 1850 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1850 : Poly :=
[
  term ((-25152 : Rat) / 10675) [(4, 1), (8, 1), (11, 2), (13, 2)],
  term ((50304 : Rat) / 10675) [(4, 1), (8, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1850 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1850_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1850
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1850 := by
  native_decide

/-- Coefficient term 1851 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1851 : Poly :=
[
  term ((21312 : Rat) / 2135) [(4, 1), (8, 1), (12, 1), (13, 2)]
]

/-- Partial product 1851 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1851 : Poly :=
[
  term ((-21312 : Rat) / 2135) [(4, 1), (8, 1), (12, 1), (13, 2)],
  term ((42624 : Rat) / 2135) [(4, 1), (8, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1851 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1851_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1851
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1851 := by
  native_decide

/-- Coefficient term 1852 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1852 : Poly :=
[
  term ((-85464 : Rat) / 53375) [(4, 1), (8, 1), (13, 2)]
]

/-- Partial product 1852 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1852 : Poly :=
[
  term ((85464 : Rat) / 53375) [(4, 1), (8, 1), (13, 2)],
  term ((-170928 : Rat) / 53375) [(4, 1), (8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1852 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1852_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1852
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1852 := by
  native_decide

/-- Coefficient term 1853 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1853 : Poly :=
[
  term ((-6 : Rat) / 5) [(4, 1), (8, 1), (14, 1)]
]

/-- Partial product 1853 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1853 : Poly :=
[
  term ((6 : Rat) / 5) [(4, 1), (8, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1853 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1853_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1853
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1853 := by
  native_decide

/-- Coefficient term 1854 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1854 : Poly :=
[
  term ((-2112 : Rat) / 427) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 2)]
]

/-- Partial product 1854 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1854 : Poly :=
[
  term ((-4224 : Rat) / 427) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((2112 : Rat) / 427) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1854 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1854_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1854
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1854 := by
  native_decide

/-- Coefficient term 1855 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1855 : Poly :=
[
  term ((-90912 : Rat) / 10675) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1855 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1855 : Poly :=
[
  term ((-181824 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((90912 : Rat) / 10675) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1855 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1855_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1855
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1855 := by
  native_decide

/-- Coefficient term 1856 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1856 : Poly :=
[
  term ((-211776 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1856 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1856 : Poly :=
[
  term ((-423552 : Rat) / 53375) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((211776 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1856 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1856_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1856
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1856 := by
  native_decide

/-- Coefficient term 1857 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1857 : Poly :=
[
  term ((528 : Rat) / 427) [(4, 1), (9, 1), (10, 2), (13, 1)]
]

/-- Partial product 1857 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1857 : Poly :=
[
  term ((1056 : Rat) / 427) [(4, 1), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-528 : Rat) / 427) [(4, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1857 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1857_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1857
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1857 := by
  native_decide

/-- Coefficient term 1858 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1858 : Poly :=
[
  term ((153408 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1858 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1858 : Poly :=
[
  term ((306816 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-153408 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1858 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1858_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1858
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1858 := by
  native_decide

/-- Coefficient term 1859 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1859 : Poly :=
[
  term ((38496 : Rat) / 1525) [(4, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1859 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1859 : Poly :=
[
  term ((76992 : Rat) / 1525) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-38496 : Rat) / 1525) [(4, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1859 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1859_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1859
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1859 := by
  native_decide

/-- Coefficient term 1860 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1860 : Poly :=
[
  term ((27648 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

/-- Partial product 1860 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1860 : Poly :=
[
  term ((55296 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1860 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1860_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1860
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1860 := by
  native_decide

/-- Coefficient term 1861 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1861 : Poly :=
[
  term ((27648 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 1861 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1861 : Poly :=
[
  term ((55296 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-27648 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1861 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1861_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1861
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1861 := by
  native_decide

/-- Coefficient term 1862 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1862 : Poly :=
[
  term ((-447336 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1862 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1862 : Poly :=
[
  term ((-894672 : Rat) / 53375) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((447336 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1862 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1862_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1862
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1862 := by
  native_decide

/-- Coefficient term 1863 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1863 : Poly :=
[
  term ((-21312 : Rat) / 2135) [(4, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1863 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1863 : Poly :=
[
  term ((-42624 : Rat) / 2135) [(4, 1), (8, 1), (9, 1), (12, 2), (13, 1)],
  term ((21312 : Rat) / 2135) [(4, 1), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1863 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1863_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1863
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1863 := by
  native_decide

/-- Coefficient term 1864 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1864 : Poly :=
[
  term ((37176 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 1864 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1864 : Poly :=
[
  term ((74352 : Rat) / 53375) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-37176 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1864 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1864_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1864
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1864 := by
  native_decide

/-- Coefficient term 1865 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1865 : Poly :=
[
  term ((-232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1865 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1865 : Poly :=
[
  term ((-464256 : Rat) / 10675) [(4, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1865 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1865_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1865
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1865 := by
  native_decide

/-- Coefficient term 1866 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1866 : Poly :=
[
  term ((-232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 1866 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1866 : Poly :=
[
  term ((-464256 : Rat) / 10675) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1866 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1866_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1866
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1866 := by
  native_decide

/-- Coefficient term 1867 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1867 : Poly :=
[
  term ((-1248 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1867 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1867 : Poly :=
[
  term ((-2496 : Rat) / 10675) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1248 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1867 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1867_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1867
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1867 := by
  native_decide

/-- Coefficient term 1868 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1868 : Poly :=
[
  term ((2640 : Rat) / 427) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1868 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1868 : Poly :=
[
  term ((5280 : Rat) / 427) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2640 : Rat) / 427) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1868 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1868_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1868
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1868 := by
  native_decide

/-- Coefficient term 1869 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1869 : Poly :=
[
  term ((-165216 : Rat) / 53375) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 1869 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1869 : Poly :=
[
  term ((-330432 : Rat) / 53375) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((165216 : Rat) / 53375) [(4, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1869 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1869_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1869
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1869 := by
  native_decide

/-- Coefficient term 1870 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1870 : Poly :=
[
  term ((-12576 : Rat) / 10675) [(4, 1), (10, 2), (13, 2)]
]

/-- Partial product 1870 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1870 : Poly :=
[
  term ((-25152 : Rat) / 10675) [(4, 1), (8, 1), (10, 2), (13, 2)],
  term ((12576 : Rat) / 10675) [(4, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1870 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1870_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1870
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1870 := by
  native_decide

/-- Coefficient term 1871 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1871 : Poly :=
[
  term ((84768 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1871 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1871 : Poly :=
[
  term ((169536 : Rat) / 10675) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-84768 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1871 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1871_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1871
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1871 := by
  native_decide

/-- Coefficient term 1872 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1872 : Poly :=
[
  term ((-81696 : Rat) / 10675) [(4, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1872 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1872 : Poly :=
[
  term ((-163392 : Rat) / 10675) [(4, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((81696 : Rat) / 10675) [(4, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1872 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1872_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1872
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1872 := by
  native_decide

/-- Coefficient term 1873 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1873 : Poly :=
[
  term ((11904 : Rat) / 7625) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 1873 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1873 : Poly :=
[
  term ((23808 : Rat) / 7625) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-11904 : Rat) / 7625) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1873 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1873_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1873
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1873 := by
  native_decide

/-- Coefficient term 1874 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1874 : Poly :=
[
  term ((-76704 : Rat) / 10675) [(4, 1), (11, 1), (13, 3)]
]

/-- Partial product 1874 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1874 : Poly :=
[
  term ((-153408 : Rat) / 10675) [(4, 1), (8, 1), (11, 1), (13, 3)],
  term ((76704 : Rat) / 10675) [(4, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1874 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1874_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1874
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1874 := by
  native_decide

/-- Coefficient term 1875 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1875 : Poly :=
[
  term ((12576 : Rat) / 10675) [(4, 1), (11, 2), (13, 2)]
]

/-- Partial product 1875 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1875 : Poly :=
[
  term ((25152 : Rat) / 10675) [(4, 1), (8, 1), (11, 2), (13, 2)],
  term ((-12576 : Rat) / 10675) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1875 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1875_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1875
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1875 := by
  native_decide

/-- Coefficient term 1876 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1876 : Poly :=
[
  term ((456816 : Rat) / 53375) [(4, 1), (12, 1), (13, 2)]
]

/-- Partial product 1876 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1876 : Poly :=
[
  term ((913632 : Rat) / 53375) [(4, 1), (8, 1), (12, 1), (13, 2)],
  term ((-456816 : Rat) / 53375) [(4, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1876 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1876_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1876
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1876 := by
  native_decide

/-- Coefficient term 1877 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1877 : Poly :=
[
  term ((-255516 : Rat) / 53375) [(4, 1), (13, 2)]
]

/-- Partial product 1877 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1877 : Poly :=
[
  term ((-511032 : Rat) / 53375) [(4, 1), (8, 1), (13, 2)],
  term ((255516 : Rat) / 53375) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1877 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1877_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1877
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1877 := by
  native_decide

/-- Coefficient term 1878 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1878 : Poly :=
[
  term (-3 : Rat) [(4, 1), (14, 1)]
]

/-- Partial product 1878 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1878 : Poly :=
[
  term (-6 : Rat) [(4, 1), (8, 1), (14, 1)],
  term (3 : Rat) [(4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1878 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1878_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1878
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1878 := by
  native_decide

/-- Coefficient term 1879 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1879 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1879 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1879 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1879 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1879_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1879
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1879 := by
  native_decide

/-- Coefficient term 1880 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1880 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 1880 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1880 : Poly :=
[
  term ((221184 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1880 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1880_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1880
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1880 := by
  native_decide

/-- Coefficient term 1881 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1881 : Poly :=
[
  term ((-2304 : Rat) / 1525) [(4, 2), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 1881 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1881 : Poly :=
[
  term ((-4608 : Rat) / 1525) [(4, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((2304 : Rat) / 1525) [(4, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1881 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1881_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1881
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1881 := by
  native_decide

/-- Coefficient term 1882 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1882 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1882 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1882 : Poly :=
[
  term ((663552 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1882 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1882_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1882
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1882 := by
  native_decide

/-- Coefficient term 1883 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1883 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 1883 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1883 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1883 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1883_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1883
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1883 := by
  native_decide

/-- Coefficient term 1884 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1884 : Poly :=
[
  term ((-142848 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1884 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1884 : Poly :=
[
  term ((-285696 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((142848 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1884 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1884_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1884
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1884 := by
  native_decide

/-- Coefficient term 1885 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1885 : Poly :=
[
  term ((16128 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1885 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1885 : Poly :=
[
  term ((32256 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-16128 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1885 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1885_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1885
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1885 := by
  native_decide

/-- Coefficient term 1886 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1886 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1886 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1886 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1886 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1886_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1886
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1886 := by
  native_decide

/-- Coefficient term 1887 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1887 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1887 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1887 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1887 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1887_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1887
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1887 := by
  native_decide

/-- Coefficient term 1888 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1888 : Poly :=
[
  term ((-110592 : Rat) / 1525) [(4, 2), (6, 1), (11, 1), (13, 3)]
]

/-- Partial product 1888 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1888 : Poly :=
[
  term ((-221184 : Rat) / 1525) [(4, 2), (6, 1), (8, 1), (11, 1), (13, 3)],
  term ((110592 : Rat) / 1525) [(4, 2), (6, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1888 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1888_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1888
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1888 := by
  native_decide

/-- Coefficient term 1889 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1889 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (11, 2), (13, 2)]
]

/-- Partial product 1889 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1889 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (11, 2), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1889 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1889_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1889
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1889 := by
  native_decide

/-- Coefficient term 1890 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1890 : Poly :=
[
  term ((258048 : Rat) / 7625) [(4, 2), (6, 1), (12, 1), (13, 2)]
]

/-- Partial product 1890 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1890 : Poly :=
[
  term ((516096 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (12, 1), (13, 2)],
  term ((-258048 : Rat) / 7625) [(4, 2), (6, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1890 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1890_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1890
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1890 := by
  native_decide

/-- Coefficient term 1891 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1891 : Poly :=
[
  term ((-186624 : Rat) / 7625) [(4, 2), (6, 1), (13, 2)]
]

/-- Partial product 1891 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1891 : Poly :=
[
  term ((-373248 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (13, 2)],
  term ((186624 : Rat) / 7625) [(4, 2), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1891 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1891_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1891
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1891 := by
  native_decide

/-- Coefficient term 1892 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1892 : Poly :=
[
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 1892 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1892 : Poly :=
[
  term ((221184 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-442368 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1892 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1892_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1892
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1892 := by
  native_decide

/-- Coefficient term 1893 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1893 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 2), (13, 1)]
]

/-- Partial product 1893 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1893 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1893 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1893_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1893
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1893 := by
  native_decide

/-- Coefficient term 1894 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1894 : Poly :=
[
  term ((142848 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1894 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1894 : Poly :=
[
  term ((-142848 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((285696 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1894 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1894_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1894
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1894 := by
  native_decide

/-- Coefficient term 1895 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1895 : Poly :=
[
  term ((-16128 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1895 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1895 : Poly :=
[
  term ((16128 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((-32256 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1895 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1895_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1895
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1895 := by
  native_decide

/-- Coefficient term 1896 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1896 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1896 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1896 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1896 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1896_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1896
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1896 := by
  native_decide

/-- Coefficient term 1897 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1897 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1897 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1897 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1897 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1897_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1897
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1897 := by
  native_decide

/-- Coefficient term 1898 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1898 : Poly :=
[
  term ((221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1898 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1898 : Poly :=
[
  term ((442368 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1898 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1898_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1898
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1898 := by
  native_decide

/-- Coefficient term 1899 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1899 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 1899 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1899 : Poly :=
[
  term ((221184 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1899 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1899_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1899
        rs_R003_ueqv_R003YY_generator_19_1800_1899 =
      rs_R003_ueqv_R003YY_partial_19_1899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_1800_1899 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_1800,
  rs_R003_ueqv_R003YY_partial_19_1801,
  rs_R003_ueqv_R003YY_partial_19_1802,
  rs_R003_ueqv_R003YY_partial_19_1803,
  rs_R003_ueqv_R003YY_partial_19_1804,
  rs_R003_ueqv_R003YY_partial_19_1805,
  rs_R003_ueqv_R003YY_partial_19_1806,
  rs_R003_ueqv_R003YY_partial_19_1807,
  rs_R003_ueqv_R003YY_partial_19_1808,
  rs_R003_ueqv_R003YY_partial_19_1809,
  rs_R003_ueqv_R003YY_partial_19_1810,
  rs_R003_ueqv_R003YY_partial_19_1811,
  rs_R003_ueqv_R003YY_partial_19_1812,
  rs_R003_ueqv_R003YY_partial_19_1813,
  rs_R003_ueqv_R003YY_partial_19_1814,
  rs_R003_ueqv_R003YY_partial_19_1815,
  rs_R003_ueqv_R003YY_partial_19_1816,
  rs_R003_ueqv_R003YY_partial_19_1817,
  rs_R003_ueqv_R003YY_partial_19_1818,
  rs_R003_ueqv_R003YY_partial_19_1819,
  rs_R003_ueqv_R003YY_partial_19_1820,
  rs_R003_ueqv_R003YY_partial_19_1821,
  rs_R003_ueqv_R003YY_partial_19_1822,
  rs_R003_ueqv_R003YY_partial_19_1823,
  rs_R003_ueqv_R003YY_partial_19_1824,
  rs_R003_ueqv_R003YY_partial_19_1825,
  rs_R003_ueqv_R003YY_partial_19_1826,
  rs_R003_ueqv_R003YY_partial_19_1827,
  rs_R003_ueqv_R003YY_partial_19_1828,
  rs_R003_ueqv_R003YY_partial_19_1829,
  rs_R003_ueqv_R003YY_partial_19_1830,
  rs_R003_ueqv_R003YY_partial_19_1831,
  rs_R003_ueqv_R003YY_partial_19_1832,
  rs_R003_ueqv_R003YY_partial_19_1833,
  rs_R003_ueqv_R003YY_partial_19_1834,
  rs_R003_ueqv_R003YY_partial_19_1835,
  rs_R003_ueqv_R003YY_partial_19_1836,
  rs_R003_ueqv_R003YY_partial_19_1837,
  rs_R003_ueqv_R003YY_partial_19_1838,
  rs_R003_ueqv_R003YY_partial_19_1839,
  rs_R003_ueqv_R003YY_partial_19_1840,
  rs_R003_ueqv_R003YY_partial_19_1841,
  rs_R003_ueqv_R003YY_partial_19_1842,
  rs_R003_ueqv_R003YY_partial_19_1843,
  rs_R003_ueqv_R003YY_partial_19_1844,
  rs_R003_ueqv_R003YY_partial_19_1845,
  rs_R003_ueqv_R003YY_partial_19_1846,
  rs_R003_ueqv_R003YY_partial_19_1847,
  rs_R003_ueqv_R003YY_partial_19_1848,
  rs_R003_ueqv_R003YY_partial_19_1849,
  rs_R003_ueqv_R003YY_partial_19_1850,
  rs_R003_ueqv_R003YY_partial_19_1851,
  rs_R003_ueqv_R003YY_partial_19_1852,
  rs_R003_ueqv_R003YY_partial_19_1853,
  rs_R003_ueqv_R003YY_partial_19_1854,
  rs_R003_ueqv_R003YY_partial_19_1855,
  rs_R003_ueqv_R003YY_partial_19_1856,
  rs_R003_ueqv_R003YY_partial_19_1857,
  rs_R003_ueqv_R003YY_partial_19_1858,
  rs_R003_ueqv_R003YY_partial_19_1859,
  rs_R003_ueqv_R003YY_partial_19_1860,
  rs_R003_ueqv_R003YY_partial_19_1861,
  rs_R003_ueqv_R003YY_partial_19_1862,
  rs_R003_ueqv_R003YY_partial_19_1863,
  rs_R003_ueqv_R003YY_partial_19_1864,
  rs_R003_ueqv_R003YY_partial_19_1865,
  rs_R003_ueqv_R003YY_partial_19_1866,
  rs_R003_ueqv_R003YY_partial_19_1867,
  rs_R003_ueqv_R003YY_partial_19_1868,
  rs_R003_ueqv_R003YY_partial_19_1869,
  rs_R003_ueqv_R003YY_partial_19_1870,
  rs_R003_ueqv_R003YY_partial_19_1871,
  rs_R003_ueqv_R003YY_partial_19_1872,
  rs_R003_ueqv_R003YY_partial_19_1873,
  rs_R003_ueqv_R003YY_partial_19_1874,
  rs_R003_ueqv_R003YY_partial_19_1875,
  rs_R003_ueqv_R003YY_partial_19_1876,
  rs_R003_ueqv_R003YY_partial_19_1877,
  rs_R003_ueqv_R003YY_partial_19_1878,
  rs_R003_ueqv_R003YY_partial_19_1879,
  rs_R003_ueqv_R003YY_partial_19_1880,
  rs_R003_ueqv_R003YY_partial_19_1881,
  rs_R003_ueqv_R003YY_partial_19_1882,
  rs_R003_ueqv_R003YY_partial_19_1883,
  rs_R003_ueqv_R003YY_partial_19_1884,
  rs_R003_ueqv_R003YY_partial_19_1885,
  rs_R003_ueqv_R003YY_partial_19_1886,
  rs_R003_ueqv_R003YY_partial_19_1887,
  rs_R003_ueqv_R003YY_partial_19_1888,
  rs_R003_ueqv_R003YY_partial_19_1889,
  rs_R003_ueqv_R003YY_partial_19_1890,
  rs_R003_ueqv_R003YY_partial_19_1891,
  rs_R003_ueqv_R003YY_partial_19_1892,
  rs_R003_ueqv_R003YY_partial_19_1893,
  rs_R003_ueqv_R003YY_partial_19_1894,
  rs_R003_ueqv_R003YY_partial_19_1895,
  rs_R003_ueqv_R003YY_partial_19_1896,
  rs_R003_ueqv_R003YY_partial_19_1897,
  rs_R003_ueqv_R003YY_partial_19_1898,
  rs_R003_ueqv_R003YY_partial_19_1899
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_1800_1899 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 2)],
  term ((571392 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 2)],
  term ((-479232 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((-479232 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 2)],
  term ((9216 : Rat) / 1525) [(4, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (12, 2), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (8, 1), (13, 3)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-285696 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)],
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 1), (5, 1), (11, 1), (13, 2)],
  term ((-4608 : Rat) / 1525) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 2), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (13, 3)],
  term ((-4992 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((9984 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-131664 : Rat) / 53375) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((2496 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-4992 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 2)],
  term ((65832 : Rat) / 53375) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-559872 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((4224 : Rat) / 427) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((276384 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-34896 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-347136 : Rat) / 53375) [(4, 1), (6, 1), (8, 1), (10, 1), (13, 2)],
  term ((2496 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((2016 : Rat) / 1525) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((613632 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 3)],
  term ((216192 : Rat) / 10675) [(4, 1), (6, 1), (8, 1), (11, 2), (13, 2)],
  term ((-85248 : Rat) / 2135) [(4, 1), (6, 1), (8, 1), (12, 1), (13, 2)],
  term ((1799664 : Rat) / 53375) [(4, 1), (6, 1), (8, 1), (13, 2)],
  term ((13824 : Rat) / 7625) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((279936 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-2112 : Rat) / 427) [(4, 1), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-138192 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((17448 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((173568 : Rat) / 53375) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((-1248 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1008 : Rat) / 1525) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-306816 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (13, 3)],
  term ((-108096 : Rat) / 10675) [(4, 1), (6, 1), (11, 2), (13, 2)],
  term ((42624 : Rat) / 2135) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((-899832 : Rat) / 53375) [(4, 1), (6, 1), (13, 2)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((19968 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((19968 : Rat) / 10675) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((22032 : Rat) / 7625) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((1827264 : Rat) / 53375) [(4, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((22032 : Rat) / 7625) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (7, 1), (8, 2), (10, 1), (13, 1)],
  term ((90624 : Rat) / 10675) [(4, 1), (7, 1), (8, 2), (11, 1), (13, 2)],
  term ((-4224 : Rat) / 427) [(4, 1), (7, 1), (8, 2), (11, 2), (13, 1)],
  term ((-276384 : Rat) / 10675) [(4, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((34896 : Rat) / 10675) [(4, 1), (7, 1), (8, 2), (13, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-6528 : Rat) / 2135) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((1056 : Rat) / 427) [(4, 1), (7, 1), (11, 2), (13, 1)],
  term ((268368 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-913632 : Rat) / 53375) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((-120732 : Rat) / 53375) [(4, 1), (7, 1), (13, 1)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (8, 2), (11, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((3744 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-6 : Rat) / 5) [(4, 1), (8, 1)],
  term ((-4224 : Rat) / 427) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-181824 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-423552 : Rat) / 53375) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((1056 : Rat) / 427) [(4, 1), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((306816 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((306816 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((55296 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-894672 : Rat) / 53375) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-42624 : Rat) / 2135) [(4, 1), (8, 1), (9, 1), (12, 2), (13, 1)],
  term ((74352 : Rat) / 53375) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-464256 : Rat) / 10675) [(4, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-464256 : Rat) / 10675) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((5808 : Rat) / 427) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-666768 : Rat) / 53375) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((-25152 : Rat) / 10675) [(4, 1), (8, 1), (10, 2), (13, 2)],
  term ((104208 : Rat) / 7625) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-163392 : Rat) / 10675) [(4, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((291216 : Rat) / 53375) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((380832 : Rat) / 53375) [(4, 1), (8, 1), (12, 1), (13, 2)],
  term ((-425568 : Rat) / 53375) [(4, 1), (8, 1), (13, 2)],
  term ((-24 : Rat) / 5) [(4, 1), (8, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 1), (8, 2)],
  term ((464256 : Rat) / 10675) [(4, 1), (8, 2), (9, 1), (11, 1), (13, 2)],
  term ((-1056 : Rat) / 427) [(4, 1), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((96096 : Rat) / 7625) [(4, 1), (8, 2), (10, 1), (13, 2)],
  term ((236448 : Rat) / 53375) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-49824 : Rat) / 10675) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((-306816 : Rat) / 10675) [(4, 1), (8, 2), (11, 1), (13, 3)],
  term ((50304 : Rat) / 10675) [(4, 1), (8, 2), (11, 2), (13, 2)],
  term ((42624 : Rat) / 2135) [(4, 1), (8, 2), (12, 1), (13, 2)],
  term ((-170928 : Rat) / 53375) [(4, 1), (8, 2), (13, 2)],
  term ((-12 : Rat) / 5) [(4, 1), (8, 2), (14, 1)],
  term ((2112 : Rat) / 427) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((90912 : Rat) / 10675) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((211776 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-528 : Rat) / 427) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((-153408 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-38496 : Rat) / 1525) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((-27648 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((447336 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((21312 : Rat) / 2135) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((-37176 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)],
  term ((232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((1248 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2640 : Rat) / 427) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((165216 : Rat) / 53375) [(4, 1), (10, 1), (13, 2)],
  term ((12576 : Rat) / 10675) [(4, 1), (10, 2), (13, 2)],
  term ((-84768 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((81696 : Rat) / 10675) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((-11904 : Rat) / 7625) [(4, 1), (11, 1), (13, 1)],
  term ((76704 : Rat) / 10675) [(4, 1), (11, 1), (13, 3)],
  term ((-12576 : Rat) / 10675) [(4, 1), (11, 2), (13, 2)],
  term ((-456816 : Rat) / 53375) [(4, 1), (12, 1), (13, 2)],
  term ((255516 : Rat) / 53375) [(4, 1), (13, 2)],
  term (3 : Rat) [(4, 1), (14, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-4608 : Rat) / 1525) [(4, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (11, 1), (13, 2)],
  term ((2304 : Rat) / 1525) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((663552 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-285696 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((32256 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-221184 : Rat) / 1525) [(4, 2), (6, 1), (8, 1), (11, 1), (13, 3)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (11, 2), (13, 2)],
  term ((516096 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (12, 1), (13, 2)],
  term ((-373248 : Rat) / 7625) [(4, 2), (6, 1), (8, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((142848 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-16128 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 1525) [(4, 2), (6, 1), (11, 1), (13, 3)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (11, 2), (13, 2)],
  term ((-258048 : Rat) / 7625) [(4, 2), (6, 1), (12, 1), (13, 2)],
  term ((186624 : Rat) / 7625) [(4, 2), (6, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((442368 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((442368 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-142848 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((16128 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((-442368 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (11, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (11, 2), (13, 1)],
  term ((285696 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-32256 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 1800 through 1899. -/
theorem rs_R003_ueqv_R003YY_block_19_1800_1899_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_1800_1899
      rs_R003_ueqv_R003YY_block_19_1800_1899 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
