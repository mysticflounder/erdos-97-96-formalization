/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 22:1800-1899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_22_1800_1899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1800 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1800 : Poly :=
[
  term ((-3180 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1800 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1800 : Poly :=
[
  term ((-6360 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((3180 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1800 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1800_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1800
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1800 := by
  native_decide

/-- Coefficient term 1801 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1801 : Poly :=
[
  term ((4608 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1801 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1801 : Poly :=
[
  term ((9216 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4608 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1801 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1801_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1801
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1801 := by
  native_decide

/-- Coefficient term 1802 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1802 : Poly :=
[
  term ((-1536 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1802 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1802 : Poly :=
[
  term ((-3072 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1802 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1802_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1802
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1802 := by
  native_decide

/-- Coefficient term 1803 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1803 : Poly :=
[
  term ((768 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1803 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1803 : Poly :=
[
  term ((1536 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-768 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1803 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1803_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1803
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1803 := by
  native_decide

/-- Coefficient term 1804 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1804 : Poly :=
[
  term ((-4608 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1804 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1804 : Poly :=
[
  term ((-9216 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4608 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1804 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1804_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1804
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1804 := by
  native_decide

/-- Coefficient term 1805 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1805 : Poly :=
[
  term ((1536 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1805 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1805 : Poly :=
[
  term ((3072 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1805 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1805_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1805
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1805 := by
  native_decide

/-- Coefficient term 1806 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1806 : Poly :=
[
  term ((-930 : Rat) / 7) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1806 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1806 : Poly :=
[
  term ((-1860 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((930 : Rat) / 7) [(8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1806 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1806_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1806
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1806 := by
  native_decide

/-- Coefficient term 1807 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1807 : Poly :=
[
  term ((1368 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1807 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1807 : Poly :=
[
  term ((2736 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1368 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1807 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1807_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1807
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1807 := by
  native_decide

/-- Coefficient term 1808 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1808 : Poly :=
[
  term ((-456 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1808 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1808 : Poly :=
[
  term ((-912 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1808 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1808_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1808
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1808 := by
  native_decide

/-- Coefficient term 1809 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1809 : Poly :=
[
  term ((228 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1809 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1809 : Poly :=
[
  term ((456 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1809 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1809_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1809
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1809 := by
  native_decide

/-- Coefficient term 1810 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1810 : Poly :=
[
  term ((-1368 : Rat) / 5) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1810 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1810 : Poly :=
[
  term ((-2736 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1368 : Rat) / 5) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1810 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1810_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1810
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1810 := by
  native_decide

/-- Coefficient term 1811 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1811 : Poly :=
[
  term ((456 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1811 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1811 : Poly :=
[
  term ((912 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1811 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1811_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1811
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1811 := by
  native_decide

/-- Coefficient term 1812 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1812 : Poly :=
[
  term ((276 : Rat) / 5) [(8, 1), (12, 1)]
]

/-- Partial product 1812 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1812 : Poly :=
[
  term ((552 : Rat) / 5) [(8, 1), (10, 1), (12, 1)],
  term ((-276 : Rat) / 5) [(8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1812 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1812_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1812
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1812 := by
  native_decide

/-- Coefficient term 1813 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1813 : Poly :=
[
  term ((-216 : Rat) / 5) [(8, 1), (12, 1), (14, 1)]
]

/-- Partial product 1813 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1813 : Poly :=
[
  term ((-432 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((216 : Rat) / 5) [(8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1813 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1813_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1813
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1813 := by
  native_decide

/-- Coefficient term 1814 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1814 : Poly :=
[
  term ((1872 : Rat) / 5) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1814 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1814 : Poly :=
[
  term ((3744 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1872 : Rat) / 5) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1814 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1814_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1814
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1814 := by
  native_decide

/-- Coefficient term 1815 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1815 : Poly :=
[
  term ((-624 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1815 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1815 : Poly :=
[
  term ((-1248 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1815 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1815_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1815
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1815 := by
  native_decide

/-- Coefficient term 1816 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1816 : Poly :=
[
  term (186 : Rat) [(8, 1), (13, 2)]
]

/-- Partial product 1816 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1816 : Poly :=
[
  term (372 : Rat) [(8, 1), (10, 1), (13, 2)],
  term (-186 : Rat) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1816 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1816_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1816
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1816 := by
  native_decide

/-- Coefficient term 1817 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1817 : Poly :=
[
  term ((-1872 : Rat) / 5) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 1817 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1817 : Poly :=
[
  term ((-3744 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((1872 : Rat) / 5) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1817 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1817_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1817
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1817 := by
  native_decide

/-- Coefficient term 1818 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1818 : Poly :=
[
  term ((624 : Rat) / 5) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1818 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1818 : Poly :=
[
  term ((1248 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1818 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1818_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1818
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1818 := by
  native_decide

/-- Coefficient term 1819 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1819 : Poly :=
[
  term ((-312 : Rat) / 5) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 1819 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1819 : Poly :=
[
  term ((-624 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((312 : Rat) / 5) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1819 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1819_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1819
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1819 := by
  native_decide

/-- Coefficient term 1820 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1820 : Poly :=
[
  term ((162 : Rat) / 5) [(8, 1), (14, 1)]
]

/-- Partial product 1820 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1820 : Poly :=
[
  term ((324 : Rat) / 5) [(8, 1), (10, 1), (14, 1)],
  term ((-162 : Rat) / 5) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1820 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1820_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1820
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1820 := by
  native_decide

/-- Coefficient term 1821 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1821 : Poly :=
[
  term ((288 : Rat) / 7) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 1821 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1821 : Poly :=
[
  term ((576 : Rat) / 7) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-288 : Rat) / 7) [(8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1821 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1821_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1821
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1821 := by
  native_decide

/-- Coefficient term 1822 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1822 : Poly :=
[
  term ((-432 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1822 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1822 : Poly :=
[
  term ((-864 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((432 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1822 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1822_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1822
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1822 := by
  native_decide

/-- Coefficient term 1823 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1823 : Poly :=
[
  term ((144 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1823 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1823 : Poly :=
[
  term ((288 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1823 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1823_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1823
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1823 := by
  native_decide

/-- Coefficient term 1824 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1824 : Poly :=
[
  term ((-72 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1824 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1824 : Poly :=
[
  term ((-144 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1824 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1824_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1824
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1824 := by
  native_decide

/-- Coefficient term 1825 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1825 : Poly :=
[
  term ((432 : Rat) / 5) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 1825 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1825 : Poly :=
[
  term ((864 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-432 : Rat) / 5) [(8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1825 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1825_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1825
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1825 := by
  native_decide

/-- Coefficient term 1826 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1826 : Poly :=
[
  term ((-144 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1826 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1826 : Poly :=
[
  term ((-288 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1826 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1826_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1826
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1826 := by
  native_decide

/-- Coefficient term 1827 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1827 : Poly :=
[
  term ((-864 : Rat) / 5) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 1827 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1827 : Poly :=
[
  term ((-1728 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((864 : Rat) / 5) [(8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1827 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1827_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1827
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1827 := by
  native_decide

/-- Coefficient term 1828 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1828 : Poly :=
[
  term ((288 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1828 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1828 : Poly :=
[
  term ((576 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1828 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1828_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1828
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1828 := by
  native_decide

/-- Coefficient term 1829 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1829 : Poly :=
[
  term ((-576 : Rat) / 7) [(8, 2), (13, 2)]
]

/-- Partial product 1829 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1829 : Poly :=
[
  term ((-1152 : Rat) / 7) [(8, 2), (10, 1), (13, 2)],
  term ((576 : Rat) / 7) [(8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1829 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1829_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1829
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1829 := by
  native_decide

/-- Coefficient term 1830 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1830 : Poly :=
[
  term ((864 : Rat) / 5) [(8, 2), (13, 2), (14, 1)]
]

/-- Partial product 1830 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1830 : Poly :=
[
  term ((1728 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(8, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1830 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1830_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1830
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1830 := by
  native_decide

/-- Coefficient term 1831 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1831 : Poly :=
[
  term ((-288 : Rat) / 5) [(8, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1831 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1831 : Poly :=
[
  term ((-576 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(8, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1831 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1831_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1831
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1831 := by
  native_decide

/-- Coefficient term 1832 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1832 : Poly :=
[
  term ((144 : Rat) / 5) [(8, 2), (13, 2), (16, 1)]
]

/-- Partial product 1832 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1832 : Poly :=
[
  term ((288 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1832 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1832_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1832
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1832 := by
  native_decide

/-- Coefficient term 1833 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1833 : Poly :=
[
  term ((6624 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1833 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1833 : Poly :=
[
  term ((-6624 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((13248 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1833 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1833_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1833
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1833 := by
  native_decide

/-- Coefficient term 1834 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1834 : Poly :=
[
  term ((-2208 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1834 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1834 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1834 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1834_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1834
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1834 := by
  native_decide

/-- Coefficient term 1835 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1835 : Poly :=
[
  term ((3144 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2)]
]

/-- Partial product 1835 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1835 : Poly :=
[
  term ((-3144 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((6288 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1835 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1835_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1835
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1835 := by
  native_decide

/-- Coefficient term 1836 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1836 : Poly :=
[
  term ((-6624 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1836 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1836 : Poly :=
[
  term ((6624 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((-13248 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1836 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1836_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1836
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1836 := by
  native_decide

/-- Coefficient term 1837 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1837 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1837 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1837 : Poly :=
[
  term ((-2208 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1837 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1837_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1837
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1837 := by
  native_decide

/-- Coefficient term 1838 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1838 : Poly :=
[
  term ((-1104 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1838 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1838 : Poly :=
[
  term ((1104 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1838 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1838_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1838
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1838 := by
  native_decide

/-- Coefficient term 1839 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1839 : Poly :=
[
  term ((6564 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1839 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1839 : Poly :=
[
  term ((-6564 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((13128 : Rat) / 35) [(9, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1839 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1839_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1839
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1839 := by
  native_decide

/-- Coefficient term 1840 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1840 : Poly :=
[
  term ((-1872 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1840 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1840 : Poly :=
[
  term ((1872 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3744 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1840 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1840_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1840
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1840 := by
  native_decide

/-- Coefficient term 1841 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1841 : Poly :=
[
  term ((624 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1841 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1841 : Poly :=
[
  term ((-624 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1841 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1841_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1841
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1841 := by
  native_decide

/-- Coefficient term 1842 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1842 : Poly :=
[
  term ((-312 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1842 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1842 : Poly :=
[
  term ((312 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1842 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1842_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1842
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1842 := by
  native_decide

/-- Coefficient term 1843 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1843 : Poly :=
[
  term ((1872 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1843 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1843 : Poly :=
[
  term ((-1872 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3744 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1843 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1843_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1843
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1843 := by
  native_decide

/-- Coefficient term 1844 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1844 : Poly :=
[
  term ((-624 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1844 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1844 : Poly :=
[
  term ((624 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1844 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1844_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1844
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1844 := by
  native_decide

/-- Coefficient term 1845 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1845 : Poly :=
[
  term ((-4812 : Rat) / 35) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1845 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1845 : Poly :=
[
  term ((4812 : Rat) / 35) [(9, 1), (10, 1), (13, 1)],
  term ((-9624 : Rat) / 35) [(9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1845 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1845_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1845
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1845 := by
  native_decide

/-- Coefficient term 1846 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1846 : Poly :=
[
  term ((1368 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1846 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1846 : Poly :=
[
  term ((-1368 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((2736 : Rat) / 5) [(9, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1846 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1846_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1846
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1846 := by
  native_decide

/-- Coefficient term 1847 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1847 : Poly :=
[
  term ((-456 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1847 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1847 : Poly :=
[
  term ((456 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 5) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1847 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1847_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1847
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1847 := by
  native_decide

/-- Coefficient term 1848 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1848 : Poly :=
[
  term ((228 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1848 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1848 : Poly :=
[
  term ((-228 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 5) [(9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1848 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1848_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1848
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1848 := by
  native_decide

/-- Coefficient term 1849 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1849 : Poly :=
[
  term ((-5184 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 1849 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1849 : Poly :=
[
  term ((5184 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-10368 : Rat) / 5) [(9, 1), (10, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1849 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1849_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1849
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1849 := by
  native_decide

/-- Coefficient term 1850 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1850 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1850 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1850 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1850 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1850_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1850
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1850 := by
  native_decide

/-- Coefficient term 1851 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1851 : Poly :=
[
  term ((-3456 : Rat) / 7) [(9, 1), (10, 1), (13, 3)]
]

/-- Partial product 1851 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1851 : Poly :=
[
  term ((3456 : Rat) / 7) [(9, 1), (10, 1), (13, 3)],
  term ((-6912 : Rat) / 7) [(9, 1), (10, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1851 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1851_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1851
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1851 := by
  native_decide

/-- Coefficient term 1852 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1852 : Poly :=
[
  term ((5184 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1)]
]

/-- Partial product 1852 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1852 : Poly :=
[
  term ((-5184 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (10, 2), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1852 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1852_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1852
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1852 := by
  native_decide

/-- Coefficient term 1853 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1853 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1853 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1853 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (10, 2), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1853 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1853_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1853
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1853 := by
  native_decide

/-- Coefficient term 1854 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1854 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 1854 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1854 : Poly :=
[
  term ((-864 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (10, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1854 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1854_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1854
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1854 := by
  native_decide

/-- Coefficient term 1855 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1855 : Poly :=
[
  term ((-1368 : Rat) / 5) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1855 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1855 : Poly :=
[
  term ((1368 : Rat) / 5) [(9, 1), (10, 1), (15, 1)],
  term ((-2736 : Rat) / 5) [(9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1855 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1855_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1855
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1855 := by
  native_decide

/-- Coefficient term 1856 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1856 : Poly :=
[
  term ((456 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1856 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1856 : Poly :=
[
  term ((-456 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 5) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1856 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1856_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1856
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1856 := by
  native_decide

/-- Coefficient term 1857 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1857 : Poly :=
[
  term ((5184 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1857 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1857 : Poly :=
[
  term ((10368 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5184 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1857 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1857_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1857
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1857 := by
  native_decide

/-- Coefficient term 1858 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1858 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1858 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1858 : Poly :=
[
  term ((-3456 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1858 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1858_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1858
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1858 := by
  native_decide

/-- Coefficient term 1859 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1859 : Poly :=
[
  term ((3456 : Rat) / 7) [(9, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1859 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1859 : Poly :=
[
  term ((6912 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-3456 : Rat) / 7) [(9, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1859 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1859_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1859
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1859 := by
  native_decide

/-- Coefficient term 1860 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1860 : Poly :=
[
  term ((-5184 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1860 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1860 : Poly :=
[
  term ((-10368 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((5184 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1860 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1860_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1860
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1860 := by
  native_decide

/-- Coefficient term 1861 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1861 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1861 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1861 : Poly :=
[
  term ((3456 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1861 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1861_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1861
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1861 := by
  native_decide

/-- Coefficient term 1862 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1862 : Poly :=
[
  term ((-864 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1862 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1862 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1862 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1862_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1862
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1862 := by
  native_decide

/-- Coefficient term 1863 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1863 : Poly :=
[
  term ((8496 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1863 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1863 : Poly :=
[
  term ((16992 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8496 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1863 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1863_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1863
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1863 := by
  native_decide

/-- Coefficient term 1864 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1864 : Poly :=
[
  term ((-2832 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1864 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1864 : Poly :=
[
  term ((-5664 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2832 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1864 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1864_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1864
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1864 := by
  native_decide

/-- Coefficient term 1865 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1865 : Poly :=
[
  term ((28428 : Rat) / 35) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1865 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1865 : Poly :=
[
  term ((56856 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-28428 : Rat) / 35) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1865 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1865_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1865
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1865 := by
  native_decide

/-- Coefficient term 1866 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1866 : Poly :=
[
  term ((-8496 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1866 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1866 : Poly :=
[
  term ((-16992 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((8496 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1866 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1866_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1866
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1866 := by
  native_decide

/-- Coefficient term 1867 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1867 : Poly :=
[
  term ((2832 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1867 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1867 : Poly :=
[
  term ((5664 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2832 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1867 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1867_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1867
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1867 := by
  native_decide

/-- Coefficient term 1868 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1868 : Poly :=
[
  term ((-1416 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1868 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1868 : Poly :=
[
  term ((-2832 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1416 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1868 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1868_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1868
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1868 := by
  native_decide

/-- Coefficient term 1869 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1869 : Poly :=
[
  term ((-3144 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

/-- Partial product 1869 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1869 : Poly :=
[
  term ((-6288 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((3144 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1869 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1869_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1869
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1869 := by
  native_decide

/-- Coefficient term 1870 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1870 : Poly :=
[
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1870 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1870 : Poly :=
[
  term ((13248 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1870 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1870_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1870
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1870 := by
  native_decide

/-- Coefficient term 1871 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1871 : Poly :=
[
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1871 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1871 : Poly :=
[
  term ((-4416 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1871 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1871_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1871
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1871 := by
  native_decide

/-- Coefficient term 1872 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1872 : Poly :=
[
  term ((1104 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1872 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1872 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1872 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1872_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1872
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1872 := by
  native_decide

/-- Coefficient term 1873 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1873 : Poly :=
[
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 1873 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1873 : Poly :=
[
  term ((-13248 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1873 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1873_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1873
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1873 := by
  native_decide

/-- Coefficient term 1874 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1874 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1874 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1874 : Poly :=
[
  term ((4416 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1874 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1874_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1874
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1874 := by
  native_decide

/-- Coefficient term 1875 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1875 : Poly :=
[
  term ((-3144 : Rat) / 5) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 1875 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1875 : Poly :=
[
  term ((-6288 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((3144 : Rat) / 5) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1875 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1875_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1875
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1875 := by
  native_decide

/-- Coefficient term 1876 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1876 : Poly :=
[
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 1876 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1876 : Poly :=
[
  term ((13248 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1876 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1876_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1876
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1876 := by
  native_decide

/-- Coefficient term 1877 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1877 : Poly :=
[
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1877 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1877 : Poly :=
[
  term ((-4416 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1877 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1877_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1877
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1877 := by
  native_decide

/-- Coefficient term 1878 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1878 : Poly :=
[
  term ((1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1878 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1878 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1878 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1878_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1878
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1878 := by
  native_decide

/-- Coefficient term 1879 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1879 : Poly :=
[
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 1879 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1879 : Poly :=
[
  term ((-13248 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1879 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1879_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1879
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1879 := by
  native_decide

/-- Coefficient term 1880 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1880 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1880 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1880 : Poly :=
[
  term ((4416 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1880 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1880_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1880
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1880 := by
  native_decide

/-- Coefficient term 1881 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1881 : Poly :=
[
  term ((768 : Rat) / 7) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1881 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1881 : Poly :=
[
  term ((1536 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-768 : Rat) / 7) [(9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1881 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1881_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1881
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1881 := by
  native_decide

/-- Coefficient term 1882 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1882 : Poly :=
[
  term ((-1152 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1882 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1882 : Poly :=
[
  term ((-2304 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1882 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1882_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1882
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1882 := by
  native_decide

/-- Coefficient term 1883 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1883 : Poly :=
[
  term ((384 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1883 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1883 : Poly :=
[
  term ((768 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1883 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1883_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1883
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1883 := by
  native_decide

/-- Coefficient term 1884 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1884 : Poly :=
[
  term ((-192 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1884 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1884 : Poly :=
[
  term ((-384 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((192 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1884 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1884_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1884
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1884 := by
  native_decide

/-- Coefficient term 1885 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1885 : Poly :=
[
  term ((1152 : Rat) / 5) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1885 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1885 : Poly :=
[
  term ((2304 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1885 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1885_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1885
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1885 := by
  native_decide

/-- Coefficient term 1886 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1886 : Poly :=
[
  term ((-384 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1886 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1886 : Poly :=
[
  term ((-768 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1886 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1886_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1886
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1886 := by
  native_decide

/-- Coefficient term 1887 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1887 : Poly :=
[
  term ((-1728 : Rat) / 7) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1887 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1887 : Poly :=
[
  term ((-3456 : Rat) / 7) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((1728 : Rat) / 7) [(9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1887 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1887_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1887
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1887 := by
  native_decide

/-- Coefficient term 1888 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1888 : Poly :=
[
  term ((2592 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1888 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1888 : Poly :=
[
  term ((5184 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2592 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1888 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1888_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1888
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1888 := by
  native_decide

/-- Coefficient term 1889 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1889 : Poly :=
[
  term ((-864 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1889 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1889 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1889 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1889_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1889
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1889 := by
  native_decide

/-- Coefficient term 1890 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1890 : Poly :=
[
  term ((432 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1890 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1890 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1890 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1890_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1890
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1890 := by
  native_decide

/-- Coefficient term 1891 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1891 : Poly :=
[
  term ((-2592 : Rat) / 5) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1891 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1891 : Poly :=
[
  term ((-5184 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((2592 : Rat) / 5) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1891 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1891_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1891
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1891 := by
  native_decide

/-- Coefficient term 1892 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1892 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1892 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1892 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1892 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1892_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1892
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1892 := by
  native_decide

/-- Coefficient term 1893 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1893 : Poly :=
[
  term ((-7074 : Rat) / 35) [(9, 1), (13, 1)]
]

/-- Partial product 1893 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1893 : Poly :=
[
  term ((-14148 : Rat) / 35) [(9, 1), (10, 1), (13, 1)],
  term ((7074 : Rat) / 35) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1893 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1893_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1893
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1893 := by
  native_decide

/-- Coefficient term 1894 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1894 : Poly :=
[
  term ((2052 : Rat) / 5) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1894 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1894 : Poly :=
[
  term ((4104 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2052 : Rat) / 5) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1894 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1894_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1894
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1894 := by
  native_decide

/-- Coefficient term 1895 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1895 : Poly :=
[
  term ((-684 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1895 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1895 : Poly :=
[
  term ((-1368 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((684 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1895 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1895_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1895
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1895 := by
  native_decide

/-- Coefficient term 1896 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1896 : Poly :=
[
  term ((342 : Rat) / 5) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1896 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1896 : Poly :=
[
  term ((684 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 5) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1896 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1896_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1896
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1896 := by
  native_decide

/-- Coefficient term 1897 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1897 : Poly :=
[
  term ((-2592 : Rat) / 5) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 1897 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1897 : Poly :=
[
  term ((-5184 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((2592 : Rat) / 5) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1897 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1897_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1897
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1897 := by
  native_decide

/-- Coefficient term 1898 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1898 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1898 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1898 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1898 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1898_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1898
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1898 := by
  native_decide

/-- Coefficient term 1899 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1899 : Poly :=
[
  term ((-1728 : Rat) / 7) [(9, 1), (13, 3)]
]

/-- Partial product 1899 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1899 : Poly :=
[
  term ((-3456 : Rat) / 7) [(9, 1), (10, 1), (13, 3)],
  term ((1728 : Rat) / 7) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1899 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1899_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1899
        rs_R006_ueqv_R006_generator_22_1800_1899 =
      rs_R006_ueqv_R006_partial_22_1899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_22_1800_1899 : List Poly :=
[
  rs_R006_ueqv_R006_partial_22_1800,
  rs_R006_ueqv_R006_partial_22_1801,
  rs_R006_ueqv_R006_partial_22_1802,
  rs_R006_ueqv_R006_partial_22_1803,
  rs_R006_ueqv_R006_partial_22_1804,
  rs_R006_ueqv_R006_partial_22_1805,
  rs_R006_ueqv_R006_partial_22_1806,
  rs_R006_ueqv_R006_partial_22_1807,
  rs_R006_ueqv_R006_partial_22_1808,
  rs_R006_ueqv_R006_partial_22_1809,
  rs_R006_ueqv_R006_partial_22_1810,
  rs_R006_ueqv_R006_partial_22_1811,
  rs_R006_ueqv_R006_partial_22_1812,
  rs_R006_ueqv_R006_partial_22_1813,
  rs_R006_ueqv_R006_partial_22_1814,
  rs_R006_ueqv_R006_partial_22_1815,
  rs_R006_ueqv_R006_partial_22_1816,
  rs_R006_ueqv_R006_partial_22_1817,
  rs_R006_ueqv_R006_partial_22_1818,
  rs_R006_ueqv_R006_partial_22_1819,
  rs_R006_ueqv_R006_partial_22_1820,
  rs_R006_ueqv_R006_partial_22_1821,
  rs_R006_ueqv_R006_partial_22_1822,
  rs_R006_ueqv_R006_partial_22_1823,
  rs_R006_ueqv_R006_partial_22_1824,
  rs_R006_ueqv_R006_partial_22_1825,
  rs_R006_ueqv_R006_partial_22_1826,
  rs_R006_ueqv_R006_partial_22_1827,
  rs_R006_ueqv_R006_partial_22_1828,
  rs_R006_ueqv_R006_partial_22_1829,
  rs_R006_ueqv_R006_partial_22_1830,
  rs_R006_ueqv_R006_partial_22_1831,
  rs_R006_ueqv_R006_partial_22_1832,
  rs_R006_ueqv_R006_partial_22_1833,
  rs_R006_ueqv_R006_partial_22_1834,
  rs_R006_ueqv_R006_partial_22_1835,
  rs_R006_ueqv_R006_partial_22_1836,
  rs_R006_ueqv_R006_partial_22_1837,
  rs_R006_ueqv_R006_partial_22_1838,
  rs_R006_ueqv_R006_partial_22_1839,
  rs_R006_ueqv_R006_partial_22_1840,
  rs_R006_ueqv_R006_partial_22_1841,
  rs_R006_ueqv_R006_partial_22_1842,
  rs_R006_ueqv_R006_partial_22_1843,
  rs_R006_ueqv_R006_partial_22_1844,
  rs_R006_ueqv_R006_partial_22_1845,
  rs_R006_ueqv_R006_partial_22_1846,
  rs_R006_ueqv_R006_partial_22_1847,
  rs_R006_ueqv_R006_partial_22_1848,
  rs_R006_ueqv_R006_partial_22_1849,
  rs_R006_ueqv_R006_partial_22_1850,
  rs_R006_ueqv_R006_partial_22_1851,
  rs_R006_ueqv_R006_partial_22_1852,
  rs_R006_ueqv_R006_partial_22_1853,
  rs_R006_ueqv_R006_partial_22_1854,
  rs_R006_ueqv_R006_partial_22_1855,
  rs_R006_ueqv_R006_partial_22_1856,
  rs_R006_ueqv_R006_partial_22_1857,
  rs_R006_ueqv_R006_partial_22_1858,
  rs_R006_ueqv_R006_partial_22_1859,
  rs_R006_ueqv_R006_partial_22_1860,
  rs_R006_ueqv_R006_partial_22_1861,
  rs_R006_ueqv_R006_partial_22_1862,
  rs_R006_ueqv_R006_partial_22_1863,
  rs_R006_ueqv_R006_partial_22_1864,
  rs_R006_ueqv_R006_partial_22_1865,
  rs_R006_ueqv_R006_partial_22_1866,
  rs_R006_ueqv_R006_partial_22_1867,
  rs_R006_ueqv_R006_partial_22_1868,
  rs_R006_ueqv_R006_partial_22_1869,
  rs_R006_ueqv_R006_partial_22_1870,
  rs_R006_ueqv_R006_partial_22_1871,
  rs_R006_ueqv_R006_partial_22_1872,
  rs_R006_ueqv_R006_partial_22_1873,
  rs_R006_ueqv_R006_partial_22_1874,
  rs_R006_ueqv_R006_partial_22_1875,
  rs_R006_ueqv_R006_partial_22_1876,
  rs_R006_ueqv_R006_partial_22_1877,
  rs_R006_ueqv_R006_partial_22_1878,
  rs_R006_ueqv_R006_partial_22_1879,
  rs_R006_ueqv_R006_partial_22_1880,
  rs_R006_ueqv_R006_partial_22_1881,
  rs_R006_ueqv_R006_partial_22_1882,
  rs_R006_ueqv_R006_partial_22_1883,
  rs_R006_ueqv_R006_partial_22_1884,
  rs_R006_ueqv_R006_partial_22_1885,
  rs_R006_ueqv_R006_partial_22_1886,
  rs_R006_ueqv_R006_partial_22_1887,
  rs_R006_ueqv_R006_partial_22_1888,
  rs_R006_ueqv_R006_partial_22_1889,
  rs_R006_ueqv_R006_partial_22_1890,
  rs_R006_ueqv_R006_partial_22_1891,
  rs_R006_ueqv_R006_partial_22_1892,
  rs_R006_ueqv_R006_partial_22_1893,
  rs_R006_ueqv_R006_partial_22_1894,
  rs_R006_ueqv_R006_partial_22_1895,
  rs_R006_ueqv_R006_partial_22_1896,
  rs_R006_ueqv_R006_partial_22_1897,
  rs_R006_ueqv_R006_partial_22_1898,
  rs_R006_ueqv_R006_partial_22_1899
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_22_1800_1899 : Poly :=
[
  term ((-6360 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((9216 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9216 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3072 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1860 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((2736 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-912 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2736 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((912 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((552 : Rat) / 5) [(8, 1), (10, 1), (12, 1)],
  term ((-432 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((3744 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1248 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (372 : Rat) [(8, 1), (10, 1), (13, 2)],
  term ((-3744 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((1248 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((324 : Rat) / 5) [(8, 1), (10, 1), (14, 1)],
  term ((3180 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4608 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-768 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4608 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1536 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((930 : Rat) / 7) [(8, 1), (11, 1), (13, 1)],
  term ((-1368 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((456 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1368 : Rat) / 5) [(8, 1), (11, 1), (15, 1)],
  term ((-456 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-276 : Rat) / 5) [(8, 1), (12, 1)],
  term ((216 : Rat) / 5) [(8, 1), (12, 1), (14, 1)],
  term ((-1872 : Rat) / 5) [(8, 1), (13, 1), (15, 1)],
  term ((624 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-186 : Rat) [(8, 1), (13, 2)],
  term ((1872 : Rat) / 5) [(8, 1), (13, 2), (14, 1)],
  term ((-624 : Rat) / 5) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((312 : Rat) / 5) [(8, 1), (13, 2), (16, 1)],
  term ((-162 : Rat) / 5) [(8, 1), (14, 1)],
  term ((576 : Rat) / 7) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((576 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(8, 2), (10, 1), (13, 2)],
  term ((1728 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (14, 1)],
  term ((-576 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 7) [(8, 2), (11, 1), (13, 1)],
  term ((432 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(8, 2), (11, 1), (15, 1)],
  term ((144 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(8, 2), (13, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 7) [(8, 2), (13, 2)],
  term ((-864 : Rat) / 5) [(8, 2), (13, 2), (14, 1)],
  term ((288 : Rat) / 5) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(8, 2), (13, 2), (16, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-10368 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34848 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-10368 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6288 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((13248 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-4416 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-13248 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((4416 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6288 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((13248 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-4416 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-13248 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((4416 : Rat) / 5) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((1116 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((432 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 7) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((5184 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-5184 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9336 : Rat) / 35) [(9, 1), (10, 1), (13, 1)],
  term ((2736 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-912 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-5184 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((1368 : Rat) / 5) [(9, 1), (10, 1), (15, 1)],
  term ((-456 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((13248 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-4416 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6288 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-13248 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 2), (14, 1)],
  term ((4416 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((13128 : Rat) / 35) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-3744 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((1248 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((3744 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1248 : Rat) / 5) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-9624 : Rat) / 35) [(9, 1), (10, 2), (13, 1)],
  term ((2736 : Rat) / 5) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-912 : Rat) / 5) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 5) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-10368 : Rat) / 5) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 7) [(9, 1), (10, 2), (13, 3)],
  term ((10368 : Rat) / 5) [(9, 1), (10, 2), (13, 3), (14, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (10, 2), (13, 3), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (10, 2), (13, 3), (16, 1)],
  term ((-2736 : Rat) / 5) [(9, 1), (10, 2), (15, 1)],
  term ((912 : Rat) / 5) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5184 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 7) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((5184 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-8496 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2832 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28428 : Rat) / 35) [(9, 1), (11, 1), (13, 2)],
  term ((8496 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2832 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1416 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3144 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3144 : Rat) / 5) [(9, 1), (11, 2), (13, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (15, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(9, 1), (12, 1), (13, 1)],
  term ((1152 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(9, 1), (12, 1), (15, 1)],
  term ((384 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 7) [(9, 1), (12, 2), (13, 1)],
  term ((-2592 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((2592 : Rat) / 5) [(9, 1), (12, 2), (15, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((7074 : Rat) / 35) [(9, 1), (13, 1)],
  term ((-2052 : Rat) / 5) [(9, 1), (13, 1), (14, 1)],
  term ((684 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-342 : Rat) / 5) [(9, 1), (13, 1), (16, 1)],
  term ((2592 : Rat) / 5) [(9, 1), (13, 2), (15, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 7) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 1800 through 1899. -/
theorem rs_R006_ueqv_R006_block_22_1800_1899_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_22_1800_1899
      rs_R006_ueqv_R006_block_22_1800_1899 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
