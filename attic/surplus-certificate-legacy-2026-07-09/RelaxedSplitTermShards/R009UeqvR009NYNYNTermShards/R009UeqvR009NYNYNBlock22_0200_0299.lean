/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 22:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0200 : Poly :=
[
  term ((-7738313270705475688988 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 200 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0200 : Poly :=
[
  term ((15476626541410951377976 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7738313270705475688988 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((15476626541410951377976 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-7738313270705475688988 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0200_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0200
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0201 : Poly :=
[
  term ((-388118694006518409498952881312513731957721005288777080572125732820436085027 : Rat) / 3530861723368404917562833144812552157783907709829623631949724298536189050) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 201 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0201 : Poly :=
[
  term ((388118694006518409498952881312513731957721005288777080572125732820436085027 : Rat) / 1765430861684202458781416572406276078891953854914811815974862149268094525) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-388118694006518409498952881312513731957721005288777080572125732820436085027 : Rat) / 3530861723368404917562833144812552157783907709829623631949724298536189050) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((388118694006518409498952881312513731957721005288777080572125732820436085027 : Rat) / 1765430861684202458781416572406276078891953854914811815974862149268094525) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-388118694006518409498952881312513731957721005288777080572125732820436085027 : Rat) / 3530861723368404917562833144812552157783907709829623631949724298536189050) [(1, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0201_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0201
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0202 : Poly :=
[
  term ((-3041630856985828851106 : Rat) / 867851652931479664231) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0202 : Poly :=
[
  term ((6083261713971657702212 : Rat) / 867851652931479664231) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3041630856985828851106 : Rat) / 867851652931479664231) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((6083261713971657702212 : Rat) / 867851652931479664231) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3041630856985828851106 : Rat) / 867851652931479664231) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0202_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0202
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0203 : Poly :=
[
  term ((21305574407726005161604421521749652405968484627193554519281008 : Rat) / 425785734277991327084004447100429843327053069838752544681335) [(8, 1), (11, 2)]
]

/-- Partial product 203 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0203 : Poly :=
[
  term ((-42611148815452010323208843043499304811936969254387109038562016 : Rat) / 425785734277991327084004447100429843327053069838752544681335) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((21305574407726005161604421521749652405968484627193554519281008 : Rat) / 425785734277991327084004447100429843327053069838752544681335) [(0, 2), (8, 1), (11, 2)],
  term ((-42611148815452010323208843043499304811936969254387109038562016 : Rat) / 425785734277991327084004447100429843327053069838752544681335) [(1, 1), (8, 1), (11, 3)],
  term ((21305574407726005161604421521749652405968484627193554519281008 : Rat) / 425785734277991327084004447100429843327053069838752544681335) [(1, 2), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0203_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0203
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0204 : Poly :=
[
  term ((39202699702693592160 : Rat) / 123978807561639952033) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 204 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0204 : Poly :=
[
  term ((-78405399405387184320 : Rat) / 123978807561639952033) [(0, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((39202699702693592160 : Rat) / 123978807561639952033) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-78405399405387184320 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((39202699702693592160 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0204_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0204
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0205 : Poly :=
[
  term ((-111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(8, 1), (12, 1)]
]

/-- Partial product 205 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0205 : Poly :=
[
  term ((111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 556339467643661733049266106219079445566946397074991417198382941784092800) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((-111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(0, 2), (8, 1), (12, 1)],
  term ((111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 556339467643661733049266106219079445566946397074991417198382941784092800) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((-111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(1, 2), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0205_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0205
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0206 : Poly :=
[
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 206 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0206 : Poly :=
[
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(0, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0206_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0206
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0207 : Poly :=
[
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0207 : Poly :=
[
  term ((159009514516881327386792 : Rat) / 13017774793972194963465) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((159009514516881327386792 : Rat) / 13017774793972194963465) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0207_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0207
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0208 : Poly :=
[
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 208 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0208 : Poly :=
[
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(0, 2), (8, 1), (12, 1), (13, 2)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(1, 2), (8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0208_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0208
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0209 : Poly :=
[
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 209 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0209 : Poly :=
[
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0209_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0209
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0210 : Poly :=
[
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 210 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0210 : Poly :=
[
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(1, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0210_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0210
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0211 : Poly :=
[
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 211 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0211 : Poly :=
[
  term ((-22846657688183736 : Rat) / 7342292683791569) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0211_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0211
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0212 : Poly :=
[
  term ((882279375742283788 : Rat) / 712202390327782193) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 212 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0212 : Poly :=
[
  term ((-1764558751484567576 : Rat) / 712202390327782193) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((882279375742283788 : Rat) / 712202390327782193) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-1764558751484567576 : Rat) / 712202390327782193) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((882279375742283788 : Rat) / 712202390327782193) [(1, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0212_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0212
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0213 : Poly :=
[
  term ((2487614534660179361998623825844424998447165009534186795103505896392006417985963699 : Rat) / 972215809883913580871156764780517218685759822369370196371279950091418733184000) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 213 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0213 : Poly :=
[
  term ((-2487614534660179361998623825844424998447165009534186795103505896392006417985963699 : Rat) / 486107904941956790435578382390258609342879911184685098185639975045709366592000) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2487614534660179361998623825844424998447165009534186795103505896392006417985963699 : Rat) / 972215809883913580871156764780517218685759822369370196371279950091418733184000) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-2487614534660179361998623825844424998447165009534186795103505896392006417985963699 : Rat) / 486107904941956790435578382390258609342879911184685098185639975045709366592000) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2487614534660179361998623825844424998447165009534186795103505896392006417985963699 : Rat) / 972215809883913580871156764780517218685759822369370196371279950091418733184000) [(1, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0213_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0213
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0214 : Poly :=
[
  term ((38292519711737689797734133 : Rat) / 841816103343535274304070) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0214 : Poly :=
[
  term ((-38292519711737689797734133 : Rat) / 420908051671767637152035) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((38292519711737689797734133 : Rat) / 841816103343535274304070) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38292519711737689797734133 : Rat) / 420908051671767637152035) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38292519711737689797734133 : Rat) / 841816103343535274304070) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0214_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0214
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0215 : Poly :=
[
  term ((-855094960151897618334415747768083329784736162623635510623440937646377380845520193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (13, 2)]
]

/-- Partial product 215 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0215 : Poly :=
[
  term ((855094960151897618334415747768083329784736162623635510623440937646377380845520193 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((-855094960151897618334415747768083329784736162623635510623440937646377380845520193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(0, 2), (8, 1), (13, 2)],
  term ((855094960151897618334415747768083329784736162623635510623440937646377380845520193 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-855094960151897618334415747768083329784736162623635510623440937646377380845520193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(1, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0215_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0215
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0216 : Poly :=
[
  term ((-38389005037125460776446767 : Rat) / 3788172465045908734368315) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 216 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0216 : Poly :=
[
  term ((76778010074250921552893534 : Rat) / 3788172465045908734368315) [(0, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-38389005037125460776446767 : Rat) / 3788172465045908734368315) [(0, 2), (8, 1), (13, 2), (16, 1)],
  term ((76778010074250921552893534 : Rat) / 3788172465045908734368315) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-38389005037125460776446767 : Rat) / 3788172465045908734368315) [(1, 2), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0216_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0216
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0217 : Poly :=
[
  term ((-64315967157164771168137107979194816879275342448059640351270087578440680284106941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (15, 2)]
]

/-- Partial product 217 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0217 : Poly :=
[
  term ((64315967157164771168137107979194816879275342448059640351270087578440680284106941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-64315967157164771168137107979194816879275342448059640351270087578440680284106941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(0, 2), (8, 1), (15, 2)],
  term ((64315967157164771168137107979194816879275342448059640351270087578440680284106941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-64315967157164771168137107979194816879275342448059640351270087578440680284106941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(1, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0217_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0217
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0218 : Poly :=
[
  term ((-614169590089274996113 : Rat) / 32049107564750198685) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 218 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0218 : Poly :=
[
  term ((1228339180178549992226 : Rat) / 32049107564750198685) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-614169590089274996113 : Rat) / 32049107564750198685) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((1228339180178549992226 : Rat) / 32049107564750198685) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-614169590089274996113 : Rat) / 32049107564750198685) [(1, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0218_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0218
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0219 : Poly :=
[
  term ((-15825115299700038744565763 : Rat) / 674954205313639184306100) [(8, 1), (16, 1)]
]

/-- Partial product 219 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0219 : Poly :=
[
  term ((15825115299700038744565763 : Rat) / 337477102656819592153050) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-15825115299700038744565763 : Rat) / 674954205313639184306100) [(0, 2), (8, 1), (16, 1)],
  term ((15825115299700038744565763 : Rat) / 337477102656819592153050) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-15825115299700038744565763 : Rat) / 674954205313639184306100) [(1, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0219_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0219
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0220 : Poly :=
[
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (13, 1)]
]

/-- Partial product 220 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0220 : Poly :=
[
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 2), (9, 1), (10, 1), (13, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 2), (9, 1), (13, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0220_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0220
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0221 : Poly :=
[
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 221 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0221 : Poly :=
[
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(0, 1), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(0, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(1, 2), (8, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0221_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0221
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0222 : Poly :=
[
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (15, 1)]
]

/-- Partial product 222 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0222 : Poly :=
[
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 2), (9, 1), (10, 1), (15, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 2), (9, 1), (15, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0222_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0222
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0223 : Poly :=
[
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0223 : Poly :=
[
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(0, 1), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(0, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(1, 2), (8, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0223_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0223
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0224 : Poly :=
[
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 224 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0224 : Poly :=
[
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 2), (11, 1), (13, 1)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 2), (11, 2), (13, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0224_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0224
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0225 : Poly :=
[
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0225 : Poly :=
[
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(0, 1), (8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(0, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(1, 1), (8, 2), (11, 2), (13, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(1, 2), (8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0225_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0225
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0226 : Poly :=
[
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 226 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0226 : Poly :=
[
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 2), (11, 1), (15, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 2), (11, 2), (15, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0226_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0226
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0227 : Poly :=
[
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0227 : Poly :=
[
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(0, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(1, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(1, 2), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0227_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0227
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0228 : Poly :=
[
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 228 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0228 : Poly :=
[
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(0, 2), (8, 2), (13, 1), (15, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(1, 2), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0228_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0228
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0229 : Poly :=
[
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0229 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(0, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(1, 2), (8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0229_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0229
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0230 : Poly :=
[
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2)]
]

/-- Partial product 230 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0230 : Poly :=
[
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(0, 1), (8, 2), (10, 1), (13, 2)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(0, 2), (8, 2), (13, 2)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(1, 1), (8, 2), (11, 1), (13, 2)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(1, 2), (8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0230_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0230
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0231 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (16, 1)]
]

/-- Partial product 231 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0231 : Poly :=
[
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(0, 1), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(0, 2), (8, 2), (13, 2), (16, 1)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(1, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(1, 2), (8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0231_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0231
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0232 : Poly :=
[
  term ((48926813780635651012836186855237037894251031205575233928259575642 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 232 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0232 : Poly :=
[
  term ((-97853627561271302025672373710474075788502062411150467856519151284 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((48926813780635651012836186855237037894251031205575233928259575642 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-97853627561271302025672373710474075788502062411150467856519151284 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((48926813780635651012836186855237037894251031205575233928259575642 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0232_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0232
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0233 : Poly :=
[
  term ((127598003822847322096 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 233 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0233 : Poly :=
[
  term ((-255196007645694644192 : Rat) / 88556291115457108595) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((127598003822847322096 : Rat) / 88556291115457108595) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-255196007645694644192 : Rat) / 88556291115457108595) [(1, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((127598003822847322096 : Rat) / 88556291115457108595) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0233_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0233
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0234 : Poly :=
[
  term ((-3329853819343252765271124437215989537482320265427307517020099187473 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 234 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0234 : Poly :=
[
  term ((3329853819343252765271124437215989537482320265427307517020099187473 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-3329853819343252765271124437215989537482320265427307517020099187473 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((3329853819343252765271124437215989537482320265427307517020099187473 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-3329853819343252765271124437215989537482320265427307517020099187473 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(1, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0234_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0234
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0235 : Poly :=
[
  term ((-14585813107994552343044 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 235 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0235 : Poly :=
[
  term ((29171626215989104686088 : Rat) / 13017774793972194963465) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-14585813107994552343044 : Rat) / 13017774793972194963465) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((29171626215989104686088 : Rat) / 13017774793972194963465) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-14585813107994552343044 : Rat) / 13017774793972194963465) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0235_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0235
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0236 : Poly :=
[
  term ((942221813583219438643510812607824505984396631077722567728829987955351229371 : Rat) / 21185170340210429505376998868875312946703446258977741791698345791217134300) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 236 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0236 : Poly :=
[
  term ((-942221813583219438643510812607824505984396631077722567728829987955351229371 : Rat) / 10592585170105214752688499434437656473351723129488870895849172895608567150) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((942221813583219438643510812607824505984396631077722567728829987955351229371 : Rat) / 21185170340210429505376998868875312946703446258977741791698345791217134300) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-942221813583219438643510812607824505984396631077722567728829987955351229371 : Rat) / 10592585170105214752688499434437656473351723129488870895849172895608567150) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((942221813583219438643510812607824505984396631077722567728829987955351229371 : Rat) / 21185170340210429505376998868875312946703446258977741791698345791217134300) [(1, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0236_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0236
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0237 : Poly :=
[
  term ((208512742753143825198 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0237 : Poly :=
[
  term ((-417025485506287650396 : Rat) / 867851652931479664231) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((208512742753143825198 : Rat) / 867851652931479664231) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-417025485506287650396 : Rat) / 867851652931479664231) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((208512742753143825198 : Rat) / 867851652931479664231) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0237_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0237
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0238 : Poly :=
[
  term ((-652753635194840391416100555660199375847410465192563713079469194137130819814031029 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (11, 1)]
]

/-- Partial product 238 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0238 : Poly :=
[
  term ((652753635194840391416100555660199375847410465192563713079469194137130819814031029 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-652753635194840391416100555660199375847410465192563713079469194137130819814031029 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(0, 2), (9, 1), (11, 1)],
  term ((652753635194840391416100555660199375847410465192563713079469194137130819814031029 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(1, 1), (9, 1), (11, 2)],
  term ((-652753635194840391416100555660199375847410465192563713079469194137130819814031029 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(1, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0238_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0238
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0239 : Poly :=
[
  term ((-128887686063626276402639332905286181150983 : Rat) / 366362731255999520076045075707090734125) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 239 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0239 : Poly :=
[
  term ((257775372127252552805278665810572362301966 : Rat) / 366362731255999520076045075707090734125) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-128887686063626276402639332905286181150983 : Rat) / 366362731255999520076045075707090734125) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 366362731255999520076045075707090734125) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-128887686063626276402639332905286181150983 : Rat) / 366362731255999520076045075707090734125) [(1, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0239_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0239
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0240 : Poly :=
[
  term ((-3298735802059468212648 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 240 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0240 : Poly :=
[
  term ((6597471604118936425296 : Rat) / 619894037808199760165) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3298735802059468212648 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((6597471604118936425296 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3298735802059468212648 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0240_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0240
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0241 : Poly :=
[
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 241 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0241 : Poly :=
[
  term ((-4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0241_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0241
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0242 : Poly :=
[
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0242 : Poly :=
[
  term ((-2179610221583563253424 : Rat) / 619894037808199760165) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2179610221583563253424 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0242_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0242
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0243 : Poly :=
[
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 243 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0243 : Poly :=
[
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(1, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0243_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0243
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0244 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 244 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0244 : Poly :=
[
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0244_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0244
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0245 : Poly :=
[
  term ((-1713862084908557733831032 : Rat) / 757634493009181746873663) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 245 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0245 : Poly :=
[
  term ((3427724169817115467662064 : Rat) / 757634493009181746873663) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1713862084908557733831032 : Rat) / 757634493009181746873663) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((3427724169817115467662064 : Rat) / 757634493009181746873663) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1713862084908557733831032 : Rat) / 757634493009181746873663) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0245_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0245
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0246 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 246 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0246 : Poly :=
[
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (9, 1), (11, 3), (13, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0246_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0246
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0247 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 247 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0247 : Poly :=
[
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(0, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0247_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0247
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0248 : Poly :=
[
  term ((10152495972950643954924997895521878016875631 : Rat) / 26378116650431965445475245450910532857000) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 248 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0248 : Poly :=
[
  term ((-10152495972950643954924997895521878016875631 : Rat) / 13189058325215982722737622725455266428500) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((10152495972950643954924997895521878016875631 : Rat) / 26378116650431965445475245450910532857000) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-10152495972950643954924997895521878016875631 : Rat) / 13189058325215982722737622725455266428500) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((10152495972950643954924997895521878016875631 : Rat) / 26378116650431965445475245450910532857000) [(1, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0248_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0248
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0249 : Poly :=
[
  term ((16589428832267231994506 : Rat) / 4339258264657398321155) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 249 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0249 : Poly :=
[
  term ((-33178857664534463989012 : Rat) / 4339258264657398321155) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((16589428832267231994506 : Rat) / 4339258264657398321155) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-33178857664534463989012 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((16589428832267231994506 : Rat) / 4339258264657398321155) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0249_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0249
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0250 : Poly :=
[
  term ((-149238513438079446605894002441674403564844026657171537655608758987695227787581 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 250 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0250 : Poly :=
[
  term ((149238513438079446605894002441674403564844026657171537655608758987695227787581 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-149238513438079446605894002441674403564844026657171537655608758987695227787581 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((149238513438079446605894002441674403564844026657171537655608758987695227787581 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-149238513438079446605894002441674403564844026657171537655608758987695227787581 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(1, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0250_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0250
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0251 : Poly :=
[
  term ((-11581474898476549926096 : Rat) / 4339258264657398321155) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0251 : Poly :=
[
  term ((23162949796953099852192 : Rat) / 4339258264657398321155) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11581474898476549926096 : Rat) / 4339258264657398321155) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((23162949796953099852192 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11581474898476549926096 : Rat) / 4339258264657398321155) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0251_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0251
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0252 : Poly :=
[
  term ((4821492283562727526666864001846692394059109694074968533817688464392718021543167978283 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (13, 1)]
]

/-- Partial product 252 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0252 : Poly :=
[
  term ((-4821492283562727526666864001846692394059109694074968533817688464392718021543167978283 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((4821492283562727526666864001846692394059109694074968533817688464392718021543167978283 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(0, 2), (9, 1), (13, 1)],
  term ((-4821492283562727526666864001846692394059109694074968533817688464392718021543167978283 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((4821492283562727526666864001846692394059109694074968533817688464392718021543167978283 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(1, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0252_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0252
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0253 : Poly :=
[
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 253 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0253 : Poly :=
[
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(1, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0253_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0253
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0254 : Poly :=
[
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0254 : Poly :=
[
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0254_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0254
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0255 : Poly :=
[
  term ((150443152118584891364468563 : Rat) / 7576344930091817468736630) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 255 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0255 : Poly :=
[
  term ((-150443152118584891364468563 : Rat) / 3788172465045908734368315) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((150443152118584891364468563 : Rat) / 7576344930091817468736630) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-150443152118584891364468563 : Rat) / 3788172465045908734368315) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((150443152118584891364468563 : Rat) / 7576344930091817468736630) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0255_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0255
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0256 : Poly :=
[
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 256 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0256 : Poly :=
[
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(0, 2), (9, 1), (13, 2), (15, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(1, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0256_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0256
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0257 : Poly :=
[
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0257 : Poly :=
[
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(0, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0257_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0257
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0258 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (13, 3)]
]

/-- Partial product 258 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0258 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (13, 3)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (9, 1), (13, 3)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (11, 1), (13, 3)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0258_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0258
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0259 : Poly :=
[
  term ((8943467652347931579395504359325733144992956587479970080660715671588925840372396851 : Rat) / 114332579242348237110448035538188824917445355110637935093262522130750843022438400) [(9, 1), (15, 1)]
]

/-- Partial product 259 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0259 : Poly :=
[
  term ((-8943467652347931579395504359325733144992956587479970080660715671588925840372396851 : Rat) / 57166289621174118555224017769094412458722677555318967546631261065375421511219200) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((8943467652347931579395504359325733144992956587479970080660715671588925840372396851 : Rat) / 114332579242348237110448035538188824917445355110637935093262522130750843022438400) [(0, 2), (9, 1), (15, 1)],
  term ((-8943467652347931579395504359325733144992956587479970080660715671588925840372396851 : Rat) / 57166289621174118555224017769094412458722677555318967546631261065375421511219200) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((8943467652347931579395504359325733144992956587479970080660715671588925840372396851 : Rat) / 114332579242348237110448035538188824917445355110637935093262522130750843022438400) [(1, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0259_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0259
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0260 : Poly :=
[
  term ((-513244122064094278116851 : Rat) / 841816103343535274304070) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0260 : Poly :=
[
  term ((513244122064094278116851 : Rat) / 420908051671767637152035) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-513244122064094278116851 : Rat) / 841816103343535274304070) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((513244122064094278116851 : Rat) / 420908051671767637152035) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-513244122064094278116851 : Rat) / 841816103343535274304070) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0260_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0260
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0261 : Poly :=
[
  term ((-357121299974425989252098115060389731601235469513114485733858933021053036196816051 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(9, 2)]
]

/-- Partial product 261 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0261 : Poly :=
[
  term ((357121299974425989252098115060389731601235469513114485733858933021053036196816051 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(0, 1), (9, 2), (10, 1)],
  term ((-357121299974425989252098115060389731601235469513114485733858933021053036196816051 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(0, 2), (9, 2)],
  term ((357121299974425989252098115060389731601235469513114485733858933021053036196816051 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(1, 1), (9, 2), (11, 1)],
  term ((-357121299974425989252098115060389731601235469513114485733858933021053036196816051 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(1, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0261_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0261
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0262 : Poly :=
[
  term ((198453886270542249158428294688468317142477 : Rat) / 5652453567949706881173266882337971326500) [(9, 2), (10, 1)]
]

/-- Partial product 262 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0262 : Poly :=
[
  term ((-198453886270542249158428294688468317142477 : Rat) / 2826226783974853440586633441168985663250) [(0, 1), (9, 2), (10, 2)],
  term ((198453886270542249158428294688468317142477 : Rat) / 5652453567949706881173266882337971326500) [(0, 2), (9, 2), (10, 1)],
  term ((-198453886270542249158428294688468317142477 : Rat) / 2826226783974853440586633441168985663250) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((198453886270542249158428294688468317142477 : Rat) / 5652453567949706881173266882337971326500) [(1, 2), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0262_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0262
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0263 : Poly :=
[
  term ((-168816460113935642436 : Rat) / 619894037808199760165) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 263 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0263 : Poly :=
[
  term ((337632920227871284872 : Rat) / 619894037808199760165) [(0, 1), (9, 2), (10, 2), (16, 1)],
  term ((-168816460113935642436 : Rat) / 619894037808199760165) [(0, 2), (9, 2), (10, 1), (16, 1)],
  term ((337632920227871284872 : Rat) / 619894037808199760165) [(1, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-168816460113935642436 : Rat) / 619894037808199760165) [(1, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0263_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0263
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0264 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 264 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0264 : Poly :=
[
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (9, 2), (11, 1), (13, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (9, 2), (11, 2), (13, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0264_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0264
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0265 : Poly :=
[
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 265 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0265 : Poly :=
[
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(1, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0265_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0265
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0266 : Poly :=
[
  term ((-3420361448116722150096179819804782194600709 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (12, 1)]
]

/-- Partial product 266 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0266 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 13189058325215982722737622725455266428500) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 26378116650431965445475245450910532857000) [(0, 2), (9, 2), (12, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 13189058325215982722737622725455266428500) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 26378116650431965445475245450910532857000) [(1, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0266_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0266
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0267 : Poly :=
[
  term ((4364338659466318899318 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 267 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0267 : Poly :=
[
  term ((-8728677318932637798636 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((4364338659466318899318 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (12, 1), (16, 1)],
  term ((-8728677318932637798636 : Rat) / 4339258264657398321155) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((4364338659466318899318 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0267_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0267
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0268 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 268 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0268 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(0, 2), (9, 2), (13, 1), (15, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(1, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0268_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0268
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0269 : Poly :=
[
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0269 : Poly :=
[
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0269_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0269
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0270 : Poly :=
[
  term ((-136494101428917497583523 : Rat) / 20615904571678414880916) [(9, 2), (16, 1)]
]

/-- Partial product 270 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0270 : Poly :=
[
  term ((136494101428917497583523 : Rat) / 10307952285839207440458) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((-136494101428917497583523 : Rat) / 20615904571678414880916) [(0, 2), (9, 2), (16, 1)],
  term ((136494101428917497583523 : Rat) / 10307952285839207440458) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-136494101428917497583523 : Rat) / 20615904571678414880916) [(1, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0270_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0270
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0271 : Poly :=
[
  term ((-49063310024015131207987004607837593159922959695710782399689243298345017007 : Rat) / 251610814512208823992130399797573618598116460988689585667610375681248000) [(10, 1)]
]

/-- Partial product 271 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0271 : Poly :=
[
  term ((49063310024015131207987004607837593159922959695710782399689243298345017007 : Rat) / 125805407256104411996065199898786809299058230494344792833805187840624000) [(0, 1), (10, 2)],
  term ((-49063310024015131207987004607837593159922959695710782399689243298345017007 : Rat) / 251610814512208823992130399797573618598116460988689585667610375681248000) [(0, 2), (10, 1)],
  term ((49063310024015131207987004607837593159922959695710782399689243298345017007 : Rat) / 125805407256104411996065199898786809299058230494344792833805187840624000) [(1, 1), (10, 1), (11, 1)],
  term ((-49063310024015131207987004607837593159922959695710782399689243298345017007 : Rat) / 251610814512208823992130399797573618598116460988689585667610375681248000) [(1, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0271_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0271
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0272 : Poly :=
[
  term ((38944300709246640441902933143706572278768588190583217387805025516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 272 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0272 : Poly :=
[
  term ((-77888601418493280883805866287413144557537176381166434775610051032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((38944300709246640441902933143706572278768588190583217387805025516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-77888601418493280883805866287413144557537176381166434775610051032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((38944300709246640441902933143706572278768588190583217387805025516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0272_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0272
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0273 : Poly :=
[
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 273 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0273 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0273_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0273
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0274 : Poly :=
[
  term ((-330631152744111155050206544246380603438633246989361108048765657 : Rat) / 2286627091492916386191875734428234343793433152837745147362725) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 274 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0274 : Poly :=
[
  term ((661262305488222310100413088492761206877266493978722216097531314 : Rat) / 2286627091492916386191875734428234343793433152837745147362725) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-330631152744111155050206544246380603438633246989361108048765657 : Rat) / 2286627091492916386191875734428234343793433152837745147362725) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((661262305488222310100413088492761206877266493978722216097531314 : Rat) / 2286627091492916386191875734428234343793433152837745147362725) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-330631152744111155050206544246380603438633246989361108048765657 : Rat) / 2286627091492916386191875734428234343793433152837745147362725) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0274_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0274
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0275 : Poly :=
[
  term ((25003324773949291976 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0275 : Poly :=
[
  term ((-50006649547898583952 : Rat) / 123978807561639952033) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((25003324773949291976 : Rat) / 123978807561639952033) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-50006649547898583952 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((25003324773949291976 : Rat) / 123978807561639952033) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0275_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0275
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0276 : Poly :=
[
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2)]
]

/-- Partial product 276 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0276 : Poly :=
[
  term ((151167212666979048858273887027774459432787459931880 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 2), (11, 2)],
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (10, 1), (11, 2)],
  term ((151167212666979048858273887027774459432787459931880 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 3)],
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0276_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0276
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0277 : Poly :=
[
  term ((35363452540423571427398301410039142419989156565189487014817212058339331823622907 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(10, 1), (12, 1)]
]

/-- Partial product 277 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0277 : Poly :=
[
  term ((-35363452540423571427398301410039142419989156565189487014817212058339331823622907 : Rat) / 8238170523217159756418585763497212352559298445437021344982929905137261665000) [(0, 1), (10, 2), (12, 1)],
  term ((35363452540423571427398301410039142419989156565189487014817212058339331823622907 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(0, 2), (10, 1), (12, 1)],
  term ((-35363452540423571427398301410039142419989156565189487014817212058339331823622907 : Rat) / 8238170523217159756418585763497212352559298445437021344982929905137261665000) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((35363452540423571427398301410039142419989156565189487014817212058339331823622907 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(1, 2), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0277_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0277
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0278 : Poly :=
[
  term ((6227631028367428399023544 : Rat) / 168738551328409796076525) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 278 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0278 : Poly :=
[
  term ((-12455262056734856798047088 : Rat) / 168738551328409796076525) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((6227631028367428399023544 : Rat) / 168738551328409796076525) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((-12455262056734856798047088 : Rat) / 168738551328409796076525) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((6227631028367428399023544 : Rat) / 168738551328409796076525) [(1, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0278_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0278
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0279 : Poly :=
[
  term ((93640520838002012110696306539336903372221811572352857509032532343570345551 : Rat) / 5084440881650503081290479728530075107208827102154658030007602989892112232) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 279 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0279 : Poly :=
[
  term ((-93640520838002012110696306539336903372221811572352857509032532343570345551 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((93640520838002012110696306539336903372221811572352857509032532343570345551 : Rat) / 5084440881650503081290479728530075107208827102154658030007602989892112232) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-93640520838002012110696306539336903372221811572352857509032532343570345551 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((93640520838002012110696306539336903372221811572352857509032532343570345551 : Rat) / 5084440881650503081290479728530075107208827102154658030007602989892112232) [(1, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0279_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0279
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0280 : Poly :=
[
  term ((-784871331399702752434 : Rat) / 2603554958794438992693) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0280 : Poly :=
[
  term ((1569742662799405504868 : Rat) / 2603554958794438992693) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-784871331399702752434 : Rat) / 2603554958794438992693) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1569742662799405504868 : Rat) / 2603554958794438992693) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-784871331399702752434 : Rat) / 2603554958794438992693) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0280_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0280
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0281 : Poly :=
[
  term ((9055161537075178203666056167282726628410810204180240587995188634 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 1), (13, 2)]
]

/-- Partial product 281 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0281 : Poly :=
[
  term ((-18110323074150356407332112334565453256821620408360481175990377268 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (10, 2), (13, 2)],
  term ((9055161537075178203666056167282726628410810204180240587995188634 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 2), (10, 1), (13, 2)],
  term ((-18110323074150356407332112334565453256821620408360481175990377268 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((9055161537075178203666056167282726628410810204180240587995188634 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0281_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0281
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0282 : Poly :=
[
  term ((5598979460486274884512 : Rat) / 13017774793972194963465) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 282 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0282 : Poly :=
[
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((5598979460486274884512 : Rat) / 13017774793972194963465) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((5598979460486274884512 : Rat) / 13017774793972194963465) [(1, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0282_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0282
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0283 : Poly :=
[
  term ((-5925829247301025538053765654293864476400397376536897281036449520307 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(10, 1), (15, 2)]
]

/-- Partial product 283 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0283 : Poly :=
[
  term ((5925829247301025538053765654293864476400397376536897281036449520307 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(0, 1), (10, 2), (15, 2)],
  term ((-5925829247301025538053765654293864476400397376536897281036449520307 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(0, 2), (10, 1), (15, 2)],
  term ((5925829247301025538053765654293864476400397376536897281036449520307 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-5925829247301025538053765654293864476400397376536897281036449520307 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(1, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0283_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0283
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0284 : Poly :=
[
  term ((142288781750874 : Rat) / 7342292683791569) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 284 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0284 : Poly :=
[
  term ((-284577563501748 : Rat) / 7342292683791569) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((142288781750874 : Rat) / 7342292683791569) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-284577563501748 : Rat) / 7342292683791569) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((142288781750874 : Rat) / 7342292683791569) [(1, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0284_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0284
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0285 : Poly :=
[
  term ((-133980689502717577166 : Rat) / 32049107564750198685) [(10, 1), (16, 1)]
]

/-- Partial product 285 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0285 : Poly :=
[
  term ((267961379005435154332 : Rat) / 32049107564750198685) [(0, 1), (10, 2), (16, 1)],
  term ((-133980689502717577166 : Rat) / 32049107564750198685) [(0, 2), (10, 1), (16, 1)],
  term ((267961379005435154332 : Rat) / 32049107564750198685) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-133980689502717577166 : Rat) / 32049107564750198685) [(1, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0285_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0285
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0286 : Poly :=
[
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(10, 2)]
]

/-- Partial product 286 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0286 : Poly :=
[
  term ((-117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(0, 1), (10, 3)],
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(0, 2), (10, 2)],
  term ((-117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(1, 1), (10, 2), (11, 1)],
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(1, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0286_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0286
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0287 : Poly :=
[
  term ((386907211679381238010496 : Rat) / 24105507332629970868075) [(10, 2), (16, 1)]
]

/-- Partial product 287 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0287 : Poly :=
[
  term ((-773814423358762476020992 : Rat) / 24105507332629970868075) [(0, 1), (10, 3), (16, 1)],
  term ((386907211679381238010496 : Rat) / 24105507332629970868075) [(0, 2), (10, 2), (16, 1)],
  term ((-773814423358762476020992 : Rat) / 24105507332629970868075) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((386907211679381238010496 : Rat) / 24105507332629970868075) [(1, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0287_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0287
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0288 : Poly :=
[
  term ((9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 288 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0288 : Poly :=
[
  term ((-19478142324788205986515383737876018943150478260162469863225734072 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-19478142324788205986515383737876018943150478260162469863225734072 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(1, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0288_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0288
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0289 : Poly :=
[
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 289 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0289 : Poly :=
[
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0289_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0289
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0290 : Poly :=
[
  term ((37135646527812809738684465768640113283394024624112640119212080626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 290 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0290 : Poly :=
[
  term ((-74271293055625619477368931537280226566788049248225280238424161252 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((37135646527812809738684465768640113283394024624112640119212080626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-74271293055625619477368931537280226566788049248225280238424161252 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((37135646527812809738684465768640113283394024624112640119212080626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0290_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0290
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0291 : Poly :=
[
  term ((1099578600686489404216 : Rat) / 619894037808199760165) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0291 : Poly :=
[
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1099578600686489404216 : Rat) / 619894037808199760165) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1099578600686489404216 : Rat) / 619894037808199760165) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0291_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0291
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0292 : Poly :=
[
  term ((653669658600498814210903008247168163886045128108662734494289008827308153423137685691 : Rat) / 243435879418436266512230104664901750715039129238052621488909332964329797885333750) [(11, 1), (13, 1)]
]

/-- Partial product 292 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0292 : Poly :=
[
  term ((-653669658600498814210903008247168163886045128108662734494289008827308153423137685691 : Rat) / 121717939709218133256115052332450875357519564619026310744454666482164898942666875) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((653669658600498814210903008247168163886045128108662734494289008827308153423137685691 : Rat) / 243435879418436266512230104664901750715039129238052621488909332964329797885333750) [(0, 2), (11, 1), (13, 1)],
  term ((-653669658600498814210903008247168163886045128108662734494289008827308153423137685691 : Rat) / 121717939709218133256115052332450875357519564619026310744454666482164898942666875) [(1, 1), (11, 2), (13, 1)],
  term ((653669658600498814210903008247168163886045128108662734494289008827308153423137685691 : Rat) / 243435879418436266512230104664901750715039129238052621488909332964329797885333750) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0292_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0292
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0293 : Poly :=
[
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 293 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0293 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(1, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0293_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0293
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0294 : Poly :=
[
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 294 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0294 : Poly :=
[
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0294_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0294
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0295 : Poly :=
[
  term ((18701201950569916494055790354 : Rat) / 407035265887075703805085275) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 295 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0295 : Poly :=
[
  term ((-37402403901139832988111580708 : Rat) / 407035265887075703805085275) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((18701201950569916494055790354 : Rat) / 407035265887075703805085275) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-37402403901139832988111580708 : Rat) / 407035265887075703805085275) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((18701201950569916494055790354 : Rat) / 407035265887075703805085275) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0295_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0295
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0296 : Poly :=
[
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 296 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0296 : Poly :=
[
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(1, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0296_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0296
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0297 : Poly :=
[
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0297 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0297_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0297
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0298 : Poly :=
[
  term ((92633504764850338997875210076581227798869768744168367097651929429387720214648339 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(11, 1), (15, 1)]
]

/-- Partial product 298 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0298 : Poly :=
[
  term ((-92633504764850338997875210076581227798869768744168367097651929429387720214648339 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((92633504764850338997875210076581227798869768744168367097651929429387720214648339 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(0, 2), (11, 1), (15, 1)],
  term ((-92633504764850338997875210076581227798869768744168367097651929429387720214648339 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(1, 1), (11, 2), (15, 1)],
  term ((92633504764850338997875210076581227798869768744168367097651929429387720214648339 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0298_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0298
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NYNYN_coefficient_22_0299 : Poly :=
[
  term ((1228434180238840051043501 : Rat) / 541167495006558390624045) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 22. -/
def rs_R009_ueqv_R009NYNYN_partial_22_0299 : Poly :=
[
  term ((-2456868360477680102087002 : Rat) / 541167495006558390624045) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1228434180238840051043501 : Rat) / 541167495006558390624045) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2456868360477680102087002 : Rat) / 541167495006558390624045) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((1228434180238840051043501 : Rat) / 541167495006558390624045) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 22. -/
theorem rs_R009_ueqv_R009NYNYN_partial_22_0299_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_22_0299
        rs_R009_ueqv_R009NYNYN_generator_22_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_22_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_22_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_22_0200,
  rs_R009_ueqv_R009NYNYN_partial_22_0201,
  rs_R009_ueqv_R009NYNYN_partial_22_0202,
  rs_R009_ueqv_R009NYNYN_partial_22_0203,
  rs_R009_ueqv_R009NYNYN_partial_22_0204,
  rs_R009_ueqv_R009NYNYN_partial_22_0205,
  rs_R009_ueqv_R009NYNYN_partial_22_0206,
  rs_R009_ueqv_R009NYNYN_partial_22_0207,
  rs_R009_ueqv_R009NYNYN_partial_22_0208,
  rs_R009_ueqv_R009NYNYN_partial_22_0209,
  rs_R009_ueqv_R009NYNYN_partial_22_0210,
  rs_R009_ueqv_R009NYNYN_partial_22_0211,
  rs_R009_ueqv_R009NYNYN_partial_22_0212,
  rs_R009_ueqv_R009NYNYN_partial_22_0213,
  rs_R009_ueqv_R009NYNYN_partial_22_0214,
  rs_R009_ueqv_R009NYNYN_partial_22_0215,
  rs_R009_ueqv_R009NYNYN_partial_22_0216,
  rs_R009_ueqv_R009NYNYN_partial_22_0217,
  rs_R009_ueqv_R009NYNYN_partial_22_0218,
  rs_R009_ueqv_R009NYNYN_partial_22_0219,
  rs_R009_ueqv_R009NYNYN_partial_22_0220,
  rs_R009_ueqv_R009NYNYN_partial_22_0221,
  rs_R009_ueqv_R009NYNYN_partial_22_0222,
  rs_R009_ueqv_R009NYNYN_partial_22_0223,
  rs_R009_ueqv_R009NYNYN_partial_22_0224,
  rs_R009_ueqv_R009NYNYN_partial_22_0225,
  rs_R009_ueqv_R009NYNYN_partial_22_0226,
  rs_R009_ueqv_R009NYNYN_partial_22_0227,
  rs_R009_ueqv_R009NYNYN_partial_22_0228,
  rs_R009_ueqv_R009NYNYN_partial_22_0229,
  rs_R009_ueqv_R009NYNYN_partial_22_0230,
  rs_R009_ueqv_R009NYNYN_partial_22_0231,
  rs_R009_ueqv_R009NYNYN_partial_22_0232,
  rs_R009_ueqv_R009NYNYN_partial_22_0233,
  rs_R009_ueqv_R009NYNYN_partial_22_0234,
  rs_R009_ueqv_R009NYNYN_partial_22_0235,
  rs_R009_ueqv_R009NYNYN_partial_22_0236,
  rs_R009_ueqv_R009NYNYN_partial_22_0237,
  rs_R009_ueqv_R009NYNYN_partial_22_0238,
  rs_R009_ueqv_R009NYNYN_partial_22_0239,
  rs_R009_ueqv_R009NYNYN_partial_22_0240,
  rs_R009_ueqv_R009NYNYN_partial_22_0241,
  rs_R009_ueqv_R009NYNYN_partial_22_0242,
  rs_R009_ueqv_R009NYNYN_partial_22_0243,
  rs_R009_ueqv_R009NYNYN_partial_22_0244,
  rs_R009_ueqv_R009NYNYN_partial_22_0245,
  rs_R009_ueqv_R009NYNYN_partial_22_0246,
  rs_R009_ueqv_R009NYNYN_partial_22_0247,
  rs_R009_ueqv_R009NYNYN_partial_22_0248,
  rs_R009_ueqv_R009NYNYN_partial_22_0249,
  rs_R009_ueqv_R009NYNYN_partial_22_0250,
  rs_R009_ueqv_R009NYNYN_partial_22_0251,
  rs_R009_ueqv_R009NYNYN_partial_22_0252,
  rs_R009_ueqv_R009NYNYN_partial_22_0253,
  rs_R009_ueqv_R009NYNYN_partial_22_0254,
  rs_R009_ueqv_R009NYNYN_partial_22_0255,
  rs_R009_ueqv_R009NYNYN_partial_22_0256,
  rs_R009_ueqv_R009NYNYN_partial_22_0257,
  rs_R009_ueqv_R009NYNYN_partial_22_0258,
  rs_R009_ueqv_R009NYNYN_partial_22_0259,
  rs_R009_ueqv_R009NYNYN_partial_22_0260,
  rs_R009_ueqv_R009NYNYN_partial_22_0261,
  rs_R009_ueqv_R009NYNYN_partial_22_0262,
  rs_R009_ueqv_R009NYNYN_partial_22_0263,
  rs_R009_ueqv_R009NYNYN_partial_22_0264,
  rs_R009_ueqv_R009NYNYN_partial_22_0265,
  rs_R009_ueqv_R009NYNYN_partial_22_0266,
  rs_R009_ueqv_R009NYNYN_partial_22_0267,
  rs_R009_ueqv_R009NYNYN_partial_22_0268,
  rs_R009_ueqv_R009NYNYN_partial_22_0269,
  rs_R009_ueqv_R009NYNYN_partial_22_0270,
  rs_R009_ueqv_R009NYNYN_partial_22_0271,
  rs_R009_ueqv_R009NYNYN_partial_22_0272,
  rs_R009_ueqv_R009NYNYN_partial_22_0273,
  rs_R009_ueqv_R009NYNYN_partial_22_0274,
  rs_R009_ueqv_R009NYNYN_partial_22_0275,
  rs_R009_ueqv_R009NYNYN_partial_22_0276,
  rs_R009_ueqv_R009NYNYN_partial_22_0277,
  rs_R009_ueqv_R009NYNYN_partial_22_0278,
  rs_R009_ueqv_R009NYNYN_partial_22_0279,
  rs_R009_ueqv_R009NYNYN_partial_22_0280,
  rs_R009_ueqv_R009NYNYN_partial_22_0281,
  rs_R009_ueqv_R009NYNYN_partial_22_0282,
  rs_R009_ueqv_R009NYNYN_partial_22_0283,
  rs_R009_ueqv_R009NYNYN_partial_22_0284,
  rs_R009_ueqv_R009NYNYN_partial_22_0285,
  rs_R009_ueqv_R009NYNYN_partial_22_0286,
  rs_R009_ueqv_R009NYNYN_partial_22_0287,
  rs_R009_ueqv_R009NYNYN_partial_22_0288,
  rs_R009_ueqv_R009NYNYN_partial_22_0289,
  rs_R009_ueqv_R009NYNYN_partial_22_0290,
  rs_R009_ueqv_R009NYNYN_partial_22_0291,
  rs_R009_ueqv_R009NYNYN_partial_22_0292,
  rs_R009_ueqv_R009NYNYN_partial_22_0293,
  rs_R009_ueqv_R009NYNYN_partial_22_0294,
  rs_R009_ueqv_R009NYNYN_partial_22_0295,
  rs_R009_ueqv_R009NYNYN_partial_22_0296,
  rs_R009_ueqv_R009NYNYN_partial_22_0297,
  rs_R009_ueqv_R009NYNYN_partial_22_0298,
  rs_R009_ueqv_R009NYNYN_partial_22_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_22_0200_0299 : Poly :=
[
  term ((15476626541410951377976 : Rat) / 4339258264657398321155) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((388118694006518409498952881312513731957721005288777080572125732820436085027 : Rat) / 1765430861684202458781416572406276078891953854914811815974862149268094525) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((6083261713971657702212 : Rat) / 867851652931479664231) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42611148815452010323208843043499304811936969254387109038562016 : Rat) / 425785734277991327084004447100429843327053069838752544681335) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((-78405399405387184320 : Rat) / 123978807561639952033) [(0, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 556339467643661733049266106219079445566946397074991417198382941784092800) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((159009514516881327386792 : Rat) / 13017774793972194963465) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1764558751484567576 : Rat) / 712202390327782193) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2487614534660179361998623825844424998447165009534186795103505896392006417985963699 : Rat) / 486107904941956790435578382390258609342879911184685098185639975045709366592000) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-38292519711737689797734133 : Rat) / 420908051671767637152035) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((855094960151897618334415747768083329784736162623635510623440937646377380845520193 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((76778010074250921552893534 : Rat) / 3788172465045908734368315) [(0, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((64315967157164771168137107979194816879275342448059640351270087578440680284106941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((1228339180178549992226 : Rat) / 32049107564750198685) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((15825115299700038744565763 : Rat) / 337477102656819592153050) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 2), (9, 1), (10, 1), (13, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(0, 1), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (8, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(0, 1), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(0, 1), (8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(0, 1), (8, 2), (10, 1), (13, 2)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(0, 1), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((652753635194840391416100555660199375847410465192563713079469194137130819814031029 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 366362731255999520076045075707090734125) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((6597471604118936425296 : Rat) / 619894037808199760165) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2179610221583563253424 : Rat) / 619894037808199760165) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((3427724169817115467662064 : Rat) / 757634493009181746873663) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(0, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(0, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-10152495972950643954924997895521878016875631 : Rat) / 13189058325215982722737622725455266428500) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-33178857664534463989012 : Rat) / 4339258264657398321155) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((149238513438079446605894002441674403564844026657171537655608758987695227787581 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((23162949796953099852192 : Rat) / 4339258264657398321155) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4821492283562727526666864001846692394059109694074968533817688464392718021543167978283 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-150443152118584891364468563 : Rat) / 3788172465045908734368315) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (9, 1), (10, 1), (13, 3)],
  term ((-8943467652347931579395504359325733144992956587479970080660715671588925840372396851 : Rat) / 57166289621174118555224017769094412458722677555318967546631261065375421511219200) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((513244122064094278116851 : Rat) / 420908051671767637152035) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-97853627561271302025672373710474075788502062411150467856519151284 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-255196007645694644192 : Rat) / 88556291115457108595) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((3329853819343252765271124437215989537482320265427307517020099187473 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((29171626215989104686088 : Rat) / 13017774793972194963465) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-942221813583219438643510812607824505984396631077722567728829987955351229371 : Rat) / 10592585170105214752688499434437656473351723129488870895849172895608567150) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-417025485506287650396 : Rat) / 867851652931479664231) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((357121299974425989252098115060389731601235469513114485733858933021053036196816051 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(0, 1), (9, 2), (10, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(0, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 13189058325215982722737622725455266428500) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-8728677318932637798636 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((136494101428917497583523 : Rat) / 10307952285839207440458) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((-198453886270542249158428294688468317142477 : Rat) / 2826226783974853440586633441168985663250) [(0, 1), (9, 2), (10, 2)],
  term ((337632920227871284872 : Rat) / 619894037808199760165) [(0, 1), (9, 2), (10, 2), (16, 1)],
  term ((-19478142324788205986515383737876018943150478260162469863225734072 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-74271293055625619477368931537280226566788049248225280238424161252 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-653669658600498814210903008247168163886045128108662734494289008827308153423137685691 : Rat) / 121717939709218133256115052332450875357519564619026310744454666482164898942666875) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-37402403901139832988111580708 : Rat) / 407035265887075703805085275) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-92633504764850338997875210076581227798869768744168367097651929429387720214648339 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2456868360477680102087002 : Rat) / 541167495006558390624045) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((49063310024015131207987004607837593159922959695710782399689243298345017007 : Rat) / 125805407256104411996065199898786809299058230494344792833805187840624000) [(0, 1), (10, 2)],
  term ((-77888601418493280883805866287413144557537176381166434775610051032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((661262305488222310100413088492761206877266493978722216097531314 : Rat) / 2286627091492916386191875734428234343793433152837745147362725) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-50006649547898583952 : Rat) / 123978807561639952033) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((151167212666979048858273887027774459432787459931880 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 1), (10, 2), (11, 2)],
  term ((-35363452540423571427398301410039142419989156565189487014817212058339331823622907 : Rat) / 8238170523217159756418585763497212352559298445437021344982929905137261665000) [(0, 1), (10, 2), (12, 1)],
  term ((-12455262056734856798047088 : Rat) / 168738551328409796076525) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-93640520838002012110696306539336903372221811572352857509032532343570345551 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((1569742662799405504868 : Rat) / 2603554958794438992693) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18110323074150356407332112334565453256821620408360481175990377268 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 1), (10, 2), (13, 2)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((5925829247301025538053765654293864476400397376536897281036449520307 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(0, 1), (10, 2), (15, 2)],
  term ((-284577563501748 : Rat) / 7342292683791569) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((267961379005435154332 : Rat) / 32049107564750198685) [(0, 1), (10, 2), (16, 1)],
  term ((-117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(0, 1), (10, 3)],
  term ((-773814423358762476020992 : Rat) / 24105507332629970868075) [(0, 1), (10, 3), (16, 1)],
  term ((-7738313270705475688988 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-388118694006518409498952881312513731957721005288777080572125732820436085027 : Rat) / 3530861723368404917562833144812552157783907709829623631949724298536189050) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-3041630856985828851106 : Rat) / 867851652931479664231) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((21305574407726005161604421521749652405968484627193554519281008 : Rat) / 425785734277991327084004447100429843327053069838752544681335) [(0, 2), (8, 1), (11, 2)],
  term ((39202699702693592160 : Rat) / 123978807561639952033) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(0, 2), (8, 1), (12, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(0, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(0, 2), (8, 1), (12, 1), (13, 2)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((882279375742283788 : Rat) / 712202390327782193) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((2487614534660179361998623825844424998447165009534186795103505896392006417985963699 : Rat) / 972215809883913580871156764780517218685759822369370196371279950091418733184000) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((38292519711737689797734133 : Rat) / 841816103343535274304070) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-855094960151897618334415747768083329784736162623635510623440937646377380845520193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(0, 2), (8, 1), (13, 2)],
  term ((-38389005037125460776446767 : Rat) / 3788172465045908734368315) [(0, 2), (8, 1), (13, 2), (16, 1)],
  term ((-64315967157164771168137107979194816879275342448059640351270087578440680284106941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(0, 2), (8, 1), (15, 2)],
  term ((-614169590089274996113 : Rat) / 32049107564750198685) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-15825115299700038744565763 : Rat) / 674954205313639184306100) [(0, 2), (8, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 2), (9, 1), (13, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(0, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 2), (9, 1), (15, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(0, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 2), (11, 1), (13, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(0, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (8, 2), (11, 1), (15, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(0, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(0, 2), (8, 2), (13, 1), (15, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(0, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(0, 2), (8, 2), (13, 2)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(0, 2), (8, 2), (13, 2), (16, 1)],
  term ((48926813780635651012836186855237037894251031205575233928259575642 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((127598003822847322096 : Rat) / 88556291115457108595) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3329853819343252765271124437215989537482320265427307517020099187473 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-14585813107994552343044 : Rat) / 13017774793972194963465) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((942221813583219438643510812607824505984396631077722567728829987955351229371 : Rat) / 21185170340210429505376998868875312946703446258977741791698345791217134300) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((208512742753143825198 : Rat) / 867851652931479664231) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-652753635194840391416100555660199375847410465192563713079469194137130819814031029 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(0, 2), (9, 1), (11, 1)],
  term ((-128887686063626276402639332905286181150983 : Rat) / 366362731255999520076045075707090734125) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-3298735802059468212648 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1713862084908557733831032 : Rat) / 757634493009181746873663) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((10152495972950643954924997895521878016875631 : Rat) / 26378116650431965445475245450910532857000) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((16589428832267231994506 : Rat) / 4339258264657398321155) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-149238513438079446605894002441674403564844026657171537655608758987695227787581 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-11581474898476549926096 : Rat) / 4339258264657398321155) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4821492283562727526666864001846692394059109694074968533817688464392718021543167978283 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(0, 2), (9, 1), (13, 1)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((150443152118584891364468563 : Rat) / 7576344930091817468736630) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(0, 2), (9, 1), (13, 2), (15, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(0, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (9, 1), (13, 3)],
  term ((8943467652347931579395504359325733144992956587479970080660715671588925840372396851 : Rat) / 114332579242348237110448035538188824917445355110637935093262522130750843022438400) [(0, 2), (9, 1), (15, 1)],
  term ((-513244122064094278116851 : Rat) / 841816103343535274304070) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-357121299974425989252098115060389731601235469513114485733858933021053036196816051 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(0, 2), (9, 2)],
  term ((198453886270542249158428294688468317142477 : Rat) / 5652453567949706881173266882337971326500) [(0, 2), (9, 2), (10, 1)],
  term ((-168816460113935642436 : Rat) / 619894037808199760165) [(0, 2), (9, 2), (10, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (9, 2), (11, 1), (13, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 26378116650431965445475245450910532857000) [(0, 2), (9, 2), (12, 1)],
  term ((4364338659466318899318 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (12, 1), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(0, 2), (9, 2), (13, 1), (15, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-136494101428917497583523 : Rat) / 20615904571678414880916) [(0, 2), (9, 2), (16, 1)],
  term ((-49063310024015131207987004607837593159922959695710782399689243298345017007 : Rat) / 251610814512208823992130399797573618598116460988689585667610375681248000) [(0, 2), (10, 1)],
  term ((38944300709246640441902933143706572278768588190583217387805025516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-330631152744111155050206544246380603438633246989361108048765657 : Rat) / 2286627091492916386191875734428234343793433152837745147362725) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((25003324773949291976 : Rat) / 123978807561639952033) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (10, 1), (11, 2)],
  term ((35363452540423571427398301410039142419989156565189487014817212058339331823622907 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(0, 2), (10, 1), (12, 1)],
  term ((6227631028367428399023544 : Rat) / 168738551328409796076525) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((93640520838002012110696306539336903372221811572352857509032532343570345551 : Rat) / 5084440881650503081290479728530075107208827102154658030007602989892112232) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-784871331399702752434 : Rat) / 2603554958794438992693) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9055161537075178203666056167282726628410810204180240587995188634 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 2), (10, 1), (13, 2)],
  term ((5598979460486274884512 : Rat) / 13017774793972194963465) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5925829247301025538053765654293864476400397376536897281036449520307 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(0, 2), (10, 1), (15, 2)],
  term ((142288781750874 : Rat) / 7342292683791569) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-133980689502717577166 : Rat) / 32049107564750198685) [(0, 2), (10, 1), (16, 1)],
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(0, 2), (10, 2)],
  term ((386907211679381238010496 : Rat) / 24105507332629970868075) [(0, 2), (10, 2), (16, 1)],
  term ((9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((37135646527812809738684465768640113283394024624112640119212080626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((1099578600686489404216 : Rat) / 619894037808199760165) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((653669658600498814210903008247168163886045128108662734494289008827308153423137685691 : Rat) / 243435879418436266512230104664901750715039129238052621488909332964329797885333750) [(0, 2), (11, 1), (13, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18701201950569916494055790354 : Rat) / 407035265887075703805085275) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((92633504764850338997875210076581227798869768744168367097651929429387720214648339 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(0, 2), (11, 1), (15, 1)],
  term ((1228434180238840051043501 : Rat) / 541167495006558390624045) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 556339467643661733049266106219079445566946397074991417198382941784092800) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((159009514516881327386792 : Rat) / 13017774793972194963465) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1764558751484567576 : Rat) / 712202390327782193) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2487614534660179361998623825844424998447165009534186795103505896392006417985963699 : Rat) / 486107904941956790435578382390258609342879911184685098185639975045709366592000) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38292519711737689797734133 : Rat) / 420908051671767637152035) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((855094960151897618334415747768083329784736162623635510623440937646377380845520193 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((76778010074250921552893534 : Rat) / 3788172465045908734368315) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((64315967157164771168137107979194816879275342448059640351270087578440680284106941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((1228339180178549992226 : Rat) / 32049107564750198685) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((15825115299700038744565763 : Rat) / 337477102656819592153050) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((15476626541410951377976 : Rat) / 4339258264657398321155) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((388118694006518409498952881312513731957721005288777080572125732820436085027 : Rat) / 1765430861684202458781416572406276078891953854914811815974862149268094525) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((6083261713971657702212 : Rat) / 867851652931479664231) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-42611148815452010323208843043499304811936969254387109038562016 : Rat) / 425785734277991327084004447100429843327053069838752544681335) [(1, 1), (8, 1), (11, 3)],
  term ((-78405399405387184320 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(1, 1), (8, 2), (11, 1), (13, 2)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(1, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 2), (11, 2), (13, 1)],
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(1, 1), (8, 2), (11, 2), (13, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (8, 2), (11, 2), (15, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(1, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((3329853819343252765271124437215989537482320265427307517020099187473 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((29171626215989104686088 : Rat) / 13017774793972194963465) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-942221813583219438643510812607824505984396631077722567728829987955351229371 : Rat) / 10592585170105214752688499434437656473351723129488870895849172895608567150) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-417025485506287650396 : Rat) / 867851652931479664231) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97853627561271302025672373710474075788502062411150467856519151284 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-255196007645694644192 : Rat) / 88556291115457108595) [(1, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-10152495972950643954924997895521878016875631 : Rat) / 13189058325215982722737622725455266428500) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-33178857664534463989012 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((149238513438079446605894002441674403564844026657171537655608758987695227787581 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((23162949796953099852192 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4821492283562727526666864001846692394059109694074968533817688464392718021543167978283 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-150443152118584891364468563 : Rat) / 3788172465045908734368315) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (11, 1), (13, 3)],
  term ((-8943467652347931579395504359325733144992956587479970080660715671588925840372396851 : Rat) / 57166289621174118555224017769094412458722677555318967546631261065375421511219200) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((513244122064094278116851 : Rat) / 420908051671767637152035) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((652753635194840391416100555660199375847410465192563713079469194137130819814031029 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(1, 1), (9, 1), (11, 2)],
  term ((257775372127252552805278665810572362301966 : Rat) / 366362731255999520076045075707090734125) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((6597471604118936425296 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2179610221583563253424 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((3427724169817115467662064 : Rat) / 757634493009181746873663) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(1, 1), (9, 1), (11, 3), (13, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(1, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-198453886270542249158428294688468317142477 : Rat) / 2826226783974853440586633441168985663250) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((337632920227871284872 : Rat) / 619894037808199760165) [(1, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((357121299974425989252098115060389731601235469513114485733858933021053036196816051 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(1, 1), (9, 2), (11, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 13189058325215982722737622725455266428500) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((-8728677318932637798636 : Rat) / 4339258264657398321155) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((136494101428917497583523 : Rat) / 10307952285839207440458) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(1, 1), (9, 2), (11, 2), (13, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(1, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((49063310024015131207987004607837593159922959695710782399689243298345017007 : Rat) / 125805407256104411996065199898786809299058230494344792833805187840624000) [(1, 1), (10, 1), (11, 1)],
  term ((-35363452540423571427398301410039142419989156565189487014817212058339331823622907 : Rat) / 8238170523217159756418585763497212352559298445437021344982929905137261665000) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-12455262056734856798047088 : Rat) / 168738551328409796076525) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-93640520838002012110696306539336903372221811572352857509032532343570345551 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1569742662799405504868 : Rat) / 2603554958794438992693) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18110323074150356407332112334565453256821620408360481175990377268 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((5925829247301025538053765654293864476400397376536897281036449520307 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-284577563501748 : Rat) / 7342292683791569) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((267961379005435154332 : Rat) / 32049107564750198685) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-77888601418493280883805866287413144557537176381166434775610051032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((661262305488222310100413088492761206877266493978722216097531314 : Rat) / 2286627091492916386191875734428234343793433152837745147362725) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-50006649547898583952 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((151167212666979048858273887027774459432787459931880 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 3)],
  term ((-117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 60574783258949704091313130613950090827641900334095745183698014008362218125) [(1, 1), (10, 2), (11, 1)],
  term ((-773814423358762476020992 : Rat) / 24105507332629970868075) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-19478142324788205986515383737876018943150478260162469863225734072 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-74271293055625619477368931537280226566788049248225280238424161252 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-653669658600498814210903008247168163886045128108662734494289008827308153423137685691 : Rat) / 121717939709218133256115052332450875357519564619026310744454666482164898942666875) [(1, 1), (11, 2), (13, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-37402403901139832988111580708 : Rat) / 407035265887075703805085275) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-92633504764850338997875210076581227798869768744168367097651929429387720214648339 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(1, 1), (11, 2), (15, 1)],
  term ((-2456868360477680102087002 : Rat) / 541167495006558390624045) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-7738313270705475688988 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-388118694006518409498952881312513731957721005288777080572125732820436085027 : Rat) / 3530861723368404917562833144812552157783907709829623631949724298536189050) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-3041630856985828851106 : Rat) / 867851652931479664231) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((21305574407726005161604421521749652405968484627193554519281008 : Rat) / 425785734277991327084004447100429843327053069838752544681335) [(1, 2), (8, 1), (11, 2)],
  term ((39202699702693592160 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((-111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(1, 2), (8, 1), (12, 1)],
  term ((-4615533824898472129757011106895379268466198282136484809102748092233639589211 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-79504757258440663693396 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(1, 2), (8, 1), (12, 1), (13, 2)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((882279375742283788 : Rat) / 712202390327782193) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((2487614534660179361998623825844424998447165009534186795103505896392006417985963699 : Rat) / 972215809883913580871156764780517218685759822369370196371279950091418733184000) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((38292519711737689797734133 : Rat) / 841816103343535274304070) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-855094960151897618334415747768083329784736162623635510623440937646377380845520193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(1, 2), (8, 1), (13, 2)],
  term ((-38389005037125460776446767 : Rat) / 3788172465045908734368315) [(1, 2), (8, 1), (13, 2), (16, 1)],
  term ((-64315967157164771168137107979194816879275342448059640351270087578440680284106941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(1, 2), (8, 1), (15, 2)],
  term ((-614169590089274996113 : Rat) / 32049107564750198685) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-15825115299700038744565763 : Rat) / 674954205313639184306100) [(1, 2), (8, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 2), (9, 1), (13, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(1, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 2), (9, 1), (15, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(1, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 2), (11, 1), (13, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(1, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (8, 2), (11, 1), (15, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(1, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(1, 2), (8, 2), (13, 1), (15, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(1, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(1, 2), (8, 2), (13, 2)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(1, 2), (8, 2), (13, 2), (16, 1)],
  term ((48926813780635651012836186855237037894251031205575233928259575642 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((127598003822847322096 : Rat) / 88556291115457108595) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3329853819343252765271124437215989537482320265427307517020099187473 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-14585813107994552343044 : Rat) / 13017774793972194963465) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((942221813583219438643510812607824505984396631077722567728829987955351229371 : Rat) / 21185170340210429505376998868875312946703446258977741791698345791217134300) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((208512742753143825198 : Rat) / 867851652931479664231) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-652753635194840391416100555660199375847410465192563713079469194137130819814031029 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(1, 2), (9, 1), (11, 1)],
  term ((-128887686063626276402639332905286181150983 : Rat) / 366362731255999520076045075707090734125) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-3298735802059468212648 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1713862084908557733831032 : Rat) / 757634493009181746873663) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((10152495972950643954924997895521878016875631 : Rat) / 26378116650431965445475245450910532857000) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((16589428832267231994506 : Rat) / 4339258264657398321155) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-149238513438079446605894002441674403564844026657171537655608758987695227787581 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-11581474898476549926096 : Rat) / 4339258264657398321155) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4821492283562727526666864001846692394059109694074968533817688464392718021543167978283 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(1, 2), (9, 1), (13, 1)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((150443152118584891364468563 : Rat) / 7576344930091817468736630) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(1, 2), (9, 1), (13, 2), (15, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (9, 1), (13, 3)],
  term ((8943467652347931579395504359325733144992956587479970080660715671588925840372396851 : Rat) / 114332579242348237110448035538188824917445355110637935093262522130750843022438400) [(1, 2), (9, 1), (15, 1)],
  term ((-513244122064094278116851 : Rat) / 841816103343535274304070) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-357121299974425989252098115060389731601235469513114485733858933021053036196816051 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(1, 2), (9, 2)],
  term ((198453886270542249158428294688468317142477 : Rat) / 5652453567949706881173266882337971326500) [(1, 2), (9, 2), (10, 1)],
  term ((-168816460113935642436 : Rat) / 619894037808199760165) [(1, 2), (9, 2), (10, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 26378116650431965445475245450910532857000) [(1, 2), (9, 2), (12, 1)],
  term ((4364338659466318899318 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (12, 1), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(1, 2), (9, 2), (13, 1), (15, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-136494101428917497583523 : Rat) / 20615904571678414880916) [(1, 2), (9, 2), (16, 1)],
  term ((-49063310024015131207987004607837593159922959695710782399689243298345017007 : Rat) / 251610814512208823992130399797573618598116460988689585667610375681248000) [(1, 2), (10, 1)],
  term ((38944300709246640441902933143706572278768588190583217387805025516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-330631152744111155050206544246380603438633246989361108048765657 : Rat) / 2286627091492916386191875734428234343793433152837745147362725) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((25003324773949291976 : Rat) / 123978807561639952033) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (10, 1), (11, 2)],
  term ((35363452540423571427398301410039142419989156565189487014817212058339331823622907 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(1, 2), (10, 1), (12, 1)],
  term ((6227631028367428399023544 : Rat) / 168738551328409796076525) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((93640520838002012110696306539336903372221811572352857509032532343570345551 : Rat) / 5084440881650503081290479728530075107208827102154658030007602989892112232) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-784871331399702752434 : Rat) / 2603554958794438992693) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9055161537075178203666056167282726628410810204180240587995188634 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 2), (10, 1), (13, 2)],
  term ((5598979460486274884512 : Rat) / 13017774793972194963465) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5925829247301025538053765654293864476400397376536897281036449520307 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(1, 2), (10, 1), (15, 2)],
  term ((142288781750874 : Rat) / 7342292683791569) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-133980689502717577166 : Rat) / 32049107564750198685) [(1, 2), (10, 1), (16, 1)],
  term ((117739239303857536559258640713654554414959009393236268340324570404570627214781 : Rat) / 121149566517899408182626261227900181655283800668191490367396028016724436250) [(1, 2), (10, 2)],
  term ((386907211679381238010496 : Rat) / 24105507332629970868075) [(1, 2), (10, 2), (16, 1)],
  term ((9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((37135646527812809738684465768640113283394024624112640119212080626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((1099578600686489404216 : Rat) / 619894037808199760165) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((653669658600498814210903008247168163886045128108662734494289008827308153423137685691 : Rat) / 243435879418436266512230104664901750715039129238052621488909332964329797885333750) [(1, 2), (11, 1), (13, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18701201950569916494055790354 : Rat) / 407035265887075703805085275) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((92633504764850338997875210076581227798869768744168367097651929429387720214648339 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(1, 2), (11, 1), (15, 1)],
  term ((1228434180238840051043501 : Rat) / 541167495006558390624045) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NYNYN_block_22_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_22_0200_0299
      rs_R009_ueqv_R009NYNYN_block_22_0200_0299 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
