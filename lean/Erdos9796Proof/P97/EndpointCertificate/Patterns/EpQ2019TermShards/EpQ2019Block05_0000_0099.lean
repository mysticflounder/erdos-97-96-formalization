/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 5:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_05_0000_0099 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0000 : Poly :=
[
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 5. -/
def ep_Q2_019_partial_05_0000 : Poly :=
[
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 2), (3, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 5. -/
theorem ep_Q2_019_partial_05_0000_valid :
    mulPoly ep_Q2_019_coefficient_05_0000
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0001 : Poly :=
[
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 5. -/
def ep_Q2_019_partial_05_0001 : Poly :=
[
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 5. -/
theorem ep_Q2_019_partial_05_0001_valid :
    mulPoly ep_Q2_019_coefficient_05_0001
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0002 : Poly :=
[
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 5. -/
def ep_Q2_019_partial_05_0002 : Poly :=
[
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 5. -/
theorem ep_Q2_019_partial_05_0002_valid :
    mulPoly ep_Q2_019_coefficient_05_0002
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0003 : Poly :=
[
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 3 for generator 5. -/
def ep_Q2_019_partial_05_0003 : Poly :=
[
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((-1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 5. -/
theorem ep_Q2_019_partial_05_0003_valid :
    mulPoly ep_Q2_019_coefficient_05_0003
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0004 : Poly :=
[
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 5. -/
def ep_Q2_019_partial_05_0004 : Poly :=
[
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 5. -/
theorem ep_Q2_019_partial_05_0004_valid :
    mulPoly ep_Q2_019_coefficient_05_0004
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0005 : Poly :=
[
  term ((-4122502409022819590582721190280266944 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 5 for generator 5. -/
def ep_Q2_019_partial_05_0005 : Poly :=
[
  term ((-4122502409022819590582721190280266944 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((-4122502409022819590582721190280266944 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((4122502409022819590582721190280266944 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((4122502409022819590582721190280266944 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 5. -/
theorem ep_Q2_019_partial_05_0005_valid :
    mulPoly ep_Q2_019_coefficient_05_0005
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0006 : Poly :=
[
  term ((-9802334824503718873827289756703625792 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 6 for generator 5. -/
def ep_Q2_019_partial_05_0006 : Poly :=
[
  term ((-9802334824503718873827289756703625792 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (9, 1), (16, 1)],
  term ((-9802334824503718873827289756703625792 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((9802334824503718873827289756703625792 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((9802334824503718873827289756703625792 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 5. -/
theorem ep_Q2_019_partial_05_0006_valid :
    mulPoly ep_Q2_019_coefficient_05_0006
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0007 : Poly :=
[
  term ((3365380515982658493853141159016736288 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 5. -/
def ep_Q2_019_partial_05_0007 : Poly :=
[
  term ((3365380515982658493853141159016736288 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((3365380515982658493853141159016736288 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-3365380515982658493853141159016736288 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3365380515982658493853141159016736288 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 5. -/
theorem ep_Q2_019_partial_05_0007_valid :
    mulPoly ep_Q2_019_coefficient_05_0007
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0008 : Poly :=
[
  term ((1830662208186520720047883978954649691456 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 5. -/
def ep_Q2_019_partial_05_0008 : Poly :=
[
  term ((1830662208186520720047883978954649691456 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((1830662208186520720047883978954649691456 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1830662208186520720047883978954649691456 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1830662208186520720047883978954649691456 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 5. -/
theorem ep_Q2_019_partial_05_0008_valid :
    mulPoly ep_Q2_019_coefficient_05_0008
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0009 : Poly :=
[
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 5. -/
def ep_Q2_019_partial_05_0009 : Poly :=
[
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 5. -/
theorem ep_Q2_019_partial_05_0009_valid :
    mulPoly ep_Q2_019_coefficient_05_0009
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0010 : Poly :=
[
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (16, 1)]
]

/-- Partial product 10 for generator 5. -/
def ep_Q2_019_partial_05_0010 : Poly :=
[
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (7, 2), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 5. -/
theorem ep_Q2_019_partial_05_0010_valid :
    mulPoly ep_Q2_019_coefficient_05_0010
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0011 : Poly :=
[
  term ((-2743052616480419035590252295390187136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 11 for generator 5. -/
def ep_Q2_019_partial_05_0011 : Poly :=
[
  term ((-2743052616480419035590252295390187136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (8, 1), (16, 1)],
  term ((-2743052616480419035590252295390187136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (8, 1), (16, 1)],
  term ((2743052616480419035590252295390187136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (14, 2), (16, 1)],
  term ((2743052616480419035590252295390187136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 5. -/
theorem ep_Q2_019_partial_05_0011_valid :
    mulPoly ep_Q2_019_coefficient_05_0011
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0012 : Poly :=
[
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 5. -/
def ep_Q2_019_partial_05_0012 : Poly :=
[
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 5. -/
theorem ep_Q2_019_partial_05_0012_valid :
    mulPoly ep_Q2_019_coefficient_05_0012
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0013 : Poly :=
[
  term ((883503862017303696461817885763833147152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 5. -/
def ep_Q2_019_partial_05_0013 : Poly :=
[
  term ((883503862017303696461817885763833147152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((883503862017303696461817885763833147152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-883503862017303696461817885763833147152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-883503862017303696461817885763833147152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 5. -/
theorem ep_Q2_019_partial_05_0013_valid :
    mulPoly ep_Q2_019_coefficient_05_0013
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0014 : Poly :=
[
  term ((918883933002361606066613853776769036679 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 5. -/
def ep_Q2_019_partial_05_0014 : Poly :=
[
  term ((918883933002361606066613853776769036679 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((918883933002361606066613853776769036679 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-918883933002361606066613853776769036679 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-918883933002361606066613853776769036679 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 5. -/
theorem ep_Q2_019_partial_05_0014_valid :
    mulPoly ep_Q2_019_coefficient_05_0014
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0015 : Poly :=
[
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (16, 1)]
]

/-- Partial product 15 for generator 5. -/
def ep_Q2_019_partial_05_0015 : Poly :=
[
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 2), (9, 2), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (3, 2), (9, 2), (16, 1)],
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (14, 2), (16, 1)],
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 5. -/
theorem ep_Q2_019_partial_05_0015_valid :
    mulPoly ep_Q2_019_coefficient_05_0015
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0016 : Poly :=
[
  term ((-118777158431756497244353729989722263680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 5. -/
def ep_Q2_019_partial_05_0016 : Poly :=
[
  term ((-118777158431756497244353729989722263680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-118777158431756497244353729989722263680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((118777158431756497244353729989722263680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((118777158431756497244353729989722263680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 5. -/
theorem ep_Q2_019_partial_05_0016_valid :
    mulPoly ep_Q2_019_coefficient_05_0016
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0017 : Poly :=
[
  term ((-4439931305382723564743814822921107973927 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 5. -/
def ep_Q2_019_partial_05_0017 : Poly :=
[
  term ((-4439931305382723564743814822921107973927 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4439931305382723564743814822921107973927 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((4439931305382723564743814822921107973927 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4439931305382723564743814822921107973927 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 5. -/
theorem ep_Q2_019_partial_05_0017_valid :
    mulPoly ep_Q2_019_coefficient_05_0017
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0018 : Poly :=
[
  term ((-6093959779410369906984172866422359392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 18 for generator 5. -/
def ep_Q2_019_partial_05_0018 : Poly :=
[
  term ((-6093959779410369906984172866422359392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-6093959779410369906984172866422359392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((6093959779410369906984172866422359392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((6093959779410369906984172866422359392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 5. -/
theorem ep_Q2_019_partial_05_0018_valid :
    mulPoly ep_Q2_019_coefficient_05_0018
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0019 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 19 for generator 5. -/
def ep_Q2_019_partial_05_0019 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 5. -/
theorem ep_Q2_019_partial_05_0019_valid :
    mulPoly ep_Q2_019_coefficient_05_0019
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0020 : Poly :=
[
  term ((8155085332602556629391335241168667296 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 20 for generator 5. -/
def ep_Q2_019_partial_05_0020 : Poly :=
[
  term ((8155085332602556629391335241168667296 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((8155085332602556629391335241168667296 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((-8155085332602556629391335241168667296 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8155085332602556629391335241168667296 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 5. -/
theorem ep_Q2_019_partial_05_0020_valid :
    mulPoly ep_Q2_019_coefficient_05_0020
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0021 : Poly :=
[
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 2), (16, 1)]
]

/-- Partial product 21 for generator 5. -/
def ep_Q2_019_partial_05_0021 : Poly :=
[
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (14, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (14, 2), (16, 1)],
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 5. -/
theorem ep_Q2_019_partial_05_0021_valid :
    mulPoly ep_Q2_019_coefficient_05_0021
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0022 : Poly :=
[
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 5. -/
def ep_Q2_019_partial_05_0022 : Poly :=
[
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 5. -/
theorem ep_Q2_019_partial_05_0022_valid :
    mulPoly ep_Q2_019_coefficient_05_0022
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0023 : Poly :=
[
  term ((-8809617505418871185331191044068883773416 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (16, 1)]
]

/-- Partial product 23 for generator 5. -/
def ep_Q2_019_partial_05_0023 : Poly :=
[
  term ((-8809617505418871185331191044068883773416 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (2, 2), (16, 1)],
  term ((-8809617505418871185331191044068883773416 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (3, 2), (16, 1)],
  term ((8809617505418871185331191044068883773416 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (14, 2), (16, 1)],
  term ((8809617505418871185331191044068883773416 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 5. -/
theorem ep_Q2_019_partial_05_0023_valid :
    mulPoly ep_Q2_019_coefficient_05_0023
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0024 : Poly :=
[
  term ((6444371339526384591574130277420462976 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (16, 1)]
]

/-- Partial product 24 for generator 5. -/
def ep_Q2_019_partial_05_0024 : Poly :=
[
  term ((6444371339526384591574130277420462976 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 2), (16, 1)],
  term ((6444371339526384591574130277420462976 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 2), (16, 1)],
  term ((-6444371339526384591574130277420462976 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (14, 2), (16, 1)],
  term ((-6444371339526384591574130277420462976 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 5. -/
theorem ep_Q2_019_partial_05_0024_valid :
    mulPoly ep_Q2_019_coefficient_05_0024
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0025 : Poly :=
[
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (16, 1)]
]

/-- Partial product 25 for generator 5. -/
def ep_Q2_019_partial_05_0025 : Poly :=
[
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (14, 2), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 3), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 5. -/
theorem ep_Q2_019_partial_05_0025_valid :
    mulPoly ep_Q2_019_coefficient_05_0025
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0026 : Poly :=
[
  term ((1158321685415405096287400718440460776 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 1), (5, 1), (16, 1)]
]

/-- Partial product 26 for generator 5. -/
def ep_Q2_019_partial_05_0026 : Poly :=
[
  term ((1158321685415405096287400718440460776 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 1), (3, 2), (5, 1), (16, 1)],
  term ((-1158321685415405096287400718440460776 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 1), (5, 1), (14, 2), (16, 1)],
  term ((-1158321685415405096287400718440460776 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((1158321685415405096287400718440460776 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 5. -/
theorem ep_Q2_019_partial_05_0026_valid :
    mulPoly ep_Q2_019_coefficient_05_0026
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0027 : Poly :=
[
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 27 for generator 5. -/
def ep_Q2_019_partial_05_0027 : Poly :=
[
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 5. -/
theorem ep_Q2_019_partial_05_0027_valid :
    mulPoly ep_Q2_019_coefficient_05_0027
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0028 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 28 for generator 5. -/
def ep_Q2_019_partial_05_0028 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 3), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 5. -/
theorem ep_Q2_019_partial_05_0028_valid :
    mulPoly ep_Q2_019_coefficient_05_0028
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0029 : Poly :=
[
  term ((851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

/-- Partial product 29 for generator 5. -/
def ep_Q2_019_partial_05_0029 : Poly :=
[
  term ((851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (3, 2), (9, 1), (16, 1)],
  term ((-851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((-851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 5. -/
theorem ep_Q2_019_partial_05_0029_valid :
    mulPoly ep_Q2_019_coefficient_05_0029
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0030 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 30 for generator 5. -/
def ep_Q2_019_partial_05_0030 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 3), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 5. -/
theorem ep_Q2_019_partial_05_0030_valid :
    mulPoly ep_Q2_019_coefficient_05_0030
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0031 : Poly :=
[
  term ((-11890244213683620138301764530758452848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 31 for generator 5. -/
def ep_Q2_019_partial_05_0031 : Poly :=
[
  term ((-11890244213683620138301764530758452848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((11890244213683620138301764530758452848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((11890244213683620138301764530758452848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11890244213683620138301764530758452848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 5. -/
theorem ep_Q2_019_partial_05_0031_valid :
    mulPoly ep_Q2_019_coefficient_05_0031
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0032 : Poly :=
[
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 5. -/
def ep_Q2_019_partial_05_0032 : Poly :=
[
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 5. -/
theorem ep_Q2_019_partial_05_0032_valid :
    mulPoly ep_Q2_019_coefficient_05_0032
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0033 : Poly :=
[
  term ((-1545874408267593441020238661943094473392 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 33 for generator 5. -/
def ep_Q2_019_partial_05_0033 : Poly :=
[
  term ((-1545874408267593441020238661943094473392 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((1545874408267593441020238661943094473392 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((1545874408267593441020238661943094473392 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1545874408267593441020238661943094473392 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 5. -/
theorem ep_Q2_019_partial_05_0033_valid :
    mulPoly ep_Q2_019_coefficient_05_0033
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0034 : Poly :=
[
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 5. -/
def ep_Q2_019_partial_05_0034 : Poly :=
[
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (14, 3), (15, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 5. -/
theorem ep_Q2_019_partial_05_0034_valid :
    mulPoly ep_Q2_019_coefficient_05_0034
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0035 : Poly :=
[
  term ((1154594906413856795092707916089142442396 : Rat) / 16275197827924098751368700282839362059) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 5. -/
def ep_Q2_019_partial_05_0035 : Poly :=
[
  term ((1154594906413856795092707916089142442396 : Rat) / 16275197827924098751368700282839362059) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1154594906413856795092707916089142442396 : Rat) / 16275197827924098751368700282839362059) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1154594906413856795092707916089142442396 : Rat) / 16275197827924098751368700282839362059) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((1154594906413856795092707916089142442396 : Rat) / 16275197827924098751368700282839362059) [(1, 1), (2, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 5. -/
theorem ep_Q2_019_partial_05_0035_valid :
    mulPoly ep_Q2_019_coefficient_05_0035
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0036 : Poly :=
[
  term ((524661423610086738350799492251678976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (4, 1), (16, 1)]
]

/-- Partial product 36 for generator 5. -/
def ep_Q2_019_partial_05_0036 : Poly :=
[
  term ((524661423610086738350799492251678976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 2), (3, 1), (4, 1), (16, 1)],
  term ((-524661423610086738350799492251678976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (4, 1), (14, 2), (16, 1)],
  term ((-524661423610086738350799492251678976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((524661423610086738350799492251678976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 5. -/
theorem ep_Q2_019_partial_05_0036_valid :
    mulPoly ep_Q2_019_coefficient_05_0036
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0037 : Poly :=
[
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (16, 1)]
]

/-- Partial product 37 for generator 5. -/
def ep_Q2_019_partial_05_0037 : Poly :=
[
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (3, 1), (6, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 5. -/
theorem ep_Q2_019_partial_05_0037_valid :
    mulPoly ep_Q2_019_coefficient_05_0037
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0038 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 5. -/
def ep_Q2_019_partial_05_0038 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 5. -/
theorem ep_Q2_019_partial_05_0038_valid :
    mulPoly ep_Q2_019_coefficient_05_0038
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0039 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 5. -/
def ep_Q2_019_partial_05_0039 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 5. -/
theorem ep_Q2_019_partial_05_0039_valid :
    mulPoly ep_Q2_019_coefficient_05_0039
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0040 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 5. -/
def ep_Q2_019_partial_05_0040 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 5. -/
theorem ep_Q2_019_partial_05_0040_valid :
    mulPoly ep_Q2_019_coefficient_05_0040
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0041 : Poly :=
[
  term ((-121093273461226199459274535264308480 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 41 for generator 5. -/
def ep_Q2_019_partial_05_0041 : Poly :=
[
  term ((-121093273461226199459274535264308480 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (3, 1), (12, 1), (16, 1)],
  term ((121093273461226199459274535264308480 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((121093273461226199459274535264308480 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-121093273461226199459274535264308480 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 5. -/
theorem ep_Q2_019_partial_05_0041_valid :
    mulPoly ep_Q2_019_coefficient_05_0041
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0042 : Poly :=
[
  term ((-180709170909539657461877290952756640 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 42 for generator 5. -/
def ep_Q2_019_partial_05_0042 : Poly :=
[
  term ((-180709170909539657461877290952756640 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (3, 1), (14, 1), (16, 1)],
  term ((180709170909539657461877290952756640 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((180709170909539657461877290952756640 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (14, 3), (16, 1)],
  term ((-180709170909539657461877290952756640 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 5. -/
theorem ep_Q2_019_partial_05_0042_valid :
    mulPoly ep_Q2_019_coefficient_05_0042
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0043 : Poly :=
[
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 5. -/
def ep_Q2_019_partial_05_0043 : Poly :=
[
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 5. -/
theorem ep_Q2_019_partial_05_0043_valid :
    mulPoly ep_Q2_019_coefficient_05_0043
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0044 : Poly :=
[
  term ((-26483056253725260441504943116885191162288 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 44 for generator 5. -/
def ep_Q2_019_partial_05_0044 : Poly :=
[
  term ((-26483056253725260441504943116885191162288 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((26483056253725260441504943116885191162288 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((26483056253725260441504943116885191162288 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-26483056253725260441504943116885191162288 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 5. -/
theorem ep_Q2_019_partial_05_0044_valid :
    mulPoly ep_Q2_019_coefficient_05_0044
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0045 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 45 for generator 5. -/
def ep_Q2_019_partial_05_0045 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (4, 1), (9, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (4, 1), (9, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (14, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 5. -/
theorem ep_Q2_019_partial_05_0045_valid :
    mulPoly ep_Q2_019_coefficient_05_0045
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0046 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 46 for generator 5. -/
def ep_Q2_019_partial_05_0046 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 2), (4, 1), (11, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 5. -/
theorem ep_Q2_019_partial_05_0046_valid :
    mulPoly ep_Q2_019_coefficient_05_0046
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0047 : Poly :=
[
  term ((801590825773726315045587225993709824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 47 for generator 5. -/
def ep_Q2_019_partial_05_0047 : Poly :=
[
  term ((801590825773726315045587225993709824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (4, 1), (13, 1), (16, 1)],
  term ((801590825773726315045587225993709824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (4, 1), (13, 1), (16, 1)],
  term ((-801590825773726315045587225993709824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-801590825773726315045587225993709824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 5. -/
theorem ep_Q2_019_partial_05_0047_valid :
    mulPoly ep_Q2_019_coefficient_05_0047
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0048 : Poly :=
[
  term ((-5944594306895340568717170500198900064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 5. -/
def ep_Q2_019_partial_05_0048 : Poly :=
[
  term ((-5944594306895340568717170500198900064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-5944594306895340568717170500198900064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((5944594306895340568717170500198900064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((5944594306895340568717170500198900064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 5. -/
theorem ep_Q2_019_partial_05_0048_valid :
    mulPoly ep_Q2_019_coefficient_05_0048
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0049 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 49 for generator 5. -/
def ep_Q2_019_partial_05_0049 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 5. -/
theorem ep_Q2_019_partial_05_0049_valid :
    mulPoly ep_Q2_019_coefficient_05_0049
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0050 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 50 for generator 5. -/
def ep_Q2_019_partial_05_0050 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (5, 1), (9, 2), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (5, 1), (9, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 5. -/
theorem ep_Q2_019_partial_05_0050_valid :
    mulPoly ep_Q2_019_coefficient_05_0050
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0051 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 51 for generator 5. -/
def ep_Q2_019_partial_05_0051 : Poly :=
[
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (5, 1), (12, 1), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 5. -/
theorem ep_Q2_019_partial_05_0051_valid :
    mulPoly ep_Q2_019_coefficient_05_0051
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0052 : Poly :=
[
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 52 for generator 5. -/
def ep_Q2_019_partial_05_0052 : Poly :=
[
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (5, 1), (14, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 5. -/
theorem ep_Q2_019_partial_05_0052_valid :
    mulPoly ep_Q2_019_coefficient_05_0052
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0053 : Poly :=
[
  term ((-11153320007212271167753816975356649848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 53 for generator 5. -/
def ep_Q2_019_partial_05_0053 : Poly :=
[
  term ((-11153320007212271167753816975356649848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-11153320007212271167753816975356649848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((11153320007212271167753816975356649848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((11153320007212271167753816975356649848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 5. -/
theorem ep_Q2_019_partial_05_0053_valid :
    mulPoly ep_Q2_019_coefficient_05_0053
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0054 : Poly :=
[
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 54 for generator 5. -/
def ep_Q2_019_partial_05_0054 : Poly :=
[
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (6, 1), (7, 1), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (6, 1), (7, 1), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 5. -/
theorem ep_Q2_019_partial_05_0054_valid :
    mulPoly ep_Q2_019_coefficient_05_0054
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0055 : Poly :=
[
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 5. -/
def ep_Q2_019_partial_05_0055 : Poly :=
[
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 2), (6, 1), (11, 1), (16, 1)],
  term ((1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 5. -/
theorem ep_Q2_019_partial_05_0055_valid :
    mulPoly ep_Q2_019_coefficient_05_0055
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0056 : Poly :=
[
  term ((2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 56 for generator 5. -/
def ep_Q2_019_partial_05_0056 : Poly :=
[
  term ((2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 5. -/
theorem ep_Q2_019_partial_05_0056_valid :
    mulPoly ep_Q2_019_coefficient_05_0056
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0057 : Poly :=
[
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 5. -/
def ep_Q2_019_partial_05_0057 : Poly :=
[
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 5. -/
theorem ep_Q2_019_partial_05_0057_valid :
    mulPoly ep_Q2_019_coefficient_05_0057
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0058 : Poly :=
[
  term ((-67984507707472703160333566745378545184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 58 for generator 5. -/
def ep_Q2_019_partial_05_0058 : Poly :=
[
  term ((-67984507707472703160333566745378545184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((-67984507707472703160333566745378545184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((67984507707472703160333566745378545184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((67984507707472703160333566745378545184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 5. -/
theorem ep_Q2_019_partial_05_0058_valid :
    mulPoly ep_Q2_019_coefficient_05_0058
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0059 : Poly :=
[
  term ((53583852759435716206028771886337289608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 59 for generator 5. -/
def ep_Q2_019_partial_05_0059 : Poly :=
[
  term ((53583852759435716206028771886337289608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((53583852759435716206028771886337289608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-53583852759435716206028771886337289608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-53583852759435716206028771886337289608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 5. -/
theorem ep_Q2_019_partial_05_0059_valid :
    mulPoly ep_Q2_019_coefficient_05_0059
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0060 : Poly :=
[
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 5. -/
def ep_Q2_019_partial_05_0060 : Poly :=
[
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 5. -/
theorem ep_Q2_019_partial_05_0060_valid :
    mulPoly ep_Q2_019_coefficient_05_0060
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0061 : Poly :=
[
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 5. -/
def ep_Q2_019_partial_05_0061 : Poly :=
[
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 5. -/
theorem ep_Q2_019_partial_05_0061_valid :
    mulPoly ep_Q2_019_coefficient_05_0061
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0062 : Poly :=
[
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 5. -/
def ep_Q2_019_partial_05_0062 : Poly :=
[
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 5. -/
theorem ep_Q2_019_partial_05_0062_valid :
    mulPoly ep_Q2_019_coefficient_05_0062
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0063 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 63 for generator 5. -/
def ep_Q2_019_partial_05_0063 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 5. -/
theorem ep_Q2_019_partial_05_0063_valid :
    mulPoly ep_Q2_019_coefficient_05_0063
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0064 : Poly :=
[
  term ((-1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 64 for generator 5. -/
def ep_Q2_019_partial_05_0064 : Poly :=
[
  term ((-1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (9, 1), (12, 1), (16, 1)],
  term ((-1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 5. -/
theorem ep_Q2_019_partial_05_0064_valid :
    mulPoly ep_Q2_019_coefficient_05_0064
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0065 : Poly :=
[
  term ((-2894800374752794351333051414305933664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 65 for generator 5. -/
def ep_Q2_019_partial_05_0065 : Poly :=
[
  term ((-2894800374752794351333051414305933664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (9, 1), (14, 1), (16, 1)],
  term ((-2894800374752794351333051414305933664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((2894800374752794351333051414305933664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2894800374752794351333051414305933664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 5. -/
theorem ep_Q2_019_partial_05_0065_valid :
    mulPoly ep_Q2_019_coefficient_05_0065
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0066 : Poly :=
[
  term ((-3032642545186873122021925637826469987346 : Rat) / 23197680161973262926159007190472393885) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 66 for generator 5. -/
def ep_Q2_019_partial_05_0066 : Poly :=
[
  term ((-3032642545186873122021925637826469987346 : Rat) / 23197680161973262926159007190472393885) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((-3032642545186873122021925637826469987346 : Rat) / 23197680161973262926159007190472393885) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((3032642545186873122021925637826469987346 : Rat) / 23197680161973262926159007190472393885) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((3032642545186873122021925637826469987346 : Rat) / 23197680161973262926159007190472393885) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 5. -/
theorem ep_Q2_019_partial_05_0066_valid :
    mulPoly ep_Q2_019_coefficient_05_0066
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0067 : Poly :=
[
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 5. -/
def ep_Q2_019_partial_05_0067 : Poly :=
[
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (9, 2), (13, 1), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (9, 2), (13, 1), (16, 1)],
  term ((129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 5. -/
theorem ep_Q2_019_partial_05_0067_valid :
    mulPoly ep_Q2_019_coefficient_05_0067
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0068 : Poly :=
[
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 5. -/
def ep_Q2_019_partial_05_0068 : Poly :=
[
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (2, 2), (9, 2), (15, 1), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (3, 2), (9, 2), (15, 1), (16, 1)],
  term ((-141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 5. -/
theorem ep_Q2_019_partial_05_0068_valid :
    mulPoly ep_Q2_019_coefficient_05_0068
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0069 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 69 for generator 5. -/
def ep_Q2_019_partial_05_0069 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 5. -/
theorem ep_Q2_019_partial_05_0069_valid :
    mulPoly ep_Q2_019_coefficient_05_0069
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0070 : Poly :=
[
  term ((4040648936244239692445173827537662016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 70 for generator 5. -/
def ep_Q2_019_partial_05_0070 : Poly :=
[
  term ((4040648936244239692445173827537662016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((4040648936244239692445173827537662016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-4040648936244239692445173827537662016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4040648936244239692445173827537662016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 5. -/
theorem ep_Q2_019_partial_05_0070_valid :
    mulPoly ep_Q2_019_coefficient_05_0070
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0071 : Poly :=
[
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 5. -/
def ep_Q2_019_partial_05_0071 : Poly :=
[
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 5. -/
theorem ep_Q2_019_partial_05_0071_valid :
    mulPoly ep_Q2_019_coefficient_05_0071
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0072 : Poly :=
[
  term ((465465286207373681828248657261333312 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 72 for generator 5. -/
def ep_Q2_019_partial_05_0072 : Poly :=
[
  term ((465465286207373681828248657261333312 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((465465286207373681828248657261333312 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-465465286207373681828248657261333312 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-465465286207373681828248657261333312 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 5. -/
theorem ep_Q2_019_partial_05_0072_valid :
    mulPoly ep_Q2_019_coefficient_05_0072
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0073 : Poly :=
[
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 73 for generator 5. -/
def ep_Q2_019_partial_05_0073 : Poly :=
[
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 5. -/
theorem ep_Q2_019_partial_05_0073_valid :
    mulPoly ep_Q2_019_coefficient_05_0073
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0074 : Poly :=
[
  term ((-6139644984599982468961978360359520555354 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 74 for generator 5. -/
def ep_Q2_019_partial_05_0074 : Poly :=
[
  term ((-6139644984599982468961978360359520555354 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-6139644984599982468961978360359520555354 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((6139644984599982468961978360359520555354 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((6139644984599982468961978360359520555354 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 5. -/
theorem ep_Q2_019_partial_05_0074_valid :
    mulPoly ep_Q2_019_coefficient_05_0074
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0075 : Poly :=
[
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 75 for generator 5. -/
def ep_Q2_019_partial_05_0075 : Poly :=
[
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 5. -/
theorem ep_Q2_019_partial_05_0075_valid :
    mulPoly ep_Q2_019_coefficient_05_0075
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0076 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 5. -/
def ep_Q2_019_partial_05_0076 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 5. -/
theorem ep_Q2_019_partial_05_0076_valid :
    mulPoly ep_Q2_019_coefficient_05_0076
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0077 : Poly :=
[
  term ((37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 5. -/
def ep_Q2_019_partial_05_0077 : Poly :=
[
  term ((37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 5. -/
theorem ep_Q2_019_partial_05_0077_valid :
    mulPoly ep_Q2_019_coefficient_05_0077
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0078 : Poly :=
[
  term ((3306677189475084585580641891265427616 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 78 for generator 5. -/
def ep_Q2_019_partial_05_0078 : Poly :=
[
  term ((3306677189475084585580641891265427616 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((3306677189475084585580641891265427616 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3306677189475084585580641891265427616 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3306677189475084585580641891265427616 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 5. -/
theorem ep_Q2_019_partial_05_0078_valid :
    mulPoly ep_Q2_019_coefficient_05_0078
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0079 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 79 for generator 5. -/
def ep_Q2_019_partial_05_0079 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 5. -/
theorem ep_Q2_019_partial_05_0079_valid :
    mulPoly ep_Q2_019_coefficient_05_0079
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0080 : Poly :=
[
  term ((1198183439886454128327245036192202398316 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 80 for generator 5. -/
def ep_Q2_019_partial_05_0080 : Poly :=
[
  term ((1198183439886454128327245036192202398316 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((1198183439886454128327245036192202398316 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-1198183439886454128327245036192202398316 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1198183439886454128327245036192202398316 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 5. -/
theorem ep_Q2_019_partial_05_0080_valid :
    mulPoly ep_Q2_019_coefficient_05_0080
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0081 : Poly :=
[
  term ((-4717584471286382908919735972647797024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 5. -/
def ep_Q2_019_partial_05_0081 : Poly :=
[
  term ((-4717584471286382908919735972647797024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4717584471286382908919735972647797024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((4717584471286382908919735972647797024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((4717584471286382908919735972647797024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 5. -/
theorem ep_Q2_019_partial_05_0081_valid :
    mulPoly ep_Q2_019_coefficient_05_0081
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0082 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 5. -/
def ep_Q2_019_partial_05_0082 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (14, 2), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 2), (15, 3), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 5. -/
theorem ep_Q2_019_partial_05_0082_valid :
    mulPoly ep_Q2_019_coefficient_05_0082
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0083 : Poly :=
[
  term ((-284695823131093394183935537563130676105549 : Rat) / 6835583087728121475574854118792532064780) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 5. -/
def ep_Q2_019_partial_05_0083 : Poly :=
[
  term ((-284695823131093394183935537563130676105549 : Rat) / 6835583087728121475574854118792532064780) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-284695823131093394183935537563130676105549 : Rat) / 6835583087728121475574854118792532064780) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((284695823131093394183935537563130676105549 : Rat) / 6835583087728121475574854118792532064780) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((284695823131093394183935537563130676105549 : Rat) / 6835583087728121475574854118792532064780) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 5. -/
theorem ep_Q2_019_partial_05_0083_valid :
    mulPoly ep_Q2_019_coefficient_05_0083
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0084 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 84 for generator 5. -/
def ep_Q2_019_partial_05_0084 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (15, 3), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (15, 3), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 2), (15, 3), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 5. -/
theorem ep_Q2_019_partial_05_0084_valid :
    mulPoly ep_Q2_019_coefficient_05_0084
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0085 : Poly :=
[
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (16, 1)]
]

/-- Partial product 85 for generator 5. -/
def ep_Q2_019_partial_05_0085 : Poly :=
[
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (3, 2), (16, 1)],
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (14, 2), (16, 1)],
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 5. -/
theorem ep_Q2_019_partial_05_0085_valid :
    mulPoly ep_Q2_019_coefficient_05_0085
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0086 : Poly :=
[
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (16, 1)]
]

/-- Partial product 86 for generator 5. -/
def ep_Q2_019_partial_05_0086 : Poly :=
[
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (2, 2), (12, 1), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 5. -/
theorem ep_Q2_019_partial_05_0086_valid :
    mulPoly ep_Q2_019_coefficient_05_0086
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0087 : Poly :=
[
  term ((8734674861541787355477033146862446632388 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (16, 1)]
]

/-- Partial product 87 for generator 5. -/
def ep_Q2_019_partial_05_0087 : Poly :=
[
  term ((8734674861541787355477033146862446632388 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (2, 2), (16, 1)],
  term ((8734674861541787355477033146862446632388 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (3, 2), (16, 1)],
  term ((-8734674861541787355477033146862446632388 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (14, 2), (16, 1)],
  term ((-8734674861541787355477033146862446632388 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 5. -/
theorem ep_Q2_019_partial_05_0087_valid :
    mulPoly ep_Q2_019_coefficient_05_0087
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0088 : Poly :=
[
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 88 for generator 5. -/
def ep_Q2_019_partial_05_0088 : Poly :=
[
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 3), (9, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 3), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 5. -/
theorem ep_Q2_019_partial_05_0088_valid :
    mulPoly ep_Q2_019_coefficient_05_0088
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0089 : Poly :=
[
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 89 for generator 5. -/
def ep_Q2_019_partial_05_0089 : Poly :=
[
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (5, 1), (7, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 5. -/
theorem ep_Q2_019_partial_05_0089_valid :
    mulPoly ep_Q2_019_coefficient_05_0089
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0090 : Poly :=
[
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 90 for generator 5. -/
def ep_Q2_019_partial_05_0090 : Poly :=
[
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 5. -/
theorem ep_Q2_019_partial_05_0090_valid :
    mulPoly ep_Q2_019_coefficient_05_0090
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0091 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 5. -/
def ep_Q2_019_partial_05_0091 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 5. -/
theorem ep_Q2_019_partial_05_0091_valid :
    mulPoly ep_Q2_019_coefficient_05_0091
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0092 : Poly :=
[
  term ((2929344891631404625948450548292766736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (16, 1)]
]

/-- Partial product 92 for generator 5. -/
def ep_Q2_019_partial_05_0092 : Poly :=
[
  term ((2929344891631404625948450548292766736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (6, 1), (16, 1)],
  term ((-2929344891631404625948450548292766736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((-2929344891631404625948450548292766736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((2929344891631404625948450548292766736 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 5. -/
theorem ep_Q2_019_partial_05_0092_valid :
    mulPoly ep_Q2_019_coefficient_05_0092
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0093 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 93 for generator 5. -/
def ep_Q2_019_partial_05_0093 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 5. -/
theorem ep_Q2_019_partial_05_0093_valid :
    mulPoly ep_Q2_019_coefficient_05_0093
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0094 : Poly :=
[
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 94 for generator 5. -/
def ep_Q2_019_partial_05_0094 : Poly :=
[
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 3), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 5. -/
theorem ep_Q2_019_partial_05_0094_valid :
    mulPoly ep_Q2_019_coefficient_05_0094
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0095 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 95 for generator 5. -/
def ep_Q2_019_partial_05_0095 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 3), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 5. -/
theorem ep_Q2_019_partial_05_0095_valid :
    mulPoly ep_Q2_019_coefficient_05_0095
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0096 : Poly :=
[
  term ((-383810599380916051420378930618778208 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 96 for generator 5. -/
def ep_Q2_019_partial_05_0096 : Poly :=
[
  term ((-383810599380916051420378930618778208 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((383810599380916051420378930618778208 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((383810599380916051420378930618778208 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-383810599380916051420378930618778208 : Rat) / 1251938294455699903951438483295335543) [(2, 3), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 5. -/
theorem ep_Q2_019_partial_05_0096_valid :
    mulPoly ep_Q2_019_coefficient_05_0096
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0097 : Poly :=
[
  term ((3030322944254215157945465431575264624 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 97 for generator 5. -/
def ep_Q2_019_partial_05_0097 : Poly :=
[
  term ((3030322944254215157945465431575264624 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3030322944254215157945465431575264624 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3030322944254215157945465431575264624 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3030322944254215157945465431575264624 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 5. -/
theorem ep_Q2_019_partial_05_0097_valid :
    mulPoly ep_Q2_019_coefficient_05_0097
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0098 : Poly :=
[
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 5. -/
def ep_Q2_019_partial_05_0098 : Poly :=
[
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 5. -/
theorem ep_Q2_019_partial_05_0098_valid :
    mulPoly ep_Q2_019_coefficient_05_0098
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 5. -/
def ep_Q2_019_coefficient_05_0099 : Poly :=
[
  term ((121060879381947624629846015416632624 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 5. -/
def ep_Q2_019_partial_05_0099 : Poly :=
[
  term ((121060879381947624629846015416632624 : Rat) / 894241638896928502822456059496668245) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-121060879381947624629846015416632624 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-121060879381947624629846015416632624 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((121060879381947624629846015416632624 : Rat) / 894241638896928502822456059496668245) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 5. -/
theorem ep_Q2_019_partial_05_0099_valid :
    mulPoly ep_Q2_019_coefficient_05_0099
        ep_Q2_019_generator_05_0000_0099 =
      ep_Q2_019_partial_05_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_05_0000_0099 : List Poly :=
[
  ep_Q2_019_partial_05_0000,
  ep_Q2_019_partial_05_0001,
  ep_Q2_019_partial_05_0002,
  ep_Q2_019_partial_05_0003,
  ep_Q2_019_partial_05_0004,
  ep_Q2_019_partial_05_0005,
  ep_Q2_019_partial_05_0006,
  ep_Q2_019_partial_05_0007,
  ep_Q2_019_partial_05_0008,
  ep_Q2_019_partial_05_0009,
  ep_Q2_019_partial_05_0010,
  ep_Q2_019_partial_05_0011,
  ep_Q2_019_partial_05_0012,
  ep_Q2_019_partial_05_0013,
  ep_Q2_019_partial_05_0014,
  ep_Q2_019_partial_05_0015,
  ep_Q2_019_partial_05_0016,
  ep_Q2_019_partial_05_0017,
  ep_Q2_019_partial_05_0018,
  ep_Q2_019_partial_05_0019,
  ep_Q2_019_partial_05_0020,
  ep_Q2_019_partial_05_0021,
  ep_Q2_019_partial_05_0022,
  ep_Q2_019_partial_05_0023,
  ep_Q2_019_partial_05_0024,
  ep_Q2_019_partial_05_0025,
  ep_Q2_019_partial_05_0026,
  ep_Q2_019_partial_05_0027,
  ep_Q2_019_partial_05_0028,
  ep_Q2_019_partial_05_0029,
  ep_Q2_019_partial_05_0030,
  ep_Q2_019_partial_05_0031,
  ep_Q2_019_partial_05_0032,
  ep_Q2_019_partial_05_0033,
  ep_Q2_019_partial_05_0034,
  ep_Q2_019_partial_05_0035,
  ep_Q2_019_partial_05_0036,
  ep_Q2_019_partial_05_0037,
  ep_Q2_019_partial_05_0038,
  ep_Q2_019_partial_05_0039,
  ep_Q2_019_partial_05_0040,
  ep_Q2_019_partial_05_0041,
  ep_Q2_019_partial_05_0042,
  ep_Q2_019_partial_05_0043,
  ep_Q2_019_partial_05_0044,
  ep_Q2_019_partial_05_0045,
  ep_Q2_019_partial_05_0046,
  ep_Q2_019_partial_05_0047,
  ep_Q2_019_partial_05_0048,
  ep_Q2_019_partial_05_0049,
  ep_Q2_019_partial_05_0050,
  ep_Q2_019_partial_05_0051,
  ep_Q2_019_partial_05_0052,
  ep_Q2_019_partial_05_0053,
  ep_Q2_019_partial_05_0054,
  ep_Q2_019_partial_05_0055,
  ep_Q2_019_partial_05_0056,
  ep_Q2_019_partial_05_0057,
  ep_Q2_019_partial_05_0058,
  ep_Q2_019_partial_05_0059,
  ep_Q2_019_partial_05_0060,
  ep_Q2_019_partial_05_0061,
  ep_Q2_019_partial_05_0062,
  ep_Q2_019_partial_05_0063,
  ep_Q2_019_partial_05_0064,
  ep_Q2_019_partial_05_0065,
  ep_Q2_019_partial_05_0066,
  ep_Q2_019_partial_05_0067,
  ep_Q2_019_partial_05_0068,
  ep_Q2_019_partial_05_0069,
  ep_Q2_019_partial_05_0070,
  ep_Q2_019_partial_05_0071,
  ep_Q2_019_partial_05_0072,
  ep_Q2_019_partial_05_0073,
  ep_Q2_019_partial_05_0074,
  ep_Q2_019_partial_05_0075,
  ep_Q2_019_partial_05_0076,
  ep_Q2_019_partial_05_0077,
  ep_Q2_019_partial_05_0078,
  ep_Q2_019_partial_05_0079,
  ep_Q2_019_partial_05_0080,
  ep_Q2_019_partial_05_0081,
  ep_Q2_019_partial_05_0082,
  ep_Q2_019_partial_05_0083,
  ep_Q2_019_partial_05_0084,
  ep_Q2_019_partial_05_0085,
  ep_Q2_019_partial_05_0086,
  ep_Q2_019_partial_05_0087,
  ep_Q2_019_partial_05_0088,
  ep_Q2_019_partial_05_0089,
  ep_Q2_019_partial_05_0090,
  ep_Q2_019_partial_05_0091,
  ep_Q2_019_partial_05_0092,
  ep_Q2_019_partial_05_0093,
  ep_Q2_019_partial_05_0094,
  ep_Q2_019_partial_05_0095,
  ep_Q2_019_partial_05_0096,
  ep_Q2_019_partial_05_0097,
  ep_Q2_019_partial_05_0098,
  ep_Q2_019_partial_05_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_05_0000_0099 : Poly :=
[
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 2), (3, 1), (16, 1)],
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 3), (16, 1)],
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((-1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-4122502409022819590582721190280266944 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((-9802334824503718873827289756703625792 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (9, 1), (16, 1)],
  term ((3365380515982658493853141159016736288 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((1830662208186520720047883978954649691456 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 2), (16, 1)],
  term ((-2743052616480419035590252295390187136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (8, 1), (16, 1)],
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (9, 1), (11, 1), (16, 1)],
  term ((883503862017303696461817885763833147152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((918883933002361606066613853776769036679 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 2), (9, 2), (16, 1)],
  term ((-118777158431756497244353729989722263680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4439931305382723564743814822921107973927 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6093959779410369906984172866422359392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((8155085332602556629391335241168667296 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (14, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-8809617505418871185331191044068883773416 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (2, 2), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 3), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4122502409022819590582721190280266944 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((-9802334824503718873827289756703625792 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((3365380515982658493853141159016736288 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((1830662208186520720047883978954649691456 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (7, 2), (16, 1)],
  term ((-2743052616480419035590252295390187136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (8, 1), (16, 1)],
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((883503862017303696461817885763833147152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((918883933002361606066613853776769036679 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (3, 2), (9, 2), (16, 1)],
  term ((-118777158431756497244353729989722263680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4439931305382723564743814822921107973927 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6093959779410369906984172866422359392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term ((8155085332602556629391335241168667296 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (14, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-8809617505418871185331191044068883773416 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (3, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 3), (9, 1), (16, 1)],
  term ((4122502409022819590582721190280266944 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((4122502409022819590582721190280266944 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((9802334824503718873827289756703625792 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((9802334824503718873827289756703625792 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3365380515982658493853141159016736288 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3365380515982658493853141159016736288 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1830662208186520720047883978954649691456 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1830662208186520720047883978954649691456 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((2743052616480419035590252295390187136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (14, 2), (16, 1)],
  term ((2743052616480419035590252295390187136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-883503862017303696461817885763833147152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-883503862017303696461817885763833147152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-918883933002361606066613853776769036679 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-918883933002361606066613853776769036679 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (14, 2), (16, 1)],
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((118777158431756497244353729989722263680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((118777158431756497244353729989722263680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4439931305382723564743814822921107973927 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4439931305382723564743814822921107973927 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((6093959779410369906984172866422359392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((6093959779410369906984172866422359392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8155085332602556629391335241168667296 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((8809617505418871185331191044068883773416 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (14, 2), (16, 1)],
  term ((-8155085332602556629391335241168667296 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 3), (16, 1)],
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 4), (16, 1)],
  term ((8809617505418871185331191044068883773416 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (15, 2), (16, 1)],
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (15, 4), (16, 1)],
  term ((6444371339526384591574130277420462976 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 2), (16, 1)],
  term ((6444371339526384591574130277420462976 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 2), (16, 1)],
  term ((-6444371339526384591574130277420462976 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (14, 2), (16, 1)],
  term ((-6444371339526384591574130277420462976 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (15, 2), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (14, 2), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((1158321685415405096287400718440460776 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 1), (3, 2), (5, 1), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (7, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (3, 2), (9, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-11890244213683620138301764530758452848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1545874408267593441020238661943094473392 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((1154594906413856795092707916089142442396 : Rat) / 16275197827924098751368700282839362059) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 3), (16, 1)],
  term ((-1158321685415405096287400718440460776 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 1), (5, 1), (14, 2), (16, 1)],
  term ((-1158321685415405096287400718440460776 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 3), (16, 1)],
  term ((-851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((11890244213683620138301764530758452848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 3), (16, 1)],
  term ((11890244213683620138301764530758452848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)],
  term ((1545874408267593441020238661943094473392 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((1545874408267593441020238661943094473392 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1154594906413856795092707916089142442396 : Rat) / 16275197827924098751368700282839362059) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1154594906413856795092707916089142442396 : Rat) / 16275197827924098751368700282839362059) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((524661423610086738350799492251678976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 2), (3, 1), (4, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (3, 1), (6, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-121093273461226199459274535264308480 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (3, 1), (12, 1), (16, 1)],
  term ((-180709170909539657461877290952756640 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (3, 1), (14, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-26483056253725260441504943116885191162288 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (4, 1), (9, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((801590825773726315045587225993709824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (4, 1), (13, 1), (16, 1)],
  term ((-5944594306895340568717170500198900064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (5, 1), (9, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (5, 1), (12, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (5, 1), (14, 1), (16, 1)],
  term ((-11153320007212271167753816975356649848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (6, 1), (7, 1), (16, 1)],
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-67984507707472703160333566745378545184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((53583852759435716206028771886337289608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (9, 1), (12, 1), (16, 1)],
  term ((-2894800374752794351333051414305933664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (9, 1), (14, 1), (16, 1)],
  term ((-3032642545186873122021925637826469987346 : Rat) / 23197680161973262926159007190472393885) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (9, 2), (13, 1), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (2, 2), (9, 2), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4040648936244239692445173827537662016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((465465286207373681828248657261333312 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((-6139644984599982468961978360359520555354 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((3306677189475084585580641891265427616 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((1198183439886454128327245036192202398316 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-4717584471286382908919735972647797024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (14, 2), (15, 1), (16, 1)],
  term ((-284695823131093394183935537563130676105549 : Rat) / 6835583087728121475574854118792532064780) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 2), (15, 3), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 3), (3, 1), (16, 1)],
  term ((1158321685415405096287400718440460776 : Rat) / 894241638896928502822456059496668245) [(1, 1), (2, 3), (5, 1), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (7, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (9, 1), (14, 1), (16, 1)],
  term ((851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 3), (9, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (11, 1), (14, 1), (16, 1)],
  term ((-11890244213683620138301764530758452848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (11, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1545874408267593441020238661943094473392 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 3), (14, 1), (15, 1), (16, 1)],
  term ((1154594906413856795092707916089142442396 : Rat) / 16275197827924098751368700282839362059) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-524661423610086738350799492251678976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (4, 1), (14, 2), (16, 1)],
  term ((-524661423610086738350799492251678976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((121093273461226199459274535264308480 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (12, 1), (14, 2), (16, 1)],
  term ((121093273461226199459274535264308480 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((180709170909539657461877290952756640 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((26483056253725260441504943116885191162288 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((180709170909539657461877290952756640 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (14, 3), (16, 1)],
  term ((26483056253725260441504943116885191162288 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (4, 1), (9, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 2), (4, 1), (11, 1), (16, 1)],
  term ((801590825773726315045587225993709824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (4, 1), (13, 1), (16, 1)],
  term ((-5944594306895340568717170500198900064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (5, 1), (9, 2), (16, 1)],
  term ((136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((-11153320007212271167753816975356649848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (6, 1), (7, 1), (16, 1)],
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 2), (6, 1), (11, 1), (16, 1)],
  term ((2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((-67984507707472703160333566745378545184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((53583852759435716206028771886337289608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((-2894800374752794351333051414305933664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((-3032642545186873122021925637826469987346 : Rat) / 23197680161973262926159007190472393885) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (9, 2), (13, 1), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (3, 2), (9, 2), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4040648936244239692445173827537662016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((465465286207373681828248657261333312 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((-6139644984599982468961978360359520555354 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((3306677189475084585580641891265427616 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((1198183439886454128327245036192202398316 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-4717584471286382908919735972647797024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)],
  term ((-284695823131093394183935537563130676105549 : Rat) / 6835583087728121475574854118792532064780) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (15, 3), (16, 1)],
  term ((524661423610086738350799492251678976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 3), (4, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 3), (6, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 3), (9, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 3), (9, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 3), (11, 1), (15, 1), (16, 1)],
  term ((-121093273461226199459274535264308480 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 3), (12, 1), (16, 1)],
  term ((-180709170909539657461877290952756640 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 3), (14, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 3), (15, 2), (16, 1)],
  term ((-26483056253725260441504943116885191162288 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 3), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (14, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-801590825773726315045587225993709824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-801590825773726315045587225993709824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((5944594306895340568717170500198900064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((5944594306895340568717170500198900064 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-136146814539278230178855194765472064 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((11153320007212271167753816975356649848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((11153320007212271167753816975356649848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((67984507707472703160333566745378545184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((67984507707472703160333566745378545184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-53583852759435716206028771886337289608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-53583852759435716206028771886337289608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 3), (16, 1)],
  term ((1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((2894800374752794351333051414305933664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((3032642545186873122021925637826469987346 : Rat) / 23197680161973262926159007190472393885) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((2894800374752794351333051414305933664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 3), (16, 1)],
  term ((3032642545186873122021925637826469987346 : Rat) / 23197680161973262926159007190472393885) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4040648936244239692445173827537662016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((-4040648936244239692445173827537662016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-465465286207373681828248657261333312 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((6139644984599982468961978360359520555354 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-465465286207373681828248657261333312 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (14, 3), (16, 1)],
  term ((6139644984599982468961978360359520555354 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3306677189475084585580641891265427616 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1198183439886454128327245036192202398316 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3306677189475084585580641891265427616 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1198183439886454128327245036192202398316 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((4717584471286382908919735972647797024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((284695823131093394183935537563130676105549 : Rat) / 6835583087728121475574854118792532064780) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 2), (15, 3), (16, 1)],
  term ((4717584471286382908919735972647797024 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 4), (15, 1), (16, 1)],
  term ((284695823131093394183935537563130676105549 : Rat) / 6835583087728121475574854118792532064780) [(1, 1), (15, 3), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (15, 5), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (3, 2), (16, 1)],
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (14, 2), (16, 1)],
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (2, 2), (12, 1), (16, 1)],
  term ((8734674861541787355477033146862446632388 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (2, 2), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 3), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((8734674861541787355477033146862446632388 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (3, 2), (16, 1)],
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8734674861541787355477033146862446632388 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (14, 2), (16, 1)],
  term ((-8734674861541787355477033146862446632388 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (15, 2), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((2929344891631404625948450548292766736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (6, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-383810599380916051420378930618778208 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((3030322944254215157945465431575264624 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((121060879381947624629846015416632624 : Rat) / 894241638896928502822456059496668245) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 3), (9, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-2929344891631404625948450548292766736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((-2929344891631404625948450548292766736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((383810599380916051420378930618778208 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 3), (16, 1)],
  term ((383810599380916051420378930618778208 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3030322944254215157945465431575264624 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3030322944254215157945465431575264624 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-121060879381947624629846015416632624 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-121060879381947624629846015416632624 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 3), (3, 1), (9, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (5, 1), (7, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (5, 1), (9, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (5, 1), (15, 1), (16, 1)],
  term ((2929344891631404625948450548292766736 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (6, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 3), (7, 1), (9, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-383810599380916051420378930618778208 : Rat) / 1251938294455699903951438483295335543) [(2, 3), (7, 1), (11, 1), (16, 1)],
  term ((3030322944254215157945465431575264624 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (7, 1), (13, 1), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 3), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((121060879381947624629846015416632624 : Rat) / 894241638896928502822456059496668245) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 0 through 99. -/
theorem ep_Q2_019_block_05_0000_0099_valid :
    checkProductSumEq ep_Q2_019_partials_05_0000_0099
      ep_Q2_019_block_05_0000_0099 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
