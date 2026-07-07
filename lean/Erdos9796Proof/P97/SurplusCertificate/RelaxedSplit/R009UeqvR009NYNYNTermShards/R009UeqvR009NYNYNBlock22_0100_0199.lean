/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 22:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0100 : Poly :=
[
  term ((673359591147178125320765069079809112241920703617653246026620240648930358536060349 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 100 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0100 : Poly :=
[
  term ((-673359591147178125320765069079809112241920703617653246026620240648930358536060349 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((673359591147178125320765069079809112241920703617653246026620240648930358536060349 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((-673359591147178125320765069079809112241920703617653246026620240648930358536060349 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((673359591147178125320765069079809112241920703617653246026620240648930358536060349 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(1, 2), (2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0100_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0100
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0101 : Poly :=
[
  term ((12214872525768650035782866 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 101 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0101 : Poly :=
[
  term ((-24429745051537300071565732 : Rat) / 1262724155015302911456105) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((12214872525768650035782866 : Rat) / 1262724155015302911456105) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24429745051537300071565732 : Rat) / 1262724155015302911456105) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((12214872525768650035782866 : Rat) / 1262724155015302911456105) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0101_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0101
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0102 : Poly :=
[
  term ((181414935875184421027075980008107307137440155304476635862907206371255708697 : Rat) / 6779254508867337441720639638040100142945102802872877373343470653189482976) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 102 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0102 : Poly :=
[
  term ((-181414935875184421027075980008107307137440155304476635862907206371255708697 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((181414935875184421027075980008107307137440155304476635862907206371255708697 : Rat) / 6779254508867337441720639638040100142945102802872877373343470653189482976) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-181414935875184421027075980008107307137440155304476635862907206371255708697 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((181414935875184421027075980008107307137440155304476635862907206371255708697 : Rat) / 6779254508867337441720639638040100142945102802872877373343470653189482976) [(1, 2), (2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0102_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0102
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0103 : Poly :=
[
  term ((-991479509234332985931 : Rat) / 1735703305862959328462) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0103 : Poly :=
[
  term ((991479509234332985931 : Rat) / 867851652931479664231) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-991479509234332985931 : Rat) / 1735703305862959328462) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((991479509234332985931 : Rat) / 867851652931479664231) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-991479509234332985931 : Rat) / 1735703305862959328462) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0103_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0103
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0104 : Poly :=
[
  term ((-176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(2, 1), (9, 2)]
]

/-- Partial product 104 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0104 : Poly :=
[
  term ((176375072352257063007722857907413136971273 : Rat) / 2637811665043196544547524545091053285700) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((-176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(0, 2), (2, 1), (9, 2)],
  term ((176375072352257063007722857907413136971273 : Rat) / 2637811665043196544547524545091053285700) [(1, 1), (2, 1), (9, 2), (11, 1)],
  term ((-176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(1, 2), (2, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0104_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0104
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0105 : Poly :=
[
  term ((225052398265382388846 : Rat) / 867851652931479664231) [(2, 1), (9, 2), (16, 1)]
]

/-- Partial product 105 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0105 : Poly :=
[
  term ((-450104796530764777692 : Rat) / 867851652931479664231) [(0, 1), (2, 1), (9, 2), (10, 1), (16, 1)],
  term ((225052398265382388846 : Rat) / 867851652931479664231) [(0, 2), (2, 1), (9, 2), (16, 1)],
  term ((-450104796530764777692 : Rat) / 867851652931479664231) [(1, 1), (2, 1), (9, 2), (11, 1), (16, 1)],
  term ((225052398265382388846 : Rat) / 867851652931479664231) [(1, 2), (2, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0105_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0105
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0106 : Poly :=
[
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 106 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0106 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0106_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0106
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0107 : Poly :=
[
  term ((-259488125040711455125631468474212795134425228871699254570202995 : Rat) / 9878229035249398788348903172729972365187631220259059036606972) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 107 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0107 : Poly :=
[
  term ((259488125040711455125631468474212795134425228871699254570202995 : Rat) / 4939114517624699394174451586364986182593815610129529518303486) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-259488125040711455125631468474212795134425228871699254570202995 : Rat) / 9878229035249398788348903172729972365187631220259059036606972) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((259488125040711455125631468474212795134425228871699254570202995 : Rat) / 4939114517624699394174451586364986182593815610129529518303486) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-259488125040711455125631468474212795134425228871699254570202995 : Rat) / 9878229035249398788348903172729972365187631220259059036606972) [(1, 2), (2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0107_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0107
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0108 : Poly :=
[
  term ((117710747342730361250 : Rat) / 123978807561639952033) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0108 : Poly :=
[
  term ((-235421494685460722500 : Rat) / 123978807561639952033) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((117710747342730361250 : Rat) / 123978807561639952033) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-235421494685460722500 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((117710747342730361250 : Rat) / 123978807561639952033) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0108_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0108
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0109 : Poly :=
[
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (11, 2)]
]

/-- Partial product 109 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0109 : Poly :=
[
  term ((52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (2, 1), (11, 2)],
  term ((52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (11, 3)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (2, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0109_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0109
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0110 : Poly :=
[
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(2, 1), (12, 1)]
]

/-- Partial product 110 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0110 : Poly :=
[
  term ((8689460260151950010003495602522303067365279449322 : Rat) / 440627241376898604067663445917070714465089452411) [(0, 1), (2, 1), (10, 1), (12, 1)],
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(0, 2), (2, 1), (12, 1)],
  term ((8689460260151950010003495602522303067365279449322 : Rat) / 440627241376898604067663445917070714465089452411) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(1, 2), (2, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0110_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0110
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0111 : Poly :=
[
  term ((-236669526965406508002782561148540596229373137431843248041025998931161872753339783 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 111 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0111 : Poly :=
[
  term ((236669526965406508002782561148540596229373137431843248041025998931161872753339783 : Rat) / 328793843680065865923451022444944856932837485939334552607158326679689924336000) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-236669526965406508002782561148540596229373137431843248041025998931161872753339783 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((236669526965406508002782561148540596229373137431843248041025998931161872753339783 : Rat) / 328793843680065865923451022444944856932837485939334552607158326679689924336000) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-236669526965406508002782561148540596229373137431843248041025998931161872753339783 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(1, 2), (2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0111_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0111
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0112 : Poly :=
[
  term ((-4258882207506364006858687 : Rat) / 841816103343535274304070) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0112 : Poly :=
[
  term ((4258882207506364006858687 : Rat) / 420908051671767637152035) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4258882207506364006858687 : Rat) / 841816103343535274304070) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((4258882207506364006858687 : Rat) / 420908051671767637152035) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4258882207506364006858687 : Rat) / 841816103343535274304070) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0112_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0112
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0113 : Poly :=
[
  term ((-976660217253214768985688760595364060610773330268826230970449335137 : Rat) / 153559797304313262134245878695284076668722007500791183206608686784) [(2, 1), (15, 2)]
]

/-- Partial product 113 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0113 : Poly :=
[
  term ((976660217253214768985688760595364060610773330268826230970449335137 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-976660217253214768985688760595364060610773330268826230970449335137 : Rat) / 153559797304313262134245878695284076668722007500791183206608686784) [(0, 2), (2, 1), (15, 2)],
  term ((976660217253214768985688760595364060610773330268826230970449335137 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-976660217253214768985688760595364060610773330268826230970449335137 : Rat) / 153559797304313262134245878695284076668722007500791183206608686784) [(1, 2), (2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0113_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0113
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0114 : Poly :=
[
  term ((573410073832299 : Rat) / 2097797909654734) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0114 : Poly :=
[
  term ((-573410073832299 : Rat) / 1048898954827367) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((573410073832299 : Rat) / 2097797909654734) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-573410073832299 : Rat) / 1048898954827367) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((573410073832299 : Rat) / 2097797909654734) [(1, 2), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0114_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0114
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0115 : Poly :=
[
  term ((-25469822002816779017 : Rat) / 2616253678755118260) [(2, 1), (16, 1)]
]

/-- Partial product 115 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0115 : Poly :=
[
  term ((25469822002816779017 : Rat) / 1308126839377559130) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-25469822002816779017 : Rat) / 2616253678755118260) [(0, 2), (2, 1), (16, 1)],
  term ((25469822002816779017 : Rat) / 1308126839377559130) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-25469822002816779017 : Rat) / 2616253678755118260) [(1, 2), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0115_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0115
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0116 : Poly :=
[
  term ((-1080585119636583191150937457393166704624362533731200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1)]
]

/-- Partial product 116 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0116 : Poly :=
[
  term ((2161170239273166382301874914786333409248725067462400000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (3, 1), (5, 1), (10, 1)],
  term ((-1080585119636583191150937457393166704624362533731200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (3, 1), (5, 1)],
  term ((2161170239273166382301874914786333409248725067462400000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-1080585119636583191150937457393166704624362533731200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (3, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0116_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0116
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0117 : Poly :=
[
  term ((3378469387379326172748056903825983723613710653609369600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1)]
]

/-- Partial product 117 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0117 : Poly :=
[
  term ((-6756938774758652345496113807651967447227421307218739200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1)],
  term ((3378469387379326172748056903825983723613710653609369600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (3, 1), (5, 1), (8, 1)],
  term ((-6756938774758652345496113807651967447227421307218739200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1)],
  term ((3378469387379326172748056903825983723613710653609369600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (3, 1), (5, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0117_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0117
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0118 : Poly :=
[
  term ((176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 118 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0118 : Poly :=
[
  term ((-176375072352257063007722857907413136971273 : Rat) / 2637811665043196544547524545091053285700) [(0, 1), (3, 1), (8, 1), (9, 1), (10, 1)],
  term ((176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(0, 2), (3, 1), (8, 1), (9, 1)],
  term ((-176375072352257063007722857907413136971273 : Rat) / 2637811665043196544547524545091053285700) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term ((176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(1, 2), (3, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0118_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0118
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0119 : Poly :=
[
  term ((-225052398265382388846 : Rat) / 867851652931479664231) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 119 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0119 : Poly :=
[
  term ((450104796530764777692 : Rat) / 867851652931479664231) [(0, 1), (3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-225052398265382388846 : Rat) / 867851652931479664231) [(0, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((450104796530764777692 : Rat) / 867851652931479664231) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-225052398265382388846 : Rat) / 867851652931479664231) [(1, 2), (3, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0119_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0119
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0120 : Poly :=
[
  term ((1064804525152170091707413255827956999851338178107508025536912447 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 120 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0120 : Poly :=
[
  term ((-2129609050304340183414826511655913999702676356215016051073824894 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1)],
  term ((1064804525152170091707413255827956999851338178107508025536912447 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(0, 2), (3, 1), (8, 1), (11, 1)],
  term ((-2129609050304340183414826511655913999702676356215016051073824894 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(1, 1), (3, 1), (8, 1), (11, 2)],
  term ((1064804525152170091707413255827956999851338178107508025536912447 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(1, 2), (3, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0120_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0120
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0121 : Poly :=
[
  term ((170103298901223206856 : Rat) / 123978807561639952033) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 121 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0121 : Poly :=
[
  term ((-340206597802446413712 : Rat) / 123978807561639952033) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((170103298901223206856 : Rat) / 123978807561639952033) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-340206597802446413712 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (11, 2), (16, 1)],
  term ((170103298901223206856 : Rat) / 123978807561639952033) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0121_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0121
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0122 : Poly :=
[
  term ((-52743032766290534070202365676968446777405634524162066325885184157647555595373607 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 122 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0122 : Poly :=
[
  term ((52743032766290534070202365676968446777405634524162066325885184157647555595373607 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-52743032766290534070202365676968446777405634524162066325885184157647555595373607 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(0, 2), (3, 1), (8, 1), (13, 1)],
  term ((52743032766290534070202365676968446777405634524162066325885184157647555595373607 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term ((-52743032766290534070202365676968446777405634524162066325885184157647555595373607 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(1, 2), (3, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0122_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0122
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0123 : Poly :=
[
  term ((1054200526266933588355822 : Rat) / 1262724155015302911456105) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0123 : Poly :=
[
  term ((-2108401052533867176711644 : Rat) / 1262724155015302911456105) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((1054200526266933588355822 : Rat) / 1262724155015302911456105) [(0, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2108401052533867176711644 : Rat) / 1262724155015302911456105) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1054200526266933588355822 : Rat) / 1262724155015302911456105) [(1, 2), (3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0123_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0123
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0124 : Poly :=
[
  term ((-262906481721582099496531351938154170398487352792434562043138608413109329007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 124 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0124 : Poly :=
[
  term ((262906481721582099496531351938154170398487352792434562043138608413109329007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-262906481721582099496531351938154170398487352792434562043138608413109329007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((262906481721582099496531351938154170398487352792434562043138608413109329007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-262906481721582099496531351938154170398487352792434562043138608413109329007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(1, 2), (3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0124_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0124
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0125 : Poly :=
[
  term ((-923245572161610202 : Rat) / 1526147979273818985) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0125 : Poly :=
[
  term ((1846491144323220404 : Rat) / 1526147979273818985) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-923245572161610202 : Rat) / 1526147979273818985) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1846491144323220404 : Rat) / 1526147979273818985) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-923245572161610202 : Rat) / 1526147979273818985) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0125_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0125
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0126 : Poly :=
[
  term ((-107577016157126082514485226055960751846359595661369914981672776443857348374249633 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(3, 1), (9, 1)]
]

/-- Partial product 126 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0126 : Poly :=
[
  term ((107577016157126082514485226055960751846359595661369914981672776443857348374249633 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((-107577016157126082514485226055960751846359595661369914981672776443857348374249633 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(0, 2), (3, 1), (9, 1)],
  term ((107577016157126082514485226055960751846359595661369914981672776443857348374249633 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-107577016157126082514485226055960751846359595661369914981672776443857348374249633 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(1, 2), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0126_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0126
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0127 : Poly :=
[
  term ((-1660571575406451291172657 : Rat) / 5050896620061211645824420) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 127 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0127 : Poly :=
[
  term ((1660571575406451291172657 : Rat) / 2525448310030605822912210) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1660571575406451291172657 : Rat) / 5050896620061211645824420) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((1660571575406451291172657 : Rat) / 2525448310030605822912210) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1660571575406451291172657 : Rat) / 5050896620061211645824420) [(1, 2), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0127_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0127
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0128 : Poly :=
[
  term ((-79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 128 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0128 : Poly :=
[
  term ((158419571240182102862800304476717233816116887887648 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((-79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((158419571240182102862800304476717233816116887887648 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (3, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0128_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0128
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0129 : Poly :=
[
  term ((-84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 129 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0129 : Poly :=
[
  term ((168620742576057644395520324384214197572388568502736 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((168620742576057644395520324384214197572388568502736 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0129_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0129
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0130 : Poly :=
[
  term ((287810894948028164169450967788592223136460166913338782183826197 : Rat) / 493911451762469939417445158636498618259381561012952951830348600) [(3, 1), (11, 1)]
]

/-- Partial product 130 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0130 : Poly :=
[
  term ((-287810894948028164169450967788592223136460166913338782183826197 : Rat) / 246955725881234969708722579318249309129690780506476475915174300) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((287810894948028164169450967788592223136460166913338782183826197 : Rat) / 493911451762469939417445158636498618259381561012952951830348600) [(0, 2), (3, 1), (11, 1)],
  term ((-287810894948028164169450967788592223136460166913338782183826197 : Rat) / 246955725881234969708722579318249309129690780506476475915174300) [(1, 1), (3, 1), (11, 2)],
  term ((287810894948028164169450967788592223136460166913338782183826197 : Rat) / 493911451762469939417445158636498618259381561012952951830348600) [(1, 2), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0130_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0130
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0131 : Poly :=
[
  term ((-111247925229858026231 : Rat) / 123978807561639952033) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 131 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0131 : Poly :=
[
  term ((222495850459716052462 : Rat) / 123978807561639952033) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-111247925229858026231 : Rat) / 123978807561639952033) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((222495850459716052462 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-111247925229858026231 : Rat) / 123978807561639952033) [(1, 2), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0131_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0131
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0132 : Poly :=
[
  term ((24967246660542390918728451494344439900272933731518545649334141368249626111336847 : Rat) / 136052624971061737623496974804804768386001718319724642458134480005388934208000) [(3, 1), (13, 1)]
]

/-- Partial product 132 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0132 : Poly :=
[
  term ((-24967246660542390918728451494344439900272933731518545649334141368249626111336847 : Rat) / 68026312485530868811748487402402384193000859159862321229067240002694467104000) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((24967246660542390918728451494344439900272933731518545649334141368249626111336847 : Rat) / 136052624971061737623496974804804768386001718319724642458134480005388934208000) [(0, 2), (3, 1), (13, 1)],
  term ((-24967246660542390918728451494344439900272933731518545649334141368249626111336847 : Rat) / 68026312485530868811748487402402384193000859159862321229067240002694467104000) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((24967246660542390918728451494344439900272933731518545649334141368249626111336847 : Rat) / 136052624971061737623496974804804768386001718319724642458134480005388934208000) [(1, 2), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0132_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0132
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0133 : Poly :=
[
  term ((1363528196640620124896861 : Rat) / 721556660008744520832060) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0133 : Poly :=
[
  term ((-1363528196640620124896861 : Rat) / 360778330004372260416030) [(0, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((1363528196640620124896861 : Rat) / 721556660008744520832060) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1363528196640620124896861 : Rat) / 360778330004372260416030) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((1363528196640620124896861 : Rat) / 721556660008744520832060) [(1, 2), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0133_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0133
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0134 : Poly :=
[
  term ((11685445492719892921868613990521803316054584918353280977254559475577836995398419 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(3, 1), (15, 1)]
]

/-- Partial product 134 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0134 : Poly :=
[
  term ((-11685445492719892921868613990521803316054584918353280977254559475577836995398419 : Rat) / 6529199992266014099066187022587116373173682916072099272240222204778113100800) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((11685445492719892921868613990521803316054584918353280977254559475577836995398419 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(0, 2), (3, 1), (15, 1)],
  term ((-11685445492719892921868613990521803316054584918353280977254559475577836995398419 : Rat) / 6529199992266014099066187022587116373173682916072099272240222204778113100800) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((11685445492719892921868613990521803316054584918353280977254559475577836995398419 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(1, 2), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0134_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0134
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0135 : Poly :=
[
  term ((409066017232270297079 : Rat) / 25639286051800158948) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0135 : Poly :=
[
  term ((-409066017232270297079 : Rat) / 12819643025900079474) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((409066017232270297079 : Rat) / 25639286051800158948) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-409066017232270297079 : Rat) / 12819643025900079474) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((409066017232270297079 : Rat) / 25639286051800158948) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0135_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0135
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0136 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 136 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0136 : Poly :=
[
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (8, 1), (10, 2), (13, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0136_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0136
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0137 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 137 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0137 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (8, 1), (10, 2), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0137_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0137
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0138 : Poly :=
[
  term ((31920625116302465270919874880558069939831207322798899200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 138 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0138 : Poly :=
[
  term ((-63841250232604930541839749761116139879662414645597798400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((31920625116302465270919874880558069939831207322798899200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (8, 1), (11, 1)],
  term ((-63841250232604930541839749761116139879662414645597798400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (8, 1), (11, 2)],
  term ((31920625116302465270919874880558069939831207322798899200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0138_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0138
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0139 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 139 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0139 : Poly :=
[
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0139_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0139
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0140 : Poly :=
[
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 140 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0140 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0140_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0140
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0141 : Poly :=
[
  term ((-90752695078762293151249413178128236088728895761751142400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 141 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0141 : Poly :=
[
  term ((181505390157524586302498826356256472177457791523502284800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-90752695078762293151249413178128236088728895761751142400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((181505390157524586302498826356256472177457791523502284800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1)],
  term ((-90752695078762293151249413178128236088728895761751142400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0141_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0141
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0142 : Poly :=
[
  term ((1309120989383292210837225509549360120807768679473408000 : Rat) / 173433167502533793224162752212389262107675610420778337) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 142 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0142 : Poly :=
[
  term ((-2618241978766584421674451019098720241615537358946816000 : Rat) / 173433167502533793224162752212389262107675610420778337) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((1309120989383292210837225509549360120807768679473408000 : Rat) / 173433167502533793224162752212389262107675610420778337) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((-2618241978766584421674451019098720241615537358946816000 : Rat) / 173433167502533793224162752212389262107675610420778337) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((1309120989383292210837225509549360120807768679473408000 : Rat) / 173433167502533793224162752212389262107675610420778337) [(1, 2), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0142_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0142
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0143 : Poly :=
[
  term ((-439334552058540759758794516260350742910238008776641100800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1)]
]

/-- Partial product 143 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0143 : Poly :=
[
  term ((878669104117081519517589032520701485820476017553282201600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (9, 1), (10, 1)],
  term ((-439334552058540759758794516260350742910238008776641100800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (9, 1)],
  term ((878669104117081519517589032520701485820476017553282201600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-439334552058540759758794516260350742910238008776641100800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0143_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0143
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0144 : Poly :=
[
  term ((-44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 144 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0144 : Poly :=
[
  term ((89592968923696972729209872382104711935757768467637043200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((-44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (9, 1), (10, 1)],
  term ((89592968923696972729209872382104711935757768467637043200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1)],
  term ((-44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0144_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0144
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0145 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 145 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0145 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0145_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0145
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0146 : Poly :=
[
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 146 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0146 : Poly :=
[
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (9, 1), (12, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0146_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0146
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0147 : Poly :=
[
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 147 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0147 : Poly :=
[
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0147_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0147
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0148 : Poly :=
[
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 148 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0148 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0148_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0148
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0149 : Poly :=
[
  term ((44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 149 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0149 : Poly :=
[
  term ((-89592968923696972729209872382104711935757768467637043200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-89592968923696972729209872382104711935757768467637043200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0149_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0149
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0150 : Poly :=
[
  term ((-2586612730820319450153444903623059424941459497128960000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (11, 1)]
]

/-- Partial product 150 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0150 : Poly :=
[
  term ((5173225461640638900306889807246118849882918994257920000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((-2586612730820319450153444903623059424941459497128960000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(0, 2), (5, 1), (11, 1)],
  term ((5173225461640638900306889807246118849882918994257920000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(1, 1), (5, 1), (11, 2)],
  term ((-2586612730820319450153444903623059424941459497128960000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(1, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0150_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0150
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0151 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 151 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0151 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0151_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0151
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0152 : Poly :=
[
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 152 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0152 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0152_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0152
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0153 : Poly :=
[
  term ((-142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 153 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0153 : Poly :=
[
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0153_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0153
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0154 : Poly :=
[
  term ((30188050591147782053323657987592999284133828741779379200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (13, 1)]
]

/-- Partial product 154 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0154 : Poly :=
[
  term ((-60376101182295564106647315975185998568267657483558758400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(0, 1), (5, 1), (10, 1), (13, 1)],
  term ((30188050591147782053323657987592999284133828741779379200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(0, 2), (5, 1), (13, 1)],
  term ((-60376101182295564106647315975185998568267657483558758400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((30188050591147782053323657987592999284133828741779379200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(1, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0154_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0154
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0155 : Poly :=
[
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 155 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0155 : Poly :=
[
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0155_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0155
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0156 : Poly :=
[
  term ((31994963551199484354292251830488902202824086027476326400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (15, 1)]
]

/-- Partial product 156 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0156 : Poly :=
[
  term ((-63989927102398968708584503660977804405648172054952652800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((31994963551199484354292251830488902202824086027476326400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (15, 1)],
  term ((-63989927102398968708584503660977804405648172054952652800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((31994963551199484354292251830488902202824086027476326400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0156_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0156
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0157 : Poly :=
[
  term ((3846164741859078581749037559809843448435958964628167099 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1)]
]

/-- Partial product 157 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0157 : Poly :=
[
  term ((-7692329483718157163498075119619686896871917929256334198 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (10, 1)],
  term ((3846164741859078581749037559809843448435958964628167099 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (6, 1)],
  term ((-7692329483718157163498075119619686896871917929256334198 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (6, 1), (11, 1)],
  term ((3846164741859078581749037559809843448435958964628167099 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0157_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0157
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0158 : Poly :=
[
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (8, 1)]
]

/-- Partial product 158 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0158 : Poly :=
[
  term ((3290277726257895407502237622917870061781566862099115568 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (8, 1), (10, 1)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (6, 1), (8, 1)],
  term ((3290277726257895407502237622917870061781566862099115568 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0158_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0158
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0159 : Poly :=
[
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(6, 2)]
]

/-- Partial product 159 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0159 : Poly :=
[
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (6, 2), (10, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(0, 2), (6, 2)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (6, 2), (11, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(1, 2), (6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0159_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0159
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0160 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0160 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0160_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0160
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0161 : Poly :=
[
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(7, 1), (9, 1)]
]

/-- Partial product 161 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0161 : Poly :=
[
  term ((2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (7, 1), (9, 1)],
  term ((2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0161_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0161
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0162 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 162 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0162 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0162_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0162
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0163 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0163 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0163_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0163
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0164 : Poly :=
[
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 164 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0164 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0164_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0164
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0165 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0165 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0165_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0165
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0166 : Poly :=
[
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(7, 2)]
]

/-- Partial product 166 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0166 : Poly :=
[
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (7, 2), (10, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(0, 2), (7, 2)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (7, 2), (11, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(1, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0166_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0166
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0167 : Poly :=
[
  term ((-6147325384566530899462207546796886645742419481713140939875026356111322769782489736211 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1)]
]

/-- Partial product 167 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0167 : Poly :=
[
  term ((6147325384566530899462207546796886645742419481713140939875026356111322769782489736211 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(0, 1), (8, 1), (10, 1)],
  term ((-6147325384566530899462207546796886645742419481713140939875026356111322769782489736211 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(0, 2), (8, 1)],
  term ((6147325384566530899462207546796886645742419481713140939875026356111322769782489736211 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(1, 1), (8, 1), (11, 1)],
  term ((-6147325384566530899462207546796886645742419481713140939875026356111322769782489736211 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(1, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0167_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0167
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0168 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 168 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0168 : Poly :=
[
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0168_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0168
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0169 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 169 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0169 : Poly :=
[
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0169_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0169
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0170 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 170 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0170 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0170_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0170
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0171 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0171 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0171_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0171
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0172 : Poly :=
[
  term ((10179162901752810243714801369169812452503 : Rat) / 26484052861879483378991210292078848250) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 172 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0172 : Poly :=
[
  term ((-10179162901752810243714801369169812452503 : Rat) / 13242026430939741689495605146039424125) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((10179162901752810243714801369169812452503 : Rat) / 26484052861879483378991210292078848250) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term ((-10179162901752810243714801369169812452503 : Rat) / 13242026430939741689495605146039424125) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((10179162901752810243714801369169812452503 : Rat) / 26484052861879483378991210292078848250) [(1, 2), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0172_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0172
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0173 : Poly :=
[
  term ((9264652804555527906168 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 173 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0173 : Poly :=
[
  term ((-18529305609111055812336 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((9264652804555527906168 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-18529305609111055812336 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((9264652804555527906168 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0173_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0173
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0174 : Poly :=
[
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 174 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0174 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(0, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(1, 2), (8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0174_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0174
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0175 : Poly :=
[
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 175 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0175 : Poly :=
[
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0175_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0175
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0176 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 176 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0176 : Poly :=
[
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0176_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0176
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0177 : Poly :=
[
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0177 : Poly :=
[
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0177_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0177
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0178 : Poly :=
[
  term ((-106502907822755300962077484962037496469425217831110143145533131515881228844779727 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 178 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0178 : Poly :=
[
  term ((106502907822755300962077484962037496469425217831110143145533131515881228844779727 : Rat) / 73978614828014819832776480050112592809888434336350274336610623502930232975600) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-106502907822755300962077484962037496469425217831110143145533131515881228844779727 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((106502907822755300962077484962037496469425217831110143145533131515881228844779727 : Rat) / 73978614828014819832776480050112592809888434336350274336610623502930232975600) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-106502907822755300962077484962037496469425217831110143145533131515881228844779727 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(1, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0178_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0178
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0179 : Poly :=
[
  term ((-37486658537327643890916659 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 179 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0179 : Poly :=
[
  term ((74973317074655287781833318 : Rat) / 3788172465045908734368315) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-37486658537327643890916659 : Rat) / 3788172465045908734368315) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((74973317074655287781833318 : Rat) / 3788172465045908734368315) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-37486658537327643890916659 : Rat) / 3788172465045908734368315) [(1, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0179_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0179
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0180 : Poly :=
[
  term ((290516195147543543174401687237079826383582823836494144779337840942541403431575039 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 180 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0180 : Poly :=
[
  term ((-290516195147543543174401687237079826383582823836494144779337840942541403431575039 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((290516195147543543174401687237079826383582823836494144779337840942541403431575039 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-290516195147543543174401687237079826383582823836494144779337840942541403431575039 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((290516195147543543174401687237079826383582823836494144779337840942541403431575039 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(1, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0180_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0180
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0181 : Poly :=
[
  term ((5208673082886360571399247 : Rat) / 1082334990013116781248090) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0181 : Poly :=
[
  term ((-5208673082886360571399247 : Rat) / 541167495006558390624045) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5208673082886360571399247 : Rat) / 1082334990013116781248090) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5208673082886360571399247 : Rat) / 541167495006558390624045) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5208673082886360571399247 : Rat) / 1082334990013116781248090) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0181_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0181
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0182 : Poly :=
[
  term ((176341754222601703068863644471626836397574 : Rat) / 3297264581303995680684405681363816607125) [(8, 1), (9, 2)]
]

/-- Partial product 182 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0182 : Poly :=
[
  term ((-352683508445203406137727288943253672795148 : Rat) / 3297264581303995680684405681363816607125) [(0, 1), (8, 1), (9, 2), (10, 1)],
  term ((176341754222601703068863644471626836397574 : Rat) / 3297264581303995680684405681363816607125) [(0, 2), (8, 1), (9, 2)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 3297264581303995680684405681363816607125) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((176341754222601703068863644471626836397574 : Rat) / 3297264581303995680684405681363816607125) [(1, 2), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0182_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0182
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0183 : Poly :=
[
  term ((-1800079077971282196384 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (16, 1)]
]

/-- Partial product 183 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0183 : Poly :=
[
  term ((3600158155942564392768 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-1800079077971282196384 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 2), (16, 1)],
  term ((3600158155942564392768 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1800079077971282196384 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0183_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0183
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0184 : Poly :=
[
  term ((-21146417255601733553165994599259651618482670398359 : Rat) / 1261105552906296004745381586590236872434566363797) [(8, 1), (10, 1)]
]

/-- Partial product 184 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0184 : Poly :=
[
  term ((42292834511203467106331989198519303236965340796718 : Rat) / 1261105552906296004745381586590236872434566363797) [(0, 1), (8, 1), (10, 2)],
  term ((-21146417255601733553165994599259651618482670398359 : Rat) / 1261105552906296004745381586590236872434566363797) [(0, 2), (8, 1), (10, 1)],
  term ((42292834511203467106331989198519303236965340796718 : Rat) / 1261105552906296004745381586590236872434566363797) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-21146417255601733553165994599259651618482670398359 : Rat) / 1261105552906296004745381586590236872434566363797) [(1, 2), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0184_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0184
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0185 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 185 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0185 : Poly :=
[
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0185_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0185
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0186 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 186 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0186 : Poly :=
[
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(0, 1), (8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0186_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0186
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0187 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 187 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0187 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0187_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0187
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0188 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0188 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0188_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0188
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0189 : Poly :=
[
  term ((11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 189 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0189 : Poly :=
[
  term ((-23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(0, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0189_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0189
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0190 : Poly :=
[
  term ((2575376191602437283392 : Rat) / 1859682113424599280495) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0190 : Poly :=
[
  term ((-5150752383204874566784 : Rat) / 1859682113424599280495) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2575376191602437283392 : Rat) / 1859682113424599280495) [(0, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5150752383204874566784 : Rat) / 1859682113424599280495) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2575376191602437283392 : Rat) / 1859682113424599280495) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0190_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0190
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0191 : Poly :=
[
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (10, 1), (13, 2)]
]

/-- Partial product 191 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0191 : Poly :=
[
  term ((271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(0, 1), (8, 1), (10, 2), (13, 2)],
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(0, 2), (8, 1), (10, 1), (13, 2)],
  term ((271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(1, 2), (8, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0191_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0191
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0192 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 192 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0192 : Poly :=
[
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(0, 1), (8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0192_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0192
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0193 : Poly :=
[
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 193 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0193 : Poly :=
[
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(0, 1), (8, 1), (10, 2), (15, 2)],
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 2), (8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0193_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0193
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0194 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 194 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0194 : Poly :=
[
  term ((3852076819738752 : Rat) / 7342292683791569) [(0, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0194_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0194
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0195 : Poly :=
[
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 195 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0195 : Poly :=
[
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0195_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0195
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0196 : Poly :=
[
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 196 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0196 : Poly :=
[
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0196_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0196
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0197 : Poly :=
[
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 197 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0197 : Poly :=
[
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0197_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0197
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0198 : Poly :=
[
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0198 : Poly :=
[
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0198_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0198
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0199 : Poly :=
[
  term ((-2289300195141027879782814915721170177796800472875210097908564706 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 199 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0199 : Poly :=
[
  term ((4578600390282055759565629831442340355593600945750420195817129412 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2289300195141027879782814915721170177796800472875210097908564706 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((4578600390282055759565629831442340355593600945750420195817129412 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((-2289300195141027879782814915721170177796800472875210097908564706 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(1, 2), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0199_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0199
        rs_R009_ueqv_R009NYNYN_generator_22_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_22_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_22_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_22_0100,
  rs_R009_ueqv_R009NYNYN_partial_22_0101,
  rs_R009_ueqv_R009NYNYN_partial_22_0102,
  rs_R009_ueqv_R009NYNYN_partial_22_0103,
  rs_R009_ueqv_R009NYNYN_partial_22_0104,
  rs_R009_ueqv_R009NYNYN_partial_22_0105,
  rs_R009_ueqv_R009NYNYN_partial_22_0106,
  rs_R009_ueqv_R009NYNYN_partial_22_0107,
  rs_R009_ueqv_R009NYNYN_partial_22_0108,
  rs_R009_ueqv_R009NYNYN_partial_22_0109,
  rs_R009_ueqv_R009NYNYN_partial_22_0110,
  rs_R009_ueqv_R009NYNYN_partial_22_0111,
  rs_R009_ueqv_R009NYNYN_partial_22_0112,
  rs_R009_ueqv_R009NYNYN_partial_22_0113,
  rs_R009_ueqv_R009NYNYN_partial_22_0114,
  rs_R009_ueqv_R009NYNYN_partial_22_0115,
  rs_R009_ueqv_R009NYNYN_partial_22_0116,
  rs_R009_ueqv_R009NYNYN_partial_22_0117,
  rs_R009_ueqv_R009NYNYN_partial_22_0118,
  rs_R009_ueqv_R009NYNYN_partial_22_0119,
  rs_R009_ueqv_R009NYNYN_partial_22_0120,
  rs_R009_ueqv_R009NYNYN_partial_22_0121,
  rs_R009_ueqv_R009NYNYN_partial_22_0122,
  rs_R009_ueqv_R009NYNYN_partial_22_0123,
  rs_R009_ueqv_R009NYNYN_partial_22_0124,
  rs_R009_ueqv_R009NYNYN_partial_22_0125,
  rs_R009_ueqv_R009NYNYN_partial_22_0126,
  rs_R009_ueqv_R009NYNYN_partial_22_0127,
  rs_R009_ueqv_R009NYNYN_partial_22_0128,
  rs_R009_ueqv_R009NYNYN_partial_22_0129,
  rs_R009_ueqv_R009NYNYN_partial_22_0130,
  rs_R009_ueqv_R009NYNYN_partial_22_0131,
  rs_R009_ueqv_R009NYNYN_partial_22_0132,
  rs_R009_ueqv_R009NYNYN_partial_22_0133,
  rs_R009_ueqv_R009NYNYN_partial_22_0134,
  rs_R009_ueqv_R009NYNYN_partial_22_0135,
  rs_R009_ueqv_R009NYNYN_partial_22_0136,
  rs_R009_ueqv_R009NYNYN_partial_22_0137,
  rs_R009_ueqv_R009NYNYN_partial_22_0138,
  rs_R009_ueqv_R009NYNYN_partial_22_0139,
  rs_R009_ueqv_R009NYNYN_partial_22_0140,
  rs_R009_ueqv_R009NYNYN_partial_22_0141,
  rs_R009_ueqv_R009NYNYN_partial_22_0142,
  rs_R009_ueqv_R009NYNYN_partial_22_0143,
  rs_R009_ueqv_R009NYNYN_partial_22_0144,
  rs_R009_ueqv_R009NYNYN_partial_22_0145,
  rs_R009_ueqv_R009NYNYN_partial_22_0146,
  rs_R009_ueqv_R009NYNYN_partial_22_0147,
  rs_R009_ueqv_R009NYNYN_partial_22_0148,
  rs_R009_ueqv_R009NYNYN_partial_22_0149,
  rs_R009_ueqv_R009NYNYN_partial_22_0150,
  rs_R009_ueqv_R009NYNYN_partial_22_0151,
  rs_R009_ueqv_R009NYNYN_partial_22_0152,
  rs_R009_ueqv_R009NYNYN_partial_22_0153,
  rs_R009_ueqv_R009NYNYN_partial_22_0154,
  rs_R009_ueqv_R009NYNYN_partial_22_0155,
  rs_R009_ueqv_R009NYNYN_partial_22_0156,
  rs_R009_ueqv_R009NYNYN_partial_22_0157,
  rs_R009_ueqv_R009NYNYN_partial_22_0158,
  rs_R009_ueqv_R009NYNYN_partial_22_0159,
  rs_R009_ueqv_R009NYNYN_partial_22_0160,
  rs_R009_ueqv_R009NYNYN_partial_22_0161,
  rs_R009_ueqv_R009NYNYN_partial_22_0162,
  rs_R009_ueqv_R009NYNYN_partial_22_0163,
  rs_R009_ueqv_R009NYNYN_partial_22_0164,
  rs_R009_ueqv_R009NYNYN_partial_22_0165,
  rs_R009_ueqv_R009NYNYN_partial_22_0166,
  rs_R009_ueqv_R009NYNYN_partial_22_0167,
  rs_R009_ueqv_R009NYNYN_partial_22_0168,
  rs_R009_ueqv_R009NYNYN_partial_22_0169,
  rs_R009_ueqv_R009NYNYN_partial_22_0170,
  rs_R009_ueqv_R009NYNYN_partial_22_0171,
  rs_R009_ueqv_R009NYNYN_partial_22_0172,
  rs_R009_ueqv_R009NYNYN_partial_22_0173,
  rs_R009_ueqv_R009NYNYN_partial_22_0174,
  rs_R009_ueqv_R009NYNYN_partial_22_0175,
  rs_R009_ueqv_R009NYNYN_partial_22_0176,
  rs_R009_ueqv_R009NYNYN_partial_22_0177,
  rs_R009_ueqv_R009NYNYN_partial_22_0178,
  rs_R009_ueqv_R009NYNYN_partial_22_0179,
  rs_R009_ueqv_R009NYNYN_partial_22_0180,
  rs_R009_ueqv_R009NYNYN_partial_22_0181,
  rs_R009_ueqv_R009NYNYN_partial_22_0182,
  rs_R009_ueqv_R009NYNYN_partial_22_0183,
  rs_R009_ueqv_R009NYNYN_partial_22_0184,
  rs_R009_ueqv_R009NYNYN_partial_22_0185,
  rs_R009_ueqv_R009NYNYN_partial_22_0186,
  rs_R009_ueqv_R009NYNYN_partial_22_0187,
  rs_R009_ueqv_R009NYNYN_partial_22_0188,
  rs_R009_ueqv_R009NYNYN_partial_22_0189,
  rs_R009_ueqv_R009NYNYN_partial_22_0190,
  rs_R009_ueqv_R009NYNYN_partial_22_0191,
  rs_R009_ueqv_R009NYNYN_partial_22_0192,
  rs_R009_ueqv_R009NYNYN_partial_22_0193,
  rs_R009_ueqv_R009NYNYN_partial_22_0194,
  rs_R009_ueqv_R009NYNYN_partial_22_0195,
  rs_R009_ueqv_R009NYNYN_partial_22_0196,
  rs_R009_ueqv_R009NYNYN_partial_22_0197,
  rs_R009_ueqv_R009NYNYN_partial_22_0198,
  rs_R009_ueqv_R009NYNYN_partial_22_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_22_0100_0199 : Poly :=
[
  term ((-673359591147178125320765069079809112241920703617653246026620240648930358536060349 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-24429745051537300071565732 : Rat) / 1262724155015302911456105) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-181414935875184421027075980008107307137440155304476635862907206371255708697 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((991479509234332985931 : Rat) / 867851652931479664231) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((176375072352257063007722857907413136971273 : Rat) / 2637811665043196544547524545091053285700) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((-450104796530764777692 : Rat) / 867851652931479664231) [(0, 1), (2, 1), (9, 2), (10, 1), (16, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((259488125040711455125631468474212795134425228871699254570202995 : Rat) / 4939114517624699394174451586364986182593815610129529518303486) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-235421494685460722500 : Rat) / 123978807561639952033) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((8689460260151950010003495602522303067365279449322 : Rat) / 440627241376898604067663445917070714465089452411) [(0, 1), (2, 1), (10, 1), (12, 1)],
  term ((236669526965406508002782561148540596229373137431843248041025998931161872753339783 : Rat) / 328793843680065865923451022444944856932837485939334552607158326679689924336000) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((4258882207506364006858687 : Rat) / 420908051671767637152035) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((976660217253214768985688760595364060610773330268826230970449335137 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-573410073832299 : Rat) / 1048898954827367) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((25469822002816779017 : Rat) / 1308126839377559130) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-6756938774758652345496113807651967447227421307218739200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1)],
  term ((2161170239273166382301874914786333409248725067462400000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (3, 1), (5, 1), (10, 1)],
  term ((-176375072352257063007722857907413136971273 : Rat) / 2637811665043196544547524545091053285700) [(0, 1), (3, 1), (8, 1), (9, 1), (10, 1)],
  term ((450104796530764777692 : Rat) / 867851652931479664231) [(0, 1), (3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2129609050304340183414826511655913999702676356215016051073824894 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1)],
  term ((-340206597802446413712 : Rat) / 123978807561639952033) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((52743032766290534070202365676968446777405634524162066325885184157647555595373607 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-2108401052533867176711644 : Rat) / 1262724155015302911456105) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((262906481721582099496531351938154170398487352792434562043138608413109329007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((1846491144323220404 : Rat) / 1526147979273818985) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((107577016157126082514485226055960751846359595661369914981672776443857348374249633 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((1660571575406451291172657 : Rat) / 2525448310030605822912210) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-287810894948028164169450967788592223136460166913338782183826197 : Rat) / 246955725881234969708722579318249309129690780506476475915174300) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((222495850459716052462 : Rat) / 123978807561639952033) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-24967246660542390918728451494344439900272933731518545649334141368249626111336847 : Rat) / 68026312485530868811748487402402384193000859159862321229067240002694467104000) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((-1363528196640620124896861 : Rat) / 360778330004372260416030) [(0, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-11685445492719892921868613990521803316054584918353280977254559475577836995398419 : Rat) / 6529199992266014099066187022587116373173682916072099272240222204778113100800) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-409066017232270297079 : Rat) / 12819643025900079474) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((158419571240182102862800304476717233816116887887648 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((168620742576057644395520324384214197572388568502736 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-63841250232604930541839749761116139879662414645597798400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((181505390157524586302498826356256472177457791523502284800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-2618241978766584421674451019098720241615537358946816000 : Rat) / 173433167502533793224162752212389262107675610420778337) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (8, 1), (10, 2), (13, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (8, 1), (10, 2), (15, 1)],
  term ((878669104117081519517589032520701485820476017553282201600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (9, 1), (10, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1)],
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((89592968923696972729209872382104711935757768467637043200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((5173225461640638900306889807246118849882918994257920000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-60376101182295564106647315975185998568267657483558758400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(0, 1), (5, 1), (10, 1), (13, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-63989927102398968708584503660977804405648172054952652800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((-89592968923696972729209872382104711935757768467637043200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((3290277726257895407502237622917870061781566862099115568 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (8, 1), (10, 1)],
  term ((-7692329483718157163498075119619686896871917929256334198 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (10, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (6, 2), (10, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 1), (7, 2), (10, 1)],
  term ((-10179162901752810243714801369169812452503 : Rat) / 13242026430939741689495605146039424125) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-18529305609111055812336 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((106502907822755300962077484962037496469425217831110143145533131515881228844779727 : Rat) / 73978614828014819832776480050112592809888434336350274336610623502930232975600) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((74973317074655287781833318 : Rat) / 3788172465045908734368315) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-290516195147543543174401687237079826383582823836494144779337840942541403431575039 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-5208673082886360571399247 : Rat) / 541167495006558390624045) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 3297264581303995680684405681363816607125) [(0, 1), (8, 1), (9, 2), (10, 1)],
  term ((3600158155942564392768 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((6147325384566530899462207546796886645742419481713140939875026356111322769782489736211 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(0, 1), (8, 1), (10, 1)],
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4578600390282055759565629831442340355593600945750420195817129412 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((42292834511203467106331989198519303236965340796718 : Rat) / 1261105552906296004745381586590236872434566363797) [(0, 1), (8, 1), (10, 2)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(0, 1), (8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-5150752383204874566784 : Rat) / 1859682113424599280495) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(0, 1), (8, 1), (10, 2), (13, 2)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(0, 1), (8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(0, 1), (8, 1), (10, 2), (15, 2)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(0, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((673359591147178125320765069079809112241920703617653246026620240648930358536060349 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((12214872525768650035782866 : Rat) / 1262724155015302911456105) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((181414935875184421027075980008107307137440155304476635862907206371255708697 : Rat) / 6779254508867337441720639638040100142945102802872877373343470653189482976) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-991479509234332985931 : Rat) / 1735703305862959328462) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(0, 2), (2, 1), (9, 2)],
  term ((225052398265382388846 : Rat) / 867851652931479664231) [(0, 2), (2, 1), (9, 2), (16, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-259488125040711455125631468474212795134425228871699254570202995 : Rat) / 9878229035249398788348903172729972365187631220259059036606972) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((117710747342730361250 : Rat) / 123978807561639952033) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (2, 1), (11, 2)],
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(0, 2), (2, 1), (12, 1)],
  term ((-236669526965406508002782561148540596229373137431843248041025998931161872753339783 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-4258882207506364006858687 : Rat) / 841816103343535274304070) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-976660217253214768985688760595364060610773330268826230970449335137 : Rat) / 153559797304313262134245878695284076668722007500791183206608686784) [(0, 2), (2, 1), (15, 2)],
  term ((573410073832299 : Rat) / 2097797909654734) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-25469822002816779017 : Rat) / 2616253678755118260) [(0, 2), (2, 1), (16, 1)],
  term ((-1080585119636583191150937457393166704624362533731200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (3, 1), (5, 1)],
  term ((3378469387379326172748056903825983723613710653609369600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (3, 1), (5, 1), (8, 1)],
  term ((176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(0, 2), (3, 1), (8, 1), (9, 1)],
  term ((-225052398265382388846 : Rat) / 867851652931479664231) [(0, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((1064804525152170091707413255827956999851338178107508025536912447 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(0, 2), (3, 1), (8, 1), (11, 1)],
  term ((170103298901223206856 : Rat) / 123978807561639952033) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-52743032766290534070202365676968446777405634524162066325885184157647555595373607 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(0, 2), (3, 1), (8, 1), (13, 1)],
  term ((1054200526266933588355822 : Rat) / 1262724155015302911456105) [(0, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-262906481721582099496531351938154170398487352792434562043138608413109329007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((-923245572161610202 : Rat) / 1526147979273818985) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-107577016157126082514485226055960751846359595661369914981672776443857348374249633 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(0, 2), (3, 1), (9, 1)],
  term ((-1660571575406451291172657 : Rat) / 5050896620061211645824420) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((287810894948028164169450967788592223136460166913338782183826197 : Rat) / 493911451762469939417445158636498618259381561012952951830348600) [(0, 2), (3, 1), (11, 1)],
  term ((-111247925229858026231 : Rat) / 123978807561639952033) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((24967246660542390918728451494344439900272933731518545649334141368249626111336847 : Rat) / 136052624971061737623496974804804768386001718319724642458134480005388934208000) [(0, 2), (3, 1), (13, 1)],
  term ((1363528196640620124896861 : Rat) / 721556660008744520832060) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((11685445492719892921868613990521803316054584918353280977254559475577836995398419 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(0, 2), (3, 1), (15, 1)],
  term ((409066017232270297079 : Rat) / 25639286051800158948) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((31920625116302465270919874880558069939831207322798899200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (8, 1), (11, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-90752695078762293151249413178128236088728895761751142400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((1309120989383292210837225509549360120807768679473408000 : Rat) / 173433167502533793224162752212389262107675610420778337) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((-439334552058540759758794516260350742910238008776641100800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (9, 1)],
  term ((-44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (9, 1), (10, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (9, 1), (12, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-2586612730820319450153444903623059424941459497128960000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(0, 2), (5, 1), (11, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((30188050591147782053323657987592999284133828741779379200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(0, 2), (5, 1), (13, 1)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((31994963551199484354292251830488902202824086027476326400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (15, 1)],
  term ((3846164741859078581749037559809843448435958964628167099 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (6, 1)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (6, 1), (8, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(0, 2), (6, 2)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (7, 1), (9, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(0, 2), (7, 2)],
  term ((-6147325384566530899462207546796886645742419481713140939875026356111322769782489736211 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(0, 2), (8, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((10179162901752810243714801369169812452503 : Rat) / 26484052861879483378991210292078848250) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term ((9264652804555527906168 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(0, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-106502907822755300962077484962037496469425217831110143145533131515881228844779727 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((-37486658537327643890916659 : Rat) / 3788172465045908734368315) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((290516195147543543174401687237079826383582823836494144779337840942541403431575039 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((5208673082886360571399247 : Rat) / 1082334990013116781248090) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((176341754222601703068863644471626836397574 : Rat) / 3297264581303995680684405681363816607125) [(0, 2), (8, 1), (9, 2)],
  term ((-1800079077971282196384 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 2), (16, 1)],
  term ((-21146417255601733553165994599259651618482670398359 : Rat) / 1261105552906296004745381586590236872434566363797) [(0, 2), (8, 1), (10, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(0, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2575376191602437283392 : Rat) / 1859682113424599280495) [(0, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(0, 2), (8, 1), (10, 1), (13, 2)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2289300195141027879782814915721170177796800472875210097908564706 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-673359591147178125320765069079809112241920703617653246026620240648930358536060349 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-24429745051537300071565732 : Rat) / 1262724155015302911456105) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-181414935875184421027075980008107307137440155304476635862907206371255708697 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((991479509234332985931 : Rat) / 867851652931479664231) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((176375072352257063007722857907413136971273 : Rat) / 2637811665043196544547524545091053285700) [(1, 1), (2, 1), (9, 2), (11, 1)],
  term ((-450104796530764777692 : Rat) / 867851652931479664231) [(1, 1), (2, 1), (9, 2), (11, 1), (16, 1)],
  term ((8689460260151950010003495602522303067365279449322 : Rat) / 440627241376898604067663445917070714465089452411) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((236669526965406508002782561148540596229373137431843248041025998931161872753339783 : Rat) / 328793843680065865923451022444944856932837485939334552607158326679689924336000) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((4258882207506364006858687 : Rat) / 420908051671767637152035) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((976660217253214768985688760595364060610773330268826230970449335137 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-573410073832299 : Rat) / 1048898954827367) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((25469822002816779017 : Rat) / 1308126839377559130) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((259488125040711455125631468474212795134425228871699254570202995 : Rat) / 4939114517624699394174451586364986182593815610129529518303486) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-235421494685460722500 : Rat) / 123978807561639952033) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((52806523746727367620933434825572411272038962629216 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (2, 1), (11, 3)],
  term ((-6756938774758652345496113807651967447227421307218739200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1)],
  term ((2161170239273166382301874914786333409248725067462400000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-176375072352257063007722857907413136971273 : Rat) / 2637811665043196544547524545091053285700) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term ((450104796530764777692 : Rat) / 867851652931479664231) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((52743032766290534070202365676968446777405634524162066325885184157647555595373607 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term ((-2108401052533867176711644 : Rat) / 1262724155015302911456105) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((262906481721582099496531351938154170398487352792434562043138608413109329007 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((1846491144323220404 : Rat) / 1526147979273818985) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2129609050304340183414826511655913999702676356215016051073824894 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(1, 1), (3, 1), (8, 1), (11, 2)],
  term ((-340206597802446413712 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (8, 1), (11, 2), (16, 1)],
  term ((107577016157126082514485226055960751846359595661369914981672776443857348374249633 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((1660571575406451291172657 : Rat) / 2525448310030605822912210) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((168620742576057644395520324384214197572388568502736 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((158419571240182102862800304476717233816116887887648 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-24967246660542390918728451494344439900272933731518545649334141368249626111336847 : Rat) / 68026312485530868811748487402402384193000859159862321229067240002694467104000) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-1363528196640620124896861 : Rat) / 360778330004372260416030) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-11685445492719892921868613990521803316054584918353280977254559475577836995398419 : Rat) / 6529199992266014099066187022587116373173682916072099272240222204778113100800) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-409066017232270297079 : Rat) / 12819643025900079474) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-287810894948028164169450967788592223136460166913338782183826197 : Rat) / 246955725881234969708722579318249309129690780506476475915174300) [(1, 1), (3, 1), (11, 2)],
  term ((222495850459716052462 : Rat) / 123978807561639952033) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((181505390157524586302498826356256472177457791523502284800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1)],
  term ((-2618241978766584421674451019098720241615537358946816000 : Rat) / 173433167502533793224162752212389262107675610420778337) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((-63841250232604930541839749761116139879662414645597798400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (8, 1), (11, 2)],
  term ((89592968923696972729209872382104711935757768467637043200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1)],
  term ((878669104117081519517589032520701485820476017553282201600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-89592968923696972729209872382104711935757768467637043200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-60376101182295564106647315975185998568267657483558758400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-63989927102398968708584503660977804405648172054952652800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((5173225461640638900306889807246118849882918994257920000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(1, 1), (5, 1), (11, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((3290277726257895407502237622917870061781566862099115568 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-7692329483718157163498075119619686896871917929256334198 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (6, 1), (11, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (6, 2), (11, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (7, 2), (11, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((106502907822755300962077484962037496469425217831110143145533131515881228844779727 : Rat) / 73978614828014819832776480050112592809888434336350274336610623502930232975600) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((74973317074655287781833318 : Rat) / 3788172465045908734368315) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-290516195147543543174401687237079826383582823836494144779337840942541403431575039 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-5208673082886360571399247 : Rat) / 541167495006558390624045) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10179162901752810243714801369169812452503 : Rat) / 13242026430939741689495605146039424125) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((-18529305609111055812336 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 3297264581303995680684405681363816607125) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((3600158155942564392768 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((42292834511203467106331989198519303236965340796718 : Rat) / 1261105552906296004745381586590236872434566363797) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5150752383204874566784 : Rat) / 1859682113424599280495) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((6147325384566530899462207546796886645742419481713140939875026356111322769782489736211 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(1, 1), (8, 1), (11, 1)],
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1)],
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4578600390282055759565629831442340355593600945750420195817129412 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((673359591147178125320765069079809112241920703617653246026620240648930358536060349 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((12214872525768650035782866 : Rat) / 1262724155015302911456105) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((181414935875184421027075980008107307137440155304476635862907206371255708697 : Rat) / 6779254508867337441720639638040100142945102802872877373343470653189482976) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-991479509234332985931 : Rat) / 1735703305862959328462) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(1, 2), (2, 1), (9, 2)],
  term ((225052398265382388846 : Rat) / 867851652931479664231) [(1, 2), (2, 1), (9, 2), (16, 1)],
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-259488125040711455125631468474212795134425228871699254570202995 : Rat) / 9878229035249398788348903172729972365187631220259059036606972) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((117710747342730361250 : Rat) / 123978807561639952033) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (2, 1), (11, 2)],
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(1, 2), (2, 1), (12, 1)],
  term ((-236669526965406508002782561148540596229373137431843248041025998931161872753339783 : Rat) / 657587687360131731846902044889889713865674971878669105214316653359379848672000) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-4258882207506364006858687 : Rat) / 841816103343535274304070) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-976660217253214768985688760595364060610773330268826230970449335137 : Rat) / 153559797304313262134245878695284076668722007500791183206608686784) [(1, 2), (2, 1), (15, 2)],
  term ((573410073832299 : Rat) / 2097797909654734) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-25469822002816779017 : Rat) / 2616253678755118260) [(1, 2), (2, 1), (16, 1)],
  term ((-1080585119636583191150937457393166704624362533731200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (3, 1), (5, 1)],
  term ((3378469387379326172748056903825983723613710653609369600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (3, 1), (5, 1), (8, 1)],
  term ((176375072352257063007722857907413136971273 : Rat) / 5275623330086393089095049090182106571400) [(1, 2), (3, 1), (8, 1), (9, 1)],
  term ((-225052398265382388846 : Rat) / 867851652931479664231) [(1, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((1064804525152170091707413255827956999851338178107508025536912447 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((170103298901223206856 : Rat) / 123978807561639952033) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-52743032766290534070202365676968446777405634524162066325885184157647555595373607 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(1, 2), (3, 1), (8, 1), (13, 1)],
  term ((1054200526266933588355822 : Rat) / 1262724155015302911456105) [(1, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-262906481721582099496531351938154170398487352792434562043138608413109329007 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-923245572161610202 : Rat) / 1526147979273818985) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-107577016157126082514485226055960751846359595661369914981672776443857348374249633 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(1, 2), (3, 1), (9, 1)],
  term ((-1660571575406451291172657 : Rat) / 5050896620061211645824420) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((287810894948028164169450967788592223136460166913338782183826197 : Rat) / 493911451762469939417445158636498618259381561012952951830348600) [(1, 2), (3, 1), (11, 1)],
  term ((-111247925229858026231 : Rat) / 123978807561639952033) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((24967246660542390918728451494344439900272933731518545649334141368249626111336847 : Rat) / 136052624971061737623496974804804768386001718319724642458134480005388934208000) [(1, 2), (3, 1), (13, 1)],
  term ((1363528196640620124896861 : Rat) / 721556660008744520832060) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((11685445492719892921868613990521803316054584918353280977254559475577836995398419 : Rat) / 13058399984532028198132374045174232746347365832144198544480444409556226201600) [(1, 2), (3, 1), (15, 1)],
  term ((409066017232270297079 : Rat) / 25639286051800158948) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((31920625116302465270919874880558069939831207322798899200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (8, 1), (11, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-90752695078762293151249413178128236088728895761751142400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((1309120989383292210837225509549360120807768679473408000 : Rat) / 173433167502533793224162752212389262107675610420778337) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((-439334552058540759758794516260350742910238008776641100800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (9, 1)],
  term ((-44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (9, 1), (10, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (9, 1), (12, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((44796484461848486364604936191052355967878884233818521600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-2586612730820319450153444903623059424941459497128960000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(1, 2), (5, 1), (11, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((-142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((30188050591147782053323657987592999284133828741779379200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(1, 2), (5, 1), (13, 1)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((31994963551199484354292251830488902202824086027476326400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (15, 1)],
  term ((3846164741859078581749037559809843448435958964628167099 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (6, 1)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (6, 1), (8, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(1, 2), (6, 2)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (7, 1), (9, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(1, 2), (7, 2)],
  term ((-6147325384566530899462207546796886645742419481713140939875026356111322769782489736211 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(1, 2), (8, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((10179162901752810243714801369169812452503 : Rat) / 26484052861879483378991210292078848250) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((9264652804555527906168 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(1, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-106502907822755300962077484962037496469425217831110143145533131515881228844779727 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((-37486658537327643890916659 : Rat) / 3788172465045908734368315) [(1, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((290516195147543543174401687237079826383582823836494144779337840942541403431575039 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((5208673082886360571399247 : Rat) / 1082334990013116781248090) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((176341754222601703068863644471626836397574 : Rat) / 3297264581303995680684405681363816607125) [(1, 2), (8, 1), (9, 2)],
  term ((-1800079077971282196384 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 2), (16, 1)],
  term ((-21146417255601733553165994599259651618482670398359 : Rat) / 1261105552906296004745381586590236872434566363797) [(1, 2), (8, 1), (10, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2575376191602437283392 : Rat) / 1859682113424599280495) [(1, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(1, 2), (8, 1), (10, 1), (13, 2)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2289300195141027879782814915721170177796800472875210097908564706 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(1, 2), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NYNYN_block_22_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_22_0100_0199
      rs_R009_ueqv_R009NYNYN_block_22_0100_0199 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
