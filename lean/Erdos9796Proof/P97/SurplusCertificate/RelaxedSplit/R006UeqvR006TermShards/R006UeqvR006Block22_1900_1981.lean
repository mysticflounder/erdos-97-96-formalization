/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 22:1900-1981

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_22_1900_1981 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1900 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1900 : Poly :=
[
  term ((2592 : Rat) / 5) [(9, 1), (13, 3), (14, 1)]
]

/-- Partial product 1900 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1900 : Poly :=
[
  term ((5184 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1)],
  term ((-2592 : Rat) / 5) [(9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1900 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1900_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1900
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1900 := by
  native_decide

/-- Coefficient term 1901 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1901 : Poly :=
[
  term ((-864 : Rat) / 5) [(9, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1901 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1901 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1901 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1901_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1901
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1901 := by
  native_decide

/-- Coefficient term 1902 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1902 : Poly :=
[
  term ((432 : Rat) / 5) [(9, 1), (13, 3), (16, 1)]
]

/-- Partial product 1902 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1902 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-432 : Rat) / 5) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1902 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1902_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1902
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1902 := by
  native_decide

/-- Coefficient term 1903 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1903 : Poly :=
[
  term ((-2052 : Rat) / 5) [(9, 1), (15, 1)]
]

/-- Partial product 1903 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1903 : Poly :=
[
  term ((-4104 : Rat) / 5) [(9, 1), (10, 1), (15, 1)],
  term ((2052 : Rat) / 5) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1903 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1903_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1903
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1903 := by
  native_decide

/-- Coefficient term 1904 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1904 : Poly :=
[
  term ((684 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1904 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1904 : Poly :=
[
  term ((1368 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1904 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1904_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1904
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1904 := by
  native_decide

/-- Coefficient term 1905 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1905 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1905 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1905 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(9, 2), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1905 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1905_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1905
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1905 := by
  native_decide

/-- Coefficient term 1906 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1906 : Poly :=
[
  term ((-576 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1906 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1906 : Poly :=
[
  term ((576 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1906 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1906_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1906
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1906 := by
  native_decide

/-- Coefficient term 1907 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1907 : Poly :=
[
  term ((1152 : Rat) / 7) [(9, 2), (10, 1), (13, 2)]
]

/-- Partial product 1907 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1907 : Poly :=
[
  term ((-1152 : Rat) / 7) [(9, 2), (10, 1), (13, 2)],
  term ((2304 : Rat) / 7) [(9, 2), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1907 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1907_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1907
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1907 := by
  native_decide

/-- Coefficient term 1908 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1908 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (14, 1)]
]

/-- Partial product 1908 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1908 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (14, 1)],
  term ((-3456 : Rat) / 5) [(9, 2), (10, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1908 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1908_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1908
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1908 := by
  native_decide

/-- Coefficient term 1909 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1909 : Poly :=
[
  term ((576 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1909 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1909 : Poly :=
[
  term ((-576 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(9, 2), (10, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1909 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1909_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1909
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1909 := by
  native_decide

/-- Coefficient term 1910 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1910 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1910 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1910 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1910 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1910_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1910
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1910 := by
  native_decide

/-- Coefficient term 1911 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1911 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 1911 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1911 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1911 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1911_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1911
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1911 := by
  native_decide

/-- Coefficient term 1912 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1912 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1912 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1912 : Poly :=
[
  term ((-576 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1912 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1912_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1912
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1912 := by
  native_decide

/-- Coefficient term 1913 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1913 : Poly :=
[
  term ((576 : Rat) / 7) [(9, 2), (13, 2)]
]

/-- Partial product 1913 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1913 : Poly :=
[
  term ((1152 : Rat) / 7) [(9, 2), (10, 1), (13, 2)],
  term ((-576 : Rat) / 7) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1913 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1913_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1913
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1913 := by
  native_decide

/-- Coefficient term 1914 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1914 : Poly :=
[
  term ((-864 : Rat) / 5) [(9, 2), (13, 2), (14, 1)]
]

/-- Partial product 1914 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1914 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (14, 1)],
  term ((864 : Rat) / 5) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1914 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1914_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1914
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1914 := by
  native_decide

/-- Coefficient term 1915 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1915 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1915 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1915 : Poly :=
[
  term ((576 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1915 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1915_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1915
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1915 := by
  native_decide

/-- Coefficient term 1916 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1916 : Poly :=
[
  term ((-144 : Rat) / 5) [(9, 2), (13, 2), (16, 1)]
]

/-- Partial product 1916 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1916 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((144 : Rat) / 5) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1916 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1916_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1916
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1916 := by
  native_decide

/-- Coefficient term 1917 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1917 : Poly :=
[
  term ((3 : Rat) / 10) [(10, 1)]
]

/-- Partial product 1917 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1917 : Poly :=
[
  term ((-3 : Rat) / 10) [(10, 1)],
  term ((3 : Rat) / 5) [(10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1917 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1917_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1917
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1917 := by
  native_decide

/-- Coefficient term 1918 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1918 : Poly :=
[
  term ((-954 : Rat) / 5) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1918 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1918 : Poly :=
[
  term ((954 : Rat) / 5) [(10, 1), (11, 1), (13, 1)],
  term ((-1908 : Rat) / 5) [(10, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1918 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1918_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1918
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1918 := by
  native_decide

/-- Coefficient term 1919 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1919 : Poly :=
[
  term (138 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1919 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1919 : Poly :=
[
  term (-138 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term (276 : Rat) [(10, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1919 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1919_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1919
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1919 := by
  native_decide

/-- Coefficient term 1920 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1920 : Poly :=
[
  term ((-2 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1920 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1920 : Poly :=
[
  term ((2 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1920 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1920_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1920
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1920 := by
  native_decide

/-- Coefficient term 1921 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1921 : Poly :=
[
  term (174 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1921 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1921 : Poly :=
[
  term (-174 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term (348 : Rat) [(10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1921 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1921_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1921
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1921 := by
  native_decide

/-- Coefficient term 1922 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1922 : Poly :=
[
  term ((-276 : Rat) / 5) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1922 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1922 : Poly :=
[
  term ((276 : Rat) / 5) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1922 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1922_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1922
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1922 := by
  native_decide

/-- Coefficient term 1923 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1923 : Poly :=
[
  term ((612 : Rat) / 7) [(10, 1), (12, 1), (13, 2)]
]

/-- Partial product 1923 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1923 : Poly :=
[
  term ((-612 : Rat) / 7) [(10, 1), (12, 1), (13, 2)],
  term ((1224 : Rat) / 7) [(10, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1923 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1923_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1923
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1923 := by
  native_decide

/-- Coefficient term 1924 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1924 : Poly :=
[
  term ((-864 : Rat) / 5) [(10, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1924 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1924 : Poly :=
[
  term ((864 : Rat) / 5) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1728 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1924 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1924_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1924
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1924 := by
  native_decide

/-- Coefficient term 1925 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1925 : Poly :=
[
  term ((288 : Rat) / 5) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1925 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1925 : Poly :=
[
  term ((-288 : Rat) / 5) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1925 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1925_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1925
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1925 := by
  native_decide

/-- Coefficient term 1926 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1926 : Poly :=
[
  term ((-144 : Rat) / 5) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1926 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1926 : Poly :=
[
  term ((144 : Rat) / 5) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1926 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1926_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1926
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1926 := by
  native_decide

/-- Coefficient term 1927 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1927 : Poly :=
[
  term ((18 : Rat) / 5) [(10, 1), (12, 1), (14, 1)]
]

/-- Partial product 1927 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1927 : Poly :=
[
  term ((-18 : Rat) / 5) [(10, 1), (12, 1), (14, 1)],
  term ((36 : Rat) / 5) [(10, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1927 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1927_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1927
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1927 := by
  native_decide

/-- Coefficient term 1928 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1928 : Poly :=
[
  term ((6 : Rat) / 5) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1928 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1928 : Poly :=
[
  term ((-6 : Rat) / 5) [(10, 1), (12, 1), (16, 1)],
  term ((12 : Rat) / 5) [(10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1928 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1928_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1928
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1928 := by
  native_decide

/-- Coefficient term 1929 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1929 : Poly :=
[
  term ((-2853 : Rat) / 25) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1929 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1929 : Poly :=
[
  term ((2853 : Rat) / 25) [(10, 1), (13, 1), (15, 1)],
  term ((-5706 : Rat) / 25) [(10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1929 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1929_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1929
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1929 := by
  native_decide

/-- Coefficient term 1930 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1930 : Poly :=
[
  term ((846 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1930 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1930 : Poly :=
[
  term ((-846 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1692 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1930 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1930_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1930
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1930 := by
  native_decide

/-- Coefficient term 1931 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1931 : Poly :=
[
  term ((72 : Rat) / 35) [(10, 1), (13, 2)]
]

/-- Partial product 1931 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1931 : Poly :=
[
  term ((-72 : Rat) / 35) [(10, 1), (13, 2)],
  term ((144 : Rat) / 35) [(10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1931 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1931_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1931
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1931 := by
  native_decide

/-- Coefficient term 1932 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1932 : Poly :=
[
  term ((348 : Rat) / 5) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 1932 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1932 : Poly :=
[
  term ((-348 : Rat) / 5) [(10, 1), (13, 2), (14, 1)],
  term ((696 : Rat) / 5) [(10, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1932 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1932_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1932
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1932 := by
  native_decide

/-- Coefficient term 1933 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1933 : Poly :=
[
  term ((-192 : Rat) / 5) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1933 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1933 : Poly :=
[
  term ((192 : Rat) / 5) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(10, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1933 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1933_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1933
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1933 := by
  native_decide

/-- Coefficient term 1934 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1934 : Poly :=
[
  term ((96 : Rat) / 5) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1934 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1934 : Poly :=
[
  term ((-96 : Rat) / 5) [(10, 1), (13, 2), (16, 1)],
  term ((192 : Rat) / 5) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1934 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1934_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1934
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1934 := by
  native_decide

/-- Coefficient term 1935 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1935 : Poly :=
[
  term (-3 : Rat) [(10, 1), (14, 1)]
]

/-- Partial product 1935 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1935 : Poly :=
[
  term (3 : Rat) [(10, 1), (14, 1)],
  term (-6 : Rat) [(10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1935 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1935_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1935
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1935 := by
  native_decide

/-- Coefficient term 1936 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1936 : Poly :=
[
  term ((-9 : Rat) / 10) [(10, 1), (16, 1)]
]

/-- Partial product 1936 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1936 : Poly :=
[
  term ((9 : Rat) / 10) [(10, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1936 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1936_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1936
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1936 := by
  native_decide

/-- Coefficient term 1937 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1937 : Poly :=
[
  term ((-3132 : Rat) / 35) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1937 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1937 : Poly :=
[
  term ((-6264 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((3132 : Rat) / 35) [(11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1937 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1937_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1937
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1937 := by
  native_decide

/-- Coefficient term 1938 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1938 : Poly :=
[
  term ((516 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1938 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1938 : Poly :=
[
  term ((1032 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-516 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1938 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1938_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1938
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1938 := by
  native_decide

/-- Coefficient term 1939 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1939 : Poly :=
[
  term ((-96 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1939 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1939 : Poly :=
[
  term ((-192 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1939 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1939_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1939
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1939 := by
  native_decide

/-- Coefficient term 1940 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1940 : Poly :=
[
  term ((48 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1940 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1940 : Poly :=
[
  term ((96 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1940 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1940_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1940
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1940 := by
  native_decide

/-- Coefficient term 1941 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1941 : Poly :=
[
  term ((-1497 : Rat) / 25) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1941 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1941 : Poly :=
[
  term ((-2994 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1497 : Rat) / 25) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1941 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1941_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1941
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1941 := by
  native_decide

/-- Coefficient term 1942 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1942 : Poly :=
[
  term ((534 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1942 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1942 : Poly :=
[
  term ((1068 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-534 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1942 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1942_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1942
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1942 := by
  native_decide

/-- Coefficient term 1943 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1943 : Poly :=
[
  term ((-612 : Rat) / 7) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1943 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1943 : Poly :=
[
  term ((-1224 : Rat) / 7) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((612 : Rat) / 7) [(11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1943 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1943_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1943
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1943 := by
  native_decide

/-- Coefficient term 1944 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1944 : Poly :=
[
  term ((864 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1944 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1944 : Poly :=
[
  term ((1728 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1944 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1944_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1944
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1944 := by
  native_decide

/-- Coefficient term 1945 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1945 : Poly :=
[
  term ((-288 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1945 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1945 : Poly :=
[
  term ((-576 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1945 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1945_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1945
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1945 := by
  native_decide

/-- Coefficient term 1946 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1946 : Poly :=
[
  term ((144 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1946 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1946 : Poly :=
[
  term ((288 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1946 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1946_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1946
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1946 := by
  native_decide

/-- Coefficient term 1947 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1947 : Poly :=
[
  term (-174 : Rat) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1947 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1947 : Poly :=
[
  term (-348 : Rat) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term (174 : Rat) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1947 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1947_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1947
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1947 := by
  native_decide

/-- Coefficient term 1948 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1948 : Poly :=
[
  term ((276 : Rat) / 5) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1948 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1948 : Poly :=
[
  term ((552 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-276 : Rat) / 5) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1948 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1948_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1948
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1948 := by
  native_decide

/-- Coefficient term 1949 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1949 : Poly :=
[
  term ((-3123 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 1949 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1949 : Poly :=
[
  term ((-6246 : Rat) / 35) [(10, 1), (11, 1), (13, 1)],
  term ((3123 : Rat) / 35) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1949 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1949_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1949
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1949 := by
  native_decide

/-- Coefficient term 1950 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1950 : Poly :=
[
  term (9 : Rat) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1950 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1950 : Poly :=
[
  term (18 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term (-9 : Rat) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1950 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1950_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1950
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1950 := by
  native_decide

/-- Coefficient term 1951 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1951 : Poly :=
[
  term ((192 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1951 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1951 : Poly :=
[
  term ((384 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1951 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1951_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1951
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1951 := by
  native_decide

/-- Coefficient term 1952 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1952 : Poly :=
[
  term (-17 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1952 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1952 : Poly :=
[
  term (-34 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term (17 : Rat) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1952 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1952_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1952
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1952 := by
  native_decide

/-- Coefficient term 1953 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1953 : Poly :=
[
  term ((2961 : Rat) / 25) [(11, 1), (15, 1)]
]

/-- Partial product 1953 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1953 : Poly :=
[
  term ((5922 : Rat) / 25) [(10, 1), (11, 1), (15, 1)],
  term ((-2961 : Rat) / 25) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1953 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1953_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1953
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1953 := by
  native_decide

/-- Coefficient term 1954 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1954 : Poly :=
[
  term ((-792 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1954 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1954 : Poly :=
[
  term ((-1584 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1954 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1954_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1954
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1954 := by
  native_decide

/-- Coefficient term 1955 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1955 : Poly :=
[
  term ((954 : Rat) / 5) [(11, 2)]
]

/-- Partial product 1955 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1955 : Poly :=
[
  term ((1908 : Rat) / 5) [(10, 1), (11, 2)],
  term ((-954 : Rat) / 5) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1955 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1955_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1955
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1955 := by
  native_decide

/-- Coefficient term 1956 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1956 : Poly :=
[
  term ((954 : Rat) / 5) [(11, 2), (12, 1)]
]

/-- Partial product 1956 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1956 : Poly :=
[
  term ((1908 : Rat) / 5) [(10, 1), (11, 2), (12, 1)],
  term ((-954 : Rat) / 5) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1956 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1956_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1956
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1956 := by
  native_decide

/-- Coefficient term 1957 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1957 : Poly :=
[
  term (-138 : Rat) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 1957 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1957 : Poly :=
[
  term (-276 : Rat) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term (138 : Rat) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1957 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1957_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1957
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1957 := by
  native_decide

/-- Coefficient term 1958 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1958 : Poly :=
[
  term ((2 : Rat) / 5) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1958 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1958 : Poly :=
[
  term ((4 : Rat) / 5) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1958 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1958_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1958
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1958 := by
  native_decide

/-- Coefficient term 1959 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1959 : Poly :=
[
  term (-138 : Rat) [(11, 2), (14, 1)]
]

/-- Partial product 1959 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1959 : Poly :=
[
  term (-276 : Rat) [(10, 1), (11, 2), (14, 1)],
  term (138 : Rat) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1959 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1959_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1959
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1959 := by
  native_decide

/-- Coefficient term 1960 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1960 : Poly :=
[
  term ((2 : Rat) / 5) [(11, 2), (16, 1)]
]

/-- Partial product 1960 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1960 : Poly :=
[
  term ((4 : Rat) / 5) [(10, 1), (11, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1960 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1960_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1960
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1960 := by
  native_decide

/-- Coefficient term 1961 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1961 : Poly :=
[
  term ((-111 : Rat) / 2) [(12, 1)]
]

/-- Partial product 1961 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1961 : Poly :=
[
  term (-111 : Rat) [(10, 1), (12, 1)],
  term ((111 : Rat) / 2) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1961 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1961_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1961
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1961 := by
  native_decide

/-- Coefficient term 1962 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1962 : Poly :=
[
  term ((2319 : Rat) / 25) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1962 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1962 : Poly :=
[
  term ((4638 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2319 : Rat) / 25) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1962 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1962_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1962
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1962 := by
  native_decide

/-- Coefficient term 1963 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1963 : Poly :=
[
  term ((-738 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1963 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1963 : Poly :=
[
  term ((-1476 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((738 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1963 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1963_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1963
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1963 := by
  native_decide

/-- Coefficient term 1964 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1964 : Poly :=
[
  term ((1566 : Rat) / 35) [(12, 1), (13, 2)]
]

/-- Partial product 1964 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1964 : Poly :=
[
  term ((3132 : Rat) / 35) [(10, 1), (12, 1), (13, 2)],
  term ((-1566 : Rat) / 35) [(12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1964 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1964_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1964
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1964 := by
  native_decide

/-- Coefficient term 1965 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1965 : Poly :=
[
  term ((-432 : Rat) / 5) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1965 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1965 : Poly :=
[
  term ((-864 : Rat) / 5) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((432 : Rat) / 5) [(12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1965 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1965_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1965
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1965 := by
  native_decide

/-- Coefficient term 1966 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1966 : Poly :=
[
  term ((144 : Rat) / 5) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1966 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1966 : Poly :=
[
  term ((288 : Rat) / 5) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1966 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1966_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1966
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1966 := by
  native_decide

/-- Coefficient term 1967 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1967 : Poly :=
[
  term ((-72 : Rat) / 5) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1967 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1967 : Poly :=
[
  term ((-144 : Rat) / 5) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((72 : Rat) / 5) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1967 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1967_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1967
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1967 := by
  native_decide

/-- Coefficient term 1968 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1968 : Poly :=
[
  term (57 : Rat) [(12, 1), (14, 1)]
]

/-- Partial product 1968 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1968 : Poly :=
[
  term (114 : Rat) [(10, 1), (12, 1), (14, 1)],
  term (-57 : Rat) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1968 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1968_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1968
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1968 := by
  native_decide

/-- Coefficient term 1969 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1969 : Poly :=
[
  term (-3 : Rat) [(12, 1), (14, 2)]
]

/-- Partial product 1969 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1969 : Poly :=
[
  term (-6 : Rat) [(10, 1), (12, 1), (14, 2)],
  term (3 : Rat) [(12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1969 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1969_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1969
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1969 := by
  native_decide

/-- Coefficient term 1970 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1970 : Poly :=
[
  term (-3 : Rat) [(12, 1), (15, 2)]
]

/-- Partial product 1970 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1970 : Poly :=
[
  term (-6 : Rat) [(10, 1), (12, 1), (15, 2)],
  term (3 : Rat) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1970 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1970_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1970
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1970 := by
  native_decide

/-- Coefficient term 1971 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1971 : Poly :=
[
  term ((2 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 1971 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1971 : Poly :=
[
  term ((4 : Rat) / 5) [(10, 1), (12, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1971 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1971_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1971
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1971 := by
  native_decide

/-- Coefficient term 1972 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1972 : Poly :=
[
  term ((426 : Rat) / 5) [(12, 2)]
]

/-- Partial product 1972 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1972 : Poly :=
[
  term ((852 : Rat) / 5) [(10, 1), (12, 2)],
  term ((-426 : Rat) / 5) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1972 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1972_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1972
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1972 := by
  native_decide

/-- Coefficient term 1973 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1973 : Poly :=
[
  term ((-342 : Rat) / 5) [(12, 2), (14, 1)]
]

/-- Partial product 1973 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1973 : Poly :=
[
  term ((-684 : Rat) / 5) [(10, 1), (12, 2), (14, 1)],
  term ((342 : Rat) / 5) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1973 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1973_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1973
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1973 := by
  native_decide

/-- Coefficient term 1974 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1974 : Poly :=
[
  term ((-2937 : Rat) / 50) [(13, 1), (15, 1)]
]

/-- Partial product 1974 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1974 : Poly :=
[
  term ((-2937 : Rat) / 25) [(10, 1), (13, 1), (15, 1)],
  term ((2937 : Rat) / 50) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1974 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1974_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1974
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1974 := by
  native_decide

/-- Coefficient term 1975 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1975 : Poly :=
[
  term ((387 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1975 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1975 : Poly :=
[
  term ((774 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-387 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1975 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1975_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1975
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1975 := by
  native_decide

/-- Coefficient term 1976 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1976 : Poly :=
[
  term ((-132 : Rat) / 35) [(13, 2)]
]

/-- Partial product 1976 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1976 : Poly :=
[
  term ((-264 : Rat) / 35) [(10, 1), (13, 2)],
  term ((132 : Rat) / 35) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1976 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1976_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1976
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1976 := by
  native_decide

/-- Coefficient term 1977 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1977 : Poly :=
[
  term ((174 : Rat) / 5) [(13, 2), (14, 1)]
]

/-- Partial product 1977 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1977 : Poly :=
[
  term ((348 : Rat) / 5) [(10, 1), (13, 2), (14, 1)],
  term ((-174 : Rat) / 5) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1977 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1977_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1977
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1977 := by
  native_decide

/-- Coefficient term 1978 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1978 : Poly :=
[
  term ((-96 : Rat) / 5) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1978 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1978 : Poly :=
[
  term ((-192 : Rat) / 5) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1978 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1978_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1978
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1978 := by
  native_decide

/-- Coefficient term 1979 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1979 : Poly :=
[
  term ((48 : Rat) / 5) [(13, 2), (16, 1)]
]

/-- Partial product 1979 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1979 : Poly :=
[
  term ((96 : Rat) / 5) [(10, 1), (13, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1979 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1979_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1979
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1979 := by
  native_decide

/-- Coefficient term 1980 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1980 : Poly :=
[
  term ((9 : Rat) / 2) [(14, 1)]
]

/-- Partial product 1980 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1980 : Poly :=
[
  term (9 : Rat) [(10, 1), (14, 1)],
  term ((-9 : Rat) / 2) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1980 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1980_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1980
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1980 := by
  native_decide

/-- Coefficient term 1981 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1981 : Poly :=
[
  term ((9 : Rat) / 20) [(16, 1)]
]

/-- Partial product 1981 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1981 : Poly :=
[
  term ((9 : Rat) / 10) [(10, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1981 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1981_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1981
        rs_R006_ueqv_R006_generator_22_1900_1981 =
      rs_R006_ueqv_R006_partial_22_1981 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_22_1900_1981 : List Poly :=
[
  rs_R006_ueqv_R006_partial_22_1900,
  rs_R006_ueqv_R006_partial_22_1901,
  rs_R006_ueqv_R006_partial_22_1902,
  rs_R006_ueqv_R006_partial_22_1903,
  rs_R006_ueqv_R006_partial_22_1904,
  rs_R006_ueqv_R006_partial_22_1905,
  rs_R006_ueqv_R006_partial_22_1906,
  rs_R006_ueqv_R006_partial_22_1907,
  rs_R006_ueqv_R006_partial_22_1908,
  rs_R006_ueqv_R006_partial_22_1909,
  rs_R006_ueqv_R006_partial_22_1910,
  rs_R006_ueqv_R006_partial_22_1911,
  rs_R006_ueqv_R006_partial_22_1912,
  rs_R006_ueqv_R006_partial_22_1913,
  rs_R006_ueqv_R006_partial_22_1914,
  rs_R006_ueqv_R006_partial_22_1915,
  rs_R006_ueqv_R006_partial_22_1916,
  rs_R006_ueqv_R006_partial_22_1917,
  rs_R006_ueqv_R006_partial_22_1918,
  rs_R006_ueqv_R006_partial_22_1919,
  rs_R006_ueqv_R006_partial_22_1920,
  rs_R006_ueqv_R006_partial_22_1921,
  rs_R006_ueqv_R006_partial_22_1922,
  rs_R006_ueqv_R006_partial_22_1923,
  rs_R006_ueqv_R006_partial_22_1924,
  rs_R006_ueqv_R006_partial_22_1925,
  rs_R006_ueqv_R006_partial_22_1926,
  rs_R006_ueqv_R006_partial_22_1927,
  rs_R006_ueqv_R006_partial_22_1928,
  rs_R006_ueqv_R006_partial_22_1929,
  rs_R006_ueqv_R006_partial_22_1930,
  rs_R006_ueqv_R006_partial_22_1931,
  rs_R006_ueqv_R006_partial_22_1932,
  rs_R006_ueqv_R006_partial_22_1933,
  rs_R006_ueqv_R006_partial_22_1934,
  rs_R006_ueqv_R006_partial_22_1935,
  rs_R006_ueqv_R006_partial_22_1936,
  rs_R006_ueqv_R006_partial_22_1937,
  rs_R006_ueqv_R006_partial_22_1938,
  rs_R006_ueqv_R006_partial_22_1939,
  rs_R006_ueqv_R006_partial_22_1940,
  rs_R006_ueqv_R006_partial_22_1941,
  rs_R006_ueqv_R006_partial_22_1942,
  rs_R006_ueqv_R006_partial_22_1943,
  rs_R006_ueqv_R006_partial_22_1944,
  rs_R006_ueqv_R006_partial_22_1945,
  rs_R006_ueqv_R006_partial_22_1946,
  rs_R006_ueqv_R006_partial_22_1947,
  rs_R006_ueqv_R006_partial_22_1948,
  rs_R006_ueqv_R006_partial_22_1949,
  rs_R006_ueqv_R006_partial_22_1950,
  rs_R006_ueqv_R006_partial_22_1951,
  rs_R006_ueqv_R006_partial_22_1952,
  rs_R006_ueqv_R006_partial_22_1953,
  rs_R006_ueqv_R006_partial_22_1954,
  rs_R006_ueqv_R006_partial_22_1955,
  rs_R006_ueqv_R006_partial_22_1956,
  rs_R006_ueqv_R006_partial_22_1957,
  rs_R006_ueqv_R006_partial_22_1958,
  rs_R006_ueqv_R006_partial_22_1959,
  rs_R006_ueqv_R006_partial_22_1960,
  rs_R006_ueqv_R006_partial_22_1961,
  rs_R006_ueqv_R006_partial_22_1962,
  rs_R006_ueqv_R006_partial_22_1963,
  rs_R006_ueqv_R006_partial_22_1964,
  rs_R006_ueqv_R006_partial_22_1965,
  rs_R006_ueqv_R006_partial_22_1966,
  rs_R006_ueqv_R006_partial_22_1967,
  rs_R006_ueqv_R006_partial_22_1968,
  rs_R006_ueqv_R006_partial_22_1969,
  rs_R006_ueqv_R006_partial_22_1970,
  rs_R006_ueqv_R006_partial_22_1971,
  rs_R006_ueqv_R006_partial_22_1972,
  rs_R006_ueqv_R006_partial_22_1973,
  rs_R006_ueqv_R006_partial_22_1974,
  rs_R006_ueqv_R006_partial_22_1975,
  rs_R006_ueqv_R006_partial_22_1976,
  rs_R006_ueqv_R006_partial_22_1977,
  rs_R006_ueqv_R006_partial_22_1978,
  rs_R006_ueqv_R006_partial_22_1979,
  rs_R006_ueqv_R006_partial_22_1980,
  rs_R006_ueqv_R006_partial_22_1981
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_22_1900_1981 : Poly :=
[
  term ((5184 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-4104 : Rat) / 5) [(9, 1), (10, 1), (15, 1)],
  term ((1368 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 5) [(9, 1), (13, 3), (14, 1)],
  term ((864 : Rat) / 5) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(9, 1), (13, 3), (16, 1)],
  term ((2052 : Rat) / 5) [(9, 1), (15, 1)],
  term ((-684 : Rat) / 5) [(9, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 7) [(9, 2), (10, 2), (13, 2)],
  term ((-3456 : Rat) / 5) [(9, 2), (10, 2), (13, 2), (14, 1)],
  term ((1152 : Rat) / 5) [(9, 2), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (10, 2), (13, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(9, 2), (13, 1), (15, 1)],
  term ((288 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 7) [(9, 2), (13, 2)],
  term ((864 : Rat) / 5) [(9, 2), (13, 2), (14, 1)],
  term ((-288 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(9, 2), (13, 2), (16, 1)],
  term ((-3 : Rat) / 10) [(10, 1)],
  term ((-6264 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1032 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2994 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1068 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1224 : Rat) / 7) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((1728 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term (-348 : Rat) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((552 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((432 : Rat) / 35) [(10, 1), (11, 1), (13, 1)],
  term (-120 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((5922 : Rat) / 25) [(10, 1), (11, 1), (15, 1)],
  term ((-1584 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1908 : Rat) / 5) [(10, 1), (11, 2)],
  term ((1908 : Rat) / 5) [(10, 1), (11, 2), (12, 1)],
  term (-276 : Rat) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term (-276 : Rat) [(10, 1), (11, 2), (14, 1)],
  term ((4 : Rat) / 5) [(10, 1), (11, 2), (16, 1)],
  term (-111 : Rat) [(10, 1), (12, 1)],
  term ((288 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-96 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 35) [(10, 1), (12, 1), (13, 2)],
  term ((552 : Rat) / 5) [(10, 1), (12, 1), (14, 1)],
  term (-6 : Rat) [(10, 1), (12, 1), (14, 2)],
  term (-6 : Rat) [(10, 1), (12, 1), (15, 2)],
  term ((-2 : Rat) / 5) [(10, 1), (12, 1), (16, 1)],
  term ((852 : Rat) / 5) [(10, 1), (12, 2)],
  term ((-684 : Rat) / 5) [(10, 1), (12, 2), (14, 1)],
  term ((-84 : Rat) / 25) [(10, 1), (13, 1), (15, 1)],
  term ((-72 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(10, 1), (13, 2)],
  term (12 : Rat) [(10, 1), (14, 1)],
  term ((9 : Rat) / 5) [(10, 1), (16, 1)],
  term ((3 : Rat) / 5) [(10, 2)],
  term ((-1908 : Rat) / 5) [(10, 2), (11, 1), (13, 1)],
  term (276 : Rat) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term (348 : Rat) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-552 : Rat) / 5) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1224 : Rat) / 7) [(10, 2), (12, 1), (13, 2)],
  term ((-1728 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (14, 1)],
  term ((576 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 5) [(10, 2), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(10, 2), (12, 1), (16, 1)],
  term ((-5706 : Rat) / 25) [(10, 2), (13, 1), (15, 1)],
  term ((1692 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(10, 2), (13, 2)],
  term ((696 : Rat) / 5) [(10, 2), (13, 2), (14, 1)],
  term ((-384 : Rat) / 5) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(10, 2), (13, 2), (16, 1)],
  term (-6 : Rat) [(10, 2), (14, 1)],
  term ((-9 : Rat) / 5) [(10, 2), (16, 1)],
  term ((3132 : Rat) / 35) [(11, 1), (12, 1), (13, 1)],
  term ((-516 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1497 : Rat) / 25) [(11, 1), (12, 1), (15, 1)],
  term ((-534 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((612 : Rat) / 7) [(11, 1), (12, 2), (13, 1)],
  term ((-864 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term (174 : Rat) [(11, 1), (12, 2), (15, 1)],
  term ((-276 : Rat) / 5) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3123 : Rat) / 35) [(11, 1), (13, 1)],
  term (-9 : Rat) [(11, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (17 : Rat) [(11, 1), (13, 1), (16, 1)],
  term ((-2961 : Rat) / 25) [(11, 1), (15, 1)],
  term ((792 : Rat) / 25) [(11, 1), (15, 1), (16, 1)],
  term ((-954 : Rat) / 5) [(11, 2)],
  term ((-954 : Rat) / 5) [(11, 2), (12, 1)],
  term (138 : Rat) [(11, 2), (12, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(11, 2), (12, 1), (16, 1)],
  term (138 : Rat) [(11, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(11, 2), (16, 1)],
  term ((111 : Rat) / 2) [(12, 1)],
  term ((-2319 : Rat) / 25) [(12, 1), (13, 1), (15, 1)],
  term ((738 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1566 : Rat) / 35) [(12, 1), (13, 2)],
  term ((432 : Rat) / 5) [(12, 1), (13, 2), (14, 1)],
  term ((-144 : Rat) / 5) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(12, 1), (13, 2), (16, 1)],
  term (-57 : Rat) [(12, 1), (14, 1)],
  term (3 : Rat) [(12, 1), (14, 2)],
  term (3 : Rat) [(12, 1), (15, 2)],
  term ((-2 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-426 : Rat) / 5) [(12, 2)],
  term ((342 : Rat) / 5) [(12, 2), (14, 1)],
  term ((2937 : Rat) / 50) [(13, 1), (15, 1)],
  term ((-387 : Rat) / 25) [(13, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 35) [(13, 2)],
  term ((-174 : Rat) / 5) [(13, 2), (14, 1)],
  term ((96 : Rat) / 5) [(13, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(13, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(14, 1)],
  term ((-9 : Rat) / 20) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 1900 through 1981. -/
theorem rs_R006_ueqv_R006_block_22_1900_1981_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_22_1900_1981
      rs_R006_ueqv_R006_block_22_1900_1981 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
