/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1900-1999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1900_1999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1900 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1900 : Poly :=
[
  term ((-312991299576725426056 : Rat) / 449152207880882925) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1900 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1900 : Poly :=
[
  term ((-625982599153450852112 : Rat) / 449152207880882925) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((312991299576725426056 : Rat) / 449152207880882925) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1900 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1900_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1900
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1900 := by
  native_decide

/-- Coefficient term 1901 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1901 : Poly :=
[
  term ((-17621170033906790686 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1901 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1901 : Poly :=
[
  term ((-35242340067813581372 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17621170033906790686 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1901 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1901_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1901
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1901 := by
  native_decide

/-- Coefficient term 1902 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1902 : Poly :=
[
  term ((1805550385240997376518 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1902 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1902 : Poly :=
[
  term ((3611100770481994753036 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1805550385240997376518 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1902 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1902_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1902
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1902 := by
  native_decide

/-- Coefficient term 1903 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1903 : Poly :=
[
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 1903 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1903 : Poly :=
[
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1903 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1903_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1903
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1903 := by
  native_decide

/-- Coefficient term 1904 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1904 : Poly :=
[
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 1904 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1904 : Poly :=
[
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1904 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1904_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1904
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1904 := by
  native_decide

/-- Coefficient term 1905 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1905 : Poly :=
[
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1905 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1905 : Poly :=
[
  term ((1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1905 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1905_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1905
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1905 := by
  native_decide

/-- Coefficient term 1906 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1906 : Poly :=
[
  term ((13883605965696577859 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1906 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1906 : Poly :=
[
  term ((-13883605965696577859 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((27767211931393155718 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1906 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1906_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1906
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1906 := by
  native_decide

/-- Coefficient term 1907 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1907 : Poly :=
[
  term ((1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1907 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1907 : Poly :=
[
  term ((3525387563878718992 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1907 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1907_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1907
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1907 := by
  native_decide

/-- Coefficient term 1908 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1908 : Poly :=
[
  term ((-31414655335600205084 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1908 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1908 : Poly :=
[
  term ((-62829310671200410168 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((31414655335600205084 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1908 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1908_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1908
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1908 := by
  native_decide

/-- Coefficient term 1909 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1909 : Poly :=
[
  term ((-17530066713737950929 : Rat) / 29943480525392195) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1909 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1909 : Poly :=
[
  term ((-35060133427475901858 : Rat) / 29943480525392195) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((17530066713737950929 : Rat) / 29943480525392195) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1909 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1909_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1909
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1909 := by
  native_decide

/-- Coefficient term 1910 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1910 : Poly :=
[
  term ((-35821389790448603824 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 1910 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1910 : Poly :=
[
  term ((-71642779580897207648 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((35821389790448603824 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1910 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1910_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1910
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1910 := by
  native_decide

/-- Coefficient term 1911 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1911 : Poly :=
[
  term ((-881346890969679748 : Rat) / 53898264945705951) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1911 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1911 : Poly :=
[
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1911 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1911_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1911
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1911 := by
  native_decide

/-- Coefficient term 1912 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1912 : Poly :=
[
  term ((-512859758358436344583 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1912 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1912 : Poly :=
[
  term ((-1025719516716872689166 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((512859758358436344583 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1912 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1912_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1912
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1912 := by
  native_decide

/-- Coefficient term 1913 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1913 : Poly :=
[
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1913 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1913 : Poly :=
[
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1913 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1913_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1913
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1913 := by
  native_decide

/-- Coefficient term 1914 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1914 : Poly :=
[
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1914 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1914 : Poly :=
[
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1914 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1914_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1914
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1914 := by
  native_decide

/-- Coefficient term 1915 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1915 : Poly :=
[
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1915 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1915 : Poly :=
[
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1915 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1915_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1915
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1915 := by
  native_decide

/-- Coefficient term 1916 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1916 : Poly :=
[
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1916 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1916 : Poly :=
[
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1916 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1916_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1916
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1916 := by
  native_decide

/-- Coefficient term 1917 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1917 : Poly :=
[
  term ((70878416415684928011 : Rat) / 149717402626960975) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1917 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1917 : Poly :=
[
  term ((-70878416415684928011 : Rat) / 149717402626960975) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((141756832831369856022 : Rat) / 149717402626960975) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1917 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1917_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1917
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1917 := by
  native_decide

/-- Coefficient term 1918 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1918 : Poly :=
[
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1918 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1918 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(5, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1918 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1918_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1918
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1918 := by
  native_decide

/-- Coefficient term 1919 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1919 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1919 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1919 : Poly :=
[
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1919 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1919_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1919
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1919 := by
  native_decide

/-- Coefficient term 1920 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1920 : Poly :=
[
  term ((-88883341065385468532 : Rat) / 269491324728529755) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1920 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1920 : Poly :=
[
  term ((-177766682130770937064 : Rat) / 269491324728529755) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((88883341065385468532 : Rat) / 269491324728529755) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1920 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1920_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1920
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1920 := by
  native_decide

/-- Coefficient term 1921 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1921 : Poly :=
[
  term ((20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1921 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1921 : Poly :=
[
  term ((40725580086896618888 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1921 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1921_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1921
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1921 := by
  native_decide

/-- Coefficient term 1922 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1922 : Poly :=
[
  term ((613966313816800821784 : Rat) / 449152207880882925) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1922 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1922 : Poly :=
[
  term ((1227932627633601643568 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-613966313816800821784 : Rat) / 449152207880882925) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1922 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1922_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1922
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1922 := by
  native_decide

/-- Coefficient term 1923 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1923 : Poly :=
[
  term ((2212321408659751467 : Rat) / 149717402626960975) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 1923 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1923 : Poly :=
[
  term ((4424642817319502934 : Rat) / 149717402626960975) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2212321408659751467 : Rat) / 149717402626960975) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1923 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1923_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1923
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1923 := by
  native_decide

/-- Coefficient term 1924 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1924 : Poly :=
[
  term ((20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1924 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1924 : Poly :=
[
  term ((40725580086896618888 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1924 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1924_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1924
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1924 := by
  native_decide

/-- Coefficient term 1925 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1925 : Poly :=
[
  term ((-231500491052961624991 : Rat) / 269491324728529755) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1925 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1925 : Poly :=
[
  term ((-463000982105923249982 : Rat) / 269491324728529755) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((231500491052961624991 : Rat) / 269491324728529755) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1925 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1925_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1925
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1925 := by
  native_decide

/-- Coefficient term 1926 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1926 : Poly :=
[
  term ((44581866023163436792 : Rat) / 1347456623642648775) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1926 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1926 : Poly :=
[
  term ((89163732046326873584 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44581866023163436792 : Rat) / 1347456623642648775) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1926 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1926_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1926
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1926 := by
  native_decide

/-- Coefficient term 1927 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1927 : Poly :=
[
  term ((6449510981406636697 : Rat) / 449152207880882925) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1927 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1927 : Poly :=
[
  term ((12899021962813273394 : Rat) / 449152207880882925) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6449510981406636697 : Rat) / 449152207880882925) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1927 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1927_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1927
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1927 := by
  native_decide

/-- Coefficient term 1928 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1928 : Poly :=
[
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 1928 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1928 : Poly :=
[
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1928 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1928_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1928
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1928 := by
  native_decide

/-- Coefficient term 1929 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1929 : Poly :=
[
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1929 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1929 : Poly :=
[
  term ((-86031302831488000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1929 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1929_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1929
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1929 := by
  native_decide

/-- Coefficient term 1930 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1930 : Poly :=
[
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1930 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1930 : Poly :=
[
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1930 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1930_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1930
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1930 := by
  native_decide

/-- Coefficient term 1931 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1931 : Poly :=
[
  term ((-422336152228357760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1931 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1931 : Poly :=
[
  term ((-844672304456715520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((422336152228357760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1931 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1931_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1931
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1931 := by
  native_decide

/-- Coefficient term 1932 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1932 : Poly :=
[
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 1932 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1932 : Poly :=
[
  term ((-107610601457623040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1932 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1932_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1932
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1932 := by
  native_decide

/-- Coefficient term 1933 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1933 : Poly :=
[
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 1933 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1933 : Poly :=
[
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1933 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1933_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1933
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1933 := by
  native_decide

/-- Coefficient term 1934 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1934 : Poly :=
[
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1934 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1934 : Poly :=
[
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1934 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1934_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1934
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1934 := by
  native_decide

/-- Coefficient term 1935 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1935 : Poly :=
[
  term ((-32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1935 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1935 : Poly :=
[
  term ((-64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1935 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1935_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1935
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1935 := by
  native_decide

/-- Coefficient term 1936 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1936 : Poly :=
[
  term ((162412250592961600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1936 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1936 : Poly :=
[
  term ((324824501185923200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-162412250592961600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1936 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1936_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1936
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1936 := by
  native_decide

/-- Coefficient term 1937 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1937 : Poly :=
[
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1937 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1937 : Poly :=
[
  term ((297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-594307739164052480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1937 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1937_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1937
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1937 := by
  native_decide

/-- Coefficient term 1938 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1938 : Poly :=
[
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1938 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1938 : Poly :=
[
  term ((-32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1938 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1938_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1938
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1938 := by
  native_decide

/-- Coefficient term 1939 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1939 : Poly :=
[
  term ((297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1939 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1939 : Poly :=
[
  term ((594307739164052480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1939 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1939_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1939
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1939 := by
  native_decide

/-- Coefficient term 1940 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1940 : Poly :=
[
  term ((148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1940 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1940 : Poly :=
[
  term ((297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1940 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1940_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1940
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1940 := by
  native_decide

/-- Coefficient term 1941 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1941 : Poly :=
[
  term ((288852880687007232 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1941 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1941 : Poly :=
[
  term ((577705761374014464 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-288852880687007232 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1941 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1941_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1941
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1941 := by
  native_decide

/-- Coefficient term 1942 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1942 : Poly :=
[
  term ((-148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1942 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1942 : Poly :=
[
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1942 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1942_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1942
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1942 := by
  native_decide

/-- Coefficient term 1943 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1943 : Poly :=
[
  term ((-3174786011835080768 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1943 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1943 : Poly :=
[
  term ((-6349572023670161536 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((3174786011835080768 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1943 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1943_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1943
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1943 := by
  native_decide

/-- Coefficient term 1944 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1944 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1944 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1944 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1944 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1944_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1944
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1944 := by
  native_decide

/-- Coefficient term 1945 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1945 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1945 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1945 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1945 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1945_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1945
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1945 := by
  native_decide

/-- Coefficient term 1946 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1946 : Poly :=
[
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1946 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1946 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1946 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1946_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1946
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1946 := by
  native_decide

/-- Coefficient term 1947 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1947 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1947 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1947 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1947 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1947_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1947
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1947 := by
  native_decide

/-- Coefficient term 1948 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1948 : Poly :=
[
  term ((790011652830280096 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1948 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1948 : Poly :=
[
  term ((-790011652830280096 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1580023305660560192 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1948 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1948_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1948
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1948 := by
  native_decide

/-- Coefficient term 1949 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1949 : Poly :=
[
  term ((-1201886480277035552 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1949 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1949 : Poly :=
[
  term ((-2403772960554071104 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1201886480277035552 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1949 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1949_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1949
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1949 := by
  native_decide

/-- Coefficient term 1950 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1950 : Poly :=
[
  term ((1551610409085096016 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1950 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1950 : Poly :=
[
  term ((3103220818170192032 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1551610409085096016 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1950 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1950_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1950
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1950 := by
  native_decide

/-- Coefficient term 1951 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1951 : Poly :=
[
  term ((8381582345180311168 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1951 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1951 : Poly :=
[
  term ((16763164690360622336 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8381582345180311168 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1951 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1951_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1951
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1951 := by
  native_decide

/-- Coefficient term 1952 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1952 : Poly :=
[
  term ((-1904127682937951728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1952 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1952 : Poly :=
[
  term ((-3808255365875903456 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1904127682937951728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1952 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1952_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1952
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1952 := by
  native_decide

/-- Coefficient term 1953 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1953 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 1953 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1953 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1953 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1953_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1953
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1953 := by
  native_decide

/-- Coefficient term 1954 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1954 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1954 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1954 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1954 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1954_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1954
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1954 := by
  native_decide

/-- Coefficient term 1955 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1955 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1955 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1955 : Poly :=
[
  term ((-765893521979801600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1955 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1955_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1955
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1955 := by
  native_decide

/-- Coefficient term 1956 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1956 : Poly :=
[
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1956 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1956 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1956 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1956_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1956
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1956 := by
  native_decide

/-- Coefficient term 1957 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1957 : Poly :=
[
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1957 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1957 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1957 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1957_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1957
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1957 := by
  native_decide

/-- Coefficient term 1958 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1958 : Poly :=
[
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1958 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1958 : Poly :=
[
  term ((-185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((371570938350848000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1958 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1958_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1958
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1958 := by
  native_decide

/-- Coefficient term 1959 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1959 : Poly :=
[
  term ((-185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1959 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1959 : Poly :=
[
  term ((-371570938350848000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1959 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1959_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1959
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1959 := by
  native_decide

/-- Coefficient term 1960 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1960 : Poly :=
[
  term ((-92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1960 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1960 : Poly :=
[
  term ((-185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1960 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1960_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1960
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1960 := by
  native_decide

/-- Coefficient term 1961 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1961 : Poly :=
[
  term ((-34380628186366473728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1961 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1961 : Poly :=
[
  term ((-68761256372732947456 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((34380628186366473728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1961 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1961_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1961
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1961 := by
  native_decide

/-- Coefficient term 1962 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1962 : Poly :=
[
  term ((92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1962 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1962 : Poly :=
[
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1962 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1962_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1962
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1962 := by
  native_decide

/-- Coefficient term 1963 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1963 : Poly :=
[
  term ((34098371997923731328 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 1963 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1963 : Poly :=
[
  term ((68196743995847462656 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-34098371997923731328 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1963 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1963_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1963
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1963 := by
  native_decide

/-- Coefficient term 1964 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1964 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1964 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1964 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1964 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1964_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1964
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1964 := by
  native_decide

/-- Coefficient term 1965 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1965 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1965 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1965 : Poly :=
[
  term ((2228053882123059200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1965 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1965_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1965
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1965 := by
  native_decide

/-- Coefficient term 1966 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1966 : Poly :=
[
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 1966 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1966 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1966 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1966_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1966
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1966 := by
  native_decide

/-- Coefficient term 1967 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1967 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1967 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1967 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1967 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1967_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1967
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1967 := by
  native_decide

/-- Coefficient term 1968 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1968 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1968 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1968 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1968 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1968_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1968
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1968 := by
  native_decide

/-- Coefficient term 1969 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1969 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1969 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1969 : Poly :=
[
  term ((2181428819547235936 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1969 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1969_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1969
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1969 := by
  native_decide

/-- Coefficient term 1970 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1970 : Poly :=
[
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1970 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1970 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1970 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1970_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1970
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1970 := by
  native_decide

/-- Coefficient term 1971 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1971 : Poly :=
[
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1971 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1971 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1971 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1971_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1971
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1971 := by
  native_decide

/-- Coefficient term 1972 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1972 : Poly :=
[
  term ((74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 1972 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1972 : Poly :=
[
  term ((149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1972 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1972_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1972
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1972 := by
  native_decide

/-- Coefficient term 1973 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1973 : Poly :=
[
  term ((-141236081560815792392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)]
]

/-- Partial product 1973 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1973 : Poly :=
[
  term ((-282472163121631584784 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (12, 1), (16, 1)],
  term ((141236081560815792392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1973 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1973_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1973
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1973 := by
  native_decide

/-- Coefficient term 1974 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1974 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1974 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1974 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1974 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1974_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1974
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1974 := by
  native_decide

/-- Coefficient term 1975 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1975 : Poly :=
[
  term ((16758142704080604992 : Rat) / 269491324728529755) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1975 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1975 : Poly :=
[
  term ((33516285408161209984 : Rat) / 269491324728529755) [(5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16758142704080604992 : Rat) / 269491324728529755) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1975 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1975_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1975
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1975 := by
  native_decide

/-- Coefficient term 1976 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1976 : Poly :=
[
  term ((51043850186359360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1976 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1976 : Poly :=
[
  term ((102087700372718720 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-51043850186359360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1976 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1976_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1976
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1976 := by
  native_decide

/-- Coefficient term 1977 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1977 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1977 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1977 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1977 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1977_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1977
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1977 := by
  native_decide

/-- Coefficient term 1978 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1978 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1978 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1978 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1978 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1978_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1978
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1978 := by
  native_decide

/-- Coefficient term 1979 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1979 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 1979 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1979 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1979 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1979_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1979
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1979 := by
  native_decide

/-- Coefficient term 1980 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1980 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1980 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1980 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1980 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1980_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1980
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1980 := by
  native_decide

/-- Coefficient term 1981 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1981 : Poly :=
[
  term ((32482450118592320 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1981 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1981 : Poly :=
[
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1981 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1981_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1981
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1981 := by
  native_decide

/-- Coefficient term 1982 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1982 : Poly :=
[
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1982 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1982 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1982 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1982_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1982
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1982 := by
  native_decide

/-- Coefficient term 1983 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1983 : Poly :=
[
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 1983 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1983 : Poly :=
[
  term ((241298200880971520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1983 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1983_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1983
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1983 := by
  native_decide

/-- Coefficient term 1984 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1984 : Poly :=
[
  term ((2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1984 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1984 : Poly :=
[
  term ((5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1984 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1984_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1984
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1984 := by
  native_decide

/-- Coefficient term 1985 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1985 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1985 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1985 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1985 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1985_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1985
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1985 := by
  native_decide

/-- Coefficient term 1986 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1986 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1986 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1986 : Poly :=
[
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1986 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1986_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1986
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1986 := by
  native_decide

/-- Coefficient term 1987 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1987 : Poly :=
[
  term ((-589984658069400607688 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1987 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1987 : Poly :=
[
  term ((-1179969316138801215376 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((589984658069400607688 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1987 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1987_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1987
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1987 := by
  native_decide

/-- Coefficient term 1988 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1988 : Poly :=
[
  term ((-5338562233789974464 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1988 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1988 : Poly :=
[
  term ((-10677124467579948928 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((5338562233789974464 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1988 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1988_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1988
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1988 := by
  native_decide

/-- Coefficient term 1989 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1989 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 1989 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1989 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1989 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1989_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1989
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1989 := by
  native_decide

/-- Coefficient term 1990 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1990 : Poly :=
[
  term ((590945470729450558088 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1990 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1990 : Poly :=
[
  term ((1181890941458901116176 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-590945470729450558088 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1990 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1990_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1990
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1990 := by
  native_decide

/-- Coefficient term 1991 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1991 : Poly :=
[
  term ((-318610277919885920 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1991 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1991 : Poly :=
[
  term ((-637220555839771840 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((318610277919885920 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1991 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1991_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1991
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1991 := by
  native_decide

/-- Coefficient term 1992 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1992 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1992 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1992 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1992 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1992_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1992
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1992 := by
  native_decide

/-- Coefficient term 1993 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1993 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1993 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1993 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1993 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1993_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1993
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1993 := by
  native_decide

/-- Coefficient term 1994 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1994 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1994 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1994 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1994 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1994_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1994
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1994 := by
  native_decide

/-- Coefficient term 1995 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1995 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1995 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1995 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1995 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1995_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1995
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1995 := by
  native_decide

/-- Coefficient term 1996 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1996 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1996 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1996 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1996 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1996_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1996
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1996 := by
  native_decide

/-- Coefficient term 1997 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1997 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1997 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1997 : Poly :=
[
  term ((-131236952121139200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1997 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1997_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1997
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1997 := by
  native_decide

/-- Coefficient term 1998 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1998 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1998 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1998 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1998 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1998_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1998
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1998 := by
  native_decide

/-- Coefficient term 1999 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1999 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1999 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1999 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1999 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1999_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1999
        rs_R010_ueqv_R010YNN_generator_25_1900_1999 =
      rs_R010_ueqv_R010YNN_partial_25_1999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1900_1999 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1900,
  rs_R010_ueqv_R010YNN_partial_25_1901,
  rs_R010_ueqv_R010YNN_partial_25_1902,
  rs_R010_ueqv_R010YNN_partial_25_1903,
  rs_R010_ueqv_R010YNN_partial_25_1904,
  rs_R010_ueqv_R010YNN_partial_25_1905,
  rs_R010_ueqv_R010YNN_partial_25_1906,
  rs_R010_ueqv_R010YNN_partial_25_1907,
  rs_R010_ueqv_R010YNN_partial_25_1908,
  rs_R010_ueqv_R010YNN_partial_25_1909,
  rs_R010_ueqv_R010YNN_partial_25_1910,
  rs_R010_ueqv_R010YNN_partial_25_1911,
  rs_R010_ueqv_R010YNN_partial_25_1912,
  rs_R010_ueqv_R010YNN_partial_25_1913,
  rs_R010_ueqv_R010YNN_partial_25_1914,
  rs_R010_ueqv_R010YNN_partial_25_1915,
  rs_R010_ueqv_R010YNN_partial_25_1916,
  rs_R010_ueqv_R010YNN_partial_25_1917,
  rs_R010_ueqv_R010YNN_partial_25_1918,
  rs_R010_ueqv_R010YNN_partial_25_1919,
  rs_R010_ueqv_R010YNN_partial_25_1920,
  rs_R010_ueqv_R010YNN_partial_25_1921,
  rs_R010_ueqv_R010YNN_partial_25_1922,
  rs_R010_ueqv_R010YNN_partial_25_1923,
  rs_R010_ueqv_R010YNN_partial_25_1924,
  rs_R010_ueqv_R010YNN_partial_25_1925,
  rs_R010_ueqv_R010YNN_partial_25_1926,
  rs_R010_ueqv_R010YNN_partial_25_1927,
  rs_R010_ueqv_R010YNN_partial_25_1928,
  rs_R010_ueqv_R010YNN_partial_25_1929,
  rs_R010_ueqv_R010YNN_partial_25_1930,
  rs_R010_ueqv_R010YNN_partial_25_1931,
  rs_R010_ueqv_R010YNN_partial_25_1932,
  rs_R010_ueqv_R010YNN_partial_25_1933,
  rs_R010_ueqv_R010YNN_partial_25_1934,
  rs_R010_ueqv_R010YNN_partial_25_1935,
  rs_R010_ueqv_R010YNN_partial_25_1936,
  rs_R010_ueqv_R010YNN_partial_25_1937,
  rs_R010_ueqv_R010YNN_partial_25_1938,
  rs_R010_ueqv_R010YNN_partial_25_1939,
  rs_R010_ueqv_R010YNN_partial_25_1940,
  rs_R010_ueqv_R010YNN_partial_25_1941,
  rs_R010_ueqv_R010YNN_partial_25_1942,
  rs_R010_ueqv_R010YNN_partial_25_1943,
  rs_R010_ueqv_R010YNN_partial_25_1944,
  rs_R010_ueqv_R010YNN_partial_25_1945,
  rs_R010_ueqv_R010YNN_partial_25_1946,
  rs_R010_ueqv_R010YNN_partial_25_1947,
  rs_R010_ueqv_R010YNN_partial_25_1948,
  rs_R010_ueqv_R010YNN_partial_25_1949,
  rs_R010_ueqv_R010YNN_partial_25_1950,
  rs_R010_ueqv_R010YNN_partial_25_1951,
  rs_R010_ueqv_R010YNN_partial_25_1952,
  rs_R010_ueqv_R010YNN_partial_25_1953,
  rs_R010_ueqv_R010YNN_partial_25_1954,
  rs_R010_ueqv_R010YNN_partial_25_1955,
  rs_R010_ueqv_R010YNN_partial_25_1956,
  rs_R010_ueqv_R010YNN_partial_25_1957,
  rs_R010_ueqv_R010YNN_partial_25_1958,
  rs_R010_ueqv_R010YNN_partial_25_1959,
  rs_R010_ueqv_R010YNN_partial_25_1960,
  rs_R010_ueqv_R010YNN_partial_25_1961,
  rs_R010_ueqv_R010YNN_partial_25_1962,
  rs_R010_ueqv_R010YNN_partial_25_1963,
  rs_R010_ueqv_R010YNN_partial_25_1964,
  rs_R010_ueqv_R010YNN_partial_25_1965,
  rs_R010_ueqv_R010YNN_partial_25_1966,
  rs_R010_ueqv_R010YNN_partial_25_1967,
  rs_R010_ueqv_R010YNN_partial_25_1968,
  rs_R010_ueqv_R010YNN_partial_25_1969,
  rs_R010_ueqv_R010YNN_partial_25_1970,
  rs_R010_ueqv_R010YNN_partial_25_1971,
  rs_R010_ueqv_R010YNN_partial_25_1972,
  rs_R010_ueqv_R010YNN_partial_25_1973,
  rs_R010_ueqv_R010YNN_partial_25_1974,
  rs_R010_ueqv_R010YNN_partial_25_1975,
  rs_R010_ueqv_R010YNN_partial_25_1976,
  rs_R010_ueqv_R010YNN_partial_25_1977,
  rs_R010_ueqv_R010YNN_partial_25_1978,
  rs_R010_ueqv_R010YNN_partial_25_1979,
  rs_R010_ueqv_R010YNN_partial_25_1980,
  rs_R010_ueqv_R010YNN_partial_25_1981,
  rs_R010_ueqv_R010YNN_partial_25_1982,
  rs_R010_ueqv_R010YNN_partial_25_1983,
  rs_R010_ueqv_R010YNN_partial_25_1984,
  rs_R010_ueqv_R010YNN_partial_25_1985,
  rs_R010_ueqv_R010YNN_partial_25_1986,
  rs_R010_ueqv_R010YNN_partial_25_1987,
  rs_R010_ueqv_R010YNN_partial_25_1988,
  rs_R010_ueqv_R010YNN_partial_25_1989,
  rs_R010_ueqv_R010YNN_partial_25_1990,
  rs_R010_ueqv_R010YNN_partial_25_1991,
  rs_R010_ueqv_R010YNN_partial_25_1992,
  rs_R010_ueqv_R010YNN_partial_25_1993,
  rs_R010_ueqv_R010YNN_partial_25_1994,
  rs_R010_ueqv_R010YNN_partial_25_1995,
  rs_R010_ueqv_R010YNN_partial_25_1996,
  rs_R010_ueqv_R010YNN_partial_25_1997,
  rs_R010_ueqv_R010YNN_partial_25_1998,
  rs_R010_ueqv_R010YNN_partial_25_1999
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1900_1999 : Poly :=
[
  term ((-625982599153450852112 : Rat) / 449152207880882925) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-35242340067813581372 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3611100770481994753036 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((312991299576725426056 : Rat) / 449152207880882925) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((17621170033906790686 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1805550385240997376518 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62829310671200410168 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35060133427475901858 : Rat) / 29943480525392195) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-71642779580897207648 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-41584124907302770681 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((27767211931393155718 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31414655335600205084 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17530066713737950929 : Rat) / 29943480525392195) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((35821389790448603824 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((512859758358436344583 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-177766682130770937064 : Rat) / 269491324728529755) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((40725580086896618888 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1227932627633601643568 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4424642817319502934 : Rat) / 149717402626960975) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((40725580086896618888 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-463000982105923249982 : Rat) / 269491324728529755) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((89163732046326873584 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-199736227284241510639 : Rat) / 449152207880882925) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((141756832831369856022 : Rat) / 149717402626960975) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((88883341065385468532 : Rat) / 269491324728529755) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-613966313816800821784 : Rat) / 449152207880882925) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2212321408659751467 : Rat) / 149717402626960975) [(5, 1), (13, 1), (16, 1)],
  term ((-20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((231500491052961624991 : Rat) / 269491324728529755) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44581866023163436792 : Rat) / 1347456623642648775) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6449510981406636697 : Rat) / 449152207880882925) [(5, 1), (15, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (15, 3), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-844672304456715520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((422336152228357760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((324824501185923200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-162412250592961600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((577705761374014464 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6447019374025938496 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-594307739164052480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288852880687007232 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3174786011835080768 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2403772960554071104 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3103220818170192032 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((16763164690360622336 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7758313630027303936 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1580023305660560192 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1201886480277035552 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1551610409085096016 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-8381582345180311168 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1904127682937951728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68761256372732947456 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((68196743995847462656 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((371570938350848000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((34380628186366473728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-34098371997923731328 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-282472163121631584784 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (12, 1), (16, 1)],
  term ((-74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 1), (16, 1)],
  term ((141236081560815792392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((33516285408161209984 : Rat) / 269491324728529755) [(5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((102087700372718720 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-16758142704080604992 : Rat) / 269491324728529755) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-51043850186359360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1179969316138801215376 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10677124467579948928 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-637220555839771840 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((589984658069400607688 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5338562233789974464 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-590945470729450558088 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((318610277919885920 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1900 through 1999. -/
theorem rs_R010_ueqv_R010YNN_block_25_1900_1999_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1900_1999
      rs_R010_ueqv_R010YNN_block_25_1900_1999 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
