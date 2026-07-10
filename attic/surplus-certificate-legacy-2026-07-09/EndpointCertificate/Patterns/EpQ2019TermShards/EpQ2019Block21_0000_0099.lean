/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 21:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_21_0000_0099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0000 : Poly :=
[
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (9, 1), (16, 1)]
]

/-- Partial product 0 for generator 21. -/
def ep_Q2_019_partial_21_0000 : Poly :=
[
  term ((-3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (16, 1)],
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem ep_Q2_019_partial_21_0000_valid :
    mulPoly ep_Q2_019_coefficient_21_0000
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0001 : Poly :=
[
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 21. -/
def ep_Q2_019_partial_21_0001 : Poly :=
[
  term ((3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem ep_Q2_019_partial_21_0001_valid :
    mulPoly ep_Q2_019_coefficient_21_0001
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0002 : Poly :=
[
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (8, 1), (16, 1)]
]

/-- Partial product 2 for generator 21. -/
def ep_Q2_019_partial_21_0002 : Poly :=
[
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem ep_Q2_019_partial_21_0002_valid :
    mulPoly ep_Q2_019_coefficient_21_0002
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0003 : Poly :=
[
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 3 for generator 21. -/
def ep_Q2_019_partial_21_0003 : Poly :=
[
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem ep_Q2_019_partial_21_0003_valid :
    mulPoly ep_Q2_019_coefficient_21_0003
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0004 : Poly :=
[
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 4 for generator 21. -/
def ep_Q2_019_partial_21_0004 : Poly :=
[
  term ((-31801960447097154752938829111284982784 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem ep_Q2_019_partial_21_0004_valid :
    mulPoly ep_Q2_019_coefficient_21_0004
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0005 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 5 for generator 21. -/
def ep_Q2_019_partial_21_0005 : Poly :=
[
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem ep_Q2_019_partial_21_0005_valid :
    mulPoly ep_Q2_019_coefficient_21_0005
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0006 : Poly :=
[
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (16, 1)]
]

/-- Partial product 6 for generator 21. -/
def ep_Q2_019_partial_21_0006 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem ep_Q2_019_partial_21_0006_valid :
    mulPoly ep_Q2_019_coefficient_21_0006
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0007 : Poly :=
[
  term ((-3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 7 for generator 21. -/
def ep_Q2_019_partial_21_0007 : Poly :=
[
  term ((-7348042602875127049570476477660932608 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem ep_Q2_019_partial_21_0007_valid :
    mulPoly ep_Q2_019_coefficient_21_0007
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0008 : Poly :=
[
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 21. -/
def ep_Q2_019_partial_21_0008 : Poly :=
[
  term ((-3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem ep_Q2_019_partial_21_0008_valid :
    mulPoly ep_Q2_019_coefficient_21_0008
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0009 : Poly :=
[
  term ((-4960887406866786956460040554636042066336 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 9 for generator 21. -/
def ep_Q2_019_partial_21_0009 : Poly :=
[
  term ((-9921774813733573912920081109272084132672 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((4960887406866786956460040554636042066336 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem ep_Q2_019_partial_21_0009_valid :
    mulPoly ep_Q2_019_coefficient_21_0009
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0010 : Poly :=
[
  term ((539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 21. -/
def ep_Q2_019_partial_21_0010 : Poly :=
[
  term ((1079766871041753129303394965480048642108 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem ep_Q2_019_partial_21_0010_valid :
    mulPoly ep_Q2_019_coefficient_21_0010
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0011 : Poly :=
[
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 11 for generator 21. -/
def ep_Q2_019_partial_21_0011 : Poly :=
[
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem ep_Q2_019_partial_21_0011_valid :
    mulPoly ep_Q2_019_coefficient_21_0011
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0012 : Poly :=
[
  term ((7088905591365913938519324284981157184484 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (1, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 21. -/
def ep_Q2_019_partial_21_0012 : Poly :=
[
  term ((14177811182731827877038648569962314368968 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-7088905591365913938519324284981157184484 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem ep_Q2_019_partial_21_0012_valid :
    mulPoly ep_Q2_019_coefficient_21_0012
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0013 : Poly :=
[
  term ((2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 21. -/
def ep_Q2_019_partial_21_0013 : Poly :=
[
  term ((-2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((4954673923093612385589630088686293225376 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem ep_Q2_019_partial_21_0013_valid :
    mulPoly ep_Q2_019_coefficient_21_0013
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0014 : Poly :=
[
  term ((-269941717760438282325848741370012160527 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 21. -/
def ep_Q2_019_partial_21_0014 : Poly :=
[
  term ((269941717760438282325848741370012160527 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem ep_Q2_019_partial_21_0014_valid :
    mulPoly ep_Q2_019_coefficient_21_0014
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0015 : Poly :=
[
  term ((258720116428612861948290029132381904 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 15 for generator 21. -/
def ep_Q2_019_partial_21_0015 : Poly :=
[
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-258720116428612861948290029132381904 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem ep_Q2_019_partial_21_0015_valid :
    mulPoly ep_Q2_019_coefficient_21_0015
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0016 : Poly :=
[
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 21. -/
def ep_Q2_019_partial_21_0016 : Poly :=
[
  term ((3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem ep_Q2_019_partial_21_0016_valid :
    mulPoly ep_Q2_019_coefficient_21_0016
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0017 : Poly :=
[
  term ((17080513032731465289052170251476364592 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 21. -/
def ep_Q2_019_partial_21_0017 : Poly :=
[
  term ((34161026065462930578104340502952729184 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-17080513032731465289052170251476364592 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem ep_Q2_019_partial_21_0017_valid :
    mulPoly ep_Q2_019_coefficient_21_0017
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0018 : Poly :=
[
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 21. -/
def ep_Q2_019_partial_21_0018 : Poly :=
[
  term ((-1034880465714451447793160116529527616 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem ep_Q2_019_partial_21_0018_valid :
    mulPoly ep_Q2_019_coefficient_21_0018
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0019 : Poly :=
[
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 19 for generator 21. -/
def ep_Q2_019_partial_21_0019 : Poly :=
[
  term ((20885659741763263429951146049575936 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem ep_Q2_019_partial_21_0019_valid :
    mulPoly ep_Q2_019_coefficient_21_0019
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0020 : Poly :=
[
  term ((747033733282917433036177687690524258744 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 21. -/
def ep_Q2_019_partial_21_0020 : Poly :=
[
  term ((1494067466565834866072355375381048517488 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-747033733282917433036177687690524258744 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem ep_Q2_019_partial_21_0020_valid :
    mulPoly ep_Q2_019_coefficient_21_0020
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0021 : Poly :=
[
  term ((-995649613955539213203954510949854899696 : Rat) / 18779074416835498559271577249430033145) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 21. -/
def ep_Q2_019_partial_21_0021 : Poly :=
[
  term ((-1991299227911078426407909021899709799392 : Rat) / 18779074416835498559271577249430033145) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((995649613955539213203954510949854899696 : Rat) / 18779074416835498559271577249430033145) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem ep_Q2_019_partial_21_0021_valid :
    mulPoly ep_Q2_019_coefficient_21_0021
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0022 : Poly :=
[
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 22 for generator 21. -/
def ep_Q2_019_partial_21_0022 : Poly :=
[
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem ep_Q2_019_partial_21_0022_valid :
    mulPoly ep_Q2_019_coefficient_21_0022
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0023 : Poly :=
[
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 21. -/
def ep_Q2_019_partial_21_0023 : Poly :=
[
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem ep_Q2_019_partial_21_0023_valid :
    mulPoly ep_Q2_019_coefficient_21_0023
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0024 : Poly :=
[
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 24 for generator 21. -/
def ep_Q2_019_partial_21_0024 : Poly :=
[
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem ep_Q2_019_partial_21_0024_valid :
    mulPoly ep_Q2_019_coefficient_21_0024
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0025 : Poly :=
[
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 21. -/
def ep_Q2_019_partial_21_0025 : Poly :=
[
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem ep_Q2_019_partial_21_0025_valid :
    mulPoly ep_Q2_019_coefficient_21_0025
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0026 : Poly :=
[
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 26 for generator 21. -/
def ep_Q2_019_partial_21_0026 : Poly :=
[
  term ((-16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem ep_Q2_019_partial_21_0026_valid :
    mulPoly ep_Q2_019_coefficient_21_0026
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0027 : Poly :=
[
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 21. -/
def ep_Q2_019_partial_21_0027 : Poly :=
[
  term ((16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem ep_Q2_019_partial_21_0027_valid :
    mulPoly ep_Q2_019_coefficient_21_0027
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0028 : Poly :=
[
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 21. -/
def ep_Q2_019_partial_21_0028 : Poly :=
[
  term ((-2013892584045852491207875902954955456 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 21. -/
theorem ep_Q2_019_partial_21_0028_valid :
    mulPoly ep_Q2_019_coefficient_21_0028
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0029 : Poly :=
[
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 21. -/
def ep_Q2_019_partial_21_0029 : Poly :=
[
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 21. -/
theorem ep_Q2_019_partial_21_0029_valid :
    mulPoly ep_Q2_019_coefficient_21_0029
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0030 : Poly :=
[
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 21. -/
def ep_Q2_019_partial_21_0030 : Poly :=
[
  term ((-629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 21. -/
theorem ep_Q2_019_partial_21_0030_valid :
    mulPoly ep_Q2_019_coefficient_21_0030
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0031 : Poly :=
[
  term ((154937465888717311257224682791381170552604 : Rat) / 5126687315796091106681140589094399048585) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 21. -/
def ep_Q2_019_partial_21_0031 : Poly :=
[
  term ((309874931777434622514449365582762341105208 : Rat) / 5126687315796091106681140589094399048585) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-154937465888717311257224682791381170552604 : Rat) / 5126687315796091106681140589094399048585) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 21. -/
theorem ep_Q2_019_partial_21_0031_valid :
    mulPoly ep_Q2_019_coefficient_21_0031
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0032 : Poly :=
[
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(0, 1), (2, 1), (9, 2), (16, 1)]
]

/-- Partial product 32 for generator 21. -/
def ep_Q2_019_partial_21_0032 : Poly :=
[
  term ((5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(0, 1), (2, 1), (9, 2), (10, 1), (16, 1)],
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(0, 1), (2, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 21. -/
theorem ep_Q2_019_partial_21_0032_valid :
    mulPoly ep_Q2_019_coefficient_21_0032
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0033 : Poly :=
[
  term ((2960158199138913171771585705760888432 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 21. -/
def ep_Q2_019_partial_21_0033 : Poly :=
[
  term ((5920316398277826343543171411521776864 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2960158199138913171771585705760888432 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 21. -/
theorem ep_Q2_019_partial_21_0033_valid :
    mulPoly ep_Q2_019_coefficient_21_0033
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0034 : Poly :=
[
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 34 for generator 21. -/
def ep_Q2_019_partial_21_0034 : Poly :=
[
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 21. -/
theorem ep_Q2_019_partial_21_0034_valid :
    mulPoly ep_Q2_019_coefficient_21_0034
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0035 : Poly :=
[
  term ((314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 21. -/
def ep_Q2_019_partial_21_0035 : Poly :=
[
  term ((629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 21. -/
theorem ep_Q2_019_partial_21_0035_valid :
    mulPoly ep_Q2_019_coefficient_21_0035
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0036 : Poly :=
[
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (14, 1), (16, 1)]
]

/-- Partial product 36 for generator 21. -/
def ep_Q2_019_partial_21_0036 : Poly :=
[
  term ((-13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 21. -/
theorem ep_Q2_019_partial_21_0036_valid :
    mulPoly ep_Q2_019_coefficient_21_0036
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0037 : Poly :=
[
  term ((-5750941452021769507780907605639885074412 : Rat) / 81375989139620493756843501414196810295) [(0, 1), (2, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 21. -/
def ep_Q2_019_partial_21_0037 : Poly :=
[
  term ((-11501882904043539015561815211279770148824 : Rat) / 81375989139620493756843501414196810295) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((5750941452021769507780907605639885074412 : Rat) / 81375989139620493756843501414196810295) [(0, 1), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 21. -/
theorem ep_Q2_019_partial_21_0037_valid :
    mulPoly ep_Q2_019_coefficient_21_0037
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0038 : Poly :=
[
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 38 for generator 21. -/
def ep_Q2_019_partial_21_0038 : Poly :=
[
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 21. -/
theorem ep_Q2_019_partial_21_0038_valid :
    mulPoly ep_Q2_019_coefficient_21_0038
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0039 : Poly :=
[
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 21. -/
def ep_Q2_019_partial_21_0039 : Poly :=
[
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 21. -/
theorem ep_Q2_019_partial_21_0039_valid :
    mulPoly ep_Q2_019_coefficient_21_0039
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0040 : Poly :=
[
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 21. -/
def ep_Q2_019_partial_21_0040 : Poly :=
[
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 21. -/
theorem ep_Q2_019_partial_21_0040_valid :
    mulPoly ep_Q2_019_coefficient_21_0040
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0041 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 21. -/
def ep_Q2_019_partial_21_0041 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 21. -/
theorem ep_Q2_019_partial_21_0041_valid :
    mulPoly ep_Q2_019_coefficient_21_0041
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0042 : Poly :=
[
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 42 for generator 21. -/
def ep_Q2_019_partial_21_0042 : Poly :=
[
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 21. -/
theorem ep_Q2_019_partial_21_0042_valid :
    mulPoly ep_Q2_019_coefficient_21_0042
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0043 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 21. -/
def ep_Q2_019_partial_21_0043 : Poly :=
[
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 21. -/
theorem ep_Q2_019_partial_21_0043_valid :
    mulPoly ep_Q2_019_coefficient_21_0043
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0044 : Poly :=
[
  term ((-720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 44 for generator 21. -/
def ep_Q2_019_partial_21_0044 : Poly :=
[
  term ((-1441130114941631249262935854914341994448 : Rat) / 10658393587933661344451435736162991785) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 21. -/
theorem ep_Q2_019_partial_21_0044_valid :
    mulPoly ep_Q2_019_coefficient_21_0044
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0045 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 21. -/
def ep_Q2_019_partial_21_0045 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 21. -/
theorem ep_Q2_019_partial_21_0045_valid :
    mulPoly ep_Q2_019_coefficient_21_0045
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0046 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 21. -/
def ep_Q2_019_partial_21_0046 : Poly :=
[
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 21. -/
theorem ep_Q2_019_partial_21_0046_valid :
    mulPoly ep_Q2_019_coefficient_21_0046
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0047 : Poly :=
[
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 47 for generator 21. -/
def ep_Q2_019_partial_21_0047 : Poly :=
[
  term ((1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 21. -/
theorem ep_Q2_019_partial_21_0047_valid :
    mulPoly ep_Q2_019_coefficient_21_0047
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0048 : Poly :=
[
  term ((1577338677419964938909410642674417248512 : Rat) / 23197680161973262926159007190472393885) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 21. -/
def ep_Q2_019_partial_21_0048 : Poly :=
[
  term ((3154677354839929877818821285348834497024 : Rat) / 23197680161973262926159007190472393885) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1577338677419964938909410642674417248512 : Rat) / 23197680161973262926159007190472393885) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 21. -/
theorem ep_Q2_019_partial_21_0048_valid :
    mulPoly ep_Q2_019_coefficient_21_0048
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0049 : Poly :=
[
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 49 for generator 21. -/
def ep_Q2_019_partial_21_0049 : Poly :=
[
  term ((213829147697446740888389801616717888 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 21. -/
theorem ep_Q2_019_partial_21_0049_valid :
    mulPoly ep_Q2_019_coefficient_21_0049
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0050 : Poly :=
[
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 50 for generator 21. -/
def ep_Q2_019_partial_21_0050 : Poly :=
[
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 21. -/
theorem ep_Q2_019_partial_21_0050_valid :
    mulPoly ep_Q2_019_coefficient_21_0050
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0051 : Poly :=
[
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 21. -/
def ep_Q2_019_partial_21_0051 : Poly :=
[
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 21. -/
theorem ep_Q2_019_partial_21_0051_valid :
    mulPoly ep_Q2_019_coefficient_21_0051
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0052 : Poly :=
[
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 52 for generator 21. -/
def ep_Q2_019_partial_21_0052 : Poly :=
[
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 21. -/
theorem ep_Q2_019_partial_21_0052_valid :
    mulPoly ep_Q2_019_coefficient_21_0052
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0053 : Poly :=
[
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 53 for generator 21. -/
def ep_Q2_019_partial_21_0053 : Poly :=
[
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 21. -/
theorem ep_Q2_019_partial_21_0053_valid :
    mulPoly ep_Q2_019_coefficient_21_0053
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0054 : Poly :=
[
  term ((-113921434441657677433562266040985287504 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 54 for generator 21. -/
def ep_Q2_019_partial_21_0054 : Poly :=
[
  term ((-227842868883315354867124532081970575008 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((113921434441657677433562266040985287504 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 21. -/
theorem ep_Q2_019_partial_21_0054_valid :
    mulPoly ep_Q2_019_coefficient_21_0054
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0055 : Poly :=
[
  term ((931844625979963237889089884437263278422 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 21. -/
def ep_Q2_019_partial_21_0055 : Poly :=
[
  term ((1863689251959926475778179768874526556844 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-931844625979963237889089884437263278422 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 21. -/
theorem ep_Q2_019_partial_21_0055_valid :
    mulPoly ep_Q2_019_coefficient_21_0055
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0056 : Poly :=
[
  term ((-2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 56 for generator 21. -/
def ep_Q2_019_partial_21_0056 : Poly :=
[
  term ((-5688220129156081842208453035711239424 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 21. -/
theorem ep_Q2_019_partial_21_0056_valid :
    mulPoly ep_Q2_019_coefficient_21_0056
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0057 : Poly :=
[
  term ((1524913171736652649561270286880679399136 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 21. -/
def ep_Q2_019_partial_21_0057 : Poly :=
[
  term ((3049826343473305299122540573761358798272 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1524913171736652649561270286880679399136 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 21. -/
theorem ep_Q2_019_partial_21_0057_valid :
    mulPoly ep_Q2_019_coefficient_21_0057
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0058 : Poly :=
[
  term ((-2314268492046970318836105914648166892411 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 21. -/
def ep_Q2_019_partial_21_0058 : Poly :=
[
  term ((-4628536984093940637672211829296333784822 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2314268492046970318836105914648166892411 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 21. -/
theorem ep_Q2_019_partial_21_0058_valid :
    mulPoly ep_Q2_019_coefficient_21_0058
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0059 : Poly :=
[
  term ((-3808151454781969056659877553645891597632 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 21. -/
def ep_Q2_019_partial_21_0059 : Poly :=
[
  term ((-7616302909563938113319755107291783195264 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3808151454781969056659877553645891597632 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 21. -/
theorem ep_Q2_019_partial_21_0059_valid :
    mulPoly ep_Q2_019_coefficient_21_0059
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0060 : Poly :=
[
  term ((-18943077496088198276367340015955982576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 60 for generator 21. -/
def ep_Q2_019_partial_21_0060 : Poly :=
[
  term ((-37886154992176396552734680031911965152 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((18943077496088198276367340015955982576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 21. -/
theorem ep_Q2_019_partial_21_0060_valid :
    mulPoly ep_Q2_019_coefficient_21_0060
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0061 : Poly :=
[
  term ((253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 21. -/
def ep_Q2_019_partial_21_0061 : Poly :=
[
  term ((507128089843386252724116258436170864924 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 21. -/
theorem ep_Q2_019_partial_21_0061_valid :
    mulPoly ep_Q2_019_coefficient_21_0061
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0062 : Poly :=
[
  term ((4842657712770814205998168557592592176 : Rat) / 515504003599405842803533493121608753) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 62 for generator 21. -/
def ep_Q2_019_partial_21_0062 : Poly :=
[
  term ((9685315425541628411996337115185184352 : Rat) / 515504003599405842803533493121608753) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((-4842657712770814205998168557592592176 : Rat) / 515504003599405842803533493121608753) [(0, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 21. -/
theorem ep_Q2_019_partial_21_0062_valid :
    mulPoly ep_Q2_019_coefficient_21_0062
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0063 : Poly :=
[
  term ((-925922356364715092796291239441190048 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 63 for generator 21. -/
def ep_Q2_019_partial_21_0063 : Poly :=
[
  term ((-1851844712729430185592582478882380096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((925922356364715092796291239441190048 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 21. -/
theorem ep_Q2_019_partial_21_0063_valid :
    mulPoly ep_Q2_019_coefficient_21_0063
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0064 : Poly :=
[
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 64 for generator 21. -/
def ep_Q2_019_partial_21_0064 : Poly :=
[
  term ((3550017554808201398460482056019801943168 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 21. -/
theorem ep_Q2_019_partial_21_0064_valid :
    mulPoly ep_Q2_019_coefficient_21_0064
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0065 : Poly :=
[
  term ((-2031024607280445521143060119112052075511 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 21. -/
def ep_Q2_019_partial_21_0065 : Poly :=
[
  term ((-4062049214560891042286120238224104151022 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2031024607280445521143060119112052075511 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 21. -/
theorem ep_Q2_019_partial_21_0065_valid :
    mulPoly ep_Q2_019_coefficient_21_0065
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0066 : Poly :=
[
  term ((925922356364715092796291239441190048 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 66 for generator 21. -/
def ep_Q2_019_partial_21_0066 : Poly :=
[
  term ((-925922356364715092796291239441190048 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((1851844712729430185592582478882380096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 21. -/
theorem ep_Q2_019_partial_21_0066_valid :
    mulPoly ep_Q2_019_coefficient_21_0066
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0067 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 21. -/
def ep_Q2_019_partial_21_0067 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 21. -/
theorem ep_Q2_019_partial_21_0067_valid :
    mulPoly ep_Q2_019_coefficient_21_0067
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0068 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 21. -/
def ep_Q2_019_partial_21_0068 : Poly :=
[
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 21. -/
theorem ep_Q2_019_partial_21_0068_valid :
    mulPoly ep_Q2_019_coefficient_21_0068
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0069 : Poly :=
[
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 69 for generator 21. -/
def ep_Q2_019_partial_21_0069 : Poly :=
[
  term ((-5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 21. -/
theorem ep_Q2_019_partial_21_0069_valid :
    mulPoly ep_Q2_019_coefficient_21_0069
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0070 : Poly :=
[
  term ((200627829419952005442216552103854279624 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 70 for generator 21. -/
def ep_Q2_019_partial_21_0070 : Poly :=
[
  term ((401255658839904010884433104207708559248 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-200627829419952005442216552103854279624 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 21. -/
theorem ep_Q2_019_partial_21_0070_valid :
    mulPoly ep_Q2_019_coefficient_21_0070
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0071 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 71 for generator 21. -/
def ep_Q2_019_partial_21_0071 : Poly :=
[
  term ((-769612413105665019457609919098680823040 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 21. -/
theorem ep_Q2_019_partial_21_0071_valid :
    mulPoly ep_Q2_019_coefficient_21_0071
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0072 : Poly :=
[
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 21. -/
def ep_Q2_019_partial_21_0072 : Poly :=
[
  term ((-741648245990769512846588699893436429888 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 21. -/
theorem ep_Q2_019_partial_21_0072_valid :
    mulPoly ep_Q2_019_coefficient_21_0072
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0073 : Poly :=
[
  term ((-740695090430416417918444581976780902096 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 21. -/
def ep_Q2_019_partial_21_0073 : Poly :=
[
  term ((740695090430416417918444581976780902096 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1481390180860832835836889163953561804192 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 21. -/
theorem ep_Q2_019_partial_21_0073_valid :
    mulPoly ep_Q2_019_coefficient_21_0073
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0074 : Poly :=
[
  term ((-647139555477465700606320410417364982956 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 21. -/
def ep_Q2_019_partial_21_0074 : Poly :=
[
  term ((647139555477465700606320410417364982956 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1294279110954931401212640820834729965912 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 21. -/
theorem ep_Q2_019_partial_21_0074_valid :
    mulPoly ep_Q2_019_coefficient_21_0074
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0075 : Poly :=
[
  term ((-30017008797849207236049429733778649744 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 75 for generator 21. -/
def ep_Q2_019_partial_21_0075 : Poly :=
[
  term ((-60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((30017008797849207236049429733778649744 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 21. -/
theorem ep_Q2_019_partial_21_0075_valid :
    mulPoly ep_Q2_019_coefficient_21_0075
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0076 : Poly :=
[
  term ((1268058924019857683004428359608919392 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 76 for generator 21. -/
def ep_Q2_019_partial_21_0076 : Poly :=
[
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1268058924019857683004428359608919392 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 21. -/
theorem ep_Q2_019_partial_21_0076_valid :
    mulPoly ep_Q2_019_coefficient_21_0076
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0077 : Poly :=
[
  term ((-329837437490406090455755527841318106272 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 77 for generator 21. -/
def ep_Q2_019_partial_21_0077 : Poly :=
[
  term ((-659674874980812180911511055682636212544 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((329837437490406090455755527841318106272 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 21. -/
theorem ep_Q2_019_partial_21_0077_valid :
    mulPoly ep_Q2_019_coefficient_21_0077
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0078 : Poly :=
[
  term ((60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 21. -/
def ep_Q2_019_partial_21_0078 : Poly :=
[
  term ((120068035191396828944197718935114598976 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 21. -/
theorem ep_Q2_019_partial_21_0078_valid :
    mulPoly ep_Q2_019_coefficient_21_0078
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0079 : Poly :=
[
  term ((-241102106160410148985878155236375373928 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 79 for generator 21. -/
def ep_Q2_019_partial_21_0079 : Poly :=
[
  term ((-482204212320820297971756310472750747856 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((241102106160410148985878155236375373928 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 21. -/
theorem ep_Q2_019_partial_21_0079_valid :
    mulPoly ep_Q2_019_coefficient_21_0079
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0080 : Poly :=
[
  term ((-833617750979050670210106801076740396574 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 21. -/
def ep_Q2_019_partial_21_0080 : Poly :=
[
  term ((-1667235501958101340420213602153480793148 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((833617750979050670210106801076740396574 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 21. -/
theorem ep_Q2_019_partial_21_0080_valid :
    mulPoly ep_Q2_019_coefficient_21_0080
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0081 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (10, 1), (16, 1)]
]

/-- Partial product 81 for generator 21. -/
def ep_Q2_019_partial_21_0081 : Poly :=
[
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 21. -/
theorem ep_Q2_019_partial_21_0081_valid :
    mulPoly ep_Q2_019_coefficient_21_0081
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0082 : Poly :=
[
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (16, 1)]
]

/-- Partial product 82 for generator 21. -/
def ep_Q2_019_partial_21_0082 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 21. -/
theorem ep_Q2_019_partial_21_0082_valid :
    mulPoly ep_Q2_019_coefficient_21_0082
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0083 : Poly :=
[
  term ((308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 83 for generator 21. -/
def ep_Q2_019_partial_21_0083 : Poly :=
[
  term ((617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 21. -/
theorem ep_Q2_019_partial_21_0083_valid :
    mulPoly ep_Q2_019_coefficient_21_0083
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0084 : Poly :=
[
  term ((-591669592468033566410080342669966990528 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 84 for generator 21. -/
def ep_Q2_019_partial_21_0084 : Poly :=
[
  term ((-1183339184936067132820160685339933981056 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((591669592468033566410080342669966990528 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 21. -/
theorem ep_Q2_019_partial_21_0084_valid :
    mulPoly ep_Q2_019_coefficient_21_0084
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0085 : Poly :=
[
  term ((168540247033081982192053069071916565145 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 21. -/
def ep_Q2_019_partial_21_0085 : Poly :=
[
  term ((337080494066163964384106138143833130290 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-168540247033081982192053069071916565145 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 21. -/
theorem ep_Q2_019_partial_21_0085_valid :
    mulPoly ep_Q2_019_coefficient_21_0085
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0086 : Poly :=
[
  term ((1147188478339105128277978426975043047936 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 86 for generator 21. -/
def ep_Q2_019_partial_21_0086 : Poly :=
[
  term ((2294376956678210256555956853950086095872 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1147188478339105128277978426975043047936 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 21. -/
theorem ep_Q2_019_partial_21_0086_valid :
    mulPoly ep_Q2_019_coefficient_21_0086
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0087 : Poly :=
[
  term ((3367557268215264465637669693514350910893 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 21. -/
def ep_Q2_019_partial_21_0087 : Poly :=
[
  term ((3367557268215264465637669693514350910893 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3367557268215264465637669693514350910893 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 21. -/
theorem ep_Q2_019_partial_21_0087_valid :
    mulPoly ep_Q2_019_coefficient_21_0087
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0088 : Poly :=
[
  term ((2074840857720543133494003358015988979936 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 21. -/
def ep_Q2_019_partial_21_0088 : Poly :=
[
  term ((4149681715441086266988006716031977959872 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2074840857720543133494003358015988979936 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 21. -/
theorem ep_Q2_019_partial_21_0088_valid :
    mulPoly ep_Q2_019_coefficient_21_0088
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0089 : Poly :=
[
  term ((7167436139481974015213884049007094384 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 89 for generator 21. -/
def ep_Q2_019_partial_21_0089 : Poly :=
[
  term ((14334872278963948030427768098014188768 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-7167436139481974015213884049007094384 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 21. -/
theorem ep_Q2_019_partial_21_0089_valid :
    mulPoly ep_Q2_019_coefficient_21_0089
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0090 : Poly :=
[
  term ((-5219952239657868707502842402737497470214 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 90 for generator 21. -/
def ep_Q2_019_partial_21_0090 : Poly :=
[
  term ((-10439904479315737415005684805474994940428 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((5219952239657868707502842402737497470214 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 21. -/
theorem ep_Q2_019_partial_21_0090_valid :
    mulPoly ep_Q2_019_coefficient_21_0090
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0091 : Poly :=
[
  term ((-77160196363726257733024269953432504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 91 for generator 21. -/
def ep_Q2_019_partial_21_0091 : Poly :=
[
  term ((-154320392727452515466048539906865008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((77160196363726257733024269953432504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 21. -/
theorem ep_Q2_019_partial_21_0091_valid :
    mulPoly ep_Q2_019_coefficient_21_0091
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0092 : Poly :=
[
  term ((-1147188478339105128277978426975043047936 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 92 for generator 21. -/
def ep_Q2_019_partial_21_0092 : Poly :=
[
  term ((1147188478339105128277978426975043047936 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2294376956678210256555956853950086095872 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 21. -/
theorem ep_Q2_019_partial_21_0092_valid :
    mulPoly ep_Q2_019_coefficient_21_0092
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0093 : Poly :=
[
  term ((-724776431526159116826994593991993887561 : Rat) / 17527136122379798655320138766134697602) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 21. -/
def ep_Q2_019_partial_21_0093 : Poly :=
[
  term ((724776431526159116826994593991993887561 : Rat) / 17527136122379798655320138766134697602) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-724776431526159116826994593991993887561 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 21. -/
theorem ep_Q2_019_partial_21_0093_valid :
    mulPoly ep_Q2_019_coefficient_21_0093
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0094 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 21. -/
def ep_Q2_019_partial_21_0094 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 21. -/
theorem ep_Q2_019_partial_21_0094_valid :
    mulPoly ep_Q2_019_coefficient_21_0094
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0095 : Poly :=
[
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 95 for generator 21. -/
def ep_Q2_019_partial_21_0095 : Poly :=
[
  term ((-617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 21. -/
theorem ep_Q2_019_partial_21_0095_valid :
    mulPoly ep_Q2_019_coefficient_21_0095
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0096 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 96 for generator 21. -/
def ep_Q2_019_partial_21_0096 : Poly :=
[
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 21. -/
theorem ep_Q2_019_partial_21_0096_valid :
    mulPoly ep_Q2_019_coefficient_21_0096
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0097 : Poly :=
[
  term ((-2038917681219258057076068024245954077547 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 97 for generator 21. -/
def ep_Q2_019_partial_21_0097 : Poly :=
[
  term ((-4077835362438516114152136048491908155094 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2038917681219258057076068024245954077547 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 21. -/
theorem ep_Q2_019_partial_21_0097_valid :
    mulPoly ep_Q2_019_coefficient_21_0097
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0098 : Poly :=
[
  term ((14209007027036917207113778357628648809772 : Rat) / 244127967418861481270530504242590430885) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 21. -/
def ep_Q2_019_partial_21_0098 : Poly :=
[
  term ((28418014054073834414227556715257297619544 : Rat) / 244127967418861481270530504242590430885) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14209007027036917207113778357628648809772 : Rat) / 244127967418861481270530504242590430885) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 21. -/
theorem ep_Q2_019_partial_21_0098_valid :
    mulPoly ep_Q2_019_coefficient_21_0098
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0099 : Poly :=
[
  term ((-138453435323614904372576267871049951328 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 99 for generator 21. -/
def ep_Q2_019_partial_21_0099 : Poly :=
[
  term ((-276906870647229808745152535742099902656 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((138453435323614904372576267871049951328 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 21. -/
theorem ep_Q2_019_partial_21_0099_valid :
    mulPoly ep_Q2_019_coefficient_21_0099
        ep_Q2_019_generator_21_0000_0099 =
      ep_Q2_019_partial_21_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_21_0000_0099 : List Poly :=
[
  ep_Q2_019_partial_21_0000,
  ep_Q2_019_partial_21_0001,
  ep_Q2_019_partial_21_0002,
  ep_Q2_019_partial_21_0003,
  ep_Q2_019_partial_21_0004,
  ep_Q2_019_partial_21_0005,
  ep_Q2_019_partial_21_0006,
  ep_Q2_019_partial_21_0007,
  ep_Q2_019_partial_21_0008,
  ep_Q2_019_partial_21_0009,
  ep_Q2_019_partial_21_0010,
  ep_Q2_019_partial_21_0011,
  ep_Q2_019_partial_21_0012,
  ep_Q2_019_partial_21_0013,
  ep_Q2_019_partial_21_0014,
  ep_Q2_019_partial_21_0015,
  ep_Q2_019_partial_21_0016,
  ep_Q2_019_partial_21_0017,
  ep_Q2_019_partial_21_0018,
  ep_Q2_019_partial_21_0019,
  ep_Q2_019_partial_21_0020,
  ep_Q2_019_partial_21_0021,
  ep_Q2_019_partial_21_0022,
  ep_Q2_019_partial_21_0023,
  ep_Q2_019_partial_21_0024,
  ep_Q2_019_partial_21_0025,
  ep_Q2_019_partial_21_0026,
  ep_Q2_019_partial_21_0027,
  ep_Q2_019_partial_21_0028,
  ep_Q2_019_partial_21_0029,
  ep_Q2_019_partial_21_0030,
  ep_Q2_019_partial_21_0031,
  ep_Q2_019_partial_21_0032,
  ep_Q2_019_partial_21_0033,
  ep_Q2_019_partial_21_0034,
  ep_Q2_019_partial_21_0035,
  ep_Q2_019_partial_21_0036,
  ep_Q2_019_partial_21_0037,
  ep_Q2_019_partial_21_0038,
  ep_Q2_019_partial_21_0039,
  ep_Q2_019_partial_21_0040,
  ep_Q2_019_partial_21_0041,
  ep_Q2_019_partial_21_0042,
  ep_Q2_019_partial_21_0043,
  ep_Q2_019_partial_21_0044,
  ep_Q2_019_partial_21_0045,
  ep_Q2_019_partial_21_0046,
  ep_Q2_019_partial_21_0047,
  ep_Q2_019_partial_21_0048,
  ep_Q2_019_partial_21_0049,
  ep_Q2_019_partial_21_0050,
  ep_Q2_019_partial_21_0051,
  ep_Q2_019_partial_21_0052,
  ep_Q2_019_partial_21_0053,
  ep_Q2_019_partial_21_0054,
  ep_Q2_019_partial_21_0055,
  ep_Q2_019_partial_21_0056,
  ep_Q2_019_partial_21_0057,
  ep_Q2_019_partial_21_0058,
  ep_Q2_019_partial_21_0059,
  ep_Q2_019_partial_21_0060,
  ep_Q2_019_partial_21_0061,
  ep_Q2_019_partial_21_0062,
  ep_Q2_019_partial_21_0063,
  ep_Q2_019_partial_21_0064,
  ep_Q2_019_partial_21_0065,
  ep_Q2_019_partial_21_0066,
  ep_Q2_019_partial_21_0067,
  ep_Q2_019_partial_21_0068,
  ep_Q2_019_partial_21_0069,
  ep_Q2_019_partial_21_0070,
  ep_Q2_019_partial_21_0071,
  ep_Q2_019_partial_21_0072,
  ep_Q2_019_partial_21_0073,
  ep_Q2_019_partial_21_0074,
  ep_Q2_019_partial_21_0075,
  ep_Q2_019_partial_21_0076,
  ep_Q2_019_partial_21_0077,
  ep_Q2_019_partial_21_0078,
  ep_Q2_019_partial_21_0079,
  ep_Q2_019_partial_21_0080,
  ep_Q2_019_partial_21_0081,
  ep_Q2_019_partial_21_0082,
  ep_Q2_019_partial_21_0083,
  ep_Q2_019_partial_21_0084,
  ep_Q2_019_partial_21_0085,
  ep_Q2_019_partial_21_0086,
  ep_Q2_019_partial_21_0087,
  ep_Q2_019_partial_21_0088,
  ep_Q2_019_partial_21_0089,
  ep_Q2_019_partial_21_0090,
  ep_Q2_019_partial_21_0091,
  ep_Q2_019_partial_21_0092,
  ep_Q2_019_partial_21_0093,
  ep_Q2_019_partial_21_0094,
  ep_Q2_019_partial_21_0095,
  ep_Q2_019_partial_21_0096,
  ep_Q2_019_partial_21_0097,
  ep_Q2_019_partial_21_0098,
  ep_Q2_019_partial_21_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_21_0000_0099 : Poly :=
[
  term ((-3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1), (16, 1)],
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (9, 1), (16, 1)],
  term ((3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-31801960447097154752938829111284982784 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (8, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-7348042602875127049570476477660932608 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (9, 1), (16, 1)],
  term ((-3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9921774813733573912920081109272084132672 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((1079766871041753129303394965480048642108 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((4960887406866786956460040554636042066336 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((13984925064406355791987423562423714888008 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-7088905591365913938519324284981157184484 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((34161026065462930578104340502952729184 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1034880465714451447793160116529527616 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((20885659741763263429951146049575936 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-196653898996194265344491933792419619040 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-581762872292410279409860707808693305167 : Rat) / 7732560053991087642053002396824131295) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((4954673923093612385589630088686293225376 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-258720116428612861948290029132381904 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-17080513032731465289052170251476364592 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-747033733282917433036177687690524258744 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((995649613955539213203954510949854899696 : Rat) / 18779074416835498559271577249430033145) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (9, 1), (16, 1)],
  term ((16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2013892584045852491207875902954955456 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((309874931777434622514449365582762341105208 : Rat) / 5126687315796091106681140589094399048585) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-154937465888717311257224682791381170552604 : Rat) / 5126687315796091106681140589094399048585) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(0, 1), (2, 1), (9, 2), (10, 1), (16, 1)],
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(0, 1), (2, 1), (9, 2), (16, 1)],
  term ((5920316398277826343543171411521776864 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11501882904043539015561815211279770148824 : Rat) / 81375989139620493756843501414196810295) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2960158199138913171771585705760888432 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((5750941452021769507780907605639885074412 : Rat) / 81375989139620493756843501414196810295) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1441130114941631249262935854914341994448 : Rat) / 10658393587933661344451435736162991785) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(0, 1), (3, 1), (9, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (13, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((3154677354839929877818821285348834497024 : Rat) / 23197680161973262926159007190472393885) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term ((-1577338677419964938909410642674417248512 : Rat) / 23197680161973262926159007190472393885) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((213829147697446740888389801616717888 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-227842868883315354867124532081970575008 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1863689251959926475778179768874526556844 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((113921434441657677433562266040985287504 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-931844625979963237889089884437263278422 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5688220129156081842208453035711239424 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((3049826343473305299122540573761358798272 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4628536984093940637672211829296333784822 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7616302909563938113319755107291783195264 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37886154992176396552734680031911965152 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((507128089843386252724116258436170864924 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((9685315425541628411996337115185184352 : Rat) / 515504003599405842803533493121608753) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((-1524913171736652649561270286880679399136 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((2314268492046970318836105914648166892411 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3808151454781969056659877553645891597632 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((18943077496088198276367340015955982576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-4842657712770814205998168557592592176 : Rat) / 515504003599405842803533493121608753) [(0, 1), (6, 1), (16, 1)],
  term ((-1851844712729430185592582478882380096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((3550017554808201398460482056019801943168 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4062049214560891042286120238224104151022 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((925922356364715092796291239441190048 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((2031024607280445521143060119112052075511 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((1999796837704967048772591482362454465904 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((1851844712729430185592582478882380096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-200627829419952005442216552103854279624 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((-769612413105665019457609919098680823040 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-741648245990769512846588699893436429888 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-659674874980812180911511055682636212544 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((120068035191396828944197718935114598976 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((7385453660274174855619664900115147264 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8572234844375089410200783123832905968 : Rat) / 368217145428147030573952495086863395) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1481390180860832835836889163953561804192 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1294279110954931401212640820834729965912 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((30017008797849207236049429733778649744 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1268058924019857683004428359608919392 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((329837437490406090455755527841318106272 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((-60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((241102106160410148985878155236375373928 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((833617750979050670210106801076740396574 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (10, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (16, 1)],
  term ((617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1183339184936067132820160685339933981056 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((337080494066163964384106138143833130290 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((591669592468033566410080342669966990528 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-168540247033081982192053069071916565145 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2294376956678210256555956853950086095872 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3367557268215264465637669693514350910893 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4149681715441086266988006716031977959872 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14334872278963948030427768098014188768 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10439904479315737415005684805474994940428 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-154320392727452515466048539906865008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1147188478339105128277978426975043047936 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3367557268215264465637669693514350910893 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2074840857720543133494003358015988979936 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7167436139481974015213884049007094384 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((5219952239657868707502842402737497470214 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((77160196363726257733024269953432504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4077835362438516114152136048491908155094 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((28418014054073834414227556715257297619544 : Rat) / 244127967418861481270530504242590430885) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-276906870647229808745152535742099902656 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1147188478339105128277978426975043047936 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((724776431526159116826994593991993887561 : Rat) / 17527136122379798655320138766134697602) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2294376956678210256555956853950086095872 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-724776431526159116826994593991993887561 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2038917681219258057076068024245954077547 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term ((-14209007027036917207113778357628648809772 : Rat) / 244127967418861481270530504242590430885) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((138453435323614904372576267871049951328 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 99. -/
theorem ep_Q2_019_block_21_0000_0099_valid :
    checkProductSumEq ep_Q2_019_partials_21_0000_0099
      ep_Q2_019_block_21_0000_0099 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
