/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 28:900-922

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_28_0900_0922 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 900 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0900 : Poly :=
[
  term ((-210739366188553169936 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 900 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0900 : Poly :=
[
  term ((421478732377106339872 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-210739366188553169936 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((421478732377106339872 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-210739366188553169936 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0900_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0900
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0901 : Poly :=
[
  term ((-1235833628904509888 : Rat) / 53898264945705951) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 901 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0901 : Poly :=
[
  term ((2471667257809019776 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 1), (14, 2), (16, 1)],
  term ((-1235833628904509888 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((2471667257809019776 : Rat) / 53898264945705951) [(1, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1235833628904509888 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0901_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0901
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0902 : Poly :=
[
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 902 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0902 : Poly :=
[
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (15, 2), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 3), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0902_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0902
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0903 : Poly :=
[
  term ((-29688194773122574468 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 903 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0903 : Poly :=
[
  term ((59376389546245148936 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-29688194773122574468 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((59376389546245148936 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((-29688194773122574468 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0903_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0903
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0904 : Poly :=
[
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 904 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0904 : Poly :=
[
  term ((27910621157975494400 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(1, 1), (5, 3), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0904_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0904
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0905 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 905 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0905 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0905_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0905
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0906 : Poly :=
[
  term ((-1485606213581385472 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 906 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0906 : Poly :=
[
  term ((2971212427162770944 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1485606213581385472 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((2971212427162770944 : Rat) / 53898264945705951) [(1, 1), (5, 3), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1485606213581385472 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0906_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0906
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0907 : Poly :=
[
  term ((-2353134503918316800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 907 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0907 : Poly :=
[
  term ((4706269007836633600 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-2353134503918316800 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 53898264945705951) [(1, 1), (5, 3), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0907_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0907
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0908 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 908 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0908 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0908_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0908
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0909 : Poly :=
[
  term ((-35628243140918624768 : Rat) / 269491324728529755) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 909 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0909 : Poly :=
[
  term ((71256486281837249536 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-35628243140918624768 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((71256486281837249536 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35628243140918624768 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0909_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0909
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0910 : Poly :=
[
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 910 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0910 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0910_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0910
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0911 : Poly :=
[
  term ((-32345981736437949568 : Rat) / 89830441576176585) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 911 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0911 : Poly :=
[
  term ((64691963472875899136 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32345981736437949568 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((64691963472875899136 : Rat) / 89830441576176585) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((-32345981736437949568 : Rat) / 89830441576176585) [(1, 2), (5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0911_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0911
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0912 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 912 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0912 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 3), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 2), (5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0912_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0912
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0913 : Poly :=
[
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

/-- Partial product 913 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0913 : Poly :=
[
  term ((12219177287232399872 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 3), (14, 1), (16, 1)],
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 3), (16, 1)],
  term ((12219177287232399872 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 3), (15, 1), (16, 1)],
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0913_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0913
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0914 : Poly :=
[
  term ((14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (11, 1), (16, 1)]
]

/-- Partial product 914 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0914 : Poly :=
[
  term ((-29529423139308755544 : Rat) / 149717402626960975) [(0, 1), (5, 3), (11, 1), (14, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(0, 2), (5, 3), (11, 1), (16, 1)],
  term ((-29529423139308755544 : Rat) / 149717402626960975) [(1, 1), (5, 3), (11, 1), (15, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(1, 2), (5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0914_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0914
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0915 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (16, 1)]
]

/-- Partial product 915 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0915 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 3), (13, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 2), (5, 3), (13, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 3), (13, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0915_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0915
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0916 : Poly :=
[
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(5, 3), (15, 1), (16, 1)]
]

/-- Partial product 916 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0916 : Poly :=
[
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(0, 1), (5, 3), (14, 1), (15, 1), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(0, 2), (5, 3), (15, 1), (16, 1)],
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(1, 1), (5, 3), (15, 2), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(1, 2), (5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0916_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0916
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0917 : Poly :=
[
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 917 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0917 : Poly :=
[
  term ((3194260827736903936 : Rat) / 89830441576176585) [(0, 1), (5, 4), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 2), (5, 4), (9, 1), (11, 1), (16, 1)],
  term ((3194260827736903936 : Rat) / 89830441576176585) [(1, 1), (5, 4), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(1, 2), (5, 4), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0917_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0917
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0918 : Poly :=
[
  term ((10496983477856839744 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 918 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0918 : Poly :=
[
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(0, 1), (5, 4), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(0, 2), (5, 4), (9, 1), (15, 1), (16, 1)],
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(1, 1), (5, 4), (9, 1), (15, 2), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(1, 2), (5, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0918_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0918
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0919 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 919 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0919 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(0, 1), (5, 4), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 2), (5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 4), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 2), (5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0919_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0919
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0920 : Poly :=
[
  term ((298734458473846912 : Rat) / 5988696105078439) [(5, 4), (9, 2), (16, 1)]
]

/-- Partial product 920 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0920 : Poly :=
[
  term ((-597468916947693824 : Rat) / 5988696105078439) [(0, 1), (5, 4), (9, 2), (14, 1), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(0, 2), (5, 4), (9, 2), (16, 1)],
  term ((-597468916947693824 : Rat) / 5988696105078439) [(1, 1), (5, 4), (9, 2), (15, 1), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(1, 2), (5, 4), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0920_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0920
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0921 : Poly :=
[
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 921 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0921 : Poly :=
[
  term (4 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0921_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0921
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0922 : Poly :=
[
  term (-1 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 922 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0922 : Poly :=
[
  term (2 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (-1 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0922_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0922
        rs_R010_ueqv_R010YNN_generator_28_0900_0922 =
      rs_R010_ueqv_R010YNN_partial_28_0922 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_28_0900_0922 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_28_0900,
  rs_R010_ueqv_R010YNN_partial_28_0901,
  rs_R010_ueqv_R010YNN_partial_28_0902,
  rs_R010_ueqv_R010YNN_partial_28_0903,
  rs_R010_ueqv_R010YNN_partial_28_0904,
  rs_R010_ueqv_R010YNN_partial_28_0905,
  rs_R010_ueqv_R010YNN_partial_28_0906,
  rs_R010_ueqv_R010YNN_partial_28_0907,
  rs_R010_ueqv_R010YNN_partial_28_0908,
  rs_R010_ueqv_R010YNN_partial_28_0909,
  rs_R010_ueqv_R010YNN_partial_28_0910,
  rs_R010_ueqv_R010YNN_partial_28_0911,
  rs_R010_ueqv_R010YNN_partial_28_0912,
  rs_R010_ueqv_R010YNN_partial_28_0913,
  rs_R010_ueqv_R010YNN_partial_28_0914,
  rs_R010_ueqv_R010YNN_partial_28_0915,
  rs_R010_ueqv_R010YNN_partial_28_0916,
  rs_R010_ueqv_R010YNN_partial_28_0917,
  rs_R010_ueqv_R010YNN_partial_28_0918,
  rs_R010_ueqv_R010YNN_partial_28_0919,
  rs_R010_ueqv_R010YNN_partial_28_0920,
  rs_R010_ueqv_R010YNN_partial_28_0921,
  rs_R010_ueqv_R010YNN_partial_28_0922
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_28_0900_0922 : Poly :=
[
  term ((421478732377106339872 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((59376389546245148936 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((2471667257809019776 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 1), (14, 2), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2971212427162770944 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((71256486281837249536 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((64691963472875899136 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12219177287232399872 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 3), (14, 1), (16, 1)],
  term ((-29529423139308755544 : Rat) / 149717402626960975) [(0, 1), (5, 3), (11, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 3), (13, 1), (14, 1), (16, 1)],
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(0, 1), (5, 3), (14, 1), (15, 1), (16, 1)],
  term ((3194260827736903936 : Rat) / 89830441576176585) [(0, 1), (5, 4), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(0, 1), (5, 4), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(0, 1), (5, 4), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-597468916947693824 : Rat) / 5988696105078439) [(0, 1), (5, 4), (9, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (14, 2), (16, 1)],
  term ((-210739366188553169936 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1235833628904509888 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (15, 2), (16, 1)],
  term ((-29688194773122574468 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1485606213581385472 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-35628243140918624768 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32345981736437949568 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 3), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(0, 2), (5, 3), (11, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 2), (5, 3), (13, 1), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(0, 2), (5, 3), (15, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 2), (5, 4), (9, 1), (11, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(0, 2), (5, 4), (9, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 2), (5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(0, 2), (5, 4), (9, 2), (16, 1)],
  term (-2 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(0, 2), (14, 1), (16, 1)],
  term ((421478732377106339872 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2471667257809019776 : Rat) / 53898264945705951) [(1, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((59376389546245148936 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 3), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(1, 1), (5, 3), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2971212427162770944 : Rat) / 53898264945705951) [(1, 1), (5, 3), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 53898264945705951) [(1, 1), (5, 3), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((71256486281837249536 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((64691963472875899136 : Rat) / 89830441576176585) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 3), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((12219177287232399872 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 3), (15, 1), (16, 1)],
  term ((-29529423139308755544 : Rat) / 149717402626960975) [(1, 1), (5, 3), (11, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 3), (13, 1), (15, 1), (16, 1)],
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(1, 1), (5, 3), (15, 2), (16, 1)],
  term ((3194260827736903936 : Rat) / 89830441576176585) [(1, 1), (5, 4), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(1, 1), (5, 4), (9, 1), (15, 2), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 4), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-597468916947693824 : Rat) / 5988696105078439) [(1, 1), (5, 4), (9, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-210739366188553169936 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1235833628904509888 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (15, 2), (16, 1)],
  term ((-29688194773122574468 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1485606213581385472 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-35628243140918624768 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32345981736437949568 : Rat) / 89830441576176585) [(1, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 2), (5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 3), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(1, 2), (5, 3), (11, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 3), (13, 1), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(1, 2), (5, 3), (15, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(1, 2), (5, 4), (9, 1), (11, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(1, 2), (5, 4), (9, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 2), (5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(1, 2), (5, 4), (9, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 900 through 922. -/
theorem rs_R010_ueqv_R010YNN_block_28_0900_0922_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_28_0900_0922
      rs_R010_ueqv_R010YNN_block_28_0900_0922 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
