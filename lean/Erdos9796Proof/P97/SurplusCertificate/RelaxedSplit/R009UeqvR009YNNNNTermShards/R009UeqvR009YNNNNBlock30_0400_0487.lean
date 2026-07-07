/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 30:400-487

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0400 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (15, 3)]
]

/-- Partial product 400 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0400 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (15, 4)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (12, 2), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (13, 1), (15, 4)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0400_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0400
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0401 : Poly :=
[
  term ((-65 : Rat) / 14) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 401 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0401 : Poly :=
[
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (15, 4), (16, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0401_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0401
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0402 : Poly :=
[
  term ((-585770494211461 : Rat) / 2841865725888) [(9, 2)]
]

/-- Partial product 402 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0402 : Poly :=
[
  term ((585770494211461 : Rat) / 1420932862944) [(0, 1), (9, 2), (14, 1)],
  term ((-585770494211461 : Rat) / 2841865725888) [(0, 2), (9, 2)],
  term ((585770494211461 : Rat) / 1420932862944) [(1, 1), (9, 2), (15, 1)],
  term ((-585770494211461 : Rat) / 2841865725888) [(1, 2), (9, 2)],
  term ((-585770494211461 : Rat) / 1420932862944) [(9, 2), (12, 1), (14, 1)],
  term ((585770494211461 : Rat) / 2841865725888) [(9, 2), (12, 2)],
  term ((-585770494211461 : Rat) / 1420932862944) [(9, 2), (13, 1), (15, 1)],
  term ((585770494211461 : Rat) / 2841865725888) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0402_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0402
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0403 : Poly :=
[
  term ((1457547362843 : Rat) / 17986491936) [(9, 2), (10, 1)]
]

/-- Partial product 403 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0403 : Poly :=
[
  term ((-1457547362843 : Rat) / 8993245968) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((1457547362843 : Rat) / 17986491936) [(0, 2), (9, 2), (10, 1)],
  term ((-1457547362843 : Rat) / 8993245968) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((1457547362843 : Rat) / 17986491936) [(1, 2), (9, 2), (10, 1)],
  term ((1457547362843 : Rat) / 8993245968) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-1457547362843 : Rat) / 17986491936) [(9, 2), (10, 1), (12, 2)],
  term ((1457547362843 : Rat) / 8993245968) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1457547362843 : Rat) / 17986491936) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0403_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0403
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0404 : Poly :=
[
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1)]
]

/-- Partial product 404 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0404 : Poly :=
[
  term ((67338253723 : Rat) / 2248311492) [(0, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(0, 2), (9, 2), (10, 1), (12, 1)],
  term ((67338253723 : Rat) / 2248311492) [(1, 1), (9, 2), (10, 1), (12, 1), (15, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(1, 2), (9, 2), (10, 1), (12, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (13, 2)],
  term ((-67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 2), (14, 1)],
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0404_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0404
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0405 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1)]
]

/-- Partial product 405 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0405 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(0, 1), (9, 2), (10, 1), (14, 2)],
  term ((2172201733 : Rat) / 333083184) [(0, 2), (9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (12, 1), (14, 2)],
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (12, 2), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0405_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0405
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0406 : Poly :=
[
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1)]
]

/-- Partial product 406 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0406 : Poly :=
[
  term ((-997316410233 : Rat) / 4385595256) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((997316410233 : Rat) / 8771190512) [(0, 2), (9, 2), (12, 1)],
  term ((-997316410233 : Rat) / 4385595256) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((997316410233 : Rat) / 8771190512) [(1, 2), (9, 2), (12, 1)],
  term ((997316410233 : Rat) / 4385595256) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (13, 2)],
  term ((997316410233 : Rat) / 4385595256) [(9, 2), (12, 2), (14, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0406_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0406
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0407 : Poly :=
[
  term ((8129680847544803 : Rat) / 34812855142128) [(9, 2), (14, 1)]
]

/-- Partial product 407 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0407 : Poly :=
[
  term ((-8129680847544803 : Rat) / 17406427571064) [(0, 1), (9, 2), (14, 2)],
  term ((8129680847544803 : Rat) / 34812855142128) [(0, 2), (9, 2), (14, 1)],
  term ((-8129680847544803 : Rat) / 17406427571064) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((8129680847544803 : Rat) / 34812855142128) [(1, 2), (9, 2), (14, 1)],
  term ((8129680847544803 : Rat) / 17406427571064) [(9, 2), (12, 1), (14, 2)],
  term ((-8129680847544803 : Rat) / 34812855142128) [(9, 2), (12, 2), (14, 1)],
  term ((8129680847544803 : Rat) / 17406427571064) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-8129680847544803 : Rat) / 34812855142128) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0407_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0407
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0408 : Poly :=
[
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 2)]
]

/-- Partial product 408 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0408 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (14, 3)],
  term ((-210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 3)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (12, 2), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0408_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0408
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0409 : Poly :=
[
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (15, 2)]
]

/-- Partial product 409 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0409 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (14, 1), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (15, 3)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (12, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (13, 1), (15, 3)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0409_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0409
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0410 : Poly :=
[
  term ((-86398977664621 : Rat) / 8703213785532) [(10, 1)]
]

/-- Partial product 410 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0410 : Poly :=
[
  term ((86398977664621 : Rat) / 4351606892766) [(0, 1), (10, 1), (14, 1)],
  term ((-86398977664621 : Rat) / 8703213785532) [(0, 2), (10, 1)],
  term ((86398977664621 : Rat) / 4351606892766) [(1, 1), (10, 1), (15, 1)],
  term ((-86398977664621 : Rat) / 8703213785532) [(1, 2), (10, 1)],
  term ((-86398977664621 : Rat) / 4351606892766) [(10, 1), (12, 1), (14, 1)],
  term ((86398977664621 : Rat) / 8703213785532) [(10, 1), (12, 2)],
  term ((-86398977664621 : Rat) / 4351606892766) [(10, 1), (13, 1), (15, 1)],
  term ((86398977664621 : Rat) / 8703213785532) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0410_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0410
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0411 : Poly :=
[
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 411 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0411 : Poly :=
[
  term ((149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0411_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0411
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0412 : Poly :=
[
  term ((-3935422477433 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 412 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0412 : Poly :=
[
  term ((3935422477433 : Rat) / 9867589326) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3935422477433 : Rat) / 19735178652) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((3935422477433 : Rat) / 9867589326) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3935422477433 : Rat) / 19735178652) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3935422477433 : Rat) / 9867589326) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3935422477433 : Rat) / 19735178652) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-3935422477433 : Rat) / 9867589326) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((3935422477433 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0412_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0412
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0413 : Poly :=
[
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 413 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0413 : Poly :=
[
  term ((-149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0413_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0413
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0414 : Poly :=
[
  term ((-5 : Rat) / 2) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 414 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0414 : Poly :=
[
  term (5 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-5 : Rat) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term (-5 : Rat) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0414_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0414
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0415 : Poly :=
[
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 415 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0415 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0415_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0415
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0416 : Poly :=
[
  term ((8061903601299229 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 416 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0416 : Poly :=
[
  term ((-16123807202598458 : Rat) / 6527410339149) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((8061903601299229 : Rat) / 6527410339149) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-16123807202598458 : Rat) / 6527410339149) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((8061903601299229 : Rat) / 6527410339149) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((16123807202598458 : Rat) / 6527410339149) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8061903601299229 : Rat) / 6527410339149) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((16123807202598458 : Rat) / 6527410339149) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8061903601299229 : Rat) / 6527410339149) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0416_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0416
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0417 : Poly :=
[
  term ((18 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 417 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0417 : Poly :=
[
  term ((-36 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0417_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0417
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0418 : Poly :=
[
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2)]
]

/-- Partial product 418 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0418 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (12, 2)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0418_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0418
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0419 : Poly :=
[
  term ((-40 : Rat) / 21) [(10, 1), (12, 1)]
]

/-- Partial product 419 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0419 : Poly :=
[
  term ((80 : Rat) / 21) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-40 : Rat) / 21) [(0, 2), (10, 1), (12, 1)],
  term ((80 : Rat) / 21) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-40 : Rat) / 21) [(1, 2), (10, 1), (12, 1)],
  term ((-80 : Rat) / 21) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((40 : Rat) / 21) [(10, 1), (12, 1), (13, 2)],
  term ((-80 : Rat) / 21) [(10, 1), (12, 2), (14, 1)],
  term ((40 : Rat) / 21) [(10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0419_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0419
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0420 : Poly :=
[
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 420 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0420 : Poly :=
[
  term ((2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 3), (15, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0420_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0420
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0421 : Poly :=
[
  term ((-55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 421 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0421 : Poly :=
[
  term ((55 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-55 : Rat) / 14) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((55 : Rat) / 14) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 14) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0421_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0421
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0422 : Poly :=
[
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 422 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0422 : Poly :=
[
  term ((-245335365526 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((-245335365526 : Rat) / 44404151967) [(1, 1), (10, 1), (12, 1), (15, 3)],
  term ((122667682763 : Rat) / 44404151967) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((245335365526 : Rat) / 44404151967) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((245335365526 : Rat) / 44404151967) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0422_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0422
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0423 : Poly :=
[
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 423 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0423 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(10, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0423_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0423
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0424 : Poly :=
[
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 424 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0424 : Poly :=
[
  term ((27567777768901 : Rat) / 177616607868) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-27567777768901 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((27567777768901 : Rat) / 355233215736) [(10, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0424_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0424
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0425 : Poly :=
[
  term ((209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 425 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0425 : Poly :=
[
  term ((-209 : Rat) / 14) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((209 : Rat) / 28) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 14) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((209 : Rat) / 28) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-209 : Rat) / 28) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-209 : Rat) / 28) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0425_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0425
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0426 : Poly :=
[
  term ((-1159206758430179 : Rat) / 1598549470812) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 426 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0426 : Poly :=
[
  term ((1159206758430179 : Rat) / 799274735406) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1159206758430179 : Rat) / 1598549470812) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((1159206758430179 : Rat) / 799274735406) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1159206758430179 : Rat) / 1598549470812) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1159206758430179 : Rat) / 799274735406) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1159206758430179 : Rat) / 1598549470812) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1159206758430179 : Rat) / 799274735406) [(10, 1), (13, 2), (15, 2)],
  term ((1159206758430179 : Rat) / 1598549470812) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0426_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0426
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0427 : Poly :=
[
  term ((3413 : Rat) / 126) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0427 : Poly :=
[
  term ((-3413 : Rat) / 63) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3413 : Rat) / 126) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3413 : Rat) / 63) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3413 : Rat) / 126) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3413 : Rat) / 63) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3413 : Rat) / 126) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3413 : Rat) / 63) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3413 : Rat) / 126) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0427_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0427
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0428 : Poly :=
[
  term ((6090608323475 : Rat) / 1065699647208) [(10, 1), (13, 2)]
]

/-- Partial product 428 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0428 : Poly :=
[
  term ((-6090608323475 : Rat) / 532849823604) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((6090608323475 : Rat) / 1065699647208) [(0, 2), (10, 1), (13, 2)],
  term ((-6090608323475 : Rat) / 532849823604) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((6090608323475 : Rat) / 1065699647208) [(1, 2), (10, 1), (13, 2)],
  term ((6090608323475 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(10, 1), (12, 2), (13, 2)],
  term ((6090608323475 : Rat) / 532849823604) [(10, 1), (13, 3), (15, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(10, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0428_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0428
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0429 : Poly :=
[
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 429 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0429 : Poly :=
[
  term ((-2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (14, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 2), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (13, 3), (14, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0429_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0429
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0430 : Poly :=
[
  term ((55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 430 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0430 : Poly :=
[
  term ((-55 : Rat) / 7) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((55 : Rat) / 14) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 14) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 7) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0430_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0430
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0431 : Poly :=
[
  term ((-5 : Rat) / 12) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 431 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0431 : Poly :=
[
  term ((5 : Rat) / 6) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 12) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 6) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5 : Rat) / 12) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0431_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0431
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0432 : Poly :=
[
  term ((-5960768472550369 : Rat) / 9946530040608) [(10, 1), (14, 1)]
]

/-- Partial product 432 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0432 : Poly :=
[
  term ((5960768472550369 : Rat) / 4973265020304) [(0, 1), (10, 1), (14, 2)],
  term ((-5960768472550369 : Rat) / 9946530040608) [(0, 2), (10, 1), (14, 1)],
  term ((5960768472550369 : Rat) / 4973265020304) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5960768472550369 : Rat) / 9946530040608) [(1, 2), (10, 1), (14, 1)],
  term ((-5960768472550369 : Rat) / 4973265020304) [(10, 1), (12, 1), (14, 2)],
  term ((5960768472550369 : Rat) / 9946530040608) [(10, 1), (12, 2), (14, 1)],
  term ((-5960768472550369 : Rat) / 4973265020304) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((5960768472550369 : Rat) / 9946530040608) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0432_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0432
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0433 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 433 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0433 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 14801383989) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-3366906314273 : Rat) / 29602767978) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 14801383989) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0433_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0433
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0434 : Poly :=
[
  term ((-65 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 434 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0434 : Poly :=
[
  term ((130 : Rat) / 7) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((130 : Rat) / 7) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-130 : Rat) / 7) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-130 : Rat) / 7) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0434_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0434
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0435 : Poly :=
[
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (14, 2)]
]

/-- Partial product 435 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0435 : Poly :=
[
  term ((-7183625070497 : Rat) / 36722421036) [(0, 1), (10, 1), (14, 3)],
  term ((7183625070497 : Rat) / 73444842072) [(0, 2), (10, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 36722421036) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(1, 2), (10, 1), (14, 2)],
  term ((7183625070497 : Rat) / 36722421036) [(10, 1), (12, 1), (14, 3)],
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (12, 2), (14, 2)],
  term ((7183625070497 : Rat) / 36722421036) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0435_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0435
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0436 : Poly :=
[
  term ((2773695251754577 : Rat) / 3729948765228) [(10, 1), (15, 2)]
]

/-- Partial product 436 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0436 : Poly :=
[
  term ((-2773695251754577 : Rat) / 1864974382614) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((2773695251754577 : Rat) / 3729948765228) [(0, 2), (10, 1), (15, 2)],
  term ((-2773695251754577 : Rat) / 1864974382614) [(1, 1), (10, 1), (15, 3)],
  term ((2773695251754577 : Rat) / 3729948765228) [(1, 2), (10, 1), (15, 2)],
  term ((2773695251754577 : Rat) / 1864974382614) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2773695251754577 : Rat) / 3729948765228) [(10, 1), (12, 2), (15, 2)],
  term ((2773695251754577 : Rat) / 1864974382614) [(10, 1), (13, 1), (15, 3)],
  term ((-2773695251754577 : Rat) / 3729948765228) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0436_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0436
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0437 : Poly :=
[
  term ((-1363 : Rat) / 63) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 437 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0437 : Poly :=
[
  term ((2726 : Rat) / 63) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1363 : Rat) / 63) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((2726 : Rat) / 63) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1363 : Rat) / 63) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2726 : Rat) / 63) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1363 : Rat) / 63) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2726 : Rat) / 63) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1363 : Rat) / 63) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0437_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0437
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0438 : Poly :=
[
  term ((-59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 438 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0438 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0438_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0438
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0439 : Poly :=
[
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 439 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0439 : Poly :=
[
  term ((-38020291217764 : Rat) / 133212455901) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-38020291217764 : Rat) / 133212455901) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((19010145608882 : Rat) / 133212455901) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((38020291217764 : Rat) / 133212455901) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((38020291217764 : Rat) / 133212455901) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0439_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0439
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0440 : Poly :=
[
  term ((-99676931740181359 : Rat) / 208877130852768) [(11, 1), (13, 1)]
]

/-- Partial product 440 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0440 : Poly :=
[
  term ((99676931740181359 : Rat) / 104438565426384) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-99676931740181359 : Rat) / 208877130852768) [(0, 2), (11, 1), (13, 1)],
  term ((99676931740181359 : Rat) / 104438565426384) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-99676931740181359 : Rat) / 208877130852768) [(1, 2), (11, 1), (13, 1)],
  term ((-99676931740181359 : Rat) / 104438565426384) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((99676931740181359 : Rat) / 208877130852768) [(11, 1), (12, 2), (13, 1)],
  term ((-99676931740181359 : Rat) / 104438565426384) [(11, 1), (13, 2), (15, 1)],
  term ((99676931740181359 : Rat) / 208877130852768) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0440_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0440
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0441 : Poly :=
[
  term ((-3957929556424135 : Rat) / 6394197883248) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 441 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0441 : Poly :=
[
  term ((3957929556424135 : Rat) / 3197098941624) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-3957929556424135 : Rat) / 6394197883248) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((3957929556424135 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3957929556424135 : Rat) / 6394197883248) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3957929556424135 : Rat) / 3197098941624) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((3957929556424135 : Rat) / 6394197883248) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3957929556424135 : Rat) / 3197098941624) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((3957929556424135 : Rat) / 6394197883248) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0441_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0441
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0442 : Poly :=
[
  term ((4075 : Rat) / 504) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 442 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0442 : Poly :=
[
  term ((-4075 : Rat) / 252) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((4075 : Rat) / 504) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4075 : Rat) / 252) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4075 : Rat) / 504) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4075 : Rat) / 252) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4075 : Rat) / 504) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((4075 : Rat) / 252) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4075 : Rat) / 504) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0442_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0442
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0443 : Poly :=
[
  term ((59904 : Rat) / 553) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 443 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0443 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 3)],
  term ((59904 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-59904 : Rat) / 553) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-59904 : Rat) / 553) [(11, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0443_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0443
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0444 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 444 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0444 : Poly :=
[
  term ((-2954048478533 : Rat) / 19735178652) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (13, 2), (15, 3)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0444_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0444
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0445 : Poly :=
[
  term ((-305 : Rat) / 28) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 445 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0445 : Poly :=
[
  term ((305 : Rat) / 14) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((305 : Rat) / 28) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0445_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0445
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0446 : Poly :=
[
  term ((4675 : Rat) / 336) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 446 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0446 : Poly :=
[
  term ((-4675 : Rat) / 168) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4675 : Rat) / 336) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4675 : Rat) / 168) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4675 : Rat) / 336) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((4675 : Rat) / 168) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4675 : Rat) / 336) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((4675 : Rat) / 168) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4675 : Rat) / 336) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0446_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0446
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0447 : Poly :=
[
  term ((-7112954056841105 : Rat) / 2486632510152) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 447 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0447 : Poly :=
[
  term ((7112954056841105 : Rat) / 1243316255076) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-7112954056841105 : Rat) / 2486632510152) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((7112954056841105 : Rat) / 1243316255076) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-7112954056841105 : Rat) / 2486632510152) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-7112954056841105 : Rat) / 1243316255076) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((7112954056841105 : Rat) / 2486632510152) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-7112954056841105 : Rat) / 1243316255076) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((7112954056841105 : Rat) / 2486632510152) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0447_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0447
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0448 : Poly :=
[
  term ((-841 : Rat) / 126) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0448 : Poly :=
[
  term ((841 : Rat) / 63) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-841 : Rat) / 126) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((841 : Rat) / 63) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-841 : Rat) / 126) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-841 : Rat) / 63) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((841 : Rat) / 126) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-841 : Rat) / 63) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((841 : Rat) / 126) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0448_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0448
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0449 : Poly :=
[
  term ((-4596599348427 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 449 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0449 : Poly :=
[
  term ((9193198696854 : Rat) / 26861770943) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((4596599348427 : Rat) / 26861770943) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0449_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0449
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0450 : Poly :=
[
  term ((-451930019917219681 : Rat) / 208877130852768) [(11, 1), (15, 1)]
]

/-- Partial product 450 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0450 : Poly :=
[
  term ((451930019917219681 : Rat) / 104438565426384) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-451930019917219681 : Rat) / 208877130852768) [(0, 2), (11, 1), (15, 1)],
  term ((451930019917219681 : Rat) / 104438565426384) [(1, 1), (11, 1), (15, 2)],
  term ((-451930019917219681 : Rat) / 208877130852768) [(1, 2), (11, 1), (15, 1)],
  term ((-451930019917219681 : Rat) / 104438565426384) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((451930019917219681 : Rat) / 208877130852768) [(11, 1), (12, 2), (15, 1)],
  term ((-451930019917219681 : Rat) / 104438565426384) [(11, 1), (13, 1), (15, 2)],
  term ((451930019917219681 : Rat) / 208877130852768) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0450_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0450
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0451 : Poly :=
[
  term ((-925 : Rat) / 84) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0451 : Poly :=
[
  term ((925 : Rat) / 42) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-925 : Rat) / 84) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((925 : Rat) / 42) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-925 : Rat) / 84) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-925 : Rat) / 42) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((925 : Rat) / 84) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-925 : Rat) / 42) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((925 : Rat) / 84) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0451_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0451
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0452 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(11, 1), (15, 3)]
]

/-- Partial product 452 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0452 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (11, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 1), (11, 1), (15, 4)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (12, 2), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (13, 1), (15, 4)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0452_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0452
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0453 : Poly :=
[
  term ((65 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 453 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0453 : Poly :=
[
  term ((-130 : Rat) / 7) [(0, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((65 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-65 : Rat) / 7) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0453_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0453
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0454 : Poly :=
[
  term ((-9049653117374563 : Rat) / 17406427571064) [(11, 2)]
]

/-- Partial product 454 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0454 : Poly :=
[
  term ((9049653117374563 : Rat) / 8703213785532) [(0, 1), (11, 2), (14, 1)],
  term ((-9049653117374563 : Rat) / 17406427571064) [(0, 2), (11, 2)],
  term ((9049653117374563 : Rat) / 8703213785532) [(1, 1), (11, 2), (15, 1)],
  term ((-9049653117374563 : Rat) / 17406427571064) [(1, 2), (11, 2)],
  term ((-9049653117374563 : Rat) / 8703213785532) [(11, 2), (12, 1), (14, 1)],
  term ((9049653117374563 : Rat) / 17406427571064) [(11, 2), (12, 2)],
  term ((-9049653117374563 : Rat) / 8703213785532) [(11, 2), (13, 1), (15, 1)],
  term ((9049653117374563 : Rat) / 17406427571064) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0454_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0454
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0455 : Poly :=
[
  term ((23369978600860751 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

/-- Partial product 455 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0455 : Poly :=
[
  term ((-23369978600860751 : Rat) / 13054820678298) [(0, 1), (11, 2), (14, 2)],
  term ((23369978600860751 : Rat) / 26109641356596) [(0, 2), (11, 2), (14, 1)],
  term ((-23369978600860751 : Rat) / 13054820678298) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((23369978600860751 : Rat) / 26109641356596) [(1, 2), (11, 2), (14, 1)],
  term ((23369978600860751 : Rat) / 13054820678298) [(11, 2), (12, 1), (14, 2)],
  term ((-23369978600860751 : Rat) / 26109641356596) [(11, 2), (12, 2), (14, 1)],
  term ((23369978600860751 : Rat) / 13054820678298) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-23369978600860751 : Rat) / 26109641356596) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0455_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0455
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0456 : Poly :=
[
  term ((-119808 : Rat) / 553) [(11, 2), (15, 2)]
]

/-- Partial product 456 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0456 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(0, 2), (11, 2), (15, 2)],
  term ((239616 : Rat) / 553) [(1, 1), (11, 2), (15, 3)],
  term ((-119808 : Rat) / 553) [(1, 2), (11, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(11, 2), (12, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(11, 2), (13, 1), (15, 3)],
  term ((119808 : Rat) / 553) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0456_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0456
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0457 : Poly :=
[
  term ((-2444668745291 : Rat) / 266424911802) [(12, 1)]
]

/-- Partial product 457 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0457 : Poly :=
[
  term ((2444668745291 : Rat) / 133212455901) [(0, 1), (12, 1), (14, 1)],
  term ((-2444668745291 : Rat) / 266424911802) [(0, 2), (12, 1)],
  term ((2444668745291 : Rat) / 133212455901) [(1, 1), (12, 1), (15, 1)],
  term ((-2444668745291 : Rat) / 266424911802) [(1, 2), (12, 1)],
  term ((-2444668745291 : Rat) / 133212455901) [(12, 1), (13, 1), (15, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(12, 1), (13, 2)],
  term ((-2444668745291 : Rat) / 133212455901) [(12, 2), (14, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0457_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0457
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0458 : Poly :=
[
  term ((-2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 458 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0458 : Poly :=
[
  term ((2629582380889 : Rat) / 118411071912) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2629582380889 : Rat) / 236822143824) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 1), (13, 3), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0458_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0458
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0459 : Poly :=
[
  term ((-345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0459 : Poly :=
[
  term ((345 : Rat) / 28) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-345 : Rat) / 56) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 28) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((345 : Rat) / 56) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 28) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((345 : Rat) / 56) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0459_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0459
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0460 : Poly :=
[
  term ((389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 460 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0460 : Poly :=
[
  term ((-389178307824539 : Rat) / 2131399294416) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((389178307824539 : Rat) / 4262798588832) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(12, 1), (13, 2), (15, 2)],
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 3), (15, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0460_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0460
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0461 : Poly :=
[
  term ((-45 : Rat) / 112) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 461 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0461 : Poly :=
[
  term ((45 : Rat) / 56) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-45 : Rat) / 112) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 56) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((45 : Rat) / 112) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-45 : Rat) / 56) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 112) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0461_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0461
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0462 : Poly :=
[
  term ((2991533456192 : Rat) / 133212455901) [(12, 1), (14, 1)]
]

/-- Partial product 462 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0462 : Poly :=
[
  term ((-5983066912384 : Rat) / 133212455901) [(0, 1), (12, 1), (14, 2)],
  term ((2991533456192 : Rat) / 133212455901) [(0, 2), (12, 1), (14, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(1, 2), (12, 1), (14, 1)],
  term ((5983066912384 : Rat) / 133212455901) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(12, 1), (13, 2), (14, 1)],
  term ((5983066912384 : Rat) / 133212455901) [(12, 2), (14, 2)],
  term ((-2991533456192 : Rat) / 133212455901) [(12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0462_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0462
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0463 : Poly :=
[
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 463 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0463 : Poly :=
[
  term ((-2187255370987 : Rat) / 9867589326) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((2187255370987 : Rat) / 19735178652) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((2187255370987 : Rat) / 19735178652) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 9867589326) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2187255370987 : Rat) / 19735178652) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 9867589326) [(12, 2), (14, 2), (15, 2)],
  term ((-2187255370987 : Rat) / 19735178652) [(12, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0463_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0463
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0464 : Poly :=
[
  term ((73 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 464 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0464 : Poly :=
[
  term ((-73 : Rat) / 7) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 7) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((73 : Rat) / 14) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 7) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-73 : Rat) / 14) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 7) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(12, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0464_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0464
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0465 : Poly :=
[
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 2)]
]

/-- Partial product 465 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0465 : Poly :=
[
  term ((2001591001496153 : Rat) / 4351606892766) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 4351606892766) [(1, 1), (12, 1), (15, 3)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(1, 2), (12, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(12, 1), (13, 1), (15, 3)],
  term ((2001591001496153 : Rat) / 8703213785532) [(12, 1), (13, 2), (15, 2)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(12, 2), (14, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 8703213785532) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0465_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0465
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0466 : Poly :=
[
  term ((155 : Rat) / 84) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 466 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0466 : Poly :=
[
  term ((-155 : Rat) / 42) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 84) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 42) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((155 : Rat) / 84) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 42) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-155 : Rat) / 84) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((155 : Rat) / 42) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 84) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0466_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0466
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0467 : Poly :=
[
  term ((-5501067393108209 : Rat) / 11189846295684) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 467 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0467 : Poly :=
[
  term ((5501067393108209 : Rat) / 5594923147842) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5501067393108209 : Rat) / 11189846295684) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((5501067393108209 : Rat) / 5594923147842) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5501067393108209 : Rat) / 11189846295684) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5501067393108209 : Rat) / 5594923147842) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((5501067393108209 : Rat) / 11189846295684) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5501067393108209 : Rat) / 5594923147842) [(13, 2), (14, 1), (15, 2)],
  term ((5501067393108209 : Rat) / 11189846295684) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0467_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0467
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0468 : Poly :=
[
  term ((-1325 : Rat) / 252) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 468 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0468 : Poly :=
[
  term ((1325 : Rat) / 126) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1325 : Rat) / 252) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1325 : Rat) / 126) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1325 : Rat) / 252) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1325 : Rat) / 126) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1325 : Rat) / 252) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1325 : Rat) / 126) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1325 : Rat) / 252) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0468_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0468
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0469 : Poly :=
[
  term ((-2187255370987 : Rat) / 19735178652) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 469 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0469 : Poly :=
[
  term ((2187255370987 : Rat) / 9867589326) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2187255370987 : Rat) / 19735178652) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(13, 2), (14, 2), (15, 2)],
  term ((2187255370987 : Rat) / 19735178652) [(13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0469_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0469
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0470 : Poly :=
[
  term ((-73 : Rat) / 14) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 470 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0470 : Poly :=
[
  term ((73 : Rat) / 7) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-73 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 7) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 7) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((73 : Rat) / 14) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 7) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0470_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0470
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0471 : Poly :=
[
  term ((-786876374527566137 : Rat) / 626631392558304) [(13, 1), (15, 1)]
]

/-- Partial product 471 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0471 : Poly :=
[
  term ((786876374527566137 : Rat) / 313315696279152) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-786876374527566137 : Rat) / 626631392558304) [(0, 2), (13, 1), (15, 1)],
  term ((786876374527566137 : Rat) / 313315696279152) [(1, 1), (13, 1), (15, 2)],
  term ((-786876374527566137 : Rat) / 626631392558304) [(1, 2), (13, 1), (15, 1)],
  term ((-786876374527566137 : Rat) / 313315696279152) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((786876374527566137 : Rat) / 626631392558304) [(12, 2), (13, 1), (15, 1)],
  term ((-786876374527566137 : Rat) / 313315696279152) [(13, 2), (15, 2)],
  term ((786876374527566137 : Rat) / 626631392558304) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0471_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0471
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0472 : Poly :=
[
  term ((48541 : Rat) / 1008) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 472 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0472 : Poly :=
[
  term ((-48541 : Rat) / 504) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((48541 : Rat) / 1008) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-48541 : Rat) / 504) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((48541 : Rat) / 1008) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((48541 : Rat) / 504) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48541 : Rat) / 1008) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((48541 : Rat) / 504) [(13, 2), (15, 2), (16, 1)],
  term ((-48541 : Rat) / 1008) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0472_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0472
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0473 : Poly :=
[
  term ((287826798794417 : Rat) / 799274735406) [(13, 2)]
]

/-- Partial product 473 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0473 : Poly :=
[
  term ((-287826798794417 : Rat) / 399637367703) [(0, 1), (13, 2), (14, 1)],
  term ((287826798794417 : Rat) / 799274735406) [(0, 2), (13, 2)],
  term ((-287826798794417 : Rat) / 399637367703) [(1, 1), (13, 2), (15, 1)],
  term ((287826798794417 : Rat) / 799274735406) [(1, 2), (13, 2)],
  term ((287826798794417 : Rat) / 399637367703) [(12, 1), (13, 2), (14, 1)],
  term ((-287826798794417 : Rat) / 799274735406) [(12, 2), (13, 2)],
  term ((287826798794417 : Rat) / 399637367703) [(13, 3), (15, 1)],
  term ((-287826798794417 : Rat) / 799274735406) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0473_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0473
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0474 : Poly :=
[
  term ((-389178307824539 : Rat) / 4262798588832) [(13, 2), (14, 1)]
]

/-- Partial product 474 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0474 : Poly :=
[
  term ((389178307824539 : Rat) / 2131399294416) [(0, 1), (13, 2), (14, 2)],
  term ((-389178307824539 : Rat) / 4262798588832) [(0, 2), (13, 2), (14, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(1, 2), (13, 2), (14, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(12, 1), (13, 2), (14, 2)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 2), (13, 2), (14, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(13, 3), (14, 1), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0474_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0474
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0475 : Poly :=
[
  term ((45 : Rat) / 112) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 475 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0475 : Poly :=
[
  term ((-45 : Rat) / 56) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((45 : Rat) / 112) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-45 : Rat) / 56) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 112) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((45 : Rat) / 56) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-45 : Rat) / 112) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((45 : Rat) / 56) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0475_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0475
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0476 : Poly :=
[
  term ((2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2)]
]

/-- Partial product 476 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0476 : Poly :=
[
  term ((-2629582380889 : Rat) / 118411071912) [(0, 1), (13, 2), (14, 3)],
  term ((2629582380889 : Rat) / 236822143824) [(0, 2), (13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 118411071912) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(1, 2), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 3)],
  term ((-2629582380889 : Rat) / 236822143824) [(12, 2), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 118411071912) [(13, 3), (14, 2), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(13, 4), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0476_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0476
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0477 : Poly :=
[
  term ((345 : Rat) / 56) [(13, 2), (14, 2), (16, 1)]
]

/-- Partial product 477 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0477 : Poly :=
[
  term ((-345 : Rat) / 28) [(0, 1), (13, 2), (14, 3), (16, 1)],
  term ((345 : Rat) / 56) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((-345 : Rat) / 28) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((345 : Rat) / 56) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 28) [(12, 1), (13, 2), (14, 3), (16, 1)],
  term ((-345 : Rat) / 56) [(12, 2), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 28) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(13, 4), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0477_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0477
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0478 : Poly :=
[
  term ((-1465 : Rat) / 126) [(13, 2), (16, 1)]
]

/-- Partial product 478 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0478 : Poly :=
[
  term ((1465 : Rat) / 63) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1465 : Rat) / 126) [(0, 2), (13, 2), (16, 1)],
  term ((1465 : Rat) / 63) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1465 : Rat) / 126) [(1, 2), (13, 2), (16, 1)],
  term ((-1465 : Rat) / 63) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1465 : Rat) / 126) [(12, 2), (13, 2), (16, 1)],
  term ((-1465 : Rat) / 63) [(13, 3), (15, 1), (16, 1)],
  term ((1465 : Rat) / 126) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0478_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0478
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0479 : Poly :=
[
  term ((-420111119089079 : Rat) / 2175803446383) [(14, 1)]
]

/-- Partial product 479 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0479 : Poly :=
[
  term ((840222238178158 : Rat) / 2175803446383) [(0, 1), (14, 2)],
  term ((-420111119089079 : Rat) / 2175803446383) [(0, 2), (14, 1)],
  term ((840222238178158 : Rat) / 2175803446383) [(1, 1), (14, 1), (15, 1)],
  term ((-420111119089079 : Rat) / 2175803446383) [(1, 2), (14, 1)],
  term ((-840222238178158 : Rat) / 2175803446383) [(12, 1), (14, 2)],
  term ((420111119089079 : Rat) / 2175803446383) [(12, 2), (14, 1)],
  term ((-840222238178158 : Rat) / 2175803446383) [(13, 1), (14, 1), (15, 1)],
  term ((420111119089079 : Rat) / 2175803446383) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0479_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0479
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0480 : Poly :=
[
  term ((11899100091633005 : Rat) / 7736190031584) [(14, 1), (15, 2)]
]

/-- Partial product 480 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0480 : Poly :=
[
  term ((-11899100091633005 : Rat) / 3868095015792) [(0, 1), (14, 2), (15, 2)],
  term ((11899100091633005 : Rat) / 7736190031584) [(0, 2), (14, 1), (15, 2)],
  term ((-11899100091633005 : Rat) / 3868095015792) [(1, 1), (14, 1), (15, 3)],
  term ((11899100091633005 : Rat) / 7736190031584) [(1, 2), (14, 1), (15, 2)],
  term ((11899100091633005 : Rat) / 3868095015792) [(12, 1), (14, 2), (15, 2)],
  term ((-11899100091633005 : Rat) / 7736190031584) [(12, 2), (14, 1), (15, 2)],
  term ((11899100091633005 : Rat) / 3868095015792) [(13, 1), (14, 1), (15, 3)],
  term ((-11899100091633005 : Rat) / 7736190031584) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0480_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0480
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0481 : Poly :=
[
  term ((260 : Rat) / 63) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 481 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0481 : Poly :=
[
  term ((-520 : Rat) / 63) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((260 : Rat) / 63) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-520 : Rat) / 63) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((260 : Rat) / 63) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((520 : Rat) / 63) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-260 : Rat) / 63) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((520 : Rat) / 63) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-260 : Rat) / 63) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0481_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0481
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0482 : Poly :=
[
  term ((16 : Rat) / 21) [(14, 1), (16, 1)]
]

/-- Partial product 482 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0482 : Poly :=
[
  term ((-32 : Rat) / 21) [(0, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 21) [(12, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(12, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 21) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0482_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0482
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0483 : Poly :=
[
  term ((10741252418198635 : Rat) / 139251420568512) [(14, 2)]
]

/-- Partial product 483 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0483 : Poly :=
[
  term ((-10741252418198635 : Rat) / 69625710284256) [(0, 1), (14, 3)],
  term ((10741252418198635 : Rat) / 139251420568512) [(0, 2), (14, 2)],
  term ((-10741252418198635 : Rat) / 69625710284256) [(1, 1), (14, 2), (15, 1)],
  term ((10741252418198635 : Rat) / 139251420568512) [(1, 2), (14, 2)],
  term ((10741252418198635 : Rat) / 69625710284256) [(12, 1), (14, 3)],
  term ((-10741252418198635 : Rat) / 139251420568512) [(12, 2), (14, 2)],
  term ((10741252418198635 : Rat) / 69625710284256) [(13, 1), (14, 2), (15, 1)],
  term ((-10741252418198635 : Rat) / 139251420568512) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0483_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0483
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0484 : Poly :=
[
  term ((-16 : Rat) / 21) [(14, 2), (16, 1)]
]

/-- Partial product 484 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0484 : Poly :=
[
  term ((32 : Rat) / 21) [(0, 1), (14, 3), (16, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (14, 2), (16, 1)],
  term ((32 : Rat) / 21) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (14, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(12, 1), (14, 3), (16, 1)],
  term ((16 : Rat) / 21) [(12, 2), (14, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0484_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0484
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0485 : Poly :=
[
  term ((-8979241671985367 : Rat) / 29839590121824) [(14, 3)]
]

/-- Partial product 485 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0485 : Poly :=
[
  term ((8979241671985367 : Rat) / 14919795060912) [(0, 1), (14, 4)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(0, 2), (14, 3)],
  term ((8979241671985367 : Rat) / 14919795060912) [(1, 1), (14, 3), (15, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(1, 2), (14, 3)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(12, 1), (14, 4)],
  term ((8979241671985367 : Rat) / 29839590121824) [(12, 2), (14, 3)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(13, 1), (14, 3), (15, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0485_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0485
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0486 : Poly :=
[
  term ((20038214580346519 : Rat) / 6631020027072) [(15, 2)]
]

/-- Partial product 486 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0486 : Poly :=
[
  term ((-20038214580346519 : Rat) / 3315510013536) [(0, 1), (14, 1), (15, 2)],
  term ((20038214580346519 : Rat) / 6631020027072) [(0, 2), (15, 2)],
  term ((-20038214580346519 : Rat) / 3315510013536) [(1, 1), (15, 3)],
  term ((20038214580346519 : Rat) / 6631020027072) [(1, 2), (15, 2)],
  term ((20038214580346519 : Rat) / 3315510013536) [(12, 1), (14, 1), (15, 2)],
  term ((-20038214580346519 : Rat) / 6631020027072) [(12, 2), (15, 2)],
  term ((20038214580346519 : Rat) / 3315510013536) [(13, 1), (15, 3)],
  term ((-20038214580346519 : Rat) / 6631020027072) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0486_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0486
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0487 : Poly :=
[
  term ((-1223 : Rat) / 36) [(15, 2), (16, 1)]
]

/-- Partial product 487 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0487 : Poly :=
[
  term ((1223 : Rat) / 18) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1223 : Rat) / 36) [(0, 2), (15, 2), (16, 1)],
  term ((1223 : Rat) / 18) [(1, 1), (15, 3), (16, 1)],
  term ((-1223 : Rat) / 36) [(1, 2), (15, 2), (16, 1)],
  term ((-1223 : Rat) / 18) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1223 : Rat) / 36) [(12, 2), (15, 2), (16, 1)],
  term ((-1223 : Rat) / 18) [(13, 1), (15, 3), (16, 1)],
  term ((1223 : Rat) / 36) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0487_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0487
        rs_R009_ueqv_R009YNNNN_generator_30_0400_0487 =
      rs_R009_ueqv_R009YNNNN_partial_30_0487 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_30_0400_0487 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_30_0400,
  rs_R009_ueqv_R009YNNNN_partial_30_0401,
  rs_R009_ueqv_R009YNNNN_partial_30_0402,
  rs_R009_ueqv_R009YNNNN_partial_30_0403,
  rs_R009_ueqv_R009YNNNN_partial_30_0404,
  rs_R009_ueqv_R009YNNNN_partial_30_0405,
  rs_R009_ueqv_R009YNNNN_partial_30_0406,
  rs_R009_ueqv_R009YNNNN_partial_30_0407,
  rs_R009_ueqv_R009YNNNN_partial_30_0408,
  rs_R009_ueqv_R009YNNNN_partial_30_0409,
  rs_R009_ueqv_R009YNNNN_partial_30_0410,
  rs_R009_ueqv_R009YNNNN_partial_30_0411,
  rs_R009_ueqv_R009YNNNN_partial_30_0412,
  rs_R009_ueqv_R009YNNNN_partial_30_0413,
  rs_R009_ueqv_R009YNNNN_partial_30_0414,
  rs_R009_ueqv_R009YNNNN_partial_30_0415,
  rs_R009_ueqv_R009YNNNN_partial_30_0416,
  rs_R009_ueqv_R009YNNNN_partial_30_0417,
  rs_R009_ueqv_R009YNNNN_partial_30_0418,
  rs_R009_ueqv_R009YNNNN_partial_30_0419,
  rs_R009_ueqv_R009YNNNN_partial_30_0420,
  rs_R009_ueqv_R009YNNNN_partial_30_0421,
  rs_R009_ueqv_R009YNNNN_partial_30_0422,
  rs_R009_ueqv_R009YNNNN_partial_30_0423,
  rs_R009_ueqv_R009YNNNN_partial_30_0424,
  rs_R009_ueqv_R009YNNNN_partial_30_0425,
  rs_R009_ueqv_R009YNNNN_partial_30_0426,
  rs_R009_ueqv_R009YNNNN_partial_30_0427,
  rs_R009_ueqv_R009YNNNN_partial_30_0428,
  rs_R009_ueqv_R009YNNNN_partial_30_0429,
  rs_R009_ueqv_R009YNNNN_partial_30_0430,
  rs_R009_ueqv_R009YNNNN_partial_30_0431,
  rs_R009_ueqv_R009YNNNN_partial_30_0432,
  rs_R009_ueqv_R009YNNNN_partial_30_0433,
  rs_R009_ueqv_R009YNNNN_partial_30_0434,
  rs_R009_ueqv_R009YNNNN_partial_30_0435,
  rs_R009_ueqv_R009YNNNN_partial_30_0436,
  rs_R009_ueqv_R009YNNNN_partial_30_0437,
  rs_R009_ueqv_R009YNNNN_partial_30_0438,
  rs_R009_ueqv_R009YNNNN_partial_30_0439,
  rs_R009_ueqv_R009YNNNN_partial_30_0440,
  rs_R009_ueqv_R009YNNNN_partial_30_0441,
  rs_R009_ueqv_R009YNNNN_partial_30_0442,
  rs_R009_ueqv_R009YNNNN_partial_30_0443,
  rs_R009_ueqv_R009YNNNN_partial_30_0444,
  rs_R009_ueqv_R009YNNNN_partial_30_0445,
  rs_R009_ueqv_R009YNNNN_partial_30_0446,
  rs_R009_ueqv_R009YNNNN_partial_30_0447,
  rs_R009_ueqv_R009YNNNN_partial_30_0448,
  rs_R009_ueqv_R009YNNNN_partial_30_0449,
  rs_R009_ueqv_R009YNNNN_partial_30_0450,
  rs_R009_ueqv_R009YNNNN_partial_30_0451,
  rs_R009_ueqv_R009YNNNN_partial_30_0452,
  rs_R009_ueqv_R009YNNNN_partial_30_0453,
  rs_R009_ueqv_R009YNNNN_partial_30_0454,
  rs_R009_ueqv_R009YNNNN_partial_30_0455,
  rs_R009_ueqv_R009YNNNN_partial_30_0456,
  rs_R009_ueqv_R009YNNNN_partial_30_0457,
  rs_R009_ueqv_R009YNNNN_partial_30_0458,
  rs_R009_ueqv_R009YNNNN_partial_30_0459,
  rs_R009_ueqv_R009YNNNN_partial_30_0460,
  rs_R009_ueqv_R009YNNNN_partial_30_0461,
  rs_R009_ueqv_R009YNNNN_partial_30_0462,
  rs_R009_ueqv_R009YNNNN_partial_30_0463,
  rs_R009_ueqv_R009YNNNN_partial_30_0464,
  rs_R009_ueqv_R009YNNNN_partial_30_0465,
  rs_R009_ueqv_R009YNNNN_partial_30_0466,
  rs_R009_ueqv_R009YNNNN_partial_30_0467,
  rs_R009_ueqv_R009YNNNN_partial_30_0468,
  rs_R009_ueqv_R009YNNNN_partial_30_0469,
  rs_R009_ueqv_R009YNNNN_partial_30_0470,
  rs_R009_ueqv_R009YNNNN_partial_30_0471,
  rs_R009_ueqv_R009YNNNN_partial_30_0472,
  rs_R009_ueqv_R009YNNNN_partial_30_0473,
  rs_R009_ueqv_R009YNNNN_partial_30_0474,
  rs_R009_ueqv_R009YNNNN_partial_30_0475,
  rs_R009_ueqv_R009YNNNN_partial_30_0476,
  rs_R009_ueqv_R009YNNNN_partial_30_0477,
  rs_R009_ueqv_R009YNNNN_partial_30_0478,
  rs_R009_ueqv_R009YNNNN_partial_30_0479,
  rs_R009_ueqv_R009YNNNN_partial_30_0480,
  rs_R009_ueqv_R009YNNNN_partial_30_0481,
  rs_R009_ueqv_R009YNNNN_partial_30_0482,
  rs_R009_ueqv_R009YNNNN_partial_30_0483,
  rs_R009_ueqv_R009YNNNN_partial_30_0484,
  rs_R009_ueqv_R009YNNNN_partial_30_0485,
  rs_R009_ueqv_R009YNNNN_partial_30_0486,
  rs_R009_ueqv_R009YNNNN_partial_30_0487
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_30_0400_0487 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((67338253723 : Rat) / 2248311492) [(0, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-1457547362843 : Rat) / 8993245968) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(0, 1), (9, 2), (10, 1), (14, 2)],
  term ((-997316410233 : Rat) / 4385595256) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((585770494211461 : Rat) / 1420932862944) [(0, 1), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (14, 1), (15, 2)],
  term ((-8129680847544803 : Rat) / 17406427571064) [(0, 1), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (14, 3)],
  term ((149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3935422477433 : Rat) / 9867589326) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term (5 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-16123807202598458 : Rat) / 6527410339149) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-36 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((55 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 21) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-245335365526 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-48 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1159206758430179 : Rat) / 799274735406) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3413 : Rat) / 63) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-209 : Rat) / 14) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((5 : Rat) / 6) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((-55 : Rat) / 7) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((86398977664621 : Rat) / 4351606892766) [(0, 1), (10, 1), (14, 1)],
  term ((-2773695251754577 : Rat) / 1864974382614) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((2726 : Rat) / 63) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((5960768472550369 : Rat) / 4973265020304) [(0, 1), (10, 1), (14, 2)],
  term ((-3366906314273 : Rat) / 14801383989) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((130 : Rat) / 7) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 36722421036) [(0, 1), (10, 1), (14, 3)],
  term ((-38020291217764 : Rat) / 133212455901) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((99676931740181359 : Rat) / 104438565426384) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((305 : Rat) / 14) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4675 : Rat) / 168) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3957929556424135 : Rat) / 3197098941624) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-4075 : Rat) / 252) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 3)],
  term ((451930019917219681 : Rat) / 104438565426384) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((925 : Rat) / 42) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(0, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((7112954056841105 : Rat) / 1243316255076) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((841 : Rat) / 63) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((9049653117374563 : Rat) / 8703213785532) [(0, 1), (11, 2), (14, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((-23369978600860751 : Rat) / 13054820678298) [(0, 1), (11, 2), (14, 2)],
  term ((-389178307824539 : Rat) / 2131399294416) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((45 : Rat) / 56) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((345 : Rat) / 28) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2444668745291 : Rat) / 133212455901) [(0, 1), (12, 1), (14, 1)],
  term ((2001591001496153 : Rat) / 4351606892766) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-155 : Rat) / 42) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(0, 1), (12, 1), (14, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-73 : Rat) / 7) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((786876374527566137 : Rat) / 313315696279152) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-48541 : Rat) / 504) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5501067393108209 : Rat) / 5594923147842) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((1325 : Rat) / 126) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((73 : Rat) / 7) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-287826798794417 : Rat) / 399637367703) [(0, 1), (13, 2), (14, 1)],
  term ((1465 : Rat) / 63) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(0, 1), (13, 2), (14, 2)],
  term ((-45 : Rat) / 56) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(0, 1), (13, 2), (14, 3)],
  term ((-345 : Rat) / 28) [(0, 1), (13, 2), (14, 3), (16, 1)],
  term ((-20038214580346519 : Rat) / 3315510013536) [(0, 1), (14, 1), (15, 2)],
  term ((1223 : Rat) / 18) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((840222238178158 : Rat) / 2175803446383) [(0, 1), (14, 2)],
  term ((-11899100091633005 : Rat) / 3868095015792) [(0, 1), (14, 2), (15, 2)],
  term ((-520 : Rat) / 63) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(0, 1), (14, 2), (16, 1)],
  term ((-10741252418198635 : Rat) / 69625710284256) [(0, 1), (14, 3)],
  term ((32 : Rat) / 21) [(0, 1), (14, 3), (16, 1)],
  term ((8979241671985367 : Rat) / 14919795060912) [(0, 1), (14, 4)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-585770494211461 : Rat) / 2841865725888) [(0, 2), (9, 2)],
  term ((1457547362843 : Rat) / 17986491936) [(0, 2), (9, 2), (10, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(0, 2), (9, 2), (10, 1), (12, 1)],
  term ((2172201733 : Rat) / 333083184) [(0, 2), (9, 2), (10, 1), (14, 1)],
  term ((997316410233 : Rat) / 8771190512) [(0, 2), (9, 2), (12, 1)],
  term ((8129680847544803 : Rat) / 34812855142128) [(0, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (15, 2)],
  term ((-86398977664621 : Rat) / 8703213785532) [(0, 2), (10, 1)],
  term ((-74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3935422477433 : Rat) / 19735178652) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((8061903601299229 : Rat) / 6527410339149) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((18 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((-40 : Rat) / 21) [(0, 2), (10, 1), (12, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((122667682763 : Rat) / 44404151967) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((24 : Rat) / 7) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((209 : Rat) / 28) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1159206758430179 : Rat) / 1598549470812) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((3413 : Rat) / 126) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 1065699647208) [(0, 2), (10, 1), (13, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((55 : Rat) / 14) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 12) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5960768472550369 : Rat) / 9946530040608) [(0, 2), (10, 1), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(0, 2), (10, 1), (14, 2)],
  term ((2773695251754577 : Rat) / 3729948765228) [(0, 2), (10, 1), (15, 2)],
  term ((-1363 : Rat) / 63) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-99676931740181359 : Rat) / 208877130852768) [(0, 2), (11, 1), (13, 1)],
  term ((-3957929556424135 : Rat) / 6394197883248) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((4075 : Rat) / 504) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4675 : Rat) / 336) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7112954056841105 : Rat) / 2486632510152) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-841 : Rat) / 126) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((-451930019917219681 : Rat) / 208877130852768) [(0, 2), (11, 1), (15, 1)],
  term ((-925 : Rat) / 84) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (11, 1), (15, 3)],
  term ((65 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-9049653117374563 : Rat) / 17406427571064) [(0, 2), (11, 2)],
  term ((23369978600860751 : Rat) / 26109641356596) [(0, 2), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (11, 2), (15, 2)],
  term ((-2444668745291 : Rat) / 266424911802) [(0, 2), (12, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-345 : Rat) / 56) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-45 : Rat) / 112) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(0, 2), (12, 1), (14, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((73 : Rat) / 14) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)],
  term ((155 : Rat) / 84) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5501067393108209 : Rat) / 11189846295684) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1325 : Rat) / 252) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-73 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-786876374527566137 : Rat) / 626631392558304) [(0, 2), (13, 1), (15, 1)],
  term ((48541 : Rat) / 1008) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((287826798794417 : Rat) / 799274735406) [(0, 2), (13, 2)],
  term ((-389178307824539 : Rat) / 4262798588832) [(0, 2), (13, 2), (14, 1)],
  term ((45 : Rat) / 112) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(0, 2), (13, 2), (14, 2)],
  term ((345 : Rat) / 56) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((-1465 : Rat) / 126) [(0, 2), (13, 2), (16, 1)],
  term ((-420111119089079 : Rat) / 2175803446383) [(0, 2), (14, 1)],
  term ((11899100091633005 : Rat) / 7736190031584) [(0, 2), (14, 1), (15, 2)],
  term ((260 : Rat) / 63) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((10741252418198635 : Rat) / 139251420568512) [(0, 2), (14, 2)],
  term ((-16 : Rat) / 21) [(0, 2), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(0, 2), (14, 3)],
  term ((20038214580346519 : Rat) / 6631020027072) [(0, 2), (15, 2)],
  term ((-1223 : Rat) / 36) [(0, 2), (15, 2), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (15, 4)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (15, 4), (16, 1)],
  term ((67338253723 : Rat) / 2248311492) [(1, 1), (9, 2), (10, 1), (12, 1), (15, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((-1457547362843 : Rat) / 8993245968) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-997316410233 : Rat) / 4385595256) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-8129680847544803 : Rat) / 17406427571064) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((585770494211461 : Rat) / 1420932862944) [(1, 1), (9, 2), (15, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (15, 3)],
  term ((149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((3935422477433 : Rat) / 9867589326) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (5 : Rat) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-16123807202598458 : Rat) / 6527410339149) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-36 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((55 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 21) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-245335365526 : Rat) / 44404151967) [(1, 1), (10, 1), (12, 1), (15, 3)],
  term ((-48 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-209 : Rat) / 14) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1159206758430179 : Rat) / 799274735406) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3413 : Rat) / 63) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-55 : Rat) / 7) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((5 : Rat) / 6) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((5960768472550369 : Rat) / 4973265020304) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((130 : Rat) / 7) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7183625070497 : Rat) / 36722421036) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((86398977664621 : Rat) / 4351606892766) [(1, 1), (10, 1), (15, 1)],
  term ((-2773695251754577 : Rat) / 1864974382614) [(1, 1), (10, 1), (15, 3)],
  term ((2726 : Rat) / 63) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-38020291217764 : Rat) / 133212455901) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((3957929556424135 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4075 : Rat) / 252) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((99676931740181359 : Rat) / 104438565426384) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4675 : Rat) / 168) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((305 : Rat) / 14) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((7112954056841105 : Rat) / 1243316255076) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((841 : Rat) / 63) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((451930019917219681 : Rat) / 104438565426384) [(1, 1), (11, 1), (15, 2)],
  term ((925 : Rat) / 42) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 1), (11, 1), (15, 4)],
  term ((-130 : Rat) / 7) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((-23369978600860751 : Rat) / 13054820678298) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((9049653117374563 : Rat) / 8703213785532) [(1, 1), (11, 2), (15, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (11, 2), (15, 3)],
  term ((2629582380889 : Rat) / 118411071912) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((345 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((45 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((-73 : Rat) / 7) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((2444668745291 : Rat) / 133212455901) [(1, 1), (12, 1), (15, 1)],
  term ((2001591001496153 : Rat) / 4351606892766) [(1, 1), (12, 1), (15, 3)],
  term ((-155 : Rat) / 42) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((5501067393108209 : Rat) / 5594923147842) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((1325 : Rat) / 126) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((73 : Rat) / 7) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((786876374527566137 : Rat) / 313315696279152) [(1, 1), (13, 1), (15, 2)],
  term ((-48541 : Rat) / 504) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-45 : Rat) / 56) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-345 : Rat) / 28) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-287826798794417 : Rat) / 399637367703) [(1, 1), (13, 2), (15, 1)],
  term ((1465 : Rat) / 63) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((840222238178158 : Rat) / 2175803446383) [(1, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 21) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11899100091633005 : Rat) / 3868095015792) [(1, 1), (14, 1), (15, 3)],
  term ((-520 : Rat) / 63) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10741252418198635 : Rat) / 69625710284256) [(1, 1), (14, 2), (15, 1)],
  term ((32 : Rat) / 21) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((8979241671985367 : Rat) / 14919795060912) [(1, 1), (14, 3), (15, 1)],
  term ((-20038214580346519 : Rat) / 3315510013536) [(1, 1), (15, 3)],
  term ((1223 : Rat) / 18) [(1, 1), (15, 3), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-585770494211461 : Rat) / 2841865725888) [(1, 2), (9, 2)],
  term ((1457547362843 : Rat) / 17986491936) [(1, 2), (9, 2), (10, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(1, 2), (9, 2), (10, 1), (12, 1)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (9, 2), (10, 1), (14, 1)],
  term ((997316410233 : Rat) / 8771190512) [(1, 2), (9, 2), (12, 1)],
  term ((8129680847544803 : Rat) / 34812855142128) [(1, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (15, 2)],
  term ((-86398977664621 : Rat) / 8703213785532) [(1, 2), (10, 1)],
  term ((-74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3935422477433 : Rat) / 19735178652) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((8061903601299229 : Rat) / 6527410339149) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((18 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((-40 : Rat) / 21) [(1, 2), (10, 1), (12, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((122667682763 : Rat) / 44404151967) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((24 : Rat) / 7) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((209 : Rat) / 28) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1159206758430179 : Rat) / 1598549470812) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((3413 : Rat) / 126) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 1065699647208) [(1, 2), (10, 1), (13, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((55 : Rat) / 14) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 12) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5960768472550369 : Rat) / 9946530040608) [(1, 2), (10, 1), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(1, 2), (10, 1), (14, 2)],
  term ((2773695251754577 : Rat) / 3729948765228) [(1, 2), (10, 1), (15, 2)],
  term ((-1363 : Rat) / 63) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-99676931740181359 : Rat) / 208877130852768) [(1, 2), (11, 1), (13, 1)],
  term ((-3957929556424135 : Rat) / 6394197883248) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((4075 : Rat) / 504) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4675 : Rat) / 336) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7112954056841105 : Rat) / 2486632510152) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-841 : Rat) / 126) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((-451930019917219681 : Rat) / 208877130852768) [(1, 2), (11, 1), (15, 1)],
  term ((-925 : Rat) / 84) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (11, 1), (15, 3)],
  term ((65 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-9049653117374563 : Rat) / 17406427571064) [(1, 2), (11, 2)],
  term ((23369978600860751 : Rat) / 26109641356596) [(1, 2), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (11, 2), (15, 2)],
  term ((-2444668745291 : Rat) / 266424911802) [(1, 2), (12, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-345 : Rat) / 56) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-45 : Rat) / 112) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(1, 2), (12, 1), (14, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((73 : Rat) / 14) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(1, 2), (12, 1), (15, 2)],
  term ((155 : Rat) / 84) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5501067393108209 : Rat) / 11189846295684) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1325 : Rat) / 252) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-73 : Rat) / 14) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-786876374527566137 : Rat) / 626631392558304) [(1, 2), (13, 1), (15, 1)],
  term ((48541 : Rat) / 1008) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((287826798794417 : Rat) / 799274735406) [(1, 2), (13, 2)],
  term ((-389178307824539 : Rat) / 4262798588832) [(1, 2), (13, 2), (14, 1)],
  term ((45 : Rat) / 112) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(1, 2), (13, 2), (14, 2)],
  term ((345 : Rat) / 56) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((-1465 : Rat) / 126) [(1, 2), (13, 2), (16, 1)],
  term ((-420111119089079 : Rat) / 2175803446383) [(1, 2), (14, 1)],
  term ((11899100091633005 : Rat) / 7736190031584) [(1, 2), (14, 1), (15, 2)],
  term ((260 : Rat) / 63) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((10741252418198635 : Rat) / 139251420568512) [(1, 2), (14, 2)],
  term ((-16 : Rat) / 21) [(1, 2), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(1, 2), (14, 3)],
  term ((20038214580346519 : Rat) / 6631020027072) [(1, 2), (15, 2)],
  term ((-1223 : Rat) / 36) [(1, 2), (15, 2), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (12, 2), (15, 3)],
  term ((65 : Rat) / 14) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (13, 1), (15, 4)],
  term ((-65 : Rat) / 7) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (13, 2), (15, 3)],
  term ((65 : Rat) / 14) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (13, 2)],
  term ((1457547362843 : Rat) / 8993245968) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (12, 1), (14, 2)],
  term ((-1457547362843 : Rat) / 17986491936) [(9, 2), (10, 1), (12, 2)],
  term ((-328002461683 : Rat) / 8993245968) [(9, 2), (10, 1), (12, 2), (14, 1)],
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 3)],
  term ((2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1457547362843 : Rat) / 8993245968) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1457547362843 : Rat) / 17986491936) [(9, 2), (10, 1), (13, 2)],
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (13, 2), (14, 1)],
  term ((997316410233 : Rat) / 4385595256) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (13, 2)],
  term ((-585770494211461 : Rat) / 1420932862944) [(9, 2), (12, 1), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((8129680847544803 : Rat) / 17406427571064) [(9, 2), (12, 1), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 3)],
  term ((585770494211461 : Rat) / 2841865725888) [(9, 2), (12, 2)],
  term ((-212983183115249 : Rat) / 34812855142128) [(9, 2), (12, 2), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (12, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (12, 2), (15, 2)],
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 3)],
  term ((8129680847544803 : Rat) / 17406427571064) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((-585770494211461 : Rat) / 1420932862944) [(9, 2), (13, 1), (15, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (13, 1), (15, 3)],
  term ((585770494211461 : Rat) / 2841865725888) [(9, 2), (13, 2)],
  term ((-8129680847544803 : Rat) / 34812855142128) [(9, 2), (13, 2), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (13, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (13, 2), (15, 2)],
  term ((-3935422477433 : Rat) / 9867589326) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (-5 : Rat) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((16123807202598458 : Rat) / 6527410339149) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((36 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((3935422477433 : Rat) / 19735178652) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((5 : Rat) / 2) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-269568 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-8061903601299229 : Rat) / 6527410339149) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-18 : Rat) / 7) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 3), (15, 1)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((16123807202598458 : Rat) / 6527410339149) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((36 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((29952 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-21330371140242317 : Rat) / 13054820678298) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-53 : Rat) / 7) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3935422477433 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 3)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (13, 3), (14, 1)],
  term ((5 : Rat) / 2) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (12, 2)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (13, 2)],
  term ((-1159206758430179 : Rat) / 799274735406) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3413 : Rat) / 63) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((209 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-80 : Rat) / 21) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((245335365526 : Rat) / 44404151967) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((48 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((40 : Rat) / 21) [(10, 1), (12, 1), (13, 2)],
  term ((6090608323475 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (14, 2)],
  term ((55 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-3663001632701 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-79 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 3), (15, 1)],
  term ((55 : Rat) / 14) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-86398977664621 : Rat) / 4351606892766) [(10, 1), (12, 1), (14, 1)],
  term ((2773695251754577 : Rat) / 1864974382614) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2726 : Rat) / 63) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5960768472550369 : Rat) / 4973265020304) [(10, 1), (12, 1), (14, 2)],
  term ((3366906314273 : Rat) / 14801383989) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-130 : Rat) / 7) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 36722421036) [(10, 1), (12, 1), (14, 3)],
  term ((86398977664621 : Rat) / 8703213785532) [(10, 1), (12, 2)],
  term ((10142193023173 : Rat) / 152242806744) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-429 : Rat) / 28) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1159206758430179 : Rat) / 1598549470812) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-3413 : Rat) / 126) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(10, 1), (12, 2), (13, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 2), (13, 2), (14, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((5922876929538529 : Rat) / 9946530040608) [(10, 1), (12, 2), (14, 1)],
  term ((-9610048211767 : Rat) / 88808303934) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((113 : Rat) / 7) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (12, 2), (14, 2)],
  term ((-2773695251754577 : Rat) / 3729948765228) [(10, 1), (12, 2), (15, 2)],
  term ((1363 : Rat) / 63) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((40 : Rat) / 21) [(10, 1), (12, 3)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 3), (13, 1), (15, 1)],
  term ((55 : Rat) / 14) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 3), (15, 2)],
  term ((-24 : Rat) / 7) [(10, 1), (12, 3), (15, 2), (16, 1)],
  term ((-5960768472550369 : Rat) / 4973265020304) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((7183625070497 : Rat) / 36722421036) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-86398977664621 : Rat) / 4351606892766) [(10, 1), (13, 1), (15, 1)],
  term ((2773695251754577 : Rat) / 1864974382614) [(10, 1), (13, 1), (15, 3)],
  term ((-2726 : Rat) / 63) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((86398977664621 : Rat) / 8703213785532) [(10, 1), (13, 2)],
  term ((5960768472550369 : Rat) / 9946530040608) [(10, 1), (13, 2), (14, 1)],
  term ((-47769215654539 : Rat) / 177616607868) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((339 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (13, 2), (14, 2)],
  term ((-24549980373286237 : Rat) / 11189846295684) [(10, 1), (13, 2), (15, 2)],
  term ((1592 : Rat) / 21) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((94411315451195 : Rat) / 1065699647208) [(10, 1), (13, 3), (14, 1), (15, 1)],
  term ((11 : Rat) / 28) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((294369645850151 : Rat) / 399637367703) [(10, 1), (13, 3), (15, 1)],
  term ((-1759 : Rat) / 63) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(10, 1), (13, 4)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (13, 4), (14, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (13, 4), (14, 1), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (13, 4), (16, 1)],
  term ((-99676931740181359 : Rat) / 104438565426384) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1321597604539 : Rat) / 19735178652) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-305 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4675 : Rat) / 168) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3957929556424135 : Rat) / 3197098941624) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((4075 : Rat) / 252) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((119808 : Rat) / 553) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((38020291217764 : Rat) / 133212455901) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-451930019917219681 : Rat) / 104438565426384) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-925 : Rat) / 42) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((130 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7112954056841105 : Rat) / 1243316255076) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-841 : Rat) / 63) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((99676931740181359 : Rat) / 208877130852768) [(11, 1), (12, 2), (13, 1)],
  term ((3957929556424135 : Rat) / 6394197883248) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-4075 : Rat) / 504) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4675 : Rat) / 336) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((23467998478718099 : Rat) / 7459897530456) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((841 : Rat) / 126) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1223030042421 : Rat) / 26861770943) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((451930019917219681 : Rat) / 208877130852768) [(11, 1), (12, 2), (15, 1)],
  term ((925 : Rat) / 84) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (12, 2), (15, 3)],
  term ((-65 : Rat) / 7) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 3), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 3), (15, 1)],
  term ((-7112954056841105 : Rat) / 1243316255076) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-841 : Rat) / 63) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-451930019917219681 : Rat) / 104438565426384) [(11, 1), (13, 1), (15, 2)],
  term ((-925 : Rat) / 42) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (13, 1), (15, 4)],
  term ((130 : Rat) / 7) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((4538884952075125 : Rat) / 2797461573921) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((1919 : Rat) / 84) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((10416228739275 : Rat) / 26861770943) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((252576156436856963 : Rat) / 208877130852768) [(11, 1), (13, 2), (15, 1)],
  term ((2175 : Rat) / 56) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((15595958064145 : Rat) / 59205535956) [(11, 1), (13, 2), (15, 3)],
  term ((-435 : Rat) / 14) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((99676931740181359 : Rat) / 208877130852768) [(11, 1), (13, 3)],
  term ((3957929556424135 : Rat) / 6394197883248) [(11, 1), (13, 3), (14, 1)],
  term ((-4075 : Rat) / 504) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(11, 1), (13, 3), (14, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (13, 3), (15, 2)],
  term ((305 : Rat) / 28) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4675 : Rat) / 336) [(11, 1), (13, 3), (16, 1)],
  term ((-9049653117374563 : Rat) / 8703213785532) [(11, 2), (12, 1), (14, 1)],
  term ((-239616 : Rat) / 553) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((23369978600860751 : Rat) / 13054820678298) [(11, 2), (12, 1), (14, 2)],
  term ((9049653117374563 : Rat) / 17406427571064) [(11, 2), (12, 2)],
  term ((-23369978600860751 : Rat) / 26109641356596) [(11, 2), (12, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(11, 2), (12, 2), (15, 2)],
  term ((23369978600860751 : Rat) / 13054820678298) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-9049653117374563 : Rat) / 8703213785532) [(11, 2), (13, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(11, 2), (13, 1), (15, 3)],
  term ((9049653117374563 : Rat) / 17406427571064) [(11, 2), (13, 2)],
  term ((-23369978600860751 : Rat) / 26109641356596) [(11, 2), (13, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(11, 2), (13, 2), (15, 2)],
  term ((-772804201149638969 : Rat) / 313315696279152) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((48541 : Rat) / 504) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((73 : Rat) / 7) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5501067393108209 : Rat) / 5594923147842) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1325 : Rat) / 126) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-73 : Rat) / 7) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2444668745291 : Rat) / 133212455901) [(12, 1), (13, 1), (15, 1)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(12, 1), (13, 1), (15, 3)],
  term ((155 : Rat) / 42) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(12, 1), (13, 2)],
  term ((278852198425841 : Rat) / 399637367703) [(12, 1), (13, 2), (14, 1)],
  term ((-15753114606811 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-491 : Rat) / 28) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1465 : Rat) / 63) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(12, 1), (13, 2), (14, 2)],
  term ((45 : Rat) / 56) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 3)],
  term ((345 : Rat) / 28) [(12, 1), (13, 2), (14, 3), (16, 1)],
  term ((43088829101356247 : Rat) / 104438565426384) [(12, 1), (13, 2), (15, 2)],
  term ((-445 : Rat) / 168) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 1), (13, 3), (14, 1), (15, 1)],
  term ((345 : Rat) / 56) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 3), (15, 1)],
  term ((45 : Rat) / 112) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((20038214580346519 : Rat) / 3315510013536) [(12, 1), (14, 1), (15, 2)],
  term ((-1223 : Rat) / 18) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-840222238178158 : Rat) / 2175803446383) [(12, 1), (14, 2)],
  term ((11899100091633005 : Rat) / 3868095015792) [(12, 1), (14, 2), (15, 2)],
  term ((520 : Rat) / 63) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(12, 1), (14, 2), (16, 1)],
  term ((10741252418198635 : Rat) / 69625710284256) [(12, 1), (14, 3)],
  term ((-32 : Rat) / 21) [(12, 1), (14, 3), (16, 1)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(12, 1), (14, 4)],
  term ((30177014036748155 : Rat) / 44759385182736) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((2245 : Rat) / 504) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10493949845033 : Rat) / 118411071912) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((-199 : Rat) / 28) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((786876374527566137 : Rat) / 626631392558304) [(12, 2), (13, 1), (15, 1)],
  term ((-48541 : Rat) / 1008) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-287826798794417 : Rat) / 799274735406) [(12, 2), (13, 2)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 2), (13, 2), (14, 1)],
  term ((-45 : Rat) / 112) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(12, 2), (13, 2), (14, 2)],
  term ((-345 : Rat) / 56) [(12, 2), (13, 2), (14, 2), (16, 1)],
  term ((1465 : Rat) / 126) [(12, 2), (13, 2), (16, 1)],
  term ((1140544588747978 : Rat) / 6527410339149) [(12, 2), (14, 1)],
  term ((-139117356848635493 : Rat) / 69625710284256) [(12, 2), (14, 1), (15, 2)],
  term ((-55 : Rat) / 126) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(12, 2), (14, 1), (16, 1)],
  term ((-13460859417359681 : Rat) / 417754261705536) [(12, 2), (14, 2)],
  term ((2187255370987 : Rat) / 9867589326) [(12, 2), (14, 2), (15, 2)],
  term ((73 : Rat) / 7) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(12, 2), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(12, 2), (14, 3)],
  term ((-20038214580346519 : Rat) / 6631020027072) [(12, 2), (15, 2)],
  term ((1223 : Rat) / 36) [(12, 2), (15, 2), (16, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(12, 3)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 3), (13, 1), (14, 1), (15, 1)],
  term ((345 : Rat) / 56) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 3), (13, 1), (15, 1)],
  term ((45 : Rat) / 112) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(12, 3), (14, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(12, 3), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(12, 3), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 8703213785532) [(12, 3), (15, 2)],
  term ((-155 : Rat) / 84) [(12, 3), (15, 2), (16, 1)],
  term ((-840222238178158 : Rat) / 2175803446383) [(13, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 21) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11899100091633005 : Rat) / 3868095015792) [(13, 1), (14, 1), (15, 3)],
  term ((520 : Rat) / 63) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((10741252418198635 : Rat) / 69625710284256) [(13, 1), (14, 2), (15, 1)],
  term ((-32 : Rat) / 21) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(13, 1), (14, 3), (15, 1)],
  term ((20038214580346519 : Rat) / 3315510013536) [(13, 1), (15, 3)],
  term ((-1223 : Rat) / 18) [(13, 1), (15, 3), (16, 1)],
  term ((420111119089079 : Rat) / 2175803446383) [(13, 2), (14, 1)],
  term ((-1579946655450392813 : Rat) / 626631392558304) [(13, 2), (14, 1), (15, 2)],
  term ((-205 : Rat) / 14) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(13, 2), (14, 1), (16, 1)],
  term ((-10741252418198635 : Rat) / 139251420568512) [(13, 2), (14, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(13, 2), (14, 2), (15, 2)],
  term ((-73 : Rat) / 7) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(13, 2), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(13, 2), (14, 3)],
  term ((-6934728053795756639 : Rat) / 1253262785116608) [(13, 2), (15, 2)],
  term ((65663 : Rat) / 504) [(13, 2), (15, 2), (16, 1)],
  term ((13831525108117517 : Rat) / 44759385182736) [(13, 3), (14, 1), (15, 1)],
  term ((3055 : Rat) / 504) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((15753114606811 : Rat) / 118411071912) [(13, 3), (14, 2), (15, 1)],
  term ((491 : Rat) / 28) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((412729598345737331 : Rat) / 208877130852768) [(13, 3), (15, 1)],
  term ((-10283 : Rat) / 144) [(13, 3), (15, 1), (16, 1)],
  term ((-287826798794417 : Rat) / 799274735406) [(13, 4)],
  term ((389178307824539 : Rat) / 4262798588832) [(13, 4), (14, 1)],
  term ((-45 : Rat) / 112) [(13, 4), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(13, 4), (14, 2)],
  term ((-345 : Rat) / 56) [(13, 4), (14, 2), (16, 1)],
  term ((1465 : Rat) / 126) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 400 through 487. -/
theorem rs_R009_ueqv_R009YNNNN_block_30_0400_0487_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_30_0400_0487
      rs_R009_ueqv_R009YNNNN_block_30_0400_0487 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
