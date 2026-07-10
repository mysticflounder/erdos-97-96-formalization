/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 12:100-153

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 12 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_12_0100_0153 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0100 : Poly :=
[
  term ((34036703634819557544713798691368016 : Rat) / 368217145428147030573952495086863395) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 12. -/
def ep_Q2_019_partial_12_0100 : Poly :=
[
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34036703634819557544713798691368016 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34036703634819557544713798691368016 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 12. -/
theorem ep_Q2_019_partial_12_0100_valid :
    mulPoly ep_Q2_019_coefficient_12_0100
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0101 : Poly :=
[
  term ((6463729874639575875966026964805840416 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 101 for generator 12. -/
def ep_Q2_019_partial_12_0101 : Poly :=
[
  term ((12927459749279151751932053929611680832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6463729874639575875966026964805840416 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((12927459749279151751932053929611680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6463729874639575875966026964805840416 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 12. -/
theorem ep_Q2_019_partial_12_0101_valid :
    mulPoly ep_Q2_019_coefficient_12_0101
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0102 : Poly :=
[
  term ((-2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 12. -/
def ep_Q2_019_partial_12_0102 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 12. -/
theorem ep_Q2_019_partial_12_0102_valid :
    mulPoly ep_Q2_019_coefficient_12_0102
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0103 : Poly :=
[
  term ((-12205178369430983629542700615979782224 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 103 for generator 12. -/
def ep_Q2_019_partial_12_0103 : Poly :=
[
  term ((-24410356738861967259085401231959564448 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((12205178369430983629542700615979782224 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-24410356738861967259085401231959564448 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((12205178369430983629542700615979782224 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 12. -/
theorem ep_Q2_019_partial_12_0103_valid :
    mulPoly ep_Q2_019_coefficient_12_0103
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0104 : Poly :=
[
  term ((-2334738156500343066747007872895785984 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 12. -/
def ep_Q2_019_partial_12_0104 : Poly :=
[
  term ((-4669476313000686133494015745791571968 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2334738156500343066747007872895785984 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4669476313000686133494015745791571968 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2334738156500343066747007872895785984 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 12. -/
theorem ep_Q2_019_partial_12_0104_valid :
    mulPoly ep_Q2_019_coefficient_12_0104
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0105 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 12. -/
def ep_Q2_019_partial_12_0105 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 12. -/
theorem ep_Q2_019_partial_12_0105_valid :
    mulPoly ep_Q2_019_coefficient_12_0105
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0106 : Poly :=
[
  term ((-114392699881780477202400745402933008 : Rat) / 894241638896928502822456059496668245) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 12. -/
def ep_Q2_019_partial_12_0106 : Poly :=
[
  term ((-228785399763560954404801490805866016 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((114392699881780477202400745402933008 : Rat) / 894241638896928502822456059496668245) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-228785399763560954404801490805866016 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((114392699881780477202400745402933008 : Rat) / 894241638896928502822456059496668245) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 12. -/
theorem ep_Q2_019_partial_12_0106_valid :
    mulPoly ep_Q2_019_coefficient_12_0106
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0107 : Poly :=
[
  term ((273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 107 for generator 12. -/
def ep_Q2_019_partial_12_0107 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 12. -/
theorem ep_Q2_019_partial_12_0107_valid :
    mulPoly ep_Q2_019_coefficient_12_0107
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0108 : Poly :=
[
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 108 for generator 12. -/
def ep_Q2_019_partial_12_0108 : Poly :=
[
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 2), (8, 1), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 12. -/
theorem ep_Q2_019_partial_12_0108_valid :
    mulPoly ep_Q2_019_coefficient_12_0108
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0109 : Poly :=
[
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 109 for generator 12. -/
def ep_Q2_019_partial_12_0109 : Poly :=
[
  term ((20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 12. -/
theorem ep_Q2_019_partial_12_0109_valid :
    mulPoly ep_Q2_019_coefficient_12_0109
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0110 : Poly :=
[
  term ((752635149478410401779438102185175248 : Rat) / 1251938294455699903951438483295335543) [(7, 2), (16, 1)]
]

/-- Partial product 110 for generator 12. -/
def ep_Q2_019_partial_12_0110 : Poly :=
[
  term ((1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((-752635149478410401779438102185175248 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (7, 2), (16, 1)],
  term ((1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-752635149478410401779438102185175248 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 12. -/
theorem ep_Q2_019_partial_12_0110_valid :
    mulPoly ep_Q2_019_coefficient_12_0110
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0111 : Poly :=
[
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (16, 1)]
]

/-- Partial product 111 for generator 12. -/
def ep_Q2_019_partial_12_0111 : Poly :=
[
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 12. -/
theorem ep_Q2_019_partial_12_0111_valid :
    mulPoly ep_Q2_019_coefficient_12_0111
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0112 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 12. -/
def ep_Q2_019_partial_12_0112 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 12. -/
theorem ep_Q2_019_partial_12_0112_valid :
    mulPoly ep_Q2_019_coefficient_12_0112
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0113 : Poly :=
[
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 113 for generator 12. -/
def ep_Q2_019_partial_12_0113 : Poly :=
[
  term ((7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 12. -/
theorem ep_Q2_019_partial_12_0113_valid :
    mulPoly ep_Q2_019_coefficient_12_0113
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0114 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 12. -/
def ep_Q2_019_partial_12_0114 : Poly :=
[
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 12. -/
theorem ep_Q2_019_partial_12_0114_valid :
    mulPoly ep_Q2_019_coefficient_12_0114
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0115 : Poly :=
[
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 115 for generator 12. -/
def ep_Q2_019_partial_12_0115 : Poly :=
[
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 12. -/
theorem ep_Q2_019_partial_12_0115_valid :
    mulPoly ep_Q2_019_coefficient_12_0115
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0116 : Poly :=
[
  term ((64757584499510652890534749567732853182 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 12. -/
def ep_Q2_019_partial_12_0116 : Poly :=
[
  term ((129515168999021305781069499135465706364 : Rat) / 341779154386406073778742705939626603239) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64757584499510652890534749567732853182 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((129515168999021305781069499135465706364 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64757584499510652890534749567732853182 : Rat) / 341779154386406073778742705939626603239) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 12. -/
theorem ep_Q2_019_partial_12_0116_valid :
    mulPoly ep_Q2_019_coefficient_12_0116
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0117 : Poly :=
[
  term ((29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 117 for generator 12. -/
def ep_Q2_019_partial_12_0117 : Poly :=
[
  term ((58093159402723750830884115895071139784 : Rat) / 2577520017997029214017667465608043765) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((58093159402723750830884115895071139784 : Rat) / 2577520017997029214017667465608043765) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 12. -/
theorem ep_Q2_019_partial_12_0117_valid :
    mulPoly ep_Q2_019_coefficient_12_0117
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0118 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 118 for generator 12. -/
def ep_Q2_019_partial_12_0118 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 12. -/
theorem ep_Q2_019_partial_12_0118_valid :
    mulPoly ep_Q2_019_coefficient_12_0118
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0119 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 12. -/
def ep_Q2_019_partial_12_0119 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 12. -/
theorem ep_Q2_019_partial_12_0119_valid :
    mulPoly ep_Q2_019_coefficient_12_0119
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0120 : Poly :=
[
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 120 for generator 12. -/
def ep_Q2_019_partial_12_0120 : Poly :=
[
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 12. -/
theorem ep_Q2_019_partial_12_0120_valid :
    mulPoly ep_Q2_019_coefficient_12_0120
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0121 : Poly :=
[
  term ((467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 12. -/
def ep_Q2_019_partial_12_0121 : Poly :=
[
  term ((935449211353586993718289058131590608528 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((935449211353586993718289058131590608528 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 12. -/
theorem ep_Q2_019_partial_12_0121_valid :
    mulPoly ep_Q2_019_coefficient_12_0121
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0122 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 12. -/
def ep_Q2_019_partial_12_0122 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 12. -/
theorem ep_Q2_019_partial_12_0122_valid :
    mulPoly ep_Q2_019_coefficient_12_0122
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0123 : Poly :=
[
  term ((-4662071350424743609707907676533460792 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 12. -/
def ep_Q2_019_partial_12_0123 : Poly :=
[
  term ((-9324142700849487219415815353066921584 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((4662071350424743609707907676533460792 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9324142700849487219415815353066921584 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((4662071350424743609707907676533460792 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 12. -/
theorem ep_Q2_019_partial_12_0123_valid :
    mulPoly ep_Q2_019_coefficient_12_0123
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0124 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 124 for generator 12. -/
def ep_Q2_019_partial_12_0124 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (15, 3), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 12. -/
theorem ep_Q2_019_partial_12_0124_valid :
    mulPoly ep_Q2_019_coefficient_12_0124
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0125 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 12. -/
def ep_Q2_019_partial_12_0125 : Poly :=
[
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 12. -/
theorem ep_Q2_019_partial_12_0125_valid :
    mulPoly ep_Q2_019_coefficient_12_0125
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0126 : Poly :=
[
  term ((-11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 12. -/
def ep_Q2_019_partial_12_0126 : Poly :=
[
  term ((-22536726301580925544575932903965171449608 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22536726301580925544575932903965171449608 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 12. -/
theorem ep_Q2_019_partial_12_0126_valid :
    mulPoly ep_Q2_019_coefficient_12_0126
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0127 : Poly :=
[
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 127 for generator 12. -/
def ep_Q2_019_partial_12_0127 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 12. -/
theorem ep_Q2_019_partial_12_0127_valid :
    mulPoly ep_Q2_019_coefficient_12_0127
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0128 : Poly :=
[
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 128 for generator 12. -/
def ep_Q2_019_partial_12_0128 : Poly :=
[
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 12. -/
theorem ep_Q2_019_partial_12_0128_valid :
    mulPoly ep_Q2_019_coefficient_12_0128
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0129 : Poly :=
[
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 129 for generator 12. -/
def ep_Q2_019_partial_12_0129 : Poly :=
[
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 12. -/
theorem ep_Q2_019_partial_12_0129_valid :
    mulPoly ep_Q2_019_coefficient_12_0129
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0130 : Poly :=
[
  term ((761259842715601428713403407047242248656 : Rat) / 341779154386406073778742705939626603239) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 12. -/
def ep_Q2_019_partial_12_0130 : Poly :=
[
  term ((1522519685431202857426806814094484497312 : Rat) / 341779154386406073778742705939626603239) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-761259842715601428713403407047242248656 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1522519685431202857426806814094484497312 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-761259842715601428713403407047242248656 : Rat) / 341779154386406073778742705939626603239) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 12. -/
theorem ep_Q2_019_partial_12_0130_valid :
    mulPoly ep_Q2_019_coefficient_12_0130
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0131 : Poly :=
[
  term ((354279961205056355965275917466402203920784 : Rat) / 5126687315796091106681140589094399048585) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 12. -/
def ep_Q2_019_partial_12_0131 : Poly :=
[
  term ((708559922410112711930551834932804407841568 : Rat) / 5126687315796091106681140589094399048585) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-354279961205056355965275917466402203920784 : Rat) / 5126687315796091106681140589094399048585) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((708559922410112711930551834932804407841568 : Rat) / 5126687315796091106681140589094399048585) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-354279961205056355965275917466402203920784 : Rat) / 5126687315796091106681140589094399048585) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 12. -/
theorem ep_Q2_019_partial_12_0131_valid :
    mulPoly ep_Q2_019_coefficient_12_0131
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0132 : Poly :=
[
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 132 for generator 12. -/
def ep_Q2_019_partial_12_0132 : Poly :=
[
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 12. -/
theorem ep_Q2_019_partial_12_0132_valid :
    mulPoly ep_Q2_019_coefficient_12_0132
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0133 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 133 for generator 12. -/
def ep_Q2_019_partial_12_0133 : Poly :=
[
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 12. -/
theorem ep_Q2_019_partial_12_0133_valid :
    mulPoly ep_Q2_019_coefficient_12_0133
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0134 : Poly :=
[
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(11, 2), (16, 1)]
]

/-- Partial product 134 for generator 12. -/
def ep_Q2_019_partial_12_0134 : Poly :=
[
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 2), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 12. -/
theorem ep_Q2_019_partial_12_0134_valid :
    mulPoly ep_Q2_019_coefficient_12_0134
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0135 : Poly :=
[
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 12. -/
def ep_Q2_019_partial_12_0135 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 12. -/
theorem ep_Q2_019_partial_12_0135_valid :
    mulPoly ep_Q2_019_coefficient_12_0135
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0136 : Poly :=
[
  term ((263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 12. -/
def ep_Q2_019_partial_12_0136 : Poly :=
[
  term ((526872864910013412650296266608229203936 : Rat) / 100523280701884139346689031158713706835) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((526872864910013412650296266608229203936 : Rat) / 100523280701884139346689031158713706835) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 12. -/
theorem ep_Q2_019_partial_12_0136_valid :
    mulPoly ep_Q2_019_coefficient_12_0136
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0137 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 137 for generator 12. -/
def ep_Q2_019_partial_12_0137 : Poly :=
[
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 12. -/
theorem ep_Q2_019_partial_12_0137_valid :
    mulPoly ep_Q2_019_coefficient_12_0137
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0138 : Poly :=
[
  term ((-33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 138 for generator 12. -/
def ep_Q2_019_partial_12_0138 : Poly :=
[
  term ((-66518369830504626156001055746199072232 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-66518369830504626156001055746199072232 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 12. -/
theorem ep_Q2_019_partial_12_0138_valid :
    mulPoly ep_Q2_019_coefficient_12_0138
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0139 : Poly :=
[
  term ((-4290225929290031262011657570571947579848 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 139 for generator 12. -/
def ep_Q2_019_partial_12_0139 : Poly :=
[
  term ((-8580451858580062524023315141143895159696 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((4290225929290031262011657570571947579848 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8580451858580062524023315141143895159696 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((4290225929290031262011657570571947579848 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 12. -/
theorem ep_Q2_019_partial_12_0139_valid :
    mulPoly ep_Q2_019_coefficient_12_0139
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0140 : Poly :=
[
  term ((640158449296411338819853188096030460 : Rat) / 178848327779385700564491211899333649) [(12, 1), (16, 1)]
]

/-- Partial product 140 for generator 12. -/
def ep_Q2_019_partial_12_0140 : Poly :=
[
  term ((1280316898592822677639706376192060920 : Rat) / 178848327779385700564491211899333649) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-640158449296411338819853188096030460 : Rat) / 178848327779385700564491211899333649) [(2, 2), (12, 1), (16, 1)],
  term ((1280316898592822677639706376192060920 : Rat) / 178848327779385700564491211899333649) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-640158449296411338819853188096030460 : Rat) / 178848327779385700564491211899333649) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 12. -/
theorem ep_Q2_019_partial_12_0140_valid :
    mulPoly ep_Q2_019_coefficient_12_0140
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0141 : Poly :=
[
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 141 for generator 12. -/
def ep_Q2_019_partial_12_0141 : Poly :=
[
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (12, 2), (15, 2), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 12. -/
theorem ep_Q2_019_partial_12_0141_valid :
    mulPoly ep_Q2_019_coefficient_12_0141
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0142 : Poly :=
[
  term ((-746335490858849197032166068583580028 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 12. -/
def ep_Q2_019_partial_12_0142 : Poly :=
[
  term ((-1492670981717698394064332137167160056 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((746335490858849197032166068583580028 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1492670981717698394064332137167160056 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((746335490858849197032166068583580028 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 12. -/
theorem ep_Q2_019_partial_12_0142_valid :
    mulPoly ep_Q2_019_coefficient_12_0142
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0143 : Poly :=
[
  term ((-13740588453256303485383252997141933625762 : Rat) / 1708895771932030368893713529698133016195) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 12. -/
def ep_Q2_019_partial_12_0143 : Poly :=
[
  term ((-27481176906512606970766505994283867251524 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((13740588453256303485383252997141933625762 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27481176906512606970766505994283867251524 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((13740588453256303485383252997141933625762 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 12. -/
theorem ep_Q2_019_partial_12_0143_valid :
    mulPoly ep_Q2_019_coefficient_12_0143
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0144 : Poly :=
[
  term ((4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 144 for generator 12. -/
def ep_Q2_019_partial_12_0144 : Poly :=
[
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 12. -/
theorem ep_Q2_019_partial_12_0144_valid :
    mulPoly ep_Q2_019_coefficient_12_0144
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0145 : Poly :=
[
  term ((-3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 145 for generator 12. -/
def ep_Q2_019_partial_12_0145 : Poly :=
[
  term ((-6408325213851279580063371056220567576 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((-6408325213851279580063371056220567576 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(3, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 12. -/
theorem ep_Q2_019_partial_12_0145_valid :
    mulPoly ep_Q2_019_coefficient_12_0145
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0146 : Poly :=
[
  term ((769355894503699600189463500648293108 : Rat) / 178848327779385700564491211899333649) [(13, 2), (16, 1)]
]

/-- Partial product 146 for generator 12. -/
def ep_Q2_019_partial_12_0146 : Poly :=
[
  term ((1538711789007399200378927001296586216 : Rat) / 178848327779385700564491211899333649) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-769355894503699600189463500648293108 : Rat) / 178848327779385700564491211899333649) [(2, 2), (13, 2), (16, 1)],
  term ((1538711789007399200378927001296586216 : Rat) / 178848327779385700564491211899333649) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-769355894503699600189463500648293108 : Rat) / 178848327779385700564491211899333649) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 12. -/
theorem ep_Q2_019_partial_12_0146_valid :
    mulPoly ep_Q2_019_coefficient_12_0146
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0147 : Poly :=
[
  term ((52943047815609477238406954497999488 : Rat) / 169180850602121608642086281526396695) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 147 for generator 12. -/
def ep_Q2_019_partial_12_0147 : Poly :=
[
  term ((105886095631218954476813908995998976 : Rat) / 169180850602121608642086281526396695) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-52943047815609477238406954497999488 : Rat) / 169180850602121608642086281526396695) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((105886095631218954476813908995998976 : Rat) / 169180850602121608642086281526396695) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-52943047815609477238406954497999488 : Rat) / 169180850602121608642086281526396695) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 12. -/
theorem ep_Q2_019_partial_12_0147_valid :
    mulPoly ep_Q2_019_coefficient_12_0147
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0148 : Poly :=
[
  term ((16241915774980683711579652960586307291088 : Rat) / 394360562753545469744703122238030696045) [(14, 1), (16, 1)]
]

/-- Partial product 148 for generator 12. -/
def ep_Q2_019_partial_12_0148 : Poly :=
[
  term ((32483831549961367423159305921172614582176 : Rat) / 394360562753545469744703122238030696045) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-16241915774980683711579652960586307291088 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (14, 1), (16, 1)],
  term ((32483831549961367423159305921172614582176 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-16241915774980683711579652960586307291088 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 12. -/
theorem ep_Q2_019_partial_12_0148_valid :
    mulPoly ep_Q2_019_coefficient_12_0148
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0149 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 12. -/
def ep_Q2_019_partial_12_0149 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 12. -/
theorem ep_Q2_019_partial_12_0149_valid :
    mulPoly ep_Q2_019_coefficient_12_0149
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0150 : Poly :=
[
  term ((-14400749056781501363300362284696229896046 : Rat) / 394360562753545469744703122238030696045) [(14, 2), (16, 1)]
]

/-- Partial product 150 for generator 12. -/
def ep_Q2_019_partial_12_0150 : Poly :=
[
  term ((-28801498113563002726600724569392459792092 : Rat) / 394360562753545469744703122238030696045) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((14400749056781501363300362284696229896046 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (14, 2), (16, 1)],
  term ((-28801498113563002726600724569392459792092 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((14400749056781501363300362284696229896046 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 12. -/
theorem ep_Q2_019_partial_12_0150_valid :
    mulPoly ep_Q2_019_coefficient_12_0150
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0151 : Poly :=
[
  term ((-162317154670414530537884267555744920030138 : Rat) / 5126687315796091106681140589094399048585) [(15, 2), (16, 1)]
]

/-- Partial product 151 for generator 12. -/
def ep_Q2_019_partial_12_0151 : Poly :=
[
  term ((-324634309340829061075768535111489840060276 : Rat) / 5126687315796091106681140589094399048585) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((162317154670414530537884267555744920030138 : Rat) / 5126687315796091106681140589094399048585) [(2, 2), (15, 2), (16, 1)],
  term ((-324634309340829061075768535111489840060276 : Rat) / 5126687315796091106681140589094399048585) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((162317154670414530537884267555744920030138 : Rat) / 5126687315796091106681140589094399048585) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 12. -/
theorem ep_Q2_019_partial_12_0151_valid :
    mulPoly ep_Q2_019_coefficient_12_0151
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0152 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(15, 4), (16, 1)]
]

/-- Partial product 152 for generator 12. -/
def ep_Q2_019_partial_12_0152 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (15, 4), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 12. -/
theorem ep_Q2_019_partial_12_0152_valid :
    mulPoly ep_Q2_019_coefficient_12_0152
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 12. -/
def ep_Q2_019_coefficient_12_0153 : Poly :=
[
  term ((-29123399788091991264874865485204050526 : Rat) / 6259691472278499519757192416476677715) [(16, 1)]
]

/-- Partial product 153 for generator 12. -/
def ep_Q2_019_partial_12_0153 : Poly :=
[
  term ((-58246799576183982529749730970408101052 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (16, 1)],
  term ((29123399788091991264874865485204050526 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (16, 1)],
  term ((-58246799576183982529749730970408101052 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (16, 1)],
  term ((29123399788091991264874865485204050526 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 12. -/
theorem ep_Q2_019_partial_12_0153_valid :
    mulPoly ep_Q2_019_coefficient_12_0153
        ep_Q2_019_generator_12_0100_0153 =
      ep_Q2_019_partial_12_0153 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_12_0100_0153 : List Poly :=
[
  ep_Q2_019_partial_12_0100,
  ep_Q2_019_partial_12_0101,
  ep_Q2_019_partial_12_0102,
  ep_Q2_019_partial_12_0103,
  ep_Q2_019_partial_12_0104,
  ep_Q2_019_partial_12_0105,
  ep_Q2_019_partial_12_0106,
  ep_Q2_019_partial_12_0107,
  ep_Q2_019_partial_12_0108,
  ep_Q2_019_partial_12_0109,
  ep_Q2_019_partial_12_0110,
  ep_Q2_019_partial_12_0111,
  ep_Q2_019_partial_12_0112,
  ep_Q2_019_partial_12_0113,
  ep_Q2_019_partial_12_0114,
  ep_Q2_019_partial_12_0115,
  ep_Q2_019_partial_12_0116,
  ep_Q2_019_partial_12_0117,
  ep_Q2_019_partial_12_0118,
  ep_Q2_019_partial_12_0119,
  ep_Q2_019_partial_12_0120,
  ep_Q2_019_partial_12_0121,
  ep_Q2_019_partial_12_0122,
  ep_Q2_019_partial_12_0123,
  ep_Q2_019_partial_12_0124,
  ep_Q2_019_partial_12_0125,
  ep_Q2_019_partial_12_0126,
  ep_Q2_019_partial_12_0127,
  ep_Q2_019_partial_12_0128,
  ep_Q2_019_partial_12_0129,
  ep_Q2_019_partial_12_0130,
  ep_Q2_019_partial_12_0131,
  ep_Q2_019_partial_12_0132,
  ep_Q2_019_partial_12_0133,
  ep_Q2_019_partial_12_0134,
  ep_Q2_019_partial_12_0135,
  ep_Q2_019_partial_12_0136,
  ep_Q2_019_partial_12_0137,
  ep_Q2_019_partial_12_0138,
  ep_Q2_019_partial_12_0139,
  ep_Q2_019_partial_12_0140,
  ep_Q2_019_partial_12_0141,
  ep_Q2_019_partial_12_0142,
  ep_Q2_019_partial_12_0143,
  ep_Q2_019_partial_12_0144,
  ep_Q2_019_partial_12_0145,
  ep_Q2_019_partial_12_0146,
  ep_Q2_019_partial_12_0147,
  ep_Q2_019_partial_12_0148,
  ep_Q2_019_partial_12_0149,
  ep_Q2_019_partial_12_0150,
  ep_Q2_019_partial_12_0151,
  ep_Q2_019_partial_12_0152,
  ep_Q2_019_partial_12_0153
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_12_0100_0153 : Poly :=
[
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((12927459749279151751932053929611680832 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24410356738861967259085401231959564448 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4669476313000686133494015745791571968 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-228785399763560954404801490805866016 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 2), (8, 1), (16, 1)],
  term ((20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (7, 2), (12, 1), (16, 1)],
  term ((1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((129515168999021305781069499135465706364 : Rat) / 341779154386406073778742705939626603239) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((58093159402723750830884115895071139784 : Rat) / 2577520017997029214017667465608043765) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((935449211353586993718289058131590608528 : Rat) / 43817840305949496638300346915336744005) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9324142700849487219415815353066921584 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(2, 1), (4, 1), (9, 1), (15, 3), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22536726301580925544575932903965171449608 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((1522519685431202857426806814094484497312 : Rat) / 341779154386406073778742705939626603239) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((708559922410112711930551834932804407841568 : Rat) / 5126687315796091106681140589094399048585) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((526872864910013412650296266608229203936 : Rat) / 100523280701884139346689031158713706835) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-66518369830504626156001055746199072232 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8580451858580062524023315141143895159696 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((1280316898592822677639706376192060920 : Rat) / 178848327779385700564491211899333649) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1492670981717698394064332137167160056 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27481176906512606970766505994283867251524 : Rat) / 1708895771932030368893713529698133016195) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6408325213851279580063371056220567576 : Rat) / 894241638896928502822456059496668245) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((1538711789007399200378927001296586216 : Rat) / 178848327779385700564491211899333649) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((105886095631218954476813908995998976 : Rat) / 169180850602121608642086281526396695) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((32483831549961367423159305921172614582176 : Rat) / 394360562753545469744703122238030696045) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-28801498113563002726600724569392459792092 : Rat) / 394360562753545469744703122238030696045) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-324634309340829061075768535111489840060276 : Rat) / 5126687315796091106681140589094399048585) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((-58246799576183982529749730970408101052 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (4, 1), (16, 1)],
  term ((-34036703634819557544713798691368016 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6463729874639575875966026964805840416 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((12205178369430983629542700615979782224 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((2334738156500343066747007872895785984 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((114392699881780477202400745402933008 : Rat) / 894241638896928502822456059496668245) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((-752635149478410401779438102185175248 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (7, 2), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-64757584499510652890534749567732853182 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4662071350424743609707907676533460792 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-761259842715601428713403407047242248656 : Rat) / 341779154386406073778742705939626603239) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-354279961205056355965275917466402203920784 : Rat) / 5126687315796091106681140589094399048585) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(2, 2), (11, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((4290225929290031262011657570571947579848 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-640158449296411338819853188096030460 : Rat) / 178848327779385700564491211899333649) [(2, 2), (12, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((746335490858849197032166068583580028 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13740588453256303485383252997141933625762 : Rat) / 1708895771932030368893713529698133016195) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((-769355894503699600189463500648293108 : Rat) / 178848327779385700564491211899333649) [(2, 2), (13, 2), (16, 1)],
  term ((-52943047815609477238406954497999488 : Rat) / 169180850602121608642086281526396695) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16241915774980683711579652960586307291088 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (14, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((14400749056781501363300362284696229896046 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (14, 2), (16, 1)],
  term ((162317154670414530537884267555744920030138 : Rat) / 5126687315796091106681140589094399048585) [(2, 2), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (15, 4), (16, 1)],
  term ((29123399788091991264874865485204050526 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((12927459749279151751932053929611680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24410356738861967259085401231959564448 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4669476313000686133494015745791571968 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-228785399763560954404801490805866016 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((1505270298956820803558876204370350496 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((13045674638140256225847942915246851616 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((129515168999021305781069499135465706364 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((58093159402723750830884115895071139784 : Rat) / 2577520017997029214017667465608043765) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((935449211353586993718289058131590608528 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9324142700849487219415815353066921584 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22536726301580925544575932903965171449608 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((1522519685431202857426806814094484497312 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((708559922410112711930551834932804407841568 : Rat) / 5126687315796091106681140589094399048585) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((526872864910013412650296266608229203936 : Rat) / 100523280701884139346689031158713706835) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-66518369830504626156001055746199072232 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8580451858580062524023315141143895159696 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((1280316898592822677639706376192060920 : Rat) / 178848327779385700564491211899333649) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1492670981717698394064332137167160056 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27481176906512606970766505994283867251524 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6408325213851279580063371056220567576 : Rat) / 894241638896928502822456059496668245) [(3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((1538711789007399200378927001296586216 : Rat) / 178848327779385700564491211899333649) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((105886095631218954476813908995998976 : Rat) / 169180850602121608642086281526396695) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((32483831549961367423159305921172614582176 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-28801498113563002726600724569392459792092 : Rat) / 394360562753545469744703122238030696045) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-324634309340829061075768535111489840060276 : Rat) / 5126687315796091106681140589094399048585) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-58246799576183982529749730970408101052 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (5, 1), (16, 1)],
  term ((-34036703634819557544713798691368016 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6463729874639575875966026964805840416 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((2219683422470883412495100726598023376 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((12205178369430983629542700615979782224 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((2334738156500343066747007872895785984 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((114392699881780477202400745402933008 : Rat) / 894241638896928502822456059496668245) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-273509910113158489039161024807461184 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (8, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((-752635149478410401779438102185175248 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (7, 2), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-64757584499510652890534749567732853182 : Rat) / 341779154386406073778742705939626603239) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29046579701361875415442057947535569892 : Rat) / 2577520017997029214017667465608043765) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-467724605676793496859144529065795304264 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4662071350424743609707907676533460792 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11268363150790462772287966451982585724804 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-761259842715601428713403407047242248656 : Rat) / 341779154386406073778742705939626603239) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-354279961205056355965275917466402203920784 : Rat) / 5126687315796091106681140589094399048585) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(3, 2), (11, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-263436432455006706325148133304114601968 : Rat) / 100523280701884139346689031158713706835) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((33259184915252313078000527873099536116 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((4290225929290031262011657570571947579848 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-640158449296411338819853188096030460 : Rat) / 178848327779385700564491211899333649) [(3, 2), (12, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((746335490858849197032166068583580028 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13740588453256303485383252997141933625762 : Rat) / 1708895771932030368893713529698133016195) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((3204162606925639790031685528110283788 : Rat) / 894241638896928502822456059496668245) [(3, 2), (13, 2), (14, 1), (16, 1)],
  term ((-769355894503699600189463500648293108 : Rat) / 178848327779385700564491211899333649) [(3, 2), (13, 2), (16, 1)],
  term ((-52943047815609477238406954497999488 : Rat) / 169180850602121608642086281526396695) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16241915774980683711579652960586307291088 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (14, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((14400749056781501363300362284696229896046 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (14, 2), (16, 1)],
  term ((162317154670414530537884267555744920030138 : Rat) / 5126687315796091106681140589094399048585) [(3, 2), (15, 2), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (15, 4), (16, 1)],
  term ((29123399788091991264874865485204050526 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 100 through 153. -/
theorem ep_Q2_019_block_12_0100_0153_valid :
    checkProductSumEq ep_Q2_019_partials_12_0100_0153
      ep_Q2_019_block_12_0100_0153 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
