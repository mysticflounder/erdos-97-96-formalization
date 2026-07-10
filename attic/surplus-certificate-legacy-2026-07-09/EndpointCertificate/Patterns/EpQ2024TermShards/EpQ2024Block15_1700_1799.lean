/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1700-1799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1700_1799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1700 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1700 : Poly :=
[
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1700 for generator 15. -/
def ep_Q2_024_partial_15_1700 : Poly :=
[
  term ((-4723321048444112 : Rat) / 1162780221153193) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1700 for generator 15. -/
theorem ep_Q2_024_partial_15_1700_valid :
    mulPoly ep_Q2_024_coefficient_15_1700
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1700 := by
  native_decide

/-- Coefficient term 1701 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1701 : Poly :=
[
  term ((-8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 1701 for generator 15. -/
def ep_Q2_024_partial_15_1701 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1701 for generator 15. -/
theorem ep_Q2_024_partial_15_1701_valid :
    mulPoly ep_Q2_024_coefficient_15_1701
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1701 := by
  native_decide

/-- Coefficient term 1702 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1702 : Poly :=
[
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (14, 1)]
]

/-- Partial product 1702 for generator 15. -/
def ep_Q2_024_partial_15_1702 : Poly :=
[
  term ((47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (9, 2), (14, 1)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1702 for generator 15. -/
theorem ep_Q2_024_partial_15_1702_valid :
    mulPoly ep_Q2_024_coefficient_15_1702
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1702 := by
  native_decide

/-- Coefficient term 1703 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1703 : Poly :=
[
  term ((217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (12, 1)]
]

/-- Partial product 1703 for generator 15. -/
def ep_Q2_024_partial_15_1703 : Poly :=
[
  term ((434111463590540817763695627104046508132 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (12, 1)],
  term ((-217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1703 for generator 15. -/
theorem ep_Q2_024_partial_15_1703_valid :
    mulPoly ep_Q2_024_coefficient_15_1703
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1703 := by
  native_decide

/-- Coefficient term 1704 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1704 : Poly :=
[
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (13, 1), (15, 1)]
]

/-- Partial product 1704 for generator 15. -/
def ep_Q2_024_partial_15_1704 : Poly :=
[
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1704 for generator 15. -/
theorem ep_Q2_024_partial_15_1704_valid :
    mulPoly ep_Q2_024_coefficient_15_1704
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1704 := by
  native_decide

/-- Coefficient term 1705 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1705 : Poly :=
[
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (15, 2)]
]

/-- Partial product 1705 for generator 15. -/
def ep_Q2_024_partial_15_1705 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (15, 2)],
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1705 for generator 15. -/
theorem ep_Q2_024_partial_15_1705_valid :
    mulPoly ep_Q2_024_coefficient_15_1705
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1705 := by
  native_decide

/-- Coefficient term 1706 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1706 : Poly :=
[
  term ((51735384255808 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 1706 for generator 15. -/
def ep_Q2_024_partial_15_1706 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-51735384255808 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1706 for generator 15. -/
theorem ep_Q2_024_partial_15_1706_valid :
    mulPoly ep_Q2_024_coefficient_15_1706
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1706 := by
  native_decide

/-- Coefficient term 1707 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1707 : Poly :=
[
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1707 for generator 15. -/
def ep_Q2_024_partial_15_1707 : Poly :=
[
  term ((12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1707 for generator 15. -/
theorem ep_Q2_024_partial_15_1707_valid :
    mulPoly ep_Q2_024_coefficient_15_1707
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1707 := by
  native_decide

/-- Coefficient term 1708 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1708 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1708 for generator 15. -/
def ep_Q2_024_partial_15_1708 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 2), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1708 for generator 15. -/
theorem ep_Q2_024_partial_15_1708_valid :
    mulPoly ep_Q2_024_coefficient_15_1708
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1708 := by
  native_decide

/-- Coefficient term 1709 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1709 : Poly :=
[
  term ((-212739288644735 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1709 for generator 15. -/
def ep_Q2_024_partial_15_1709 : Poly :=
[
  term ((212739288644735 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(6, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1709 for generator 15. -/
theorem ep_Q2_024_partial_15_1709_valid :
    mulPoly ep_Q2_024_coefficient_15_1709
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1709 := by
  native_decide

/-- Coefficient term 1710 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1710 : Poly :=
[
  term ((291132845422495918397189537249233349384 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 1710 for generator 15. -/
def ep_Q2_024_partial_15_1710 : Poly :=
[
  term ((-291132845422495918397189537249233349384 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((582265690844991836794379074498466698768 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1710 for generator 15. -/
theorem ep_Q2_024_partial_15_1710_valid :
    mulPoly ep_Q2_024_coefficient_15_1710
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1710 := by
  native_decide

/-- Coefficient term 1711 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1711 : Poly :=
[
  term ((4450639425918643724537741739173464761175617579834157878 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1711 for generator 15. -/
def ep_Q2_024_partial_15_1711 : Poly :=
[
  term ((-4450639425918643724537741739173464761175617579834157878 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((8901278851837287449075483478346929522351235159668315756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1711 for generator 15. -/
theorem ep_Q2_024_partial_15_1711_valid :
    mulPoly ep_Q2_024_coefficient_15_1711
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1711 := by
  native_decide

/-- Coefficient term 1712 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1712 : Poly :=
[
  term ((-3501168887590402 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1712 for generator 15. -/
def ep_Q2_024_partial_15_1712 : Poly :=
[
  term ((3501168887590402 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7002337775180804 : Rat) / 1162780221153193) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1712 for generator 15. -/
theorem ep_Q2_024_partial_15_1712_valid :
    mulPoly ep_Q2_024_coefficient_15_1712
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1712 := by
  native_decide

/-- Coefficient term 1713 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1713 : Poly :=
[
  term ((-206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 2)]
]

/-- Partial product 1713 for generator 15. -/
def ep_Q2_024_partial_15_1713 : Poly :=
[
  term ((206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 2)],
  term ((-413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1713 for generator 15. -/
theorem ep_Q2_024_partial_15_1713_valid :
    mulPoly ep_Q2_024_coefficient_15_1713
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1713 := by
  native_decide

/-- Coefficient term 1714 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1714 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1714 for generator 15. -/
def ep_Q2_024_partial_15_1714 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1714 for generator 15. -/
theorem ep_Q2_024_partial_15_1714_valid :
    mulPoly ep_Q2_024_coefficient_15_1714
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1714 := by
  native_decide

/-- Coefficient term 1715 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1715 : Poly :=
[
  term ((212739288644735 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1715 for generator 15. -/
def ep_Q2_024_partial_15_1715 : Poly :=
[
  term ((-212739288644735 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(6, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1715 for generator 15. -/
theorem ep_Q2_024_partial_15_1715_valid :
    mulPoly ep_Q2_024_coefficient_15_1715
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1715 := by
  native_decide

/-- Coefficient term 1716 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1716 : Poly :=
[
  term ((12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (12, 1), (13, 2)]
]

/-- Partial product 1716 for generator 15. -/
def ep_Q2_024_partial_15_1716 : Poly :=
[
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1716 for generator 15. -/
theorem ep_Q2_024_partial_15_1716_valid :
    mulPoly ep_Q2_024_coefficient_15_1716
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1716 := by
  native_decide

/-- Coefficient term 1717 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1717 : Poly :=
[
  term ((-4450639425918643724537741739173464761175617579834157878 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1717 for generator 15. -/
def ep_Q2_024_partial_15_1717 : Poly :=
[
  term ((4450639425918643724537741739173464761175617579834157878 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-8901278851837287449075483478346929522351235159668315756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1717 for generator 15. -/
theorem ep_Q2_024_partial_15_1717_valid :
    mulPoly ep_Q2_024_coefficient_15_1717
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1717 := by
  native_decide

/-- Coefficient term 1718 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1718 : Poly :=
[
  term ((3501168887590402 : Rat) / 1162780221153193) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1718 for generator 15. -/
def ep_Q2_024_partial_15_1718 : Poly :=
[
  term ((-3501168887590402 : Rat) / 1162780221153193) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((7002337775180804 : Rat) / 1162780221153193) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1718 for generator 15. -/
theorem ep_Q2_024_partial_15_1718_valid :
    mulPoly ep_Q2_024_coefficient_15_1718
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1718 := by
  native_decide

/-- Coefficient term 1719 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1719 : Poly :=
[
  term ((-84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (13, 2)]
]

/-- Partial product 1719 for generator 15. -/
def ep_Q2_024_partial_15_1719 : Poly :=
[
  term ((84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (13, 2)],
  term ((-169148534608068318614766785971719853796 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1719 for generator 15. -/
theorem ep_Q2_024_partial_15_1719_valid :
    mulPoly ep_Q2_024_coefficient_15_1719
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1719 := by
  native_decide

/-- Coefficient term 1720 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1720 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 1720 for generator 15. -/
def ep_Q2_024_partial_15_1720 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (11, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1720 for generator 15. -/
theorem ep_Q2_024_partial_15_1720_valid :
    mulPoly ep_Q2_024_coefficient_15_1720
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1720 := by
  native_decide

/-- Coefficient term 1721 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1721 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1721 for generator 15. -/
def ep_Q2_024_partial_15_1721 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1721 for generator 15. -/
theorem ep_Q2_024_partial_15_1721_valid :
    mulPoly ep_Q2_024_coefficient_15_1721
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1721 := by
  native_decide

/-- Coefficient term 1722 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1722 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1722 for generator 15. -/
def ep_Q2_024_partial_15_1722 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1722 for generator 15. -/
theorem ep_Q2_024_partial_15_1722_valid :
    mulPoly ep_Q2_024_coefficient_15_1722
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1722 := by
  native_decide

/-- Coefficient term 1723 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1723 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1723 for generator 15. -/
def ep_Q2_024_partial_15_1723 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((115944433813960 : Rat) / 1162780221153193) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1723 for generator 15. -/
theorem ep_Q2_024_partial_15_1723_valid :
    mulPoly ep_Q2_024_coefficient_15_1723
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1723 := by
  native_decide

/-- Coefficient term 1724 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1724 : Poly :=
[
  term ((-393138906611795105837570471987196237848 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1724 for generator 15. -/
def ep_Q2_024_partial_15_1724 : Poly :=
[
  term ((393138906611795105837570471987196237848 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-786277813223590211675140943974392475696 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1724 for generator 15. -/
theorem ep_Q2_024_partial_15_1724_valid :
    mulPoly ep_Q2_024_coefficient_15_1724
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1724 := by
  native_decide

/-- Coefficient term 1725 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1725 : Poly :=
[
  term ((201241568719033021932681875109716181112 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1725 for generator 15. -/
def ep_Q2_024_partial_15_1725 : Poly :=
[
  term ((-201241568719033021932681875109716181112 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((402483137438066043865363750219432362224 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1725 for generator 15. -/
theorem ep_Q2_024_partial_15_1725_valid :
    mulPoly ep_Q2_024_coefficient_15_1725
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1725 := by
  native_decide

/-- Coefficient term 1726 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1726 : Poly :=
[
  term ((-25429717607873182366080146627296720487705923572425045 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1726 for generator 15. -/
def ep_Q2_024_partial_15_1726 : Poly :=
[
  term ((25429717607873182366080146627296720487705923572425045 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25429717607873182366080146627296720487705923572425045 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1726 for generator 15. -/
theorem ep_Q2_024_partial_15_1726_valid :
    mulPoly ep_Q2_024_coefficient_15_1726
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1726 := by
  native_decide

/-- Coefficient term 1727 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1727 : Poly :=
[
  term ((-302565619860682 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1727 for generator 15. -/
def ep_Q2_024_partial_15_1727 : Poly :=
[
  term ((302565619860682 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-605131239721364 : Rat) / 1162780221153193) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1727 for generator 15. -/
theorem ep_Q2_024_partial_15_1727_valid :
    mulPoly ep_Q2_024_coefficient_15_1727
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1727 := by
  native_decide

/-- Coefficient term 1728 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1728 : Poly :=
[
  term ((52854752464211700109031092002213249708591882599209910489 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1728 for generator 15. -/
def ep_Q2_024_partial_15_1728 : Poly :=
[
  term ((-52854752464211700109031092002213249708591882599209910489 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((52854752464211700109031092002213249708591882599209910489 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1728 for generator 15. -/
theorem ep_Q2_024_partial_15_1728_valid :
    mulPoly ep_Q2_024_coefficient_15_1728
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1728 := by
  native_decide

/-- Coefficient term 1729 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1729 : Poly :=
[
  term ((-1777894635659307 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1729 for generator 15. -/
def ep_Q2_024_partial_15_1729 : Poly :=
[
  term ((1777894635659307 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3555789271318614 : Rat) / 1162780221153193) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1729 for generator 15. -/
theorem ep_Q2_024_partial_15_1729_valid :
    mulPoly ep_Q2_024_coefficient_15_1729
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1729 := by
  native_decide

/-- Coefficient term 1730 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1730 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1730 for generator 15. -/
def ep_Q2_024_partial_15_1730 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1730 for generator 15. -/
theorem ep_Q2_024_partial_15_1730_valid :
    mulPoly ep_Q2_024_coefficient_15_1730
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1730 := by
  native_decide

/-- Coefficient term 1731 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1731 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1731 for generator 15. -/
def ep_Q2_024_partial_15_1731 : Poly :=
[
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1731 for generator 15. -/
theorem ep_Q2_024_partial_15_1731_valid :
    mulPoly ep_Q2_024_coefficient_15_1731
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1731 := by
  native_decide

/-- Coefficient term 1732 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1732 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1732 for generator 15. -/
def ep_Q2_024_partial_15_1732 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(6, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1732 for generator 15. -/
theorem ep_Q2_024_partial_15_1732_valid :
    mulPoly ep_Q2_024_coefficient_15_1732
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1732 := by
  native_decide

/-- Coefficient term 1733 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1733 : Poly :=
[
  term ((314688800998853570750485392958593183239 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1733 for generator 15. -/
def ep_Q2_024_partial_15_1733 : Poly :=
[
  term ((-314688800998853570750485392958593183239 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1)],
  term ((629377601997707141500970785917186366478 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1733 for generator 15. -/
theorem ep_Q2_024_partial_15_1733_valid :
    mulPoly ep_Q2_024_coefficient_15_1733
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1733 := by
  native_decide

/-- Coefficient term 1734 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1734 : Poly :=
[
  term ((-3104054888798294421936919070271984383024 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1734 for generator 15. -/
def ep_Q2_024_partial_15_1734 : Poly :=
[
  term ((3104054888798294421936919070271984383024 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-6208109777596588843873838140543968766048 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1734 for generator 15. -/
theorem ep_Q2_024_partial_15_1734_valid :
    mulPoly ep_Q2_024_coefficient_15_1734
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1734 := by
  native_decide

/-- Coefficient term 1735 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1735 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 2)]
]

/-- Partial product 1735 for generator 15. -/
def ep_Q2_024_partial_15_1735 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1735 for generator 15. -/
theorem ep_Q2_024_partial_15_1735_valid :
    mulPoly ep_Q2_024_coefficient_15_1735
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1735 := by
  native_decide

/-- Coefficient term 1736 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1736 : Poly :=
[
  term ((6213257326497533998434406865439742334811255363356619031 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1736 for generator 15. -/
def ep_Q2_024_partial_15_1736 : Poly :=
[
  term ((-6213257326497533998434406865439742334811255363356619031 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((12426514652995067996868813730879484669622510726713238062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1736 for generator 15. -/
theorem ep_Q2_024_partial_15_1736_valid :
    mulPoly ep_Q2_024_coefficient_15_1736
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1736 := by
  native_decide

/-- Coefficient term 1737 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1737 : Poly :=
[
  term ((-1996682019358932 : Rat) / 1162780221153193) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1737 for generator 15. -/
def ep_Q2_024_partial_15_1737 : Poly :=
[
  term ((1996682019358932 : Rat) / 1162780221153193) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3993364038717864 : Rat) / 1162780221153193) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1737 for generator 15. -/
theorem ep_Q2_024_partial_15_1737_valid :
    mulPoly ep_Q2_024_coefficient_15_1737
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1737 := by
  native_decide

/-- Coefficient term 1738 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1738 : Poly :=
[
  term ((-182848986207008493094695551063545737344 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 1738 for generator 15. -/
def ep_Q2_024_partial_15_1738 : Poly :=
[
  term ((182848986207008493094695551063545737344 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-365697972414016986189391102127091474688 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1738 for generator 15. -/
theorem ep_Q2_024_partial_15_1738_valid :
    mulPoly ep_Q2_024_coefficient_15_1738
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1738 := by
  native_decide

/-- Coefficient term 1739 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1739 : Poly :=
[
  term ((-22978004305605013703443611528312667958574681665575307023 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1739 for generator 15. -/
def ep_Q2_024_partial_15_1739 : Poly :=
[
  term ((22978004305605013703443611528312667958574681665575307023 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-22978004305605013703443611528312667958574681665575307023 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1739 for generator 15. -/
theorem ep_Q2_024_partial_15_1739_valid :
    mulPoly ep_Q2_024_coefficient_15_1739
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1739 := by
  native_decide

/-- Coefficient term 1740 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1740 : Poly :=
[
  term ((-2674381653335285 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1740 for generator 15. -/
def ep_Q2_024_partial_15_1740 : Poly :=
[
  term ((2674381653335285 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5348763306670570 : Rat) / 1162780221153193) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1740 for generator 15. -/
theorem ep_Q2_024_partial_15_1740_valid :
    mulPoly ep_Q2_024_coefficient_15_1740
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1740 := by
  native_decide

/-- Coefficient term 1741 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1741 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 1741 for generator 15. -/
def ep_Q2_024_partial_15_1741 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1741 for generator 15. -/
theorem ep_Q2_024_partial_15_1741_valid :
    mulPoly ep_Q2_024_coefficient_15_1741
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1741 := by
  native_decide

/-- Coefficient term 1742 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1742 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1742 for generator 15. -/
def ep_Q2_024_partial_15_1742 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(6, 2), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1742 for generator 15. -/
theorem ep_Q2_024_partial_15_1742_valid :
    mulPoly ep_Q2_024_coefficient_15_1742
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1742 := by
  native_decide

/-- Coefficient term 1743 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1743 : Poly :=
[
  term ((-24381871583415222619427240024539885248092857597419037319 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1743 for generator 15. -/
def ep_Q2_024_partial_15_1743 : Poly :=
[
  term ((24381871583415222619427240024539885248092857597419037319 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (15, 1)],
  term ((-24381871583415222619427240024539885248092857597419037319 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1743 for generator 15. -/
theorem ep_Q2_024_partial_15_1743_valid :
    mulPoly ep_Q2_024_coefficient_15_1743
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1743 := by
  native_decide

/-- Coefficient term 1744 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1744 : Poly :=
[
  term ((1235944130217429 : Rat) / 2325560442306386) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1744 for generator 15. -/
def ep_Q2_024_partial_15_1744 : Poly :=
[
  term ((-1235944130217429 : Rat) / 2325560442306386) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1235944130217429 : Rat) / 1162780221153193) [(6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1744 for generator 15. -/
theorem ep_Q2_024_partial_15_1744_valid :
    mulPoly ep_Q2_024_coefficient_15_1744
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1744 := by
  native_decide

/-- Coefficient term 1745 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1745 : Poly :=
[
  term ((329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (9, 1), (15, 3)]
]

/-- Partial product 1745 for generator 15. -/
def ep_Q2_024_partial_15_1745 : Poly :=
[
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (9, 1), (15, 3)],
  term ((659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1745 for generator 15. -/
theorem ep_Q2_024_partial_15_1745_valid :
    mulPoly ep_Q2_024_coefficient_15_1745
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1745 := by
  native_decide

/-- Coefficient term 1746 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1746 : Poly :=
[
  term ((-136850605782984 : Rat) / 1162780221153193) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1746 for generator 15. -/
def ep_Q2_024_partial_15_1746 : Poly :=
[
  term ((136850605782984 : Rat) / 1162780221153193) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-273701211565968 : Rat) / 1162780221153193) [(6, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1746 for generator 15. -/
theorem ep_Q2_024_partial_15_1746_valid :
    mulPoly ep_Q2_024_coefficient_15_1746
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1746 := by
  native_decide

/-- Coefficient term 1747 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1747 : Poly :=
[
  term ((-1828701926258867392071461481533010175006 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2)]
]

/-- Partial product 1747 for generator 15. -/
def ep_Q2_024_partial_15_1747 : Poly :=
[
  term ((1828701926258867392071461481533010175006 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2)],
  term ((-3657403852517734784142922963066020350012 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1747 for generator 15. -/
theorem ep_Q2_024_partial_15_1747_valid :
    mulPoly ep_Q2_024_coefficient_15_1747
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1747 := by
  native_decide

/-- Coefficient term 1748 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1748 : Poly :=
[
  term ((-38848461176744809227650352269108384352 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (12, 1)]
]

/-- Partial product 1748 for generator 15. -/
def ep_Q2_024_partial_15_1748 : Poly :=
[
  term ((38848461176744809227650352269108384352 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (12, 1)],
  term ((-77696922353489618455300704538216768704 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1748 for generator 15. -/
theorem ep_Q2_024_partial_15_1748_valid :
    mulPoly ep_Q2_024_coefficient_15_1748
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1748 := by
  native_decide

/-- Coefficient term 1749 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1749 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (13, 1), (15, 1)]
]

/-- Partial product 1749 for generator 15. -/
def ep_Q2_024_partial_15_1749 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1749 for generator 15. -/
theorem ep_Q2_024_partial_15_1749_valid :
    mulPoly ep_Q2_024_coefficient_15_1749
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1749 := by
  native_decide

/-- Coefficient term 1750 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1750 : Poly :=
[
  term ((2440387447938550487524351948583405367964 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (14, 1)]
]

/-- Partial product 1750 for generator 15. -/
def ep_Q2_024_partial_15_1750 : Poly :=
[
  term ((-2440387447938550487524351948583405367964 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (14, 1)],
  term ((4880774895877100975048703897166810735928 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1750 for generator 15. -/
theorem ep_Q2_024_partial_15_1750_valid :
    mulPoly ep_Q2_024_coefficient_15_1750
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1750 := by
  native_decide

/-- Coefficient term 1751 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1751 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 1751 for generator 15. -/
def ep_Q2_024_partial_15_1751 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (15, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1751 for generator 15. -/
theorem ep_Q2_024_partial_15_1751_valid :
    mulPoly ep_Q2_024_coefficient_15_1751
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1751 := by
  native_decide

/-- Coefficient term 1752 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1752 : Poly :=
[
  term ((838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1752 for generator 15. -/
def ep_Q2_024_partial_15_1752 : Poly :=
[
  term ((-838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((838411973319437252533717745383941150125364404896314437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1752 for generator 15. -/
theorem ep_Q2_024_partial_15_1752_valid :
    mulPoly ep_Q2_024_coefficient_15_1752
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1752 := by
  native_decide

/-- Coefficient term 1753 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1753 : Poly :=
[
  term ((1274781574709922 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1753 for generator 15. -/
def ep_Q2_024_partial_15_1753 : Poly :=
[
  term ((-1274781574709922 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2549563149419844 : Rat) / 1162780221153193) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1753 for generator 15. -/
theorem ep_Q2_024_partial_15_1753_valid :
    mulPoly ep_Q2_024_coefficient_15_1753
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1753 := by
  native_decide

/-- Coefficient term 1754 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1754 : Poly :=
[
  term ((-22784920138165596213155044945716392019811615659844258325 : Rat) / 557999371279211891102864058501759538480407853948476828) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1754 for generator 15. -/
def ep_Q2_024_partial_15_1754 : Poly :=
[
  term ((22784920138165596213155044945716392019811615659844258325 : Rat) / 557999371279211891102864058501759538480407853948476828) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-22784920138165596213155044945716392019811615659844258325 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1754 for generator 15. -/
theorem ep_Q2_024_partial_15_1754_valid :
    mulPoly ep_Q2_024_coefficient_15_1754
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1754 := by
  native_decide

/-- Coefficient term 1755 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1755 : Poly :=
[
  term ((3019770354102187 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1755 for generator 15. -/
def ep_Q2_024_partial_15_1755 : Poly :=
[
  term ((-3019770354102187 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6039540708204374 : Rat) / 1162780221153193) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1755 for generator 15. -/
theorem ep_Q2_024_partial_15_1755_valid :
    mulPoly ep_Q2_024_coefficient_15_1755
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1755 := by
  native_decide

/-- Coefficient term 1756 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1756 : Poly :=
[
  term ((711333560106881037673088514204255638276 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 1), (13, 2)]
]

/-- Partial product 1756 for generator 15. -/
def ep_Q2_024_partial_15_1756 : Poly :=
[
  term ((-711333560106881037673088514204255638276 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 1), (13, 2)],
  term ((1422667120213762075346177028408511276552 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1756 for generator 15. -/
theorem ep_Q2_024_partial_15_1756_valid :
    mulPoly ep_Q2_024_coefficient_15_1756
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1756 := by
  native_decide

/-- Coefficient term 1757 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1757 : Poly :=
[
  term ((-48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1757 for generator 15. -/
def ep_Q2_024_partial_15_1757 : Poly :=
[
  term ((48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-96876846258431121352286131344375397648 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1757 for generator 15. -/
theorem ep_Q2_024_partial_15_1757_valid :
    mulPoly ep_Q2_024_coefficient_15_1757
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1757 := by
  native_decide

/-- Coefficient term 1758 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1758 : Poly :=
[
  term ((99166769400052648715920076472054220285961978579213337647 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 1758 for generator 15. -/
def ep_Q2_024_partial_15_1758 : Poly :=
[
  term ((-99166769400052648715920076472054220285961978579213337647 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (12, 1), (15, 2)],
  term ((99166769400052648715920076472054220285961978579213337647 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1758 for generator 15. -/
theorem ep_Q2_024_partial_15_1758_valid :
    mulPoly ep_Q2_024_coefficient_15_1758
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1758 := by
  native_decide

/-- Coefficient term 1759 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1759 : Poly :=
[
  term ((4498162330382319 : Rat) / 1162780221153193) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1759 for generator 15. -/
def ep_Q2_024_partial_15_1759 : Poly :=
[
  term ((-4498162330382319 : Rat) / 1162780221153193) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((8996324660764638 : Rat) / 1162780221153193) [(6, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1759 for generator 15. -/
theorem ep_Q2_024_partial_15_1759_valid :
    mulPoly ep_Q2_024_coefficient_15_1759
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1759 := by
  native_decide

/-- Coefficient term 1760 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1760 : Poly :=
[
  term ((10746260049841379628739393464068940096509189608682802112 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1760 for generator 15. -/
def ep_Q2_024_partial_15_1760 : Poly :=
[
  term ((-10746260049841379628739393464068940096509189608682802112 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((21492520099682759257478786928137880193018379217365604224 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1760 for generator 15. -/
theorem ep_Q2_024_partial_15_1760_valid :
    mulPoly ep_Q2_024_coefficient_15_1760
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1760 := by
  native_decide

/-- Coefficient term 1761 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1761 : Poly :=
[
  term ((-1758553647569664 : Rat) / 1162780221153193) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1761 for generator 15. -/
def ep_Q2_024_partial_15_1761 : Poly :=
[
  term ((1758553647569664 : Rat) / 1162780221153193) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3517107295139328 : Rat) / 1162780221153193) [(6, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1761 for generator 15. -/
theorem ep_Q2_024_partial_15_1761_valid :
    mulPoly ep_Q2_024_coefficient_15_1761
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1761 := by
  native_decide

/-- Coefficient term 1762 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1762 : Poly :=
[
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (12, 2), (13, 2)]
]

/-- Partial product 1762 for generator 15. -/
def ep_Q2_024_partial_15_1762 : Poly :=
[
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (12, 2), (13, 2)],
  term ((-54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(6, 2), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1762 for generator 15. -/
theorem ep_Q2_024_partial_15_1762_valid :
    mulPoly ep_Q2_024_coefficient_15_1762
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1762 := by
  native_decide

/-- Coefficient term 1763 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1763 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (12, 2), (15, 2)]
]

/-- Partial product 1763 for generator 15. -/
def ep_Q2_024_partial_15_1763 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (12, 2), (15, 2)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1763 for generator 15. -/
theorem ep_Q2_024_partial_15_1763_valid :
    mulPoly ep_Q2_024_coefficient_15_1763
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1763 := by
  native_decide

/-- Coefficient term 1764 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1764 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(6, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1764 for generator 15. -/
def ep_Q2_024_partial_15_1764 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(6, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1764 for generator 15. -/
theorem ep_Q2_024_partial_15_1764_valid :
    mulPoly ep_Q2_024_coefficient_15_1764
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1764 := by
  native_decide

/-- Coefficient term 1765 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1765 : Poly :=
[
  term ((147692831174623299862049600133360181051299514932951475561 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1765 for generator 15. -/
def ep_Q2_024_partial_15_1765 : Poly :=
[
  term ((-147692831174623299862049600133360181051299514932951475561 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((147692831174623299862049600133360181051299514932951475561 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1765 for generator 15. -/
theorem ep_Q2_024_partial_15_1765_valid :
    mulPoly ep_Q2_024_coefficient_15_1765
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1765 := by
  native_decide

/-- Coefficient term 1766 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1766 : Poly :=
[
  term ((-2691620376761295 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1766 for generator 15. -/
def ep_Q2_024_partial_15_1766 : Poly :=
[
  term ((2691620376761295 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5383240753522590 : Rat) / 1162780221153193) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1766 for generator 15. -/
theorem ep_Q2_024_partial_15_1766_valid :
    mulPoly ep_Q2_024_coefficient_15_1766
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1766 := by
  native_decide

/-- Coefficient term 1767 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1767 : Poly :=
[
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1767 for generator 15. -/
def ep_Q2_024_partial_15_1767 : Poly :=
[
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((7546803947896731422944084549187591818464216977964783022 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1767 for generator 15. -/
theorem ep_Q2_024_partial_15_1767_valid :
    mulPoly ep_Q2_024_coefficient_15_1767
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1767 := by
  native_decide

/-- Coefficient term 1768 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1768 : Poly :=
[
  term ((938674662914812 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1768 for generator 15. -/
def ep_Q2_024_partial_15_1768 : Poly :=
[
  term ((-938674662914812 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1877349325829624 : Rat) / 1162780221153193) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1768 for generator 15. -/
theorem ep_Q2_024_partial_15_1768_valid :
    mulPoly ep_Q2_024_coefficient_15_1768
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1768 := by
  native_decide

/-- Coefficient term 1769 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1769 : Poly :=
[
  term ((57424265761789517429157274509892407275596422915453973627 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1769 for generator 15. -/
def ep_Q2_024_partial_15_1769 : Poly :=
[
  term ((-57424265761789517429157274509892407275596422915453973627 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (13, 1), (15, 1)],
  term ((57424265761789517429157274509892407275596422915453973627 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1769 for generator 15. -/
theorem ep_Q2_024_partial_15_1769_valid :
    mulPoly ep_Q2_024_coefficient_15_1769
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1769 := by
  native_decide

/-- Coefficient term 1770 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1770 : Poly :=
[
  term ((-318373975502121 : Rat) / 2325560442306386) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1770 for generator 15. -/
def ep_Q2_024_partial_15_1770 : Poly :=
[
  term ((318373975502121 : Rat) / 2325560442306386) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-318373975502121 : Rat) / 1162780221153193) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1770 for generator 15. -/
theorem ep_Q2_024_partial_15_1770_valid :
    mulPoly ep_Q2_024_coefficient_15_1770
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1770 := by
  native_decide

/-- Coefficient term 1771 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1771 : Poly :=
[
  term ((-6426933012966323304250535122031470077652149965108493589 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (15, 3)]
]

/-- Partial product 1771 for generator 15. -/
def ep_Q2_024_partial_15_1771 : Poly :=
[
  term ((6426933012966323304250535122031470077652149965108493589 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (15, 3)],
  term ((-12853866025932646608501070244062940155304299930216987178 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1771 for generator 15. -/
theorem ep_Q2_024_partial_15_1771_valid :
    mulPoly ep_Q2_024_coefficient_15_1771
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1771 := by
  native_decide

/-- Coefficient term 1772 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1772 : Poly :=
[
  term ((2813758772819372 : Rat) / 1162780221153193) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1772 for generator 15. -/
def ep_Q2_024_partial_15_1772 : Poly :=
[
  term ((-2813758772819372 : Rat) / 1162780221153193) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((5627517545638744 : Rat) / 1162780221153193) [(6, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1772 for generator 15. -/
theorem ep_Q2_024_partial_15_1772_valid :
    mulPoly ep_Q2_024_coefficient_15_1772
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1772 := by
  native_decide

/-- Coefficient term 1773 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1773 : Poly :=
[
  term ((152459042060193964129367162216960464148 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2)]
]

/-- Partial product 1773 for generator 15. -/
def ep_Q2_024_partial_15_1773 : Poly :=
[
  term ((-152459042060193964129367162216960464148 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2)],
  term ((304918084120387928258734324433920928296 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1773 for generator 15. -/
theorem ep_Q2_024_partial_15_1773_valid :
    mulPoly ep_Q2_024_coefficient_15_1773
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1773 := by
  native_decide

/-- Coefficient term 1774 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1774 : Poly :=
[
  term ((300674504288996855054465443075571371212 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 2), (14, 1)]
]

/-- Partial product 1774 for generator 15. -/
def ep_Q2_024_partial_15_1774 : Poly :=
[
  term ((-300674504288996855054465443075571371212 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 2), (14, 1)],
  term ((601349008577993710108930886151142742424 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1774 for generator 15. -/
theorem ep_Q2_024_partial_15_1774_valid :
    mulPoly ep_Q2_024_coefficient_15_1774
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1774 := by
  native_decide

/-- Coefficient term 1775 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1775 : Poly :=
[
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2), (14, 2)]
]

/-- Partial product 1775 for generator 15. -/
def ep_Q2_024_partial_15_1775 : Poly :=
[
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2), (14, 2)],
  term ((38717834506980728124094132443344896016 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1775 for generator 15. -/
theorem ep_Q2_024_partial_15_1775_valid :
    mulPoly ep_Q2_024_coefficient_15_1775
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1775 := by
  native_decide

/-- Coefficient term 1776 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1776 : Poly :=
[
  term ((-478384653334217698047115250416034515034935381738935634 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (13, 2), (15, 2)]
]

/-- Partial product 1776 for generator 15. -/
def ep_Q2_024_partial_15_1776 : Poly :=
[
  term ((478384653334217698047115250416034515034935381738935634 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (13, 2), (15, 2)],
  term ((-956769306668435396094230500832069030069870763477871268 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1776 for generator 15. -/
theorem ep_Q2_024_partial_15_1776_valid :
    mulPoly ep_Q2_024_coefficient_15_1776
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1776 := by
  native_decide

/-- Coefficient term 1777 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1777 : Poly :=
[
  term ((1622904756221704 : Rat) / 1162780221153193) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1777 for generator 15. -/
def ep_Q2_024_partial_15_1777 : Poly :=
[
  term ((-1622904756221704 : Rat) / 1162780221153193) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((3245809512443408 : Rat) / 1162780221153193) [(6, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1777 for generator 15. -/
theorem ep_Q2_024_partial_15_1777_valid :
    mulPoly ep_Q2_024_coefficient_15_1777
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1777 := by
  native_decide

/-- Coefficient term 1778 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1778 : Poly :=
[
  term ((-38583783201407037052245115640108611088 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 3), (15, 1)]
]

/-- Partial product 1778 for generator 15. -/
def ep_Q2_024_partial_15_1778 : Poly :=
[
  term ((38583783201407037052245115640108611088 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 3), (15, 1)],
  term ((-77167566402814074104490231280217222176 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1778 for generator 15. -/
theorem ep_Q2_024_partial_15_1778_valid :
    mulPoly ep_Q2_024_coefficient_15_1778
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1778 := by
  native_decide

/-- Coefficient term 1779 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1779 : Poly :=
[
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 1779 for generator 15. -/
def ep_Q2_024_partial_15_1779 : Poly :=
[
  term ((20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (14, 1), (15, 2)],
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1779 for generator 15. -/
theorem ep_Q2_024_partial_15_1779_valid :
    mulPoly ep_Q2_024_coefficient_15_1779
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1779 := by
  native_decide

/-- Coefficient term 1780 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1780 : Poly :=
[
  term ((-3239154629516277 : Rat) / 1162780221153193) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1780 for generator 15. -/
def ep_Q2_024_partial_15_1780 : Poly :=
[
  term ((3239154629516277 : Rat) / 1162780221153193) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6478309259032554 : Rat) / 1162780221153193) [(6, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1780 for generator 15. -/
theorem ep_Q2_024_partial_15_1780_valid :
    mulPoly ep_Q2_024_coefficient_15_1780
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1780 := by
  native_decide

/-- Coefficient term 1781 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1781 : Poly :=
[
  term ((-30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (15, 2)]
]

/-- Partial product 1781 for generator 15. -/
def ep_Q2_024_partial_15_1781 : Poly :=
[
  term ((30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (15, 2)],
  term ((-61029920602251368849062270431084368506816499195006587438 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1781 for generator 15. -/
theorem ep_Q2_024_partial_15_1781_valid :
    mulPoly ep_Q2_024_coefficient_15_1781
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1781 := by
  native_decide

/-- Coefficient term 1782 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1782 : Poly :=
[
  term ((-6359310750251020 : Rat) / 1162780221153193) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1782 for generator 15. -/
def ep_Q2_024_partial_15_1782 : Poly :=
[
  term ((6359310750251020 : Rat) / 1162780221153193) [(6, 1), (15, 2), (16, 1)],
  term ((-12718621500502040 : Rat) / 1162780221153193) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1782 for generator 15. -/
theorem ep_Q2_024_partial_15_1782_valid :
    mulPoly ep_Q2_024_coefficient_15_1782
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1782 := by
  native_decide

/-- Coefficient term 1783 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1783 : Poly :=
[
  term ((1828701926258867392071461481533010175006 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 1783 for generator 15. -/
def ep_Q2_024_partial_15_1783 : Poly :=
[
  term ((3657403852517734784142922963066020350012 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((-1828701926258867392071461481533010175006 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1783 for generator 15. -/
theorem ep_Q2_024_partial_15_1783_valid :
    mulPoly ep_Q2_024_coefficient_15_1783
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1783 := by
  native_decide

/-- Coefficient term 1784 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1784 : Poly :=
[
  term ((-18002638917645466281371017491209653886 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 1784 for generator 15. -/
def ep_Q2_024_partial_15_1784 : Poly :=
[
  term ((-36005277835290932562742034982419307772 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((18002638917645466281371017491209653886 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1784 for generator 15. -/
theorem ep_Q2_024_partial_15_1784_valid :
    mulPoly ep_Q2_024_coefficient_15_1784
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1784 := by
  native_decide

/-- Coefficient term 1785 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1785 : Poly :=
[
  term ((-39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1785 for generator 15. -/
def ep_Q2_024_partial_15_1785 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1785 for generator 15. -/
theorem ep_Q2_024_partial_15_1785_valid :
    mulPoly ep_Q2_024_coefficient_15_1785
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1785 := by
  native_decide

/-- Coefficient term 1786 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1786 : Poly :=
[
  term ((-3266735012088789813711888901020273842828 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 1786 for generator 15. -/
def ep_Q2_024_partial_15_1786 : Poly :=
[
  term ((-6533470024177579627423777802040547685656 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((3266735012088789813711888901020273842828 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1786 for generator 15. -/
theorem ep_Q2_024_partial_15_1786_valid :
    mulPoly ep_Q2_024_coefficient_15_1786
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1786 := by
  native_decide

/-- Coefficient term 1787 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1787 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (9, 1), (15, 2)]
]

/-- Partial product 1787 for generator 15. -/
def ep_Q2_024_partial_15_1787 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1787 for generator 15. -/
theorem ep_Q2_024_partial_15_1787_valid :
    mulPoly ep_Q2_024_coefficient_15_1787
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1787 := by
  native_decide

/-- Coefficient term 1788 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1788 : Poly :=
[
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1788 for generator 15. -/
def ep_Q2_024_partial_15_1788 : Poly :=
[
  term ((-3737871123862340 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1788 for generator 15. -/
theorem ep_Q2_024_partial_15_1788_valid :
    mulPoly ep_Q2_024_coefficient_15_1788
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1788 := by
  native_decide

/-- Coefficient term 1789 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1789 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 2), (15, 1)]
]

/-- Partial product 1789 for generator 15. -/
def ep_Q2_024_partial_15_1789 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (8, 1), (9, 2), (15, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1789 for generator 15. -/
theorem ep_Q2_024_partial_15_1789_valid :
    mulPoly ep_Q2_024_coefficient_15_1789
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1789 := by
  native_decide

/-- Coefficient term 1790 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1790 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 1790 for generator 15. -/
def ep_Q2_024_partial_15_1790 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1790 for generator 15. -/
theorem ep_Q2_024_partial_15_1790_valid :
    mulPoly ep_Q2_024_coefficient_15_1790
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1790 := by
  native_decide

/-- Coefficient term 1791 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1791 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1791 for generator 15. -/
def ep_Q2_024_partial_15_1791 : Poly :=
[
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1791 for generator 15. -/
theorem ep_Q2_024_partial_15_1791_valid :
    mulPoly ep_Q2_024_coefficient_15_1791
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1791 := by
  native_decide

/-- Coefficient term 1792 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1792 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 1792 for generator 15. -/
def ep_Q2_024_partial_15_1792 : Poly :=
[
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1792 for generator 15. -/
theorem ep_Q2_024_partial_15_1792_valid :
    mulPoly ep_Q2_024_coefficient_15_1792
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1792 := by
  native_decide

/-- Coefficient term 1793 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1793 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1793 for generator 15. -/
def ep_Q2_024_partial_15_1793 : Poly :=
[
  term ((-115944433813960 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1793 for generator 15. -/
theorem ep_Q2_024_partial_15_1793_valid :
    mulPoly ep_Q2_024_coefficient_15_1793
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1793 := by
  native_decide

/-- Coefficient term 1794 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1794 : Poly :=
[
  term ((187717951288525159661769184434383299866 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1794 for generator 15. -/
def ep_Q2_024_partial_15_1794 : Poly :=
[
  term ((375435902577050319323538368868766599732 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-187717951288525159661769184434383299866 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1794 for generator 15. -/
theorem ep_Q2_024_partial_15_1794_valid :
    mulPoly ep_Q2_024_coefficient_15_1794
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1794 := by
  native_decide

/-- Coefficient term 1795 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1795 : Poly :=
[
  term ((-201241568719033021932681875109716181112 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1795 for generator 15. -/
def ep_Q2_024_partial_15_1795 : Poly :=
[
  term ((-402483137438066043865363750219432362224 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((201241568719033021932681875109716181112 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1795 for generator 15. -/
theorem ep_Q2_024_partial_15_1795_valid :
    mulPoly ep_Q2_024_coefficient_15_1795
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1795 := by
  native_decide

/-- Coefficient term 1796 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1796 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1796 for generator 15. -/
def ep_Q2_024_partial_15_1796 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1796 for generator 15. -/
theorem ep_Q2_024_partial_15_1796_valid :
    mulPoly ep_Q2_024_coefficient_15_1796
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1796 := by
  native_decide

/-- Coefficient term 1797 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1797 : Poly :=
[
  term ((25429717607873182366080146627296720487705923572425045 : Rat) / 278999685639605945551432029250879769240203926974238414) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1797 for generator 15. -/
def ep_Q2_024_partial_15_1797 : Poly :=
[
  term ((25429717607873182366080146627296720487705923572425045 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25429717607873182366080146627296720487705923572425045 : Rat) / 278999685639605945551432029250879769240203926974238414) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1797 for generator 15. -/
theorem ep_Q2_024_partial_15_1797_valid :
    mulPoly ep_Q2_024_coefficient_15_1797
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1797 := by
  native_decide

/-- Coefficient term 1798 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1798 : Poly :=
[
  term ((302565619860682 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1798 for generator 15. -/
def ep_Q2_024_partial_15_1798 : Poly :=
[
  term ((605131239721364 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-302565619860682 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1798 for generator 15. -/
theorem ep_Q2_024_partial_15_1798_valid :
    mulPoly ep_Q2_024_coefficient_15_1798
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1798 := by
  native_decide

/-- Coefficient term 1799 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1799 : Poly :=
[
  term ((-9508634603392846177966502182481353962026067706944373129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1799 for generator 15. -/
def ep_Q2_024_partial_15_1799 : Poly :=
[
  term ((-9508634603392846177966502182481353962026067706944373129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((9508634603392846177966502182481353962026067706944373129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1799 for generator 15. -/
theorem ep_Q2_024_partial_15_1799_valid :
    mulPoly ep_Q2_024_coefficient_15_1799
        ep_Q2_024_generator_15_1700_1799 =
      ep_Q2_024_partial_15_1799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1700_1799 : List Poly :=
[
  ep_Q2_024_partial_15_1700,
  ep_Q2_024_partial_15_1701,
  ep_Q2_024_partial_15_1702,
  ep_Q2_024_partial_15_1703,
  ep_Q2_024_partial_15_1704,
  ep_Q2_024_partial_15_1705,
  ep_Q2_024_partial_15_1706,
  ep_Q2_024_partial_15_1707,
  ep_Q2_024_partial_15_1708,
  ep_Q2_024_partial_15_1709,
  ep_Q2_024_partial_15_1710,
  ep_Q2_024_partial_15_1711,
  ep_Q2_024_partial_15_1712,
  ep_Q2_024_partial_15_1713,
  ep_Q2_024_partial_15_1714,
  ep_Q2_024_partial_15_1715,
  ep_Q2_024_partial_15_1716,
  ep_Q2_024_partial_15_1717,
  ep_Q2_024_partial_15_1718,
  ep_Q2_024_partial_15_1719,
  ep_Q2_024_partial_15_1720,
  ep_Q2_024_partial_15_1721,
  ep_Q2_024_partial_15_1722,
  ep_Q2_024_partial_15_1723,
  ep_Q2_024_partial_15_1724,
  ep_Q2_024_partial_15_1725,
  ep_Q2_024_partial_15_1726,
  ep_Q2_024_partial_15_1727,
  ep_Q2_024_partial_15_1728,
  ep_Q2_024_partial_15_1729,
  ep_Q2_024_partial_15_1730,
  ep_Q2_024_partial_15_1731,
  ep_Q2_024_partial_15_1732,
  ep_Q2_024_partial_15_1733,
  ep_Q2_024_partial_15_1734,
  ep_Q2_024_partial_15_1735,
  ep_Q2_024_partial_15_1736,
  ep_Q2_024_partial_15_1737,
  ep_Q2_024_partial_15_1738,
  ep_Q2_024_partial_15_1739,
  ep_Q2_024_partial_15_1740,
  ep_Q2_024_partial_15_1741,
  ep_Q2_024_partial_15_1742,
  ep_Q2_024_partial_15_1743,
  ep_Q2_024_partial_15_1744,
  ep_Q2_024_partial_15_1745,
  ep_Q2_024_partial_15_1746,
  ep_Q2_024_partial_15_1747,
  ep_Q2_024_partial_15_1748,
  ep_Q2_024_partial_15_1749,
  ep_Q2_024_partial_15_1750,
  ep_Q2_024_partial_15_1751,
  ep_Q2_024_partial_15_1752,
  ep_Q2_024_partial_15_1753,
  ep_Q2_024_partial_15_1754,
  ep_Q2_024_partial_15_1755,
  ep_Q2_024_partial_15_1756,
  ep_Q2_024_partial_15_1757,
  ep_Q2_024_partial_15_1758,
  ep_Q2_024_partial_15_1759,
  ep_Q2_024_partial_15_1760,
  ep_Q2_024_partial_15_1761,
  ep_Q2_024_partial_15_1762,
  ep_Q2_024_partial_15_1763,
  ep_Q2_024_partial_15_1764,
  ep_Q2_024_partial_15_1765,
  ep_Q2_024_partial_15_1766,
  ep_Q2_024_partial_15_1767,
  ep_Q2_024_partial_15_1768,
  ep_Q2_024_partial_15_1769,
  ep_Q2_024_partial_15_1770,
  ep_Q2_024_partial_15_1771,
  ep_Q2_024_partial_15_1772,
  ep_Q2_024_partial_15_1773,
  ep_Q2_024_partial_15_1774,
  ep_Q2_024_partial_15_1775,
  ep_Q2_024_partial_15_1776,
  ep_Q2_024_partial_15_1777,
  ep_Q2_024_partial_15_1778,
  ep_Q2_024_partial_15_1779,
  ep_Q2_024_partial_15_1780,
  ep_Q2_024_partial_15_1781,
  ep_Q2_024_partial_15_1782,
  ep_Q2_024_partial_15_1783,
  ep_Q2_024_partial_15_1784,
  ep_Q2_024_partial_15_1785,
  ep_Q2_024_partial_15_1786,
  ep_Q2_024_partial_15_1787,
  ep_Q2_024_partial_15_1788,
  ep_Q2_024_partial_15_1789,
  ep_Q2_024_partial_15_1790,
  ep_Q2_024_partial_15_1791,
  ep_Q2_024_partial_15_1792,
  ep_Q2_024_partial_15_1793,
  ep_Q2_024_partial_15_1794,
  ep_Q2_024_partial_15_1795,
  ep_Q2_024_partial_15_1796,
  ep_Q2_024_partial_15_1797,
  ep_Q2_024_partial_15_1798,
  ep_Q2_024_partial_15_1799
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1700_1799 : Poly :=
[
  term ((-4723321048444112 : Rat) / 1162780221153193) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (9, 2), (14, 1)],
  term ((434111463590540817763695627104046508132 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (12, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (15, 2)],
  term ((103470768511616 : Rat) / 1162780221153193) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 1), (15, 1)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (14, 1)],
  term ((-217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (12, 1)],
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (13, 1), (15, 1)],
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (15, 2)],
  term ((-51735384255808 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)],
  term ((3657403852517734784142922963066020350012 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((-36005277835290932562742034982419307772 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (7, 1), (8, 1), (9, 1), (12, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-6533470024177579627423777802040547685656 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-3737871123862340 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (8, 1), (9, 2), (15, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((375435902577050319323538368868766599732 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-402483137438066043865363750219432362224 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((25429717607873182366080146627296720487705923572425045 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((605131239721364 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9508634603392846177966502182481353962026067706944373129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((212739288644735 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-291132845422495918397189537249233349384 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-4450639425918643724537741739173464761175617579834157878 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((3501168887590402 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 2)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-212739288644735 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((4450639425918643724537741739173464761175617579834157878 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-3501168887590402 : Rat) / 1162780221153193) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (13, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (11, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((393138906611795105837570471987196237848 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-201241568719033021932681875109716181112 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((25429717607873182366080146627296720487705923572425045 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((302565619860682 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52854752464211700109031092002213249708591882599209910489 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((1777894635659307 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-314688800998853570750485392958593183239 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1)],
  term ((3104054888798294421936919070271984383024 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-6213257326497533998434406865439742334811255363356619031 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((1996682019358932 : Rat) / 1162780221153193) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((182848986207008493094695551063545737344 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((22978004305605013703443611528312667958574681665575307023 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((2674381653335285 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((24381871583415222619427240024539885248092857597419037319 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (15, 1)],
  term ((-1235944130217429 : Rat) / 2325560442306386) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (9, 1), (15, 3)],
  term ((136850605782984 : Rat) / 1162780221153193) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((1828701926258867392071461481533010175006 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2)],
  term ((38848461176744809227650352269108384352 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (12, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-2440387447938550487524351948583405367964 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (14, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (15, 1)],
  term ((-838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1274781574709922 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22784920138165596213155044945716392019811615659844258325 : Rat) / 557999371279211891102864058501759538480407853948476828) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3019770354102187 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-711333560106881037673088514204255638276 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 1), (13, 2)],
  term ((48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-99166769400052648715920076472054220285961978579213337647 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (12, 1), (15, 2)],
  term ((-4498162330382319 : Rat) / 1162780221153193) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10746260049841379628739393464068940096509189608682802112 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((1758553647569664 : Rat) / 1162780221153193) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (12, 2), (13, 2)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (12, 2), (15, 2)],
  term ((434461680526322 : Rat) / 1162780221153193) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-147692831174623299862049600133360181051299514932951475561 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((2691620376761295 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-938674662914812 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-57424265761789517429157274509892407275596422915453973627 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (13, 1), (15, 1)],
  term ((318373975502121 : Rat) / 2325560442306386) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((6426933012966323304250535122031470077652149965108493589 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (15, 3)],
  term ((-2813758772819372 : Rat) / 1162780221153193) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-152459042060193964129367162216960464148 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2)],
  term ((-300674504288996855054465443075571371212 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 2), (14, 1)],
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2), (14, 2)],
  term ((478384653334217698047115250416034515034935381738935634 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (13, 2), (15, 2)],
  term ((-1622904756221704 : Rat) / 1162780221153193) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((38583783201407037052245115640108611088 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 3), (15, 1)],
  term ((20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (14, 1), (15, 2)],
  term ((3239154629516277 : Rat) / 1162780221153193) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (15, 2)],
  term ((6359310750251020 : Rat) / 1162780221153193) [(6, 1), (15, 2), (16, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(6, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((582265690844991836794379074498466698768 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (9, 1), (13, 1)],
  term ((8901278851837287449075483478346929522351235159668315756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((-7002337775180804 : Rat) / 1162780221153193) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (9, 2)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(6, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (12, 1), (13, 2)],
  term ((-8901278851837287449075483478346929522351235159668315756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((7002337775180804 : Rat) / 1162780221153193) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-169148534608068318614766785971719853796 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (13, 2)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (9, 1), (11, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-786277813223590211675140943974392475696 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((402483137438066043865363750219432362224 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25429717607873182366080146627296720487705923572425045 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-605131239721364 : Rat) / 1162780221153193) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((52854752464211700109031092002213249708591882599209910489 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-3555789271318614 : Rat) / 1162780221153193) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (12, 2), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (9, 1), (12, 2), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(6, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((629377601997707141500970785917186366478 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 1)],
  term ((-6208109777596588843873838140543968766048 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 1), (14, 2)],
  term ((12426514652995067996868813730879484669622510726713238062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((-3993364038717864 : Rat) / 1162780221153193) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-365697972414016986189391102127091474688 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 2), (15, 1)],
  term ((-22978004305605013703443611528312667958574681665575307023 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((-5348763306670570 : Rat) / 1162780221153193) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (9, 1), (14, 2), (15, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(6, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24381871583415222619427240024539885248092857597419037319 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 2), (9, 1), (15, 1)],
  term ((1235944130217429 : Rat) / 1162780221153193) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (9, 1), (15, 3)],
  term ((-273701211565968 : Rat) / 1162780221153193) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-3657403852517734784142922963066020350012 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 2)],
  term ((-77696922353489618455300704538216768704 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 2), (12, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 2), (13, 1), (15, 1)],
  term ((4880774895877100975048703897166810735928 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 2), (14, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (11, 1), (15, 1)],
  term ((838411973319437252533717745383941150125364404896314437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2549563149419844 : Rat) / 1162780221153193) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22784920138165596213155044945716392019811615659844258325 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((6039540708204374 : Rat) / 1162780221153193) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1422667120213762075346177028408511276552 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (12, 1), (13, 2)],
  term ((-96876846258431121352286131344375397648 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (12, 1), (13, 2), (14, 1)],
  term ((99166769400052648715920076472054220285961978579213337647 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (12, 1), (15, 2)],
  term ((8996324660764638 : Rat) / 1162780221153193) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((21492520099682759257478786928137880193018379217365604224 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (12, 2), (13, 1), (15, 1)],
  term ((-3517107295139328 : Rat) / 1162780221153193) [(6, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(6, 2), (12, 2), (13, 2)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 2), (12, 2), (15, 2)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(6, 2), (12, 2), (15, 2), (16, 1)],
  term ((147692831174623299862049600133360181051299514932951475561 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5383240753522590 : Rat) / 1162780221153193) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7546803947896731422944084549187591818464216977964783022 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((1877349325829624 : Rat) / 1162780221153193) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((57424265761789517429157274509892407275596422915453973627 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 2), (13, 1), (15, 1)],
  term ((-318373975502121 : Rat) / 1162780221153193) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12853866025932646608501070244062940155304299930216987178 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (13, 1), (15, 3)],
  term ((5627517545638744 : Rat) / 1162780221153193) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((304918084120387928258734324433920928296 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 2)],
  term ((601349008577993710108930886151142742424 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (13, 2), (14, 1)],
  term ((38717834506980728124094132443344896016 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 2), (14, 2)],
  term ((-956769306668435396094230500832069030069870763477871268 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (13, 2), (15, 2)],
  term ((3245809512443408 : Rat) / 1162780221153193) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-77167566402814074104490231280217222176 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (13, 3), (15, 1)],
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (14, 1), (15, 2)],
  term ((-6478309259032554 : Rat) / 1162780221153193) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-61029920602251368849062270431084368506816499195006587438 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (15, 2)],
  term ((-12718621500502040 : Rat) / 1162780221153193) [(6, 2), (15, 2), (16, 1)],
  term ((-1828701926258867392071461481533010175006 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1)],
  term ((18002638917645466281371017491209653886 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((3266735012088789813711888901020273842828 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (11, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-187717951288525159661769184434383299866 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((201241568719033021932681875109716181112 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-25429717607873182366080146627296720487705923572425045 : Rat) / 278999685639605945551432029250879769240203926974238414) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-302565619860682 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9508634603392846177966502182481353962026067706944373129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1700 through 1799. -/
theorem ep_Q2_024_block_15_1700_1799_valid :
    checkProductSumEq ep_Q2_024_partials_15_1700_1799
      ep_Q2_024_block_15_1700_1799 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
