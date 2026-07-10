/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 14:0-65

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 14 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_14_0000_0065 : Poly :=
[
  term (2 : Rat) [(4, 1), (12, 1)],
  term (2 : Rat) [(5, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0000 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 0 for generator 14. -/
def ep_Q2_019_partial_14_0000 : Poly :=
[
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem ep_Q2_019_partial_14_0000_valid :
    mulPoly ep_Q2_019_coefficient_14_0000
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0001 : Poly :=
[
  term ((-1991503692640448099595105281255579808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def ep_Q2_019_partial_14_0001 : Poly :=
[
  term ((-3983007385280896199190210562511159616 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-3983007385280896199190210562511159616 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((1991503692640448099595105281255579808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((1991503692640448099595105281255579808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem ep_Q2_019_partial_14_0001_valid :
    mulPoly ep_Q2_019_coefficient_14_0001
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0002 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def ep_Q2_019_partial_14_0002 : Poly :=
[
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem ep_Q2_019_partial_14_0002_valid :
    mulPoly ep_Q2_019_coefficient_14_0002
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0003 : Poly :=
[
  term ((995751846320224049797552640627789904 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def ep_Q2_019_partial_14_0003 : Poly :=
[
  term ((1991503692640448099595105281255579808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((1991503692640448099595105281255579808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-995751846320224049797552640627789904 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 2), (16, 1)],
  term ((-995751846320224049797552640627789904 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem ep_Q2_019_partial_14_0003_valid :
    mulPoly ep_Q2_019_coefficient_14_0003
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0004 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def ep_Q2_019_partial_14_0004 : Poly :=
[
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 1), (5, 1), (13, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 1), (12, 2), (13, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem ep_Q2_019_partial_14_0004_valid :
    mulPoly ep_Q2_019_coefficient_14_0004
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0005 : Poly :=
[
  term ((-1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 14. -/
def ep_Q2_019_partial_14_0005 : Poly :=
[
  term ((-3230857145643922933973926272159353472 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3230857145643922933973926272159353472 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem ep_Q2_019_partial_14_0005_valid :
    mulPoly ep_Q2_019_coefficient_14_0005
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0006 : Poly :=
[
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 6 for generator 14. -/
def ep_Q2_019_partial_14_0006 : Poly :=
[
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (4, 1), (12, 2), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem ep_Q2_019_partial_14_0006_valid :
    mulPoly ep_Q2_019_coefficient_14_0006
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0007 : Poly :=
[
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 7 for generator 14. -/
def ep_Q2_019_partial_14_0007 : Poly :=
[
  term ((544587258157112920715420779061888256 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((544587258157112920715420779061888256 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem ep_Q2_019_partial_14_0007_valid :
    mulPoly ep_Q2_019_coefficient_14_0007
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0008 : Poly :=
[
  term ((-3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 8 for generator 14. -/
def ep_Q2_019_partial_14_0008 : Poly :=
[
  term ((-6896302339548695017707478116744667008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((-6896302339548695017707478116744667008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem ep_Q2_019_partial_14_0008_valid :
    mulPoly ep_Q2_019_coefficient_14_0008
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0009 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 9 for generator 14. -/
def ep_Q2_019_partial_14_0009 : Poly :=
[
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem ep_Q2_019_partial_14_0009_valid :
    mulPoly ep_Q2_019_coefficient_14_0009
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0010 : Poly :=
[
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 14. -/
def ep_Q2_019_partial_14_0010 : Poly :=
[
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem ep_Q2_019_partial_14_0010_valid :
    mulPoly ep_Q2_019_coefficient_14_0010
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0011 : Poly :=
[
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 14. -/
def ep_Q2_019_partial_14_0011 : Poly :=
[
  term ((6319451452163790411357979772513585856 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((6319451452163790411357979772513585856 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem ep_Q2_019_partial_14_0011_valid :
    mulPoly ep_Q2_019_coefficient_14_0011
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0012 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 14. -/
def ep_Q2_019_partial_14_0012 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem ep_Q2_019_partial_14_0012_valid :
    mulPoly ep_Q2_019_coefficient_14_0012
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0013 : Poly :=
[
  term ((-21961963981412721664265655896883696 : Rat) / 894241638896928502822456059496668245) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 14. -/
def ep_Q2_019_partial_14_0013 : Poly :=
[
  term ((-43923927962825443328531311793767392 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-43923927962825443328531311793767392 : Rat) / 894241638896928502822456059496668245) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((21961963981412721664265655896883696 : Rat) / 894241638896928502822456059496668245) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((21961963981412721664265655896883696 : Rat) / 894241638896928502822456059496668245) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem ep_Q2_019_partial_14_0013_valid :
    mulPoly ep_Q2_019_coefficient_14_0013
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0014 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 14. -/
def ep_Q2_019_partial_14_0014 : Poly :=
[
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem ep_Q2_019_partial_14_0014_valid :
    mulPoly ep_Q2_019_coefficient_14_0014
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0015 : Poly :=
[
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 14. -/
def ep_Q2_019_partial_14_0015 : Poly :=
[
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem ep_Q2_019_partial_14_0015_valid :
    mulPoly ep_Q2_019_coefficient_14_0015
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0016 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (16, 1)]
]

/-- Partial product 16 for generator 14. -/
def ep_Q2_019_partial_14_0016 : Poly :=
[
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (12, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem ep_Q2_019_partial_14_0016_valid :
    mulPoly ep_Q2_019_coefficient_14_0016
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0017 : Poly :=
[
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 14. -/
def ep_Q2_019_partial_14_0017 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem ep_Q2_019_partial_14_0017_valid :
    mulPoly ep_Q2_019_coefficient_14_0017
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0018 : Poly :=
[
  term ((-807714286410980733493481568039838368 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 14. -/
def ep_Q2_019_partial_14_0018 : Poly :=
[
  term ((-1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((807714286410980733493481568039838368 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((807714286410980733493481568039838368 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem ep_Q2_019_partial_14_0018_valid :
    mulPoly ep_Q2_019_coefficient_14_0018
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0019 : Poly :=
[
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 19 for generator 14. -/
def ep_Q2_019_partial_14_0019 : Poly :=
[
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (12, 2), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem ep_Q2_019_partial_14_0019_valid :
    mulPoly ep_Q2_019_coefficient_14_0019
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0020 : Poly :=
[
  term ((-37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 20 for generator 14. -/
def ep_Q2_019_partial_14_0020 : Poly :=
[
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(2, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 14. -/
theorem ep_Q2_019_partial_14_0020_valid :
    mulPoly ep_Q2_019_coefficient_14_0020
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0021 : Poly :=
[
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 14. -/
def ep_Q2_019_partial_14_0021 : Poly :=
[
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 14. -/
theorem ep_Q2_019_partial_14_0021_valid :
    mulPoly ep_Q2_019_coefficient_14_0021
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0022 : Poly :=
[
  term ((75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 22 for generator 14. -/
def ep_Q2_019_partial_14_0022 : Poly :=
[
  term ((151203968374790167274266347089689824 : Rat) / 52602449346878147224850356440980485) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((151203968374790167274266347089689824 : Rat) / 52602449346878147224850356440980485) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(2, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 14. -/
theorem ep_Q2_019_partial_14_0022_valid :
    mulPoly ep_Q2_019_coefficient_14_0022
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0023 : Poly :=
[
  term ((1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 14. -/
def ep_Q2_019_partial_14_0023 : Poly :=
[
  term ((3230857145643922933973926272159353472 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((3230857145643922933973926272159353472 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 14. -/
theorem ep_Q2_019_partial_14_0023_valid :
    mulPoly ep_Q2_019_coefficient_14_0023
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0024 : Poly :=
[
  term ((-4882118964531421334544466998578550384 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (16, 1)]
]

/-- Partial product 24 for generator 14. -/
def ep_Q2_019_partial_14_0024 : Poly :=
[
  term ((-9764237929062842669088933997157100768 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-9764237929062842669088933997157100768 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((4882118964531421334544466998578550384 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 2), (16, 1)],
  term ((4882118964531421334544466998578550384 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 14. -/
theorem ep_Q2_019_partial_14_0024_valid :
    mulPoly ep_Q2_019_coefficient_14_0024
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0025 : Poly :=
[
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 25 for generator 14. -/
def ep_Q2_019_partial_14_0025 : Poly :=
[
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (4, 1), (7, 1), (12, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 14. -/
theorem ep_Q2_019_partial_14_0025_valid :
    mulPoly ep_Q2_019_coefficient_14_0025
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0026 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 14. -/
def ep_Q2_019_partial_14_0026 : Poly :=
[
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 14. -/
theorem ep_Q2_019_partial_14_0026_valid :
    mulPoly ep_Q2_019_coefficient_14_0026
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0027 : Poly :=
[
  term ((-144112281834639569911291992991568016 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 27 for generator 14. -/
def ep_Q2_019_partial_14_0027 : Poly :=
[
  term ((-288224563669279139822583985983136032 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((-288224563669279139822583985983136032 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((144112281834639569911291992991568016 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((144112281834639569911291992991568016 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 14. -/
theorem ep_Q2_019_partial_14_0027_valid :
    mulPoly ep_Q2_019_coefficient_14_0027
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0028 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 14. -/
def ep_Q2_019_partial_14_0028 : Poly :=
[
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 14. -/
theorem ep_Q2_019_partial_14_0028_valid :
    mulPoly ep_Q2_019_coefficient_14_0028
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0029 : Poly :=
[
  term ((-37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 14. -/
def ep_Q2_019_partial_14_0029 : Poly :=
[
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(3, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 14. -/
theorem ep_Q2_019_partial_14_0029_valid :
    mulPoly ep_Q2_019_coefficient_14_0029
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0030 : Poly :=
[
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 14. -/
def ep_Q2_019_partial_14_0030 : Poly :=
[
  term ((-544587258157112920715420779061888256 : Rat) / 368217145428147030573952495086863395) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-544587258157112920715420779061888256 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 14. -/
theorem ep_Q2_019_partial_14_0030_valid :
    mulPoly ep_Q2_019_coefficient_14_0030
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0031 : Poly :=
[
  term ((5558757759548014969642364206630895376 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 14. -/
def ep_Q2_019_partial_14_0031 : Poly :=
[
  term ((11117515519096029939284728413261790752 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((11117515519096029939284728413261790752 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5558757759548014969642364206630895376 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5558757759548014969642364206630895376 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 14. -/
theorem ep_Q2_019_partial_14_0031_valid :
    mulPoly ep_Q2_019_coefficient_14_0031
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0032 : Poly :=
[
  term ((1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 32 for generator 14. -/
def ep_Q2_019_partial_14_0032 : Poly :=
[
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 14. -/
theorem ep_Q2_019_partial_14_0032_valid :
    mulPoly ep_Q2_019_coefficient_14_0032
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0033 : Poly :=
[
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 33 for generator 14. -/
def ep_Q2_019_partial_14_0033 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 14. -/
theorem ep_Q2_019_partial_14_0033_valid :
    mulPoly ep_Q2_019_coefficient_14_0033
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0034 : Poly :=
[
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 14. -/
def ep_Q2_019_partial_14_0034 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 14. -/
theorem ep_Q2_019_partial_14_0034_valid :
    mulPoly ep_Q2_019_coefficient_14_0034
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0035 : Poly :=
[
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 14. -/
def ep_Q2_019_partial_14_0035 : Poly :=
[
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 14. -/
theorem ep_Q2_019_partial_14_0035_valid :
    mulPoly ep_Q2_019_coefficient_14_0035
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0036 : Poly :=
[
  term ((27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 36 for generator 14. -/
def ep_Q2_019_partial_14_0036 : Poly :=
[
  term ((54749501375559715929689031690697839648 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((54749501375559715929689031690697839648 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 14. -/
theorem ep_Q2_019_partial_14_0036_valid :
    mulPoly ep_Q2_019_coefficient_14_0036
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0037 : Poly :=
[
  term ((12042160462426280320977533351018524944 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 37 for generator 14. -/
def ep_Q2_019_partial_14_0037 : Poly :=
[
  term ((24084320924852560641955066702037049888 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((24084320924852560641955066702037049888 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12042160462426280320977533351018524944 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-12042160462426280320977533351018524944 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 14. -/
theorem ep_Q2_019_partial_14_0037_valid :
    mulPoly ep_Q2_019_coefficient_14_0037
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0038 : Poly :=
[
  term ((-13687375343889928982422257922674459912 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (16, 1)]
]

/-- Partial product 38 for generator 14. -/
def ep_Q2_019_partial_14_0038 : Poly :=
[
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((13687375343889928982422257922674459912 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (12, 2), (16, 1)],
  term ((13687375343889928982422257922674459912 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 14. -/
theorem ep_Q2_019_partial_14_0038_valid :
    mulPoly ep_Q2_019_coefficient_14_0038
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0039 : Poly :=
[
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (16, 1)]
]

/-- Partial product 39 for generator 14. -/
def ep_Q2_019_partial_14_0039 : Poly :=
[
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 2), (12, 1), (16, 1)],
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (12, 2), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 14. -/
theorem ep_Q2_019_partial_14_0039_valid :
    mulPoly ep_Q2_019_coefficient_14_0039
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0040 : Poly :=
[
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 14. -/
def ep_Q2_019_partial_14_0040 : Poly :=
[
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 14. -/
theorem ep_Q2_019_partial_14_0040_valid :
    mulPoly ep_Q2_019_coefficient_14_0040
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0041 : Poly :=
[
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 14. -/
def ep_Q2_019_partial_14_0041 : Poly :=
[
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 14. -/
theorem ep_Q2_019_partial_14_0041_valid :
    mulPoly ep_Q2_019_coefficient_14_0041
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0042 : Poly :=
[
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 42 for generator 14. -/
def ep_Q2_019_partial_14_0042 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 14. -/
theorem ep_Q2_019_partial_14_0042_valid :
    mulPoly ep_Q2_019_coefficient_14_0042
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0043 : Poly :=
[
  term ((11463536500634347842717398773265268672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 14. -/
def ep_Q2_019_partial_14_0043 : Poly :=
[
  term ((22927073001268695685434797546530537344 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((22927073001268695685434797546530537344 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-11463536500634347842717398773265268672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-11463536500634347842717398773265268672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 14. -/
theorem ep_Q2_019_partial_14_0043_valid :
    mulPoly ep_Q2_019_coefficient_14_0043
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0044 : Poly :=
[
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 14. -/
def ep_Q2_019_partial_14_0044 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 14. -/
theorem ep_Q2_019_partial_14_0044_valid :
    mulPoly ep_Q2_019_coefficient_14_0044
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0045 : Poly :=
[
  term ((789931431520473801419747471564198232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 14. -/
def ep_Q2_019_partial_14_0045 : Poly :=
[
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-789931431520473801419747471564198232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-789931431520473801419747471564198232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 14. -/
theorem ep_Q2_019_partial_14_0045_valid :
    mulPoly ep_Q2_019_coefficient_14_0045
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0046 : Poly :=
[
  term ((-2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(7, 2), (16, 1)]
]

/-- Partial product 46 for generator 14. -/
def ep_Q2_019_partial_14_0046 : Poly :=
[
  term ((-4863119912579257305704370444044992704 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-4863119912579257305704370444044992704 : Rat) / 894241638896928502822456059496668245) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(7, 2), (12, 2), (16, 1)],
  term ((2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 14. -/
theorem ep_Q2_019_partial_14_0046_valid :
    mulPoly ep_Q2_019_coefficient_14_0046
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0047 : Poly :=
[
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 47 for generator 14. -/
def ep_Q2_019_partial_14_0047 : Poly :=
[
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 14. -/
theorem ep_Q2_019_partial_14_0047_valid :
    mulPoly ep_Q2_019_coefficient_14_0047
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0048 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 14. -/
def ep_Q2_019_partial_14_0048 : Poly :=
[
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 14. -/
theorem ep_Q2_019_partial_14_0048_valid :
    mulPoly ep_Q2_019_coefficient_14_0048
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0049 : Poly :=
[
  term ((3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 49 for generator 14. -/
def ep_Q2_019_partial_14_0049 : Poly :=
[
  term ((6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 14. -/
theorem ep_Q2_019_partial_14_0049_valid :
    mulPoly ep_Q2_019_coefficient_14_0049
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0050 : Poly :=
[
  term ((-3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 50 for generator 14. -/
def ep_Q2_019_partial_14_0050 : Poly :=
[
  term ((-6319451452163790411357979772513585856 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6319451452163790411357979772513585856 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 14. -/
theorem ep_Q2_019_partial_14_0050_valid :
    mulPoly ep_Q2_019_coefficient_14_0050
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0051 : Poly :=
[
  term ((29160927495685670685099326915139777868 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (16, 1)]
]

/-- Partial product 51 for generator 14. -/
def ep_Q2_019_partial_14_0051 : Poly :=
[
  term ((58321854991371341370198653830279555736 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((58321854991371341370198653830279555736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-29160927495685670685099326915139777868 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 2), (16, 1)],
  term ((-29160927495685670685099326915139777868 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 14. -/
theorem ep_Q2_019_partial_14_0051_valid :
    mulPoly ep_Q2_019_coefficient_14_0051
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0052 : Poly :=
[
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (16, 1)]
]

/-- Partial product 52 for generator 14. -/
def ep_Q2_019_partial_14_0052 : Poly :=
[
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 2), (12, 1), (16, 1)],
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (12, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 14. -/
theorem ep_Q2_019_partial_14_0052_valid :
    mulPoly ep_Q2_019_coefficient_14_0052
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0053 : Poly :=
[
  term ((124221310267800340593472010795957153482 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 14. -/
def ep_Q2_019_partial_14_0053 : Poly :=
[
  term ((248442620535600681186944021591914306964 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((248442620535600681186944021591914306964 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124221310267800340593472010795957153482 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124221310267800340593472010795957153482 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 14. -/
theorem ep_Q2_019_partial_14_0053_valid :
    mulPoly ep_Q2_019_coefficient_14_0053
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0054 : Poly :=
[
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 14. -/
def ep_Q2_019_partial_14_0054 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 14. -/
theorem ep_Q2_019_partial_14_0054_valid :
    mulPoly ep_Q2_019_coefficient_14_0054
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0055 : Poly :=
[
  term ((13881781669489229780783279607443407164 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 14. -/
def ep_Q2_019_partial_14_0055 : Poly :=
[
  term ((27763563338978459561566559214886814328 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((27763563338978459561566559214886814328 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13881781669489229780783279607443407164 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-13881781669489229780783279607443407164 : Rat) / 6259691472278499519757192416476677715) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 14. -/
theorem ep_Q2_019_partial_14_0055_valid :
    mulPoly ep_Q2_019_coefficient_14_0055
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0056 : Poly :=
[
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 56 for generator 14. -/
def ep_Q2_019_partial_14_0056 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 14. -/
theorem ep_Q2_019_partial_14_0056_valid :
    mulPoly ep_Q2_019_coefficient_14_0056
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0057 : Poly :=
[
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (16, 1)]
]

/-- Partial product 57 for generator 14. -/
def ep_Q2_019_partial_14_0057 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (13, 2), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 14. -/
theorem ep_Q2_019_partial_14_0057_valid :
    mulPoly ep_Q2_019_coefficient_14_0057
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0058 : Poly :=
[
  term ((-1602081303462819895015842764055141894 : Rat) / 894241638896928502822456059496668245) [(12, 2), (16, 1)]
]

/-- Partial product 58 for generator 14. -/
def ep_Q2_019_partial_14_0058 : Poly :=
[
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(4, 1), (12, 3), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((1602081303462819895015842764055141894 : Rat) / 894241638896928502822456059496668245) [(12, 2), (13, 2), (16, 1)],
  term ((1602081303462819895015842764055141894 : Rat) / 894241638896928502822456059496668245) [(12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 14. -/
theorem ep_Q2_019_partial_14_0058_valid :
    mulPoly ep_Q2_019_coefficient_14_0058
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0059 : Poly :=
[
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 14. -/
def ep_Q2_019_partial_14_0059 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 14. -/
theorem ep_Q2_019_partial_14_0059_valid :
    mulPoly ep_Q2_019_coefficient_14_0059
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0060 : Poly :=
[
  term ((-1602081303462819895015842764055141894 : Rat) / 894241638896928502822456059496668245) [(13, 2), (16, 1)]
]

/-- Partial product 60 for generator 14. -/
def ep_Q2_019_partial_14_0060 : Poly :=
[
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(5, 1), (13, 3), (16, 1)],
  term ((1602081303462819895015842764055141894 : Rat) / 894241638896928502822456059496668245) [(12, 2), (13, 2), (16, 1)],
  term ((1602081303462819895015842764055141894 : Rat) / 894241638896928502822456059496668245) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 14. -/
theorem ep_Q2_019_partial_14_0060_valid :
    mulPoly ep_Q2_019_coefficient_14_0060
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0061 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 14. -/
def ep_Q2_019_partial_14_0061 : Poly :=
[
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 14. -/
theorem ep_Q2_019_partial_14_0061_valid :
    mulPoly ep_Q2_019_coefficient_14_0061
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0062 : Poly :=
[
  term ((-488189338678110352475446222970263966 : Rat) / 73643429085629406114790499017372679) [(14, 1), (16, 1)]
]

/-- Partial product 62 for generator 14. -/
def ep_Q2_019_partial_14_0062 : Poly :=
[
  term ((-976378677356220704950892445940527932 : Rat) / 73643429085629406114790499017372679) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-976378677356220704950892445940527932 : Rat) / 73643429085629406114790499017372679) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((488189338678110352475446222970263966 : Rat) / 73643429085629406114790499017372679) [(12, 2), (14, 1), (16, 1)],
  term ((488189338678110352475446222970263966 : Rat) / 73643429085629406114790499017372679) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 14. -/
theorem ep_Q2_019_partial_14_0062_valid :
    mulPoly ep_Q2_019_coefficient_14_0062
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0063 : Poly :=
[
  term ((17094713157980497498877038178657158704 : Rat) / 6259691472278499519757192416476677715) [(14, 2), (16, 1)]
]

/-- Partial product 63 for generator 14. -/
def ep_Q2_019_partial_14_0063 : Poly :=
[
  term ((34189426315960994997754076357314317408 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((34189426315960994997754076357314317408 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17094713157980497498877038178657158704 : Rat) / 6259691472278499519757192416476677715) [(12, 2), (14, 2), (16, 1)],
  term ((-17094713157980497498877038178657158704 : Rat) / 6259691472278499519757192416476677715) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 14. -/
theorem ep_Q2_019_partial_14_0063_valid :
    mulPoly ep_Q2_019_coefficient_14_0063
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0064 : Poly :=
[
  term ((17378493160583597375078779760100046608 : Rat) / 6259691472278499519757192416476677715) [(15, 2), (16, 1)]
]

/-- Partial product 64 for generator 14. -/
def ep_Q2_019_partial_14_0064 : Poly :=
[
  term ((34756986321167194750157559520200093216 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((34756986321167194750157559520200093216 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17378493160583597375078779760100046608 : Rat) / 6259691472278499519757192416476677715) [(12, 2), (15, 2), (16, 1)],
  term ((-17378493160583597375078779760100046608 : Rat) / 6259691472278499519757192416476677715) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 14. -/
theorem ep_Q2_019_partial_14_0064_valid :
    mulPoly ep_Q2_019_coefficient_14_0064
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 14. -/
def ep_Q2_019_coefficient_14_0065 : Poly :=
[
  term ((2695829606160482867462974854150513696 : Rat) / 6259691472278499519757192416476677715) [(16, 1)]
]

/-- Partial product 65 for generator 14. -/
def ep_Q2_019_partial_14_0065 : Poly :=
[
  term ((5391659212320965734925949708301027392 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 1), (16, 1)],
  term ((5391659212320965734925949708301027392 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (16, 1)],
  term ((-2695829606160482867462974854150513696 : Rat) / 6259691472278499519757192416476677715) [(12, 2), (16, 1)],
  term ((-2695829606160482867462974854150513696 : Rat) / 6259691472278499519757192416476677715) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 14. -/
theorem ep_Q2_019_partial_14_0065_valid :
    mulPoly ep_Q2_019_coefficient_14_0065
        ep_Q2_019_generator_14_0000_0065 =
      ep_Q2_019_partial_14_0065 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_14_0000_0065 : List Poly :=
[
  ep_Q2_019_partial_14_0000,
  ep_Q2_019_partial_14_0001,
  ep_Q2_019_partial_14_0002,
  ep_Q2_019_partial_14_0003,
  ep_Q2_019_partial_14_0004,
  ep_Q2_019_partial_14_0005,
  ep_Q2_019_partial_14_0006,
  ep_Q2_019_partial_14_0007,
  ep_Q2_019_partial_14_0008,
  ep_Q2_019_partial_14_0009,
  ep_Q2_019_partial_14_0010,
  ep_Q2_019_partial_14_0011,
  ep_Q2_019_partial_14_0012,
  ep_Q2_019_partial_14_0013,
  ep_Q2_019_partial_14_0014,
  ep_Q2_019_partial_14_0015,
  ep_Q2_019_partial_14_0016,
  ep_Q2_019_partial_14_0017,
  ep_Q2_019_partial_14_0018,
  ep_Q2_019_partial_14_0019,
  ep_Q2_019_partial_14_0020,
  ep_Q2_019_partial_14_0021,
  ep_Q2_019_partial_14_0022,
  ep_Q2_019_partial_14_0023,
  ep_Q2_019_partial_14_0024,
  ep_Q2_019_partial_14_0025,
  ep_Q2_019_partial_14_0026,
  ep_Q2_019_partial_14_0027,
  ep_Q2_019_partial_14_0028,
  ep_Q2_019_partial_14_0029,
  ep_Q2_019_partial_14_0030,
  ep_Q2_019_partial_14_0031,
  ep_Q2_019_partial_14_0032,
  ep_Q2_019_partial_14_0033,
  ep_Q2_019_partial_14_0034,
  ep_Q2_019_partial_14_0035,
  ep_Q2_019_partial_14_0036,
  ep_Q2_019_partial_14_0037,
  ep_Q2_019_partial_14_0038,
  ep_Q2_019_partial_14_0039,
  ep_Q2_019_partial_14_0040,
  ep_Q2_019_partial_14_0041,
  ep_Q2_019_partial_14_0042,
  ep_Q2_019_partial_14_0043,
  ep_Q2_019_partial_14_0044,
  ep_Q2_019_partial_14_0045,
  ep_Q2_019_partial_14_0046,
  ep_Q2_019_partial_14_0047,
  ep_Q2_019_partial_14_0048,
  ep_Q2_019_partial_14_0049,
  ep_Q2_019_partial_14_0050,
  ep_Q2_019_partial_14_0051,
  ep_Q2_019_partial_14_0052,
  ep_Q2_019_partial_14_0053,
  ep_Q2_019_partial_14_0054,
  ep_Q2_019_partial_14_0055,
  ep_Q2_019_partial_14_0056,
  ep_Q2_019_partial_14_0057,
  ep_Q2_019_partial_14_0058,
  ep_Q2_019_partial_14_0059,
  ep_Q2_019_partial_14_0060,
  ep_Q2_019_partial_14_0061,
  ep_Q2_019_partial_14_0062,
  ep_Q2_019_partial_14_0063,
  ep_Q2_019_partial_14_0064,
  ep_Q2_019_partial_14_0065
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_14_0000_0065 : Poly :=
[
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-3983007385280896199190210562511159616 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((1991503692640448099595105281255579808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3983007385280896199190210562511159616 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((1991503692640448099595105281255579808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((1991503692640448099595105281255579808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((1991503692640448099595105281255579808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-995751846320224049797552640627789904 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 3), (16, 1)],
  term ((-995751846320224049797552640627789904 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (13, 2), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3230857145643922933973926272159353472 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3230857145643922933973926272159353472 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 1), (5, 1), (13, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 1), (12, 2), (13, 1), (16, 1)],
  term ((1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 1), (13, 3), (16, 1)],
  term ((544587258157112920715420779061888256 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6896302339548695017707478116744667008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (4, 1), (12, 2), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((544587258157112920715420779061888256 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6896302339548695017707478116744667008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (12, 2), (14, 1), (16, 1)],
  term ((3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (12, 3), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((6319451452163790411357979772513585856 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((-43923927962825443328531311793767392 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((6319451452163790411357979772513585856 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43923927962825443328531311793767392 : Rat) / 894241638896928502822456059496668245) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((21961963981412721664265655896883696 : Rat) / 894241638896928502822456059496668245) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((21961963981412721664265655896883696 : Rat) / 894241638896928502822456059496668245) [(1, 1), (13, 3), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((151203968374790167274266347089689824 : Rat) / 52602449346878147224850356440980485) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((3230857145643922933973926272159353472 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9764237929062842669088933997157100768 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((151203968374790167274266347089689824 : Rat) / 52602449346878147224850356440980485) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((3230857145643922933973926272159353472 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9764237929062842669088933997157100768 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (12, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((807714286410980733493481568039838368 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((807714286410980733493481568039838368 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 1), (7, 1), (13, 3), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (12, 2), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((4882118964531421334544466998578550384 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 2), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(2, 1), (12, 3), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1615428572821961466986963136079676736 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((4882118964531421334544466998578550384 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (13, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (4, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-288224563669279139822583985983136032 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (4, 1), (7, 1), (12, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (4, 1), (7, 1), (12, 2), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(3, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-544587258157112920715420779061888256 : Rat) / 368217145428147030573952495086863395) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11117515519096029939284728413261790752 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288224563669279139822583985983136032 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-544587258157112920715420779061888256 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11117515519096029939284728413261790752 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((144112281834639569911291992991568016 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (12, 3), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((144112281834639569911291992991568016 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5558757759548014969642364206630895376 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5558757759548014969642364206630895376 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(3, 1), (13, 3), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((54749501375559715929689031690697839648 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((24084320924852560641955066702037049888 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 2), (12, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((22927073001268695685434797546530537344 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4863119912579257305704370444044992704 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 2), (12, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6319451452163790411357979772513585856 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((58321854991371341370198653830279555736 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 2), (12, 1), (16, 1)],
  term ((248442620535600681186944021591914306964 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-976378677356220704950892445940527932 : Rat) / 73643429085629406114790499017372679) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((34189426315960994997754076357314317408 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((34756986321167194750157559520200093216 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((5391659212320965734925949708301027392 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 1), (16, 1)],
  term ((27763563338978459561566559214886814328 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (12, 2), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(4, 1), (12, 3), (16, 1)],
  term ((54749501375559715929689031690697839648 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((24084320924852560641955066702037049888 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((22927073001268695685434797546530537344 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-4863119912579257305704370444044992704 : Rat) / 894241638896928502822456059496668245) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6319451452163790411357979772513585856 : Rat) / 1251938294455699903951438483295335543) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((58321854991371341370198653830279555736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((272293629078556460357710389530944128 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-26091349276280512451695885830493703232 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((248442620535600681186944021591914306964 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((27763563338978459561566559214886814328 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-976378677356220704950892445940527932 : Rat) / 73643429085629406114790499017372679) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((34189426315960994997754076357314317408 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((34756986321167194750157559520200093216 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((5391659212320965734925949708301027392 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (16, 1)],
  term ((290845012265336416374316669586191578346 : Rat) / 341779154386406073778742705939626603239) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(5, 1), (13, 3), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-27374750687779857964844515845348919824 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-12042160462426280320977533351018524944 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((13687375343889928982422257922674459912 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (12, 2), (16, 1)],
  term ((-12042160462426280320977533351018524944 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (12, 3), (16, 1)],
  term ((13687375343889928982422257922674459912 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (13, 2), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (12, 2), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (13, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1579862863040947602839494943128396464 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (13, 3), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-11463536500634347842717398773265268672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-789931431520473801419747471564198232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-789931431520473801419747471564198232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11463536500634347842717398773265268672 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 3), (16, 1)],
  term ((2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(7, 2), (12, 2), (16, 1)],
  term ((2431559956289628652852185222022496352 : Rat) / 894241638896928502822456059496668245) [(7, 2), (13, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-29160927495685670685099326915139777868 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 3), (16, 1)],
  term ((-3348922772775357555761044804987332108 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((3159725726081895205678989886256792928 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-29160927495685670685099326915139777868 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (13, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (12, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(8, 2), (13, 2), (16, 1)],
  term ((-124221310267800340593472010795957153482 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124221310267800340593472010795957153482 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13881781669489229780783279607443407164 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (13, 2), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(12, 2), (13, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((488189338678110352475446222970263966 : Rat) / 73643429085629406114790499017372679) [(12, 2), (14, 1), (16, 1)],
  term ((-17094713157980497498877038178657158704 : Rat) / 6259691472278499519757192416476677715) [(12, 2), (14, 2), (16, 1)],
  term ((-17378493160583597375078779760100046608 : Rat) / 6259691472278499519757192416476677715) [(12, 2), (15, 2), (16, 1)],
  term ((-2695829606160482867462974854150513696 : Rat) / 6259691472278499519757192416476677715) [(12, 2), (16, 1)],
  term ((-13881781669489229780783279607443407164 : Rat) / 6259691472278499519757192416476677715) [(12, 3), (14, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 3), (15, 2), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(12, 3), (16, 1)],
  term ((1602081303462819895015842764055141894 : Rat) / 894241638896928502822456059496668245) [(12, 4), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((488189338678110352475446222970263966 : Rat) / 73643429085629406114790499017372679) [(13, 2), (14, 1), (16, 1)],
  term ((-17094713157980497498877038178657158704 : Rat) / 6259691472278499519757192416476677715) [(13, 2), (14, 2), (16, 1)],
  term ((-17378493160583597375078779760100046608 : Rat) / 6259691472278499519757192416476677715) [(13, 2), (15, 2), (16, 1)],
  term ((-2695829606160482867462974854150513696 : Rat) / 6259691472278499519757192416476677715) [(13, 2), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(13, 3), (15, 1), (16, 1)],
  term ((1602081303462819895015842764055141894 : Rat) / 894241638896928502822456059496668245) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 65. -/
theorem ep_Q2_019_block_14_0000_0065_valid :
    checkProductSumEq ep_Q2_019_partials_14_0000_0065
      ep_Q2_019_block_14_0000_0065 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
