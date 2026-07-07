/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:1900-1999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_1900_1999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1900 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1900 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (7, 1), (11, 2), (13, 1)]
]

/-- Partial product 1900 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1900 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1900 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1900_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1900
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1900 := by
  native_decide

/-- Coefficient term 1901 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1901 : Poly :=
[
  term ((50688 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1901 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1901 : Poly :=
[
  term ((101376 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-50688 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1901 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1901_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1901
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1901 := by
  native_decide

/-- Coefficient term 1902 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1902 : Poly :=
[
  term ((-156672 : Rat) / 7625) [(4, 2), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1902 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1902 : Poly :=
[
  term ((-313344 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((156672 : Rat) / 7625) [(4, 2), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1902 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1902_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1902
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1902 := by
  native_decide

/-- Coefficient term 1903 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1903 : Poly :=
[
  term ((-1152 : Rat) / 305) [(4, 2), (7, 1), (13, 1)]
]

/-- Partial product 1903 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1903 : Poly :=
[
  term ((-2304 : Rat) / 305) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((1152 : Rat) / 305) [(4, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1903 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1903_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1903
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1903 := by
  native_decide

/-- Coefficient term 1904 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1904 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1904 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1904 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1904 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1904_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1904
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1904 := by
  native_decide

/-- Coefficient term 1905 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1905 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1905 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1905 : Poly :=
[
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1905 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1905_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1905
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1905 := by
  native_decide

/-- Coefficient term 1906 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1906 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 1906 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1906 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1906 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1906_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1906
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1906 := by
  native_decide

/-- Coefficient term 1907 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1907 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1907 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1907 : Poly :=
[
  term ((165888 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 2), (8, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1907 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1907_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1907
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1907 := by
  native_decide

/-- Coefficient term 1908 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1908 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1908 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1908 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (8, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1908 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1908_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1908
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1908 := by
  native_decide

/-- Coefficient term 1909 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1909 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (13, 2)]
]

/-- Partial product 1909 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1909 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1909 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1909_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1909
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1909 := by
  native_decide

/-- Coefficient term 1910 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1910 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1910 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1910 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1910 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1910_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1910
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1910 := by
  native_decide

/-- Coefficient term 1911 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1911 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1911 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1911 : Poly :=
[
  term ((41472 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 2), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1911 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1911_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1911
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1911 := by
  native_decide

/-- Coefficient term 1912 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1912 : Poly :=
[
  term ((55296 : Rat) / 1525) [(4, 2), (8, 1), (11, 1), (13, 3)]
]

/-- Partial product 1912 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1912 : Poly :=
[
  term ((-55296 : Rat) / 1525) [(4, 2), (8, 1), (11, 1), (13, 3)],
  term ((110592 : Rat) / 1525) [(4, 2), (8, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1912 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1912_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1912
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1912 := by
  native_decide

/-- Coefficient term 1913 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1913 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 1), (11, 2), (13, 2)]
]

/-- Partial product 1913 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1913 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (8, 1), (11, 2), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 2), (8, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1913 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1913_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1913
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1913 := by
  native_decide

/-- Coefficient term 1914 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1914 : Poly :=
[
  term ((-129024 : Rat) / 7625) [(4, 2), (8, 1), (12, 1), (13, 2)]
]

/-- Partial product 1914 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1914 : Poly :=
[
  term ((129024 : Rat) / 7625) [(4, 2), (8, 1), (12, 1), (13, 2)],
  term ((-258048 : Rat) / 7625) [(4, 2), (8, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1914 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1914_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1914
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1914 := by
  native_decide

/-- Coefficient term 1915 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1915 : Poly :=
[
  term ((48384 : Rat) / 7625) [(4, 2), (8, 1), (13, 2)]
]

/-- Partial product 1915 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1915 : Poly :=
[
  term ((-48384 : Rat) / 7625) [(4, 2), (8, 1), (13, 2)],
  term ((96768 : Rat) / 7625) [(4, 2), (8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1915 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1915_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1915
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1915 := by
  native_decide

/-- Coefficient term 1916 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1916 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (11, 1), (13, 2)]
]

/-- Partial product 1916 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1916 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1916 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1916_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1916
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1916 := by
  native_decide

/-- Coefficient term 1917 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1917 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1917 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1917 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1917 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1917_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1917
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1917 := by
  native_decide

/-- Coefficient term 1918 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1918 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1918 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1918 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1918 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1918_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1918
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1918 := by
  native_decide

/-- Coefficient term 1919 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1919 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 2), (13, 1)]
]

/-- Partial product 1919 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1919 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1919 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1919_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1919
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1919 := by
  native_decide

/-- Coefficient term 1920 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1920 : Poly :=
[
  term ((-55296 : Rat) / 1525) [(4, 2), (9, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1920 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1920 : Poly :=
[
  term ((-110592 : Rat) / 1525) [(4, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((55296 : Rat) / 1525) [(4, 2), (9, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1920 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1920_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1920
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1920 := by
  native_decide

/-- Coefficient term 1921 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1921 : Poly :=
[
  term ((-359424 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1921 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1921 : Poly :=
[
  term ((-718848 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((359424 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1921 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1921_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1921
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1921 := by
  native_decide

/-- Coefficient term 1922 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1922 : Poly :=
[
  term ((16128 : Rat) / 1525) [(4, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1922 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1922 : Poly :=
[
  term ((32256 : Rat) / 1525) [(4, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-16128 : Rat) / 1525) [(4, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1922 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1922_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1922
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1922 := by
  native_decide

/-- Coefficient term 1923 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1923 : Poly :=
[
  term ((129024 : Rat) / 7625) [(4, 2), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1923 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1923 : Poly :=
[
  term ((258048 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-129024 : Rat) / 7625) [(4, 2), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1923 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1923_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1923
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1923 := by
  native_decide

/-- Coefficient term 1924 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1924 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)]
]

/-- Partial product 1924 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1924 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1924 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1924_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1924
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1924 := by
  native_decide

/-- Coefficient term 1925 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1925 : Poly :=
[
  term ((165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1925 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1925 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1925 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1925_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1925
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1925 := by
  native_decide

/-- Coefficient term 1926 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1926 : Poly :=
[
  term ((165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 1926 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1926 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 2), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1926 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1926_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1926
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1926 := by
  native_decide

/-- Coefficient term 1927 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1927 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1927 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1927 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1927 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1927_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1927
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1927 := by
  native_decide

/-- Coefficient term 1928 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1928 : Poly :=
[
  term ((-13824 : Rat) / 1525) [(4, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1928 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1928 : Poly :=
[
  term ((-27648 : Rat) / 1525) [(4, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((13824 : Rat) / 1525) [(4, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1928 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1928_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1928
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1928 := by
  native_decide

/-- Coefficient term 1929 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1929 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)]
]

/-- Partial product 1929 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1929 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1929 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1929_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1929
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1929 := by
  native_decide

/-- Coefficient term 1930 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1930 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (10, 2), (13, 2)]
]

/-- Partial product 1930 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1930 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (8, 1), (10, 2), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1930 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1930_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1930
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1930 := by
  native_decide

/-- Coefficient term 1931 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1931 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1931 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1931 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1931 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1931_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1931
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1931 := by
  native_decide

/-- Coefficient term 1932 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1932 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1932 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1932 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1932 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1932_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1932
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1932 := by
  native_decide

/-- Coefficient term 1933 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1933 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (11, 1), (13, 1)]
]

/-- Partial product 1933 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1933 : Poly :=
[
  term ((221184 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1933 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1933_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1933
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1933 := by
  native_decide

/-- Coefficient term 1934 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1934 : Poly :=
[
  term ((27648 : Rat) / 1525) [(4, 2), (11, 1), (13, 3)]
]

/-- Partial product 1934 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1934 : Poly :=
[
  term ((55296 : Rat) / 1525) [(4, 2), (8, 1), (11, 1), (13, 3)],
  term ((-27648 : Rat) / 1525) [(4, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1934 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1934_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1934
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1934 := by
  native_decide

/-- Coefficient term 1935 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1935 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (11, 2), (13, 2)]
]

/-- Partial product 1935 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1935 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 1), (11, 2), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1935 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1935_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1935
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1935 := by
  native_decide

/-- Coefficient term 1936 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1936 : Poly :=
[
  term ((-78336 : Rat) / 7625) [(4, 2), (12, 1), (13, 2)]
]

/-- Partial product 1936 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1936 : Poly :=
[
  term ((-156672 : Rat) / 7625) [(4, 2), (8, 1), (12, 1), (13, 2)],
  term ((78336 : Rat) / 7625) [(4, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1936 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1936_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1936
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1936 := by
  native_decide

/-- Coefficient term 1937 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1937 : Poly :=
[
  term ((10368 : Rat) / 7625) [(4, 2), (13, 2)]
]

/-- Partial product 1937 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1937 : Poly :=
[
  term ((20736 : Rat) / 7625) [(4, 2), (8, 1), (13, 2)],
  term ((-10368 : Rat) / 7625) [(4, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1937 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1937_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1937
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1937 := by
  native_decide

/-- Coefficient term 1938 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1938 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1938 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1938 : Poly :=
[
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1938 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1938_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1938
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1938 := by
  native_decide

/-- Coefficient term 1939 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1939 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1)]
]

/-- Partial product 1939 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1939 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1939 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1939_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1939
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1939 := by
  native_decide

/-- Coefficient term 1940 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1940 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1940 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1940 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1940 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1940_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1940
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1940 := by
  native_decide

/-- Coefficient term 1941 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1941 : Poly :=
[
  term ((58368 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (13, 2)]
]

/-- Partial product 1941 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1941 : Poly :=
[
  term ((116736 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2)],
  term ((-58368 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1941 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1941_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1941
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1941 := by
  native_decide

/-- Coefficient term 1942 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1942 : Poly :=
[
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 1), (11, 1), (13, 2)]
]

/-- Partial product 1942 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1942 : Poly :=
[
  term ((-43776 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 2)],
  term ((21888 : Rat) / 7625) [(5, 1), (6, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1942 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1942_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1942
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1942 := by
  native_decide

/-- Coefficient term 1943 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1943 : Poly :=
[
  term ((-93936 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 1943 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1943 : Poly :=
[
  term ((-187872 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((93936 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1943 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1943_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1943
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1943 := by
  native_decide

/-- Coefficient term 1944 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1944 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1944 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1944 : Poly :=
[
  term ((96 : Rat) / 5) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1944 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1944_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1944
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1944 := by
  native_decide

/-- Coefficient term 1945 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1945 : Poly :=
[
  term ((-32916 : Rat) / 7625) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 1945 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1945 : Poly :=
[
  term ((-65832 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((32916 : Rat) / 7625) [(5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1945 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1945_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1945
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1945 := by
  native_decide

/-- Coefficient term 1946 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1946 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 1946 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1946 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1946 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1946_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1946
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1946 := by
  native_decide

/-- Coefficient term 1947 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1947 : Poly :=
[
  term ((-65664 : Rat) / 7625) [(5, 1), (6, 1), (13, 3)]
]

/-- Partial product 1947 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1947 : Poly :=
[
  term ((-131328 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (13, 3)],
  term ((65664 : Rat) / 7625) [(5, 1), (6, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1947 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1947_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1947
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1947 := by
  native_decide

/-- Coefficient term 1948 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1948 : Poly :=
[
  term (6 : Rat) [(5, 1), (7, 1)]
]

/-- Partial product 1948 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1948 : Poly :=
[
  term (-6 : Rat) [(5, 1), (7, 1)],
  term (12 : Rat) [(5, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1948 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1948_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1948
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1948 := by
  native_decide

/-- Coefficient term 1949 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1949 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (8, 1)]
]

/-- Partial product 1949 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1949 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (7, 1), (8, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1949 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1949_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1949
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1949 := by
  native_decide

/-- Coefficient term 1950 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1950 : Poly :=
[
  term ((10944 : Rat) / 7625) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1950 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1950 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((21888 : Rat) / 7625) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1950 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1950_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1950
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1950 := by
  native_decide

/-- Coefficient term 1951 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1951 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 1951 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1951 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1951 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1951_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1951
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1951 := by
  native_decide

/-- Coefficient term 1952 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1952 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1)]
]

/-- Partial product 1952 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1952 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1952 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1952_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1952
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1952 := by
  native_decide

/-- Coefficient term 1953 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1953 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (7, 1), (8, 1), (13, 2)]
]

/-- Partial product 1953 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1953 : Poly :=
[
  term ((10944 : Rat) / 7625) [(5, 1), (7, 1), (8, 1), (13, 2)],
  term ((-21888 : Rat) / 7625) [(5, 1), (7, 1), (8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1953 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1953_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1953
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1953 := by
  native_decide

/-- Coefficient term 1954 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1954 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 1954 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1954 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1954 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1954_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1954
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1954 := by
  native_decide

/-- Coefficient term 1955 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1955 : Poly :=
[
  term ((5472 : Rat) / 7625) [(5, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 1955 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1955 : Poly :=
[
  term ((10944 : Rat) / 7625) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1955 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1955_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1955
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1955 := by
  native_decide

/-- Coefficient term 1956 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1956 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)]
]

/-- Partial product 1956 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1956 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1956 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1956_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1956
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1956 := by
  native_decide

/-- Coefficient term 1957 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1957 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 1957 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1957 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1957 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1957_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1957
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1957 := by
  native_decide

/-- Coefficient term 1958 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1958 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 2)]
]

/-- Partial product 1958 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1958 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1958 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1958_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1958
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1958 := by
  native_decide

/-- Coefficient term 1959 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1959 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 2), (14, 1)]
]

/-- Partial product 1959 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1959 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1959 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1959_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1959
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1959 := by
  native_decide

/-- Coefficient term 1960 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1960 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(5, 1), (7, 1), (13, 2)]
]

/-- Partial product 1960 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1960 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (7, 1), (8, 1), (13, 2)],
  term ((5472 : Rat) / 7625) [(5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1960 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1960_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1960
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1960 := by
  native_decide

/-- Coefficient term 1961 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1961 : Poly :=
[
  term (-6 : Rat) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 1961 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1961 : Poly :=
[
  term (-12 : Rat) [(5, 1), (7, 1), (8, 1), (14, 1)],
  term (6 : Rat) [(5, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1961 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1961_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1961
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1961 := by
  native_decide

/-- Coefficient term 1962 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1962 : Poly :=
[
  term ((-47424 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (13, 2)]
]

/-- Partial product 1962 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1962 : Poly :=
[
  term ((47424 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (13, 2)],
  term ((-94848 : Rat) / 7625) [(5, 1), (8, 2), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1962 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1962_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1962
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1962 := by
  native_decide

/-- Coefficient term 1963 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1963 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(5, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 1963 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1963 : Poly :=
[
  term ((5472 : Rat) / 7625) [(5, 1), (8, 1), (11, 1), (13, 2)],
  term ((-10944 : Rat) / 7625) [(5, 1), (8, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1963 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1963_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1963
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1963 := by
  native_decide

/-- Coefficient term 1964 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1964 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1964 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1964 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((48 : Rat) / 5) [(5, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1964 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1964_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1964
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1964 := by
  native_decide

/-- Coefficient term 1965 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1965 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1965 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1965 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1965 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1965_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1965
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1965 := by
  native_decide

/-- Coefficient term 1966 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1966 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 1966 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1966 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (8, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1966 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1966_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1966
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1966 := by
  native_decide

/-- Coefficient term 1967 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1967 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1967 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1967 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1967 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1967_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1967
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1967 := by
  native_decide

/-- Coefficient term 1968 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1968 : Poly :=
[
  term ((32832 : Rat) / 7625) [(5, 1), (8, 1), (13, 3)]
]

/-- Partial product 1968 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1968 : Poly :=
[
  term ((-32832 : Rat) / 7625) [(5, 1), (8, 1), (13, 3)],
  term ((65664 : Rat) / 7625) [(5, 1), (8, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1968 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1968_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1968
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1968 := by
  native_decide

/-- Coefficient term 1969 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1969 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (9, 1)]
]

/-- Partial product 1969 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1969 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (8, 1), (9, 1)],
  term ((12 : Rat) / 5) [(5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1969 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1969_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1969
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1969 := by
  native_decide

/-- Coefficient term 1970 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1970 : Poly :=
[
  term ((10944 : Rat) / 7625) [(5, 1), (9, 1), (10, 1), (13, 2)]
]

/-- Partial product 1970 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1970 : Poly :=
[
  term ((21888 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((-10944 : Rat) / 7625) [(5, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1970 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1970_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1970
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1970 := by
  native_decide

/-- Coefficient term 1971 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1971 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1971 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1971 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1971 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1971_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1971
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1971 := by
  native_decide

/-- Coefficient term 1972 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1972 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1972 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1972 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1972 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1972_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1972
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1972 := by
  native_decide

/-- Coefficient term 1973 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1973 : Poly :=
[
  term ((-36 : Rat) / 5) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 1973 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1973 : Poly :=
[
  term ((-72 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 1)],
  term ((36 : Rat) / 5) [(5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1973 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1973_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1973
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1973 := by
  native_decide

/-- Coefficient term 1974 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1974 : Poly :=
[
  term ((-32832 : Rat) / 7625) [(5, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 1974 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1974 : Poly :=
[
  term ((-65664 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 2)],
  term ((32832 : Rat) / 7625) [(5, 1), (9, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1974 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1974_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1974
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1974 := by
  native_decide

/-- Coefficient term 1975 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1975 : Poly :=
[
  term ((36 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1975 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1975 : Poly :=
[
  term ((72 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-36 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1975 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1975_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1975
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1975 := by
  native_decide

/-- Coefficient term 1976 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1976 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (9, 1), (12, 2)]
]

/-- Partial product 1976 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1976 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 2)],
  term ((24 : Rat) / 5) [(5, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1976 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1976_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1976
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1976 := by
  native_decide

/-- Coefficient term 1977 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1977 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (9, 1), (12, 2), (14, 1)]
]

/-- Partial product 1977 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1977 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1977 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1977_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1977
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1977 := by
  native_decide

/-- Coefficient term 1978 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1978 : Poly :=
[
  term ((-56544 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 1978 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1978 : Poly :=
[
  term ((-113088 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (13, 2)],
  term ((56544 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1978 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1978_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1978
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1978 := by
  native_decide

/-- Coefficient term 1979 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1979 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 1979 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1979 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1979 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1979_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1979
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1979 := by
  native_decide

/-- Coefficient term 1980 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1980 : Poly :=
[
  term ((47424 : Rat) / 7625) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

/-- Partial product 1980 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1980 : Poly :=
[
  term ((94848 : Rat) / 7625) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((-47424 : Rat) / 7625) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1980 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1980_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1980
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1980 := by
  native_decide

/-- Coefficient term 1981 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1981 : Poly :=
[
  term ((47424 : Rat) / 7625) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 1981 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1981 : Poly :=
[
  term ((94848 : Rat) / 7625) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-47424 : Rat) / 7625) [(5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1981 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1981_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1981
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1981 := by
  native_decide

/-- Coefficient term 1982 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1982 : Poly :=
[
  term ((2736 : Rat) / 7625) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1982 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1982 : Poly :=
[
  term ((5472 : Rat) / 7625) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2736 : Rat) / 7625) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1982 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1982_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1982
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1982 := by
  native_decide

/-- Coefficient term 1983 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1983 : Poly :=
[
  term ((-16416 : Rat) / 7625) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 1983 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1983 : Poly :=
[
  term ((-32832 : Rat) / 7625) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((16416 : Rat) / 7625) [(5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1983 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1983_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1983
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1983 := by
  native_decide

/-- Coefficient term 1984 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1984 : Poly :=
[
  term ((-2736 : Rat) / 7625) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 1984 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1984 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(5, 1), (8, 1), (11, 1), (13, 2)],
  term ((2736 : Rat) / 7625) [(5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1984 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1984_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1984
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1984 := by
  native_decide

/-- Coefficient term 1985 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1985 : Poly :=
[
  term ((34476 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 1985 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1985 : Poly :=
[
  term ((68952 : Rat) / 7625) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-34476 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1985 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1985_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1985
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1985 := by
  native_decide

/-- Coefficient term 1986 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1986 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1986 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1986 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1986 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1986_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1986
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1986 := by
  native_decide

/-- Coefficient term 1987 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1987 : Poly :=
[
  term ((16416 : Rat) / 7625) [(5, 1), (12, 2), (13, 1)]
]

/-- Partial product 1987 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1987 : Poly :=
[
  term ((32832 : Rat) / 7625) [(5, 1), (8, 1), (12, 2), (13, 1)],
  term ((-16416 : Rat) / 7625) [(5, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1987 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1987_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1987
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1987 := by
  native_decide

/-- Coefficient term 1988 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1988 : Poly :=
[
  term ((26958 : Rat) / 7625) [(5, 1), (13, 1)]
]

/-- Partial product 1988 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1988 : Poly :=
[
  term ((53916 : Rat) / 7625) [(5, 1), (8, 1), (13, 1)],
  term ((-26958 : Rat) / 7625) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1988 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1988_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1988
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1988 := by
  native_decide

/-- Coefficient term 1989 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1989 : Poly :=
[
  term ((-6 : Rat) / 5) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 1989 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1989 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((6 : Rat) / 5) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1989 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1989_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1989
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1989 := by
  native_decide

/-- Coefficient term 1990 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1990 : Poly :=
[
  term ((16416 : Rat) / 7625) [(5, 1), (13, 3)]
]

/-- Partial product 1990 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1990 : Poly :=
[
  term ((32832 : Rat) / 7625) [(5, 1), (8, 1), (13, 3)],
  term ((-16416 : Rat) / 7625) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1990 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1990_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1990
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1990 := by
  native_decide

/-- Coefficient term 1991 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1991 : Poly :=
[
  term ((3 : Rat) / 10) [(6, 1)]
]

/-- Partial product 1991 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1991 : Poly :=
[
  term ((-3 : Rat) / 10) [(6, 1)],
  term ((3 : Rat) / 5) [(6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1991 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1991_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1991
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1991 := by
  native_decide

/-- Coefficient term 1992 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1992 : Poly :=
[
  term ((6 : Rat) / 5) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 1992 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1992 : Poly :=
[
  term ((12 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((-6 : Rat) / 5) [(6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1992 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1992_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1992
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1992 := by
  native_decide

/-- Coefficient term 1993 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1993 : Poly :=
[
  term ((9533632 : Rat) / 53375) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1993 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1993 : Poly :=
[
  term ((19067264 : Rat) / 53375) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-9533632 : Rat) / 53375) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1993 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1993_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1993
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1993 := by
  native_decide

/-- Coefficient term 1994 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1994 : Poly :=
[
  term ((-1536 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1994 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1994 : Poly :=
[
  term ((-3072 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1994 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1994_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1994
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1994 := by
  native_decide

/-- Coefficient term 1995 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1995 : Poly :=
[
  term ((512 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1995 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1995 : Poly :=
[
  term ((1024 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1995 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1995_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1995
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1995 := by
  native_decide

/-- Coefficient term 1996 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1996 : Poly :=
[
  term ((-416 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1996 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1996 : Poly :=
[
  term ((-832 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1996 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1996_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1996
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1996 := by
  native_decide

/-- Coefficient term 1997 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1997 : Poly :=
[
  term ((12787 : Rat) / 105) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1997 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1997 : Poly :=
[
  term ((25574 : Rat) / 105) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12787 : Rat) / 105) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1997 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1997_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1997
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1997 := by
  native_decide

/-- Coefficient term 1998 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1998 : Poly :=
[
  term ((-521 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1998 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1998 : Poly :=
[
  term ((-1042 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((521 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1998 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1998_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1998
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1998 := by
  native_decide

/-- Coefficient term 1999 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1999 : Poly :=
[
  term ((12 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1999 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1999 : Poly :=
[
  term ((24 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1999 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1999_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1999
        rs_R003_ueqv_R003YY_generator_19_1900_1999 =
      rs_R003_ueqv_R003YY_partial_19_1999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_1900_1999 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_1900,
  rs_R003_ueqv_R003YY_partial_19_1901,
  rs_R003_ueqv_R003YY_partial_19_1902,
  rs_R003_ueqv_R003YY_partial_19_1903,
  rs_R003_ueqv_R003YY_partial_19_1904,
  rs_R003_ueqv_R003YY_partial_19_1905,
  rs_R003_ueqv_R003YY_partial_19_1906,
  rs_R003_ueqv_R003YY_partial_19_1907,
  rs_R003_ueqv_R003YY_partial_19_1908,
  rs_R003_ueqv_R003YY_partial_19_1909,
  rs_R003_ueqv_R003YY_partial_19_1910,
  rs_R003_ueqv_R003YY_partial_19_1911,
  rs_R003_ueqv_R003YY_partial_19_1912,
  rs_R003_ueqv_R003YY_partial_19_1913,
  rs_R003_ueqv_R003YY_partial_19_1914,
  rs_R003_ueqv_R003YY_partial_19_1915,
  rs_R003_ueqv_R003YY_partial_19_1916,
  rs_R003_ueqv_R003YY_partial_19_1917,
  rs_R003_ueqv_R003YY_partial_19_1918,
  rs_R003_ueqv_R003YY_partial_19_1919,
  rs_R003_ueqv_R003YY_partial_19_1920,
  rs_R003_ueqv_R003YY_partial_19_1921,
  rs_R003_ueqv_R003YY_partial_19_1922,
  rs_R003_ueqv_R003YY_partial_19_1923,
  rs_R003_ueqv_R003YY_partial_19_1924,
  rs_R003_ueqv_R003YY_partial_19_1925,
  rs_R003_ueqv_R003YY_partial_19_1926,
  rs_R003_ueqv_R003YY_partial_19_1927,
  rs_R003_ueqv_R003YY_partial_19_1928,
  rs_R003_ueqv_R003YY_partial_19_1929,
  rs_R003_ueqv_R003YY_partial_19_1930,
  rs_R003_ueqv_R003YY_partial_19_1931,
  rs_R003_ueqv_R003YY_partial_19_1932,
  rs_R003_ueqv_R003YY_partial_19_1933,
  rs_R003_ueqv_R003YY_partial_19_1934,
  rs_R003_ueqv_R003YY_partial_19_1935,
  rs_R003_ueqv_R003YY_partial_19_1936,
  rs_R003_ueqv_R003YY_partial_19_1937,
  rs_R003_ueqv_R003YY_partial_19_1938,
  rs_R003_ueqv_R003YY_partial_19_1939,
  rs_R003_ueqv_R003YY_partial_19_1940,
  rs_R003_ueqv_R003YY_partial_19_1941,
  rs_R003_ueqv_R003YY_partial_19_1942,
  rs_R003_ueqv_R003YY_partial_19_1943,
  rs_R003_ueqv_R003YY_partial_19_1944,
  rs_R003_ueqv_R003YY_partial_19_1945,
  rs_R003_ueqv_R003YY_partial_19_1946,
  rs_R003_ueqv_R003YY_partial_19_1947,
  rs_R003_ueqv_R003YY_partial_19_1948,
  rs_R003_ueqv_R003YY_partial_19_1949,
  rs_R003_ueqv_R003YY_partial_19_1950,
  rs_R003_ueqv_R003YY_partial_19_1951,
  rs_R003_ueqv_R003YY_partial_19_1952,
  rs_R003_ueqv_R003YY_partial_19_1953,
  rs_R003_ueqv_R003YY_partial_19_1954,
  rs_R003_ueqv_R003YY_partial_19_1955,
  rs_R003_ueqv_R003YY_partial_19_1956,
  rs_R003_ueqv_R003YY_partial_19_1957,
  rs_R003_ueqv_R003YY_partial_19_1958,
  rs_R003_ueqv_R003YY_partial_19_1959,
  rs_R003_ueqv_R003YY_partial_19_1960,
  rs_R003_ueqv_R003YY_partial_19_1961,
  rs_R003_ueqv_R003YY_partial_19_1962,
  rs_R003_ueqv_R003YY_partial_19_1963,
  rs_R003_ueqv_R003YY_partial_19_1964,
  rs_R003_ueqv_R003YY_partial_19_1965,
  rs_R003_ueqv_R003YY_partial_19_1966,
  rs_R003_ueqv_R003YY_partial_19_1967,
  rs_R003_ueqv_R003YY_partial_19_1968,
  rs_R003_ueqv_R003YY_partial_19_1969,
  rs_R003_ueqv_R003YY_partial_19_1970,
  rs_R003_ueqv_R003YY_partial_19_1971,
  rs_R003_ueqv_R003YY_partial_19_1972,
  rs_R003_ueqv_R003YY_partial_19_1973,
  rs_R003_ueqv_R003YY_partial_19_1974,
  rs_R003_ueqv_R003YY_partial_19_1975,
  rs_R003_ueqv_R003YY_partial_19_1976,
  rs_R003_ueqv_R003YY_partial_19_1977,
  rs_R003_ueqv_R003YY_partial_19_1978,
  rs_R003_ueqv_R003YY_partial_19_1979,
  rs_R003_ueqv_R003YY_partial_19_1980,
  rs_R003_ueqv_R003YY_partial_19_1981,
  rs_R003_ueqv_R003YY_partial_19_1982,
  rs_R003_ueqv_R003YY_partial_19_1983,
  rs_R003_ueqv_R003YY_partial_19_1984,
  rs_R003_ueqv_R003YY_partial_19_1985,
  rs_R003_ueqv_R003YY_partial_19_1986,
  rs_R003_ueqv_R003YY_partial_19_1987,
  rs_R003_ueqv_R003YY_partial_19_1988,
  rs_R003_ueqv_R003YY_partial_19_1989,
  rs_R003_ueqv_R003YY_partial_19_1990,
  rs_R003_ueqv_R003YY_partial_19_1991,
  rs_R003_ueqv_R003YY_partial_19_1992,
  rs_R003_ueqv_R003YY_partial_19_1993,
  rs_R003_ueqv_R003YY_partial_19_1994,
  rs_R003_ueqv_R003YY_partial_19_1995,
  rs_R003_ueqv_R003YY_partial_19_1996,
  rs_R003_ueqv_R003YY_partial_19_1997,
  rs_R003_ueqv_R003YY_partial_19_1998,
  rs_R003_ueqv_R003YY_partial_19_1999
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_1900_1999 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((101376 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-313344 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-2304 : Rat) / 305) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (7, 1), (11, 2), (13, 1)],
  term ((-50688 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((156672 : Rat) / 7625) [(4, 2), (7, 1), (12, 2), (13, 1)],
  term ((1152 : Rat) / 305) [(4, 2), (7, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (8, 2), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-110592 : Rat) / 1525) [(4, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-110592 : Rat) / 1525) [(4, 2), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((32256 : Rat) / 1525) [(4, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((258048 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((331776 : Rat) / 7625) [(4, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((331776 : Rat) / 7625) [(4, 2), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-152064 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 2), (8, 1), (10, 2), (13, 2)],
  term ((-41472 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((262656 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 1), (12, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 2), (8, 2), (9, 1), (11, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 2), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 2), (10, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 2), (8, 2), (11, 1), (13, 1)],
  term ((110592 : Rat) / 1525) [(4, 2), (8, 2), (11, 1), (13, 3)],
  term ((-110592 : Rat) / 7625) [(4, 2), (8, 2), (11, 2), (13, 2)],
  term ((-258048 : Rat) / 7625) [(4, 2), (8, 2), (12, 1), (13, 2)],
  term ((96768 : Rat) / 7625) [(4, 2), (8, 2), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 2), (13, 1)],
  term ((55296 : Rat) / 1525) [(4, 2), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((359424 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-16128 : Rat) / 1525) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-129024 : Rat) / 7625) [(4, 2), (9, 1), (12, 2), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((13824 : Rat) / 1525) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 2), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (11, 1), (12, 2), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 1525) [(4, 2), (11, 1), (13, 3)],
  term ((27648 : Rat) / 7625) [(4, 2), (11, 2), (13, 2)],
  term ((78336 : Rat) / 7625) [(4, 2), (12, 1), (13, 2)],
  term ((-10368 : Rat) / 7625) [(4, 2), (13, 2)],
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((116736 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2)],
  term ((-43776 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 2)],
  term ((-187872 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((96 : Rat) / 5) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-65832 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-131328 : Rat) / 7625) [(5, 1), (6, 1), (8, 1), (13, 3)],
  term ((10944 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-58368 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (13, 2)],
  term ((21888 : Rat) / 7625) [(5, 1), (6, 1), (11, 1), (13, 2)],
  term ((93936 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((32916 : Rat) / 7625) [(5, 1), (6, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((65664 : Rat) / 7625) [(5, 1), (6, 1), (13, 3)],
  term (-6 : Rat) [(5, 1), (7, 1)],
  term ((72 : Rat) / 5) [(5, 1), (7, 1), (8, 1)],
  term ((72 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1)],
  term ((-72 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 2)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 2), (14, 1)],
  term ((-72 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (8, 2)],
  term ((21888 : Rat) / 7625) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (12, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (12, 1), (14, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (7, 1), (8, 2), (13, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (14, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 2), (14, 1)],
  term ((5472 : Rat) / 7625) [(5, 1), (7, 1), (13, 2)],
  term (6 : Rat) [(5, 1), (7, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (8, 1), (9, 1)],
  term ((21888 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((-10944 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-72 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 1)],
  term ((-65664 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 2)],
  term ((72 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 2)],
  term ((48 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1)],
  term ((-65664 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (13, 2)],
  term ((24 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((94848 : Rat) / 7625) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((94848 : Rat) / 7625) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((5472 : Rat) / 7625) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-32832 : Rat) / 7625) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((32352 : Rat) / 7625) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((32832 : Rat) / 7625) [(5, 1), (8, 1), (12, 2), (13, 1)],
  term ((35616 : Rat) / 7625) [(5, 1), (8, 1), (13, 1)],
  term ((-94848 : Rat) / 7625) [(5, 1), (8, 2), (9, 1), (13, 2)],
  term ((-10944 : Rat) / 7625) [(5, 1), (8, 2), (11, 1), (13, 2)],
  term ((48 : Rat) / 5) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (8, 2), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((65664 : Rat) / 7625) [(5, 1), (8, 2), (13, 3)],
  term ((12 : Rat) / 5) [(5, 1), (9, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (9, 1), (10, 1), (13, 2)],
  term ((5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 5) [(5, 1), (9, 1), (12, 1)],
  term ((32832 : Rat) / 7625) [(5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-36 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (9, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (9, 1), (12, 2), (14, 1)],
  term ((56544 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)],
  term ((-12 : Rat) / 5) [(5, 1), (9, 1), (14, 1)],
  term ((-47424 : Rat) / 7625) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-47424 : Rat) / 7625) [(5, 1), (9, 2), (13, 1)],
  term ((-2736 : Rat) / 7625) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((16416 : Rat) / 7625) [(5, 1), (10, 1), (13, 1)],
  term ((2736 : Rat) / 7625) [(5, 1), (11, 1), (13, 2)],
  term ((-34476 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)],
  term ((12 : Rat) / 5) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-16416 : Rat) / 7625) [(5, 1), (12, 2), (13, 1)],
  term ((-26958 : Rat) / 7625) [(5, 1), (13, 1)],
  term ((6 : Rat) / 5) [(5, 1), (13, 1), (14, 1)],
  term ((-16416 : Rat) / 7625) [(5, 1), (13, 3)],
  term ((-3 : Rat) / 10) [(6, 1)],
  term ((12 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((19067264 : Rat) / 53375) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((25574 : Rat) / 105) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(6, 1), (7, 1), (9, 1)],
  term ((-9533632 : Rat) / 53375) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1536 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12787 : Rat) / 105) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((521 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((3 : Rat) / 5) [(6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 1900 through 1999. -/
theorem rs_R003_ueqv_R003YY_block_19_1900_1999_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_1900_1999
      rs_R003_ueqv_R003YY_block_19_1900_1999 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
