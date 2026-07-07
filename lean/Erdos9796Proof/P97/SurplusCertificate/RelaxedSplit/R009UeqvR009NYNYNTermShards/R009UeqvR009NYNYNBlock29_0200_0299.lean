/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 29:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0200 : Poly :=
[
  term ((-944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 200 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0200 : Poly :=
[
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (10, 2), (12, 1), (13, 2)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0200_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0200
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0201 : Poly :=
[
  term ((-77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 201 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0201 : Poly :=
[
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (12, 1), (13, 2), (16, 1)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0201_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0201
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0202 : Poly :=
[
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 202 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0202 : Poly :=
[
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0202_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0202
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0203 : Poly :=
[
  term ((-11423328844091868 : Rat) / 7342292683791569) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 203 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0203 : Poly :=
[
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0203_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0203
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0204 : Poly :=
[
  term ((-346089545236745817950072655710282919110334440960773181626847992986474349421770185353 : Rat) / 142915724052935296388060044422736031146806693888297418866578152663438553778048000) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 204 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0204 : Poly :=
[
  term ((-346089545236745817950072655710282919110334440960773181626847992986474349421770185353 : Rat) / 71457862026467648194030022211368015573403346944148709433289076331719276889024000) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((346089545236745817950072655710282919110334440960773181626847992986474349421770185353 : Rat) / 142915724052935296388060044422736031146806693888297418866578152663438553778048000) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-346089545236745817950072655710282919110334440960773181626847992986474349421770185353 : Rat) / 71457862026467648194030022211368015573403346944148709433289076331719276889024000) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((346089545236745817950072655710282919110334440960773181626847992986474349421770185353 : Rat) / 142915724052935296388060044422736031146806693888297418866578152663438553778048000) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0204_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0204
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0205 : Poly :=
[
  term ((-36393318235869019643278947 : Rat) / 841816103343535274304070) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0205 : Poly :=
[
  term ((-36393318235869019643278947 : Rat) / 420908051671767637152035) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36393318235869019643278947 : Rat) / 841816103343535274304070) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36393318235869019643278947 : Rat) / 420908051671767637152035) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((36393318235869019643278947 : Rat) / 841816103343535274304070) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0205_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0205
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0206 : Poly :=
[
  term ((850248110009110791365298811841977642898399709297790128343495408364237850247632193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (13, 2)]
]

/-- Partial product 206 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0206 : Poly :=
[
  term ((850248110009110791365298811841977642898399709297790128343495408364237850247632193 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-850248110009110791365298811841977642898399709297790128343495408364237850247632193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (10, 2), (13, 2)],
  term ((850248110009110791365298811841977642898399709297790128343495408364237850247632193 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-850248110009110791365298811841977642898399709297790128343495408364237850247632193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0206_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0206
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0207 : Poly :=
[
  term ((38389005037125460776446767 : Rat) / 3788172465045908734368315) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 207 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0207 : Poly :=
[
  term ((76778010074250921552893534 : Rat) / 3788172465045908734368315) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-38389005037125460776446767 : Rat) / 3788172465045908734368315) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((76778010074250921552893534 : Rat) / 3788172465045908734368315) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-38389005037125460776446767 : Rat) / 3788172465045908734368315) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0207_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0207
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0208 : Poly :=
[
  term ((65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (15, 2)]
]

/-- Partial product 208 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0208 : Poly :=
[
  term ((65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (10, 2), (15, 2)],
  term ((65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (11, 1), (15, 3)],
  term ((-65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0208_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0208
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0209 : Poly :=
[
  term ((84928286750455957414 : Rat) / 4578443937821456955) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0209 : Poly :=
[
  term ((169856573500911914828 : Rat) / 4578443937821456955) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-84928286750455957414 : Rat) / 4578443937821456955) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((169856573500911914828 : Rat) / 4578443937821456955) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-84928286750455957414 : Rat) / 4578443937821456955) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0209_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0209
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0210 : Poly :=
[
  term ((5552787510256342437 : Rat) / 7122023903277821930) [(8, 1), (16, 1)]
]

/-- Partial product 210 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0210 : Poly :=
[
  term ((5552787510256342437 : Rat) / 3561011951638910965) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5552787510256342437 : Rat) / 7122023903277821930) [(8, 1), (10, 2), (16, 1)],
  term ((5552787510256342437 : Rat) / 3561011951638910965) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5552787510256342437 : Rat) / 7122023903277821930) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0210_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0210
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0211 : Poly :=
[
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (13, 1)]
]

/-- Partial product 211 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0211 : Poly :=
[
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 2), (13, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0211_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0211
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0212 : Poly :=
[
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 212 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0212 : Poly :=
[
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0212_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0212
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0213 : Poly :=
[
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (15, 1)]
]

/-- Partial product 213 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0213 : Poly :=
[
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 2), (15, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0213_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0213
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0214 : Poly :=
[
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0214 : Poly :=
[
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0214_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0214
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0215 : Poly :=
[
  term ((-551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 215 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0215 : Poly :=
[
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0215_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0215
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0216 : Poly :=
[
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 216 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0216 : Poly :=
[
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0216_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0216
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0217 : Poly :=
[
  term ((275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 217 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0217 : Poly :=
[
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (15, 2)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0217_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0217
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0218 : Poly :=
[
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0218 : Poly :=
[
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0218_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0218
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0219 : Poly :=
[
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 219 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0219 : Poly :=
[
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0219_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0219
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0220 : Poly :=
[
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0220 : Poly :=
[
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0220_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0220
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0221 : Poly :=
[
  term ((194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (13, 2)]
]

/-- Partial product 221 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0221 : Poly :=
[
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (13, 2), (14, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 2), (13, 2)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0221_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0221
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0222 : Poly :=
[
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (13, 2), (16, 1)]
]

/-- Partial product 222 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0222 : Poly :=
[
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (10, 2), (13, 2), (16, 1)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0222_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0222
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0223 : Poly :=
[
  term ((-1608070950057716952497340582731796400112049205542836760423369574 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 223 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0223 : Poly :=
[
  term ((-3216141900115433904994681165463592800224098411085673520846739148 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1608070950057716952497340582731796400112049205542836760423369574 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (10, 1), (11, 3)],
  term ((-3216141900115433904994681165463592800224098411085673520846739148 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((1608070950057716952497340582731796400112049205542836760423369574 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0223_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0223
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0224 : Poly :=
[
  term ((-304931308816780412752 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 224 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0224 : Poly :=
[
  term ((-609862617633560825504 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((304931308816780412752 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 3), (16, 1)],
  term ((-609862617633560825504 : Rat) / 123978807561639952033) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((304931308816780412752 : Rat) / 123978807561639952033) [(9, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0224_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0224
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0225 : Poly :=
[
  term ((5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 225 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0225 : Poly :=
[
  term ((5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0225_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0225
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0226 : Poly :=
[
  term ((25783772028967102112068 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 226 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0226 : Poly :=
[
  term ((51567544057934204224136 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25783772028967102112068 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((51567544057934204224136 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-25783772028967102112068 : Rat) / 13017774793972194963465) [(9, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0226_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0226
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0227 : Poly :=
[
  term ((-979611705980426124475024882262319582057013465425477885055443957314524873981 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 227 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0227 : Poly :=
[
  term ((-979611705980426124475024882262319582057013465425477885055443957314524873981 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((979611705980426124475024882262319582057013465425477885055443957314524873981 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-979611705980426124475024882262319582057013465425477885055443957314524873981 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((979611705980426124475024882262319582057013465425477885055443957314524873981 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0227_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0227
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0228 : Poly :=
[
  term ((-2857903639507702835214 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0228 : Poly :=
[
  term ((-5715807279015405670428 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((2857903639507702835214 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5715807279015405670428 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((2857903639507702835214 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0228_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0228
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0229 : Poly :=
[
  term ((730325961405203838154073014923432864391983875371815454264372774965393613041844573 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (11, 1)]
]

/-- Partial product 229 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0229 : Poly :=
[
  term ((730325961405203838154073014923432864391983875371815454264372774965393613041844573 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-730325961405203838154073014923432864391983875371815454264372774965393613041844573 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 2), (11, 1)],
  term ((730325961405203838154073014923432864391983875371815454264372774965393613041844573 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (11, 2), (15, 1)],
  term ((-730325961405203838154073014923432864391983875371815454264372774965393613041844573 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0229_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0229
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0230 : Poly :=
[
  term ((128887686063626276402639332905286181150983 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 230 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0230 : Poly :=
[
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-128887686063626276402639332905286181150983 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-128887686063626276402639332905286181150983 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0230_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0230
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0231 : Poly :=
[
  term ((1099578600686489404216 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 231 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0231 : Poly :=
[
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1099578600686489404216 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1099578600686489404216 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0231_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0231
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0232 : Poly :=
[
  term ((-2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 232 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0232 : Poly :=
[
  term ((-4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0232_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0232
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0233 : Poly :=
[
  term ((-1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0233 : Poly :=
[
  term ((-2179610221583563253424 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2179610221583563253424 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0233_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0233
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0234 : Poly :=
[
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 234 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0234 : Poly :=
[
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0234_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0234
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0235 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 235 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0235 : Poly :=
[
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0235_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0235
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0236 : Poly :=
[
  term ((11710895761984897338357652 : Rat) / 3788172465045908734368315) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 236 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0236 : Poly :=
[
  term ((23421791523969794676715304 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11710895761984897338357652 : Rat) / 3788172465045908734368315) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((23421791523969794676715304 : Rat) / 3788172465045908734368315) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11710895761984897338357652 : Rat) / 3788172465045908734368315) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0236_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0236
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0237 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 237 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0237 : Poly :=
[
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 2), (13, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0237_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0237
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0238 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0238 : Poly :=
[
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0238_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0238
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0239 : Poly :=
[
  term ((-44138933711318820465159712965784762829029729 : Rat) / 237403049853887689009277209058194795713000) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 239 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0239 : Poly :=
[
  term ((-44138933711318820465159712965784762829029729 : Rat) / 118701524926943844504638604529097397856500) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((44138933711318820465159712965784762829029729 : Rat) / 237403049853887689009277209058194795713000) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-44138933711318820465159712965784762829029729 : Rat) / 118701524926943844504638604529097397856500) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((44138933711318820465159712965784762829029729 : Rat) / 237403049853887689009277209058194795713000) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0239_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0239
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0240 : Poly :=
[
  term ((-10770310619645473462082 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 240 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0240 : Poly :=
[
  term ((-21540621239290946924164 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10770310619645473462082 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-21540621239290946924164 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10770310619645473462082 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0240_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0240
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0241 : Poly :=
[
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 241 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0241 : Poly :=
[
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0241_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0241
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0242 : Poly :=
[
  term ((5711664422045934 : Rat) / 7342292683791569) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0242 : Poly :=
[
  term ((11423328844091868 : Rat) / 7342292683791569) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5711664422045934 : Rat) / 7342292683791569) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5711664422045934 : Rat) / 7342292683791569) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0242_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0242
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0243 : Poly :=
[
  term ((-9169289285516527564665384907928353048318141618073812528514495747914231338850702181843 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (13, 1)]
]

/-- Partial product 243 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0243 : Poly :=
[
  term ((-9169289285516527564665384907928353048318141618073812528514495747914231338850702181843 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((9169289285516527564665384907928353048318141618073812528514495747914231338850702181843 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (10, 2), (13, 1)],
  term ((-9169289285516527564665384907928353048318141618073812528514495747914231338850702181843 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((9169289285516527564665384907928353048318141618073812528514495747914231338850702181843 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0243_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0243
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0244 : Poly :=
[
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 244 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0244 : Poly :=
[
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0244_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0244
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0245 : Poly :=
[
  term ((-486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 245 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0245 : Poly :=
[
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0245_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0245
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0246 : Poly :=
[
  term ((-93914580280670881386071911 : Rat) / 3788172465045908734368315) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 246 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0246 : Poly :=
[
  term ((-187829160561341762772143822 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((93914580280670881386071911 : Rat) / 3788172465045908734368315) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-187829160561341762772143822 : Rat) / 3788172465045908734368315) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((93914580280670881386071911 : Rat) / 3788172465045908734368315) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0246_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0246
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0247 : Poly :=
[
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 247 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0247 : Poly :=
[
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0247_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0247
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0248 : Poly :=
[
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0248 : Poly :=
[
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0248_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0248
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0249 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (13, 3)]
]

/-- Partial product 249 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0249 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 1), (13, 3), (14, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 2), (13, 3)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0249_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0249
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0250 : Poly :=
[
  term ((18459502108338489612997587060402541631665529994392471480476895778243476502474070443697 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (15, 1)]
]

/-- Partial product 250 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0250 : Poly :=
[
  term ((18459502108338489612997587060402541631665529994392471480476895778243476502474070443697 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-18459502108338489612997587060402541631665529994392471480476895778243476502474070443697 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (10, 2), (15, 1)],
  term ((18459502108338489612997587060402541631665529994392471480476895778243476502474070443697 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (11, 1), (15, 2)],
  term ((-18459502108338489612997587060402541631665529994392471480476895778243476502474070443697 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0250_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0250
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0251 : Poly :=
[
  term ((4809413369617031531451085 : Rat) / 216466998002623356249618) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0251 : Poly :=
[
  term ((4809413369617031531451085 : Rat) / 108233499001311678124809) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4809413369617031531451085 : Rat) / 216466998002623356249618) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4809413369617031531451085 : Rat) / 108233499001311678124809) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4809413369617031531451085 : Rat) / 216466998002623356249618) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0251_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0251
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0252 : Poly :=
[
  term ((11023502125980491698504450270650545476140450597276029791396813094147118780083783 : Rat) / 102039468728296303217622731103603576289501288739793481843600860004041700656000) [(9, 2)]
]

/-- Partial product 252 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0252 : Poly :=
[
  term ((11023502125980491698504450270650545476140450597276029791396813094147118780083783 : Rat) / 51019734364148151608811365551801788144750644369896740921800430002020850328000) [(9, 2), (10, 1), (14, 1)],
  term ((-11023502125980491698504450270650545476140450597276029791396813094147118780083783 : Rat) / 102039468728296303217622731103603576289501288739793481843600860004041700656000) [(9, 2), (10, 2)],
  term ((11023502125980491698504450270650545476140450597276029791396813094147118780083783 : Rat) / 51019734364148151608811365551801788144750644369896740921800430002020850328000) [(9, 2), (11, 1), (15, 1)],
  term ((-11023502125980491698504450270650545476140450597276029791396813094147118780083783 : Rat) / 102039468728296303217622731103603576289501288739793481843600860004041700656000) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0252_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0252
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0253 : Poly :=
[
  term ((-474261363557611823034997116127464466222799 : Rat) / 7913434995129589633642573635273159857100) [(9, 2), (10, 1)]
]

/-- Partial product 253 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0253 : Poly :=
[
  term ((-474261363557611823034997116127464466222799 : Rat) / 3956717497564794816821286817636579928550) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((474261363557611823034997116127464466222799 : Rat) / 7913434995129589633642573635273159857100) [(9, 2), (10, 1), (11, 2)],
  term ((-474261363557611823034997116127464466222799 : Rat) / 3956717497564794816821286817636579928550) [(9, 2), (10, 2), (14, 1)],
  term ((474261363557611823034997116127464466222799 : Rat) / 7913434995129589633642573635273159857100) [(9, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0253_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0253
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0254 : Poly :=
[
  term ((403434400148043748332 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 254 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0254 : Poly :=
[
  term ((806868800296087496664 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-403434400148043748332 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (11, 2), (16, 1)],
  term ((806868800296087496664 : Rat) / 867851652931479664231) [(9, 2), (10, 2), (14, 1), (16, 1)],
  term ((-403434400148043748332 : Rat) / 867851652931479664231) [(9, 2), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0254_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0254
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0255 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 255 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0255 : Poly :=
[
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0255_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0255
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0256 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 256 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0256 : Poly :=
[
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0256_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0256
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0257 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (12, 1)]
]

/-- Partial product 257 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0257 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (10, 2), (12, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0257_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0257
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0258 : Poly :=
[
  term ((-1454779553155439633106 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 258 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0258 : Poly :=
[
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1454779553155439633106 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (12, 1), (16, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1454779553155439633106 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0258_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0258
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0259 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 259 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0259 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0259_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0259
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0260 : Poly :=
[
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0260 : Poly :=
[
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0260_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0260
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0261 : Poly :=
[
  term ((34179786165962568186130163 : Rat) / 15152689860183634937473260) [(9, 2), (16, 1)]
]

/-- Partial product 261 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0261 : Poly :=
[
  term ((34179786165962568186130163 : Rat) / 7576344930091817468736630) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-34179786165962568186130163 : Rat) / 15152689860183634937473260) [(9, 2), (10, 2), (16, 1)],
  term ((34179786165962568186130163 : Rat) / 7576344930091817468736630) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-34179786165962568186130163 : Rat) / 15152689860183634937473260) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0261_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0261
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0262 : Poly :=
[
  term ((4705429113104448420879508187776985292915764094590412786947942522296240473191 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(10, 1)]
]

/-- Partial product 262 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0262 : Poly :=
[
  term ((4705429113104448420879508187776985292915764094590412786947942522296240473191 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(10, 1), (11, 1), (15, 1)],
  term ((-4705429113104448420879508187776985292915764094590412786947942522296240473191 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(10, 1), (11, 2)],
  term ((4705429113104448420879508187776985292915764094590412786947942522296240473191 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(10, 2), (14, 1)],
  term ((-4705429113104448420879508187776985292915764094590412786947942522296240473191 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0262_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0262
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0263 : Poly :=
[
  term ((-2958103430454298187995135797026960509787797124603199074824406516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 263 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0263 : Poly :=
[
  term ((-5916206860908596375990271594053921019575594249206398149648813032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((2958103430454298187995135797026960509787797124603199074824406516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 3), (13, 1)],
  term ((-5916206860908596375990271594053921019575594249206398149648813032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((2958103430454298187995135797026960509787797124603199074824406516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0263_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0263
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0264 : Poly :=
[
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 264 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0264 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (13, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0264_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0264
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0265 : Poly :=
[
  term ((115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 265 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0265 : Poly :=
[
  term ((230077174676892411380632536971819459065214 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (15, 2)],
  term ((-115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 3), (15, 1)],
  term ((230077174676892411380632536971819459065214 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0265_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0265
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0266 : Poly :=
[
  term ((386732133305706905464 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0266 : Poly :=
[
  term ((773464266611413810928 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-386732133305706905464 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((773464266611413810928 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-386732133305706905464 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0266_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0266
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0267 : Poly :=
[
  term ((-919443620962221439291415102885738400226710641325447622018347815943582790903 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 267 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0267 : Poly :=
[
  term ((-919443620962221439291415102885738400226710641325447622018347815943582790903 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((919443620962221439291415102885738400226710641325447622018347815943582790903 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-919443620962221439291415102885738400226710641325447622018347815943582790903 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((919443620962221439291415102885738400226710641325447622018347815943582790903 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0267_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0267
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0268 : Poly :=
[
  term ((-5150558803812264595742 : Rat) / 13017774793972194963465) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0268 : Poly :=
[
  term ((-10301117607624529191484 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5150558803812264595742 : Rat) / 13017774793972194963465) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10301117607624529191484 : Rat) / 13017774793972194963465) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5150558803812264595742 : Rat) / 13017774793972194963465) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0268_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0268
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0269 : Poly :=
[
  term ((-9991277131721837320402766956487672792401548490046525258469831194 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 1), (13, 2)]
]

/-- Partial product 269 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0269 : Poly :=
[
  term ((-19982554263443674640805533912975345584803096980093050516939662388 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((9991277131721837320402766956487672792401548490046525258469831194 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 1), (11, 2), (13, 2)],
  term ((-19982554263443674640805533912975345584803096980093050516939662388 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 2), (13, 2), (14, 1)],
  term ((9991277131721837320402766956487672792401548490046525258469831194 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0269_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0269
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0270 : Poly :=
[
  term ((-5598979460486274884512 : Rat) / 13017774793972194963465) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 270 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0270 : Poly :=
[
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5598979460486274884512 : Rat) / 13017774793972194963465) [(10, 1), (11, 2), (13, 2), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((5598979460486274884512 : Rat) / 13017774793972194963465) [(10, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0270_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0270
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0271 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 5484278475154045076223067096260145595311500267885399400236024528) [(10, 1), (15, 2)]
]

/-- Partial product 271 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0271 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(10, 1), (11, 1), (15, 3)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 5484278475154045076223067096260145595311500267885399400236024528) [(10, 1), (11, 2), (15, 2)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(10, 2), (14, 1), (15, 2)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 5484278475154045076223067096260145595311500267885399400236024528) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0271_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0271
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0272 : Poly :=
[
  term ((260201540992734 : Rat) / 7342292683791569) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 272 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0272 : Poly :=
[
  term ((520403081985468 : Rat) / 7342292683791569) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-260201540992734 : Rat) / 7342292683791569) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((520403081985468 : Rat) / 7342292683791569) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-260201540992734 : Rat) / 7342292683791569) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0272_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0272
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0273 : Poly :=
[
  term ((33366720393208563842 : Rat) / 32049107564750198685) [(10, 1), (16, 1)]
]

/-- Partial product 273 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0273 : Poly :=
[
  term ((66733440786417127684 : Rat) / 32049107564750198685) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33366720393208563842 : Rat) / 32049107564750198685) [(10, 1), (11, 2), (16, 1)],
  term ((66733440786417127684 : Rat) / 32049107564750198685) [(10, 2), (14, 1), (16, 1)],
  term ((-33366720393208563842 : Rat) / 32049107564750198685) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0273_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0273
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0274 : Poly :=
[
  term ((-9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 274 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0274 : Poly :=
[
  term ((-19478142324788205986515383737876018943150478260162469863225734072 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-19478142324788205986515383737876018943150478260162469863225734072 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0274_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0274
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0275 : Poly :=
[
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 275 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0275 : Poly :=
[
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(11, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0275_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0275
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0276 : Poly :=
[
  term ((-14615930794358448344461982376218376647387832253979 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 276 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0276 : Poly :=
[
  term ((-29231861588716896688923964752436753294775664507958 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((14615930794358448344461982376218376647387832253979 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-29231861588716896688923964752436753294775664507958 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 2), (12, 1), (15, 2)],
  term ((14615930794358448344461982376218376647387832253979 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0276_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0276
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0277 : Poly :=
[
  term ((-125687532897109714073141697560731856842632057638664582569695290889 : Rat) / 1002677383277194613854963855878606217519045274236821781911234000) [(11, 1), (13, 1)]
]

/-- Partial product 277 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0277 : Poly :=
[
  term ((-125687532897109714073141697560731856842632057638664582569695290889 : Rat) / 501338691638597306927481927939303108759522637118410890955617000) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((125687532897109714073141697560731856842632057638664582569695290889 : Rat) / 1002677383277194613854963855878606217519045274236821781911234000) [(10, 2), (11, 1), (13, 1)],
  term ((-125687532897109714073141697560731856842632057638664582569695290889 : Rat) / 501338691638597306927481927939303108759522637118410890955617000) [(11, 2), (13, 1), (15, 1)],
  term ((125687532897109714073141697560731856842632057638664582569695290889 : Rat) / 1002677383277194613854963855878606217519045274236821781911234000) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0277_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0277
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0278 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 278 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0278 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(11, 2), (13, 1), (15, 3)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0278_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0278
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0279 : Poly :=
[
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 279 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0279 : Poly :=
[
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0279_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0279
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0280 : Poly :=
[
  term ((-24867215140398574004324 : Rat) / 13017774793972194963465) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 280 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0280 : Poly :=
[
  term ((-49734430280797148008648 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((24867215140398574004324 : Rat) / 13017774793972194963465) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-49734430280797148008648 : Rat) / 13017774793972194963465) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((24867215140398574004324 : Rat) / 13017774793972194963465) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0280_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0280
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0281 : Poly :=
[
  term ((4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 281 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0281 : Poly :=
[
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 2), (13, 2), (15, 2)],
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0281_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0281
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0282 : Poly :=
[
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0282 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0282_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0282
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0283 : Poly :=
[
  term ((-997156003655337613397747267581637224149382876461519357362248409401254086055542893 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(11, 1), (15, 1)]
]

/-- Partial product 283 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0283 : Poly :=
[
  term ((-997156003655337613397747267581637224149382876461519357362248409401254086055542893 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((997156003655337613397747267581637224149382876461519357362248409401254086055542893 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(10, 2), (11, 1), (15, 1)],
  term ((-997156003655337613397747267581637224149382876461519357362248409401254086055542893 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(11, 2), (15, 2)],
  term ((997156003655337613397747267581637224149382876461519357362248409401254086055542893 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0283_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0283
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0284 : Poly :=
[
  term ((-12312856811829194135870777 : Rat) / 3788172465045908734368315) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0284 : Poly :=
[
  term ((-24625713623658388271741554 : Rat) / 3788172465045908734368315) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12312856811829194135870777 : Rat) / 3788172465045908734368315) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24625713623658388271741554 : Rat) / 3788172465045908734368315) [(11, 2), (15, 2), (16, 1)],
  term ((12312856811829194135870777 : Rat) / 3788172465045908734368315) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0284_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0284
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0285 : Poly :=
[
  term ((1830603107646692570888402721086996837419 : Rat) / 75799185777103348981250705318708427750) [(11, 2)]
]

/-- Partial product 285 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0285 : Poly :=
[
  term ((1830603107646692570888402721086996837419 : Rat) / 37899592888551674490625352659354213875) [(10, 1), (11, 2), (14, 1)],
  term ((-1830603107646692570888402721086996837419 : Rat) / 75799185777103348981250705318708427750) [(10, 2), (11, 2)],
  term ((1830603107646692570888402721086996837419 : Rat) / 37899592888551674490625352659354213875) [(11, 3), (15, 1)],
  term ((-1830603107646692570888402721086996837419 : Rat) / 75799185777103348981250705318708427750) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0285_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0285
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0286 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 286 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0286 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (15, 2)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0286_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0286
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0287 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0287 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(11, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0287_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0287
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0288 : Poly :=
[
  term ((509101325314838857276 : Rat) / 619894037808199760165) [(11, 2), (16, 1)]
]

/-- Partial product 288 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0288 : Poly :=
[
  term ((1018202650629677714552 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-509101325314838857276 : Rat) / 619894037808199760165) [(10, 2), (11, 2), (16, 1)],
  term ((1018202650629677714552 : Rat) / 619894037808199760165) [(11, 3), (15, 1), (16, 1)],
  term ((-509101325314838857276 : Rat) / 619894037808199760165) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0288_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0288
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0289 : Poly :=
[
  term ((-1017228529814420366391282834233927865426275301033380032841821304832072014297 : Rat) / 200282208351718223897735798238868600404100702946996910191417859042273408000) [(12, 1)]
]

/-- Partial product 289 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0289 : Poly :=
[
  term ((-1017228529814420366391282834233927865426275301033380032841821304832072014297 : Rat) / 100141104175859111948867899119434300202050351473498455095708929521136704000) [(10, 1), (12, 1), (14, 1)],
  term ((1017228529814420366391282834233927865426275301033380032841821304832072014297 : Rat) / 200282208351718223897735798238868600404100702946996910191417859042273408000) [(10, 2), (12, 1)],
  term ((-1017228529814420366391282834233927865426275301033380032841821304832072014297 : Rat) / 100141104175859111948867899119434300202050351473498455095708929521136704000) [(11, 1), (12, 1), (15, 1)],
  term ((1017228529814420366391282834233927865426275301033380032841821304832072014297 : Rat) / 200282208351718223897735798238868600404100702946996910191417859042273408000) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0289_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0289
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0290 : Poly :=
[
  term ((-15197410997149241142596660463713316340624890900268514970352625648903 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 290 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0290 : Poly :=
[
  term ((-15197410997149241142596660463713316340624890900268514970352625648903 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((15197410997149241142596660463713316340624890900268514970352625648903 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-15197410997149241142596660463713316340624890900268514970352625648903 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((15197410997149241142596660463713316340624890900268514970352625648903 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0290_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0290
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0291 : Poly :=
[
  term ((-11423328844091868 : Rat) / 7342292683791569) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0291 : Poly :=
[
  term ((-22846657688183736 : Rat) / 7342292683791569) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0291_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0291
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0292 : Poly :=
[
  term ((266260380844575339322727649087420127131325845221685886535562916103 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(12, 1), (13, 2)]
]

/-- Partial product 292 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0292 : Poly :=
[
  term ((266260380844575339322727649087420127131325845221685886535562916103 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-266260380844575339322727649087420127131325845221685886535562916103 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(10, 2), (12, 1), (13, 2)],
  term ((266260380844575339322727649087420127131325845221685886535562916103 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-266260380844575339322727649087420127131325845221685886535562916103 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0292_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0292
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0293 : Poly :=
[
  term ((38997975877156222521436 : Rat) / 13017774793972194963465) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 293 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0293 : Poly :=
[
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-38997975877156222521436 : Rat) / 13017774793972194963465) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-38997975877156222521436 : Rat) / 13017774793972194963465) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0293_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0293
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0294 : Poly :=
[
  term ((13989896892563239286550105689226432731137611993968 : Rat) / 36572061034282584137616066011116869300602424550113) [(12, 1), (15, 2)]
]

/-- Partial product 294 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0294 : Poly :=
[
  term ((27979793785126478573100211378452865462275223987936 : Rat) / 36572061034282584137616066011116869300602424550113) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-13989896892563239286550105689226432731137611993968 : Rat) / 36572061034282584137616066011116869300602424550113) [(10, 2), (12, 1), (15, 2)],
  term ((27979793785126478573100211378452865462275223987936 : Rat) / 36572061034282584137616066011116869300602424550113) [(11, 1), (12, 1), (15, 3)],
  term ((-13989896892563239286550105689226432731137611993968 : Rat) / 36572061034282584137616066011116869300602424550113) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0294_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0294
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0295 : Poly :=
[
  term ((22751659848203096029 : Rat) / 32049107564750198685) [(12, 1), (16, 1)]
]

/-- Partial product 295 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0295 : Poly :=
[
  term ((45503319696406192058 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-22751659848203096029 : Rat) / 32049107564750198685) [(10, 2), (12, 1), (16, 1)],
  term ((45503319696406192058 : Rat) / 32049107564750198685) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22751659848203096029 : Rat) / 32049107564750198685) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0295_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0295
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0296 : Poly :=
[
  term ((8186445004505883707977316723702436744611692660495861304549853134364292880590272894841 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(13, 1), (15, 1)]
]

/-- Partial product 296 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0296 : Poly :=
[
  term ((8186445004505883707977316723702436744611692660495861304549853134364292880590272894841 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8186445004505883707977316723702436744611692660495861304549853134364292880590272894841 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(10, 2), (13, 1), (15, 1)],
  term ((8186445004505883707977316723702436744611692660495861304549853134364292880590272894841 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(11, 1), (13, 1), (15, 2)],
  term ((-8186445004505883707977316723702436744611692660495861304549853134364292880590272894841 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0296_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0296
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0297 : Poly :=
[
  term ((679501607933517419529510691 : Rat) / 15152689860183634937473260) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0297 : Poly :=
[
  term ((679501607933517419529510691 : Rat) / 7576344930091817468736630) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-679501607933517419529510691 : Rat) / 15152689860183634937473260) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((679501607933517419529510691 : Rat) / 7576344930091817468736630) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-679501607933517419529510691 : Rat) / 15152689860183634937473260) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0297_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0297
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0298 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(13, 1), (15, 3)]
]

/-- Partial product 298 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0298 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(10, 2), (13, 1), (15, 3)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(11, 1), (13, 1), (15, 4)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0298_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0298
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYNYN_coefficient_29_0299 : Poly :=
[
  term ((2020095442437435 : Rat) / 7342292683791569) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 299 for generator 29. -/
def rs_R009_ueqv_R009NYNYN_partial_29_0299 : Poly :=
[
  term ((4040190884874870 : Rat) / 7342292683791569) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 29. -/
theorem rs_R009_ueqv_R009NYNYN_partial_29_0299_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_29_0299
        rs_R009_ueqv_R009NYNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_29_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_29_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_29_0200,
  rs_R009_ueqv_R009NYNYN_partial_29_0201,
  rs_R009_ueqv_R009NYNYN_partial_29_0202,
  rs_R009_ueqv_R009NYNYN_partial_29_0203,
  rs_R009_ueqv_R009NYNYN_partial_29_0204,
  rs_R009_ueqv_R009NYNYN_partial_29_0205,
  rs_R009_ueqv_R009NYNYN_partial_29_0206,
  rs_R009_ueqv_R009NYNYN_partial_29_0207,
  rs_R009_ueqv_R009NYNYN_partial_29_0208,
  rs_R009_ueqv_R009NYNYN_partial_29_0209,
  rs_R009_ueqv_R009NYNYN_partial_29_0210,
  rs_R009_ueqv_R009NYNYN_partial_29_0211,
  rs_R009_ueqv_R009NYNYN_partial_29_0212,
  rs_R009_ueqv_R009NYNYN_partial_29_0213,
  rs_R009_ueqv_R009NYNYN_partial_29_0214,
  rs_R009_ueqv_R009NYNYN_partial_29_0215,
  rs_R009_ueqv_R009NYNYN_partial_29_0216,
  rs_R009_ueqv_R009NYNYN_partial_29_0217,
  rs_R009_ueqv_R009NYNYN_partial_29_0218,
  rs_R009_ueqv_R009NYNYN_partial_29_0219,
  rs_R009_ueqv_R009NYNYN_partial_29_0220,
  rs_R009_ueqv_R009NYNYN_partial_29_0221,
  rs_R009_ueqv_R009NYNYN_partial_29_0222,
  rs_R009_ueqv_R009NYNYN_partial_29_0223,
  rs_R009_ueqv_R009NYNYN_partial_29_0224,
  rs_R009_ueqv_R009NYNYN_partial_29_0225,
  rs_R009_ueqv_R009NYNYN_partial_29_0226,
  rs_R009_ueqv_R009NYNYN_partial_29_0227,
  rs_R009_ueqv_R009NYNYN_partial_29_0228,
  rs_R009_ueqv_R009NYNYN_partial_29_0229,
  rs_R009_ueqv_R009NYNYN_partial_29_0230,
  rs_R009_ueqv_R009NYNYN_partial_29_0231,
  rs_R009_ueqv_R009NYNYN_partial_29_0232,
  rs_R009_ueqv_R009NYNYN_partial_29_0233,
  rs_R009_ueqv_R009NYNYN_partial_29_0234,
  rs_R009_ueqv_R009NYNYN_partial_29_0235,
  rs_R009_ueqv_R009NYNYN_partial_29_0236,
  rs_R009_ueqv_R009NYNYN_partial_29_0237,
  rs_R009_ueqv_R009NYNYN_partial_29_0238,
  rs_R009_ueqv_R009NYNYN_partial_29_0239,
  rs_R009_ueqv_R009NYNYN_partial_29_0240,
  rs_R009_ueqv_R009NYNYN_partial_29_0241,
  rs_R009_ueqv_R009NYNYN_partial_29_0242,
  rs_R009_ueqv_R009NYNYN_partial_29_0243,
  rs_R009_ueqv_R009NYNYN_partial_29_0244,
  rs_R009_ueqv_R009NYNYN_partial_29_0245,
  rs_R009_ueqv_R009NYNYN_partial_29_0246,
  rs_R009_ueqv_R009NYNYN_partial_29_0247,
  rs_R009_ueqv_R009NYNYN_partial_29_0248,
  rs_R009_ueqv_R009NYNYN_partial_29_0249,
  rs_R009_ueqv_R009NYNYN_partial_29_0250,
  rs_R009_ueqv_R009NYNYN_partial_29_0251,
  rs_R009_ueqv_R009NYNYN_partial_29_0252,
  rs_R009_ueqv_R009NYNYN_partial_29_0253,
  rs_R009_ueqv_R009NYNYN_partial_29_0254,
  rs_R009_ueqv_R009NYNYN_partial_29_0255,
  rs_R009_ueqv_R009NYNYN_partial_29_0256,
  rs_R009_ueqv_R009NYNYN_partial_29_0257,
  rs_R009_ueqv_R009NYNYN_partial_29_0258,
  rs_R009_ueqv_R009NYNYN_partial_29_0259,
  rs_R009_ueqv_R009NYNYN_partial_29_0260,
  rs_R009_ueqv_R009NYNYN_partial_29_0261,
  rs_R009_ueqv_R009NYNYN_partial_29_0262,
  rs_R009_ueqv_R009NYNYN_partial_29_0263,
  rs_R009_ueqv_R009NYNYN_partial_29_0264,
  rs_R009_ueqv_R009NYNYN_partial_29_0265,
  rs_R009_ueqv_R009NYNYN_partial_29_0266,
  rs_R009_ueqv_R009NYNYN_partial_29_0267,
  rs_R009_ueqv_R009NYNYN_partial_29_0268,
  rs_R009_ueqv_R009NYNYN_partial_29_0269,
  rs_R009_ueqv_R009NYNYN_partial_29_0270,
  rs_R009_ueqv_R009NYNYN_partial_29_0271,
  rs_R009_ueqv_R009NYNYN_partial_29_0272,
  rs_R009_ueqv_R009NYNYN_partial_29_0273,
  rs_R009_ueqv_R009NYNYN_partial_29_0274,
  rs_R009_ueqv_R009NYNYN_partial_29_0275,
  rs_R009_ueqv_R009NYNYN_partial_29_0276,
  rs_R009_ueqv_R009NYNYN_partial_29_0277,
  rs_R009_ueqv_R009NYNYN_partial_29_0278,
  rs_R009_ueqv_R009NYNYN_partial_29_0279,
  rs_R009_ueqv_R009NYNYN_partial_29_0280,
  rs_R009_ueqv_R009NYNYN_partial_29_0281,
  rs_R009_ueqv_R009NYNYN_partial_29_0282,
  rs_R009_ueqv_R009NYNYN_partial_29_0283,
  rs_R009_ueqv_R009NYNYN_partial_29_0284,
  rs_R009_ueqv_R009NYNYN_partial_29_0285,
  rs_R009_ueqv_R009NYNYN_partial_29_0286,
  rs_R009_ueqv_R009NYNYN_partial_29_0287,
  rs_R009_ueqv_R009NYNYN_partial_29_0288,
  rs_R009_ueqv_R009NYNYN_partial_29_0289,
  rs_R009_ueqv_R009NYNYN_partial_29_0290,
  rs_R009_ueqv_R009NYNYN_partial_29_0291,
  rs_R009_ueqv_R009NYNYN_partial_29_0292,
  rs_R009_ueqv_R009NYNYN_partial_29_0293,
  rs_R009_ueqv_R009NYNYN_partial_29_0294,
  rs_R009_ueqv_R009NYNYN_partial_29_0295,
  rs_R009_ueqv_R009NYNYN_partial_29_0296,
  rs_R009_ueqv_R009NYNYN_partial_29_0297,
  rs_R009_ueqv_R009NYNYN_partial_29_0298,
  rs_R009_ueqv_R009NYNYN_partial_29_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_29_0200_0299 : Poly :=
[
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-346089545236745817950072655710282919110334440960773181626847992986474349421770185353 : Rat) / 71457862026467648194030022211368015573403346944148709433289076331719276889024000) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36393318235869019643278947 : Rat) / 420908051671767637152035) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((850248110009110791365298811841977642898399709297790128343495408364237850247632193 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((76778010074250921552893534 : Rat) / 3788172465045908734368315) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((169856573500911914828 : Rat) / 4578443937821456955) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((5552787510256342437 : Rat) / 3561011951638910965) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (10, 2), (12, 1), (13, 2)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (12, 1), (13, 2), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((346089545236745817950072655710282919110334440960773181626847992986474349421770185353 : Rat) / 142915724052935296388060044422736031146806693888297418866578152663438553778048000) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((36393318235869019643278947 : Rat) / 841816103343535274304070) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-850248110009110791365298811841977642898399709297790128343495408364237850247632193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (10, 2), (13, 2)],
  term ((-38389005037125460776446767 : Rat) / 3788172465045908734368315) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (10, 2), (15, 2)],
  term ((-84928286750455957414 : Rat) / 4578443937821456955) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-5552787510256342437 : Rat) / 7122023903277821930) [(8, 1), (10, 2), (16, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-346089545236745817950072655710282919110334440960773181626847992986474349421770185353 : Rat) / 71457862026467648194030022211368015573403346944148709433289076331719276889024000) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-36393318235869019643278947 : Rat) / 420908051671767637152035) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((850248110009110791365298811841977642898399709297790128343495408364237850247632193 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((76778010074250921552893534 : Rat) / 3788172465045908734368315) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5552787510256342437 : Rat) / 3561011951638910965) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (11, 1), (15, 3)],
  term ((169856573500911914828 : Rat) / 4578443937821456955) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (11, 2), (12, 1), (13, 2)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((346089545236745817950072655710282919110334440960773181626847992986474349421770185353 : Rat) / 142915724052935296388060044422736031146806693888297418866578152663438553778048000) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((36393318235869019643278947 : Rat) / 841816103343535274304070) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-850248110009110791365298811841977642898399709297790128343495408364237850247632193 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (11, 2), (13, 2)],
  term ((-38389005037125460776446767 : Rat) / 3788172465045908734368315) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (11, 2), (15, 2)],
  term ((-84928286750455957414 : Rat) / 4578443937821456955) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-5552787510256342437 : Rat) / 7122023903277821930) [(8, 1), (11, 2), (16, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 2), (13, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (10, 2), (15, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1410734033780813624550909155773014691180592 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((4800210874590085857024 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((-2400105437295042928512 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1103911739916455930633193356155188855903232 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3628184864870638142464 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 1), (13, 2), (14, 1)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(8, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (10, 2), (13, 2)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (10, 2), (13, 2), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((389631033919608636393910441133547134673872 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((64339132168338029756672 : Rat) / 13017774793972194963465) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3910060430820965164233468622729347073953652 : Rat) / 4239340175962280160879950161753478494875) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-60107099120198893552576 : Rat) / 13017774793972194963465) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 2), (11, 2), (13, 2)],
  term ((-32169566084169014878336 : Rat) / 13017774793972194963465) [(8, 2), (11, 2), (13, 2), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 2), (15, 2)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((551955869958227965316596678077594427951616 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 3), (13, 1)],
  term ((1814092432435319071232 : Rat) / 619894037808199760165) [(8, 2), (11, 3), (13, 1), (16, 1)],
  term ((-275977934979113982658298339038797213975808 : Rat) / 1099088193767998560228135227121272202375) [(8, 2), (11, 3), (15, 1)],
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2179610221583563253424 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((51567544057934204224136 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((730325961405203838154073014923432864391983875371815454264372774965393613041844573 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((23421791523969794676715304 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-979611705980426124475024882262319582057013465425477885055443957314524873981 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-5715807279015405670428 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-25783772028967102112068 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-15574249618539055100347418443949562336691072630409904678490171261659566610899 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-18487287977666926057426 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((1608070950057716952497340582731796400112049205542836760423369574 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (10, 1), (11, 3)],
  term ((304931308816780412752 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 3), (16, 1)],
  term ((-44138933711318820465159712965784762829029729 : Rat) / 118701524926943844504638604529097397856500) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-21540621239290946924164 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9169289285516527564665384907928353048318141618073812528514495747914231338850702181843 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-187829160561341762772143822 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 1), (13, 3), (14, 1)],
  term ((18459502108338489612997587060402541631665529994392471480476895778243476502474070443697 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((4809413369617031531451085 : Rat) / 108233499001311678124809) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-730325961405203838154073014923432864391983875371815454264372774965393613041844573 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (10, 2), (11, 1)],
  term ((-128887686063626276402639332905286181150983 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-1099578600686489404216 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((-3216141900115433904994681165463592800224098411085673520846739148 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-609862617633560825504 : Rat) / 123978807561639952033) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-11710895761984897338357652 : Rat) / 3788172465045908734368315) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 2), (13, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((44138933711318820465159712965784762829029729 : Rat) / 237403049853887689009277209058194795713000) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((10770310619645473462082 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-5711664422045934 : Rat) / 7342292683791569) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((9169289285516527564665384907928353048318141618073812528514495747914231338850702181843 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (10, 2), (13, 1)],
  term ((5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((51567544057934204224136 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((93914580280670881386071911 : Rat) / 3788172465045908734368315) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 2), (13, 3)],
  term ((-979611705980426124475024882262319582057013465425477885055443957314524873981 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-5715807279015405670428 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18459502108338489612997587060402541631665529994392471480476895778243476502474070443697 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (10, 2), (15, 1)],
  term ((-4809413369617031531451085 : Rat) / 216466998002623356249618) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1608070950057716952497340582731796400112049205542836760423369574 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (10, 3), (11, 1)],
  term ((304931308816780412752 : Rat) / 123978807561639952033) [(9, 1), (10, 3), (11, 1), (16, 1)],
  term ((-5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(9, 1), (10, 3), (13, 1)],
  term ((-25783772028967102112068 : Rat) / 13017774793972194963465) [(9, 1), (10, 3), (13, 1), (16, 1)],
  term ((979611705980426124475024882262319582057013465425477885055443957314524873981 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 3), (15, 1)],
  term ((2857903639507702835214 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-44138933711318820465159712965784762829029729 : Rat) / 118701524926943844504638604529097397856500) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21540621239290946924164 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9169289285516527564665384907928353048318141618073812528514495747914231338850702181843 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-187829160561341762772143822 : Rat) / 3788172465045908734368315) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((18459502108338489612997587060402541631665529994392471480476895778243476502474070443697 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (11, 1), (15, 2)],
  term ((4809413369617031531451085 : Rat) / 108233499001311678124809) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((44138933711318820465159712965784762829029729 : Rat) / 237403049853887689009277209058194795713000) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((10770310619645473462082 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((14507640045830342776866921284836202496950498014566389564858965450930863655769 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((12018535294503814894694 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((9169289285516527564665384907928353048318141618073812528514495747914231338850702181843 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (11, 2), (13, 1)],
  term ((-27268475161863490591444328780473960331582766306024426524885475747703090221457 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-338700616800931278891 : Rat) / 123978807561639952033) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((93914580280670881386071911 : Rat) / 3788172465045908734368315) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1283741600123865364272001670211899566446317968121982803001880643459 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-72001196775829294544294 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 2), (13, 3)],
  term ((-25775849996642533870008061416320306791929427349079310741640177610924033279752202181 : Rat) / 123479185581736096079283878381243930910840983519488969900723523901210910464233472) [(9, 1), (11, 2), (15, 1)],
  term ((-121485884888656514247357367 : Rat) / 7576344930091817468736630) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-730325961405203838154073014923432864391983875371815454264372774965393613041844573 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (11, 3)],
  term ((-128887686063626276402639332905286181150983 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 3), (12, 1)],
  term ((-1099578600686489404216 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-777508539575422106803079028742883362237956682341219054933603317229926108201 : Rat) / 5296292585052607376344249717218828236675861564744435447924586447804283575) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((3615687180087664863064 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 3), (13, 2)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (11, 3), (13, 2), (16, 1)],
  term ((-11710895761984897338357652 : Rat) / 3788172465045908734368315) [(9, 1), (11, 3), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 4), (13, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 4), (13, 1), (16, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-474261363557611823034997116127464466222799 : Rat) / 3956717497564794816821286817636579928550) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((806868800296087496664 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((474261363557611823034997116127464466222799 : Rat) / 7913434995129589633642573635273159857100) [(9, 2), (10, 1), (11, 2)],
  term ((-403434400148043748332 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (11, 2), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11023502125980491698504450270650545476140450597276029791396813094147118780083783 : Rat) / 51019734364148151608811365551801788144750644369896740921800430002020850328000) [(9, 2), (10, 1), (14, 1)],
  term ((34179786165962568186130163 : Rat) / 7576344930091817468736630) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-11023502125980491698504450270650545476140450597276029791396813094147118780083783 : Rat) / 102039468728296303217622731103603576289501288739793481843600860004041700656000) [(9, 2), (10, 2)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (10, 2), (12, 1)],
  term ((1454779553155439633106 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (12, 1), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-474261363557611823034997116127464466222799 : Rat) / 3956717497564794816821286817636579928550) [(9, 2), (10, 2), (14, 1)],
  term ((806868800296087496664 : Rat) / 867851652931479664231) [(9, 2), (10, 2), (14, 1), (16, 1)],
  term ((-34179786165962568186130163 : Rat) / 15152689860183634937473260) [(9, 2), (10, 2), (16, 1)],
  term ((474261363557611823034997116127464466222799 : Rat) / 7913434995129589633642573635273159857100) [(9, 2), (10, 3)],
  term ((-403434400148043748332 : Rat) / 867851652931479664231) [(9, 2), (10, 3), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11023502125980491698504450270650545476140450597276029791396813094147118780083783 : Rat) / 51019734364148151608811365551801788144750644369896740921800430002020850328000) [(9, 2), (11, 1), (15, 1)],
  term ((34179786165962568186130163 : Rat) / 7576344930091817468736630) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-11023502125980491698504450270650545476140450597276029791396813094147118780083783 : Rat) / 102039468728296303217622731103603576289501288739793481843600860004041700656000) [(9, 2), (11, 2)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (11, 2), (12, 1)],
  term ((1454779553155439633106 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((12629892302414073570049084032367696371888697 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5371861821862125412698 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-34179786165962568186130163 : Rat) / 15152689860183634937473260) [(9, 2), (11, 2), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 3), (13, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 3), (13, 1), (16, 1)],
  term ((-19478142324788205986515383737876018943150478260162469863225734072 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29231861588716896688923964752436753294775664507958 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-125687532897109714073141697560731856842632057638664582569695290889 : Rat) / 501338691638597306927481927939303108759522637118410890955617000) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-49734430280797148008648 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-919443620962221439291415102885738400226710641325447622018347815943582790903 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-10301117607624529191484 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19982554263443674640805533912975345584803096980093050516939662388 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-997156003655337613397747267581637224149382876461519357362248409401254086055542893 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24625713623658388271741554 : Rat) / 3788172465045908734368315) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4705429113104448420879508187776985292915764094590412786947942522296240473191 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(10, 1), (11, 1), (15, 1)],
  term ((66733440786417127684 : Rat) / 32049107564750198685) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(10, 1), (11, 1), (15, 3)],
  term ((520403081985468 : Rat) / 7342292683791569) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-4705429113104448420879508187776985292915764094590412786947942522296240473191 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(10, 1), (11, 2)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((568711841646326050844396306684657508824189843991137620139897779217974926853 : Rat) / 33450268958226993955858419266645230968479125672070118618471072301921791000) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((3682287933523130317318 : Rat) / 2603554958794438992693) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((9991277131721837320402766956487672792401548490046525258469831194 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 1), (11, 2), (13, 2)],
  term ((5598979460486274884512 : Rat) / 13017774793972194963465) [(10, 1), (11, 2), (13, 2), (16, 1)],
  term ((1830603107646692570888402721086996837419 : Rat) / 37899592888551674490625352659354213875) [(10, 1), (11, 2), (14, 1)],
  term ((1018202650629677714552 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((1353442965248395906462016109775553906018528030089479346901012234259550141981 : Rat) / 6725450901654104604881586942500099348159824209199283108475665330545122000) [(10, 1), (11, 2), (15, 2)],
  term ((5260472056560895846166 : Rat) / 4339258264657398321155) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-33366720393208563842 : Rat) / 32049107564750198685) [(10, 1), (11, 2), (16, 1)],
  term ((2958103430454298187995135797026960509787797124603199074824406516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 3), (13, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (13, 1), (16, 1)],
  term ((-115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 3), (15, 1)],
  term ((-386732133305706905464 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-15197410997149241142596660463713316340624890900268514970352625648903 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((266260380844575339322727649087420127131325845221685886535562916103 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1017228529814420366391282834233927865426275301033380032841821304832072014297 : Rat) / 100141104175859111948867899119434300202050351473498455095708929521136704000) [(10, 1), (12, 1), (14, 1)],
  term ((27979793785126478573100211378452865462275223987936 : Rat) / 36572061034282584137616066011116869300602424550113) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((45503319696406192058 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((8186445004505883707977316723702436744611692660495861304549853134364292880590272894841 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((679501607933517419529510691 : Rat) / 7576344930091817468736630) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((14615930794358448344461982376218376647387832253979 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((125687532897109714073141697560731856842632057638664582569695290889 : Rat) / 1002677383277194613854963855878606217519045274236821781911234000) [(10, 2), (11, 1), (13, 1)],
  term ((-5916206860908596375990271594053921019575594249206398149648813032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((24867215140398574004324 : Rat) / 13017774793972194963465) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((230077174676892411380632536971819459065214 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((773464266611413810928 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((997156003655337613397747267581637224149382876461519357362248409401254086055542893 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(10, 2), (11, 1), (15, 1)],
  term ((12312856811829194135870777 : Rat) / 3788172465045908734368315) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1830603107646692570888402721086996837419 : Rat) / 75799185777103348981250705318708427750) [(10, 2), (11, 2)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-509101325314838857276 : Rat) / 619894037808199760165) [(10, 2), (11, 2), (16, 1)],
  term ((1017228529814420366391282834233927865426275301033380032841821304832072014297 : Rat) / 200282208351718223897735798238868600404100702946996910191417859042273408000) [(10, 2), (12, 1)],
  term ((15197410997149241142596660463713316340624890900268514970352625648903 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((11423328844091868 : Rat) / 7342292683791569) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-266260380844575339322727649087420127131325845221685886535562916103 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(10, 2), (12, 1), (13, 2)],
  term ((-38997975877156222521436 : Rat) / 13017774793972194963465) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((-13989896892563239286550105689226432731137611993968 : Rat) / 36572061034282584137616066011116869300602424550113) [(10, 2), (12, 1), (15, 2)],
  term ((-22751659848203096029 : Rat) / 32049107564750198685) [(10, 2), (12, 1), (16, 1)],
  term ((-919443620962221439291415102885738400226710641325447622018347815943582790903 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-10301117607624529191484 : Rat) / 13017774793972194963465) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8186445004505883707977316723702436744611692660495861304549853134364292880590272894841 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(10, 2), (13, 1), (15, 1)],
  term ((-679501607933517419529510691 : Rat) / 15152689860183634937473260) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(10, 2), (13, 1), (15, 3)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-19982554263443674640805533912975345584803096980093050516939662388 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 2), (13, 2), (14, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((4705429113104448420879508187776985292915764094590412786947942522296240473191 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(10, 2), (14, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(10, 2), (14, 1), (15, 2)],
  term ((520403081985468 : Rat) / 7342292683791569) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((66733440786417127684 : Rat) / 32049107564750198685) [(10, 2), (14, 1), (16, 1)],
  term ((-4705429113104448420879508187776985292915764094590412786947942522296240473191 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(10, 3)],
  term ((2958103430454298187995135797026960509787797124603199074824406516 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 3), (11, 1), (13, 1)],
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (13, 1), (16, 1)],
  term ((-115038587338446205690316268485909729532607 : Rat) / 1099088193767998560228135227121272202375) [(10, 3), (11, 1), (15, 1)],
  term ((-386732133305706905464 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term ((919443620962221439291415102885738400226710641325447622018347815943582790903 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(10, 3), (13, 1), (15, 1)],
  term ((5150558803812264595742 : Rat) / 13017774793972194963465) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((9991277131721837320402766956487672792401548490046525258469831194 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 3), (13, 2)],
  term ((5598979460486274884512 : Rat) / 13017774793972194963465) [(10, 3), (13, 2), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 5484278475154045076223067096260145595311500267885399400236024528) [(10, 3), (15, 2)],
  term ((-260201540992734 : Rat) / 7342292683791569) [(10, 3), (15, 2), (16, 1)],
  term ((-33366720393208563842 : Rat) / 32049107564750198685) [(10, 3), (16, 1)],
  term ((-15197410997149241142596660463713316340624890900268514970352625648903 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((266260380844575339322727649087420127131325845221685886535562916103 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1017228529814420366391282834233927865426275301033380032841821304832072014297 : Rat) / 100141104175859111948867899119434300202050351473498455095708929521136704000) [(11, 1), (12, 1), (15, 1)],
  term ((45503319696406192058 : Rat) / 32049107564750198685) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27979793785126478573100211378452865462275223987936 : Rat) / 36572061034282584137616066011116869300602424550113) [(11, 1), (12, 1), (15, 3)],
  term ((8186445004505883707977316723702436744611692660495861304549853134364292880590272894841 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(11, 1), (13, 1), (15, 2)],
  term ((679501607933517419529510691 : Rat) / 7576344930091817468736630) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(11, 1), (13, 1), (15, 4)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((1017228529814420366391282834233927865426275301033380032841821304832072014297 : Rat) / 200282208351718223897735798238868600404100702946996910191417859042273408000) [(11, 2), (12, 1)],
  term ((-432897915844584169583729558173029916808475255120232368243733617036821562061 : Rat) / 2435077050598899943146781479181070453644074282641119746172223654162889000) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-24037070589007629789388 : Rat) / 4339258264657398321155) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-266260380844575339322727649087420127131325845221685886535562916103 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(11, 2), (12, 1), (13, 2)],
  term ((-38997975877156222521436 : Rat) / 13017774793972194963465) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-277076651191015309486865788461157212384118592565590 : Rat) / 36572061034282584137616066011116869300602424550113) [(11, 2), (12, 1), (15, 2)],
  term ((-22751659848203096029 : Rat) / 32049107564750198685) [(11, 2), (12, 1), (16, 1)],
  term ((-9153842049330211755213693641585744591957316003458020407543488428678194996359413614073 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(11, 2), (13, 1), (15, 1)],
  term ((-737392484780365299811576963 : Rat) / 15152689860183634937473260) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((25087411598134628641652791552630797303879897452598333404205521101722394393109 : Rat) / 282468937869472393405026651585004172622712616786369890555977943882895124000) [(11, 2), (13, 1), (15, 3)],
  term ((7270226249481828733767 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 2), (13, 2), (15, 2)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-997156003655337613397747267581637224149382876461519357362248409401254086055542893 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(11, 2), (15, 2)],
  term ((-24625713623658388271741554 : Rat) / 3788172465045908734368315) [(11, 2), (15, 2), (16, 1)],
  term ((9739071162394102993257691868938009471575239130081234931612867036 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(11, 3), (12, 1), (13, 1)],
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(11, 3), (12, 1), (13, 1), (16, 1)],
  term ((14615930794358448344461982376218376647387832253979 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 3), (12, 1), (15, 1)],
  term ((125687532897109714073141697560731856842632057638664582569695290889 : Rat) / 1002677383277194613854963855878606217519045274236821781911234000) [(11, 3), (13, 1)],
  term ((504984557474518959549284318182743549934417339602785525592147664803223289713 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(11, 3), (13, 1), (15, 2)],
  term ((-13072633520278161643028 : Rat) / 4339258264657398321155) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((24867215140398574004324 : Rat) / 13017774793972194963465) [(11, 3), (13, 1), (16, 1)],
  term ((-4025068032836959446099257203803551653534866018542165455071334144 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 3), (13, 2), (15, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((1140086807795420690353042239091802465679368684106598215433536207679292840782062061 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(11, 3), (15, 1)],
  term ((18535093209827154649498049 : Rat) / 3788172465045908734368315) [(11, 3), (15, 1), (16, 1)],
  term ((-1830603107646692570888402721086996837419 : Rat) / 75799185777103348981250705318708427750) [(11, 4)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(11, 4), (13, 1), (15, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(11, 4), (13, 1), (15, 1), (16, 1)],
  term ((-509101325314838857276 : Rat) / 619894037808199760165) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NYNYN_block_29_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_29_0200_0299
      rs_R009_ueqv_R009NYNYN_block_29_0200_0299 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
