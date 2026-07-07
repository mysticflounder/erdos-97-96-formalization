/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:900-999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0900 : Poly :=
[
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 900 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0900 : Poly :=
[
  term ((-9587976173677788904192 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0900_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0900
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0901 : Poly :=
[
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 901 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0901 : Poly :=
[
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((386671821580875990016 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0901_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0901
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0902 : Poly :=
[
  term ((773343643161751980032 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 902 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0902 : Poly :=
[
  term ((1546687286323503960064 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0902_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0902
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0903 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 903 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0903 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0903_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0903
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0904 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 904 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0904 : Poly :=
[
  term ((1016830741658009600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0904_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0904
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0905 : Poly :=
[
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 905 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0905 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0905_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0905
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0906 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 906 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0906 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0906_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0906
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0907 : Poly :=
[
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 907 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0907 : Poly :=
[
  term ((-3519927064730746880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((1759963532365373440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0907_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0907
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0908 : Poly :=
[
  term ((3519927064730746880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 908 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0908 : Poly :=
[
  term ((7039854129461493760 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-3519927064730746880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0908_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0908
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0909 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (15, 3), (16, 1)]
]

/-- Partial product 909 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0909 : Poly :=
[
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0909_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0909
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0910 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 910 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0910 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0910_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0910
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0911 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (15, 2), (16, 1)]
]

/-- Partial product 911 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0911 : Poly :=
[
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0911_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0911
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0912 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 912 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0912 : Poly :=
[
  term ((2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0912_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0912
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0913 : Poly :=
[
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 913 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0913 : Poly :=
[
  term ((-5172010046989242880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0913_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0913
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0914 : Poly :=
[
  term ((83538665408310774176 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 914 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0914 : Poly :=
[
  term ((167077330816621548352 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0914_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0914
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0915 : Poly :=
[
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 915 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0915 : Poly :=
[
  term ((-334154661633243096704 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((167077330816621548352 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0915_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0915
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0916 : Poly :=
[
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 916 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0916 : Poly :=
[
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0916_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0916
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0917 : Poly :=
[
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

/-- Partial product 917 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0917 : Poly :=
[
  term ((-13733191957294222900256 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0917_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0917
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0918 : Poly :=
[
  term ((259859600948738560 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 918 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0918 : Poly :=
[
  term ((519719201897477120 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-259859600948738560 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0918_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0918
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0919 : Poly :=
[
  term ((-519719201897477120 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 919 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0919 : Poly :=
[
  term ((-1039438403794954240 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((519719201897477120 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0919_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0919
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0920 : Poly :=
[
  term ((74245600271068160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 920 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0920 : Poly :=
[
  term ((148491200542136320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0920_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0920
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0921 : Poly :=
[
  term ((-148491200542136320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 921 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0921 : Poly :=
[
  term ((-296982401084272640 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0921_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0921
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0922 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 922 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0922 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0922_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0922
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0923 : Poly :=
[
  term ((593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 923 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0923 : Poly :=
[
  term ((1187929604337090560 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0923_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0923
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0924 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 924 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0924 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0924_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0924
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0925 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 925 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0925 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0925_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0925
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0926 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 926 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0926 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0926_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0926
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0927 : Poly :=
[
  term ((41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 927 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0927 : Poly :=
[
  term ((83224183161418754048 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0927_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0927
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0928 : Poly :=
[
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 928 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0928 : Poly :=
[
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((36438665092662494464 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0928_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0928
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0929 : Poly :=
[
  term ((72877330185324988928 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 929 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0929 : Poly :=
[
  term ((145754660370649977856 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0929_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0929
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0930 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 930 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0930 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0930_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0930
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0931 : Poly :=
[
  term ((453263699805130717184 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 931 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0931 : Poly :=
[
  term ((906527399610261434368 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0931_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0931
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0932 : Poly :=
[
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 932 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0932 : Poly :=
[
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((11535545852957006848 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0932_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0932
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0933 : Poly :=
[
  term ((23071091705914013696 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 933 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0933 : Poly :=
[
  term ((46142183411828027392 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0933_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0933
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0934 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 934 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0934 : Poly :=
[
  term ((8221608130482072320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0934_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0934
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0935 : Poly :=
[
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 935 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0935 : Poly :=
[
  term ((-16443216260964144640 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0935_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0935
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0936 : Poly :=
[
  term ((1999635241693123584 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 936 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0936 : Poly :=
[
  term ((3999270483386247168 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0936_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0936
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0937 : Poly :=
[
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 937 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0937 : Poly :=
[
  term ((-7998540966772494336 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3999270483386247168 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0937_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0937
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0938 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 938 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0938 : Poly :=
[
  term ((847286364886279029056 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0938_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0938
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0939 : Poly :=
[
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 939 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0939 : Poly :=
[
  term ((-1694572729772558058112 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0939_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0939
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0940 : Poly :=
[
  term ((27910621157975494400 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 940 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0940 : Poly :=
[
  term ((55821242315950988800 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0940_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0940
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0941 : Poly :=
[
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 941 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0941 : Poly :=
[
  term ((-111642484631901977600 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((55821242315950988800 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0941_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0941
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0942 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 942 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0942 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0942_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0942
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0943 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 943 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0943 : Poly :=
[
  term ((1902887332950016000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0943_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0943
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0944 : Poly :=
[
  term ((2353134503918316800 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 944 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0944 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0944_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0944
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0945 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 945 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0945 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0945_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0945
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0946 : Poly :=
[
  term ((18939358745034804736 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 946 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0946 : Poly :=
[
  term ((37878717490069609472 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0946_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0946
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0947 : Poly :=
[
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 947 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0947 : Poly :=
[
  term ((-75757434980139218944 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((37878717490069609472 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0947_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0947
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0948 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 948 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0948 : Poly :=
[
  term ((37650152062693068800 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0948_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0948
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0949 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 949 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0949 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0949_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0949
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0950 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 950 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0950 : Poly :=
[
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0950_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0950
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0951 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(2, 1), (5, 3), (13, 1), (16, 1)]
]

/-- Partial product 951 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0951 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(2, 1), (5, 3), (12, 1), (13, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(2, 1), (5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0951_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0951
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0952 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(2, 1), (5, 3), (15, 1), (16, 1)]
]

/-- Partial product 952 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0952 : Poly :=
[
  term ((15176235140919907840 : Rat) / 53898264945705951) [(2, 1), (5, 3), (12, 1), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(2, 1), (5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0952_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0952
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0953 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 953 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0953 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0953_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0953
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0954 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 954 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0954 : Poly :=
[
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0954_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0954
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0955 : Poly :=
[
  term (4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 955 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0955 : Poly :=
[
  term (8 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0955_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0955
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0956 : Poly :=
[
  term (-8 : Rat) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 956 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0956 : Poly :=
[
  term (-16 : Rat) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0956_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0956
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0957 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 957 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0957 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0957_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0957
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0958 : Poly :=
[
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 958 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0958 : Poly :=
[
  term ((-101550138081280000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0958_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0958
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0959 : Poly :=
[
  term ((-12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 959 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0959 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0959_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0959
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0960 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 960 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0960 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0960_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0960
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0961 : Poly :=
[
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 961 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0961 : Poly :=
[
  term ((-501539731434885970048 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0961_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0961
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0962 : Poly :=
[
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 962 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0962 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0962_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0962
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0963 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 963 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0963 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0963_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0963
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0964 : Poly :=
[
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 964 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0964 : Poly :=
[
  term ((4572188843769774080 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0964_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0964
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0965 : Poly :=
[
  term ((571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 965 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0965 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0965_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0965
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0966 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 966 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0966 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0966_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0966
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0967 : Poly :=
[
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 967 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0967 : Poly :=
[
  term ((-8640747765166899200 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0967_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0967
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0968 : Poly :=
[
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 968 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0968 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0968_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0968
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0969 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 969 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0969 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0969_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0969
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0970 : Poly :=
[
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 970 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0970 : Poly :=
[
  term ((-103234662752321952064 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0970_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0970
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0971 : Poly :=
[
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 971 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0971 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0971_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0971
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0972 : Poly :=
[
  term (-4 : Rat) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 972 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0972 : Poly :=
[
  term (4 : Rat) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0972_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0972
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0973 : Poly :=
[
  term (8 : Rat) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 973 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0973 : Poly :=
[
  term (16 : Rat) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0973_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0973
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0974 : Poly :=
[
  term (2 : Rat) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 974 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0974 : Poly :=
[
  term (4 : Rat) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0974_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0974
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0975 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 975 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0975 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0975_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0975
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0976 : Poly :=
[
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 976 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0976 : Poly :=
[
  term ((-11779099177210697728 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0976_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0976
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0977 : Poly :=
[
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 977 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0977 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0977_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0977
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0978 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 978 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0978 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0978_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0978
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0979 : Poly :=
[
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 979 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0979 : Poly :=
[
  term ((101550138081280000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0979_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0979
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0980 : Poly :=
[
  term ((12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 980 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0980 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0980_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0980
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0981 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 981 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0981 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0981_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0981
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0982 : Poly :=
[
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 982 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0982 : Poly :=
[
  term ((501539731434885970048 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0982_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0982
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0983 : Poly :=
[
  term ((62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 983 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0983 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0983_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0983
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0984 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 984 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0984 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0984_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0984
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0985 : Poly :=
[
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 985 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0985 : Poly :=
[
  term ((-4572188843769774080 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0985_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0985
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0986 : Poly :=
[
  term ((-571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 986 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0986 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0986_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0986
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0987 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 987 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0987 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0987_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0987
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0988 : Poly :=
[
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 988 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0988 : Poly :=
[
  term ((-14811927865666629632 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0988_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0988
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0989 : Poly :=
[
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 989 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0989 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0989_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0989
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0990 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 1), (16, 1)]
]

/-- Partial product 990 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0990 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0990_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0990
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0991 : Poly :=
[
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 991 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0991 : Poly :=
[
  term ((8640747765166899200 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0991_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0991
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0992 : Poly :=
[
  term ((1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (16, 1)]
]

/-- Partial product 992 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0992 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0992_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0992
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0993 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 993 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0993 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0993_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0993
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0994 : Poly :=
[
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 994 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0994 : Poly :=
[
  term ((103234662752321952064 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0994_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0994
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0995 : Poly :=
[
  term ((12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)]
]

/-- Partial product 995 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0995 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0995_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0995
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0996 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 996 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0996 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0996_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0996
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0997 : Poly :=
[
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 997 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0997 : Poly :=
[
  term ((11779099177210697728 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0997_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0997
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0998 : Poly :=
[
  term ((1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 998 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0998 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0998_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0998
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0999 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 999 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0999 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0999_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0999
        rs_R010_ueqv_R010YNN_generator_25_0900_0999 =
      rs_R010_ueqv_R010YNN_partial_25_0999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_0900_0999 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_0900,
  rs_R010_ueqv_R010YNN_partial_25_0901,
  rs_R010_ueqv_R010YNN_partial_25_0902,
  rs_R010_ueqv_R010YNN_partial_25_0903,
  rs_R010_ueqv_R010YNN_partial_25_0904,
  rs_R010_ueqv_R010YNN_partial_25_0905,
  rs_R010_ueqv_R010YNN_partial_25_0906,
  rs_R010_ueqv_R010YNN_partial_25_0907,
  rs_R010_ueqv_R010YNN_partial_25_0908,
  rs_R010_ueqv_R010YNN_partial_25_0909,
  rs_R010_ueqv_R010YNN_partial_25_0910,
  rs_R010_ueqv_R010YNN_partial_25_0911,
  rs_R010_ueqv_R010YNN_partial_25_0912,
  rs_R010_ueqv_R010YNN_partial_25_0913,
  rs_R010_ueqv_R010YNN_partial_25_0914,
  rs_R010_ueqv_R010YNN_partial_25_0915,
  rs_R010_ueqv_R010YNN_partial_25_0916,
  rs_R010_ueqv_R010YNN_partial_25_0917,
  rs_R010_ueqv_R010YNN_partial_25_0918,
  rs_R010_ueqv_R010YNN_partial_25_0919,
  rs_R010_ueqv_R010YNN_partial_25_0920,
  rs_R010_ueqv_R010YNN_partial_25_0921,
  rs_R010_ueqv_R010YNN_partial_25_0922,
  rs_R010_ueqv_R010YNN_partial_25_0923,
  rs_R010_ueqv_R010YNN_partial_25_0924,
  rs_R010_ueqv_R010YNN_partial_25_0925,
  rs_R010_ueqv_R010YNN_partial_25_0926,
  rs_R010_ueqv_R010YNN_partial_25_0927,
  rs_R010_ueqv_R010YNN_partial_25_0928,
  rs_R010_ueqv_R010YNN_partial_25_0929,
  rs_R010_ueqv_R010YNN_partial_25_0930,
  rs_R010_ueqv_R010YNN_partial_25_0931,
  rs_R010_ueqv_R010YNN_partial_25_0932,
  rs_R010_ueqv_R010YNN_partial_25_0933,
  rs_R010_ueqv_R010YNN_partial_25_0934,
  rs_R010_ueqv_R010YNN_partial_25_0935,
  rs_R010_ueqv_R010YNN_partial_25_0936,
  rs_R010_ueqv_R010YNN_partial_25_0937,
  rs_R010_ueqv_R010YNN_partial_25_0938,
  rs_R010_ueqv_R010YNN_partial_25_0939,
  rs_R010_ueqv_R010YNN_partial_25_0940,
  rs_R010_ueqv_R010YNN_partial_25_0941,
  rs_R010_ueqv_R010YNN_partial_25_0942,
  rs_R010_ueqv_R010YNN_partial_25_0943,
  rs_R010_ueqv_R010YNN_partial_25_0944,
  rs_R010_ueqv_R010YNN_partial_25_0945,
  rs_R010_ueqv_R010YNN_partial_25_0946,
  rs_R010_ueqv_R010YNN_partial_25_0947,
  rs_R010_ueqv_R010YNN_partial_25_0948,
  rs_R010_ueqv_R010YNN_partial_25_0949,
  rs_R010_ueqv_R010YNN_partial_25_0950,
  rs_R010_ueqv_R010YNN_partial_25_0951,
  rs_R010_ueqv_R010YNN_partial_25_0952,
  rs_R010_ueqv_R010YNN_partial_25_0953,
  rs_R010_ueqv_R010YNN_partial_25_0954,
  rs_R010_ueqv_R010YNN_partial_25_0955,
  rs_R010_ueqv_R010YNN_partial_25_0956,
  rs_R010_ueqv_R010YNN_partial_25_0957,
  rs_R010_ueqv_R010YNN_partial_25_0958,
  rs_R010_ueqv_R010YNN_partial_25_0959,
  rs_R010_ueqv_R010YNN_partial_25_0960,
  rs_R010_ueqv_R010YNN_partial_25_0961,
  rs_R010_ueqv_R010YNN_partial_25_0962,
  rs_R010_ueqv_R010YNN_partial_25_0963,
  rs_R010_ueqv_R010YNN_partial_25_0964,
  rs_R010_ueqv_R010YNN_partial_25_0965,
  rs_R010_ueqv_R010YNN_partial_25_0966,
  rs_R010_ueqv_R010YNN_partial_25_0967,
  rs_R010_ueqv_R010YNN_partial_25_0968,
  rs_R010_ueqv_R010YNN_partial_25_0969,
  rs_R010_ueqv_R010YNN_partial_25_0970,
  rs_R010_ueqv_R010YNN_partial_25_0971,
  rs_R010_ueqv_R010YNN_partial_25_0972,
  rs_R010_ueqv_R010YNN_partial_25_0973,
  rs_R010_ueqv_R010YNN_partial_25_0974,
  rs_R010_ueqv_R010YNN_partial_25_0975,
  rs_R010_ueqv_R010YNN_partial_25_0976,
  rs_R010_ueqv_R010YNN_partial_25_0977,
  rs_R010_ueqv_R010YNN_partial_25_0978,
  rs_R010_ueqv_R010YNN_partial_25_0979,
  rs_R010_ueqv_R010YNN_partial_25_0980,
  rs_R010_ueqv_R010YNN_partial_25_0981,
  rs_R010_ueqv_R010YNN_partial_25_0982,
  rs_R010_ueqv_R010YNN_partial_25_0983,
  rs_R010_ueqv_R010YNN_partial_25_0984,
  rs_R010_ueqv_R010YNN_partial_25_0985,
  rs_R010_ueqv_R010YNN_partial_25_0986,
  rs_R010_ueqv_R010YNN_partial_25_0987,
  rs_R010_ueqv_R010YNN_partial_25_0988,
  rs_R010_ueqv_R010YNN_partial_25_0989,
  rs_R010_ueqv_R010YNN_partial_25_0990,
  rs_R010_ueqv_R010YNN_partial_25_0991,
  rs_R010_ueqv_R010YNN_partial_25_0992,
  rs_R010_ueqv_R010YNN_partial_25_0993,
  rs_R010_ueqv_R010YNN_partial_25_0994,
  rs_R010_ueqv_R010YNN_partial_25_0995,
  rs_R010_ueqv_R010YNN_partial_25_0996,
  rs_R010_ueqv_R010YNN_partial_25_0997,
  rs_R010_ueqv_R010YNN_partial_25_0998,
  rs_R010_ueqv_R010YNN_partial_25_0999
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_0900_0999 : Poly :=
[
  term ((-9587976173677788904192 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1546687286323503960064 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((386671821580875990016 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1016830741658009600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3519927064730746880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((7039854129461493760 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((1759963532365373440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-3519927064730746880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (15, 3), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (15, 2), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5172010046989242880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((167077330816621548352 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-334154661633243096704 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((167077330816621548352 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13733191957294222900256 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((519719201897477120 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1039438403794954240 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-259859600948738560 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((519719201897477120 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1187929604337090560 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((83224183161418754048 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((145754660370649977856 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36438665092662494464 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((906527399610261434368 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((46142183411828027392 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((11535545852957006848 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16443216260964144640 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (13, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (15, 1), (16, 1)],
  term ((3999270483386247168 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7998540966772494336 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3999270483386247168 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1694572729772558058112 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (15, 2), (16, 1)],
  term ((55821242315950988800 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-111642484631901977600 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((55821242315950988800 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1902887332950016000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((37878717490069609472 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-75757434980139218944 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((37650152062693068800 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((37878717490069609472 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (15, 3), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (15, 2), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(2, 1), (5, 3), (12, 1), (13, 1), (16, 1)],
  term ((15176235140919907840 : Rat) / 53898264945705951) [(2, 1), (5, 3), (12, 1), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(2, 1), (5, 3), (13, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(2, 1), (5, 3), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (15, 2), (16, 1)],
  term ((-101550138081280000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-501539731434885970048 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((4572188843769774080 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8640747765166899200 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((-103234662752321952064 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (12, 2), (16, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-11779099177210697728 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((101550138081280000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((501539731434885970048 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 2), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-4572188843769774080 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((-14811927865666629632 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((8640747765166899200 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 2), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (14, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (16, 1)],
  term ((103234662752321952064 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 2), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((11779099177210697728 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 900 through 999. -/
theorem rs_R010_ueqv_R010YNN_block_25_0900_0999_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_0900_0999
      rs_R010_ueqv_R010YNN_block_25_0900_0999 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
