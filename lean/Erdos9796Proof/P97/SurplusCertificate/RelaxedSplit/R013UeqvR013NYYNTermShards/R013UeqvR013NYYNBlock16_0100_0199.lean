/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NYYN, term block 16:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NYYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R013:u=v:R013NYYN`. -/
def rs_R013_ueqv_R013NYYN_generator_16_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0100 : Poly :=
[
  term ((-2415631401936582519225030248050428265229195319740801984 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 100 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0100 : Poly :=
[
  term ((-4831262803873165038450060496100856530458390639481603968 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((2415631401936582519225030248050428265229195319740801984 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0100_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0100
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0101 : Poly :=
[
  term ((-25091658999342537904112304668587997801759780222290677184 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 101 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0101 : Poly :=
[
  term ((-50183317998685075808224609337175995603519560444581354368 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((25091658999342537904112304668587997801759780222290677184 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0101_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0101
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0102 : Poly :=
[
  term ((-86922721691920652630969077528724938748914784934099409408 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 102 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0102 : Poly :=
[
  term ((-173845443383841305261938155057449877497829569868198818816 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((86922721691920652630969077528724938748914784934099409408 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0102_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0102
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0103 : Poly :=
[
  term ((-94424270029847959288737598635358563814820748467112757168 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 103 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0103 : Poly :=
[
  term ((-188848540059695918577475197270717127629641496934225514336 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((94424270029847959288737598635358563814820748467112757168 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0103_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0103
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0104 : Poly :=
[
  term ((-4831262803873165038450060496100856530458390639481603968 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0104 : Poly :=
[
  term ((-9662525607746330076900120992201713060916781278963207936 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((4831262803873165038450060496100856530458390639481603968 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0104_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0104
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0105 : Poly :=
[
  term ((46490176009743100658547718958867906754419167279826406171488 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0105 : Poly :=
[
  term ((92980352019486201317095437917735813508838334559652812342976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-46490176009743100658547718958867906754419167279826406171488 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0105_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0105
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0106 : Poly :=
[
  term ((788607475413195543032561509552556412015980492672373667472 : Rat) / 30055166474969461820135166544783741861745340202647959325) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0106 : Poly :=
[
  term ((1577214950826391086065123019105112824031960985344747334944 : Rat) / 30055166474969461820135166544783741861745340202647959325) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-788607475413195543032561509552556412015980492672373667472 : Rat) / 30055166474969461820135166544783741861745340202647959325) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0106_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0106
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0107 : Poly :=
[
  term ((121455246734871795225904710336621778754273455528416656512 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 2), (16, 1)]
]

/-- Partial product 107 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0107 : Poly :=
[
  term ((242910493469743590451809420673243557508546911056833313024 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((-121455246734871795225904710336621778754273455528416656512 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0107_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0107
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0108 : Poly :=
[
  term ((-61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 108 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0108 : Poly :=
[
  term ((61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0108_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0108
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0109 : Poly :=
[
  term ((1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0109 : Poly :=
[
  term ((-1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0109_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0109
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0110 : Poly :=
[
  term ((5675647433955134642642429861482708089476591577667807961696 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0110 : Poly :=
[
  term ((-5675647433955134642642429861482708089476591577667807961696 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((11351294867910269285284859722965416178953183155335615923392 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0110_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0110
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0111 : Poly :=
[
  term ((61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 111 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0111 : Poly :=
[
  term ((122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0111_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0111
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0112 : Poly :=
[
  term ((-1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0112 : Poly :=
[
  term ((-2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0112_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0112
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0113 : Poly :=
[
  term ((-5675647433955134642642429861482708089476591577667807961696 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0113 : Poly :=
[
  term ((-11351294867910269285284859722965416178953183155335615923392 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((5675647433955134642642429861482708089476591577667807961696 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0113_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0113
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0114 : Poly :=
[
  term ((-119152970251182638580097445162365561417892623082589533032 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 114 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0114 : Poly :=
[
  term ((-238305940502365277160194890324731122835785246165179066064 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((119152970251182638580097445162365561417892623082589533032 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0114_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0114
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0115 : Poly :=
[
  term ((-2477708648481952214234609094186392029119738004712240838584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 115 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0115 : Poly :=
[
  term ((-4955417296963904428469218188372784058239476009424481677168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((2477708648481952214234609094186392029119738004712240838584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0115_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0115
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0116 : Poly :=
[
  term ((-1457594428679444143477990798948576142537611630230836531272 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0116 : Poly :=
[
  term ((-2915188857358888286955981597897152285075223260461673062544 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1457594428679444143477990798948576142537611630230836531272 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0116_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0116
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0117 : Poly :=
[
  term ((1024562448403338698733003089302780554491739910220933993896 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 117 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0117 : Poly :=
[
  term ((2049124896806677397466006178605561108983479820441867987792 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1024562448403338698733003089302780554491739910220933993896 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0117_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0117
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0118 : Poly :=
[
  term ((-2045050879460411494365225854884370812706343516567759982328 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 118 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0118 : Poly :=
[
  term ((-4090101758920822988730451709768741625412687033135519964656 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((2045050879460411494365225854884370812706343516567759982328 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0118_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0118
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0119 : Poly :=
[
  term ((-565295226034748820134982113144771807839361634979532636368 : Rat) / 21467976053549615585810833246274101329818100144748542375) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0119 : Poly :=
[
  term ((-1130590452069497640269964226289543615678723269959065272736 : Rat) / 21467976053549615585810833246274101329818100144748542375) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((565295226034748820134982113144771807839361634979532636368 : Rat) / 21467976053549615585810833246274101329818100144748542375) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0119_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0119
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0120 : Poly :=
[
  term ((699285443763087321280029244623480708428149135677952 : Rat) / 288518387159520063550828195220052514117920969587745) [(2, 1), (9, 2), (16, 1)]
]

/-- Partial product 120 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0120 : Poly :=
[
  term ((1398570887526174642560058489246961416856298271355904 : Rat) / 288518387159520063550828195220052514117920969587745) [(2, 1), (6, 1), (9, 2), (16, 1)],
  term ((-699285443763087321280029244623480708428149135677952 : Rat) / 288518387159520063550828195220052514117920969587745) [(2, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0120_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0120
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0121 : Poly :=
[
  term ((122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0121 : Poly :=
[
  term ((244170218201339684827914865628222419480276316764212842368 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0121_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0121
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0122 : Poly :=
[
  term ((-135449657482819141238624801539327425362880324396296763784 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 122 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0122 : Poly :=
[
  term ((-270899314965638282477249603078654850725760648792593527568 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((135449657482819141238624801539327425362880324396296763784 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0122_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0122
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0123 : Poly :=
[
  term ((-425655117430722364486038533682905531082115647417007977416 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0123 : Poly :=
[
  term ((-851310234861444728972077067365811062164231294834015954832 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((425655117430722364486038533682905531082115647417007977416 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0123_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0123
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0124 : Poly :=
[
  term ((-2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0124 : Poly :=
[
  term ((-4659042488689587055278655799174039032846911804942716476096 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0124_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0124
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0125 : Poly :=
[
  term ((-11351294867910269285284859722965416178953183155335615923392 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0125 : Poly :=
[
  term ((-22702589735820538570569719445930832357906366310671231846784 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((11351294867910269285284859722965416178953183155335615923392 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0125_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0125
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0126 : Poly :=
[
  term ((43127393428654335549146293234457273311416087129036662285168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0126 : Poly :=
[
  term ((86254786857308671098292586468914546622832174258073324570336 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43127393428654335549146293234457273311416087129036662285168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0126_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0126
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0127 : Poly :=
[
  term ((381271329917027498026694915342983388846032463513986891624 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 127 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0127 : Poly :=
[
  term ((762542659834054996053389830685966777692064927027973783248 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-381271329917027498026694915342983388846032463513986891624 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0127_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0127
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0128 : Poly :=
[
  term ((-5788284460834499276318979232022256189638603209511779274576 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 128 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0128 : Poly :=
[
  term ((-11576568921668998552637958464044512379277206419023558549152 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((5788284460834499276318979232022256189638603209511779274576 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0128_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0128
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0129 : Poly :=
[
  term ((-1666946983839507544914690715132315151724606700621726 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (16, 1)]
]

/-- Partial product 129 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0129 : Poly :=
[
  term ((-3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (6, 1), (16, 1)],
  term ((1666946983839507544914690715132315151724606700621726 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0129_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0129
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0130 : Poly :=
[
  term ((89909656201763947584188668979160065706443130039909034592 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 130 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0130 : Poly :=
[
  term ((179819312403527895168377337958320131412886260079818069184 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-89909656201763947584188668979160065706443130039909034592 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0130_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0130
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0131 : Poly :=
[
  term ((4182770748885165384046390904784396269673424948618365176 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 131 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0131 : Poly :=
[
  term ((8365541497770330768092781809568792539346849897236730352 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-4182770748885165384046390904784396269673424948618365176 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0131_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0131
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0132 : Poly :=
[
  term ((-28293159289747334421940257858597469126054095771921169048 : Rat) / 3743526073394772824571995832980181370680024580400991375) [(2, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 132 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0132 : Poly :=
[
  term ((-56586318579494668843880515717194938252108191543842338096 : Rat) / 3743526073394772824571995832980181370680024580400991375) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((28293159289747334421940257858597469126054095771921169048 : Rat) / 3743526073394772824571995832980181370680024580400991375) [(2, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0132_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0132
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0133 : Poly :=
[
  term ((-24249327213106324687136141287490603671771160538185850652432 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0133 : Poly :=
[
  term ((-48498654426212649374272282574981207343542321076371701304864 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((24249327213106324687136141287490603671771160538185850652432 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0133_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0133
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0134 : Poly :=
[
  term ((-55158048937178661829796267066883952599249379770816420064 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 2), (16, 1)]
]

/-- Partial product 134 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0134 : Poly :=
[
  term ((-110316097874357323659592534133767905198498759541632840128 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 2), (6, 1), (16, 1)],
  term ((55158048937178661829796267066883952599249379770816420064 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0134_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0134
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0135 : Poly :=
[
  term ((-155774736055567593871981104093474950689471486796077088744 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 135 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0135 : Poly :=
[
  term ((-311549472111135187743962208186949901378942973592154177488 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((155774736055567593871981104093474950689471486796077088744 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0135_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0135
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0136 : Poly :=
[
  term ((768685982234066651104386133345269517707237375262943040712 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 136 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0136 : Poly :=
[
  term ((1537371964468133302208772266690539035414474750525886081424 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-768685982234066651104386133345269517707237375262943040712 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0136_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0136
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0137 : Poly :=
[
  term ((29187226666113387747370042078547526204692347603384272553808 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0137 : Poly :=
[
  term ((58374453332226775494740084157095052409384695206768545107616 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-29187226666113387747370042078547526204692347603384272553808 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0137_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0137
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0138 : Poly :=
[
  term ((61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 138 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0138 : Poly :=
[
  term ((122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0138_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0138
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0139 : Poly :=
[
  term ((743296763974872976562398122926280372430023575173606655168 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0139 : Poly :=
[
  term ((1486593527949745953124796245852560744860047150347213310336 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-743296763974872976562398122926280372430023575173606655168 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0139_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0139
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0140 : Poly :=
[
  term ((-12058058723237565808982320268668931835612345863906634905608 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0140 : Poly :=
[
  term ((-24116117446475131617964640537337863671224691727813269811216 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((12058058723237565808982320268668931835612345863906634905608 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0140_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0140
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0141 : Poly :=
[
  term ((-1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (13, 2), (16, 1)]
]

/-- Partial product 141 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0141 : Poly :=
[
  term ((-2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0141_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0141
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0142 : Poly :=
[
  term ((-7317581121629741648098423567120419221774359157174503155256 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (15, 2), (16, 1)]
]

/-- Partial product 142 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0142 : Poly :=
[
  term ((-14635162243259483296196847134240838443548718314349006310512 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((7317581121629741648098423567120419221774359157174503155256 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0142_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0142
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0143 : Poly :=
[
  term ((-36188249844658901336072441820359374610354944327566187264 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 143 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0143 : Poly :=
[
  term ((-72376499689317802672144883640718749220709888655132374528 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((36188249844658901336072441820359374610354944327566187264 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0143_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0143
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0144 : Poly :=
[
  term ((-71314584409734817592958388463493382099493107278041056544 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 144 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0144 : Poly :=
[
  term ((-142629168819469635185916776926986764198986214556082113088 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((71314584409734817592958388463493382099493107278041056544 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0144_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0144
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0145 : Poly :=
[
  term ((-14788032484724617642646291291284574229744174533244147904 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 145 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0145 : Poly :=
[
  term ((-29576064969449235285292582582569148459488349066488295808 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((14788032484724617642646291291284574229744174533244147904 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0145_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0145
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0146 : Poly :=
[
  term ((-2841171023594486357301875159495399210206883511393283251584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 146 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0146 : Poly :=
[
  term ((-5682342047188972714603750318990798420413767022786566503168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((2841171023594486357301875159495399210206883511393283251584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0146_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0146
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0147 : Poly :=
[
  term ((-1786306935665669820892137378554848530387455324535920510752 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0147 : Poly :=
[
  term ((-3572613871331339641784274757109697060774910649071841021504 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((1786306935665669820892137378554848530387455324535920510752 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0147_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0147
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0148 : Poly :=
[
  term ((351381832733763344405514212714747785466969631669108591584 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 148 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0148 : Poly :=
[
  term ((702763665467526688811028425429495570933939263338217183168 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-351381832733763344405514212714747785466969631669108591584 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0148_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0148
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0149 : Poly :=
[
  term ((-1232548289036771436757012882227013597762029979844778720872 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 149 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0149 : Poly :=
[
  term ((-2465096578073542873514025764454027195524059959689557441744 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((1232548289036771436757012882227013597762029979844778720872 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0149_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0149
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0150 : Poly :=
[
  term ((-21133971968143023144274071181818147724819955630587156642976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0150 : Poly :=
[
  term ((-42267943936286046288548142363636295449639911261174313285952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((21133971968143023144274071181818147724819955630587156642976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0150_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0150
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0151 : Poly :=
[
  term ((-1342326736666181054023717386340730485283175845810049408 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (4, 2), (5, 1), (16, 1)]
]

/-- Partial product 151 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0151 : Poly :=
[
  term ((-2684653473332362108047434772681460970566351691620098816 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (4, 2), (5, 1), (6, 1), (16, 1)],
  term ((1342326736666181054023717386340730485283175845810049408 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (4, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0151_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0151
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0152 : Poly :=
[
  term ((3837965746796761410185829048469463566914069748837785712 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(3, 1), (4, 2), (11, 1), (16, 1)]
]

/-- Partial product 152 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0152 : Poly :=
[
  term ((7675931493593522820371658096938927133828139497675571424 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(3, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((-3837965746796761410185829048469463566914069748837785712 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(3, 1), (4, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0152_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0152
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0153 : Poly :=
[
  term ((16807481956129741476898894374730533062887383079153621504 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (4, 2), (13, 1), (16, 1)]
]

/-- Partial product 153 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0153 : Poly :=
[
  term ((33614963912259482953797788749461066125774766158307243008 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((-16807481956129741476898894374730533062887383079153621504 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (4, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0153_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0153
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0154 : Poly :=
[
  term ((-177980683282232730074656332662269497254807344167929778208 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0154 : Poly :=
[
  term ((-355961366564465460149312665324538994509614688335859556416 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((177980683282232730074656332662269497254807344167929778208 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0154_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0154
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0155 : Poly :=
[
  term ((25091658999342537904112304668587997801759780222290677184 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 155 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0155 : Poly :=
[
  term ((-25091658999342537904112304668587997801759780222290677184 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((50183317998685075808224609337175995603519560444581354368 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (5, 1), (6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0155_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0155
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0156 : Poly :=
[
  term ((8176984134650978499246915606995235977942535809991501504 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 156 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0156 : Poly :=
[
  term ((16353968269301956998493831213990471955885071619983003008 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-8176984134650978499246915606995235977942535809991501504 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0156_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0156
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0157 : Poly :=
[
  term ((27438597893368295846332052023676361148514577812778086752 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 157 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0157 : Poly :=
[
  term ((54877195786736591692664104047352722297029155625556173504 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((-27438597893368295846332052023676361148514577812778086752 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0157_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0157
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0158 : Poly :=
[
  term ((-222953709322537068026910460259248142721799965192800136512 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 158 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0158 : Poly :=
[
  term ((-445907418645074136053820920518496285443599930385600273024 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((222953709322537068026910460259248142721799965192800136512 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0158_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0158
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0159 : Poly :=
[
  term ((11533935726061420866978468434824531198954153973140012847756 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 159 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0159 : Poly :=
[
  term ((23067871452122841733956936869649062397908307946280025695512 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-11533935726061420866978468434824531198954153973140012847756 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0159_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0159
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0160 : Poly :=
[
  term ((119152970251182638580097445162365561417892623082589533032 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 160 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0160 : Poly :=
[
  term ((-119152970251182638580097445162365561417892623082589533032 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((238305940502365277160194890324731122835785246165179066064 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0160_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0160
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0161 : Poly :=
[
  term ((2477708648481952214234609094186392029119738004712240838584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 161 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0161 : Poly :=
[
  term ((-2477708648481952214234609094186392029119738004712240838584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((4955417296963904428469218188372784058239476009424481677168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0161_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0161
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0162 : Poly :=
[
  term ((1457594428679444143477990798948576142537611630230836531272 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0162 : Poly :=
[
  term ((-1457594428679444143477990798948576142537611630230836531272 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((2915188857358888286955981597897152285075223260461673062544 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0162_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0162
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0163 : Poly :=
[
  term ((-699285443763087321280029244623480708428149135677952 : Rat) / 288518387159520063550828195220052514117920969587745) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 163 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0163 : Poly :=
[
  term ((-1398570887526174642560058489246961416856298271355904 : Rat) / 288518387159520063550828195220052514117920969587745) [(3, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((699285443763087321280029244623480708428149135677952 : Rat) / 288518387159520063550828195220052514117920969587745) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0163_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0163
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0164 : Poly :=
[
  term ((-14327543848110394351552762166604125065212765482750660672 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 164 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0164 : Poly :=
[
  term ((-28655087696220788703105524333208250130425530965501321344 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((14327543848110394351552762166604125065212765482750660672 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0164_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0164
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0165 : Poly :=
[
  term ((-158112425473570629548458218006494581705041659341273334656 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 165 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0165 : Poly :=
[
  term ((-316224850947141259096916436012989163410083318682546669312 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((158112425473570629548458218006494581705041659341273334656 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0165_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0165
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0166 : Poly :=
[
  term ((1749657593414188751973274514347689516934961860512796315472 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0166 : Poly :=
[
  term ((3499315186828377503946549028695379033869923721025592630944 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1749657593414188751973274514347689516934961860512796315472 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0166_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0166
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0167 : Poly :=
[
  term ((-3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 167 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0167 : Poly :=
[
  term ((-6667787935358030179658762860529260606898426802486904 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0167_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0167
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0168 : Poly :=
[
  term ((29288105646233812840448466223408287964116441627599105816 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 168 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0168 : Poly :=
[
  term ((58576211292467625680896932446816575928232883255198211632 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-29288105646233812840448466223408287964116441627599105816 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0168_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0168
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0169 : Poly :=
[
  term ((-242681343668336879660532287662631086557970816879051388528 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 169 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0169 : Poly :=
[
  term ((-485362687336673759321064575325262173115941633758102777056 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((242681343668336879660532287662631086557970816879051388528 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0169_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0169
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0170 : Poly :=
[
  term ((80597494361479579433347381410694961332951031208329089184 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 170 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0170 : Poly :=
[
  term ((161194988722959158866694762821389922665902062416658178368 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-80597494361479579433347381410694961332951031208329089184 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0170_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0170
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0171 : Poly :=
[
  term ((-157671054483717333971705280347332054803075125851322515144 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 171 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0171 : Poly :=
[
  term ((-315342108967434667943410560694664109606150251702645030288 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((157671054483717333971705280347332054803075125851322515144 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0171_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0171
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0172 : Poly :=
[
  term ((1084698862394583831986575112587845478479435222710179626448 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0172 : Poly :=
[
  term ((2169397724789167663973150225175690956958870445420359252896 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1084698862394583831986575112587845478479435222710179626448 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0172_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0172
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0173 : Poly :=
[
  term ((-5563991597997592835783883895503442747721267837669865824032 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 173 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0173 : Poly :=
[
  term ((-11127983195995185671567767791006885495442535675339731648064 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((5563991597997592835783883895503442747721267837669865824032 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0173_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0173
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0174 : Poly :=
[
  term ((-1589559114669007982020559723601921628916411315539912708 : Rat) / 1164928933138351233338572346697044258207183728784804625) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 174 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0174 : Poly :=
[
  term ((-3179118229338015964041119447203843257832822631079825416 : Rat) / 1164928933138351233338572346697044258207183728784804625) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((1589559114669007982020559723601921628916411315539912708 : Rat) / 1164928933138351233338572346697044258207183728784804625) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0174_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0174
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0175 : Poly :=
[
  term ((-75501038252632555138934859702867478392066873349562546352992 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0175 : Poly :=
[
  term ((-151002076505265110277869719405734956784133746699125092705984 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((75501038252632555138934859702867478392066873349562546352992 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0175_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0175
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0176 : Poly :=
[
  term ((11126866799141312370861445239395747730282502926820791432472 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0176 : Poly :=
[
  term ((22253733598282624741722890478791495460565005853641582864944 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-11126866799141312370861445239395747730282502926820791432472 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0176_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0176
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0177 : Poly :=
[
  term ((3333893967679015089829381430264630303449213401243452 : Rat) / 7212959678988001588770704880501312852948024239693625) [(3, 2), (4, 1), (16, 1)]
]

/-- Partial product 177 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0177 : Poly :=
[
  term ((6667787935358030179658762860529260606898426802486904 : Rat) / 7212959678988001588770704880501312852948024239693625) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-3333893967679015089829381430264630303449213401243452 : Rat) / 7212959678988001588770704880501312852948024239693625) [(3, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0177_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0177
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0178 : Poly :=
[
  term ((-3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 2), (8, 1), (16, 1)]
]

/-- Partial product 178 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0178 : Poly :=
[
  term ((-6667787935358030179658762860529260606898426802486904 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0178_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0178
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0179 : Poly :=
[
  term ((-3037032908209708691161440579053500589255615018130760768 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 179 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0179 : Poly :=
[
  term ((3037032908209708691161440579053500589255615018130760768 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-6074065816419417382322881158107001178511230036261521536 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0179_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0179
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0180 : Poly :=
[
  term ((3037032908209708691161440579053500589255615018130760768 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 180 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0180 : Poly :=
[
  term ((6074065816419417382322881158107001178511230036261521536 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-3037032908209708691161440579053500589255615018130760768 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0180_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0180
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0181 : Poly :=
[
  term ((-1518516454104854345580720289526750294627807509065380384 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 181 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0181 : Poly :=
[
  term ((-3037032908209708691161440579053500589255615018130760768 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((1518516454104854345580720289526750294627807509065380384 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0181_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0181
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0182 : Poly :=
[
  term ((9367243778486729031349166865443134228479280944395224256 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 182 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0182 : Poly :=
[
  term ((18734487556973458062698333730886268456958561888790448512 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-9367243778486729031349166865443134228479280944395224256 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0182_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0182
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0183 : Poly :=
[
  term ((33149287883619578066920210825822059898723381327754852176 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 183 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0183 : Poly :=
[
  term ((66298575767239156133840421651644119797446762655509704352 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-33149287883619578066920210825822059898723381327754852176 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0183_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0183
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0184 : Poly :=
[
  term ((-657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 184 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0184 : Poly :=
[
  term ((-1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0184_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0184
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0185 : Poly :=
[
  term ((496791673452499619351728035612110091182270717894336 : Rat) / 288518387159520063550828195220052514117920969587745) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0185 : Poly :=
[
  term ((993583346904999238703456071224220182364541435788672 : Rat) / 288518387159520063550828195220052514117920969587745) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-496791673452499619351728035612110091182270717894336 : Rat) / 288518387159520063550828195220052514117920969587745) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0185_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0185
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0186 : Poly :=
[
  term ((4141195837307427926519661864830520721206239160704 : Rat) / 3271183527885715006245217632880413992266677659725) [(4, 1), (5, 2), (16, 1)]
]

/-- Partial product 186 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0186 : Poly :=
[
  term ((8282391674614855853039323729661041442412478321408 : Rat) / 3271183527885715006245217632880413992266677659725) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-4141195837307427926519661864830520721206239160704 : Rat) / 3271183527885715006245217632880413992266677659725) [(4, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0186_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0186
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0187 : Poly :=
[
  term ((68559596739983083808378149168633318358873902333632815072 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 187 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0187 : Poly :=
[
  term ((-68559596739983083808378149168633318358873902333632815072 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((137119193479966167616756298337266636717747804667265630144 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (6, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0187_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0187
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0188 : Poly :=
[
  term ((-868385813898079390629101560594764732819163746753913917952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 188 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0188 : Poly :=
[
  term ((868385813898079390629101560594764732819163746753913917952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1736771627796158781258203121189529465638327493507827835904 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0188_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0188
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0189 : Poly :=
[
  term ((-6356664260990226840295259360198846398890977944272839788352 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0189 : Poly :=
[
  term ((6356664260990226840295259360198846398890977944272839788352 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12713328521980453680590518720397692797781955888545679576704 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0189_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0189
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0190 : Poly :=
[
  term ((-68559596739983083808378149168633318358873902333632815072 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 190 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0190 : Poly :=
[
  term ((-137119193479966167616756298337266636717747804667265630144 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((68559596739983083808378149168633318358873902333632815072 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0190_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0190
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0191 : Poly :=
[
  term ((868385813898079390629101560594764732819163746753913917952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 191 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0191 : Poly :=
[
  term ((1736771627796158781258203121189529465638327493507827835904 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-868385813898079390629101560594764732819163746753913917952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0191_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0191
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0192 : Poly :=
[
  term ((6356664260990226840295259360198846398890977944272839788352 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0192 : Poly :=
[
  term ((12713328521980453680590518720397692797781955888545679576704 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6356664260990226840295259360198846398890977944272839788352 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0192_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0192
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0193 : Poly :=
[
  term ((-52633306597394185365980514784667607394143355801154235232 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 193 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0193 : Poly :=
[
  term ((-105266613194788370731961029569335214788286711602308470464 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((52633306597394185365980514784667607394143355801154235232 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0193_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0193
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0194 : Poly :=
[
  term ((-434192906949039695314550780297382366409581873376956958976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 194 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0194 : Poly :=
[
  term ((-868385813898079390629101560594764732819163746753913917952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((434192906949039695314550780297382366409581873376956958976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0194_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0194
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0195 : Poly :=
[
  term ((-2850291667798319588767616292188406885891767140321784304136 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 195 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0195 : Poly :=
[
  term ((-5700583335596639177535232584376813771783534280643568608272 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((2850291667798319588767616292188406885891767140321784304136 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0195_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0195
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0196 : Poly :=
[
  term ((-112923694194156936736317023042487041048106425933365258784 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 196 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0196 : Poly :=
[
  term ((-225847388388313873472634046084974082096212851866730517568 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((112923694194156936736317023042487041048106425933365258784 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0196_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0196
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0197 : Poly :=
[
  term ((2665544507328767182636355820524028433085343965764342845952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 197 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0197 : Poly :=
[
  term ((5331089014657534365272711641048056866170687931528685691904 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2665544507328767182636355820524028433085343965764342845952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0197_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0197
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0198 : Poly :=
[
  term ((5115065188696484090615353281595032761543378442619133617952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0198 : Poly :=
[
  term ((10230130377392968181230706563190065523086756885238267235904 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5115065188696484090615353281595032761543378442619133617952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0198_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0198
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0199 : Poly :=
[
  term ((9180950665244181943997606191983760497247295257928 : Rat) / 29440651750971435056206958695923725930400098937525) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 199 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0199 : Poly :=
[
  term ((18361901330488363887995212383967520994494590515856 : Rat) / 29440651750971435056206958695923725930400098937525) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((-9180950665244181943997606191983760497247295257928 : Rat) / 29440651750971435056206958695923725930400098937525) [(4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0199_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0199
        rs_R013_ueqv_R013NYYN_generator_16_0100_0199 =
      rs_R013_ueqv_R013NYYN_partial_16_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NYYN_partials_16_0100_0199 : List Poly :=
[
  rs_R013_ueqv_R013NYYN_partial_16_0100,
  rs_R013_ueqv_R013NYYN_partial_16_0101,
  rs_R013_ueqv_R013NYYN_partial_16_0102,
  rs_R013_ueqv_R013NYYN_partial_16_0103,
  rs_R013_ueqv_R013NYYN_partial_16_0104,
  rs_R013_ueqv_R013NYYN_partial_16_0105,
  rs_R013_ueqv_R013NYYN_partial_16_0106,
  rs_R013_ueqv_R013NYYN_partial_16_0107,
  rs_R013_ueqv_R013NYYN_partial_16_0108,
  rs_R013_ueqv_R013NYYN_partial_16_0109,
  rs_R013_ueqv_R013NYYN_partial_16_0110,
  rs_R013_ueqv_R013NYYN_partial_16_0111,
  rs_R013_ueqv_R013NYYN_partial_16_0112,
  rs_R013_ueqv_R013NYYN_partial_16_0113,
  rs_R013_ueqv_R013NYYN_partial_16_0114,
  rs_R013_ueqv_R013NYYN_partial_16_0115,
  rs_R013_ueqv_R013NYYN_partial_16_0116,
  rs_R013_ueqv_R013NYYN_partial_16_0117,
  rs_R013_ueqv_R013NYYN_partial_16_0118,
  rs_R013_ueqv_R013NYYN_partial_16_0119,
  rs_R013_ueqv_R013NYYN_partial_16_0120,
  rs_R013_ueqv_R013NYYN_partial_16_0121,
  rs_R013_ueqv_R013NYYN_partial_16_0122,
  rs_R013_ueqv_R013NYYN_partial_16_0123,
  rs_R013_ueqv_R013NYYN_partial_16_0124,
  rs_R013_ueqv_R013NYYN_partial_16_0125,
  rs_R013_ueqv_R013NYYN_partial_16_0126,
  rs_R013_ueqv_R013NYYN_partial_16_0127,
  rs_R013_ueqv_R013NYYN_partial_16_0128,
  rs_R013_ueqv_R013NYYN_partial_16_0129,
  rs_R013_ueqv_R013NYYN_partial_16_0130,
  rs_R013_ueqv_R013NYYN_partial_16_0131,
  rs_R013_ueqv_R013NYYN_partial_16_0132,
  rs_R013_ueqv_R013NYYN_partial_16_0133,
  rs_R013_ueqv_R013NYYN_partial_16_0134,
  rs_R013_ueqv_R013NYYN_partial_16_0135,
  rs_R013_ueqv_R013NYYN_partial_16_0136,
  rs_R013_ueqv_R013NYYN_partial_16_0137,
  rs_R013_ueqv_R013NYYN_partial_16_0138,
  rs_R013_ueqv_R013NYYN_partial_16_0139,
  rs_R013_ueqv_R013NYYN_partial_16_0140,
  rs_R013_ueqv_R013NYYN_partial_16_0141,
  rs_R013_ueqv_R013NYYN_partial_16_0142,
  rs_R013_ueqv_R013NYYN_partial_16_0143,
  rs_R013_ueqv_R013NYYN_partial_16_0144,
  rs_R013_ueqv_R013NYYN_partial_16_0145,
  rs_R013_ueqv_R013NYYN_partial_16_0146,
  rs_R013_ueqv_R013NYYN_partial_16_0147,
  rs_R013_ueqv_R013NYYN_partial_16_0148,
  rs_R013_ueqv_R013NYYN_partial_16_0149,
  rs_R013_ueqv_R013NYYN_partial_16_0150,
  rs_R013_ueqv_R013NYYN_partial_16_0151,
  rs_R013_ueqv_R013NYYN_partial_16_0152,
  rs_R013_ueqv_R013NYYN_partial_16_0153,
  rs_R013_ueqv_R013NYYN_partial_16_0154,
  rs_R013_ueqv_R013NYYN_partial_16_0155,
  rs_R013_ueqv_R013NYYN_partial_16_0156,
  rs_R013_ueqv_R013NYYN_partial_16_0157,
  rs_R013_ueqv_R013NYYN_partial_16_0158,
  rs_R013_ueqv_R013NYYN_partial_16_0159,
  rs_R013_ueqv_R013NYYN_partial_16_0160,
  rs_R013_ueqv_R013NYYN_partial_16_0161,
  rs_R013_ueqv_R013NYYN_partial_16_0162,
  rs_R013_ueqv_R013NYYN_partial_16_0163,
  rs_R013_ueqv_R013NYYN_partial_16_0164,
  rs_R013_ueqv_R013NYYN_partial_16_0165,
  rs_R013_ueqv_R013NYYN_partial_16_0166,
  rs_R013_ueqv_R013NYYN_partial_16_0167,
  rs_R013_ueqv_R013NYYN_partial_16_0168,
  rs_R013_ueqv_R013NYYN_partial_16_0169,
  rs_R013_ueqv_R013NYYN_partial_16_0170,
  rs_R013_ueqv_R013NYYN_partial_16_0171,
  rs_R013_ueqv_R013NYYN_partial_16_0172,
  rs_R013_ueqv_R013NYYN_partial_16_0173,
  rs_R013_ueqv_R013NYYN_partial_16_0174,
  rs_R013_ueqv_R013NYYN_partial_16_0175,
  rs_R013_ueqv_R013NYYN_partial_16_0176,
  rs_R013_ueqv_R013NYYN_partial_16_0177,
  rs_R013_ueqv_R013NYYN_partial_16_0178,
  rs_R013_ueqv_R013NYYN_partial_16_0179,
  rs_R013_ueqv_R013NYYN_partial_16_0180,
  rs_R013_ueqv_R013NYYN_partial_16_0181,
  rs_R013_ueqv_R013NYYN_partial_16_0182,
  rs_R013_ueqv_R013NYYN_partial_16_0183,
  rs_R013_ueqv_R013NYYN_partial_16_0184,
  rs_R013_ueqv_R013NYYN_partial_16_0185,
  rs_R013_ueqv_R013NYYN_partial_16_0186,
  rs_R013_ueqv_R013NYYN_partial_16_0187,
  rs_R013_ueqv_R013NYYN_partial_16_0188,
  rs_R013_ueqv_R013NYYN_partial_16_0189,
  rs_R013_ueqv_R013NYYN_partial_16_0190,
  rs_R013_ueqv_R013NYYN_partial_16_0191,
  rs_R013_ueqv_R013NYYN_partial_16_0192,
  rs_R013_ueqv_R013NYYN_partial_16_0193,
  rs_R013_ueqv_R013NYYN_partial_16_0194,
  rs_R013_ueqv_R013NYYN_partial_16_0195,
  rs_R013_ueqv_R013NYYN_partial_16_0196,
  rs_R013_ueqv_R013NYYN_partial_16_0197,
  rs_R013_ueqv_R013NYYN_partial_16_0198,
  rs_R013_ueqv_R013NYYN_partial_16_0199
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NYYN_block_16_0100_0199 : Poly :=
[
  term ((-4831262803873165038450060496100856530458390639481603968 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-50183317998685075808224609337175995603519560444581354368 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-173845443383841305261938155057449877497829569868198818816 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-188848540059695918577475197270717127629641496934225514336 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-9662525607746330076900120992201713060916781278963207936 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((92980352019486201317095437917735813508838334559652812342976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((1577214950826391086065123019105112824031960985344747334944 : Rat) / 30055166474969461820135166544783741861745340202647959325) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2415631401936582519225030248050428265229195319740801984 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((25091658999342537904112304668587997801759780222290677184 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((86922721691920652630969077528724938748914784934099409408 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((94424270029847959288737598635358563814820748467112757168 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((4831262803873165038450060496100856530458390639481603968 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46490176009743100658547718958867906754419167279826406171488 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-788607475413195543032561509552556412015980492672373667472 : Rat) / 30055166474969461820135166544783741861745340202647959325) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((242910493469743590451809420673243557508546911056833313024 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((-121455246734871795225904710336621778754273455528416656512 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (5, 2), (16, 1)],
  term ((122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-11351294867910269285284859722965416178953183155335615923392 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-238305940502365277160194890324731122835785246165179066064 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-4955417296963904428469218188372784058239476009424481677168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2915188857358888286955981597897152285075223260461673062544 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((2232252560457682161086942327826727923593687058015027619568 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1050972476218643950510023131912450276724882996874239816736 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12214915917072103803174135389934069051546806361132401265152 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1398570887526174642560058489246961416856298271355904 : Rat) / 288518387159520063550828195220052514117920969587745) [(2, 1), (6, 1), (9, 2), (16, 1)],
  term ((244170218201339684827914865628222419480276316764212842368 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-270899314965638282477249603078654850725760648792593527568 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-851310234861444728972077067365811062164231294834015954832 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4659042488689587055278655799174039032846911804942716476096 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22702589735820538570569719445930832357906366310671231846784 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((86254786857308671098292586468914546622832174258073324570336 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((762542659834054996053389830685966777692064927027973783248 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-11576568921668998552637958464044512379277206419023558549152 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (6, 1), (16, 1)],
  term ((-122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((11351294867910269285284859722965416178953183155335615923392 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((5675647433955134642642429861482708089476591577667807961696 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((119152970251182638580097445162365561417892623082589533032 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((2477708648481952214234609094186392029119738004712240838584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((1457594428679444143477990798948576142537611630230836531272 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1024562448403338698733003089302780554491739910220933993896 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((2045050879460411494365225854884370812706343516567759982328 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((565295226034748820134982113144771807839361634979532636368 : Rat) / 21467976053549615585810833246274101329818100144748542375) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-699285443763087321280029244623480708428149135677952 : Rat) / 288518387159520063550828195220052514117920969587745) [(2, 1), (9, 2), (16, 1)],
  term ((-122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((135449657482819141238624801539327425362880324396296763784 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((425655117430722364486038533682905531082115647417007977416 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11351294867910269285284859722965416178953183155335615923392 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-43127393428654335549146293234457273311416087129036662285168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-381271329917027498026694915342983388846032463513986891624 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (13, 2), (16, 1)],
  term ((5788284460834499276318979232022256189638603209511779274576 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (15, 2), (16, 1)],
  term ((1666946983839507544914690715132315151724606700621726 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (16, 1)],
  term ((179819312403527895168377337958320131412886260079818069184 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((8365541497770330768092781809568792539346849897236730352 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-56586318579494668843880515717194938252108191543842338096 : Rat) / 3743526073394772824571995832980181370680024580400991375) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-48498654426212649374272282574981207343542321076371701304864 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-89909656201763947584188668979160065706443130039909034592 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-4182770748885165384046390904784396269673424948618365176 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((28293159289747334421940257858597469126054095771921169048 : Rat) / 3743526073394772824571995832980181370680024580400991375) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((24249327213106324687136141287490603671771160538185850652432 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-110316097874357323659592534133767905198498759541632840128 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 2), (6, 1), (16, 1)],
  term ((55158048937178661829796267066883952599249379770816420064 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 2), (5, 2), (16, 1)],
  term ((-311549472111135187743962208186949901378942973592154177488 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1537371964468133302208772266690539035414474750525886081424 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((58374453332226775494740084157095052409384695206768545107616 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1486593527949745953124796245852560744860047150347213310336 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24116117446475131617964640537337863671224691727813269811216 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((-14635162243259483296196847134240838443548718314349006310512 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((155774736055567593871981104093474950689471486796077088744 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-768685982234066651104386133345269517707237375262943040712 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-29187226666113387747370042078547526204692347603384272553808 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-743296763974872976562398122926280372430023575173606655168 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((12058058723237565808982320268668931835612345863906634905608 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (13, 2), (16, 1)],
  term ((7317581121629741648098423567120419221774359157174503155256 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 2), (15, 2), (16, 1)],
  term ((-72376499689317802672144883640718749220709888655132374528 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-142629168819469635185916776926986764198986214556082113088 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((36188249844658901336072441820359374610354944327566187264 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((71314584409734817592958388463493382099493107278041056544 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-29576064969449235285292582582569148459488349066488295808 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-5682342047188972714603750318990798420413767022786566503168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3572613871331339641784274757109697060774910649071841021504 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((702763665467526688811028425429495570933939263338217183168 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-2465096578073542873514025764454027195524059959689557441744 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-42267943936286046288548142363636295449639911261174313285952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((14788032484724617642646291291284574229744174533244147904 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((2841171023594486357301875159495399210206883511393283251584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((1786306935665669820892137378554848530387455324535920510752 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-351381832733763344405514212714747785466969631669108591584 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((1232548289036771436757012882227013597762029979844778720872 : Rat) / 210386165324786232740946165813486193032217381418535715275) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((21133971968143023144274071181818147724819955630587156642976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-2684653473332362108047434772681460970566351691620098816 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (4, 2), (5, 1), (6, 1), (16, 1)],
  term ((1342326736666181054023717386340730485283175845810049408 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((7675931493593522820371658096938927133828139497675571424 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(3, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((33614963912259482953797788749461066125774766158307243008 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((-355961366564465460149312665324538994509614688335859556416 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-3837965746796761410185829048469463566914069748837785712 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-16807481956129741476898894374730533062887383079153621504 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((177980683282232730074656332662269497254807344167929778208 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((16353968269301956998493831213990471955885071619983003008 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((54877195786736591692664104047352722297029155625556173504 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((-445907418645074136053820920518496285443599930385600273024 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((20433247257191875254025144879447322628723531022939504591192 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((50183317998685075808224609337175995603519560444581354368 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-8176984134650978499246915606995235977942535809991501504 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-27438597893368295846332052023676361148514577812778086752 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((222953709322537068026910460259248142721799965192800136512 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-11533935726061420866978468434824531198954153973140012847756 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (5, 1), (16, 1)],
  term ((-1398570887526174642560058489246961416856298271355904 : Rat) / 288518387159520063550828195220052514117920969587745) [(3, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-28655087696220788703105524333208250130425530965501321344 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-316224850947141259096916436012989163410083318682546669312 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((3499315186828377503946549028695379033869923721025592630944 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6667787935358030179658762860529260606898426802486904 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((58576211292467625680896932446816575928232883255198211632 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-485362687336673759321064575325262173115941633758102777056 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((4671335385752946698510813073224929027556604370452071704 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-315342108967434667943410560694664109606150251702645030288 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((2169397724789167663973150225175690956958870445420359252896 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11127983195995185671567767791006885495442535675339731648064 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5348452409574180629763739955011462490942776840577323189232 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-151002076505265110277869719405734956784133746699125092705984 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((56558039794091765220822735843734453383931736149308892875928 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((238305940502365277160194890324731122835785246165179066064 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((4955417296963904428469218188372784058239476009424481677168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((2915188857358888286955981597897152285075223260461673062544 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((699285443763087321280029244623480708428149135677952 : Rat) / 288518387159520063550828195220052514117920969587745) [(3, 1), (8, 1), (9, 1), (16, 1)],
  term ((14327543848110394351552762166604125065212765482750660672 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((158112425473570629548458218006494581705041659341273334656 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1749657593414188751973274514347689516934961860512796315472 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 1), (9, 1), (16, 1)],
  term ((-29288105646233812840448466223408287964116441627599105816 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((242681343668336879660532287662631086557970816879051388528 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-80597494361479579433347381410694961332951031208329089184 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(3, 1), (11, 1), (16, 1)],
  term ((157671054483717333971705280347332054803075125851322515144 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1084698862394583831986575112587845478479435222710179626448 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((5563991597997592835783883895503442747721267837669865824032 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1589559114669007982020559723601921628916411315539912708 : Rat) / 1164928933138351233338572346697044258207183728784804625) [(3, 1), (13, 1), (16, 1)],
  term ((75501038252632555138934859702867478392066873349562546352992 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11126866799141312370861445239395747730282502926820791432472 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(3, 1), (15, 1), (16, 1)],
  term ((6667787935358030179658762860529260606898426802486904 : Rat) / 7212959678988001588770704880501312852948024239693625) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-3333893967679015089829381430264630303449213401243452 : Rat) / 7212959678988001588770704880501312852948024239693625) [(3, 2), (4, 1), (16, 1)],
  term ((-6667787935358030179658762860529260606898426802486904 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(3, 2), (8, 1), (16, 1)],
  term ((6074065816419417382322881158107001178511230036261521536 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-3037032908209708691161440579053500589255615018130760768 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((11306550699340667172835178875384590467745545659814750784 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((66298575767239156133840421651644119797446762655509704352 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((993583346904999238703456071224220182364541435788672 : Rat) / 288518387159520063550828195220052514117920969587745) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-6074065816419417382322881158107001178511230036261521536 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-3037032908209708691161440579053500589255615018130760768 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((1518516454104854345580720289526750294627807509065380384 : Rat) / 667892588332654707114114812106305374705452004503287985) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-9367243778486729031349166865443134228479280944395224256 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-33149287883619578066920210825822059898723381327754852176 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-496791673452499619351728035612110091182270717894336 : Rat) / 288518387159520063550828195220052514117920969587745) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((8282391674614855853039323729661041442412478321408 : Rat) / 3271183527885715006245217632880413992266677659725) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-4141195837307427926519661864830520721206239160704 : Rat) / 3271183527885715006245217632880413992266677659725) [(4, 1), (5, 2), (16, 1)],
  term ((-137119193479966167616756298337266636717747804667265630144 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((1736771627796158781258203121189529465638327493507827835904 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((12713328521980453680590518720397692797781955888545679576704 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-105266613194788370731961029569335214788286711602308470464 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-868385813898079390629101560594764732819163746753913917952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-5700583335596639177535232584376813771783534280643568608272 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-746101761904924704226280287423555564647512457933824367776 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((2066491609518537918633937733880940532996617226094199869952 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((789847363732533096263141234447091043903701658548147953536 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((18361901330488363887995212383967520994494590515856 : Rat) / 29440651750971435056206958695923725930400098937525) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((137119193479966167616756298337266636717747804667265630144 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1736771627796158781258203121189529465638327493507827835904 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-12713328521980453680590518720397692797781955888545679576704 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((68559596739983083808378149168633318358873902333632815072 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-868385813898079390629101560594764732819163746753913917952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-6356664260990226840295259360198846398890977944272839788352 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((52633306597394185365980514784667607394143355801154235232 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((434192906949039695314550780297382366409581873376956958976 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((2850291667798319588767616292188406885891767140321784304136 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((112923694194156936736317023042487041048106425933365258784 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2665544507328767182636355820524028433085343965764342845952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5115065188696484090615353281595032761543378442619133617952 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9180950665244181943997606191983760497247295257928 : Rat) / 29440651750971435056206958695923725930400098937525) [(4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 100 through 199. -/
theorem rs_R013_ueqv_R013NYYN_block_16_0100_0199_valid :
    checkProductSumEq rs_R013_ueqv_R013NYYN_partials_16_0100_0199
      rs_R013_ueqv_R013NYYN_block_16_0100_0199 = true := by
  native_decide

end R013UeqvR013NYYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
