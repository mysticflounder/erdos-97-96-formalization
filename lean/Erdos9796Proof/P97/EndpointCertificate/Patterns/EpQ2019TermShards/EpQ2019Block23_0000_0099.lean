/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 23:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_23_0000_0099 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0000 : Poly :=
[
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (16, 1)]
]

/-- Partial product 0 for generator 23. -/
def ep_Q2_019_partial_23_0000 : Poly :=
[
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 23. -/
theorem ep_Q2_019_partial_23_0000_valid :
    mulPoly ep_Q2_019_coefficient_23_0000
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0001 : Poly :=
[
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 23. -/
def ep_Q2_019_partial_23_0001 : Poly :=
[
  term ((-3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 23. -/
theorem ep_Q2_019_partial_23_0001_valid :
    mulPoly ep_Q2_019_coefficient_23_0001
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0002 : Poly :=
[
  term ((-10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 23. -/
def ep_Q2_019_partial_23_0002 : Poly :=
[
  term ((-20885659741763263429951146049575936 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20885659741763263429951146049575936 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 23. -/
theorem ep_Q2_019_partial_23_0002_valid :
    mulPoly ep_Q2_019_coefficient_23_0002
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0003 : Poly :=
[
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 3 for generator 23. -/
def ep_Q2_019_partial_23_0003 : Poly :=
[
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 23. -/
theorem ep_Q2_019_partial_23_0003_valid :
    mulPoly ep_Q2_019_coefficient_23_0003
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0004 : Poly :=
[
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 23. -/
def ep_Q2_019_partial_23_0004 : Poly :=
[
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 23. -/
theorem ep_Q2_019_partial_23_0004_valid :
    mulPoly ep_Q2_019_coefficient_23_0004
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0005 : Poly :=
[
  term ((-106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 5 for generator 23. -/
def ep_Q2_019_partial_23_0005 : Poly :=
[
  term ((-213829147697446740888389801616717888 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-213829147697446740888389801616717888 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 23. -/
theorem ep_Q2_019_partial_23_0005_valid :
    mulPoly ep_Q2_019_coefficient_23_0005
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0006 : Poly :=
[
  term ((11531573763255979309549529885750853504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 6 for generator 23. -/
def ep_Q2_019_partial_23_0006 : Poly :=
[
  term ((23063147526511958619099059771501707008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((23063147526511958619099059771501707008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11531573763255979309549529885750853504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((-11531573763255979309549529885750853504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 23. -/
theorem ep_Q2_019_partial_23_0006_valid :
    mulPoly ep_Q2_019_coefficient_23_0006
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0007 : Poly :=
[
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 7 for generator 23. -/
def ep_Q2_019_partial_23_0007 : Poly :=
[
  term ((5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 23. -/
theorem ep_Q2_019_partial_23_0007_valid :
    mulPoly ep_Q2_019_coefficient_23_0007
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0008 : Poly :=
[
  term ((-1268058924019857683004428359608919392 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 23. -/
def ep_Q2_019_partial_23_0008 : Poly :=
[
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1268058924019857683004428359608919392 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((1268058924019857683004428359608919392 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 23. -/
theorem ep_Q2_019_partial_23_0008_valid :
    mulPoly ep_Q2_019_coefficient_23_0008
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0009 : Poly :=
[
  term ((-1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 9 for generator 23. -/
def ep_Q2_019_partial_23_0009 : Poly :=
[
  term ((-3550017554808201398460482056019801943168 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550017554808201398460482056019801943168 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 23. -/
theorem ep_Q2_019_partial_23_0009_valid :
    mulPoly ep_Q2_019_coefficient_23_0009
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0010 : Poly :=
[
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 23. -/
def ep_Q2_019_partial_23_0010 : Poly :=
[
  term ((253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 23. -/
theorem ep_Q2_019_partial_23_0010_valid :
    mulPoly ep_Q2_019_coefficient_23_0010
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0011 : Poly :=
[
  term ((-7013115746754521499747835509100229376 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 11 for generator 23. -/
def ep_Q2_019_partial_23_0011 : Poly :=
[
  term ((-14026231493509042999495671018200458752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-14026231493509042999495671018200458752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((7013115746754521499747835509100229376 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (14, 2), (16, 1)],
  term ((7013115746754521499747835509100229376 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 23. -/
theorem ep_Q2_019_partial_23_0011_valid :
    mulPoly ep_Q2_019_coefficient_23_0011
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0012 : Poly :=
[
  term ((308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 23. -/
def ep_Q2_019_partial_23_0012 : Poly :=
[
  term ((617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 23. -/
theorem ep_Q2_019_partial_23_0012_valid :
    mulPoly ep_Q2_019_coefficient_23_0012
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0013 : Poly :=
[
  term ((1593833099529502496332997158579313465536 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 23. -/
def ep_Q2_019_partial_23_0013 : Poly :=
[
  term ((3187666199059004992665994317158626931072 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3187666199059004992665994317158626931072 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1593833099529502496332997158579313465536 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1593833099529502496332997158579313465536 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 23. -/
theorem ep_Q2_019_partial_23_0013_valid :
    mulPoly ep_Q2_019_coefficient_23_0013
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0014 : Poly :=
[
  term ((-1188825650762799888392462595146781197206 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 23. -/
def ep_Q2_019_partial_23_0014 : Poly :=
[
  term ((-2377651301525599776784925190293562394412 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2377651301525599776784925190293562394412 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1188825650762799888392462595146781197206 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1188825650762799888392462595146781197206 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 23. -/
theorem ep_Q2_019_partial_23_0014_valid :
    mulPoly ep_Q2_019_coefficient_23_0014
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0015 : Poly :=
[
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (16, 1)]
]

/-- Partial product 15 for generator 23. -/
def ep_Q2_019_partial_23_0015 : Poly :=
[
  term ((5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (14, 2), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 23. -/
theorem ep_Q2_019_partial_23_0015_valid :
    mulPoly ep_Q2_019_coefficient_23_0015
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0016 : Poly :=
[
  term ((-1233691582114570854593915395194702384 : Rat) / 368217145428147030573952495086863395) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 23. -/
def ep_Q2_019_partial_23_0016 : Poly :=
[
  term ((-2467383164229141709187830790389404768 : Rat) / 368217145428147030573952495086863395) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1233691582114570854593915395194702384 : Rat) / 368217145428147030573952495086863395) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1233691582114570854593915395194702384 : Rat) / 368217145428147030573952495086863395) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2467383164229141709187830790389404768 : Rat) / 368217145428147030573952495086863395) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 23. -/
theorem ep_Q2_019_partial_23_0016_valid :
    mulPoly ep_Q2_019_coefficient_23_0016
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0017 : Poly :=
[
  term ((3325303718235376922355700939946782041423 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 23. -/
def ep_Q2_019_partial_23_0017 : Poly :=
[
  term ((3325303718235376922355700939946782041423 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3325303718235376922355700939946782041423 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3325303718235376922355700939946782041423 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((3325303718235376922355700939946782041423 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 23. -/
theorem ep_Q2_019_partial_23_0017_valid :
    mulPoly ep_Q2_019_coefficient_23_0017
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0018 : Poly :=
[
  term ((13373142663109519148295529578876331008 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 18 for generator 23. -/
def ep_Q2_019_partial_23_0018 : Poly :=
[
  term ((26746285326219038296591059157752662016 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((26746285326219038296591059157752662016 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13373142663109519148295529578876331008 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-13373142663109519148295529578876331008 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 23. -/
theorem ep_Q2_019_partial_23_0018_valid :
    mulPoly ep_Q2_019_coefficient_23_0018
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0019 : Poly :=
[
  term ((8775353149460261144348549533951123824 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 19 for generator 23. -/
def ep_Q2_019_partial_23_0019 : Poly :=
[
  term ((17550706298920522288697099067902247648 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((17550706298920522288697099067902247648 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8775353149460261144348549533951123824 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8775353149460261144348549533951123824 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 23. -/
theorem ep_Q2_019_partial_23_0019_valid :
    mulPoly ep_Q2_019_coefficient_23_0019
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0020 : Poly :=
[
  term ((13313172355837186378360282616998680267898 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (16, 1)]
]

/-- Partial product 20 for generator 23. -/
def ep_Q2_019_partial_23_0020 : Poly :=
[
  term ((26626344711674372756720565233997360535796 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((26626344711674372756720565233997360535796 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13313172355837186378360282616998680267898 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (14, 2), (16, 1)],
  term ((-13313172355837186378360282616998680267898 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 23. -/
theorem ep_Q2_019_partial_23_0020_valid :
    mulPoly ep_Q2_019_coefficient_23_0020
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0021 : Poly :=
[
  term ((-918505325359390881196309559707616576 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (16, 1)]
]

/-- Partial product 21 for generator 23. -/
def ep_Q2_019_partial_23_0021 : Poly :=
[
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((918505325359390881196309559707616576 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (14, 2), (16, 1)],
  term ((918505325359390881196309559707616576 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 23. -/
theorem ep_Q2_019_partial_23_0021_valid :
    mulPoly ep_Q2_019_coefficient_23_0021
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0022 : Poly :=
[
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (16, 1)]
]

/-- Partial product 22 for generator 23. -/
def ep_Q2_019_partial_23_0022 : Poly :=
[
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (14, 2), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 23. -/
theorem ep_Q2_019_partial_23_0022_valid :
    mulPoly ep_Q2_019_coefficient_23_0022
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0023 : Poly :=
[
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (16, 1)]
]

/-- Partial product 23 for generator 23. -/
def ep_Q2_019_partial_23_0023 : Poly :=
[
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (14, 2), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 23. -/
theorem ep_Q2_019_partial_23_0023_valid :
    mulPoly ep_Q2_019_coefficient_23_0023
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0024 : Poly :=
[
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (16, 1)]
]

/-- Partial product 24 for generator 23. -/
def ep_Q2_019_partial_23_0024 : Poly :=
[
  term ((16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 23. -/
theorem ep_Q2_019_partial_23_0024_valid :
    mulPoly ep_Q2_019_coefficient_23_0024
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0025 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 25 for generator 23. -/
def ep_Q2_019_partial_23_0025 : Poly :=
[
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 23. -/
theorem ep_Q2_019_partial_23_0025_valid :
    mulPoly ep_Q2_019_coefficient_23_0025
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0026 : Poly :=
[
  term ((-851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

/-- Partial product 26 for generator 23. -/
def ep_Q2_019_partial_23_0026 : Poly :=
[
  term ((-1703023193121861081361938139214814547304 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1703023193121861081361938139214814547304 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 23. -/
theorem ep_Q2_019_partial_23_0026_valid :
    mulPoly ep_Q2_019_coefficient_23_0026
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0027 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 23. -/
def ep_Q2_019_partial_23_0027 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 3), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 23. -/
theorem ep_Q2_019_partial_23_0027_valid :
    mulPoly ep_Q2_019_coefficient_23_0027
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0028 : Poly :=
[
  term ((10249184753004669204066798381913685744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 23. -/
def ep_Q2_019_partial_23_0028 : Poly :=
[
  term ((20498369506009338408133596763827371488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10249184753004669204066798381913685744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10249184753004669204066798381913685744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((20498369506009338408133596763827371488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 23. -/
theorem ep_Q2_019_partial_23_0028_valid :
    mulPoly ep_Q2_019_coefficient_23_0028
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0029 : Poly :=
[
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 23. -/
def ep_Q2_019_partial_23_0029 : Poly :=
[
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 23. -/
theorem ep_Q2_019_partial_23_0029_valid :
    mulPoly ep_Q2_019_coefficient_23_0029
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0030 : Poly :=
[
  term ((314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 23. -/
def ep_Q2_019_partial_23_0030 : Poly :=
[
  term ((629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 23. -/
theorem ep_Q2_019_partial_23_0030_valid :
    mulPoly ep_Q2_019_coefficient_23_0030
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0031 : Poly :=
[
  term ((-5754497080853240568138416698962382069804 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 23. -/
def ep_Q2_019_partial_23_0031 : Poly :=
[
  term ((-11508994161706481136276833397924764139608 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11508994161706481136276833397924764139608 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((5754497080853240568138416698962382069804 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((5754497080853240568138416698962382069804 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 23. -/
theorem ep_Q2_019_partial_23_0031_valid :
    mulPoly ep_Q2_019_coefficient_23_0031
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0032 : Poly :=
[
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (16, 1)]
]

/-- Partial product 32 for generator 23. -/
def ep_Q2_019_partial_23_0032 : Poly :=
[
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (14, 2), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 23. -/
theorem ep_Q2_019_partial_23_0032_valid :
    mulPoly ep_Q2_019_coefficient_23_0032
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0033 : Poly :=
[
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (16, 1)]
]

/-- Partial product 33 for generator 23. -/
def ep_Q2_019_partial_23_0033 : Poly :=
[
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 23. -/
theorem ep_Q2_019_partial_23_0033_valid :
    mulPoly ep_Q2_019_coefficient_23_0033
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0034 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 23. -/
def ep_Q2_019_partial_23_0034 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 23. -/
theorem ep_Q2_019_partial_23_0034_valid :
    mulPoly ep_Q2_019_coefficient_23_0034
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0035 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 23. -/
def ep_Q2_019_partial_23_0035 : Poly :=
[
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 23. -/
theorem ep_Q2_019_partial_23_0035_valid :
    mulPoly ep_Q2_019_coefficient_23_0035
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0036 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 36 for generator 23. -/
def ep_Q2_019_partial_23_0036 : Poly :=
[
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 23. -/
theorem ep_Q2_019_partial_23_0036_valid :
    mulPoly ep_Q2_019_coefficient_23_0036
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0037 : Poly :=
[
  term ((26744257346631612282020677129457593947152 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 37 for generator 23. -/
def ep_Q2_019_partial_23_0037 : Poly :=
[
  term ((53488514693263224564041354258915187894304 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((53488514693263224564041354258915187894304 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-26744257346631612282020677129457593947152 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-26744257346631612282020677129457593947152 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 23. -/
theorem ep_Q2_019_partial_23_0037_valid :
    mulPoly ep_Q2_019_coefficient_23_0037
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0038 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 38 for generator 23. -/
def ep_Q2_019_partial_23_0038 : Poly :=
[
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (14, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 23. -/
theorem ep_Q2_019_partial_23_0038_valid :
    mulPoly ep_Q2_019_coefficient_23_0038
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0039 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 39 for generator 23. -/
def ep_Q2_019_partial_23_0039 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 23. -/
theorem ep_Q2_019_partial_23_0039_valid :
    mulPoly ep_Q2_019_coefficient_23_0039
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0040 : Poly :=
[
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 23. -/
def ep_Q2_019_partial_23_0040 : Poly :=
[
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 23. -/
theorem ep_Q2_019_partial_23_0040_valid :
    mulPoly ep_Q2_019_coefficient_23_0040
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0041 : Poly :=
[
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 23. -/
def ep_Q2_019_partial_23_0041 : Poly :=
[
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 23. -/
theorem ep_Q2_019_partial_23_0041_valid :
    mulPoly ep_Q2_019_coefficient_23_0041
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0042 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 42 for generator 23. -/
def ep_Q2_019_partial_23_0042 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 23. -/
theorem ep_Q2_019_partial_23_0042_valid :
    mulPoly ep_Q2_019_coefficient_23_0042
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0043 : Poly :=
[
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 43 for generator 23. -/
def ep_Q2_019_partial_23_0043 : Poly :=
[
  term ((563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 23. -/
theorem ep_Q2_019_partial_23_0043_valid :
    mulPoly ep_Q2_019_coefficient_23_0043
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0044 : Poly :=
[
  term ((836218933477960609280439195013341912 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 44 for generator 23. -/
def ep_Q2_019_partial_23_0044 : Poly :=
[
  term ((1672437866955921218560878390026683824 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((1672437866955921218560878390026683824 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-836218933477960609280439195013341912 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-836218933477960609280439195013341912 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 23. -/
theorem ep_Q2_019_partial_23_0044_valid :
    mulPoly ep_Q2_019_coefficient_23_0044
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0045 : Poly :=
[
  term ((1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 45 for generator 23. -/
def ep_Q2_019_partial_23_0045 : Poly :=
[
  term ((2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 23. -/
theorem ep_Q2_019_partial_23_0045_valid :
    mulPoly ep_Q2_019_coefficient_23_0045
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0046 : Poly :=
[
  term ((-2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 46 for generator 23. -/
def ep_Q2_019_partial_23_0046 : Poly :=
[
  term ((-4066285354755736714859273051271981252096 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4066285354755736714859273051271981252096 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 23. -/
theorem ep_Q2_019_partial_23_0046_valid :
    mulPoly ep_Q2_019_coefficient_23_0046
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0047 : Poly :=
[
  term ((126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 23. -/
def ep_Q2_019_partial_23_0047 : Poly :=
[
  term ((253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 23. -/
theorem ep_Q2_019_partial_23_0047_valid :
    mulPoly ep_Q2_019_coefficient_23_0047
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0048 : Poly :=
[
  term ((60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 48 for generator 23. -/
def ep_Q2_019_partial_23_0048 : Poly :=
[
  term ((120068035191396828944197718935114598976 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((120068035191396828944197718935114598976 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 23. -/
theorem ep_Q2_019_partial_23_0048_valid :
    mulPoly ep_Q2_019_coefficient_23_0048
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0049 : Poly :=
[
  term ((-50109496099339785204308510489024152408 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 49 for generator 23. -/
def ep_Q2_019_partial_23_0049 : Poly :=
[
  term ((-100218992198679570408617020978048304816 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-100218992198679570408617020978048304816 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((50109496099339785204308510489024152408 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((50109496099339785204308510489024152408 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 23. -/
theorem ep_Q2_019_partial_23_0049_valid :
    mulPoly ep_Q2_019_coefficient_23_0049
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0050 : Poly :=
[
  term ((2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 23. -/
def ep_Q2_019_partial_23_0050 : Poly :=
[
  term ((4380602695998315780342061101899340288 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4380602695998315780342061101899340288 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 23. -/
theorem ep_Q2_019_partial_23_0050_valid :
    mulPoly ep_Q2_019_coefficient_23_0050
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0051 : Poly :=
[
  term ((-192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 51 for generator 23. -/
def ep_Q2_019_partial_23_0051 : Poly :=
[
  term ((-385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 23. -/
theorem ep_Q2_019_partial_23_0051_valid :
    mulPoly ep_Q2_019_coefficient_23_0051
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0052 : Poly :=
[
  term ((-908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 23. -/
def ep_Q2_019_partial_23_0052 : Poly :=
[
  term ((-1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 23. -/
theorem ep_Q2_019_partial_23_0052_valid :
    mulPoly ep_Q2_019_coefficient_23_0052
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0053 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 53 for generator 23. -/
def ep_Q2_019_partial_23_0053 : Poly :=
[
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 23. -/
theorem ep_Q2_019_partial_23_0053_valid :
    mulPoly ep_Q2_019_coefficient_23_0053
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0054 : Poly :=
[
  term ((1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 54 for generator 23. -/
def ep_Q2_019_partial_23_0054 : Poly :=
[
  term ((3368504232452463033478590306095654592 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3368504232452463033478590306095654592 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 23. -/
theorem ep_Q2_019_partial_23_0054_valid :
    mulPoly ep_Q2_019_coefficient_23_0054
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0055 : Poly :=
[
  term ((-986525965542614849997822545154677056 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 23. -/
def ep_Q2_019_partial_23_0055 : Poly :=
[
  term ((-1973051931085229699995645090309354112 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-1973051931085229699995645090309354112 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((986525965542614849997822545154677056 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((986525965542614849997822545154677056 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 23. -/
theorem ep_Q2_019_partial_23_0055_valid :
    mulPoly ep_Q2_019_coefficient_23_0055
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0056 : Poly :=
[
  term ((61771051060373066818617547522668285899296 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 56 for generator 23. -/
def ep_Q2_019_partial_23_0056 : Poly :=
[
  term ((123542102120746133637235095045336571798592 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((123542102120746133637235095045336571798592 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-61771051060373066818617547522668285899296 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-61771051060373066818617547522668285899296 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 23. -/
theorem ep_Q2_019_partial_23_0056_valid :
    mulPoly ep_Q2_019_coefficient_23_0056
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0057 : Poly :=
[
  term ((129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 23. -/
def ep_Q2_019_partial_23_0057 : Poly :=
[
  term ((258032819784045854781171729780402432 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((258032819784045854781171729780402432 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 23. -/
theorem ep_Q2_019_partial_23_0057_valid :
    mulPoly ep_Q2_019_coefficient_23_0057
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0058 : Poly :=
[
  term ((-141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 23. -/
def ep_Q2_019_partial_23_0058 : Poly :=
[
  term ((-282362921683250545271503757322663936 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-282362921683250545271503757322663936 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 23. -/
theorem ep_Q2_019_partial_23_0058_valid :
    mulPoly ep_Q2_019_coefficient_23_0058
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0059 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 59 for generator 23. -/
def ep_Q2_019_partial_23_0059 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 23. -/
theorem ep_Q2_019_partial_23_0059_valid :
    mulPoly ep_Q2_019_coefficient_23_0059
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0060 : Poly :=
[
  term ((-758530014886337823975241529848127808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 60 for generator 23. -/
def ep_Q2_019_partial_23_0060 : Poly :=
[
  term ((-1517060029772675647950483059696255616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((758530014886337823975241529848127808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((758530014886337823975241529848127808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1517060029772675647950483059696255616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 23. -/
theorem ep_Q2_019_partial_23_0060_valid :
    mulPoly ep_Q2_019_coefficient_23_0060
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0061 : Poly :=
[
  term ((-165996235203139382880339470732293504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 61 for generator 23. -/
def ep_Q2_019_partial_23_0061 : Poly :=
[
  term ((-331992470406278765760678941464587008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((165996235203139382880339470732293504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((165996235203139382880339470732293504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (14, 3), (16, 1)],
  term ((-331992470406278765760678941464587008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 23. -/
theorem ep_Q2_019_partial_23_0061_valid :
    mulPoly ep_Q2_019_coefficient_23_0061
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0062 : Poly :=
[
  term ((5076564547422219200526168447499634760082 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 62 for generator 23. -/
def ep_Q2_019_partial_23_0062 : Poly :=
[
  term ((10153129094844438401052336894999269520164 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5076564547422219200526168447499634760082 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-5076564547422219200526168447499634760082 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((10153129094844438401052336894999269520164 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 23. -/
theorem ep_Q2_019_partial_23_0062_valid :
    mulPoly ep_Q2_019_coefficient_23_0062
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0063 : Poly :=
[
  term ((-37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 23. -/
def ep_Q2_019_partial_23_0063 : Poly :=
[
  term ((-74287735584668488031176830344290855747672 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74287735584668488031176830344290855747672 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 23. -/
theorem ep_Q2_019_partial_23_0063_valid :
    mulPoly ep_Q2_019_coefficient_23_0063
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0064 : Poly :=
[
  term ((-13984126935737275497723684293000057376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 64 for generator 23. -/
def ep_Q2_019_partial_23_0064 : Poly :=
[
  term ((-27968253871474550995447368586000114752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-27968253871474550995447368586000114752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13984126935737275497723684293000057376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((13984126935737275497723684293000057376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 23. -/
theorem ep_Q2_019_partial_23_0064_valid :
    mulPoly ep_Q2_019_coefficient_23_0064
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0065 : Poly :=
[
  term ((-46596331586616678021165441944727055788 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 65 for generator 23. -/
def ep_Q2_019_partial_23_0065 : Poly :=
[
  term ((-93192663173233356042330883889454111576 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-93192663173233356042330883889454111576 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((46596331586616678021165441944727055788 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((46596331586616678021165441944727055788 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 23. -/
theorem ep_Q2_019_partial_23_0065_valid :
    mulPoly ep_Q2_019_coefficient_23_0065
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0066 : Poly :=
[
  term ((11525185994244236071278152868919199808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 23. -/
def ep_Q2_019_partial_23_0066 : Poly :=
[
  term ((23050371988488472142556305737838399616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((23050371988488472142556305737838399616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11525185994244236071278152868919199808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11525185994244236071278152868919199808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 23. -/
theorem ep_Q2_019_partial_23_0066_valid :
    mulPoly ep_Q2_019_coefficient_23_0066
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0067 : Poly :=
[
  term ((3833370362060335868829781720583225808437 : Rat) / 195302373935089185016424403394072344708) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 23. -/
def ep_Q2_019_partial_23_0067 : Poly :=
[
  term ((3833370362060335868829781720583225808437 : Rat) / 97651186967544592508212201697036172354) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3833370362060335868829781720583225808437 : Rat) / 97651186967544592508212201697036172354) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3833370362060335868829781720583225808437 : Rat) / 195302373935089185016424403394072344708) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3833370362060335868829781720583225808437 : Rat) / 195302373935089185016424403394072344708) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 23. -/
theorem ep_Q2_019_partial_23_0067_valid :
    mulPoly ep_Q2_019_coefficient_23_0067
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0068 : Poly :=
[
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (16, 1)]
]

/-- Partial product 68 for generator 23. -/
def ep_Q2_019_partial_23_0068 : Poly :=
[
  term ((3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (14, 2), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 23. -/
theorem ep_Q2_019_partial_23_0068_valid :
    mulPoly ep_Q2_019_coefficient_23_0068
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0069 : Poly :=
[
  term ((-517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (16, 1)]
]

/-- Partial product 69 for generator 23. -/
def ep_Q2_019_partial_23_0069 : Poly :=
[
  term ((-1034880465714451447793160116529527616 : Rat) / 894241638896928502822456059496668245) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1034880465714451447793160116529527616 : Rat) / 894241638896928502822456059496668245) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 23. -/
theorem ep_Q2_019_partial_23_0069_valid :
    mulPoly ep_Q2_019_coefficient_23_0069
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0070 : Poly :=
[
  term ((-8724561302290252514844991839038568096116 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (16, 1)]
]

/-- Partial product 70 for generator 23. -/
def ep_Q2_019_partial_23_0070 : Poly :=
[
  term ((-17449122604580505029689983678077136192232 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-17449122604580505029689983678077136192232 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((8724561302290252514844991839038568096116 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (14, 2), (16, 1)],
  term ((8724561302290252514844991839038568096116 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 23. -/
theorem ep_Q2_019_partial_23_0070_valid :
    mulPoly ep_Q2_019_coefficient_23_0070
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0071 : Poly :=
[
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 71 for generator 23. -/
def ep_Q2_019_partial_23_0071 : Poly :=
[
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 23. -/
theorem ep_Q2_019_partial_23_0071_valid :
    mulPoly ep_Q2_019_coefficient_23_0071
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0072 : Poly :=
[
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 72 for generator 23. -/
def ep_Q2_019_partial_23_0072 : Poly :=
[
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 23. -/
theorem ep_Q2_019_partial_23_0072_valid :
    mulPoly ep_Q2_019_coefficient_23_0072
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0073 : Poly :=
[
  term ((-508350560227750433546617028410924872 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (16, 1)]
]

/-- Partial product 73 for generator 23. -/
def ep_Q2_019_partial_23_0073 : Poly :=
[
  term ((-1016701120455500867093234056821849744 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1016701120455500867093234056821849744 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((508350560227750433546617028410924872 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((508350560227750433546617028410924872 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 23. -/
theorem ep_Q2_019_partial_23_0073_valid :
    mulPoly ep_Q2_019_coefficient_23_0073
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0074 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 74 for generator 23. -/
def ep_Q2_019_partial_23_0074 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 23. -/
theorem ep_Q2_019_partial_23_0074_valid :
    mulPoly ep_Q2_019_coefficient_23_0074
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0075 : Poly :=
[
  term ((-1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 75 for generator 23. -/
def ep_Q2_019_partial_23_0075 : Poly :=
[
  term ((-3025376823014443772588891709638342384 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3025376823014443772588891709638342384 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 23. -/
theorem ep_Q2_019_partial_23_0075_valid :
    mulPoly ep_Q2_019_coefficient_23_0075
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0076 : Poly :=
[
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 76 for generator 23. -/
def ep_Q2_019_partial_23_0076 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 23. -/
theorem ep_Q2_019_partial_23_0076_valid :
    mulPoly ep_Q2_019_coefficient_23_0076
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0077 : Poly :=
[
  term ((1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 77 for generator 23. -/
def ep_Q2_019_partial_23_0077 : Poly :=
[
  term ((2197046533130209579968823157343014976 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2197046533130209579968823157343014976 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 23. -/
theorem ep_Q2_019_partial_23_0077_valid :
    mulPoly ep_Q2_019_coefficient_23_0077
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0078 : Poly :=
[
  term ((-136754955056579244519580512403730592 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 23. -/
def ep_Q2_019_partial_23_0078 : Poly :=
[
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((136754955056579244519580512403730592 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((136754955056579244519580512403730592 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 23. -/
theorem ep_Q2_019_partial_23_0078_valid :
    mulPoly ep_Q2_019_coefficient_23_0078
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0079 : Poly :=
[
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 79 for generator 23. -/
def ep_Q2_019_partial_23_0079 : Poly :=
[
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (14, 2), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 23. -/
theorem ep_Q2_019_partial_23_0079_valid :
    mulPoly ep_Q2_019_coefficient_23_0079
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0080 : Poly :=
[
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 80 for generator 23. -/
def ep_Q2_019_partial_23_0080 : Poly :=
[
  term ((-2013892584045852491207875902954955456 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2013892584045852491207875902954955456 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 23. -/
theorem ep_Q2_019_partial_23_0080_valid :
    mulPoly ep_Q2_019_coefficient_23_0080
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0081 : Poly :=
[
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 23. -/
def ep_Q2_019_partial_23_0081 : Poly :=
[
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 23. -/
theorem ep_Q2_019_partial_23_0081_valid :
    mulPoly ep_Q2_019_coefficient_23_0081
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0082 : Poly :=
[
  term ((-1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 82 for generator 23. -/
def ep_Q2_019_partial_23_0082 : Poly :=
[
  term ((-3091933433761568231511596866782498269792 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3091933433761568231511596866782498269792 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 23. -/
theorem ep_Q2_019_partial_23_0082_valid :
    mulPoly ep_Q2_019_coefficient_23_0082
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0083 : Poly :=
[
  term ((-43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 23. -/
def ep_Q2_019_partial_23_0083 : Poly :=
[
  term ((-87881939985554563454146423002264151112992 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-87881939985554563454146423002264151112992 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 23. -/
theorem ep_Q2_019_partial_23_0083_valid :
    mulPoly ep_Q2_019_coefficient_23_0083
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0084 : Poly :=
[
  term ((43779849397204074425001584333853362008436 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 23. -/
def ep_Q2_019_partial_23_0084 : Poly :=
[
  term ((87559698794408148850003168667706724016872 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((87559698794408148850003168667706724016872 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-43779849397204074425001584333853362008436 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43779849397204074425001584333853362008436 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 23. -/
theorem ep_Q2_019_partial_23_0084_valid :
    mulPoly ep_Q2_019_coefficient_23_0084
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0085 : Poly :=
[
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (16, 1)]
]

/-- Partial product 85 for generator 23. -/
def ep_Q2_019_partial_23_0085 : Poly :=
[
  term ((5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (14, 2), (16, 1)],
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 23. -/
theorem ep_Q2_019_partial_23_0085_valid :
    mulPoly ep_Q2_019_coefficient_23_0085
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0086 : Poly :=
[
  term ((-2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 86 for generator 23. -/
def ep_Q2_019_partial_23_0086 : Poly :=
[
  term ((-4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 23. -/
theorem ep_Q2_019_partial_23_0086_valid :
    mulPoly ep_Q2_019_coefficient_23_0086
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0087 : Poly :=
[
  term ((21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 23. -/
def ep_Q2_019_partial_23_0087 : Poly :=
[
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 23. -/
theorem ep_Q2_019_partial_23_0087_valid :
    mulPoly ep_Q2_019_coefficient_23_0087
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0088 : Poly :=
[
  term ((38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 23. -/
def ep_Q2_019_partial_23_0088 : Poly :=
[
  term ((76989921095253085238397475384584224554216 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((76989921095253085238397475384584224554216 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 23. -/
theorem ep_Q2_019_partial_23_0088_valid :
    mulPoly ep_Q2_019_coefficient_23_0088
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0089 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 89 for generator 23. -/
def ep_Q2_019_partial_23_0089 : Poly :=
[
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 23. -/
theorem ep_Q2_019_partial_23_0089_valid :
    mulPoly ep_Q2_019_coefficient_23_0089
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0090 : Poly :=
[
  term ((1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 90 for generator 23. -/
def ep_Q2_019_partial_23_0090 : Poly :=
[
  term ((2000434879057189328629406882159891808 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 2), (16, 1)],
  term ((2000434879057189328629406882159891808 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 23. -/
theorem ep_Q2_019_partial_23_0090_valid :
    mulPoly ep_Q2_019_coefficient_23_0090
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0091 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 91 for generator 23. -/
def ep_Q2_019_partial_23_0091 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 23. -/
theorem ep_Q2_019_partial_23_0091_valid :
    mulPoly ep_Q2_019_coefficient_23_0091
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0092 : Poly :=
[
  term ((-48164712882830439075511338294615597816 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (16, 1)]
]

/-- Partial product 92 for generator 23. -/
def ep_Q2_019_partial_23_0092 : Poly :=
[
  term ((-96329425765660878151022676589231195632 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-96329425765660878151022676589231195632 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((48164712882830439075511338294615597816 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 2), (16, 1)],
  term ((48164712882830439075511338294615597816 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 23. -/
theorem ep_Q2_019_partial_23_0092_valid :
    mulPoly ep_Q2_019_coefficient_23_0092
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0093 : Poly :=
[
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 93 for generator 23. -/
def ep_Q2_019_partial_23_0093 : Poly :=
[
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 23. -/
theorem ep_Q2_019_partial_23_0093_valid :
    mulPoly ep_Q2_019_coefficient_23_0093
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0094 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 23. -/
def ep_Q2_019_partial_23_0094 : Poly :=
[
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 23. -/
theorem ep_Q2_019_partial_23_0094_valid :
    mulPoly ep_Q2_019_coefficient_23_0094
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0095 : Poly :=
[
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 95 for generator 23. -/
def ep_Q2_019_partial_23_0095 : Poly :=
[
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 23. -/
theorem ep_Q2_019_partial_23_0095_valid :
    mulPoly ep_Q2_019_coefficient_23_0095
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0096 : Poly :=
[
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 23. -/
def ep_Q2_019_partial_23_0096 : Poly :=
[
  term ((4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 23. -/
theorem ep_Q2_019_partial_23_0096_valid :
    mulPoly ep_Q2_019_coefficient_23_0096
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0097 : Poly :=
[
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 23. -/
def ep_Q2_019_partial_23_0097 : Poly :=
[
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 23. -/
theorem ep_Q2_019_partial_23_0097_valid :
    mulPoly ep_Q2_019_coefficient_23_0097
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0098 : Poly :=
[
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 98 for generator 23. -/
def ep_Q2_019_partial_23_0098 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 23. -/
theorem ep_Q2_019_partial_23_0098_valid :
    mulPoly ep_Q2_019_coefficient_23_0098
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0099 : Poly :=
[
  term ((-50344639211176196522428105344113616 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 99 for generator 23. -/
def ep_Q2_019_partial_23_0099 : Poly :=
[
  term ((-100689278422352393044856210688227232 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-100689278422352393044856210688227232 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((50344639211176196522428105344113616 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((50344639211176196522428105344113616 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 23. -/
theorem ep_Q2_019_partial_23_0099_valid :
    mulPoly ep_Q2_019_coefficient_23_0099
        ep_Q2_019_generator_23_0000_0099 =
      ep_Q2_019_partial_23_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_23_0000_0099 : List Poly :=
[
  ep_Q2_019_partial_23_0000,
  ep_Q2_019_partial_23_0001,
  ep_Q2_019_partial_23_0002,
  ep_Q2_019_partial_23_0003,
  ep_Q2_019_partial_23_0004,
  ep_Q2_019_partial_23_0005,
  ep_Q2_019_partial_23_0006,
  ep_Q2_019_partial_23_0007,
  ep_Q2_019_partial_23_0008,
  ep_Q2_019_partial_23_0009,
  ep_Q2_019_partial_23_0010,
  ep_Q2_019_partial_23_0011,
  ep_Q2_019_partial_23_0012,
  ep_Q2_019_partial_23_0013,
  ep_Q2_019_partial_23_0014,
  ep_Q2_019_partial_23_0015,
  ep_Q2_019_partial_23_0016,
  ep_Q2_019_partial_23_0017,
  ep_Q2_019_partial_23_0018,
  ep_Q2_019_partial_23_0019,
  ep_Q2_019_partial_23_0020,
  ep_Q2_019_partial_23_0021,
  ep_Q2_019_partial_23_0022,
  ep_Q2_019_partial_23_0023,
  ep_Q2_019_partial_23_0024,
  ep_Q2_019_partial_23_0025,
  ep_Q2_019_partial_23_0026,
  ep_Q2_019_partial_23_0027,
  ep_Q2_019_partial_23_0028,
  ep_Q2_019_partial_23_0029,
  ep_Q2_019_partial_23_0030,
  ep_Q2_019_partial_23_0031,
  ep_Q2_019_partial_23_0032,
  ep_Q2_019_partial_23_0033,
  ep_Q2_019_partial_23_0034,
  ep_Q2_019_partial_23_0035,
  ep_Q2_019_partial_23_0036,
  ep_Q2_019_partial_23_0037,
  ep_Q2_019_partial_23_0038,
  ep_Q2_019_partial_23_0039,
  ep_Q2_019_partial_23_0040,
  ep_Q2_019_partial_23_0041,
  ep_Q2_019_partial_23_0042,
  ep_Q2_019_partial_23_0043,
  ep_Q2_019_partial_23_0044,
  ep_Q2_019_partial_23_0045,
  ep_Q2_019_partial_23_0046,
  ep_Q2_019_partial_23_0047,
  ep_Q2_019_partial_23_0048,
  ep_Q2_019_partial_23_0049,
  ep_Q2_019_partial_23_0050,
  ep_Q2_019_partial_23_0051,
  ep_Q2_019_partial_23_0052,
  ep_Q2_019_partial_23_0053,
  ep_Q2_019_partial_23_0054,
  ep_Q2_019_partial_23_0055,
  ep_Q2_019_partial_23_0056,
  ep_Q2_019_partial_23_0057,
  ep_Q2_019_partial_23_0058,
  ep_Q2_019_partial_23_0059,
  ep_Q2_019_partial_23_0060,
  ep_Q2_019_partial_23_0061,
  ep_Q2_019_partial_23_0062,
  ep_Q2_019_partial_23_0063,
  ep_Q2_019_partial_23_0064,
  ep_Q2_019_partial_23_0065,
  ep_Q2_019_partial_23_0066,
  ep_Q2_019_partial_23_0067,
  ep_Q2_019_partial_23_0068,
  ep_Q2_019_partial_23_0069,
  ep_Q2_019_partial_23_0070,
  ep_Q2_019_partial_23_0071,
  ep_Q2_019_partial_23_0072,
  ep_Q2_019_partial_23_0073,
  ep_Q2_019_partial_23_0074,
  ep_Q2_019_partial_23_0075,
  ep_Q2_019_partial_23_0076,
  ep_Q2_019_partial_23_0077,
  ep_Q2_019_partial_23_0078,
  ep_Q2_019_partial_23_0079,
  ep_Q2_019_partial_23_0080,
  ep_Q2_019_partial_23_0081,
  ep_Q2_019_partial_23_0082,
  ep_Q2_019_partial_23_0083,
  ep_Q2_019_partial_23_0084,
  ep_Q2_019_partial_23_0085,
  ep_Q2_019_partial_23_0086,
  ep_Q2_019_partial_23_0087,
  ep_Q2_019_partial_23_0088,
  ep_Q2_019_partial_23_0089,
  ep_Q2_019_partial_23_0090,
  ep_Q2_019_partial_23_0091,
  ep_Q2_019_partial_23_0092,
  ep_Q2_019_partial_23_0093,
  ep_Q2_019_partial_23_0094,
  ep_Q2_019_partial_23_0095,
  ep_Q2_019_partial_23_0096,
  ep_Q2_019_partial_23_0097,
  ep_Q2_019_partial_23_0098,
  ep_Q2_019_partial_23_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_23_0000_0099 : Poly :=
[
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20885659741763263429951146049575936 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20885659741763263429951146049575936 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-213829147697446740888389801616717888 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-213829147697446740888389801616717888 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((23063147526511958619099059771501707008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((23063147526511958619099059771501707008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11531573763255979309549529885750853504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((-11531573763255979309549529885750853504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3550017554808201398460482056019801943168 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550017554808201398460482056019801943168 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1268058924019857683004428359608919392 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((4372723650945756174622205186328289402062 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-14026231493509042999495671018200458752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-14026231493509042999495671018200458752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((7013115746754521499747835509100229376 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (14, 2), (16, 1)],
  term ((7013115746754521499747835509100229376 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3187666199059004992665994317158626931072 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2377651301525599776784925190293562394412 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3187666199059004992665994317158626931072 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-11890416993126183219141150631026508082172 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1593833099529502496332997158579313465536 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1593833099529502496332997158579313465536 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1188825650762799888392462595146781197206 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1188825650762799888392462595146781197206 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (14, 2), (16, 1)],
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2467383164229141709187830790389404768 : Rat) / 368217145428147030573952495086863395) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3325303718235376922355700939946782041423 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((26746285326219038296591059157752662016 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((26626344711674372756720565233997360535796 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((17550706298920522288697099067902247648 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((26746285326219038296591059157752662016 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1233691582114570854593915395194702384 : Rat) / 368217145428147030573952495086863395) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1233691582114570854593915395194702384 : Rat) / 368217145428147030573952495086863395) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((17550706298920522288697099067902247648 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3325303718235376922355700939946782041423 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((26626344711674372756720565233997360535796 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3325303718235376922355700939946782041423 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2467383164229141709187830790389404768 : Rat) / 368217145428147030573952495086863395) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3325303718235376922355700939946782041423 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-13373142663109519148295529578876331008 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-13373142663109519148295529578876331008 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8775353149460261144348549533951123824 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13313172355837186378360282616998680267898 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (14, 2), (16, 1)],
  term ((-8775353149460261144348549533951123824 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 3), (16, 1)],
  term ((-13313172355837186378360282616998680267898 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (15, 2), (16, 1)],
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1837010650718781762392619119415233152 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((918505325359390881196309559707616576 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (14, 2), (16, 1)],
  term ((918505325359390881196309559707616576 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (15, 2), (16, 1)],
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (14, 2), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (14, 2), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1703023193121861081361938139214814547304 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1703023193121861081361938139214814547304 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 3), (16, 1)],
  term ((851511596560930540680969069607407273652 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((20498369506009338408133596763827371488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11508994161706481136276833397924764139608 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10249184753004669204066798381913685744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 3), (16, 1)],
  term ((-332635244671301195312277193625418344408 : Rat) / 2325028261132014107338385754691337437) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((20498369506009338408133596763827371488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)],
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((5754497080853240568138416698962382069804 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((5754497080853240568138416698962382069804 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (14, 2), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((53488514693263224564041354258915187894304 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((53488514693263224564041354258915187894304 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-26744257346631612282020677129457593947152 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 3), (16, 1)],
  term ((-26744257346631612282020677129457593947152 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (14, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((2463435103680830509375616044390784256 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((1672437866955921218560878390026683824 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((1672437866955921218560878390026683824 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-836218933477960609280439195013341912 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-836218933477960609280439195013341912 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4066285354755736714859273051271981252096 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((253564044921693126362058129218085432462 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4066285354755736714859273051271981252096 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((848181613417324229117586929403997933782 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((2033142677377868357429636525635990626048 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((120068035191396828944197718935114598976 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-100218992198679570408617020978048304816 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((120068035191396828944197718935114598976 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-100218992198679570408617020978048304816 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-60034017595698414472098859467557299488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((50109496099339785204308510489024152408 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((50109496099339785204308510489024152408 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((4380602695998315780342061101899340288 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4380602695998315780342061101899340288 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3368504232452463033478590306095654592 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((123542102120746133637235095045336571798592 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1973051931085229699995645090309354112 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3368504232452463033478590306095654592 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((192854660711038335110269530301785910016 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1973051931085229699995645090309354112 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((123542102120746133637235095045336571798592 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((908777308309471418251906006580153047504 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-385709321422076670220539060603571820032 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1817554616618942836503812013160306095008 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (12, 1), (14, 3), (16, 1)],
  term ((-1684252116226231516739295153047827296 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((986525965542614849997822545154677056 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-61771051060373066818617547522668285899296 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((986525965542614849997822545154677056 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (9, 1), (14, 3), (16, 1)],
  term ((-61771051060373066818617547522668285899296 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((258032819784045854781171729780402432 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-282362921683250545271503757322663936 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((258032819784045854781171729780402432 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-282362921683250545271503757322663936 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-129016409892022927390585864890201216 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((141181460841625272635751878661331968 : Rat) / 169180850602121608642086281526396695) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1517060029772675647950483059696255616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((10153129094844438401052336894999269520164 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-331992470406278765760678941464587008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-74287735584668488031176830344290855747672 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-93192663173233356042330883889454111576 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27968253871474550995447368586000114752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((3833370362060335868829781720583225808437 : Rat) / 97651186967544592508212201697036172354) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((23050371988488472142556305737838399616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((758530014886337823975241529848127808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((-74080656890604517805231589406642316856088 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27968253871474550995447368586000114752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-93192663173233356042330883889454111576 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4643273644738322305087329041714138624 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5076564547422219200526168447499634760082 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((165996235203139382880339470732293504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (14, 3), (16, 1)],
  term ((2177284439134056195361980585422399533163 : Rat) / 3417791543864060737787427059396266032390) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1517060029772675647950483059696255616 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-331992470406278765760678941464587008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((10153129094844438401052336894999269520164 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((37143867792334244015588415172145427873836 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((13984126935737275497723684293000057376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((46596331586616678021165441944727055788 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((13984126935737275497723684293000057376 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((46596331586616678021165441944727055788 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11525185994244236071278152868919199808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3833370362060335868829781720583225808437 : Rat) / 195302373935089185016424403394072344708) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11525185994244236071278152868919199808 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3833370362060335868829781720583225808437 : Rat) / 195302373935089185016424403394072344708) [(1, 1), (15, 3), (16, 1)],
  term ((3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((3512785358422406537449770996477886186568 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (14, 2), (16, 1)],
  term ((-1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-1034880465714451447793160116529527616 : Rat) / 894241638896928502822456059496668245) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-17449122604580505029689983678077136192232 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1034880465714451447793160116529527616 : Rat) / 894241638896928502822456059496668245) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17449122604580505029689983678077136192232 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term ((517440232857225723896580058264763808 : Rat) / 894241638896928502822456059496668245) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((8724561302290252514844991839038568096116 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (14, 2), (16, 1)],
  term ((8724561302290252514844991839038568096116 : Rat) / 131453520917848489914901040746010232015) [(1, 2), (15, 2), (16, 1)],
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1016701120455500867093234056821849744 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1016701120455500867093234056821849744 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((508350560227750433546617028410924872 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((508350560227750433546617028410924872 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3025376823014443772588891709638342384 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3025376823014443772588891709638342384 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (9, 1), (14, 3), (16, 1)],
  term ((1512688411507221886294445854819171192 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((2197046533130209579968823157343014976 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1098523266565104789984411578671507488 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-196004739525466182717653229068424096 : Rat) / 894241638896928502822456059496668245) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((2197046533130209579968823157343014976 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((136754955056579244519580512403730592 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((136754955056579244519580512403730592 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (14, 2), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2013892584045852491207875902954955456 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3091933433761568231511596866782498269792 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((87559698794408148850003168667706724016872 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87881939985554563454146423002264151112992 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3091933433761568231511596866782498269792 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-87881939985554563454146423002264151112992 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((17896794631692792181070458818596036791016 : Rat) / 341779154386406073778742705939626603239) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2013892584045852491207875902954955456 : Rat) / 894241638896928502822456059496668245) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((1545966716880784115755798433391249134896 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-43779849397204074425001584333853362008436 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-43779849397204074425001584333853362008436 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (14, 2), (16, 1)],
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((76989921095253085238397475384584224554216 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-96329425765660878151022676589231195632 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((2000434879057189328629406882159891808 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (10, 1), (14, 2), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2020215296169476771963643621050176416 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2000434879057189328629406882159891808 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-38494960547626542619198737692292112277108 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21970484996388640863536605750566037778248 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-96329425765660878151022676589231195632 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-38345624136704758084183355772747238470644 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-4040430592338953543927287242100352832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((43940969992777281727073211501132075556496 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((76989921095253085238397475384584224554216 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((48164712882830439075511338294615597816 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 2), (16, 1)],
  term ((-1000217439528594664314703441079945904 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 3), (16, 1)],
  term ((48164712882830439075511338294615597816 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (15, 2), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (15, 4), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-100689278422352393044856210688227232 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-100689278422352393044856210688227232 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((50344639211176196522428105344113616 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 3), (16, 1)],
  term ((50344639211176196522428105344113616 : Rat) / 368217145428147030573952495086863395) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 0 through 99. -/
theorem ep_Q2_019_block_23_0000_0099_valid :
    checkProductSumEq ep_Q2_019_partials_23_0000_0099
      ep_Q2_019_block_23_0000_0099 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
