/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 21:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_21_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0100 : Poly :=
[
  term ((-21029308044344569427488750145847115340 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def ep_Q2_019_partial_21_0100 : Poly :=
[
  term ((-42058616088689138854977500291694230680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((21029308044344569427488750145847115340 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem ep_Q2_019_partial_21_0100_valid :
    mulPoly ep_Q2_019_coefficient_21_0100
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0101 : Poly :=
[
  term ((164908525459468796131952158581950912884 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 21. -/
def ep_Q2_019_partial_21_0101 : Poly :=
[
  term ((329817050918937592263904317163901825768 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-164908525459468796131952158581950912884 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem ep_Q2_019_partial_21_0101_valid :
    mulPoly ep_Q2_019_coefficient_21_0101
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0102 : Poly :=
[
  term ((124467490022332717128406033507400166787187 : Rat) / 10253374631592182213362281178188798097170) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 21. -/
def ep_Q2_019_partial_21_0102 : Poly :=
[
  term ((124467490022332717128406033507400166787187 : Rat) / 5126687315796091106681140589094399048585) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-124467490022332717128406033507400166787187 : Rat) / 10253374631592182213362281178188798097170) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem ep_Q2_019_partial_21_0102_valid :
    mulPoly ep_Q2_019_coefficient_21_0102
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0103 : Poly :=
[
  term ((-308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 103 for generator 21. -/
def ep_Q2_019_partial_21_0103 : Poly :=
[
  term ((308640785454905030932097079813730016 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((-617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem ep_Q2_019_partial_21_0103_valid :
    mulPoly ep_Q2_019_coefficient_21_0103
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0104 : Poly :=
[
  term ((-2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 104 for generator 21. -/
def ep_Q2_019_partial_21_0104 : Poly :=
[
  term ((-5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem ep_Q2_019_partial_21_0104_valid :
    mulPoly ep_Q2_019_coefficient_21_0104
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0105 : Poly :=
[
  term ((-5895312777107757607682989245030956229196 : Rat) / 56337223250506495677814731748290099435) [(0, 1), (9, 2), (16, 1)]
]

/-- Partial product 105 for generator 21. -/
def ep_Q2_019_partial_21_0105 : Poly :=
[
  term ((-11790625554215515215365978490061912458392 : Rat) / 56337223250506495677814731748290099435) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((5895312777107757607682989245030956229196 : Rat) / 56337223250506495677814731748290099435) [(0, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem ep_Q2_019_partial_21_0105_valid :
    mulPoly ep_Q2_019_coefficient_21_0105
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0106 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 21. -/
def ep_Q2_019_partial_21_0106 : Poly :=
[
  term ((769612413105665019457609919098680823040 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem ep_Q2_019_partial_21_0106_valid :
    mulPoly ep_Q2_019_coefficient_21_0106
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0107 : Poly :=
[
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 21. -/
def ep_Q2_019_partial_21_0107 : Poly :=
[
  term ((741648245990769512846588699893436429888 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem ep_Q2_019_partial_21_0107_valid :
    mulPoly ep_Q2_019_coefficient_21_0107
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0108 : Poly :=
[
  term ((-1233691582114570854593915395194702384 : Rat) / 368217145428147030573952495086863395) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 21. -/
def ep_Q2_019_partial_21_0108 : Poly :=
[
  term ((1233691582114570854593915395194702384 : Rat) / 368217145428147030573952495086863395) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2467383164229141709187830790389404768 : Rat) / 368217145428147030573952495086863395) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem ep_Q2_019_partial_21_0108_valid :
    mulPoly ep_Q2_019_coefficient_21_0108
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0109 : Poly :=
[
  term ((3325303718235376922355700939946782041423 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 21. -/
def ep_Q2_019_partial_21_0109 : Poly :=
[
  term ((-3325303718235376922355700939946782041423 : Rat) / 87635680611898993276600693830673488010) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((3325303718235376922355700939946782041423 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem ep_Q2_019_partial_21_0109_valid :
    mulPoly ep_Q2_019_coefficient_21_0109
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0110 : Poly :=
[
  term ((-793220155950754138835408815033596056092 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 21. -/
def ep_Q2_019_partial_21_0110 : Poly :=
[
  term ((-1586440311901508277670817630067192112184 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((793220155950754138835408815033596056092 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem ep_Q2_019_partial_21_0110_valid :
    mulPoly ep_Q2_019_coefficient_21_0110
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0111 : Poly :=
[
  term ((1202522638079922594997095968161701611552 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 111 for generator 21. -/
def ep_Q2_019_partial_21_0111 : Poly :=
[
  term ((2405045276159845189994191936323403223104 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1202522638079922594997095968161701611552 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 21. -/
theorem ep_Q2_019_partial_21_0111_valid :
    mulPoly ep_Q2_019_coefficient_21_0111
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0112 : Poly :=
[
  term ((609447433736819948671577056259986822872 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 21. -/
def ep_Q2_019_partial_21_0112 : Poly :=
[
  term ((1218894867473639897343154112519973645744 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-609447433736819948671577056259986822872 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 21. -/
theorem ep_Q2_019_partial_21_0112_valid :
    mulPoly ep_Q2_019_coefficient_21_0112
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0113 : Poly :=
[
  term ((-84686508001118156693000868585747119546 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 21. -/
def ep_Q2_019_partial_21_0113 : Poly :=
[
  term ((-169373016002236313386001737171494239092 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((84686508001118156693000868585747119546 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 21. -/
theorem ep_Q2_019_partial_21_0113_valid :
    mulPoly ep_Q2_019_coefficient_21_0113
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0114 : Poly :=
[
  term ((995597430612772764955548887569929610603 : Rat) / 14211191450578215125935247648217322380) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 21. -/
def ep_Q2_019_partial_21_0114 : Poly :=
[
  term ((995597430612772764955548887569929610603 : Rat) / 7105595725289107562967623824108661190) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-995597430612772764955548887569929610603 : Rat) / 14211191450578215125935247648217322380) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 21. -/
theorem ep_Q2_019_partial_21_0114_valid :
    mulPoly ep_Q2_019_coefficient_21_0114
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0115 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 115 for generator 21. -/
def ep_Q2_019_partial_21_0115 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 21. -/
theorem ep_Q2_019_partial_21_0115_valid :
    mulPoly ep_Q2_019_coefficient_21_0115
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0116 : Poly :=
[
  term ((-13373142663109519148295529578876331008 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 116 for generator 21. -/
def ep_Q2_019_partial_21_0116 : Poly :=
[
  term ((-26746285326219038296591059157752662016 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((13373142663109519148295529578876331008 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 21. -/
theorem ep_Q2_019_partial_21_0116_valid :
    mulPoly ep_Q2_019_coefficient_21_0116
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0117 : Poly :=
[
  term ((-37591877025099597620634560930780049293228 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 117 for generator 21. -/
def ep_Q2_019_partial_21_0117 : Poly :=
[
  term ((-75183754050199195241269121861560098586456 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((37591877025099597620634560930780049293228 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 21. -/
theorem ep_Q2_019_partial_21_0117_valid :
    mulPoly ep_Q2_019_coefficient_21_0117
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0118 : Poly :=
[
  term ((-8221479918795198075829406923614698784 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 21. -/
def ep_Q2_019_partial_21_0118 : Poly :=
[
  term ((-16442959837590396151658813847229397568 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8221479918795198075829406923614698784 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 21. -/
theorem ep_Q2_019_partial_21_0118_valid :
    mulPoly ep_Q2_019_coefficient_21_0118
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0119 : Poly :=
[
  term ((-3886735020848299796808212340887734612748 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 21. -/
def ep_Q2_019_partial_21_0119 : Poly :=
[
  term ((-7773470041696599593616424681775469225496 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3886735020848299796808212340887734612748 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 21. -/
theorem ep_Q2_019_partial_21_0119_valid :
    mulPoly ep_Q2_019_coefficient_21_0119
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0120 : Poly :=
[
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 120 for generator 21. -/
def ep_Q2_019_partial_21_0120 : Poly :=
[
  term ((1275568726505004929728451025583807488 : Rat) / 368217145428147030573952495086863395) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 21. -/
theorem ep_Q2_019_partial_21_0120_valid :
    mulPoly ep_Q2_019_coefficient_21_0120
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0121 : Poly :=
[
  term ((-9692597209823014990947295278336987903353 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 121 for generator 21. -/
def ep_Q2_019_partial_21_0121 : Poly :=
[
  term ((-19385194419646029981894590556673975806706 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((9692597209823014990947295278336987903353 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 21. -/
theorem ep_Q2_019_partial_21_0121_valid :
    mulPoly ep_Q2_019_coefficient_21_0121
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0122 : Poly :=
[
  term ((-8775353149460261144348549533951123824 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 2), (16, 1)]
]

/-- Partial product 122 for generator 21. -/
def ep_Q2_019_partial_21_0122 : Poly :=
[
  term ((-17550706298920522288697099067902247648 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((8775353149460261144348549533951123824 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 21. -/
theorem ep_Q2_019_partial_21_0122_valid :
    mulPoly ep_Q2_019_coefficient_21_0122
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0123 : Poly :=
[
  term ((3916259032375923552656533370528888978546 : Rat) / 100523280701884139346689031158713706835) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 21. -/
def ep_Q2_019_partial_21_0123 : Poly :=
[
  term ((7832518064751847105313066741057777957092 : Rat) / 100523280701884139346689031158713706835) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3916259032375923552656533370528888978546 : Rat) / 100523280701884139346689031158713706835) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 21. -/
theorem ep_Q2_019_partial_21_0123_valid :
    mulPoly ep_Q2_019_coefficient_21_0123
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0124 : Poly :=
[
  term ((-308674898713988194685540602384965367889 : Rat) / 30046519066936797694834523599088053032) [(0, 1), (16, 1)]
]

/-- Partial product 124 for generator 21. -/
def ep_Q2_019_partial_21_0124 : Poly :=
[
  term ((-308674898713988194685540602384965367889 : Rat) / 15023259533468398847417261799544026516) [(0, 1), (10, 1), (16, 1)],
  term ((308674898713988194685540602384965367889 : Rat) / 30046519066936797694834523599088053032) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 21. -/
theorem ep_Q2_019_partial_21_0124_valid :
    mulPoly ep_Q2_019_coefficient_21_0124
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0125 : Poly :=
[
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 125 for generator 21. -/
def ep_Q2_019_partial_21_0125 : Poly :=
[
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 21. -/
theorem ep_Q2_019_partial_21_0125_valid :
    mulPoly ep_Q2_019_coefficient_21_0125
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0126 : Poly :=
[
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 21. -/
def ep_Q2_019_partial_21_0126 : Poly :=
[
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 21. -/
theorem ep_Q2_019_partial_21_0126_valid :
    mulPoly ep_Q2_019_coefficient_21_0126
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0127 : Poly :=
[
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (16, 1)]
]

/-- Partial product 127 for generator 21. -/
def ep_Q2_019_partial_21_0127 : Poly :=
[
  term ((23851470335322866064704121833463737088 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (10, 1), (16, 1)],
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 21. -/
theorem ep_Q2_019_partial_21_0127_valid :
    mulPoly ep_Q2_019_coefficient_21_0127
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0128 : Poly :=
[
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 128 for generator 21. -/
def ep_Q2_019_partial_21_0128 : Poly :=
[
  term ((31801960447097154752938829111284982784 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 21. -/
theorem ep_Q2_019_partial_21_0128_valid :
    mulPoly ep_Q2_019_coefficient_21_0128
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0129 : Poly :=
[
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 129 for generator 21. -/
def ep_Q2_019_partial_21_0129 : Poly :=
[
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 21. -/
theorem ep_Q2_019_partial_21_0129_valid :
    mulPoly ep_Q2_019_coefficient_21_0129
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0130 : Poly :=
[
  term ((4960887406866786956460040554636042066336 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 130 for generator 21. -/
def ep_Q2_019_partial_21_0130 : Poly :=
[
  term ((9921774813733573912920081109272084132672 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4960887406866786956460040554636042066336 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 21. -/
theorem ep_Q2_019_partial_21_0130_valid :
    mulPoly ep_Q2_019_coefficient_21_0130
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0131 : Poly :=
[
  term ((-539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 21. -/
def ep_Q2_019_partial_21_0131 : Poly :=
[
  term ((-1079766871041753129303394965480048642108 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 21. -/
theorem ep_Q2_019_partial_21_0131_valid :
    mulPoly ep_Q2_019_coefficient_21_0131
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0132 : Poly :=
[
  term ((3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (9, 2), (16, 1)]
]

/-- Partial product 132 for generator 21. -/
def ep_Q2_019_partial_21_0132 : Poly :=
[
  term ((7348042602875127049570476477660932608 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (9, 2), (10, 1), (16, 1)],
  term ((-3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 21. -/
theorem ep_Q2_019_partial_21_0132_valid :
    mulPoly ep_Q2_019_coefficient_21_0132
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0133 : Poly :=
[
  term ((-2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 21. -/
def ep_Q2_019_partial_21_0133 : Poly :=
[
  term ((-4954673923093612385589630088686293225376 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 21. -/
theorem ep_Q2_019_partial_21_0133_valid :
    mulPoly ep_Q2_019_coefficient_21_0133
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0134 : Poly :=
[
  term ((257082643205406809989100407534105528463 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 21. -/
def ep_Q2_019_partial_21_0134 : Poly :=
[
  term ((514165286410813619978200815068211056926 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-257082643205406809989100407534105528463 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 21. -/
theorem ep_Q2_019_partial_21_0134_valid :
    mulPoly ep_Q2_019_coefficient_21_0134
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0135 : Poly :=
[
  term ((-10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 21. -/
def ep_Q2_019_partial_21_0135 : Poly :=
[
  term ((-20885659741763263429951146049575936 : Rat) / 73643429085629406114790499017372679) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 21. -/
theorem ep_Q2_019_partial_21_0135_valid :
    mulPoly ep_Q2_019_coefficient_21_0135
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0136 : Poly :=
[
  term ((-449773147606191544679795837848435459416 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (16, 1)]
]

/-- Partial product 136 for generator 21. -/
def ep_Q2_019_partial_21_0136 : Poly :=
[
  term ((-899546295212383089359591675696870918832 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (10, 1), (16, 1)],
  term ((449773147606191544679795837848435459416 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 21. -/
theorem ep_Q2_019_partial_21_0136_valid :
    mulPoly ep_Q2_019_coefficient_21_0136
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0137 : Poly :=
[
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (8, 1), (16, 1)]
]

/-- Partial product 137 for generator 21. -/
def ep_Q2_019_partial_21_0137 : Poly :=
[
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 21. -/
theorem ep_Q2_019_partial_21_0137_valid :
    mulPoly ep_Q2_019_coefficient_21_0137
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0138 : Poly :=
[
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 138 for generator 21. -/
def ep_Q2_019_partial_21_0138 : Poly :=
[
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 21. -/
theorem ep_Q2_019_partial_21_0138_valid :
    mulPoly ep_Q2_019_coefficient_21_0138
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0139 : Poly :=
[
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 139 for generator 21. -/
def ep_Q2_019_partial_21_0139 : Poly :=
[
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 21. -/
theorem ep_Q2_019_partial_21_0139_valid :
    mulPoly ep_Q2_019_coefficient_21_0139
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0140 : Poly :=
[
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 140 for generator 21. -/
def ep_Q2_019_partial_21_0140 : Poly :=
[
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 21. -/
theorem ep_Q2_019_partial_21_0140_valid :
    mulPoly ep_Q2_019_coefficient_21_0140
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0141 : Poly :=
[
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 141 for generator 21. -/
def ep_Q2_019_partial_21_0141 : Poly :=
[
  term ((16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 21. -/
theorem ep_Q2_019_partial_21_0141_valid :
    mulPoly ep_Q2_019_coefficient_21_0141
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0142 : Poly :=
[
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 142 for generator 21. -/
def ep_Q2_019_partial_21_0142 : Poly :=
[
  term ((-16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 21. -/
theorem ep_Q2_019_partial_21_0142_valid :
    mulPoly ep_Q2_019_coefficient_21_0142
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0143 : Poly :=
[
  term ((-2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (2, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 143 for generator 21. -/
def ep_Q2_019_partial_21_0143 : Poly :=
[
  term ((-5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (2, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 21. -/
theorem ep_Q2_019_partial_21_0143_valid :
    mulPoly ep_Q2_019_coefficient_21_0143
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0144 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 144 for generator 21. -/
def ep_Q2_019_partial_21_0144 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 21. -/
theorem ep_Q2_019_partial_21_0144_valid :
    mulPoly ep_Q2_019_coefficient_21_0144
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0145 : Poly :=
[
  term ((10796204573230986182145120431528608112 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 145 for generator 21. -/
def ep_Q2_019_partial_21_0145 : Poly :=
[
  term ((21592409146461972364290240863057216224 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-10796204573230986182145120431528608112 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 21. -/
theorem ep_Q2_019_partial_21_0145_valid :
    mulPoly ep_Q2_019_coefficient_21_0145
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0146 : Poly :=
[
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 21. -/
def ep_Q2_019_partial_21_0146 : Poly :=
[
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 21. -/
theorem ep_Q2_019_partial_21_0146_valid :
    mulPoly ep_Q2_019_coefficient_21_0146
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0147 : Poly :=
[
  term ((314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 147 for generator 21. -/
def ep_Q2_019_partial_21_0147 : Poly :=
[
  term ((629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 21. -/
theorem ep_Q2_019_partial_21_0147_valid :
    mulPoly ep_Q2_019_coefficient_21_0147
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0148 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 21. -/
def ep_Q2_019_partial_21_0148 : Poly :=
[
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 21. -/
theorem ep_Q2_019_partial_21_0148_valid :
    mulPoly ep_Q2_019_coefficient_21_0148
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0149 : Poly :=
[
  term ((-232450117632676688557000660043766534622976 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 21. -/
def ep_Q2_019_partial_21_0149 : Poly :=
[
  term ((-464900235265353377114001320087533069245952 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((232450117632676688557000660043766534622976 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 21. -/
theorem ep_Q2_019_partial_21_0149_valid :
    mulPoly ep_Q2_019_coefficient_21_0149
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0150 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 150 for generator 21. -/
def ep_Q2_019_partial_21_0150 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 21. -/
theorem ep_Q2_019_partial_21_0150_valid :
    mulPoly ep_Q2_019_coefficient_21_0150
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0151 : Poly :=
[
  term ((-3747580529070502462917554771186264016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 151 for generator 21. -/
def ep_Q2_019_partial_21_0151 : Poly :=
[
  term ((3747580529070502462917554771186264016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 1), (16, 1)],
  term ((-7495161058141004925835109542372528032 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 21. -/
theorem ep_Q2_019_partial_21_0151_valid :
    mulPoly ep_Q2_019_coefficient_21_0151
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0152 : Poly :=
[
  term ((1192608553023506442233627187295023613244 : Rat) / 11267444650101299135562946349658019887) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 152 for generator 21. -/
def ep_Q2_019_partial_21_0152 : Poly :=
[
  term ((2385217106047012884467254374590047226488 : Rat) / 11267444650101299135562946349658019887) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1192608553023506442233627187295023613244 : Rat) / 11267444650101299135562946349658019887) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 21. -/
theorem ep_Q2_019_partial_21_0152_valid :
    mulPoly ep_Q2_019_coefficient_21_0152
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0153 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 153 for generator 21. -/
def ep_Q2_019_partial_21_0153 : Poly :=
[
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 21. -/
theorem ep_Q2_019_partial_21_0153_valid :
    mulPoly ep_Q2_019_coefficient_21_0153
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0154 : Poly :=
[
  term ((-1873790264535251231458777385593132008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

/-- Partial product 154 for generator 21. -/
def ep_Q2_019_partial_21_0154 : Poly :=
[
  term ((-3747580529070502462917554771186264016 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 1), (16, 1)],
  term ((1873790264535251231458777385593132008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 21. -/
theorem ep_Q2_019_partial_21_0154_valid :
    mulPoly ep_Q2_019_coefficient_21_0154
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0155 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 21. -/
def ep_Q2_019_partial_21_0155 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 21. -/
theorem ep_Q2_019_partial_21_0155_valid :
    mulPoly ep_Q2_019_coefficient_21_0155
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0156 : Poly :=
[
  term ((-17573769276794967779116332613477824 : Rat) / 24168692943160229806012325932342385) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 21. -/
def ep_Q2_019_partial_21_0156 : Poly :=
[
  term ((17573769276794967779116332613477824 : Rat) / 24168692943160229806012325932342385) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-35147538553589935558232665226955648 : Rat) / 24168692943160229806012325932342385) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 21. -/
theorem ep_Q2_019_partial_21_0156_valid :
    mulPoly ep_Q2_019_coefficient_21_0156
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0157 : Poly :=
[
  term ((-10249184753004669204066798381913685744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 157 for generator 21. -/
def ep_Q2_019_partial_21_0157 : Poly :=
[
  term ((-20498369506009338408133596763827371488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((10249184753004669204066798381913685744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 21. -/
theorem ep_Q2_019_partial_21_0157_valid :
    mulPoly ep_Q2_019_coefficient_21_0157
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0158 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 158 for generator 21. -/
def ep_Q2_019_partial_21_0158 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 21. -/
theorem ep_Q2_019_partial_21_0158_valid :
    mulPoly ep_Q2_019_coefficient_21_0158
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0159 : Poly :=
[
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 21. -/
def ep_Q2_019_partial_21_0159 : Poly :=
[
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 21. -/
theorem ep_Q2_019_partial_21_0159_valid :
    mulPoly ep_Q2_019_coefficient_21_0159
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0160 : Poly :=
[
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 160 for generator 21. -/
def ep_Q2_019_partial_21_0160 : Poly :=
[
  term ((-629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 21. -/
theorem ep_Q2_019_partial_21_0160_valid :
    mulPoly ep_Q2_019_coefficient_21_0160
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0161 : Poly :=
[
  term ((5750941452021769507780907605639885074412 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 21. -/
def ep_Q2_019_partial_21_0161 : Poly :=
[
  term ((11501882904043539015561815211279770148824 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5750941452021769507780907605639885074412 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 21. -/
theorem ep_Q2_019_partial_21_0161_valid :
    mulPoly ep_Q2_019_coefficient_21_0161
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0162 : Poly :=
[
  term ((-8786884638397483889558166306738912 : Rat) / 24168692943160229806012325932342385) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 21. -/
def ep_Q2_019_partial_21_0162 : Poly :=
[
  term ((-17573769276794967779116332613477824 : Rat) / 24168692943160229806012325932342385) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((8786884638397483889558166306738912 : Rat) / 24168692943160229806012325932342385) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 21. -/
theorem ep_Q2_019_partial_21_0162_valid :
    mulPoly ep_Q2_019_coefficient_21_0162
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0163 : Poly :=
[
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (8, 1), (16, 1)]
]

/-- Partial product 163 for generator 21. -/
def ep_Q2_019_partial_21_0163 : Poly :=
[
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 21. -/
theorem ep_Q2_019_partial_21_0163_valid :
    mulPoly ep_Q2_019_coefficient_21_0163
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0164 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 164 for generator 21. -/
def ep_Q2_019_partial_21_0164 : Poly :=
[
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 21. -/
theorem ep_Q2_019_partial_21_0164_valid :
    mulPoly ep_Q2_019_coefficient_21_0164
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0165 : Poly :=
[
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 165 for generator 21. -/
def ep_Q2_019_partial_21_0165 : Poly :=
[
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 21. -/
theorem ep_Q2_019_partial_21_0165_valid :
    mulPoly ep_Q2_019_coefficient_21_0165
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0166 : Poly :=
[
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 166 for generator 21. -/
def ep_Q2_019_partial_21_0166 : Poly :=
[
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 21. -/
theorem ep_Q2_019_partial_21_0166_valid :
    mulPoly ep_Q2_019_coefficient_21_0166
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0167 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 167 for generator 21. -/
def ep_Q2_019_partial_21_0167 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 21. -/
theorem ep_Q2_019_partial_21_0167_valid :
    mulPoly ep_Q2_019_coefficient_21_0167
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0168 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 21. -/
def ep_Q2_019_partial_21_0168 : Poly :=
[
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 21. -/
theorem ep_Q2_019_partial_21_0168_valid :
    mulPoly ep_Q2_019_coefficient_21_0168
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0169 : Poly :=
[
  term ((-32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 169 for generator 21. -/
def ep_Q2_019_partial_21_0169 : Poly :=
[
  term ((-64508204946011463695292932445100608 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 21. -/
theorem ep_Q2_019_partial_21_0169_valid :
    mulPoly ep_Q2_019_coefficient_21_0169
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0170 : Poly :=
[
  term ((26778955913085898938946216291207694213792 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (8, 1), (16, 1)]
]

/-- Partial product 170 for generator 21. -/
def ep_Q2_019_partial_21_0170 : Poly :=
[
  term ((53557911826171797877892432582415388427584 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((-26778955913085898938946216291207694213792 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 21. -/
theorem ep_Q2_019_partial_21_0170_valid :
    mulPoly ep_Q2_019_coefficient_21_0170
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0171 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 171 for generator 21. -/
def ep_Q2_019_partial_21_0171 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 21. -/
theorem ep_Q2_019_partial_21_0171_valid :
    mulPoly ep_Q2_019_coefficient_21_0171
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0172 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 21. -/
def ep_Q2_019_partial_21_0172 : Poly :=
[
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 21. -/
theorem ep_Q2_019_partial_21_0172_valid :
    mulPoly ep_Q2_019_coefficient_21_0172
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0173 : Poly :=
[
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 173 for generator 21. -/
def ep_Q2_019_partial_21_0173 : Poly :=
[
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 21. -/
theorem ep_Q2_019_partial_21_0173_valid :
    mulPoly ep_Q2_019_coefficient_21_0173
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0174 : Poly :=
[
  term ((-26744257346631612282020677129457593947152 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 174 for generator 21. -/
def ep_Q2_019_partial_21_0174 : Poly :=
[
  term ((-53488514693263224564041354258915187894304 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((26744257346631612282020677129457593947152 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 21. -/
theorem ep_Q2_019_partial_21_0174_valid :
    mulPoly ep_Q2_019_coefficient_21_0174
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0175 : Poly :=
[
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 2), (16, 1)]
]

/-- Partial product 175 for generator 21. -/
def ep_Q2_019_partial_21_0175 : Poly :=
[
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 21. -/
theorem ep_Q2_019_partial_21_0175_valid :
    mulPoly ep_Q2_019_coefficient_21_0175
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0176 : Poly :=
[
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 176 for generator 21. -/
def ep_Q2_019_partial_21_0176 : Poly :=
[
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 21. -/
theorem ep_Q2_019_partial_21_0176_valid :
    mulPoly ep_Q2_019_coefficient_21_0176
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0177 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 177 for generator 21. -/
def ep_Q2_019_partial_21_0177 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 21. -/
theorem ep_Q2_019_partial_21_0177_valid :
    mulPoly ep_Q2_019_coefficient_21_0177
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0178 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 21. -/
def ep_Q2_019_partial_21_0178 : Poly :=
[
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 21. -/
theorem ep_Q2_019_partial_21_0178_valid :
    mulPoly ep_Q2_019_coefficient_21_0178
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0179 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 179 for generator 21. -/
def ep_Q2_019_partial_21_0179 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 21. -/
theorem ep_Q2_019_partial_21_0179_valid :
    mulPoly ep_Q2_019_coefficient_21_0179
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0180 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 180 for generator 21. -/
def ep_Q2_019_partial_21_0180 : Poly :=
[
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 21. -/
theorem ep_Q2_019_partial_21_0180_valid :
    mulPoly ep_Q2_019_coefficient_21_0180
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0181 : Poly :=
[
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 181 for generator 21. -/
def ep_Q2_019_partial_21_0181 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 21. -/
theorem ep_Q2_019_partial_21_0181_valid :
    mulPoly ep_Q2_019_coefficient_21_0181
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0182 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 21. -/
def ep_Q2_019_partial_21_0182 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 21. -/
theorem ep_Q2_019_partial_21_0182_valid :
    mulPoly ep_Q2_019_coefficient_21_0182
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0183 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 183 for generator 21. -/
def ep_Q2_019_partial_21_0183 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 21. -/
theorem ep_Q2_019_partial_21_0183_valid :
    mulPoly ep_Q2_019_coefficient_21_0183
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0184 : Poly :=
[
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 184 for generator 21. -/
def ep_Q2_019_partial_21_0184 : Poly :=
[
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 21. -/
theorem ep_Q2_019_partial_21_0184_valid :
    mulPoly ep_Q2_019_coefficient_21_0184
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0185 : Poly :=
[
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 21. -/
def ep_Q2_019_partial_21_0185 : Poly :=
[
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 21. -/
theorem ep_Q2_019_partial_21_0185_valid :
    mulPoly ep_Q2_019_coefficient_21_0185
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0186 : Poly :=
[
  term ((-273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 21. -/
def ep_Q2_019_partial_21_0186 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 21. -/
theorem ep_Q2_019_partial_21_0186_valid :
    mulPoly ep_Q2_019_coefficient_21_0186
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0187 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 187 for generator 21. -/
def ep_Q2_019_partial_21_0187 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 21. -/
theorem ep_Q2_019_partial_21_0187_valid :
    mulPoly ep_Q2_019_coefficient_21_0187
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0188 : Poly :=
[
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 21. -/
def ep_Q2_019_partial_21_0188 : Poly :=
[
  term ((563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 21. -/
theorem ep_Q2_019_partial_21_0188_valid :
    mulPoly ep_Q2_019_coefficient_21_0188
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0189 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 189 for generator 21. -/
def ep_Q2_019_partial_21_0189 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 21. -/
theorem ep_Q2_019_partial_21_0189_valid :
    mulPoly ep_Q2_019_coefficient_21_0189
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0190 : Poly :=
[
  term ((14568168463021218087641631335075744248 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 190 for generator 21. -/
def ep_Q2_019_partial_21_0190 : Poly :=
[
  term ((29136336926042436175283262670151488496 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-14568168463021218087641631335075744248 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 21. -/
theorem ep_Q2_019_partial_21_0190_valid :
    mulPoly ep_Q2_019_coefficient_21_0190
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0191 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 21. -/
def ep_Q2_019_partial_21_0191 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 21. -/
theorem ep_Q2_019_partial_21_0191_valid :
    mulPoly ep_Q2_019_coefficient_21_0191
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0192 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 192 for generator 21. -/
def ep_Q2_019_partial_21_0192 : Poly :=
[
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 21. -/
theorem ep_Q2_019_partial_21_0192_valid :
    mulPoly ep_Q2_019_coefficient_21_0192
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0193 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 21. -/
def ep_Q2_019_partial_21_0193 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 21. -/
theorem ep_Q2_019_partial_21_0193_valid :
    mulPoly ep_Q2_019_coefficient_21_0193
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0194 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 194 for generator 21. -/
def ep_Q2_019_partial_21_0194 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 21. -/
theorem ep_Q2_019_partial_21_0194_valid :
    mulPoly ep_Q2_019_coefficient_21_0194
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0195 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 195 for generator 21. -/
def ep_Q2_019_partial_21_0195 : Poly :=
[
  term ((-563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 21. -/
theorem ep_Q2_019_partial_21_0195_valid :
    mulPoly ep_Q2_019_coefficient_21_0195
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0196 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 196 for generator 21. -/
def ep_Q2_019_partial_21_0196 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 21. -/
theorem ep_Q2_019_partial_21_0196_valid :
    mulPoly ep_Q2_019_coefficient_21_0196
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0197 : Poly :=
[
  term ((-836218933477960609280439195013341912 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 197 for generator 21. -/
def ep_Q2_019_partial_21_0197 : Poly :=
[
  term ((-1672437866955921218560878390026683824 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((836218933477960609280439195013341912 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 21. -/
theorem ep_Q2_019_partial_21_0197_valid :
    mulPoly ep_Q2_019_coefficient_21_0197
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0198 : Poly :=
[
  term ((2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 198 for generator 21. -/
def ep_Q2_019_partial_21_0198 : Poly :=
[
  term ((5688220129156081842208453035711239424 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 21. -/
theorem ep_Q2_019_partial_21_0198_valid :
    mulPoly ep_Q2_019_coefficient_21_0198
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0199 : Poly :=
[
  term ((1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 199 for generator 21. -/
def ep_Q2_019_partial_21_0199 : Poly :=
[
  term ((2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 21. -/
theorem ep_Q2_019_partial_21_0199_valid :
    mulPoly ep_Q2_019_coefficient_21_0199
        ep_Q2_019_generator_21_0100_0199 =
      ep_Q2_019_partial_21_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_21_0100_0199 : List Poly :=
[
  ep_Q2_019_partial_21_0100,
  ep_Q2_019_partial_21_0101,
  ep_Q2_019_partial_21_0102,
  ep_Q2_019_partial_21_0103,
  ep_Q2_019_partial_21_0104,
  ep_Q2_019_partial_21_0105,
  ep_Q2_019_partial_21_0106,
  ep_Q2_019_partial_21_0107,
  ep_Q2_019_partial_21_0108,
  ep_Q2_019_partial_21_0109,
  ep_Q2_019_partial_21_0110,
  ep_Q2_019_partial_21_0111,
  ep_Q2_019_partial_21_0112,
  ep_Q2_019_partial_21_0113,
  ep_Q2_019_partial_21_0114,
  ep_Q2_019_partial_21_0115,
  ep_Q2_019_partial_21_0116,
  ep_Q2_019_partial_21_0117,
  ep_Q2_019_partial_21_0118,
  ep_Q2_019_partial_21_0119,
  ep_Q2_019_partial_21_0120,
  ep_Q2_019_partial_21_0121,
  ep_Q2_019_partial_21_0122,
  ep_Q2_019_partial_21_0123,
  ep_Q2_019_partial_21_0124,
  ep_Q2_019_partial_21_0125,
  ep_Q2_019_partial_21_0126,
  ep_Q2_019_partial_21_0127,
  ep_Q2_019_partial_21_0128,
  ep_Q2_019_partial_21_0129,
  ep_Q2_019_partial_21_0130,
  ep_Q2_019_partial_21_0131,
  ep_Q2_019_partial_21_0132,
  ep_Q2_019_partial_21_0133,
  ep_Q2_019_partial_21_0134,
  ep_Q2_019_partial_21_0135,
  ep_Q2_019_partial_21_0136,
  ep_Q2_019_partial_21_0137,
  ep_Q2_019_partial_21_0138,
  ep_Q2_019_partial_21_0139,
  ep_Q2_019_partial_21_0140,
  ep_Q2_019_partial_21_0141,
  ep_Q2_019_partial_21_0142,
  ep_Q2_019_partial_21_0143,
  ep_Q2_019_partial_21_0144,
  ep_Q2_019_partial_21_0145,
  ep_Q2_019_partial_21_0146,
  ep_Q2_019_partial_21_0147,
  ep_Q2_019_partial_21_0148,
  ep_Q2_019_partial_21_0149,
  ep_Q2_019_partial_21_0150,
  ep_Q2_019_partial_21_0151,
  ep_Q2_019_partial_21_0152,
  ep_Q2_019_partial_21_0153,
  ep_Q2_019_partial_21_0154,
  ep_Q2_019_partial_21_0155,
  ep_Q2_019_partial_21_0156,
  ep_Q2_019_partial_21_0157,
  ep_Q2_019_partial_21_0158,
  ep_Q2_019_partial_21_0159,
  ep_Q2_019_partial_21_0160,
  ep_Q2_019_partial_21_0161,
  ep_Q2_019_partial_21_0162,
  ep_Q2_019_partial_21_0163,
  ep_Q2_019_partial_21_0164,
  ep_Q2_019_partial_21_0165,
  ep_Q2_019_partial_21_0166,
  ep_Q2_019_partial_21_0167,
  ep_Q2_019_partial_21_0168,
  ep_Q2_019_partial_21_0169,
  ep_Q2_019_partial_21_0170,
  ep_Q2_019_partial_21_0171,
  ep_Q2_019_partial_21_0172,
  ep_Q2_019_partial_21_0173,
  ep_Q2_019_partial_21_0174,
  ep_Q2_019_partial_21_0175,
  ep_Q2_019_partial_21_0176,
  ep_Q2_019_partial_21_0177,
  ep_Q2_019_partial_21_0178,
  ep_Q2_019_partial_21_0179,
  ep_Q2_019_partial_21_0180,
  ep_Q2_019_partial_21_0181,
  ep_Q2_019_partial_21_0182,
  ep_Q2_019_partial_21_0183,
  ep_Q2_019_partial_21_0184,
  ep_Q2_019_partial_21_0185,
  ep_Q2_019_partial_21_0186,
  ep_Q2_019_partial_21_0187,
  ep_Q2_019_partial_21_0188,
  ep_Q2_019_partial_21_0189,
  ep_Q2_019_partial_21_0190,
  ep_Q2_019_partial_21_0191,
  ep_Q2_019_partial_21_0192,
  ep_Q2_019_partial_21_0193,
  ep_Q2_019_partial_21_0194,
  ep_Q2_019_partial_21_0195,
  ep_Q2_019_partial_21_0196,
  ep_Q2_019_partial_21_0197,
  ep_Q2_019_partial_21_0198,
  ep_Q2_019_partial_21_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_21_0100_0199 : Poly :=
[
  term ((-42058616088689138854977500291694230680 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((329817050918937592263904317163901825768 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((124467490022332717128406033507400166787187 : Rat) / 5126687315796091106681140589094399048585) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((21029308044344569427488750145847115340 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((-164908525459468796131952158581950912884 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124467490022332717128406033507400166787187 : Rat) / 10253374631592182213362281178188798097170) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5072235696079430732017713438435677568 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-11787847787146421070087589616343588888248 : Rat) / 56337223250506495677814731748290099435) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((-617281570909810061864194159627460032 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (9, 2), (10, 2), (16, 1)],
  term ((2536117848039715366008856719217838784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (9, 2), (14, 1), (16, 1)],
  term ((5895312777107757607682989245030956229196 : Rat) / 56337223250506495677814731748290099435) [(0, 1), (9, 2), (16, 1)],
  term ((769612413105665019457609919098680823040 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((741648245990769512846588699893436429888 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (13, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1586440311901508277670817630067192112184 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2405045276159845189994191936323403223104 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1218894867473639897343154112519973645744 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-169373016002236313386001737171494239092 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((995597430612772764955548887569929610603 : Rat) / 7105595725289107562967623824108661190) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-26746285326219038296591059157752662016 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-75183754050199195241269121861560098586456 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16442959837590396151658813847229397568 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1525332148684993132383949749949459928360 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1275568726505004929728451025583807488 : Rat) / 368217145428147030573952495086863395) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19385194419646029981894590556673975806706 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-17550706298920522288697099067902247648 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((19516967027197585944110276076862850132233 : Rat) / 488255934837722962541061008485180861770) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-308674898713988194685540602384965367889 : Rat) / 15023259533468398847417261799544026516) [(0, 1), (10, 1), (16, 1)],
  term ((-2467383164229141709187830790389404768 : Rat) / 368217145428147030573952495086863395) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3325303718235376922355700939946782041423 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((793220155950754138835408815033596056092 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1202522638079922594997095968161701611552 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-609447433736819948671577056259986822872 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((84686508001118156693000868585747119546 : Rat) / 2577520017997029214017667465608043765) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-995597430612772764955548887569929610603 : Rat) / 14211191450578215125935247648217322380) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(0, 1), (11, 2), (16, 1)],
  term ((13373142663109519148295529578876331008 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((37591877025099597620634560930780049293228 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((8221479918795198075829406923614698784 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3886735020848299796808212340887734612748 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((9692597209823014990947295278336987903353 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (14, 1), (16, 1)],
  term ((8775353149460261144348549533951123824 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 2), (16, 1)],
  term ((-3916259032375923552656533370528888978546 : Rat) / 100523280701884139346689031158713706835) [(0, 1), (15, 2), (16, 1)],
  term ((308674898713988194685540602384965367889 : Rat) / 30046519066936797694834523599088053032) [(0, 1), (16, 1)],
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((23851470335322866064704121833463737088 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (10, 1), (16, 1)],
  term ((-11925735167661433032352060916731868544 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (16, 1)],
  term ((31801960447097154752938829111284982784 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((9921774813733573912920081109272084132672 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1079766871041753129303394965480048642108 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4960887406866786956460040554636042066336 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((7348042602875127049570476477660932608 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (9, 2), (10, 1), (16, 1)],
  term ((-3674021301437563524785238238830466304 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (9, 2), (16, 1)],
  term ((-4954673923093612385589630088686293225376 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((514165286410813619978200815068211056926 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20885659741763263429951146049575936 : Rat) / 73643429085629406114790499017372679) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-899546295212383089359591675696870918832 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (10, 1), (16, 1)],
  term ((2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-257082643205406809989100407534105528463 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((10442829870881631714975573024787968 : Rat) / 73643429085629406114790499017372679) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((449773147606191544679795837848435459416 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (16, 1)],
  term ((-181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (8, 1), (16, 1)],
  term ((181064694087024185626457829673696320 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (8, 1), (16, 1)],
  term ((27937922088167421509561379346609335472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (8, 1), (16, 1)],
  term ((-16783544694840687248184595652782366736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-5989962957601272036561783445704328384816 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((2994981478800636018280891722852164192408 : Rat) / 78872112550709093948940624447606139209) [(1, 1), (2, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((21592409146461972364290240863057216224 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-464900235265353377114001320087533069245952 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10796204573230986182145120431528608112 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((232450117632676688557000660043766534622976 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((1703023193121861081361938139214814547304 : Rat) / 8048174750072356525402104535470014205) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-7495161058141004925835109542372528032 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1192608553023506442233627187295023613244 : Rat) / 11267444650101299135562946349658019887) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (14, 2), (16, 1)],
  term ((1873790264535251231458777385593132008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-20498369506009338408133596763827371488 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-6578941560399134524892131112195216341648 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-629699892410862716225315777634380641888 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((11508994161706481136276833397924764139608 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-35147538553589935558232665226955648 : Rat) / 24168692943160229806012325932342385) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((10249184753004669204066798381913685744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((314849946205431358112657888817190320944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5750941452021769507780907605639885074412 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((8786884638397483889558166306738912 : Rat) / 24168692943160229806012325932342385) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (8, 1), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term ((32477798178186409433556851012817582192 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (14, 1), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-64508204946011463695292932445100608 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((53557911826171797877892432582415388427584 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)],
  term ((-26778955913085898938946216291207694213792 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53488514693263224564041354258915187894304 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((-1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (10, 2), (16, 1)],
  term ((26744257346631612282020677129457593947152 : Rat) / 394360562753545469744703122238030696045) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (10, 2), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (9, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((29136336926042436175283262670151488496 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-14568168463021218087641631335075744248 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-1672437866955921218560878390026683824 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((836218933477960609280439195013341912 : Rat) / 368217145428147030573952495086863395) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((5688220129156081842208453035711239424 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((2844110064578040921104226517855619712 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1422055032289020460552113258927809856 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 199. -/
theorem ep_Q2_019_block_21_0100_0199_valid :
    checkProductSumEq ep_Q2_019_partials_21_0100_0199
      ep_Q2_019_block_21_0100_0199 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
