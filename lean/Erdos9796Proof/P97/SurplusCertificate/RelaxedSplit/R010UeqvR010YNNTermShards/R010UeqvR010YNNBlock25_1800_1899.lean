/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1800-1899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1800_1899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1800 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1800 : Poly :=
[
  term ((93049594667529003376 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 1800 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1800 : Poly :=
[
  term ((186099189335058006752 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-93049594667529003376 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1800 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1800_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1800
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1800 := by
  native_decide

/-- Coefficient term 1801 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1801 : Poly :=
[
  term ((52581272452920583636 : Rat) / 449152207880882925) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1801 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1801 : Poly :=
[
  term ((105162544905841167272 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-52581272452920583636 : Rat) / 449152207880882925) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1801 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1801_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1801
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1801 := by
  native_decide

/-- Coefficient term 1802 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1802 : Poly :=
[
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

/-- Partial product 1802 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1802 : Poly :=
[
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1802 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1802_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1802
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1802 := by
  native_decide

/-- Coefficient term 1803 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1803 : Poly :=
[
  term ((-909351836121283148 : Rat) / 449152207880882925) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 1803 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1803 : Poly :=
[
  term ((-1818703672242566296 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((909351836121283148 : Rat) / 449152207880882925) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1803 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1803_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1803
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1803 := by
  native_decide

/-- Coefficient term 1804 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1804 : Poly :=
[
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1804 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1804 : Poly :=
[
  term ((-941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1883716768673689600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1804 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1804_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1804
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1804 := by
  native_decide

/-- Coefficient term 1805 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1805 : Poly :=
[
  term ((320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1805 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1805 : Poly :=
[
  term ((-320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1805 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1805_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1805
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1805 := by
  native_decide

/-- Coefficient term 1806 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1806 : Poly :=
[
  term ((-941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1806 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1806 : Poly :=
[
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1806 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1806_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1806
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1806 := by
  native_decide

/-- Coefficient term 1807 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1807 : Poly :=
[
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1807 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1807 : Poly :=
[
  term ((-941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1807 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1807_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1807
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1807 := by
  native_decide

/-- Coefficient term 1808 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1808 : Poly :=
[
  term ((-45042065313943040 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1808 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1808 : Poly :=
[
  term ((-90084130627886080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((45042065313943040 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1808 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1808_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1808
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1808 := by
  native_decide

/-- Coefficient term 1809 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1809 : Poly :=
[
  term ((470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1809 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1809 : Poly :=
[
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1809 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1809_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1809
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1809 := by
  native_decide

/-- Coefficient term 1810 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1810 : Poly :=
[
  term ((-589532560834631680 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1810 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1810 : Poly :=
[
  term ((-1179065121669263360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((589532560834631680 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1810 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1810_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1810
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1810 := by
  native_decide

/-- Coefficient term 1811 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1811 : Poly :=
[
  term ((407171093581226569888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1811 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1811 : Poly :=
[
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((814342187162453139776 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1811 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1811_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1811
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1811 := by
  native_decide

/-- Coefficient term 1812 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1812 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1812 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1812 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((2526408031189360640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1812 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1812_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1812
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1812 := by
  native_decide

/-- Coefficient term 1813 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1813 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1813 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1813 : Poly :=
[
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1813 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1813_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1813
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1813 := by
  native_decide

/-- Coefficient term 1814 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1814 : Poly :=
[
  term ((-3663969131659011672992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1814 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1814 : Poly :=
[
  term ((-7327938263318023345984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3663969131659011672992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1814 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1814_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1814
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1814 := by
  native_decide

/-- Coefficient term 1815 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1815 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1815 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1815 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1815 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1815_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1815
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1815 := by
  native_decide

/-- Coefficient term 1816 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1816 : Poly :=
[
  term ((-203710773525846436944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1816 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1816 : Poly :=
[
  term ((-407421547051692873888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((203710773525846436944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1816 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1816_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1816
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1816 := by
  native_decide

/-- Coefficient term 1817 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1817 : Poly :=
[
  term ((97657527005857280 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1817 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1817 : Poly :=
[
  term ((195315054011714560 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97657527005857280 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1817 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1817_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1817
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1817 := by
  native_decide

/-- Coefficient term 1818 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1818 : Poly :=
[
  term ((3675241127242748952992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1818 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1818 : Poly :=
[
  term ((7350482254485497905984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3675241127242748952992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1818 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1818_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1818
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1818 := by
  native_decide

/-- Coefficient term 1819 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1819 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 1819 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1819 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1819 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1819_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1819
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1819 := by
  native_decide

/-- Coefficient term 1820 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1820 : Poly :=
[
  term ((-4361182190848000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 1820 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1820 : Poly :=
[
  term ((-8722364381696000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((4361182190848000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1820 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1820_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1820
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1820 := by
  native_decide

/-- Coefficient term 1821 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1821 : Poly :=
[
  term ((-320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 1821 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1821 : Poly :=
[
  term ((-640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1821 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1821_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1821
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1821 := by
  native_decide

/-- Coefficient term 1822 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1822 : Poly :=
[
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 1822 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1822 : Poly :=
[
  term ((1281686367819397120 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1822 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1822_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1822
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1822 := by
  native_decide

/-- Coefficient term 1823 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1823 : Poly :=
[
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1823 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1823 : Poly :=
[
  term ((2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4218386204988354560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1823 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1823_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1823
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1823 := by
  native_decide

/-- Coefficient term 1824 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1824 : Poly :=
[
  term ((3612996787429120 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1824 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1824 : Poly :=
[
  term ((-3612996787429120 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((7225993574858240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1824 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1824_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1824
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1824 := by
  native_decide

/-- Coefficient term 1825 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1825 : Poly :=
[
  term ((2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1825 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1825 : Poly :=
[
  term ((4218386204988354560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1825 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1825_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1825
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1825 := by
  native_decide

/-- Coefficient term 1826 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1826 : Poly :=
[
  term ((538482007287311360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1826 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1826 : Poly :=
[
  term ((1076964014574622720 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-538482007287311360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1826 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1826_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1826
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1826 := by
  native_decide

/-- Coefficient term 1827 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1827 : Poly :=
[
  term ((-203101344198415428944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1827 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1827 : Poly :=
[
  term ((-406202688396830857888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((203101344198415428944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1827 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1827_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1827
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1827 := by
  native_decide

/-- Coefficient term 1828 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1828 : Poly :=
[
  term ((-172038181319925760 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 1828 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1828 : Poly :=
[
  term ((-344076362639851520 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((172038181319925760 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1828 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1828_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1828
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1828 := by
  native_decide

/-- Coefficient term 1829 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1829 : Poly :=
[
  term ((-1054596551247088640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1829 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1829 : Poly :=
[
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1054596551247088640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1829 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1829_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1829
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1829 := by
  native_decide

/-- Coefficient term 1830 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1830 : Poly :=
[
  term ((-920659558410521958248 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1830 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1830 : Poly :=
[
  term ((-1841319116821043916496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((920659558410521958248 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1830 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1830_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1830
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1830 := by
  native_decide

/-- Coefficient term 1831 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1831 : Poly :=
[
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1831 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1831 : Poly :=
[
  term ((1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3485147990512599040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1831 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1831_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1831
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1831 := by
  native_decide

/-- Coefficient term 1832 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1832 : Poly :=
[
  term ((1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1832 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1832 : Poly :=
[
  term ((3485147990512599040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1832 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1832_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1832
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1832 := by
  native_decide

/-- Coefficient term 1833 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1833 : Poly :=
[
  term ((871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1833 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1833 : Poly :=
[
  term ((1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1833 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1833_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1833
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1833 := by
  native_decide

/-- Coefficient term 1834 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1834 : Poly :=
[
  term ((-871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1834 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1834 : Poly :=
[
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1834 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1834_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1834
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1834 := by
  native_decide

/-- Coefficient term 1835 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1835 : Poly :=
[
  term ((1229281208468658333664 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1835 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1835 : Poly :=
[
  term ((-1229281208468658333664 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((2458562416937316667328 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1835 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1835_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1835
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1835 := by
  native_decide

/-- Coefficient term 1836 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1836 : Poly :=
[
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1836 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1836 : Poly :=
[
  term ((7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-14721319569703890531968 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1836 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1836_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1836
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1836 := by
  native_decide

/-- Coefficient term 1837 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1837 : Poly :=
[
  term ((7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1837 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1837 : Poly :=
[
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1837 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1837_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1837
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1837 := by
  native_decide

/-- Coefficient term 1838 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1838 : Poly :=
[
  term ((-624892477834514670832 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1838 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1838 : Poly :=
[
  term ((-1249784955669029341664 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((624892477834514670832 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1838 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1838_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1838
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1838 := by
  native_decide

/-- Coefficient term 1839 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1839 : Poly :=
[
  term ((-14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1839 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1839 : Poly :=
[
  term ((-29193871439452160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1839 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1839_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1839
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1839 := by
  native_decide

/-- Coefficient term 1840 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1840 : Poly :=
[
  term ((3680062701937548696992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1840 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1840 : Poly :=
[
  term ((7360125403875097393984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3680062701937548696992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1840 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1840_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1840
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1840 := by
  native_decide

/-- Coefficient term 1841 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1841 : Poly :=
[
  term ((-296173026504164567416 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 1841 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1841 : Poly :=
[
  term ((-592346053008329134832 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((296173026504164567416 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1841 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1841_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1841
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1841 := by
  native_decide

/-- Coefficient term 1842 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1842 : Poly :=
[
  term ((-14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1842 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1842 : Poly :=
[
  term ((-29193871439452160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1842 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1842_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1842
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1842 := by
  native_decide

/-- Coefficient term 1843 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1843 : Poly :=
[
  term ((-271421613594290502592 : Rat) / 149717402626960975) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1843 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1843 : Poly :=
[
  term ((-542843227188581005184 : Rat) / 149717402626960975) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((271421613594290502592 : Rat) / 149717402626960975) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1843 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1843_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1843
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1843 := by
  native_decide

/-- Coefficient term 1844 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1844 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1844 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1844 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1844 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1844_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1844
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1844 := by
  native_decide

/-- Coefficient term 1845 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1845 : Poly :=
[
  term ((97938030109327602472 : Rat) / 449152207880882925) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1845 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1845 : Poly :=
[
  term ((195876060218655204944 : Rat) / 449152207880882925) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-97938030109327602472 : Rat) / 449152207880882925) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1845 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1845_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1845
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1845 := by
  native_decide

/-- Coefficient term 1846 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1846 : Poly :=
[
  term ((-3680329892425972632992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 1846 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1846 : Poly :=
[
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((3680329892425972632992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1846 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1846_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1846
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1846 := by
  native_decide

/-- Coefficient term 1847 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1847 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1847 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1847 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1847 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1847_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1847
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1847 := by
  native_decide

/-- Coefficient term 1848 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1848 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1848 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1848 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1848 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1848_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1848
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1848 := by
  native_decide

/-- Coefficient term 1849 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1849 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1849 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1849 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1849 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1849_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1849
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1849 := by
  native_decide

/-- Coefficient term 1850 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1850 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1850 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1850 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1850 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1850_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1850
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1850 := by
  native_decide

/-- Coefficient term 1851 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1851 : Poly :=
[
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1851 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1851 : Poly :=
[
  term ((4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1851 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1851_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1851
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1851 := by
  native_decide

/-- Coefficient term 1852 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1852 : Poly :=
[
  term ((4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1852 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1852 : Poly :=
[
  term ((8881762891094589440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1852 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1852_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1852
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1852 := by
  native_decide

/-- Coefficient term 1853 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1853 : Poly :=
[
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1853 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1853 : Poly :=
[
  term ((4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1853 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1853_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1853
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1853 := by
  native_decide

/-- Coefficient term 1854 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1854 : Poly :=
[
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1854 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1854 : Poly :=
[
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1854 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1854_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1854
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1854 := by
  native_decide

/-- Coefficient term 1855 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1855 : Poly :=
[
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1855 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1855 : Poly :=
[
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1855 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1855_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1855
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1855 := by
  native_decide

/-- Coefficient term 1856 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1856 : Poly :=
[
  term ((123557074143068160 : Rat) / 5988696105078439) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 1856 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1856 : Poly :=
[
  term ((247114148286136320 : Rat) / 5988696105078439) [(5, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-123557074143068160 : Rat) / 5988696105078439) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1856 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1856_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1856
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1856 := by
  native_decide

/-- Coefficient term 1857 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1857 : Poly :=
[
  term ((54549886889308160 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (16, 1)]
]

/-- Partial product 1857 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1857 : Poly :=
[
  term ((109099773778616320 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (12, 1), (16, 1)],
  term ((-54549886889308160 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1857 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1857_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1857
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1857 := by
  native_decide

/-- Coefficient term 1858 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1858 : Poly :=
[
  term ((2287294229561958400 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1858 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1858 : Poly :=
[
  term ((-2287294229561958400 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4574588459123916800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1858 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1858_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1858
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1858 := by
  native_decide

/-- Coefficient term 1859 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1859 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1859 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1859 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1859 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1859_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1859
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1859 := by
  native_decide

/-- Coefficient term 1860 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1860 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1860 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1860 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1860 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1860_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1860
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1860 := by
  native_decide

/-- Coefficient term 1861 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1861 : Poly :=
[
  term ((-783615383638528000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1861 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1861 : Poly :=
[
  term ((-1567230767277056000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((783615383638528000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1861 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1861_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1861
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1861 := by
  native_decide

/-- Coefficient term 1862 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1862 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1862 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1862 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1862 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1862_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1862
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1862 := by
  native_decide

/-- Coefficient term 1863 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1863 : Poly :=
[
  term ((-391807691819264000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1863 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1863 : Poly :=
[
  term ((-783615383638528000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((391807691819264000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1863 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1863_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1863
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1863 := by
  native_decide

/-- Coefficient term 1864 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1864 : Poly :=
[
  term ((254207685414502400 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1864 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1864 : Poly :=
[
  term ((508415370829004800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1864 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1864_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1864
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1864 := by
  native_decide

/-- Coefficient term 1865 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1865 : Poly :=
[
  term ((391807691819264000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1865 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1865 : Poly :=
[
  term ((783615383638528000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-391807691819264000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1865 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1865_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1865
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1865 := by
  native_decide

/-- Coefficient term 1866 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1866 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1866 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1866 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1866 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1866_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1866
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1866 := by
  native_decide

/-- Coefficient term 1867 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1867 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1867 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1867 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1867 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1867_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1867
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1867 := by
  native_decide

/-- Coefficient term 1868 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1868 : Poly :=
[
  term ((31775960676812800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (16, 1)]
]

/-- Partial product 1868 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1868 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (12, 1), (16, 1)],
  term ((-31775960676812800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1868 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1868_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1868
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1868 := by
  native_decide

/-- Coefficient term 1869 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1869 : Poly :=
[
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1869 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1869 : Poly :=
[
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((5730985049653821440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1869 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1869_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1869
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1869 := by
  native_decide

/-- Coefficient term 1870 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1870 : Poly :=
[
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1870 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1870 : Poly :=
[
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1870 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1870_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1870
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1870 := by
  native_decide

/-- Coefficient term 1871 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1871 : Poly :=
[
  term ((-882442180061818880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1871 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1871 : Poly :=
[
  term ((-1764884360123637760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((882442180061818880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1871 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1871_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1871
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1871 := by
  native_decide

/-- Coefficient term 1872 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1872 : Poly :=
[
  term ((-114115033455073280 : Rat) / 17966088315235317) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 1872 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1872 : Poly :=
[
  term ((-228230066910146560 : Rat) / 17966088315235317) [(5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((114115033455073280 : Rat) / 17966088315235317) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1872 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1872_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1872
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1872 := by
  native_decide

/-- Coefficient term 1873 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1873 : Poly :=
[
  term ((61144898039070720 : Rat) / 5988696105078439) [(5, 1), (9, 3), (14, 2), (16, 1)]
]

/-- Partial product 1873 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1873 : Poly :=
[
  term ((122289796078141440 : Rat) / 5988696105078439) [(5, 1), (9, 3), (12, 1), (14, 2), (16, 1)],
  term ((-61144898039070720 : Rat) / 5988696105078439) [(5, 1), (9, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1873 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1873_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1873
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1873 := by
  native_decide

/-- Coefficient term 1874 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1874 : Poly :=
[
  term ((1432746262413455360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 1874 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1874 : Poly :=
[
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1874 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1874_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1874
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1874 := by
  native_decide

/-- Coefficient term 1875 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1875 : Poly :=
[
  term ((10866389439969280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 1875 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1875 : Poly :=
[
  term ((21732778879938560 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (16, 1)],
  term ((-10866389439969280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1875 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1875_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1875
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1875 := by
  native_decide

/-- Coefficient term 1876 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1876 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1876 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1876 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1876 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1876_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1876
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1876 := by
  native_decide

/-- Coefficient term 1877 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1877 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1877 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1877 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1877 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1877_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1877
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1877 := by
  native_decide

/-- Coefficient term 1878 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1878 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1878 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1878 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1878 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1878_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1878
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1878 := by
  native_decide

/-- Coefficient term 1879 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1879 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1879 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1879 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1879 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1879_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1879
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1879 := by
  native_decide

/-- Coefficient term 1880 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1880 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1880 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1880 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1880 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1880_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1880
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1880 := by
  native_decide

/-- Coefficient term 1881 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1881 : Poly :=
[
  term ((-358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (16, 1)]
]

/-- Partial product 1881 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1881 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (12, 1), (16, 1)],
  term ((358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1881 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1881_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1881
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1881 := by
  native_decide

/-- Coefficient term 1882 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1882 : Poly :=
[
  term ((1435727629753876480 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1882 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1882 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1882 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1882_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1882
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1882 := by
  native_decide

/-- Coefficient term 1883 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1883 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1883 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1883 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (15, 3), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1883 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1883_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1883
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1883 := by
  native_decide

/-- Coefficient term 1884 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1884 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1884 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1884 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1884 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1884_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1884
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1884 := by
  native_decide

/-- Coefficient term 1885 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1885 : Poly :=
[
  term ((-717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1885 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1885 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1885 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1885_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1885
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1885 := by
  native_decide

/-- Coefficient term 1886 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1886 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1886 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1886 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1886 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1886_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1886
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1886 := by
  native_decide

/-- Coefficient term 1887 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1887 : Poly :=
[
  term ((-358931907438469120 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (16, 1)]
]

/-- Partial product 1887 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1887 : Poly :=
[
  term ((-717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (13, 1), (16, 1)],
  term ((358931907438469120 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1887 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1887_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1887
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1887 := by
  native_decide

/-- Coefficient term 1888 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1888 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 53898264945705951) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1888 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1888 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 53898264945705951) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1888 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1888_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1888
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1888 := by
  native_decide

/-- Coefficient term 1889 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1889 : Poly :=
[
  term ((358931907438469120 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 1889 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1889 : Poly :=
[
  term ((717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((-358931907438469120 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1889 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1889_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1889
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1889 := by
  native_decide

/-- Coefficient term 1890 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1890 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 3), (16, 1)]
]

/-- Partial product 1890 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1890 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (15, 3), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1890 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1890_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1890
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1890 := by
  native_decide

/-- Coefficient term 1891 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1891 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1891 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1891 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1891 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1891_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1891
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1891 := by
  native_decide

/-- Coefficient term 1892 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1892 : Poly :=
[
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1892 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1892 : Poly :=
[
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1892 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1892_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1892
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1892 := by
  native_decide

/-- Coefficient term 1893 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1893 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1893 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1893 : Poly :=
[
  term ((2586005023494621440 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1893 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1893_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1893
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1893 := by
  native_decide

/-- Coefficient term 1894 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1894 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1894 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1894 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1894 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1894_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1894
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1894 := by
  native_decide

/-- Coefficient term 1895 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1895 : Poly :=
[
  term ((-35887880868423776368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1895 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1895 : Poly :=
[
  term ((-71775761736847552736 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((35887880868423776368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1895 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1895_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1895
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1895 := by
  native_decide

/-- Coefficient term 1896 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1896 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1896 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1896 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1896 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1896_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1896
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1896 := by
  native_decide

/-- Coefficient term 1897 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1897 : Poly :=
[
  term ((18421755208681225816 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1897 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1897 : Poly :=
[
  term ((36843510417362451632 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-18421755208681225816 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1897 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1897_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1897
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1897 := by
  native_decide

/-- Coefficient term 1898 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1898 : Poly :=
[
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1898 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1898 : Poly :=
[
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1898 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1898_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1898
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1898 := by
  native_decide

/-- Coefficient term 1899 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1899 : Poly :=
[
  term ((-1779695905393332237874 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1899 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1899 : Poly :=
[
  term ((-3559391810786664475748 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1779695905393332237874 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1899 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1899_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1899
        rs_R010_ueqv_R010YNN_generator_25_1800_1899 =
      rs_R010_ueqv_R010YNN_partial_25_1899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1800_1899 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1800,
  rs_R010_ueqv_R010YNN_partial_25_1801,
  rs_R010_ueqv_R010YNN_partial_25_1802,
  rs_R010_ueqv_R010YNN_partial_25_1803,
  rs_R010_ueqv_R010YNN_partial_25_1804,
  rs_R010_ueqv_R010YNN_partial_25_1805,
  rs_R010_ueqv_R010YNN_partial_25_1806,
  rs_R010_ueqv_R010YNN_partial_25_1807,
  rs_R010_ueqv_R010YNN_partial_25_1808,
  rs_R010_ueqv_R010YNN_partial_25_1809,
  rs_R010_ueqv_R010YNN_partial_25_1810,
  rs_R010_ueqv_R010YNN_partial_25_1811,
  rs_R010_ueqv_R010YNN_partial_25_1812,
  rs_R010_ueqv_R010YNN_partial_25_1813,
  rs_R010_ueqv_R010YNN_partial_25_1814,
  rs_R010_ueqv_R010YNN_partial_25_1815,
  rs_R010_ueqv_R010YNN_partial_25_1816,
  rs_R010_ueqv_R010YNN_partial_25_1817,
  rs_R010_ueqv_R010YNN_partial_25_1818,
  rs_R010_ueqv_R010YNN_partial_25_1819,
  rs_R010_ueqv_R010YNN_partial_25_1820,
  rs_R010_ueqv_R010YNN_partial_25_1821,
  rs_R010_ueqv_R010YNN_partial_25_1822,
  rs_R010_ueqv_R010YNN_partial_25_1823,
  rs_R010_ueqv_R010YNN_partial_25_1824,
  rs_R010_ueqv_R010YNN_partial_25_1825,
  rs_R010_ueqv_R010YNN_partial_25_1826,
  rs_R010_ueqv_R010YNN_partial_25_1827,
  rs_R010_ueqv_R010YNN_partial_25_1828,
  rs_R010_ueqv_R010YNN_partial_25_1829,
  rs_R010_ueqv_R010YNN_partial_25_1830,
  rs_R010_ueqv_R010YNN_partial_25_1831,
  rs_R010_ueqv_R010YNN_partial_25_1832,
  rs_R010_ueqv_R010YNN_partial_25_1833,
  rs_R010_ueqv_R010YNN_partial_25_1834,
  rs_R010_ueqv_R010YNN_partial_25_1835,
  rs_R010_ueqv_R010YNN_partial_25_1836,
  rs_R010_ueqv_R010YNN_partial_25_1837,
  rs_R010_ueqv_R010YNN_partial_25_1838,
  rs_R010_ueqv_R010YNN_partial_25_1839,
  rs_R010_ueqv_R010YNN_partial_25_1840,
  rs_R010_ueqv_R010YNN_partial_25_1841,
  rs_R010_ueqv_R010YNN_partial_25_1842,
  rs_R010_ueqv_R010YNN_partial_25_1843,
  rs_R010_ueqv_R010YNN_partial_25_1844,
  rs_R010_ueqv_R010YNN_partial_25_1845,
  rs_R010_ueqv_R010YNN_partial_25_1846,
  rs_R010_ueqv_R010YNN_partial_25_1847,
  rs_R010_ueqv_R010YNN_partial_25_1848,
  rs_R010_ueqv_R010YNN_partial_25_1849,
  rs_R010_ueqv_R010YNN_partial_25_1850,
  rs_R010_ueqv_R010YNN_partial_25_1851,
  rs_R010_ueqv_R010YNN_partial_25_1852,
  rs_R010_ueqv_R010YNN_partial_25_1853,
  rs_R010_ueqv_R010YNN_partial_25_1854,
  rs_R010_ueqv_R010YNN_partial_25_1855,
  rs_R010_ueqv_R010YNN_partial_25_1856,
  rs_R010_ueqv_R010YNN_partial_25_1857,
  rs_R010_ueqv_R010YNN_partial_25_1858,
  rs_R010_ueqv_R010YNN_partial_25_1859,
  rs_R010_ueqv_R010YNN_partial_25_1860,
  rs_R010_ueqv_R010YNN_partial_25_1861,
  rs_R010_ueqv_R010YNN_partial_25_1862,
  rs_R010_ueqv_R010YNN_partial_25_1863,
  rs_R010_ueqv_R010YNN_partial_25_1864,
  rs_R010_ueqv_R010YNN_partial_25_1865,
  rs_R010_ueqv_R010YNN_partial_25_1866,
  rs_R010_ueqv_R010YNN_partial_25_1867,
  rs_R010_ueqv_R010YNN_partial_25_1868,
  rs_R010_ueqv_R010YNN_partial_25_1869,
  rs_R010_ueqv_R010YNN_partial_25_1870,
  rs_R010_ueqv_R010YNN_partial_25_1871,
  rs_R010_ueqv_R010YNN_partial_25_1872,
  rs_R010_ueqv_R010YNN_partial_25_1873,
  rs_R010_ueqv_R010YNN_partial_25_1874,
  rs_R010_ueqv_R010YNN_partial_25_1875,
  rs_R010_ueqv_R010YNN_partial_25_1876,
  rs_R010_ueqv_R010YNN_partial_25_1877,
  rs_R010_ueqv_R010YNN_partial_25_1878,
  rs_R010_ueqv_R010YNN_partial_25_1879,
  rs_R010_ueqv_R010YNN_partial_25_1880,
  rs_R010_ueqv_R010YNN_partial_25_1881,
  rs_R010_ueqv_R010YNN_partial_25_1882,
  rs_R010_ueqv_R010YNN_partial_25_1883,
  rs_R010_ueqv_R010YNN_partial_25_1884,
  rs_R010_ueqv_R010YNN_partial_25_1885,
  rs_R010_ueqv_R010YNN_partial_25_1886,
  rs_R010_ueqv_R010YNN_partial_25_1887,
  rs_R010_ueqv_R010YNN_partial_25_1888,
  rs_R010_ueqv_R010YNN_partial_25_1889,
  rs_R010_ueqv_R010YNN_partial_25_1890,
  rs_R010_ueqv_R010YNN_partial_25_1891,
  rs_R010_ueqv_R010YNN_partial_25_1892,
  rs_R010_ueqv_R010YNN_partial_25_1893,
  rs_R010_ueqv_R010YNN_partial_25_1894,
  rs_R010_ueqv_R010YNN_partial_25_1895,
  rs_R010_ueqv_R010YNN_partial_25_1896,
  rs_R010_ueqv_R010YNN_partial_25_1897,
  rs_R010_ueqv_R010YNN_partial_25_1898,
  rs_R010_ueqv_R010YNN_partial_25_1899
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1800_1899 : Poly :=
[
  term ((186099189335058006752 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((105162544905841167272 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1818703672242566296 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-93049594667529003376 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-52581272452920583636 : Rat) / 449152207880882925) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((909351836121283148 : Rat) / 449152207880882925) [(5, 1), (9, 1), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90084130627886080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-499828904541370880 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1883716768673689600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((45042065313943040 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((589532560834631680 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7327938263318023345984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-407421547051692873888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((195315054011714560 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3685942412254458776992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((814342187162453139776 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((2526408031189360640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 3), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3663969131659011672992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((203710773525846436944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-97657527005857280 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3675241127242748952992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((-8722364381696000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((4361182190848000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((1281686367819397120 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1076964014574622720 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-406202688396830857888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-344076362639851520 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1841590091580101100496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-4218386204988354560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((7225993574858240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-538482007287311360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((203101344198415428944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((172038181319925760 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((1054596551247088640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((920659558410521958248 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-3485147990512599040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1249784955669029341664 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29193871439452160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((7360125403875097393984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-592346053008329134832 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-29193871439452160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-542843227188581005184 : Rat) / 149717402626960975) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-641653027812692718832 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((2458562416937316667328 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-14721319569703890531968 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((624892477834514670832 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-3680062701937548696992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((296173026504164567416 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((271421613594290502592 : Rat) / 149717402626960975) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-97938030109327602472 : Rat) / 449152207880882925) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((3680329892425972632992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((247114148286136320 : Rat) / 5988696105078439) [(5, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)],
  term ((-123557074143068160 : Rat) / 5988696105078439) [(5, 1), (9, 3), (10, 1), (16, 1)],
  term ((109099773778616320 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (12, 1), (16, 1)],
  term ((-54549886889308160 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1567230767277056000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-783615383638528000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4574588459123916800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((783615383638528000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((391807691819264000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-391807691819264000 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 3), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (12, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (14, 1), (16, 1)],
  term ((-31775960676812800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1764884360123637760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228230066910146560 : Rat) / 17966088315235317) [(5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((122289796078141440 : Rat) / 5988696105078439) [(5, 1), (9, 3), (12, 1), (14, 2), (16, 1)],
  term ((21732778879938560 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (16, 1)],
  term ((5730985049653821440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((882442180061818880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((114115033455073280 : Rat) / 17966088315235317) [(5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-61144898039070720 : Rat) / 5988696105078439) [(5, 1), (9, 3), (14, 2), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-10866389439969280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (12, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (14, 1), (16, 1)],
  term ((358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1435727629753876480 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (13, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 2), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 2), (15, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((358931907438469120 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 53898264945705951) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((-358931907438469120 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 3), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71775761736847552736 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3446829836753511272 : Rat) / 149717402626960975) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35887880868423776368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-18421755208681225816 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3559391810786664475748 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1779695905393332237874 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1800 through 1899. -/
theorem rs_R010_ueqv_R010YNN_block_25_1800_1899_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1800_1899
      rs_R010_ueqv_R010YNN_block_25_1800_1899 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
