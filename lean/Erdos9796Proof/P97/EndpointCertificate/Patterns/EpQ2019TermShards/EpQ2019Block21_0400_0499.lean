/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 21:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_21_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0400 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 21. -/
def ep_Q2_019_partial_21_0400 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 21. -/
theorem ep_Q2_019_partial_21_0400_valid :
    mulPoly ep_Q2_019_coefficient_21_0400
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0401 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 401 for generator 21. -/
def ep_Q2_019_partial_21_0401 : Poly :=
[
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 21. -/
theorem ep_Q2_019_partial_21_0401_valid :
    mulPoly ep_Q2_019_coefficient_21_0401
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0402 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 21. -/
def ep_Q2_019_partial_21_0402 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 21. -/
theorem ep_Q2_019_partial_21_0402_valid :
    mulPoly ep_Q2_019_coefficient_21_0402
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0403 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 403 for generator 21. -/
def ep_Q2_019_partial_21_0403 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 21. -/
theorem ep_Q2_019_partial_21_0403_valid :
    mulPoly ep_Q2_019_coefficient_21_0403
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0404 : Poly :=
[
  term ((973009972387472517216814927034449016272 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 21. -/
def ep_Q2_019_partial_21_0404 : Poly :=
[
  term ((1946019944774945034433629854068898032544 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-973009972387472517216814927034449016272 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 21. -/
theorem ep_Q2_019_partial_21_0404_valid :
    mulPoly ep_Q2_019_coefficient_21_0404
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0405 : Poly :=
[
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 21. -/
def ep_Q2_019_partial_21_0405 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 21. -/
theorem ep_Q2_019_partial_21_0405_valid :
    mulPoly ep_Q2_019_coefficient_21_0405
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0406 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 406 for generator 21. -/
def ep_Q2_019_partial_21_0406 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(4, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 21. -/
theorem ep_Q2_019_partial_21_0406_valid :
    mulPoly ep_Q2_019_coefficient_21_0406
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0407 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 21. -/
def ep_Q2_019_partial_21_0407 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 21. -/
theorem ep_Q2_019_partial_21_0407_valid :
    mulPoly ep_Q2_019_coefficient_21_0407
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0408 : Poly :=
[
  term ((-6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 408 for generator 21. -/
def ep_Q2_019_partial_21_0408 : Poly :=
[
  term ((-13395691091101430223044179219949328432 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 21. -/
theorem ep_Q2_019_partial_21_0408_valid :
    mulPoly ep_Q2_019_coefficient_21_0408
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0409 : Poly :=
[
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 21. -/
def ep_Q2_019_partial_21_0409 : Poly :=
[
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 21. -/
theorem ep_Q2_019_partial_21_0409_valid :
    mulPoly ep_Q2_019_coefficient_21_0409
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0410 : Poly :=
[
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 410 for generator 21. -/
def ep_Q2_019_partial_21_0410 : Poly :=
[
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 21. -/
theorem ep_Q2_019_partial_21_0410_valid :
    mulPoly ep_Q2_019_coefficient_21_0410
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0411 : Poly :=
[
  term ((27025204005239713386443896043061245551748 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 411 for generator 21. -/
def ep_Q2_019_partial_21_0411 : Poly :=
[
  term ((54050408010479426772887792086122491103496 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-27025204005239713386443896043061245551748 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 21. -/
theorem ep_Q2_019_partial_21_0411_valid :
    mulPoly ep_Q2_019_coefficient_21_0411
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0412 : Poly :=
[
  term ((645025072871534759082745821959534076 : Rat) / 178848327779385700564491211899333649) [(4, 1), (14, 2), (16, 1)]
]

/-- Partial product 412 for generator 21. -/
def ep_Q2_019_partial_21_0412 : Poly :=
[
  term ((1290050145743069518165491643919068152 : Rat) / 178848327779385700564491211899333649) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-645025072871534759082745821959534076 : Rat) / 178848327779385700564491211899333649) [(4, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 21. -/
theorem ep_Q2_019_partial_21_0412_valid :
    mulPoly ep_Q2_019_coefficient_21_0412
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0413 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 413 for generator 21. -/
def ep_Q2_019_partial_21_0413 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 21. -/
theorem ep_Q2_019_partial_21_0413_valid :
    mulPoly ep_Q2_019_coefficient_21_0413
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0414 : Poly :=
[
  term ((-62526501526749451087883020814257032 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 21. -/
def ep_Q2_019_partial_21_0414 : Poly :=
[
  term ((-125053003053498902175766041628514064 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((62526501526749451087883020814257032 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 21. -/
theorem ep_Q2_019_partial_21_0414_valid :
    mulPoly ep_Q2_019_coefficient_21_0414
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0415 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 415 for generator 21. -/
def ep_Q2_019_partial_21_0415 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 21. -/
theorem ep_Q2_019_partial_21_0415_valid :
    mulPoly ep_Q2_019_coefficient_21_0415
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0416 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 416 for generator 21. -/
def ep_Q2_019_partial_21_0416 : Poly :=
[
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 21. -/
theorem ep_Q2_019_partial_21_0416_valid :
    mulPoly ep_Q2_019_coefficient_21_0416
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0417 : Poly :=
[
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 417 for generator 21. -/
def ep_Q2_019_partial_21_0417 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 21. -/
theorem ep_Q2_019_partial_21_0417_valid :
    mulPoly ep_Q2_019_coefficient_21_0417
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0418 : Poly :=
[
  term ((17623747615809039201792401816796368 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 418 for generator 21. -/
def ep_Q2_019_partial_21_0418 : Poly :=
[
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-17623747615809039201792401816796368 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 21. -/
theorem ep_Q2_019_partial_21_0418_valid :
    mulPoly ep_Q2_019_coefficient_21_0418
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0419 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 419 for generator 21. -/
def ep_Q2_019_partial_21_0419 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 21. -/
theorem ep_Q2_019_partial_21_0419_valid :
    mulPoly ep_Q2_019_coefficient_21_0419
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0420 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 420 for generator 21. -/
def ep_Q2_019_partial_21_0420 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 21. -/
theorem ep_Q2_019_partial_21_0420_valid :
    mulPoly ep_Q2_019_coefficient_21_0420
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0421 : Poly :=
[
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 421 for generator 21. -/
def ep_Q2_019_partial_21_0421 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 21. -/
theorem ep_Q2_019_partial_21_0421_valid :
    mulPoly ep_Q2_019_coefficient_21_0421
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0422 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 422 for generator 21. -/
def ep_Q2_019_partial_21_0422 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 21. -/
theorem ep_Q2_019_partial_21_0422_valid :
    mulPoly ep_Q2_019_coefficient_21_0422
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0423 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 423 for generator 21. -/
def ep_Q2_019_partial_21_0423 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 21. -/
theorem ep_Q2_019_partial_21_0423_valid :
    mulPoly ep_Q2_019_coefficient_21_0423
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0424 : Poly :=
[
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 424 for generator 21. -/
def ep_Q2_019_partial_21_0424 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 21. -/
theorem ep_Q2_019_partial_21_0424_valid :
    mulPoly ep_Q2_019_coefficient_21_0424
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0425 : Poly :=
[
  term ((-508241545232579852516713263101133752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 425 for generator 21. -/
def ep_Q2_019_partial_21_0425 : Poly :=
[
  term ((-1016483090465159705033426526202267504 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((508241545232579852516713263101133752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 21. -/
theorem ep_Q2_019_partial_21_0425_valid :
    mulPoly ep_Q2_019_coefficient_21_0425
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0426 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 426 for generator 21. -/
def ep_Q2_019_partial_21_0426 : Poly :=
[
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 21. -/
theorem ep_Q2_019_partial_21_0426_valid :
    mulPoly ep_Q2_019_coefficient_21_0426
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0427 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 427 for generator 21. -/
def ep_Q2_019_partial_21_0427 : Poly :=
[
  term ((-563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 21. -/
theorem ep_Q2_019_partial_21_0427_valid :
    mulPoly ep_Q2_019_coefficient_21_0427
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0428 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 428 for generator 21. -/
def ep_Q2_019_partial_21_0428 : Poly :=
[
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 21. -/
theorem ep_Q2_019_partial_21_0428_valid :
    mulPoly ep_Q2_019_coefficient_21_0428
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0429 : Poly :=
[
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 429 for generator 21. -/
def ep_Q2_019_partial_21_0429 : Poly :=
[
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 21. -/
theorem ep_Q2_019_partial_21_0429_valid :
    mulPoly ep_Q2_019_coefficient_21_0429
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0430 : Poly :=
[
  term ((256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 430 for generator 21. -/
def ep_Q2_019_partial_21_0430 : Poly :=
[
  term ((513148176949026734697766589520081824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 21. -/
theorem ep_Q2_019_partial_21_0430_valid :
    mulPoly ep_Q2_019_coefficient_21_0430
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0431 : Poly :=
[
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 21. -/
def ep_Q2_019_partial_21_0431 : Poly :=
[
  term ((-27168199822743881407514729462329212736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 21. -/
theorem ep_Q2_019_partial_21_0431_valid :
    mulPoly ep_Q2_019_coefficient_21_0431
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0432 : Poly :=
[
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 432 for generator 21. -/
def ep_Q2_019_partial_21_0432 : Poly :=
[
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 21. -/
theorem ep_Q2_019_partial_21_0432_valid :
    mulPoly ep_Q2_019_coefficient_21_0432
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0433 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 433 for generator 21. -/
def ep_Q2_019_partial_21_0433 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 21. -/
theorem ep_Q2_019_partial_21_0433_valid :
    mulPoly ep_Q2_019_coefficient_21_0433
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0434 : Poly :=
[
  term ((-8160979640047017786786273911633502432 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 434 for generator 21. -/
def ep_Q2_019_partial_21_0434 : Poly :=
[
  term ((-16321959280094035573572547823267004864 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((8160979640047017786786273911633502432 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 21. -/
theorem ep_Q2_019_partial_21_0434_valid :
    mulPoly ep_Q2_019_coefficient_21_0434
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0435 : Poly :=
[
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 435 for generator 21. -/
def ep_Q2_019_partial_21_0435 : Poly :=
[
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 21. -/
theorem ep_Q2_019_partial_21_0435_valid :
    mulPoly ep_Q2_019_coefficient_21_0435
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0436 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 436 for generator 21. -/
def ep_Q2_019_partial_21_0436 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 21. -/
theorem ep_Q2_019_partial_21_0436_valid :
    mulPoly ep_Q2_019_coefficient_21_0436
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0437 : Poly :=
[
  term ((-256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 437 for generator 21. -/
def ep_Q2_019_partial_21_0437 : Poly :=
[
  term ((256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-513148176949026734697766589520081824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 21. -/
theorem ep_Q2_019_partial_21_0437_valid :
    mulPoly ep_Q2_019_coefficient_21_0437
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0438 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 21. -/
def ep_Q2_019_partial_21_0438 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 21. -/
theorem ep_Q2_019_partial_21_0438_valid :
    mulPoly ep_Q2_019_coefficient_21_0438
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0439 : Poly :=
[
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 439 for generator 21. -/
def ep_Q2_019_partial_21_0439 : Poly :=
[
  term ((27168199822743881407514729462329212736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 21. -/
theorem ep_Q2_019_partial_21_0439_valid :
    mulPoly ep_Q2_019_coefficient_21_0439
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0440 : Poly :=
[
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 440 for generator 21. -/
def ep_Q2_019_partial_21_0440 : Poly :=
[
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 21. -/
theorem ep_Q2_019_partial_21_0440_valid :
    mulPoly ep_Q2_019_coefficient_21_0440
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0441 : Poly :=
[
  term ((3909173154792011910637107772311233416 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 441 for generator 21. -/
def ep_Q2_019_partial_21_0441 : Poly :=
[
  term ((7818346309584023821274215544622466832 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3909173154792011910637107772311233416 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 21. -/
theorem ep_Q2_019_partial_21_0441_valid :
    mulPoly ep_Q2_019_coefficient_21_0441
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0442 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 442 for generator 21. -/
def ep_Q2_019_partial_21_0442 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 21. -/
theorem ep_Q2_019_partial_21_0442_valid :
    mulPoly ep_Q2_019_coefficient_21_0442
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0443 : Poly :=
[
  term ((-128287044237256683674441647380020456 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 443 for generator 21. -/
def ep_Q2_019_partial_21_0443 : Poly :=
[
  term ((-256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (16, 1)],
  term ((128287044237256683674441647380020456 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 21. -/
theorem ep_Q2_019_partial_21_0443_valid :
    mulPoly ep_Q2_019_coefficient_21_0443
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0444 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 444 for generator 21. -/
def ep_Q2_019_partial_21_0444 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 21. -/
theorem ep_Q2_019_partial_21_0444_valid :
    mulPoly ep_Q2_019_coefficient_21_0444
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0445 : Poly :=
[
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 21. -/
def ep_Q2_019_partial_21_0445 : Poly :=
[
  term ((563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 21. -/
theorem ep_Q2_019_partial_21_0445_valid :
    mulPoly ep_Q2_019_coefficient_21_0445
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0446 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 446 for generator 21. -/
def ep_Q2_019_partial_21_0446 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 21. -/
theorem ep_Q2_019_partial_21_0446_valid :
    mulPoly ep_Q2_019_coefficient_21_0446
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0447 : Poly :=
[
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 21. -/
def ep_Q2_019_partial_21_0447 : Poly :=
[
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 21. -/
theorem ep_Q2_019_partial_21_0447_valid :
    mulPoly ep_Q2_019_coefficient_21_0447
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0448 : Poly :=
[
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 21. -/
def ep_Q2_019_partial_21_0448 : Poly :=
[
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 21. -/
theorem ep_Q2_019_partial_21_0448_valid :
    mulPoly ep_Q2_019_coefficient_21_0448
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0449 : Poly :=
[
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 449 for generator 21. -/
def ep_Q2_019_partial_21_0449 : Poly :=
[
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 21. -/
theorem ep_Q2_019_partial_21_0449_valid :
    mulPoly ep_Q2_019_coefficient_21_0449
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0450 : Poly :=
[
  term ((3267737933605728492264899535411131136 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 450 for generator 21. -/
def ep_Q2_019_partial_21_0450 : Poly :=
[
  term ((6535475867211456984529799070822262272 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3267737933605728492264899535411131136 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 21. -/
theorem ep_Q2_019_partial_21_0450_valid :
    mulPoly ep_Q2_019_coefficient_21_0450
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0451 : Poly :=
[
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 21. -/
def ep_Q2_019_partial_21_0451 : Poly :=
[
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 21. -/
theorem ep_Q2_019_partial_21_0451_valid :
    mulPoly ep_Q2_019_coefficient_21_0451
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0452 : Poly :=
[
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 452 for generator 21. -/
def ep_Q2_019_partial_21_0452 : Poly :=
[
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 21. -/
theorem ep_Q2_019_partial_21_0452_valid :
    mulPoly ep_Q2_019_coefficient_21_0452
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0453 : Poly :=
[
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 453 for generator 21. -/
def ep_Q2_019_partial_21_0453 : Poly :=
[
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 21. -/
theorem ep_Q2_019_partial_21_0453_valid :
    mulPoly ep_Q2_019_coefficient_21_0453
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0454 : Poly :=
[
  term ((1834237919483261606914782575180078530276 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 21. -/
def ep_Q2_019_partial_21_0454 : Poly :=
[
  term ((3668475838966523213829565150360157060552 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1834237919483261606914782575180078530276 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 21. -/
theorem ep_Q2_019_partial_21_0454_valid :
    mulPoly ep_Q2_019_coefficient_21_0454
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0455 : Poly :=
[
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 21. -/
def ep_Q2_019_partial_21_0455 : Poly :=
[
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 21. -/
theorem ep_Q2_019_partial_21_0455_valid :
    mulPoly ep_Q2_019_coefficient_21_0455
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0456 : Poly :=
[
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 456 for generator 21. -/
def ep_Q2_019_partial_21_0456 : Poly :=
[
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 21. -/
theorem ep_Q2_019_partial_21_0456_valid :
    mulPoly ep_Q2_019_coefficient_21_0456
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0457 : Poly :=
[
  term ((-2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 457 for generator 21. -/
def ep_Q2_019_partial_21_0457 : Poly :=
[
  term ((-4266165096867061381656339776783429568 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 21. -/
theorem ep_Q2_019_partial_21_0457_valid :
    mulPoly ep_Q2_019_coefficient_21_0457
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0458 : Poly :=
[
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 458 for generator 21. -/
def ep_Q2_019_partial_21_0458 : Poly :=
[
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 21. -/
theorem ep_Q2_019_partial_21_0458_valid :
    mulPoly ep_Q2_019_coefficient_21_0458
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0459 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 459 for generator 21. -/
def ep_Q2_019_partial_21_0459 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 21. -/
theorem ep_Q2_019_partial_21_0459_valid :
    mulPoly ep_Q2_019_coefficient_21_0459
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0460 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 21. -/
def ep_Q2_019_partial_21_0460 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 21. -/
theorem ep_Q2_019_partial_21_0460_valid :
    mulPoly ep_Q2_019_coefficient_21_0460
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0461 : Poly :=
[
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 461 for generator 21. -/
def ep_Q2_019_partial_21_0461 : Poly :=
[
  term ((4266165096867061381656339776783429568 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 21. -/
theorem ep_Q2_019_partial_21_0461_valid :
    mulPoly ep_Q2_019_coefficient_21_0461
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0462 : Poly :=
[
  term ((-34416590942144687937432490877017633600 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 462 for generator 21. -/
def ep_Q2_019_partial_21_0462 : Poly :=
[
  term ((-68833181884289375874864981754035267200 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((34416590942144687937432490877017633600 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 21. -/
theorem ep_Q2_019_partial_21_0462_valid :
    mulPoly ep_Q2_019_coefficient_21_0462
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0463 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 463 for generator 21. -/
def ep_Q2_019_partial_21_0463 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 21. -/
theorem ep_Q2_019_partial_21_0463_valid :
    mulPoly ep_Q2_019_coefficient_21_0463
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0464 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 464 for generator 21. -/
def ep_Q2_019_partial_21_0464 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 21. -/
theorem ep_Q2_019_partial_21_0464_valid :
    mulPoly ep_Q2_019_coefficient_21_0464
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0465 : Poly :=
[
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 465 for generator 21. -/
def ep_Q2_019_partial_21_0465 : Poly :=
[
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 21. -/
theorem ep_Q2_019_partial_21_0465_valid :
    mulPoly ep_Q2_019_coefficient_21_0465
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0466 : Poly :=
[
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 466 for generator 21. -/
def ep_Q2_019_partial_21_0466 : Poly :=
[
  term ((-2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 21. -/
theorem ep_Q2_019_partial_21_0466_valid :
    mulPoly ep_Q2_019_coefficient_21_0466
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0467 : Poly :=
[
  term ((-157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 467 for generator 21. -/
def ep_Q2_019_partial_21_0467 : Poly :=
[
  term ((-314894932139492372370326874318659191744 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 21. -/
theorem ep_Q2_019_partial_21_0467_valid :
    mulPoly ep_Q2_019_coefficient_21_0467
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0468 : Poly :=
[
  term ((-6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 468 for generator 21. -/
def ep_Q2_019_partial_21_0468 : Poly :=
[
  term ((-13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 21. -/
theorem ep_Q2_019_partial_21_0468_valid :
    mulPoly ep_Q2_019_coefficient_21_0468
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0469 : Poly :=
[
  term ((-6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 21. -/
def ep_Q2_019_partial_21_0469 : Poly :=
[
  term ((-12568004337360569948837175642739682304 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 21. -/
theorem ep_Q2_019_partial_21_0469_valid :
    mulPoly ep_Q2_019_coefficient_21_0469
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0470 : Poly :=
[
  term ((103286307395814117972294809101051988752 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 470 for generator 21. -/
def ep_Q2_019_partial_21_0470 : Poly :=
[
  term ((206572614791628235944589618202103977504 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-103286307395814117972294809101051988752 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 21. -/
theorem ep_Q2_019_partial_21_0470_valid :
    mulPoly ep_Q2_019_coefficient_21_0470
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0471 : Poly :=
[
  term ((3643251938660534411872924572535663474391 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 21. -/
def ep_Q2_019_partial_21_0471 : Poly :=
[
  term ((3643251938660534411872924572535663474391 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3643251938660534411872924572535663474391 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 21. -/
theorem ep_Q2_019_partial_21_0471_valid :
    mulPoly ep_Q2_019_coefficient_21_0471
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0472 : Poly :=
[
  term ((36876271424823951171342213946584236352 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 472 for generator 21. -/
def ep_Q2_019_partial_21_0472 : Poly :=
[
  term ((73752542849647902342684427893168472704 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36876271424823951171342213946584236352 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 21. -/
theorem ep_Q2_019_partial_21_0472_valid :
    mulPoly ep_Q2_019_coefficient_21_0472
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0473 : Poly :=
[
  term ((-2118693724524418608545398303055259600 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 473 for generator 21. -/
def ep_Q2_019_partial_21_0473 : Poly :=
[
  term ((-4237387449048837217090796606110519200 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((2118693724524418608545398303055259600 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 21. -/
theorem ep_Q2_019_partial_21_0473_valid :
    mulPoly ep_Q2_019_coefficient_21_0473
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0474 : Poly :=
[
  term ((1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 474 for generator 21. -/
def ep_Q2_019_partial_21_0474 : Poly :=
[
  term ((3406192070841500368327749450904874208 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 21. -/
theorem ep_Q2_019_partial_21_0474_valid :
    mulPoly ep_Q2_019_coefficient_21_0474
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0475 : Poly :=
[
  term ((-103286307395814117972294809101051988752 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 475 for generator 21. -/
def ep_Q2_019_partial_21_0475 : Poly :=
[
  term ((103286307395814117972294809101051988752 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-206572614791628235944589618202103977504 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 21. -/
theorem ep_Q2_019_partial_21_0475_valid :
    mulPoly ep_Q2_019_coefficient_21_0475
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0476 : Poly :=
[
  term ((-747725063328819284437220311432199990443 : Rat) / 17527136122379798655320138766134697602) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 476 for generator 21. -/
def ep_Q2_019_partial_21_0476 : Poly :=
[
  term ((747725063328819284437220311432199990443 : Rat) / 17527136122379798655320138766134697602) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-747725063328819284437220311432199990443 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 21. -/
theorem ep_Q2_019_partial_21_0476_valid :
    mulPoly ep_Q2_019_coefficient_21_0476
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0477 : Poly :=
[
  term ((6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 477 for generator 21. -/
def ep_Q2_019_partial_21_0477 : Poly :=
[
  term ((13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 21. -/
theorem ep_Q2_019_partial_21_0477_valid :
    mulPoly ep_Q2_019_coefficient_21_0477
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0478 : Poly :=
[
  term ((2088258049528381443110660983868350486219 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 478 for generator 21. -/
def ep_Q2_019_partial_21_0478 : Poly :=
[
  term ((2088258049528381443110660983868350486219 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2088258049528381443110660983868350486219 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 21. -/
theorem ep_Q2_019_partial_21_0478_valid :
    mulPoly ep_Q2_019_coefficient_21_0478
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0479 : Poly :=
[
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 21. -/
def ep_Q2_019_partial_21_0479 : Poly :=
[
  term ((-493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 21. -/
theorem ep_Q2_019_partial_21_0479_valid :
    mulPoly ep_Q2_019_coefficient_21_0479
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0480 : Poly :=
[
  term ((-91866082538613791133089264590599182432 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 480 for generator 21. -/
def ep_Q2_019_partial_21_0480 : Poly :=
[
  term ((-183732165077227582266178529181198364864 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((91866082538613791133089264590599182432 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 21. -/
theorem ep_Q2_019_partial_21_0480_valid :
    mulPoly ep_Q2_019_coefficient_21_0480
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0481 : Poly :=
[
  term ((6310740346288059933950718215472409016 : Rat) / 515504003599405842803533493121608753) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 481 for generator 21. -/
def ep_Q2_019_partial_21_0481 : Poly :=
[
  term ((12621480692576119867901436430944818032 : Rat) / 515504003599405842803533493121608753) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-6310740346288059933950718215472409016 : Rat) / 515504003599405842803533493121608753) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 21. -/
theorem ep_Q2_019_partial_21_0481_valid :
    mulPoly ep_Q2_019_coefficient_21_0481
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0482 : Poly :=
[
  term ((-52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 482 for generator 21. -/
def ep_Q2_019_partial_21_0482 : Poly :=
[
  term ((-104027755206586710984699282193043913758 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 21. -/
theorem ep_Q2_019_partial_21_0482_valid :
    mulPoly ep_Q2_019_coefficient_21_0482
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0483 : Poly :=
[
  term ((-1378549674608808340377274911915780881869 : Rat) / 26290704183569697982980208149202046403) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 483 for generator 21. -/
def ep_Q2_019_partial_21_0483 : Poly :=
[
  term ((-2757099349217616680754549823831561763738 : Rat) / 26290704183569697982980208149202046403) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1378549674608808340377274911915780881869 : Rat) / 26290704183569697982980208149202046403) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 21. -/
theorem ep_Q2_019_partial_21_0483_valid :
    mulPoly ep_Q2_019_coefficient_21_0483
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0484 : Poly :=
[
  term ((6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 484 for generator 21. -/
def ep_Q2_019_partial_21_0484 : Poly :=
[
  term ((-6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 21. -/
theorem ep_Q2_019_partial_21_0484_valid :
    mulPoly ep_Q2_019_coefficient_21_0484
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0485 : Poly :=
[
  term ((6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 485 for generator 21. -/
def ep_Q2_019_partial_21_0485 : Poly :=
[
  term ((12568004337360569948837175642739682304 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 21. -/
theorem ep_Q2_019_partial_21_0485_valid :
    mulPoly ep_Q2_019_coefficient_21_0485
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0486 : Poly :=
[
  term ((2576659968672905099672350049863651792 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (16, 1)]
]

/-- Partial product 486 for generator 21. -/
def ep_Q2_019_partial_21_0486 : Poly :=
[
  term ((5153319937345810199344700099727303584 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-2576659968672905099672350049863651792 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 21. -/
theorem ep_Q2_019_partial_21_0486_valid :
    mulPoly ep_Q2_019_coefficient_21_0486
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0487 : Poly :=
[
  term ((887504388702050349615120514004950485792 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 487 for generator 21. -/
def ep_Q2_019_partial_21_0487 : Poly :=
[
  term ((-887504388702050349615120514004950485792 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 21. -/
theorem ep_Q2_019_partial_21_0487_valid :
    mulPoly ep_Q2_019_coefficient_21_0487
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0488 : Poly :=
[
  term ((-126782022460846563181029064609042716231 : Rat) / 5155040035994058428035334931216087530) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 488 for generator 21. -/
def ep_Q2_019_partial_21_0488 : Poly :=
[
  term ((126782022460846563181029064609042716231 : Rat) / 5155040035994058428035334931216087530) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 21. -/
theorem ep_Q2_019_partial_21_0488_valid :
    mulPoly ep_Q2_019_coefficient_21_0488
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0489 : Poly :=
[
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 489 for generator 21. -/
def ep_Q2_019_partial_21_0489 : Poly :=
[
  term ((-493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 21. -/
theorem ep_Q2_019_partial_21_0489_valid :
    mulPoly ep_Q2_019_coefficient_21_0489
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0490 : Poly :=
[
  term ((-1635575006013645578810344430113970875264 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 490 for generator 21. -/
def ep_Q2_019_partial_21_0490 : Poly :=
[
  term ((-3271150012027291157620688860227941750528 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1635575006013645578810344430113970875264 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 21. -/
theorem ep_Q2_019_partial_21_0490_valid :
    mulPoly ep_Q2_019_coefficient_21_0490
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0491 : Poly :=
[
  term ((20007449727622968107362369052880403724 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 491 for generator 21. -/
def ep_Q2_019_partial_21_0491 : Poly :=
[
  term ((40014899455245936214724738105760807448 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20007449727622968107362369052880403724 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 21. -/
theorem ep_Q2_019_partial_21_0491_valid :
    mulPoly ep_Q2_019_coefficient_21_0491
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0492 : Poly :=
[
  term ((3493870965463791055172498269557397525088 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 492 for generator 21. -/
def ep_Q2_019_partial_21_0492 : Poly :=
[
  term ((6987741930927582110344996539114795050176 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3493870965463791055172498269557397525088 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 21. -/
theorem ep_Q2_019_partial_21_0492_valid :
    mulPoly ep_Q2_019_coefficient_21_0492
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0493 : Poly :=
[
  term ((82241345985824587188671382059161958039 : Rat) / 105162816734278791931920832596808185612) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 493 for generator 21. -/
def ep_Q2_019_partial_21_0493 : Poly :=
[
  term ((82241345985824587188671382059161958039 : Rat) / 52581408367139395965960416298404092806) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-82241345985824587188671382059161958039 : Rat) / 105162816734278791931920832596808185612) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 21. -/
theorem ep_Q2_019_partial_21_0493_valid :
    mulPoly ep_Q2_019_coefficient_21_0493
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0494 : Poly :=
[
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 494 for generator 21. -/
def ep_Q2_019_partial_21_0494 : Poly :=
[
  term ((-2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 21. -/
theorem ep_Q2_019_partial_21_0494_valid :
    mulPoly ep_Q2_019_coefficient_21_0494
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0495 : Poly :=
[
  term ((63660576409273224324342026136144263304 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 495 for generator 21. -/
def ep_Q2_019_partial_21_0495 : Poly :=
[
  term ((127321152818546448648684052272288526608 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-63660576409273224324342026136144263304 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 21. -/
theorem ep_Q2_019_partial_21_0495_valid :
    mulPoly ep_Q2_019_coefficient_21_0495
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0496 : Poly :=
[
  term ((153267022985839965457219895751754846974 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 496 for generator 21. -/
def ep_Q2_019_partial_21_0496 : Poly :=
[
  term ((306534045971679930914439791503509693948 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-153267022985839965457219895751754846974 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 21. -/
theorem ep_Q2_019_partial_21_0496_valid :
    mulPoly ep_Q2_019_coefficient_21_0496
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0497 : Poly :=
[
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 497 for generator 21. -/
def ep_Q2_019_partial_21_0497 : Poly :=
[
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 21. -/
theorem ep_Q2_019_partial_21_0497_valid :
    mulPoly ep_Q2_019_coefficient_21_0497
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0498 : Poly :=
[
  term ((1744228777851831676297587428350968532532 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 21. -/
def ep_Q2_019_partial_21_0498 : Poly :=
[
  term ((3488457555703663352595174856701937065064 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1744228777851831676297587428350968532532 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 21. -/
theorem ep_Q2_019_partial_21_0498_valid :
    mulPoly ep_Q2_019_coefficient_21_0498
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0499 : Poly :=
[
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 499 for generator 21. -/
def ep_Q2_019_partial_21_0499 : Poly :=
[
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 21. -/
theorem ep_Q2_019_partial_21_0499_valid :
    mulPoly ep_Q2_019_coefficient_21_0499
        ep_Q2_019_generator_21_0400_0499 =
      ep_Q2_019_partial_21_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_21_0400_0499 : List Poly :=
[
  ep_Q2_019_partial_21_0400,
  ep_Q2_019_partial_21_0401,
  ep_Q2_019_partial_21_0402,
  ep_Q2_019_partial_21_0403,
  ep_Q2_019_partial_21_0404,
  ep_Q2_019_partial_21_0405,
  ep_Q2_019_partial_21_0406,
  ep_Q2_019_partial_21_0407,
  ep_Q2_019_partial_21_0408,
  ep_Q2_019_partial_21_0409,
  ep_Q2_019_partial_21_0410,
  ep_Q2_019_partial_21_0411,
  ep_Q2_019_partial_21_0412,
  ep_Q2_019_partial_21_0413,
  ep_Q2_019_partial_21_0414,
  ep_Q2_019_partial_21_0415,
  ep_Q2_019_partial_21_0416,
  ep_Q2_019_partial_21_0417,
  ep_Q2_019_partial_21_0418,
  ep_Q2_019_partial_21_0419,
  ep_Q2_019_partial_21_0420,
  ep_Q2_019_partial_21_0421,
  ep_Q2_019_partial_21_0422,
  ep_Q2_019_partial_21_0423,
  ep_Q2_019_partial_21_0424,
  ep_Q2_019_partial_21_0425,
  ep_Q2_019_partial_21_0426,
  ep_Q2_019_partial_21_0427,
  ep_Q2_019_partial_21_0428,
  ep_Q2_019_partial_21_0429,
  ep_Q2_019_partial_21_0430,
  ep_Q2_019_partial_21_0431,
  ep_Q2_019_partial_21_0432,
  ep_Q2_019_partial_21_0433,
  ep_Q2_019_partial_21_0434,
  ep_Q2_019_partial_21_0435,
  ep_Q2_019_partial_21_0436,
  ep_Q2_019_partial_21_0437,
  ep_Q2_019_partial_21_0438,
  ep_Q2_019_partial_21_0439,
  ep_Q2_019_partial_21_0440,
  ep_Q2_019_partial_21_0441,
  ep_Q2_019_partial_21_0442,
  ep_Q2_019_partial_21_0443,
  ep_Q2_019_partial_21_0444,
  ep_Q2_019_partial_21_0445,
  ep_Q2_019_partial_21_0446,
  ep_Q2_019_partial_21_0447,
  ep_Q2_019_partial_21_0448,
  ep_Q2_019_partial_21_0449,
  ep_Q2_019_partial_21_0450,
  ep_Q2_019_partial_21_0451,
  ep_Q2_019_partial_21_0452,
  ep_Q2_019_partial_21_0453,
  ep_Q2_019_partial_21_0454,
  ep_Q2_019_partial_21_0455,
  ep_Q2_019_partial_21_0456,
  ep_Q2_019_partial_21_0457,
  ep_Q2_019_partial_21_0458,
  ep_Q2_019_partial_21_0459,
  ep_Q2_019_partial_21_0460,
  ep_Q2_019_partial_21_0461,
  ep_Q2_019_partial_21_0462,
  ep_Q2_019_partial_21_0463,
  ep_Q2_019_partial_21_0464,
  ep_Q2_019_partial_21_0465,
  ep_Q2_019_partial_21_0466,
  ep_Q2_019_partial_21_0467,
  ep_Q2_019_partial_21_0468,
  ep_Q2_019_partial_21_0469,
  ep_Q2_019_partial_21_0470,
  ep_Q2_019_partial_21_0471,
  ep_Q2_019_partial_21_0472,
  ep_Q2_019_partial_21_0473,
  ep_Q2_019_partial_21_0474,
  ep_Q2_019_partial_21_0475,
  ep_Q2_019_partial_21_0476,
  ep_Q2_019_partial_21_0477,
  ep_Q2_019_partial_21_0478,
  ep_Q2_019_partial_21_0479,
  ep_Q2_019_partial_21_0480,
  ep_Q2_019_partial_21_0481,
  ep_Q2_019_partial_21_0482,
  ep_Q2_019_partial_21_0483,
  ep_Q2_019_partial_21_0484,
  ep_Q2_019_partial_21_0485,
  ep_Q2_019_partial_21_0486,
  ep_Q2_019_partial_21_0487,
  ep_Q2_019_partial_21_0488,
  ep_Q2_019_partial_21_0489,
  ep_Q2_019_partial_21_0490,
  ep_Q2_019_partial_21_0491,
  ep_Q2_019_partial_21_0492,
  ep_Q2_019_partial_21_0493,
  ep_Q2_019_partial_21_0494,
  ep_Q2_019_partial_21_0495,
  ep_Q2_019_partial_21_0496,
  ep_Q2_019_partial_21_0497,
  ep_Q2_019_partial_21_0498,
  ep_Q2_019_partial_21_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_21_0400_0499 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1946019944774945034433629854068898032544 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-973009972387472517216814927034449016272 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13395691091101430223044179219949328432 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((54050408010479426772887792086122491103496 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((1290050145743069518165491643919068152 : Rat) / 178848327779385700564491211899333649) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27025204005239713386443896043061245551748 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (14, 1), (16, 1)],
  term ((-645025072871534759082745821959534076 : Rat) / 178848327779385700564491211899333649) [(4, 1), (14, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (15, 2), (16, 1)],
  term ((-125053003053498902175766041628514064 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((62526501526749451087883020814257032 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-17623747615809039201792401816796368 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-1016483090465159705033426526202267504 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((508241545232579852516713263101133752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((513148176949026734697766589520081824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-27168199822743881407514729462329212736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16321959280094035573572547823267004864 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-256574088474513367348883294760040912 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((8160979640047017786786273911633502432 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((27168199822743881407514729462329212736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((7818346309584023821274215544622466832 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-513148176949026734697766589520081824 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3909173154792011910637107772311233416 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((128287044237256683674441647380020456 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (16, 1)],
  term ((563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6535475867211456984529799070822262272 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3668475838966523213829565150360157060552 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3267737933605728492264899535411131136 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1834237919483261606914782575180078530276 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (15, 1), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4266165096867061381656339776783429568 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4266165096867061381656339776783429568 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-291905386984825377449034746504579323792 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((34416590942144687937432490877017633600 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-314894932139492372370326874318659191744 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-12568004337360569948837175642739682304 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((206572614791628235944589618202103977504 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3643251938660534411872924572535663474391 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((73752542849647902342684427893168472704 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4237387449048837217090796606110519200 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((3406192070841500368327749450904874208 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-103286307395814117972294809101051988752 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3643251938660534411872924572535663474391 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36876271424823951171342213946584236352 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((2118693724524418608545398303055259600 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-1703096035420750184163874725452437104 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (16, 1)],
  term ((13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2088258049528381443110660983868350486219 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-183732165077227582266178529181198364864 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((168016023752112043820559557961623074496 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-104027755206586710984699282193043913758 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88406040768885824545876721982879015031 : Rat) / 1421119145057821512593524764821732238) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-206572614791628235944589618202103977504 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-747725063328819284437220311432199990443 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2088258049528381443110660983868350486219 : Rat) / 87635680611898993276600693830673488010) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((91866082538613791133089264590599182432 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6310740346288059933950718215472409016 : Rat) / 515504003599405842803533493121608753) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1378549674608808340377274911915780881869 : Rat) / 26290704183569697982980208149202046403) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((12568004337360569948837175642739682304 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 2), (16, 1)],
  term ((-6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-2576659968672905099672350049863651792 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (16, 1)],
  term ((-493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3271150012027291157620688860227941750528 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((40014899455245936214724738105760807448 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((6987741930927582110344996539114795050176 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((82241345985824587188671382059161958039 : Rat) / 52581408367139395965960416298404092806) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((127321152818546448648684052272288526608 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((306534045971679930914439791503509693948 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((53080676877583938836327639646877277128 : Rat) / 894241638896928502822456059496668245) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 5155040035994058428035334931216087530) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1635575006013645578810344430113970875264 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20007449727622968107362369052880403724 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3493870965463791055172498269557397525088 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82241345985824587188671382059161958039 : Rat) / 105162816734278791931920832596808185612) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (11, 2), (16, 1)],
  term ((-63660576409273224324342026136144263304 : Rat) / 8763568061189899327660069383067348801) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-153267022985839965457219895751754846974 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (12, 1), (16, 1)],
  term ((-32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1744228777851831676297587428350968532532 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 400 through 499. -/
theorem ep_Q2_019_block_21_0400_0499_valid :
    checkProductSumEq ep_Q2_019_partials_21_0400_0499
      ep_Q2_019_block_21_0400_0499 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
