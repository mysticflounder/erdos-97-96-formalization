/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 27:900-910

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_27_0900_0910 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 900 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0900 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 900 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0900 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0900_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0900
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0901 : Poly :=
[
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

/-- Partial product 901 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0901 : Poly :=
[
  term ((-12219177287232399872 : Rat) / 269491324728529755) [(5, 3), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-12219177287232399872 : Rat) / 269491324728529755) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((6109588643616199936 : Rat) / 269491324728529755) [(5, 3), (9, 3), (14, 2), (16, 1)],
  term ((6109588643616199936 : Rat) / 269491324728529755) [(5, 3), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0901_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0901
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0902 : Poly :=
[
  term ((14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (11, 1), (16, 1)]
]

/-- Partial product 902 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0902 : Poly :=
[
  term ((29529423139308755544 : Rat) / 149717402626960975) [(5, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((29529423139308755544 : Rat) / 149717402626960975) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (11, 1), (14, 2), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0902_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0902
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0903 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (16, 1)]
]

/-- Partial product 903 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0903 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (14, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (15, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0903_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0903
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0904 : Poly :=
[
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(5, 3), (15, 1), (16, 1)]
]

/-- Partial product 904 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0904 : Poly :=
[
  term ((298914842785620476444 : Rat) / 1347456623642648775) [(5, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((298914842785620476444 : Rat) / 1347456623642648775) [(5, 3), (13, 1), (15, 2), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(5, 3), (14, 2), (15, 1), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(5, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0904_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0904
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0905 : Poly :=
[
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 905 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0905 : Poly :=
[
  term ((-3194260827736903936 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3194260827736903936 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0905_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0905
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0906 : Poly :=
[
  term ((10496983477856839744 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 906 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0906 : Poly :=
[
  term ((20993966955713679488 : Rat) / 269491324728529755) [(5, 4), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((20993966955713679488 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(5, 4), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0906_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0906
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0907 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 907 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0907 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0907_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0907
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0908 : Poly :=
[
  term ((298734458473846912 : Rat) / 5988696105078439) [(5, 4), (9, 2), (16, 1)]
]

/-- Partial product 908 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0908 : Poly :=
[
  term ((597468916947693824 : Rat) / 5988696105078439) [(5, 4), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((597468916947693824 : Rat) / 5988696105078439) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-298734458473846912 : Rat) / 5988696105078439) [(5, 4), (9, 2), (14, 2), (16, 1)],
  term ((-298734458473846912 : Rat) / 5988696105078439) [(5, 4), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0908_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0908
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0909 : Poly :=
[
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 909 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0909 : Poly :=
[
  term (4 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (4 : Rat) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0909_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0909
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0910 : Poly :=
[
  term (-1 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 910 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0910 : Poly :=
[
  term (-2 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0910_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0910
        rs_R010_ueqv_R010YNN_generator_27_0900_0910 =
      rs_R010_ueqv_R010YNN_partial_27_0910 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_27_0900_0910 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_27_0900,
  rs_R010_ueqv_R010YNN_partial_27_0901,
  rs_R010_ueqv_R010YNN_partial_27_0902,
  rs_R010_ueqv_R010YNN_partial_27_0903,
  rs_R010_ueqv_R010YNN_partial_27_0904,
  rs_R010_ueqv_R010YNN_partial_27_0905,
  rs_R010_ueqv_R010YNN_partial_27_0906,
  rs_R010_ueqv_R010YNN_partial_27_0907,
  rs_R010_ueqv_R010YNN_partial_27_0908,
  rs_R010_ueqv_R010YNN_partial_27_0909,
  rs_R010_ueqv_R010YNN_partial_27_0910
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_27_0900_0910 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12219177287232399872 : Rat) / 269491324728529755) [(5, 3), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12219177287232399872 : Rat) / 269491324728529755) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((6109588643616199936 : Rat) / 269491324728529755) [(5, 3), (9, 3), (14, 2), (16, 1)],
  term ((6109588643616199936 : Rat) / 269491324728529755) [(5, 3), (9, 3), (15, 2), (16, 1)],
  term ((29529423139308755544 : Rat) / 149717402626960975) [(5, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((29529423139308755544 : Rat) / 149717402626960975) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (11, 1), (14, 2), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (11, 1), (15, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((298914842785620476444 : Rat) / 1347456623642648775) [(5, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (14, 2), (16, 1)],
  term ((346340577600995188444 : Rat) / 1347456623642648775) [(5, 3), (13, 1), (15, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (13, 2), (15, 1), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(5, 3), (14, 2), (15, 1), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(5, 3), (15, 3), (16, 1)],
  term ((-3194260827736903936 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3194260827736903936 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((20993966955713679488 : Rat) / 269491324728529755) [(5, 4), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((20993966955713679488 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(5, 4), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 3), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((597468916947693824 : Rat) / 5988696105078439) [(5, 4), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((597468916947693824 : Rat) / 5988696105078439) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-298734458473846912 : Rat) / 5988696105078439) [(5, 4), (9, 2), (14, 2), (16, 1)],
  term ((-298734458473846912 : Rat) / 5988696105078439) [(5, 4), (9, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (4 : Rat) [(13, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(14, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 900 through 910. -/
theorem rs_R010_ueqv_R010YNN_block_27_0900_0910_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_27_0900_0910
      rs_R010_ueqv_R010YNN_block_27_0900_0910 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
