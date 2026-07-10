/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 30:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_30_0500_0599 : Poly :=
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

/-- Coefficient term 500 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0500 : Poly :=
[
  term ((-4330502536633674176 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 500 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0500 : Poly :=
[
  term ((8661005073267348352 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-4330502536633674176 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((8661005073267348352 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4330502536633674176 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-8661005073267348352 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4330502536633674176 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-8661005073267348352 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4330502536633674176 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0500_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0500
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0501 : Poly :=
[
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 501 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0501 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0501_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0501
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0502 : Poly :=
[
  term ((-118930458309376000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0502 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0502_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0502
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0503 : Poly :=
[
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0503 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0503_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0503
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0504 : Poly :=
[
  term ((41971909016680839424 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 504 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0504 : Poly :=
[
  term ((-83943818033361678848 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 2), (14, 2), (16, 1)],
  term ((41971909016680839424 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-83943818033361678848 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((41971909016680839424 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((83943818033361678848 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-41971909016680839424 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (12, 2), (14, 1), (16, 1)],
  term ((83943818033361678848 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41971909016680839424 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0504_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0504
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0505 : Poly :=
[
  term ((15072845639890259584 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 505 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0505 : Poly :=
[
  term ((-30145691279780519168 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((15072845639890259584 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-30145691279780519168 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((15072845639890259584 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((30145691279780519168 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-15072845639890259584 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (12, 2), (16, 1)],
  term ((30145691279780519168 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15072845639890259584 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0505_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0505
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0506 : Poly :=
[
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 506 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0506 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0506_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0506
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0507 : Poly :=
[
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0507 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0507_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0507
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0508 : Poly :=
[
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (16, 1)]
]

/-- Partial product 508 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0508 : Poly :=
[
  term ((14764711569654377772 : Rat) / 149717402626960975) [(0, 1), (4, 1), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(0, 2), (4, 1), (5, 2), (10, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(1, 1), (4, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(1, 2), (4, 1), (5, 2), (10, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (12, 2), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0508_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0508
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0509 : Poly :=
[
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 509 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0509 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0509_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0509
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0510 : Poly :=
[
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (14, 1), (16, 1)]
]

/-- Partial product 510 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0510 : Poly :=
[
  term ((298914842785620476444 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 2), (14, 2), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 2), (14, 1), (16, 1)],
  term ((298914842785620476444 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 2), (14, 1), (16, 1)],
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (12, 1), (14, 2), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (12, 2), (14, 1), (16, 1)],
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0510_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0510
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0511 : Poly :=
[
  term ((-948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (16, 1)]
]

/-- Partial product 511 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0511 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 2), (14, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(4, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (12, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0511_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0511
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0512 : Poly :=
[
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 512 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0512 : Poly :=
[
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 3), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0512_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0512
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0513 : Poly :=
[
  term ((798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 513 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0513 : Poly :=
[
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 3), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0513_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0513
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0514 : Poly :=
[
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 514 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0514 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0514_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0514
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0515 : Poly :=
[
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 515 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0515 : Poly :=
[
  term ((20993966955713679488 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 3), (9, 1), (14, 2), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((20993966955713679488 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0515_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0515
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0516 : Poly :=
[
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 516 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0516 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0516_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0516
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0517 : Poly :=
[
  term ((2353134503918316800 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 517 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0517 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0517_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0517
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0518 : Poly :=
[
  term (-3 : Rat) [(4, 1), (16, 1)]
]

/-- Partial product 518 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0518 : Poly :=
[
  term (6 : Rat) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (4, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (4, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (12, 2), (16, 1)],
  term (-6 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0518_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0518
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0519 : Poly :=
[
  term ((-36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 519 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0519 : Poly :=
[
  term ((73796461068108800 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(0, 2), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((73796461068108800 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(1, 2), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-73796461068108800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-73796461068108800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0519_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0519
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0520 : Poly :=
[
  term ((551352559728752936 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 520 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0520 : Poly :=
[
  term ((-1102705119457505872 : Rat) / 149717402626960975) [(0, 1), (4, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((551352559728752936 : Rat) / 149717402626960975) [(0, 2), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-1102705119457505872 : Rat) / 149717402626960975) [(1, 1), (4, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((551352559728752936 : Rat) / 149717402626960975) [(1, 2), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((1102705119457505872 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((1102705119457505872 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0520_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0520
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0521 : Poly :=
[
  term ((82939417100700160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 521 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0521 : Poly :=
[
  term ((-165878834201400320 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((82939417100700160 : Rat) / 53898264945705951) [(0, 2), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-165878834201400320 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((82939417100700160 : Rat) / 53898264945705951) [(1, 2), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((165878834201400320 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((165878834201400320 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0521_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0521
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0522 : Poly :=
[
  term ((1793305900789760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 522 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0522 : Poly :=
[
  term ((-3586611801579520 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(0, 2), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-3586611801579520 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(1, 2), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (12, 2), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0522_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0522
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0523 : Poly :=
[
  term ((-34180369953344089954 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 523 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0523 : Poly :=
[
  term ((68360739906688179908 : Rat) / 1347456623642648775) [(0, 1), (4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-34180369953344089954 : Rat) / 1347456623642648775) [(0, 2), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((68360739906688179908 : Rat) / 1347456623642648775) [(1, 1), (4, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34180369953344089954 : Rat) / 1347456623642648775) [(1, 2), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-68360739906688179908 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((34180369953344089954 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-68360739906688179908 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34180369953344089954 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0523_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0523
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0524 : Poly :=
[
  term ((6076664113681020992 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 524 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0524 : Poly :=
[
  term ((-12153328227362041984 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((6076664113681020992 : Rat) / 269491324728529755) [(0, 2), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-12153328227362041984 : Rat) / 269491324728529755) [(1, 1), (4, 2), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6076664113681020992 : Rat) / 269491324728529755) [(1, 2), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((12153328227362041984 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((12153328227362041984 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0524_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0524
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0525 : Poly :=
[
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 525 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0525 : Poly :=
[
  term ((15316312228629615104 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(0, 2), (4, 2), (5, 2), (9, 2), (16, 1)],
  term ((15316312228629615104 : Rat) / 269491324728529755) [(1, 1), (4, 2), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(1, 2), (4, 2), (5, 2), (9, 2), (16, 1)],
  term ((-15316312228629615104 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (12, 2), (16, 1)],
  term ((-15316312228629615104 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0525_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0525
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0526 : Poly :=
[
  term (1 : Rat) [(4, 2), (16, 1)]
]

/-- Partial product 526 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0526 : Poly :=
[
  term (-2 : Rat) [(0, 1), (4, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (4, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (4, 2), (16, 1)],
  term (2 : Rat) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (12, 2), (16, 1)],
  term (2 : Rat) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0526_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0526
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0527 : Poly :=
[
  term ((-314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 527 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0527 : Poly :=
[
  term ((629094584919568960 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((629094584919568960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0527_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0527
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0528 : Poly :=
[
  term ((314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 528 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0528 : Poly :=
[
  term ((-629094584919568960 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-629094584919568960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0528_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0528
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0529 : Poly :=
[
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 529 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0529 : Poly :=
[
  term ((-86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0529_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0529
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0530 : Poly :=
[
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 530 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0530 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0530_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0530
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0531 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 531 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0531 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0531_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0531
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0532 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 532 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0532 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0532_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0532
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0533 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 533 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0533 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0533_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0533
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0534 : Poly :=
[
  term ((4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 534 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0534 : Poly :=
[
  term ((-8703335477043200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0534_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0534
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0535 : Poly :=
[
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 535 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0535 : Poly :=
[
  term ((-107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0535_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0535
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0536 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 536 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0536 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0536_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0536
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0537 : Poly :=
[
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 537 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0537 : Poly :=
[
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0537_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0537
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0538 : Poly :=
[
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 538 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0538 : Poly :=
[
  term ((-76425576358642648 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0538_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0538
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0539 : Poly :=
[
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 539 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0539 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0539_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0539
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0540 : Poly :=
[
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 540 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0540 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0540_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0540
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0541 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 541 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0541 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0541_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0541
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0542 : Poly :=
[
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 542 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0542 : Poly :=
[
  term ((4351667738521600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0542_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0542
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0543 : Poly :=
[
  term ((29037070915865600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 543 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0543 : Poly :=
[
  term ((-58074141831731200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((29037070915865600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-58074141831731200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((29037070915865600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((58074141831731200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-29037070915865600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((58074141831731200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29037070915865600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0543_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0543
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0544 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 544 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0544 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0544_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0544
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0545 : Poly :=
[
  term ((-51784880348266240 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 545 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0545 : Poly :=
[
  term ((103569760696532480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-51784880348266240 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((103569760696532480 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51784880348266240 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-103569760696532480 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((51784880348266240 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-103569760696532480 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((51784880348266240 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0545_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0545
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0546 : Poly :=
[
  term ((51558772129518080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 546 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0546 : Poly :=
[
  term ((-103117544259036160 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((51558772129518080 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103117544259036160 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((51558772129518080 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((103117544259036160 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-51558772129518080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((103117544259036160 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51558772129518080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0546_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0546
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0547 : Poly :=
[
  term ((-88781068629451520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0547 : Poly :=
[
  term ((177562137258903040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88781068629451520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((177562137258903040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-88781068629451520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-177562137258903040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((88781068629451520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-177562137258903040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((88781068629451520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0547_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0547
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0548 : Poly :=
[
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 548 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0548 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0548_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0548
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0549 : Poly :=
[
  term ((-51676886420096000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 549 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0549 : Poly :=
[
  term ((103353772840192000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-51676886420096000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((103353772840192000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-51676886420096000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-103353772840192000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((51676886420096000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-103353772840192000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((51676886420096000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0549_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0549
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0550 : Poly :=
[
  term ((7675950819353600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 550 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0550 : Poly :=
[
  term ((-15351901638707200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((7675950819353600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-15351901638707200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((7675950819353600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((15351901638707200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-7675950819353600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((15351901638707200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7675950819353600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0550_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0550
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0551 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 551 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0551 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0551_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0551
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0552 : Poly :=
[
  term ((-114158565904080496 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 552 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0552 : Poly :=
[
  term ((228317131808160992 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114158565904080496 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((228317131808160992 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-114158565904080496 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228317131808160992 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((114158565904080496 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-228317131808160992 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((114158565904080496 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0552_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0552
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0553 : Poly :=
[
  term ((-800502817684231046192 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 553 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0553 : Poly :=
[
  term ((1601005635368462092384 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-800502817684231046192 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((1601005635368462092384 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-800502817684231046192 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1601005635368462092384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((800502817684231046192 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1601005635368462092384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((800502817684231046192 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0553_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0553
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0554 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 554 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0554 : Poly :=
[
  term ((78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0554_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0554
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0555 : Poly :=
[
  term ((809797433064859191692 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 555 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0555 : Poly :=
[
  term ((-1619594866129718383384 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((809797433064859191692 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1619594866129718383384 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((809797433064859191692 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((1619594866129718383384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-809797433064859191692 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((1619594866129718383384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-809797433064859191692 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0555_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0555
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0556 : Poly :=
[
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 556 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0556 : Poly :=
[
  term ((252396728834252800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0556_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0556
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0557 : Poly :=
[
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0557 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0557_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0557
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0558 : Poly :=
[
  term ((382793535237908480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 558 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0558 : Poly :=
[
  term ((-765587070475816960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((382793535237908480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-765587070475816960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((382793535237908480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((765587070475816960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-382793535237908480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((765587070475816960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-382793535237908480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0558_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0558
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0559 : Poly :=
[
  term ((-337101023983431680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 559 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0559 : Poly :=
[
  term ((674202047966863360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-337101023983431680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((674202047966863360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-337101023983431680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-674202047966863360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((337101023983431680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-674202047966863360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((337101023983431680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0559_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0559
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0560 : Poly :=
[
  term ((7458547541401600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 560 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0560 : Poly :=
[
  term ((-14917095082803200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((7458547541401600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-14917095082803200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7458547541401600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((14917095082803200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7458547541401600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((14917095082803200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7458547541401600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0560_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0560
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0561 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 561 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0561 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0561_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0561
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0562 : Poly :=
[
  term ((-61263848270213120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 562 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0562 : Poly :=
[
  term ((122527696540426240 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-61263848270213120 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((122527696540426240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-61263848270213120 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-122527696540426240 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((61263848270213120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-122527696540426240 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((61263848270213120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0562_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0562
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0563 : Poly :=
[
  term ((-179275741023249920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0563 : Poly :=
[
  term ((358551482046499840 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-179275741023249920 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((358551482046499840 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-179275741023249920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-358551482046499840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((179275741023249920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-358551482046499840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((179275741023249920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0563_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0563
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0564 : Poly :=
[
  term ((428561265481538560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 564 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0564 : Poly :=
[
  term ((-857122530963077120 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((428561265481538560 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-857122530963077120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((428561265481538560 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((857122530963077120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-428561265481538560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((857122530963077120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-428561265481538560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0564_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0564
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0565 : Poly :=
[
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 565 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0565 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0565_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0565
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0566 : Poly :=
[
  term ((-260070498768855040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 566 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0566 : Poly :=
[
  term ((520140997537710080 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 3), (14, 2), (16, 1)],
  term ((-260070498768855040 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((520140997537710080 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-260070498768855040 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-520140997537710080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (12, 1), (14, 2), (16, 1)],
  term ((260070498768855040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (12, 2), (14, 1), (16, 1)],
  term ((-520140997537710080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((260070498768855040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0566_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0566
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0567 : Poly :=
[
  term ((658364799627960320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 567 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0567 : Poly :=
[
  term ((-1316729599255920640 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((658364799627960320 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-1316729599255920640 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((658364799627960320 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((1316729599255920640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-658364799627960320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (16, 1)],
  term ((1316729599255920640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-658364799627960320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0567_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0567
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0568 : Poly :=
[
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 568 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0568 : Poly :=
[
  term ((52437743522044628 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0568_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0568
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0569 : Poly :=
[
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 569 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0569 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0569_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0569
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0570 : Poly :=
[
  term ((8525887481657437868 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 570 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0570 : Poly :=
[
  term ((-17051774963314875736 : Rat) / 89830441576176585) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((8525887481657437868 : Rat) / 89830441576176585) [(0, 2), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-17051774963314875736 : Rat) / 89830441576176585) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8525887481657437868 : Rat) / 89830441576176585) [(1, 2), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((17051774963314875736 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-8525887481657437868 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((17051774963314875736 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8525887481657437868 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0570_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0570
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0571 : Poly :=
[
  term ((-22514121623303666939 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 571 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0571 : Poly :=
[
  term ((45028243246607333878 : Rat) / 269491324728529755) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-22514121623303666939 : Rat) / 269491324728529755) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((45028243246607333878 : Rat) / 269491324728529755) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22514121623303666939 : Rat) / 269491324728529755) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-45028243246607333878 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((22514121623303666939 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-45028243246607333878 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((22514121623303666939 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0571_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0571
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0572 : Poly :=
[
  term ((-15648286430133347944 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 572 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0572 : Poly :=
[
  term ((31296572860266695888 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-15648286430133347944 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((31296572860266695888 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15648286430133347944 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-31296572860266695888 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((15648286430133347944 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-31296572860266695888 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((15648286430133347944 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0572_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0572
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0573 : Poly :=
[
  term ((-4178996887220660834 : Rat) / 89830441576176585) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 573 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0573 : Poly :=
[
  term ((8357993774441321668 : Rat) / 89830441576176585) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4178996887220660834 : Rat) / 89830441576176585) [(0, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((8357993774441321668 : Rat) / 89830441576176585) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4178996887220660834 : Rat) / 89830441576176585) [(1, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-8357993774441321668 : Rat) / 89830441576176585) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4178996887220660834 : Rat) / 89830441576176585) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-8357993774441321668 : Rat) / 89830441576176585) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((4178996887220660834 : Rat) / 89830441576176585) [(5, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0573_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0573
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0574 : Poly :=
[
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 574 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0574 : Poly :=
[
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0574_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0574
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0575 : Poly :=
[
  term ((3814244419392514774 : Rat) / 149717402626960975) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0575 : Poly :=
[
  term ((-7628488838785029548 : Rat) / 149717402626960975) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3814244419392514774 : Rat) / 149717402626960975) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-7628488838785029548 : Rat) / 149717402626960975) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((3814244419392514774 : Rat) / 149717402626960975) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((7628488838785029548 : Rat) / 149717402626960975) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3814244419392514774 : Rat) / 149717402626960975) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((7628488838785029548 : Rat) / 149717402626960975) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3814244419392514774 : Rat) / 149717402626960975) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0575_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0575
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0576 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0576 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0576_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0576
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0577 : Poly :=
[
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 577 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0577 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0577_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0577
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0578 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 578 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0578 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0578_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0578
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0579 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0579 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0579_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0579
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0580 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 580 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0580 : Poly :=
[
  term ((78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0580_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0580
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0581 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 581 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0581 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0581_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0581
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0582 : Poly :=
[
  term ((69626683816345600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 582 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0582 : Poly :=
[
  term ((-139253367632691200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0582_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0582
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0583 : Poly :=
[
  term ((-38212788179321324 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 583 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0583 : Poly :=
[
  term ((76425576358642648 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 2), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0583_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0583
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0584 : Poly :=
[
  term ((941117028683528978 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 584 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0584 : Poly :=
[
  term ((-1882234057367057956 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((941117028683528978 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-1882234057367057956 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((941117028683528978 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((1882234057367057956 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-941117028683528978 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((1882234057367057956 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941117028683528978 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0584_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0584
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0585 : Poly :=
[
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 585 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0585 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0585_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0585
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0586 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 586 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0586 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0586_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0586
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0587 : Poly :=
[
  term ((94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 587 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0587 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0587_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0587
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0588 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 588 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0588 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0588_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0588
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0589 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 589 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0589 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0589_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0589
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0590 : Poly :=
[
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 590 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0590 : Poly :=
[
  term ((-13555823625881600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0590_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0590
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0591 : Poly :=
[
  term ((4351667738521600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 591 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0591 : Poly :=
[
  term ((-8703335477043200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0591_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0591
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0592 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 592 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0592 : Poly :=
[
  term ((6448371121561600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0592_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0592
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0593 : Poly :=
[
  term ((15661885303443545618 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 593 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0593 : Poly :=
[
  term ((-31323770606887091236 : Rat) / 149717402626960975) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((15661885303443545618 : Rat) / 149717402626960975) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-31323770606887091236 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((15661885303443545618 : Rat) / 149717402626960975) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((31323770606887091236 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-15661885303443545618 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((31323770606887091236 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15661885303443545618 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0593_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0593
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0594 : Poly :=
[
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0594 : Poly :=
[
  term ((172980456656537600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0594_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0594
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0595 : Poly :=
[
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 595 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0595 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0595_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0595
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0596 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 596 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0596 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0596_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0596
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0597 : Poly :=
[
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 597 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0597 : Poly :=
[
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0597_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0597
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0598 : Poly :=
[
  term ((-92926161388738417708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0598 : Poly :=
[
  term ((185852322777476835416 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-92926161388738417708 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((185852322777476835416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-92926161388738417708 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185852322777476835416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((92926161388738417708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-185852322777476835416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((92926161388738417708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0598_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0598
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010YNN_coefficient_30_0599 : Poly :=
[
  term ((186345431717676527542 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 30. -/
def rs_R010_ueqv_R010YNN_partial_30_0599 : Poly :=
[
  term ((-372690863435353055084 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((186345431717676527542 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-372690863435353055084 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((186345431717676527542 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((372690863435353055084 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-186345431717676527542 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((372690863435353055084 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-186345431717676527542 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 30. -/
theorem rs_R010_ueqv_R010YNN_partial_30_0599_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_30_0599
        rs_R010_ueqv_R010YNN_generator_30_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_30_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_30_0500_0599 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_30_0500,
  rs_R010_ueqv_R010YNN_partial_30_0501,
  rs_R010_ueqv_R010YNN_partial_30_0502,
  rs_R010_ueqv_R010YNN_partial_30_0503,
  rs_R010_ueqv_R010YNN_partial_30_0504,
  rs_R010_ueqv_R010YNN_partial_30_0505,
  rs_R010_ueqv_R010YNN_partial_30_0506,
  rs_R010_ueqv_R010YNN_partial_30_0507,
  rs_R010_ueqv_R010YNN_partial_30_0508,
  rs_R010_ueqv_R010YNN_partial_30_0509,
  rs_R010_ueqv_R010YNN_partial_30_0510,
  rs_R010_ueqv_R010YNN_partial_30_0511,
  rs_R010_ueqv_R010YNN_partial_30_0512,
  rs_R010_ueqv_R010YNN_partial_30_0513,
  rs_R010_ueqv_R010YNN_partial_30_0514,
  rs_R010_ueqv_R010YNN_partial_30_0515,
  rs_R010_ueqv_R010YNN_partial_30_0516,
  rs_R010_ueqv_R010YNN_partial_30_0517,
  rs_R010_ueqv_R010YNN_partial_30_0518,
  rs_R010_ueqv_R010YNN_partial_30_0519,
  rs_R010_ueqv_R010YNN_partial_30_0520,
  rs_R010_ueqv_R010YNN_partial_30_0521,
  rs_R010_ueqv_R010YNN_partial_30_0522,
  rs_R010_ueqv_R010YNN_partial_30_0523,
  rs_R010_ueqv_R010YNN_partial_30_0524,
  rs_R010_ueqv_R010YNN_partial_30_0525,
  rs_R010_ueqv_R010YNN_partial_30_0526,
  rs_R010_ueqv_R010YNN_partial_30_0527,
  rs_R010_ueqv_R010YNN_partial_30_0528,
  rs_R010_ueqv_R010YNN_partial_30_0529,
  rs_R010_ueqv_R010YNN_partial_30_0530,
  rs_R010_ueqv_R010YNN_partial_30_0531,
  rs_R010_ueqv_R010YNN_partial_30_0532,
  rs_R010_ueqv_R010YNN_partial_30_0533,
  rs_R010_ueqv_R010YNN_partial_30_0534,
  rs_R010_ueqv_R010YNN_partial_30_0535,
  rs_R010_ueqv_R010YNN_partial_30_0536,
  rs_R010_ueqv_R010YNN_partial_30_0537,
  rs_R010_ueqv_R010YNN_partial_30_0538,
  rs_R010_ueqv_R010YNN_partial_30_0539,
  rs_R010_ueqv_R010YNN_partial_30_0540,
  rs_R010_ueqv_R010YNN_partial_30_0541,
  rs_R010_ueqv_R010YNN_partial_30_0542,
  rs_R010_ueqv_R010YNN_partial_30_0543,
  rs_R010_ueqv_R010YNN_partial_30_0544,
  rs_R010_ueqv_R010YNN_partial_30_0545,
  rs_R010_ueqv_R010YNN_partial_30_0546,
  rs_R010_ueqv_R010YNN_partial_30_0547,
  rs_R010_ueqv_R010YNN_partial_30_0548,
  rs_R010_ueqv_R010YNN_partial_30_0549,
  rs_R010_ueqv_R010YNN_partial_30_0550,
  rs_R010_ueqv_R010YNN_partial_30_0551,
  rs_R010_ueqv_R010YNN_partial_30_0552,
  rs_R010_ueqv_R010YNN_partial_30_0553,
  rs_R010_ueqv_R010YNN_partial_30_0554,
  rs_R010_ueqv_R010YNN_partial_30_0555,
  rs_R010_ueqv_R010YNN_partial_30_0556,
  rs_R010_ueqv_R010YNN_partial_30_0557,
  rs_R010_ueqv_R010YNN_partial_30_0558,
  rs_R010_ueqv_R010YNN_partial_30_0559,
  rs_R010_ueqv_R010YNN_partial_30_0560,
  rs_R010_ueqv_R010YNN_partial_30_0561,
  rs_R010_ueqv_R010YNN_partial_30_0562,
  rs_R010_ueqv_R010YNN_partial_30_0563,
  rs_R010_ueqv_R010YNN_partial_30_0564,
  rs_R010_ueqv_R010YNN_partial_30_0565,
  rs_R010_ueqv_R010YNN_partial_30_0566,
  rs_R010_ueqv_R010YNN_partial_30_0567,
  rs_R010_ueqv_R010YNN_partial_30_0568,
  rs_R010_ueqv_R010YNN_partial_30_0569,
  rs_R010_ueqv_R010YNN_partial_30_0570,
  rs_R010_ueqv_R010YNN_partial_30_0571,
  rs_R010_ueqv_R010YNN_partial_30_0572,
  rs_R010_ueqv_R010YNN_partial_30_0573,
  rs_R010_ueqv_R010YNN_partial_30_0574,
  rs_R010_ueqv_R010YNN_partial_30_0575,
  rs_R010_ueqv_R010YNN_partial_30_0576,
  rs_R010_ueqv_R010YNN_partial_30_0577,
  rs_R010_ueqv_R010YNN_partial_30_0578,
  rs_R010_ueqv_R010YNN_partial_30_0579,
  rs_R010_ueqv_R010YNN_partial_30_0580,
  rs_R010_ueqv_R010YNN_partial_30_0581,
  rs_R010_ueqv_R010YNN_partial_30_0582,
  rs_R010_ueqv_R010YNN_partial_30_0583,
  rs_R010_ueqv_R010YNN_partial_30_0584,
  rs_R010_ueqv_R010YNN_partial_30_0585,
  rs_R010_ueqv_R010YNN_partial_30_0586,
  rs_R010_ueqv_R010YNN_partial_30_0587,
  rs_R010_ueqv_R010YNN_partial_30_0588,
  rs_R010_ueqv_R010YNN_partial_30_0589,
  rs_R010_ueqv_R010YNN_partial_30_0590,
  rs_R010_ueqv_R010YNN_partial_30_0591,
  rs_R010_ueqv_R010YNN_partial_30_0592,
  rs_R010_ueqv_R010YNN_partial_30_0593,
  rs_R010_ueqv_R010YNN_partial_30_0594,
  rs_R010_ueqv_R010YNN_partial_30_0595,
  rs_R010_ueqv_R010YNN_partial_30_0596,
  rs_R010_ueqv_R010YNN_partial_30_0597,
  rs_R010_ueqv_R010YNN_partial_30_0598,
  rs_R010_ueqv_R010YNN_partial_30_0599
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_30_0500_0599 : Poly :=
[
  term ((8661005073267348352 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30145691279780519168 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-83943818033361678848 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 2), (14, 2), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(0, 1), (4, 1), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 2), (14, 1), (16, 1)],
  term ((298914842785620476444 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 2), (14, 2), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 3), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 3), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((20993966955713679488 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 3), (9, 1), (14, 2), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((73796461068108800 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1102705119457505872 : Rat) / 149717402626960975) [(0, 1), (4, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-165878834201400320 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-3586611801579520 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((68360739906688179908 : Rat) / 1347456623642648775) [(0, 1), (4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-12153328227362041984 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((15316312228629615104 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (4, 2), (14, 1), (16, 1)],
  term ((-629094584919568960 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((629094584919568960 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((103569760696532480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-58074141831731200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((177562137258903040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103117544259036160 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15351901638707200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((103353772840192000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((228317131808160992 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1619594866129718383384 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((1601005635368462092384 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((674202047966863360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-765587070475816960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((122527696540426240 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-14917095082803200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-857122530963077120 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((358551482046499840 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1316729599255920640 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((520140997537710080 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 3), (14, 2), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45028243246607333878 : Rat) / 269491324728529755) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-17051774963314875736 : Rat) / 89830441576176585) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((8357993774441321668 : Rat) / 89830441576176585) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((31296572860266695888 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7628488838785029548 : Rat) / 149717402626960975) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-1882234057367057956 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-31323770606887091236 : Rat) / 149717402626960975) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-372690863435353055084 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((185852322777476835416 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4330502536633674176 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((41971909016680839424 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((15072845639890259584 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(0, 2), (4, 1), (5, 2), (10, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 2), (14, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 2), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (4, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(0, 2), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((551352559728752936 : Rat) / 149717402626960975) [(0, 2), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((82939417100700160 : Rat) / 53898264945705951) [(0, 2), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(0, 2), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-34180369953344089954 : Rat) / 1347456623642648775) [(0, 2), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((6076664113681020992 : Rat) / 269491324728529755) [(0, 2), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(0, 2), (4, 2), (5, 2), (9, 2), (16, 1)],
  term (1 : Rat) [(0, 2), (4, 2), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((29037070915865600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-51784880348266240 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((51558772129518080 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88781068629451520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-51676886420096000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((7675950819353600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114158565904080496 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-800502817684231046192 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((809797433064859191692 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((382793535237908480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-337101023983431680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((7458547541401600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-61263848270213120 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-179275741023249920 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((428561265481538560 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-260070498768855040 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((658364799627960320 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8525887481657437868 : Rat) / 89830441576176585) [(0, 2), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-22514121623303666939 : Rat) / 269491324728529755) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-15648286430133347944 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4178996887220660834 : Rat) / 89830441576176585) [(0, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3814244419392514774 : Rat) / 149717402626960975) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((941117028683528978 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((15661885303443545618 : Rat) / 149717402626960975) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-92926161388738417708 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((186345431717676527542 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((8661005073267348352 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-83943818033361678848 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-30145691279780519168 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(1, 1), (4, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((298914842785620476444 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((20993966955713679488 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((73796461068108800 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1102705119457505872 : Rat) / 149717402626960975) [(1, 1), (4, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-165878834201400320 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3586611801579520 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((68360739906688179908 : Rat) / 1347456623642648775) [(1, 1), (4, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12153328227362041984 : Rat) / 269491324728529755) [(1, 1), (4, 2), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((15316312228629615104 : Rat) / 269491324728529755) [(1, 1), (4, 2), (5, 2), (9, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((629094584919568960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-629094584919568960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-58074141831731200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((103569760696532480 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-103117544259036160 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((177562137258903040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((103353772840192000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15351901638707200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((228317131808160992 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1601005635368462092384 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1619594866129718383384 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-765587070475816960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((674202047966863360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-14917095082803200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((122527696540426240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((358551482046499840 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-857122530963077120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((520140997537710080 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1316729599255920640 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17051774963314875736 : Rat) / 89830441576176585) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((45028243246607333878 : Rat) / 269491324728529755) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((31296572860266695888 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8357993774441321668 : Rat) / 89830441576176585) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7628488838785029548 : Rat) / 149717402626960975) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1882234057367057956 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31323770606887091236 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-188812957189026867416 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((185852322777476835416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-372690863435353055084 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4330502536633674176 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((41971909016680839424 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((15072845639890259584 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(1, 2), (4, 1), (5, 2), (10, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 2), (14, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (4, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(1, 2), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((551352559728752936 : Rat) / 149717402626960975) [(1, 2), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((82939417100700160 : Rat) / 53898264945705951) [(1, 2), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(1, 2), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-34180369953344089954 : Rat) / 1347456623642648775) [(1, 2), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((6076664113681020992 : Rat) / 269491324728529755) [(1, 2), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(1, 2), (4, 2), (5, 2), (9, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (4, 2), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((29037070915865600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-51784880348266240 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((51558772129518080 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88781068629451520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-51676886420096000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((7675950819353600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114158565904080496 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-800502817684231046192 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((809797433064859191692 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((382793535237908480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-337101023983431680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((7458547541401600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-61263848270213120 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-179275741023249920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((428561265481538560 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-260070498768855040 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((658364799627960320 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8525887481657437868 : Rat) / 89830441576176585) [(1, 2), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-22514121623303666939 : Rat) / 269491324728529755) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-15648286430133347944 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4178996887220660834 : Rat) / 89830441576176585) [(1, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3814244419392514774 : Rat) / 149717402626960975) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((941117028683528978 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((15661885303443545618 : Rat) / 149717402626960975) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-92926161388738417708 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((186345431717676527542 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8661005073267348352 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4330502536633674176 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-8661005073267348352 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4330502536633674176 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-786255836014315520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((30145691279780519168 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((83943818033361678848 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41971909016680839424 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-15072845639890259584 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (12, 2), (16, 1)],
  term ((83943818033361678848 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((30145691279780519168 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41971909016680839424 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-15072845639890259584 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (13, 2), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((215239049110764855808 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 3), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (12, 2), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 2), (10, 1), (13, 2), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 3), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(4, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (12, 1), (14, 2), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (12, 2), (14, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (12, 2), (16, 1)],
  term ((-298914842785620476444 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (13, 2), (14, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (13, 2), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-20993966955713679488 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((449949154166113536 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 3), (16, 1)],
  term (-6 : Rat) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (12, 2), (16, 1)],
  term (-6 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (13, 2), (16, 1)],
  term ((-73796461068108800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-73796461068108800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((1102705119457505872 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((1102705119457505872 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((165878834201400320 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((165878834201400320 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (12, 2), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (13, 2), (16, 1)],
  term ((-68360739906688179908 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((34180369953344089954 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-68360739906688179908 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34180369953344089954 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((12153328227362041984 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((12153328227362041984 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-15316312228629615104 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (12, 2), (16, 1)],
  term ((-15316312228629615104 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (13, 2), (16, 1)],
  term (2 : Rat) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (12, 2), (16, 1)],
  term (2 : Rat) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (13, 2), (16, 1)],
  term ((629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((-629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((629094584919568960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-314547292459784480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((275500579448550400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-10547588725022720 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 3), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((18814535727741530912 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 3), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-103569760696532480 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((58074141831731200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-177562137258903040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((103117544259036160 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-29037070915865600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((51784880348266240 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-51558772129518080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((88781068629451520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((103117544259036160 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-177562137258903040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6515369702213120 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-843346777639340800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-29037070915865600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((51784880348266240 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15351901638707200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-103353772840192000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((51676886420096000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-7675950819353600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-103353772840192000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15351901638707200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((51676886420096000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-7675950819353600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-228317131808160992 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1619594866129718383384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1601005635368462092384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((114158565904080496 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((800502817684231046192 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-809797433064859191692 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1601005635368462092384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1619594866129718383384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((800502817684231046192 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-62947335440275744 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-809797433064859191692 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((114158565904080496 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-674202047966863360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((765587070475816960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-382793535237908480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((337101023983431680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((765587070475816960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-674202047966863360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-382793535237908480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((337101023983431680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-122527696540426240 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((14917095082803200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((857122530963077120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-358551482046499840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7458547541401600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((61263848270213120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((179275741023249920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-428561265481538560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-358551482046499840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((857122530963077120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((194192836106053120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-551088962021964800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((-7458547541401600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 3), (14, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((61263848270213120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 3), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1316729599255920640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-520140997537710080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (12, 1), (14, 2), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((260070498768855040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (12, 2), (14, 1), (16, 1)],
  term ((-658364799627960320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (16, 1)],
  term ((-520140997537710080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1316729599255920640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((260070498768855040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (13, 2), (14, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-658364799627960320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 2), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45028243246607333878 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((17051774963314875736 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8525887481657437868 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((22514121623303666939 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((17051774963314875736 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45028243246607333878 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8525887481657437868 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((22514121623303666939 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-8357993774441321668 : Rat) / 89830441576176585) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-31296572860266695888 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((7628488838785029548 : Rat) / 149717402626960975) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((15648286430133347944 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((4178996887220660834 : Rat) / 89830441576176585) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3814244419392514774 : Rat) / 149717402626960975) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7628488838785029548 : Rat) / 149717402626960975) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-646938410754927408 : Rat) / 149717402626960975) [(5, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-53232702130384152662 : Rat) / 449152207880882925) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((15648286430133347944 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 3), (14, 1), (16, 1)],
  term ((4178996887220660834 : Rat) / 89830441576176585) [(5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 2), (16, 1)],
  term ((1882234057367057956 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-941117028683528978 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1882234057367057956 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-941117028683528978 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((62608693017281174472 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 3), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((31323770606887091236 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-15661885303443545618 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31323770606887091236 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((125226598193715200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-15661885303443545618 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((372690863435353055084 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185852322777476835416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((92926161388738417708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-186345431717676527542 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-185852322777476835416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((372690863435353055084 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((93518288271048424108 : Rat) / 269491324728529755) [(5, 1), (7, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-469564867501216828666 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 500 through 599. -/
theorem rs_R010_ueqv_R010YNN_block_30_0500_0599_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_30_0500_0599
      rs_R010_ueqv_R010YNN_block_30_0500_0599 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
