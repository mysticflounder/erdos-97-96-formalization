/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 21:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 : Poly :=
[
  term (2 : Rat) [(8, 1), (14, 1)],
  term (2 : Rat) [(9, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0300 : Poly :=
[
  term ((-1606184556847589865954940371247984838012536 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 300 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0300 : Poly :=
[
  term ((-3212369113695179731909880742495969676025072 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((1606184556847589865954940371247984838012536 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((1606184556847589865954940371247984838012536 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3212369113695179731909880742495969676025072 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0300_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0300
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0301 : Poly :=
[
  term ((10511500802420929816448 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 301 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0301 : Poly :=
[
  term ((21023001604841859632896 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-10511500802420929816448 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-10511500802420929816448 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((21023001604841859632896 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0301_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0301
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0302 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 302 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0302 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (15, 3)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0302_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0302
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0303 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0303 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0303_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0303
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0304 : Poly :=
[
  term ((-148688092665650704771118708400232050842564023 : Rat) / 237403049853887689009277209058194795713000) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 304 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0304 : Poly :=
[
  term ((-148688092665650704771118708400232050842564023 : Rat) / 118701524926943844504638604529097397856500) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((148688092665650704771118708400232050842564023 : Rat) / 237403049853887689009277209058194795713000) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((148688092665650704771118708400232050842564023 : Rat) / 237403049853887689009277209058194795713000) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-148688092665650704771118708400232050842564023 : Rat) / 118701524926943844504638604529097397856500) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0304_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0304
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0305 : Poly :=
[
  term ((33697498134924955997914 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 305 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0305 : Poly :=
[
  term ((67394996269849911995828 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-33697498134924955997914 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-33697498134924955997914 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((67394996269849911995828 : Rat) / 13017774793972194963465) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0305_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0305
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0306 : Poly :=
[
  term ((322921810251467337033023905673489265388262704283502004108743159796170001833607 : Rat) / 847406813608417180215079954755012517868137850359109671667933831648685372000) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 306 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0306 : Poly :=
[
  term ((322921810251467337033023905673489265388262704283502004108743159796170001833607 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-322921810251467337033023905673489265388262704283502004108743159796170001833607 : Rat) / 847406813608417180215079954755012517868137850359109671667933831648685372000) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-322921810251467337033023905673489265388262704283502004108743159796170001833607 : Rat) / 847406813608417180215079954755012517868137850359109671667933831648685372000) [(9, 1), (12, 1), (15, 3)],
  term ((322921810251467337033023905673489265388262704283502004108743159796170001833607 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0306_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0306
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0307 : Poly :=
[
  term ((-10027805481205027688433 : Rat) / 8678516529314796642310) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0307 : Poly :=
[
  term ((-10027805481205027688433 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10027805481205027688433 : Rat) / 8678516529314796642310) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((10027805481205027688433 : Rat) / 8678516529314796642310) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10027805481205027688433 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0307_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0307
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0308 : Poly :=
[
  term ((-47495310502075141461027630577217169359273571623316076238788715438668968763609937971 : Rat) / 157498961201194000101127395894443789427093091223837971812147351914809834775808000) [(9, 1), (13, 1)]
]

/-- Partial product 308 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0308 : Poly :=
[
  term ((-47495310502075141461027630577217169359273571623316076238788715438668968763609937971 : Rat) / 78749480600597000050563697947221894713546545611918985906073675957404917387904000) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((47495310502075141461027630577217169359273571623316076238788715438668968763609937971 : Rat) / 157498961201194000101127395894443789427093091223837971812147351914809834775808000) [(9, 1), (13, 1), (14, 2)],
  term ((47495310502075141461027630577217169359273571623316076238788715438668968763609937971 : Rat) / 157498961201194000101127395894443789427093091223837971812147351914809834775808000) [(9, 1), (13, 1), (15, 2)],
  term ((-47495310502075141461027630577217169359273571623316076238788715438668968763609937971 : Rat) / 78749480600597000050563697947221894713546545611918985906073675957404917387904000) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0308_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0308
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0309 : Poly :=
[
  term ((-13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 309 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0309 : Poly :=
[
  term ((-13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 1), (13, 1), (15, 4)],
  term ((-13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0309_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0309
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0310 : Poly :=
[
  term ((-1181521755256816431310 : Rat) / 867851652931479664231) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 310 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0310 : Poly :=
[
  term ((-2363043510513632862620 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1181521755256816431310 : Rat) / 867851652931479664231) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1181521755256816431310 : Rat) / 867851652931479664231) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2363043510513632862620 : Rat) / 867851652931479664231) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0310_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0310
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0311 : Poly :=
[
  term ((-20845154412898502508222797 : Rat) / 797509992641243944077540) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 311 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0311 : Poly :=
[
  term ((-20845154412898502508222797 : Rat) / 398754996320621972038770) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((20845154412898502508222797 : Rat) / 797509992641243944077540) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((20845154412898502508222797 : Rat) / 797509992641243944077540) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20845154412898502508222797 : Rat) / 398754996320621972038770) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0311_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0311
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0312 : Poly :=
[
  term ((633613831111614260776214942063585846815223207080464498764861027 : Rat) / 4379510409716482221435474313032992674221117289770026173865160) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 312 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0312 : Poly :=
[
  term ((633613831111614260776214942063585846815223207080464498764861027 : Rat) / 2189755204858241110717737156516496337110558644885013086932580) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-633613831111614260776214942063585846815223207080464498764861027 : Rat) / 4379510409716482221435474313032992674221117289770026173865160) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-633613831111614260776214942063585846815223207080464498764861027 : Rat) / 4379510409716482221435474313032992674221117289770026173865160) [(9, 1), (13, 2), (15, 3)],
  term ((633613831111614260776214942063585846815223207080464498764861027 : Rat) / 2189755204858241110717737156516496337110558644885013086932580) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0312_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0312
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0313 : Poly :=
[
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0313 : Poly :=
[
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0313_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0313
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0314 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (13, 3)]
]

/-- Partial product 314 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0314 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 1), (13, 3), (14, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (13, 3), (14, 2)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (13, 3), (15, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0314_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0314
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0315 : Poly :=
[
  term ((116325098249183528633447299453565031280110521621158411451600772829776925161412093 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (15, 1)]
]

/-- Partial product 315 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0315 : Poly :=
[
  term ((116325098249183528633447299453565031280110521621158411451600772829776925161412093 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-116325098249183528633447299453565031280110521621158411451600772829776925161412093 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (14, 2), (15, 1)],
  term ((-116325098249183528633447299453565031280110521621158411451600772829776925161412093 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (15, 3)],
  term ((116325098249183528633447299453565031280110521621158411451600772829776925161412093 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0315_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0315
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0316 : Poly :=
[
  term ((41289800606509735793954393 : Rat) / 15152689860183634937473260) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0316 : Poly :=
[
  term ((41289800606509735793954393 : Rat) / 7576344930091817468736630) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41289800606509735793954393 : Rat) / 15152689860183634937473260) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41289800606509735793954393 : Rat) / 15152689860183634937473260) [(9, 1), (15, 3), (16, 1)],
  term ((41289800606509735793954393 : Rat) / 7576344930091817468736630) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0316_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0316
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0317 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 1), (15, 3)]
]

/-- Partial product 317 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0317 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 1), (14, 2), (15, 3)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 1), (15, 5)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0317_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0317
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0318 : Poly :=
[
  term ((2020095442437435 : Rat) / 7342292683791569) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 318 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0318 : Poly :=
[
  term ((4040190884874870 : Rat) / 7342292683791569) [(8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(9, 1), (15, 5), (16, 1)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0318_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0318
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0319 : Poly :=
[
  term ((270717351711985905071404057304124039761086938603613764839606059925570431330323379 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 2)]
]

/-- Partial product 319 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0319 : Poly :=
[
  term ((270717351711985905071404057304124039761086938603613764839606059925570431330323379 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 2), (14, 1)],
  term ((-270717351711985905071404057304124039761086938603613764839606059925570431330323379 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 2), (14, 2)],
  term ((-270717351711985905071404057304124039761086938603613764839606059925570431330323379 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 2), (15, 2)],
  term ((270717351711985905071404057304124039761086938603613764839606059925570431330323379 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0319_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0319
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0320 : Poly :=
[
  term ((-122766201736782921383248439727255513889582 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1)]
]

/-- Partial product 320 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0320 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((122766201736782921383248439727255513889582 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (14, 2)],
  term ((122766201736782921383248439727255513889582 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (15, 2)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0320_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0320
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0321 : Poly :=
[
  term ((417728389971334622304 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 321 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0321 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-417728389971334622304 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-417728389971334622304 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0321_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0321
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0322 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 322 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0322 : Poly :=
[
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0322_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0322
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0323 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 323 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0323 : Poly :=
[
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0323_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0323
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0324 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 324 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0324 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (15, 3)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0324_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0324
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0325 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0325 : Poly :=
[
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0325_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0325
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0326 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (12, 1)]
]

/-- Partial product 326 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0326 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (12, 1), (14, 2)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (12, 1), (15, 2)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0326_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0326
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0327 : Poly :=
[
  term ((-1454779553155439633106 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 327 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0327 : Poly :=
[
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((1454779553155439633106 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((1454779553155439633106 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0327_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0327
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0328 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 328 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0328 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (13, 1), (15, 3)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0328_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0328
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0329 : Poly :=
[
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0329 : Poly :=
[
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0329_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0329
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0330 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(9, 2), (15, 2)]
]

/-- Partial product 330 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0330 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 2), (14, 1), (15, 2)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(9, 2), (14, 2), (15, 2)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(9, 2), (15, 4)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0330_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0330
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0331 : Poly :=
[
  term ((-1015017351045724217133 : Rat) / 4339258264657398321155) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 331 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0331 : Poly :=
[
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((1015017351045724217133 : Rat) / 4339258264657398321155) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((1015017351045724217133 : Rat) / 4339258264657398321155) [(9, 2), (15, 4), (16, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0331_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0331
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0332 : Poly :=
[
  term ((37247101783742095597334399 : Rat) / 15152689860183634937473260) [(9, 2), (16, 1)]
]

/-- Partial product 332 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0332 : Poly :=
[
  term ((37247101783742095597334399 : Rat) / 7576344930091817468736630) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-37247101783742095597334399 : Rat) / 15152689860183634937473260) [(9, 2), (14, 2), (16, 1)],
  term ((-37247101783742095597334399 : Rat) / 15152689860183634937473260) [(9, 2), (15, 2), (16, 1)],
  term ((37247101783742095597334399 : Rat) / 7576344930091817468736630) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0332_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0332
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0333 : Poly :=
[
  term ((155322156933407842136245252054323324976561932319510780183737049970173774991 : Rat) / 794770668062373904356094437455827779381351995821416310283404202548704000) [(10, 1)]
]

/-- Partial product 333 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0333 : Poly :=
[
  term ((155322156933407842136245252054323324976561932319510780183737049970173774991 : Rat) / 397385334031186952178047218727913889690675997910708155141702101274352000) [(8, 1), (10, 1), (14, 1)],
  term ((155322156933407842136245252054323324976561932319510780183737049970173774991 : Rat) / 397385334031186952178047218727913889690675997910708155141702101274352000) [(9, 1), (10, 1), (15, 1)],
  term ((-155322156933407842136245252054323324976561932319510780183737049970173774991 : Rat) / 794770668062373904356094437455827779381351995821416310283404202548704000) [(10, 1), (14, 2)],
  term ((-155322156933407842136245252054323324976561932319510780183737049970173774991 : Rat) / 794770668062373904356094437455827779381351995821416310283404202548704000) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0333_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0333
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0334 : Poly :=
[
  term ((-30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 334 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0334 : Poly :=
[
  term ((-60701681303084549451333847562094697256288 : Rat) / 73272546251199904015209015141418146825) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-60701681303084549451333847562094697256288 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0334_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0334
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0335 : Poly :=
[
  term ((-1238890999566216296064 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 335 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0335 : Poly :=
[
  term ((-2477781999132432592128 : Rat) / 123978807561639952033) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2477781999132432592128 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0335_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0335
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0336 : Poly :=
[
  term ((15175420325771137362833461890523674314072 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 336 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0336 : Poly :=
[
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-15175420325771137362833461890523674314072 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-15175420325771137362833461890523674314072 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0336_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0336
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0337 : Poly :=
[
  term ((619445499783108148032 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0337 : Poly :=
[
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-619445499783108148032 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-619445499783108148032 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0337_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0337
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0338 : Poly :=
[
  term ((-13978704078560232536319841200113289785884161971196950102732843909341 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 338 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0338 : Poly :=
[
  term ((-13978704078560232536319841200113289785884161971196950102732843909341 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-13978704078560232536319841200113289785884161971196950102732843909341 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((13978704078560232536319841200113289785884161971196950102732843909341 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((13978704078560232536319841200113289785884161971196950102732843909341 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0338_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0338
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0339 : Poly :=
[
  term ((83345191499890856128 : Rat) / 65415953738553743535) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 339 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0339 : Poly :=
[
  term ((166690382999781712256 : Rat) / 65415953738553743535) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((166690382999781712256 : Rat) / 65415953738553743535) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83345191499890856128 : Rat) / 65415953738553743535) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-83345191499890856128 : Rat) / 65415953738553743535) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0339_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0339
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0340 : Poly :=
[
  term ((-157633536390654371916498387561929040646845374022143409457349878993183441567 : Rat) / 7846359385263122039028518099583449239519794910732496959888276218969309000) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 340 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0340 : Poly :=
[
  term ((-157633536390654371916498387561929040646845374022143409457349878993183441567 : Rat) / 3923179692631561019514259049791724619759897455366248479944138109484654500) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-157633536390654371916498387561929040646845374022143409457349878993183441567 : Rat) / 3923179692631561019514259049791724619759897455366248479944138109484654500) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((157633536390654371916498387561929040646845374022143409457349878993183441567 : Rat) / 7846359385263122039028518099583449239519794910732496959888276218969309000) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((157633536390654371916498387561929040646845374022143409457349878993183441567 : Rat) / 7846359385263122039028518099583449239519794910732496959888276218969309000) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0340_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0340
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0341 : Poly :=
[
  term ((1665893163958210803894 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0341 : Poly :=
[
  term ((3331786327916421607788 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3331786327916421607788 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1665893163958210803894 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1665893163958210803894 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0341_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0341
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0342 : Poly :=
[
  term ((199101626068546350813356242184626048441486 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2)]
]

/-- Partial product 342 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0342 : Poly :=
[
  term ((398203252137092701626712484369252096882972 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((398203252137092701626712484369252096882972 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-199101626068546350813356242184626048441486 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (14, 2)],
  term ((-199101626068546350813356242184626048441486 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0342_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0342
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0343 : Poly :=
[
  term ((1089199525273399215472 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 343 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0343 : Poly :=
[
  term ((2178399050546798430944 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((2178399050546798430944 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1089199525273399215472 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 2), (16, 1)],
  term ((-1089199525273399215472 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0343_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0343
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0344 : Poly :=
[
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(10, 1), (12, 1)]
]

/-- Partial product 344 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0344 : Poly :=
[
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(10, 1), (12, 1), (14, 2)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0344_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0344
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0345 : Poly :=
[
  term ((-123070128711554320479696420296953480406978042708689607074217047583314395394 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 345 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0345 : Poly :=
[
  term ((-246140257423108640959392840593906960813956085417379214148434095166628790788 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-246140257423108640959392840593906960813956085417379214148434095166628790788 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((123070128711554320479696420296953480406978042708689607074217047583314395394 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((123070128711554320479696420296953480406978042708689607074217047583314395394 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343) [(10, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0345_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0345
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0346 : Poly :=
[
  term ((-6261505127732503998544 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0346 : Poly :=
[
  term ((-12523010255465007997088 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12523010255465007997088 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6261505127732503998544 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6261505127732503998544 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0346_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0346
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0347 : Poly :=
[
  term ((44348197887089854397461559688789712755974 : Rat) / 79134349951295896336425736352731598571) [(10, 1), (12, 1), (13, 2)]
]

/-- Partial product 347 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0347 : Poly :=
[
  term ((88696395774179708794923119377579425511948 : Rat) / 79134349951295896336425736352731598571) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((88696395774179708794923119377579425511948 : Rat) / 79134349951295896336425736352731598571) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-44348197887089854397461559688789712755974 : Rat) / 79134349951295896336425736352731598571) [(10, 1), (12, 1), (13, 2), (14, 2)],
  term ((-44348197887089854397461559688789712755974 : Rat) / 79134349951295896336425736352731598571) [(10, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0347_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0347
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0348 : Poly :=
[
  term ((7323145018971463929824 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 348 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0348 : Poly :=
[
  term ((14646290037942927859648 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((14646290037942927859648 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7323145018971463929824 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-7323145018971463929824 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0348_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0348
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0349 : Poly :=
[
  term ((2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 349 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0349 : Poly :=
[
  term ((2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0349_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0349
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0350 : Poly :=
[
  term ((10998115966491984 : Rat) / 7342292683791569) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 350 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0350 : Poly :=
[
  term ((21996231932983968 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((21996231932983968 : Rat) / 7342292683791569) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10998115966491984 : Rat) / 7342292683791569) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-10998115966491984 : Rat) / 7342292683791569) [(10, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0350_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0350
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0351 : Poly :=
[
  term ((2473769883175997290962739337654824641094999759450571342874958294063666142589808776977 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 351 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0351 : Poly :=
[
  term ((2473769883175997290962739337654824641094999759450571342874958294063666142589808776977 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((2473769883175997290962739337654824641094999759450571342874958294063666142589808776977 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2473769883175997290962739337654824641094999759450571342874958294063666142589808776977 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2473769883175997290962739337654824641094999759450571342874958294063666142589808776977 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0351_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0351
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0352 : Poly :=
[
  term ((21249312915782502036857729 : Rat) / 505089662006121164582442) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0352 : Poly :=
[
  term ((21249312915782502036857729 : Rat) / 252544831003060582291221) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21249312915782502036857729 : Rat) / 252544831003060582291221) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21249312915782502036857729 : Rat) / 505089662006121164582442) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21249312915782502036857729 : Rat) / 505089662006121164582442) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0352_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0352
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0353 : Poly :=
[
  term ((-1204905467839520341087379511971490859502773761138569524768582311179267287215457993 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (13, 2)]
]

/-- Partial product 353 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0353 : Poly :=
[
  term ((-1204905467839520341087379511971490859502773761138569524768582311179267287215457993 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-1204905467839520341087379511971490859502773761138569524768582311179267287215457993 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((1204905467839520341087379511971490859502773761138569524768582311179267287215457993 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (13, 2), (14, 2)],
  term ((1204905467839520341087379511971490859502773761138569524768582311179267287215457993 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0353_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0353
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0354 : Poly :=
[
  term ((-52061372693765371302035953 : Rat) / 3788172465045908734368315) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 354 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0354 : Poly :=
[
  term ((-104122745387530742604071906 : Rat) / 3788172465045908734368315) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-104122745387530742604071906 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((52061372693765371302035953 : Rat) / 3788172465045908734368315) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((52061372693765371302035953 : Rat) / 3788172465045908734368315) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0354_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0354
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0355 : Poly :=
[
  term ((-8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(10, 1), (15, 2)]
]

/-- Partial product 355 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0355 : Poly :=
[
  term ((-8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(9, 1), (10, 1), (15, 3)],
  term ((8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(10, 1), (14, 2), (15, 2)],
  term ((8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0355_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0355
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0356 : Poly :=
[
  term ((-574354170564423016258 : Rat) / 32049107564750198685) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 356 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0356 : Poly :=
[
  term ((-1148708341128846032516 : Rat) / 32049107564750198685) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1148708341128846032516 : Rat) / 32049107564750198685) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((574354170564423016258 : Rat) / 32049107564750198685) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((574354170564423016258 : Rat) / 32049107564750198685) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0356_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0356
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0357 : Poly :=
[
  term ((15553245080203147299 : Rat) / 3561011951638910965) [(10, 1), (16, 1)]
]

/-- Partial product 357 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0357 : Poly :=
[
  term ((31106490160406294598 : Rat) / 3561011951638910965) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((31106490160406294598 : Rat) / 3561011951638910965) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-15553245080203147299 : Rat) / 3561011951638910965) [(10, 1), (14, 2), (16, 1)],
  term ((-15553245080203147299 : Rat) / 3561011951638910965) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0357_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0357
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0358 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (13, 1)]
]

/-- Partial product 358 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0358 : Poly :=
[
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (13, 1), (14, 2)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0358_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0358
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0359 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 359 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0359 : Poly :=
[
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0359_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0359
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0360 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 360 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0360 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0360_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0360
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0361 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0361 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0361_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0361
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0362 : Poly :=
[
  term ((11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(10, 2), (13, 1), (15, 1)]
]

/-- Partial product 362 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0362 : Poly :=
[
  term ((23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(10, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0362_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0362
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0363 : Poly :=
[
  term ((2575376191602437283392 : Rat) / 1859682113424599280495) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0363 : Poly :=
[
  term ((5150752383204874566784 : Rat) / 1859682113424599280495) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5150752383204874566784 : Rat) / 1859682113424599280495) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2575376191602437283392 : Rat) / 1859682113424599280495) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2575376191602437283392 : Rat) / 1859682113424599280495) [(10, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0363_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0363
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0364 : Poly :=
[
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (13, 2)]
]

/-- Partial product 364 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0364 : Poly :=
[
  term ((-271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (10, 2), (13, 2), (14, 1)],
  term ((-271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (13, 2), (14, 2)],
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0364_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0364
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0365 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (16, 1)]
]

/-- Partial product 365 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0365 : Poly :=
[
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (14, 2), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0365_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0365
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0366 : Poly :=
[
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (15, 2)]
]

/-- Partial product 366 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0366 : Poly :=
[
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 2), (14, 1), (15, 2)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(9, 1), (10, 2), (15, 3)],
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (14, 2), (15, 2)],
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0366_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0366
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0367 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 367 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0367 : Poly :=
[
  term ((-3852076819738752 : Rat) / 7342292683791569) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(10, 2), (14, 2), (15, 2), (16, 1)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(10, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0367_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0367
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0368 : Poly :=
[
  term ((-12530545683802187538606412678114424027984418787357057875442728095987 : Rat) / 9525435141133348831622156630846759066430930105249806928156723000) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 368 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0368 : Poly :=
[
  term ((-12530545683802187538606412678114424027984418787357057875442728095987 : Rat) / 4762717570566674415811078315423379533215465052624903464078361500) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12530545683802187538606412678114424027984418787357057875442728095987 : Rat) / 4762717570566674415811078315423379533215465052624903464078361500) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((12530545683802187538606412678114424027984418787357057875442728095987 : Rat) / 9525435141133348831622156630846759066430930105249806928156723000) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((12530545683802187538606412678114424027984418787357057875442728095987 : Rat) / 9525435141133348831622156630846759066430930105249806928156723000) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0368_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0368
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0369 : Poly :=
[
  term ((-38222244252953712064094 : Rat) / 1859682113424599280495) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 369 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0369 : Poly :=
[
  term ((-76444488505907424128188 : Rat) / 1859682113424599280495) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-76444488505907424128188 : Rat) / 1859682113424599280495) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((38222244252953712064094 : Rat) / 1859682113424599280495) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((38222244252953712064094 : Rat) / 1859682113424599280495) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0369_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0369
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0370 : Poly :=
[
  term ((76126227876487065476982407952438740289414025461290614545007190565802454933633 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 370 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0370 : Poly :=
[
  term ((76126227876487065476982407952438740289414025461290614545007190565802454933633 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((76126227876487065476982407952438740289414025461290614545007190565802454933633 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-76126227876487065476982407952438740289414025461290614545007190565802454933633 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-76126227876487065476982407952438740289414025461290614545007190565802454933633 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0370_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0370
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0371 : Poly :=
[
  term ((41581162310419071901648 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 371 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0371 : Poly :=
[
  term ((83162324620838143803296 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((83162324620838143803296 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-41581162310419071901648 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41581162310419071901648 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0371_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0371
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0372 : Poly :=
[
  term ((374727886496552313478565254258072711084402471797243821682235463230884661470328008467 : Rat) / 157498961201194000101127395894443789427093091223837971812147351914809834775808000) [(11, 1), (13, 1)]
]

/-- Partial product 372 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0372 : Poly :=
[
  term ((374727886496552313478565254258072711084402471797243821682235463230884661470328008467 : Rat) / 78749480600597000050563697947221894713546545611918985906073675957404917387904000) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((374727886496552313478565254258072711084402471797243821682235463230884661470328008467 : Rat) / 78749480600597000050563697947221894713546545611918985906073675957404917387904000) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-374727886496552313478565254258072711084402471797243821682235463230884661470328008467 : Rat) / 157498961201194000101127395894443789427093091223837971812147351914809834775808000) [(11, 1), (13, 1), (14, 2)],
  term ((-374727886496552313478565254258072711084402471797243821682235463230884661470328008467 : Rat) / 157498961201194000101127395894443789427093091223837971812147351914809834775808000) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0372_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0372
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0373 : Poly :=
[
  term ((-13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 373 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0373 : Poly :=
[
  term ((-13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0373_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0373
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0374 : Poly :=
[
  term ((-1844313665735946520146 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 374 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0374 : Poly :=
[
  term ((-3688627331471893040292 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3688627331471893040292 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1844313665735946520146 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1844313665735946520146 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0374_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0374
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0375 : Poly :=
[
  term ((89770158580447232943261253 : Rat) / 2164669980026233562496180) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 375 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0375 : Poly :=
[
  term ((89770158580447232943261253 : Rat) / 1082334990013116781248090) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((89770158580447232943261253 : Rat) / 1082334990013116781248090) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-89770158580447232943261253 : Rat) / 2164669980026233562496180) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-89770158580447232943261253 : Rat) / 2164669980026233562496180) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0375_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0375
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0376 : Poly :=
[
  term ((-607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 376 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0376 : Poly :=
[
  term ((-607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0376_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0376
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0377 : Poly :=
[
  term ((-38407320012911645237222 : Rat) / 13017774793972194963465) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0377 : Poly :=
[
  term ((-76814640025823290474444 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-76814640025823290474444 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((38407320012911645237222 : Rat) / 13017774793972194963465) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((38407320012911645237222 : Rat) / 13017774793972194963465) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0377_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0377
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0378 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 1), (13, 3)]
]

/-- Partial product 378 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0378 : Poly :=
[
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (11, 1), (13, 3), (14, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 1), (13, 3), (14, 2)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0378_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0378
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0379 : Poly :=
[
  term ((-7409467761977507508705941222372718458726889482127183450837073313994852545492944269073 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(11, 1), (15, 1)]
]

/-- Partial product 379 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0379 : Poly :=
[
  term ((-7409467761977507508705941222372718458726889482127183450837073313994852545492944269073 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7409467761977507508705941222372718458726889482127183450837073313994852545492944269073 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (11, 1), (15, 2)],
  term ((7409467761977507508705941222372718458726889482127183450837073313994852545492944269073 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(11, 1), (14, 2), (15, 1)],
  term ((7409467761977507508705941222372718458726889482127183450837073313994852545492944269073 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0379_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0379
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0380 : Poly :=
[
  term ((-50999453989532747259931207 : Rat) / 3788172465045908734368315) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 380 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0380 : Poly :=
[
  term ((-101998907979065494519862414 : Rat) / 3788172465045908734368315) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101998907979065494519862414 : Rat) / 3788172465045908734368315) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((50999453989532747259931207 : Rat) / 3788172465045908734368315) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((50999453989532747259931207 : Rat) / 3788172465045908734368315) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0380_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0380
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0381 : Poly :=
[
  term ((-631147189995078936974844905955438494488349186033317884772528658475442971180434329 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(11, 2)]
]

/-- Partial product 381 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0381 : Poly :=
[
  term ((-631147189995078936974844905955438494488349186033317884772528658475442971180434329 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (11, 2), (14, 1)],
  term ((-631147189995078936974844905955438494488349186033317884772528658475442971180434329 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (11, 2), (15, 1)],
  term ((631147189995078936974844905955438494488349186033317884772528658475442971180434329 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(11, 2), (14, 2)],
  term ((631147189995078936974844905955438494488349186033317884772528658475442971180434329 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0381_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0381
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0382 : Poly :=
[
  term ((-159863234671972336969915627692479591774711 : Rat) / 1099088193767998560228135227121272202375) [(11, 2), (12, 1)]
]

/-- Partial product 382 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0382 : Poly :=
[
  term ((-319726469343944673939831255384959183549422 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-319726469343944673939831255384959183549422 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((159863234671972336969915627692479591774711 : Rat) / 1099088193767998560228135227121272202375) [(11, 2), (12, 1), (14, 2)],
  term ((159863234671972336969915627692479591774711 : Rat) / 1099088193767998560228135227121272202375) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0382_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0382
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0383 : Poly :=
[
  term ((-111977620289214857096 : Rat) / 88556291115457108595) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 383 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0383 : Poly :=
[
  term ((-223955240578429714192 : Rat) / 88556291115457108595) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-223955240578429714192 : Rat) / 88556291115457108595) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((111977620289214857096 : Rat) / 88556291115457108595) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((111977620289214857096 : Rat) / 88556291115457108595) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0383_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0383
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0384 : Poly :=
[
  term ((-7434044414267422063483293160622842991657182859939581704151770724950143569 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 384 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0384 : Poly :=
[
  term ((-14868088828534844126966586321245685983314365719879163408303541449900287138 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-14868088828534844126966586321245685983314365719879163408303541449900287138 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((7434044414267422063483293160622842991657182859939581704151770724950143569 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((7434044414267422063483293160622842991657182859939581704151770724950143569 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0384_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0384
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0385 : Poly :=
[
  term ((12884386176752936295208 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0385 : Poly :=
[
  term ((25768772353505872590416 : Rat) / 4339258264657398321155) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25768772353505872590416 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-12884386176752936295208 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12884386176752936295208 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0385_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0385
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0386 : Poly :=
[
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 2), (13, 2)]
]

/-- Partial product 386 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0386 : Poly :=
[
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (11, 2), (13, 2), (14, 1)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 2), (13, 2), (14, 2)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0386_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0386
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0387 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (16, 1)]
]

/-- Partial product 387 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0387 : Poly :=
[
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (14, 2), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0387_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0387
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0388 : Poly :=
[
  term ((-16249291783079338193417917 : Rat) / 3788172465045908734368315) [(11, 2), (16, 1)]
]

/-- Partial product 388 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0388 : Poly :=
[
  term ((-32498583566158676386835834 : Rat) / 3788172465045908734368315) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-32498583566158676386835834 : Rat) / 3788172465045908734368315) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((16249291783079338193417917 : Rat) / 3788172465045908734368315) [(11, 2), (14, 2), (16, 1)],
  term ((16249291783079338193417917 : Rat) / 3788172465045908734368315) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0388_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0388
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0389 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1)]
]

/-- Partial product 389 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0389 : Poly :=
[
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 3), (13, 1), (14, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (14, 2)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0389_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0389
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0390 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (16, 1)]
]

/-- Partial product 390 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0390 : Poly :=
[
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (14, 2), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0390_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0390
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0391 : Poly :=
[
  term ((1948012991384122676958465930415943621593800539767996324844393277365271658702843 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(12, 1)]
]

/-- Partial product 391 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0391 : Poly :=
[
  term ((1948012991384122676958465930415943621593800539767996324844393277365271658702843 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(8, 1), (12, 1), (14, 1)],
  term ((1948012991384122676958465930415943621593800539767996324844393277365271658702843 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(9, 1), (12, 1), (15, 1)],
  term ((-1948012991384122676958465930415943621593800539767996324844393277365271658702843 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(12, 1), (14, 2)],
  term ((-1948012991384122676958465930415943621593800539767996324844393277365271658702843 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0391_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0391
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0392 : Poly :=
[
  term ((-144933512570526364763214731472244423877346960835143495255863344158220650628987 : Rat) / 101688817633010061625809594570601502144176542043093160600152059797842244640) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 392 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0392 : Poly :=
[
  term ((-144933512570526364763214731472244423877346960835143495255863344158220650628987 : Rat) / 50844408816505030812904797285300751072088271021546580300076029898921122320) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-144933512570526364763214731472244423877346960835143495255863344158220650628987 : Rat) / 50844408816505030812904797285300751072088271021546580300076029898921122320) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((144933512570526364763214731472244423877346960835143495255863344158220650628987 : Rat) / 101688817633010061625809594570601502144176542043093160600152059797842244640) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((144933512570526364763214731472244423877346960835143495255863344158220650628987 : Rat) / 101688817633010061625809594570601502144176542043093160600152059797842244640) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0392_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0392
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0393 : Poly :=
[
  term ((-397845735566594276263339 : Rat) / 26035549587944389926930) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0393 : Poly :=
[
  term ((-397845735566594276263339 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-397845735566594276263339 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((397845735566594276263339 : Rat) / 26035549587944389926930) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((397845735566594276263339 : Rat) / 26035549587944389926930) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0393_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0393
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0394 : Poly :=
[
  term ((269071851253413351314819357280581596340506545435697893703873084871 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 1), (13, 2)]
]

/-- Partial product 394 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0394 : Poly :=
[
  term ((269071851253413351314819357280581596340506545435697893703873084871 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((269071851253413351314819357280581596340506545435697893703873084871 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-269071851253413351314819357280581596340506545435697893703873084871 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 1), (13, 2), (14, 2)],
  term ((-269071851253413351314819357280581596340506545435697893703873084871 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0394_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0394
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0395 : Poly :=
[
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 395 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0395 : Poly :=
[
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0395_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0395
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0396 : Poly :=
[
  term ((36209773810506699920436131191401603753413679377849906073245669567785 : Rat) / 81296363278754079953424288721032746471676356912183567579969304768) [(12, 1), (15, 2)]
]

/-- Partial product 396 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0396 : Poly :=
[
  term ((36209773810506699920436131191401603753413679377849906073245669567785 : Rat) / 40648181639377039976712144360516373235838178456091783789984652384) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((36209773810506699920436131191401603753413679377849906073245669567785 : Rat) / 40648181639377039976712144360516373235838178456091783789984652384) [(9, 1), (12, 1), (15, 3)],
  term ((-36209773810506699920436131191401603753413679377849906073245669567785 : Rat) / 81296363278754079953424288721032746471676356912183567579969304768) [(12, 1), (14, 2), (15, 2)],
  term ((-36209773810506699920436131191401603753413679377849906073245669567785 : Rat) / 81296363278754079953424288721032746471676356912183567579969304768) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0396_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0396
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0397 : Poly :=
[
  term ((46990447596367011 : Rat) / 14684585367583138) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 397 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0397 : Poly :=
[
  term ((46990447596367011 : Rat) / 7342292683791569) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((46990447596367011 : Rat) / 7342292683791569) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-46990447596367011 : Rat) / 14684585367583138) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-46990447596367011 : Rat) / 14684585367583138) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0397_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0397
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0398 : Poly :=
[
  term ((-82264093169569866167 : Rat) / 28488095613111287720) [(12, 1), (16, 1)]
]

/-- Partial product 398 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0398 : Poly :=
[
  term ((-82264093169569866167 : Rat) / 14244047806555643860) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-82264093169569866167 : Rat) / 14244047806555643860) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((82264093169569866167 : Rat) / 28488095613111287720) [(12, 1), (14, 2), (16, 1)],
  term ((82264093169569866167 : Rat) / 28488095613111287720) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0398_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0398
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NYNYN_coefficient_21_0399 : Poly :=
[
  term ((-40671562239250281781283205489649247782486917106594693325388903475966861163132733585389 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(13, 1), (15, 1)]
]

/-- Partial product 399 for generator 21. -/
def rs_R009_ueqv_R009NYNYN_partial_21_0399 : Poly :=
[
  term ((-40671562239250281781283205489649247782486917106594693325388903475966861163132733585389 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-40671562239250281781283205489649247782486917106594693325388903475966861163132733585389 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (13, 1), (15, 2)],
  term ((40671562239250281781283205489649247782486917106594693325388903475966861163132733585389 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(13, 1), (14, 2), (15, 1)],
  term ((40671562239250281781283205489649247782486917106594693325388903475966861163132733585389 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 21. -/
theorem rs_R009_ueqv_R009NYNYN_partial_21_0399_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_21_0399
        rs_R009_ueqv_R009NYNYN_generator_21_0300_0399 =
      rs_R009_ueqv_R009NYNYN_partial_21_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_21_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_21_0300,
  rs_R009_ueqv_R009NYNYN_partial_21_0301,
  rs_R009_ueqv_R009NYNYN_partial_21_0302,
  rs_R009_ueqv_R009NYNYN_partial_21_0303,
  rs_R009_ueqv_R009NYNYN_partial_21_0304,
  rs_R009_ueqv_R009NYNYN_partial_21_0305,
  rs_R009_ueqv_R009NYNYN_partial_21_0306,
  rs_R009_ueqv_R009NYNYN_partial_21_0307,
  rs_R009_ueqv_R009NYNYN_partial_21_0308,
  rs_R009_ueqv_R009NYNYN_partial_21_0309,
  rs_R009_ueqv_R009NYNYN_partial_21_0310,
  rs_R009_ueqv_R009NYNYN_partial_21_0311,
  rs_R009_ueqv_R009NYNYN_partial_21_0312,
  rs_R009_ueqv_R009NYNYN_partial_21_0313,
  rs_R009_ueqv_R009NYNYN_partial_21_0314,
  rs_R009_ueqv_R009NYNYN_partial_21_0315,
  rs_R009_ueqv_R009NYNYN_partial_21_0316,
  rs_R009_ueqv_R009NYNYN_partial_21_0317,
  rs_R009_ueqv_R009NYNYN_partial_21_0318,
  rs_R009_ueqv_R009NYNYN_partial_21_0319,
  rs_R009_ueqv_R009NYNYN_partial_21_0320,
  rs_R009_ueqv_R009NYNYN_partial_21_0321,
  rs_R009_ueqv_R009NYNYN_partial_21_0322,
  rs_R009_ueqv_R009NYNYN_partial_21_0323,
  rs_R009_ueqv_R009NYNYN_partial_21_0324,
  rs_R009_ueqv_R009NYNYN_partial_21_0325,
  rs_R009_ueqv_R009NYNYN_partial_21_0326,
  rs_R009_ueqv_R009NYNYN_partial_21_0327,
  rs_R009_ueqv_R009NYNYN_partial_21_0328,
  rs_R009_ueqv_R009NYNYN_partial_21_0329,
  rs_R009_ueqv_R009NYNYN_partial_21_0330,
  rs_R009_ueqv_R009NYNYN_partial_21_0331,
  rs_R009_ueqv_R009NYNYN_partial_21_0332,
  rs_R009_ueqv_R009NYNYN_partial_21_0333,
  rs_R009_ueqv_R009NYNYN_partial_21_0334,
  rs_R009_ueqv_R009NYNYN_partial_21_0335,
  rs_R009_ueqv_R009NYNYN_partial_21_0336,
  rs_R009_ueqv_R009NYNYN_partial_21_0337,
  rs_R009_ueqv_R009NYNYN_partial_21_0338,
  rs_R009_ueqv_R009NYNYN_partial_21_0339,
  rs_R009_ueqv_R009NYNYN_partial_21_0340,
  rs_R009_ueqv_R009NYNYN_partial_21_0341,
  rs_R009_ueqv_R009NYNYN_partial_21_0342,
  rs_R009_ueqv_R009NYNYN_partial_21_0343,
  rs_R009_ueqv_R009NYNYN_partial_21_0344,
  rs_R009_ueqv_R009NYNYN_partial_21_0345,
  rs_R009_ueqv_R009NYNYN_partial_21_0346,
  rs_R009_ueqv_R009NYNYN_partial_21_0347,
  rs_R009_ueqv_R009NYNYN_partial_21_0348,
  rs_R009_ueqv_R009NYNYN_partial_21_0349,
  rs_R009_ueqv_R009NYNYN_partial_21_0350,
  rs_R009_ueqv_R009NYNYN_partial_21_0351,
  rs_R009_ueqv_R009NYNYN_partial_21_0352,
  rs_R009_ueqv_R009NYNYN_partial_21_0353,
  rs_R009_ueqv_R009NYNYN_partial_21_0354,
  rs_R009_ueqv_R009NYNYN_partial_21_0355,
  rs_R009_ueqv_R009NYNYN_partial_21_0356,
  rs_R009_ueqv_R009NYNYN_partial_21_0357,
  rs_R009_ueqv_R009NYNYN_partial_21_0358,
  rs_R009_ueqv_R009NYNYN_partial_21_0359,
  rs_R009_ueqv_R009NYNYN_partial_21_0360,
  rs_R009_ueqv_R009NYNYN_partial_21_0361,
  rs_R009_ueqv_R009NYNYN_partial_21_0362,
  rs_R009_ueqv_R009NYNYN_partial_21_0363,
  rs_R009_ueqv_R009NYNYN_partial_21_0364,
  rs_R009_ueqv_R009NYNYN_partial_21_0365,
  rs_R009_ueqv_R009NYNYN_partial_21_0366,
  rs_R009_ueqv_R009NYNYN_partial_21_0367,
  rs_R009_ueqv_R009NYNYN_partial_21_0368,
  rs_R009_ueqv_R009NYNYN_partial_21_0369,
  rs_R009_ueqv_R009NYNYN_partial_21_0370,
  rs_R009_ueqv_R009NYNYN_partial_21_0371,
  rs_R009_ueqv_R009NYNYN_partial_21_0372,
  rs_R009_ueqv_R009NYNYN_partial_21_0373,
  rs_R009_ueqv_R009NYNYN_partial_21_0374,
  rs_R009_ueqv_R009NYNYN_partial_21_0375,
  rs_R009_ueqv_R009NYNYN_partial_21_0376,
  rs_R009_ueqv_R009NYNYN_partial_21_0377,
  rs_R009_ueqv_R009NYNYN_partial_21_0378,
  rs_R009_ueqv_R009NYNYN_partial_21_0379,
  rs_R009_ueqv_R009NYNYN_partial_21_0380,
  rs_R009_ueqv_R009NYNYN_partial_21_0381,
  rs_R009_ueqv_R009NYNYN_partial_21_0382,
  rs_R009_ueqv_R009NYNYN_partial_21_0383,
  rs_R009_ueqv_R009NYNYN_partial_21_0384,
  rs_R009_ueqv_R009NYNYN_partial_21_0385,
  rs_R009_ueqv_R009NYNYN_partial_21_0386,
  rs_R009_ueqv_R009NYNYN_partial_21_0387,
  rs_R009_ueqv_R009NYNYN_partial_21_0388,
  rs_R009_ueqv_R009NYNYN_partial_21_0389,
  rs_R009_ueqv_R009NYNYN_partial_21_0390,
  rs_R009_ueqv_R009NYNYN_partial_21_0391,
  rs_R009_ueqv_R009NYNYN_partial_21_0392,
  rs_R009_ueqv_R009NYNYN_partial_21_0393,
  rs_R009_ueqv_R009NYNYN_partial_21_0394,
  rs_R009_ueqv_R009NYNYN_partial_21_0395,
  rs_R009_ueqv_R009NYNYN_partial_21_0396,
  rs_R009_ueqv_R009NYNYN_partial_21_0397,
  rs_R009_ueqv_R009NYNYN_partial_21_0398,
  rs_R009_ueqv_R009NYNYN_partial_21_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_21_0300_0399 : Poly :=
[
  term ((-3212369113695179731909880742495969676025072 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((21023001604841859632896 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-148688092665650704771118708400232050842564023 : Rat) / 118701524926943844504638604529097397856500) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((67394996269849911995828 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((322921810251467337033023905673489265388262704283502004108743159796170001833607 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10027805481205027688433 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47495310502075141461027630577217169359273571623316076238788715438668968763609937971 : Rat) / 78749480600597000050563697947221894713546545611918985906073675957404917387904000) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2363043510513632862620 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20845154412898502508222797 : Rat) / 398754996320621972038770) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((633613831111614260776214942063585846815223207080464498764861027 : Rat) / 2189755204858241110717737156516496337110558644885013086932580) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 1), (13, 3), (14, 1)],
  term ((116325098249183528633447299453565031280110521621158411451600772829776925161412093 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((41289800606509735793954393 : Rat) / 7576344930091817468736630) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((270717351711985905071404057304124039761086938603613764839606059925570431330323379 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 2), (14, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 2), (14, 1), (15, 2)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((37247101783742095597334399 : Rat) / 7576344930091817468736630) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-60701681303084549451333847562094697256288 : Rat) / 73272546251199904015209015141418146825) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2477781999132432592128 : Rat) / 123978807561639952033) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13978704078560232536319841200113289785884161971196950102732843909341 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((166690382999781712256 : Rat) / 65415953738553743535) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-157633536390654371916498387561929040646845374022143409457349878993183441567 : Rat) / 3923179692631561019514259049791724619759897455366248479944138109484654500) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((3331786327916421607788 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((398203252137092701626712484369252096882972 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((2178399050546798430944 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-246140257423108640959392840593906960813956085417379214148434095166628790788 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12523010255465007997088 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((88696395774179708794923119377579425511948 : Rat) / 79134349951295896336425736352731598571) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((14646290037942927859648 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((21996231932983968 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2473769883175997290962739337654824641094999759450571342874958294063666142589808776977 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((21249312915782502036857729 : Rat) / 252544831003060582291221) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1204905467839520341087379511971490859502773761138569524768582311179267287215457993 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-104122745387530742604071906 : Rat) / 3788172465045908734368315) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((155322156933407842136245252054323324976561932319510780183737049970173774991 : Rat) / 397385334031186952178047218727913889690675997910708155141702101274352000) [(8, 1), (10, 1), (14, 1)],
  term ((-8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1148708341128846032516 : Rat) / 32049107564750198685) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((31106490160406294598 : Rat) / 3561011951638910965) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 2), (11, 1), (13, 1), (14, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((5150752383204874566784 : Rat) / 1859682113424599280495) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (10, 2), (13, 2), (14, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 2), (14, 1), (15, 2)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-12530545683802187538606412678114424027984418787357057875442728095987 : Rat) / 4762717570566674415811078315423379533215465052624903464078361500) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-76444488505907424128188 : Rat) / 1859682113424599280495) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((76126227876487065476982407952438740289414025461290614545007190565802454933633 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((83162324620838143803296 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((374727886496552313478565254258072711084402471797243821682235463230884661470328008467 : Rat) / 78749480600597000050563697947221894713546545611918985906073675957404917387904000) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3688627331471893040292 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((89770158580447232943261253 : Rat) / 1082334990013116781248090) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-76814640025823290474444 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (11, 1), (13, 3), (14, 1)],
  term ((-7409467761977507508705941222372718458726889482127183450837073313994852545492944269073 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-101998907979065494519862414 : Rat) / 3788172465045908734368315) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-319726469343944673939831255384959183549422 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-223955240578429714192 : Rat) / 88556291115457108595) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-14868088828534844126966586321245685983314365719879163408303541449900287138 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((25768772353505872590416 : Rat) / 4339258264657398321155) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (11, 2), (13, 2), (14, 1)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-631147189995078936974844905955438494488349186033317884772528658475442971180434329 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (11, 2), (14, 1)],
  term ((-32498583566158676386835834 : Rat) / 3788172465045908734368315) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 3), (13, 1), (14, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-144933512570526364763214731472244423877346960835143495255863344158220650628987 : Rat) / 50844408816505030812904797285300751072088271021546580300076029898921122320) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-397845735566594276263339 : Rat) / 13017774793972194963465) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((269071851253413351314819357280581596340506545435697893703873084871 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1948012991384122676958465930415943621593800539767996324844393277365271658702843 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(8, 1), (12, 1), (14, 1)],
  term ((36209773810506699920436131191401603753413679377849906073245669567785 : Rat) / 40648181639377039976712144360516373235838178456091783789984652384) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((46990447596367011 : Rat) / 7342292683791569) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82264093169569866167 : Rat) / 14244047806555643860) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-40671562239250281781283205489649247782486917106594693325388903475966861163132733585389 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-60701681303084549451333847562094697256288 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2477781999132432592128 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13978704078560232536319841200113289785884161971196950102732843909341 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((166690382999781712256 : Rat) / 65415953738553743535) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157633536390654371916498387561929040646845374022143409457349878993183441567 : Rat) / 3923179692631561019514259049791724619759897455366248479944138109484654500) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((3331786327916421607788 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((398203252137092701626712484369252096882972 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2178399050546798430944 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-246140257423108640959392840593906960813956085417379214148434095166628790788 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-12523010255465007997088 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((88696395774179708794923119377579425511948 : Rat) / 79134349951295896336425736352731598571) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((14646290037942927859648 : Rat) / 867851652931479664231) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((21996231932983968 : Rat) / 7342292683791569) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((2473769883175997290962739337654824641094999759450571342874958294063666142589808776977 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((21249312915782502036857729 : Rat) / 252544831003060582291221) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1204905467839520341087379511971490859502773761138569524768582311179267287215457993 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-104122745387530742604071906 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((155322156933407842136245252054323324976561932319510780183737049970173774991 : Rat) / 397385334031186952178047218727913889690675997910708155141702101274352000) [(9, 1), (10, 1), (15, 1)],
  term ((31106490160406294598 : Rat) / 3561011951638910965) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(9, 1), (10, 1), (15, 3)],
  term ((-1148708341128846032516 : Rat) / 32049107564750198685) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((23874605587322585525884960895713394243095120526781137277167307978594108112 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((5150752383204874566784 : Rat) / 1859682113424599280495) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(9, 1), (10, 2), (15, 3)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-12530545683802187538606412678114424027984418787357057875442728095987 : Rat) / 4762717570566674415811078315423379533215465052624903464078361500) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-76444488505907424128188 : Rat) / 1859682113424599280495) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((76126227876487065476982407952438740289414025461290614545007190565802454933633 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((83162324620838143803296 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((374727886496552313478565254258072711084402471797243821682235463230884661470328008467 : Rat) / 78749480600597000050563697947221894713546545611918985906073675957404917387904000) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((89770158580447232943261253 : Rat) / 1082334990013116781248090) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-3688627331471893040292 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-76814640025823290474444 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((-7409467761977507508705941222372718458726889482127183450837073313994852545492944269073 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (11, 1), (15, 2)],
  term ((-101998907979065494519862414 : Rat) / 3788172465045908734368315) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-319726469343944673939831255384959183549422 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-223955240578429714192 : Rat) / 88556291115457108595) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1606184556847589865954940371247984838012536 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((-10511500802420929816448 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((2179610221583563253424 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-631147189995078936974844905955438494488349186033317884772528658475442971180434329 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (11, 2), (15, 1)],
  term ((-32498583566158676386835834 : Rat) / 3788172465045908734368315) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (15, 3)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((148688092665650704771118708400232050842564023 : Rat) / 237403049853887689009277209058194795713000) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-33697498134924955997914 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-148801461199051416772002592975375409211087892930914369199685905522159014179903 : Rat) / 66900537916453987911716838533290461936958251344140237236942144603843582000) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-431543233701519232261253 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((269071851253413351314819357280581596340506545435697893703873084871 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-322921810251467337033023905673489265388262704283502004108743159796170001833607 : Rat) / 847406813608417180215079954755012517868137850359109671667933831648685372000) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((10027805481205027688433 : Rat) / 8678516529314796642310) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1948012991384122676958465930415943621593800539767996324844393277365271658702843 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(9, 1), (12, 1), (15, 1)],
  term ((-82264093169569866167 : Rat) / 14244047806555643860) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((71992661334760087351094647219982761740543467258418015120619016492499493702003 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(9, 1), (12, 1), (15, 3)],
  term ((65570044635634871020323 : Rat) / 8678516529314796642310) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((47495310502075141461027630577217169359273571623316076238788715438668968763609937971 : Rat) / 157498961201194000101127395894443789427093091223837971812147351914809834775808000) [(9, 1), (13, 1), (14, 2)],
  term ((13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((1181521755256816431310 : Rat) / 867851652931479664231) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((20845154412898502508222797 : Rat) / 797509992641243944077540) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3834429202464859984969285159136560648388251209705220558968825641947208169371584662481 : Rat) / 771744909885850600495524239882774568192756146996806061879522024382568190401459200) [(9, 1), (13, 1), (15, 2)],
  term ((20845154412898502508222797 : Rat) / 797509992641243944077540) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 1), (13, 1), (15, 4)],
  term ((1181521755256816431310 : Rat) / 867851652931479664231) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-633613831111614260776214942063585846815223207080464498764861027 : Rat) / 4379510409716482221435474313032992674221117289770026173865160) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-633613831111614260776214942063585846815223207080464498764861027 : Rat) / 4379510409716482221435474313032992674221117289770026173865160) [(9, 1), (13, 2), (15, 3)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (13, 3), (14, 2)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (13, 3), (15, 2)],
  term ((-116325098249183528633447299453565031280110521621158411451600772829776925161412093 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (14, 2), (15, 1)],
  term ((-41289800606509735793954393 : Rat) / 15152689860183634937473260) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 1), (14, 2), (15, 3)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((-116325098249183528633447299453565031280110521621158411451600772829776925161412093 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (15, 3)],
  term ((-41289800606509735793954393 : Rat) / 15152689860183634937473260) [(9, 1), (15, 3), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 1), (15, 5)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(9, 1), (15, 5), (16, 1)],
  term ((122766201736782921383248439727255513889582 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (14, 2)],
  term ((-417728389971334622304 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (14, 2), (16, 1)],
  term ((122766201736782921383248439727255513889582 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (15, 2)],
  term ((-417728389971334622304 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (15, 3)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-3212369113695179731909880742495969676025072 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((21023001604841859632896 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (15, 2)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-148688092665650704771118708400232050842564023 : Rat) / 118701524926943844504638604529097397856500) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((67394996269849911995828 : Rat) / 13017774793972194963465) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (12, 1), (14, 2)],
  term ((1454779553155439633106 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((10503738374441229133133033097698020733511465026976642667608746796357491409097 : Rat) / 14610462303593399658880688875086422721864445695846718477033341924977334000) [(9, 2), (12, 1), (15, 2)],
  term ((-8573025928049588055327 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-47495310502075141461027630577217169359273571623316076238788715438668968763609937971 : Rat) / 78749480600597000050563697947221894713546545611918985906073675957404917387904000) [(9, 2), (13, 1), (15, 1)],
  term ((-20845154412898502508222797 : Rat) / 398754996320621972038770) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14284479043880034176102031142464898309128770469467120113809762791390748697 : Rat) / 4237034068042085901075399773775062589340689251795548358339669158243426860) [(9, 2), (13, 1), (15, 3)],
  term ((-1977893179237087535338 : Rat) / 619894037808199760165) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((633613831111614260776214942063585846815223207080464498764861027 : Rat) / 2189755204858241110717737156516496337110558644885013086932580) [(9, 2), (13, 2), (15, 2)],
  term ((18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (13, 3), (15, 1)],
  term ((-270717351711985905071404057304124039761086938603613764839606059925570431330323379 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 2), (14, 2)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(9, 2), (14, 2), (15, 2)],
  term ((1015017351045724217133 : Rat) / 4339258264657398321155) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-37247101783742095597334399 : Rat) / 15152689860183634937473260) [(9, 2), (14, 2), (16, 1)],
  term ((-2003534484927307779184708336683893536887678703226154838758132329790346368815747 : Rat) / 155744452269504883858476800105500195389238809129158472287601312637747858896000) [(9, 2), (15, 2)],
  term ((2385921022593546104767073 : Rat) / 797509992641243944077540) [(9, 2), (15, 2), (16, 1)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 2), (15, 4)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(9, 2), (15, 4), (16, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (10, 1), (15, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (15, 2)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(9, 3), (12, 1), (15, 1)],
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 3), (13, 1), (15, 2)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((270717351711985905071404057304124039761086938603613764839606059925570431330323379 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 3), (15, 1)],
  term ((37247101783742095597334399 : Rat) / 7576344930091817468736630) [(9, 3), (15, 1), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 3), (15, 3)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 3), (15, 3), (16, 1)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((30350840651542274725666923781047348628144 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1238890999566216296064 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15175420325771137362833461890523674314072 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-619445499783108148032 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15175420325771137362833461890523674314072 : Rat) / 73272546251199904015209015141418146825) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-619445499783108148032 : Rat) / 123978807561639952033) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((13978704078560232536319841200113289785884161971196950102732843909341 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-83345191499890856128 : Rat) / 65415953738553743535) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((13978704078560232536319841200113289785884161971196950102732843909341 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-83345191499890856128 : Rat) / 65415953738553743535) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((157633536390654371916498387561929040646845374022143409457349878993183441567 : Rat) / 7846359385263122039028518099583449239519794910732496959888276218969309000) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1665893163958210803894 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((157633536390654371916498387561929040646845374022143409457349878993183441567 : Rat) / 7846359385263122039028518099583449239519794910732496959888276218969309000) [(10, 1), (11, 1), (15, 3)],
  term ((-1665893163958210803894 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-199101626068546350813356242184626048441486 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (14, 2)],
  term ((-1089199525273399215472 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (14, 2), (16, 1)],
  term ((-199101626068546350813356242184626048441486 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 2), (15, 2)],
  term ((-1089199525273399215472 : Rat) / 619894037808199760165) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((123070128711554320479696420296953480406978042708689607074217047583314395394 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((6261505127732503998544 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((123070128711554320479696420296953480406978042708689607074217047583314395394 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((6261505127732503998544 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-44348197887089854397461559688789712755974 : Rat) / 79134349951295896336425736352731598571) [(10, 1), (12, 1), (13, 2), (14, 2)],
  term ((-7323145018971463929824 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-44348197887089854397461559688789712755974 : Rat) / 79134349951295896336425736352731598571) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-7323145018971463929824 : Rat) / 867851652931479664231) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(10, 1), (12, 1), (14, 2)],
  term ((-2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-10998115966491984 : Rat) / 7342292683791569) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 73144122068565168275232132022233738601204849100226) [(10, 1), (12, 1), (15, 2)],
  term ((-2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(10, 1), (12, 1), (15, 4)],
  term ((-10998115966491984 : Rat) / 7342292683791569) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((-2473769883175997290962739337654824641094999759450571342874958294063666142589808776977 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-21249312915782502036857729 : Rat) / 505089662006121164582442) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2473769883175997290962739337654824641094999759450571342874958294063666142589808776977 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(10, 1), (13, 1), (15, 3)],
  term ((-21249312915782502036857729 : Rat) / 505089662006121164582442) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1204905467839520341087379511971490859502773761138569524768582311179267287215457993 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (13, 2), (14, 2)],
  term ((52061372693765371302035953 : Rat) / 3788172465045908734368315) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((1204905467839520341087379511971490859502773761138569524768582311179267287215457993 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(10, 1), (13, 2), (15, 2)],
  term ((52061372693765371302035953 : Rat) / 3788172465045908734368315) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-155322156933407842136245252054323324976561932319510780183737049970173774991 : Rat) / 794770668062373904356094437455827779381351995821416310283404202548704000) [(10, 1), (14, 2)],
  term ((8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(10, 1), (14, 2), (15, 2)],
  term ((574354170564423016258 : Rat) / 32049107564750198685) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-15553245080203147299 : Rat) / 3561011951638910965) [(10, 1), (14, 2), (16, 1)],
  term ((-155322156933407842136245252054323324976561932319510780183737049970173774991 : Rat) / 794770668062373904356094437455827779381351995821416310283404202548704000) [(10, 1), (15, 2)],
  term ((-15553245080203147299 : Rat) / 3561011951638910965) [(10, 1), (15, 2), (16, 1)],
  term ((8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(10, 1), (15, 4)],
  term ((574354170564423016258 : Rat) / 32049107564750198685) [(10, 1), (15, 4), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (13, 1), (14, 2)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(10, 2), (11, 1), (15, 3)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2575376191602437283392 : Rat) / 1859682113424599280495) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11937302793661292762942480447856697121547560263390568638583653989297054056 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(10, 2), (13, 1), (15, 3)],
  term ((-2575376191602437283392 : Rat) / 1859682113424599280495) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (13, 2), (14, 2)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (14, 2), (16, 1)],
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(10, 2), (13, 2), (15, 2)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (14, 2), (15, 2)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(10, 2), (14, 2), (15, 2), (16, 1)],
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(10, 2), (15, 4)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(10, 2), (15, 4), (16, 1)],
  term ((12530545683802187538606412678114424027984418787357057875442728095987 : Rat) / 9525435141133348831622156630846759066430930105249806928156723000) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((38222244252953712064094 : Rat) / 1859682113424599280495) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((12530545683802187538606412678114424027984418787357057875442728095987 : Rat) / 9525435141133348831622156630846759066430930105249806928156723000) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((38222244252953712064094 : Rat) / 1859682113424599280495) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-76126227876487065476982407952438740289414025461290614545007190565802454933633 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-41581162310419071901648 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-76126227876487065476982407952438740289414025461290614545007190565802454933633 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (12, 1), (15, 3)],
  term ((-41581162310419071901648 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-374727886496552313478565254258072711084402471797243821682235463230884661470328008467 : Rat) / 157498961201194000101127395894443789427093091223837971812147351914809834775808000) [(11, 1), (13, 1), (14, 2)],
  term ((13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((1844313665735946520146 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-89770158580447232943261253 : Rat) / 2164669980026233562496180) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-374727886496552313478565254258072711084402471797243821682235463230884661470328008467 : Rat) / 157498961201194000101127395894443789427093091223837971812147351914809834775808000) [(11, 1), (13, 1), (15, 2)],
  term ((-89770158580447232943261253 : Rat) / 2164669980026233562496180) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(11, 1), (13, 1), (15, 4)],
  term ((1844313665735946520146 : Rat) / 4339258264657398321155) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((38407320012911645237222 : Rat) / 13017774793972194963465) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(11, 1), (13, 2), (15, 3)],
  term ((38407320012911645237222 : Rat) / 13017774793972194963465) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 1), (13, 3), (14, 2)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(11, 1), (13, 3), (15, 2)],
  term ((7409467761977507508705941222372718458726889482127183450837073313994852545492944269073 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(11, 1), (14, 2), (15, 1)],
  term ((50999453989532747259931207 : Rat) / 3788172465045908734368315) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((7409467761977507508705941222372718458726889482127183450837073313994852545492944269073 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(11, 1), (15, 3)],
  term ((50999453989532747259931207 : Rat) / 3788172465045908734368315) [(11, 1), (15, 3), (16, 1)],
  term ((159863234671972336969915627692479591774711 : Rat) / 1099088193767998560228135227121272202375) [(11, 2), (12, 1), (14, 2)],
  term ((111977620289214857096 : Rat) / 88556291115457108595) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((159863234671972336969915627692479591774711 : Rat) / 1099088193767998560228135227121272202375) [(11, 2), (12, 1), (15, 2)],
  term ((111977620289214857096 : Rat) / 88556291115457108595) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((7434044414267422063483293160622842991657182859939581704151770724950143569 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-12884386176752936295208 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7434044414267422063483293160622842991657182859939581704151770724950143569 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(11, 2), (13, 1), (15, 3)],
  term ((-12884386176752936295208 : Rat) / 4339258264657398321155) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 2), (13, 2), (14, 2)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (14, 2), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(11, 2), (13, 2), (15, 2)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((631147189995078936974844905955438494488349186033317884772528658475442971180434329 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(11, 2), (14, 2)],
  term ((16249291783079338193417917 : Rat) / 3788172465045908734368315) [(11, 2), (14, 2), (16, 1)],
  term ((631147189995078936974844905955438494488349186033317884772528658475442971180434329 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(11, 2), (15, 2)],
  term ((16249291783079338193417917 : Rat) / 3788172465045908734368315) [(11, 2), (15, 2), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (14, 2)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (14, 2), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(11, 3), (13, 1), (15, 2)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((144933512570526364763214731472244423877346960835143495255863344158220650628987 : Rat) / 101688817633010061625809594570601502144176542043093160600152059797842244640) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((397845735566594276263339 : Rat) / 26035549587944389926930) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((144933512570526364763214731472244423877346960835143495255863344158220650628987 : Rat) / 101688817633010061625809594570601502144176542043093160600152059797842244640) [(12, 1), (13, 1), (15, 3)],
  term ((397845735566594276263339 : Rat) / 26035549587944389926930) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-269071851253413351314819357280581596340506545435697893703873084871 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 1), (13, 2), (14, 2)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-269071851253413351314819357280581596340506545435697893703873084871 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 1), (13, 2), (15, 2)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1948012991384122676958465930415943621593800539767996324844393277365271658702843 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(12, 1), (14, 2)],
  term ((-36209773810506699920436131191401603753413679377849906073245669567785 : Rat) / 81296363278754079953424288721032746471676356912183567579969304768) [(12, 1), (14, 2), (15, 2)],
  term ((-46990447596367011 : Rat) / 14684585367583138) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((82264093169569866167 : Rat) / 28488095613111287720) [(12, 1), (14, 2), (16, 1)],
  term ((-1948012991384122676958465930415943621593800539767996324844393277365271658702843 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(12, 1), (15, 2)],
  term ((82264093169569866167 : Rat) / 28488095613111287720) [(12, 1), (15, 2), (16, 1)],
  term ((-36209773810506699920436131191401603753413679377849906073245669567785 : Rat) / 81296363278754079953424288721032746471676356912183567579969304768) [(12, 1), (15, 4)],
  term ((-46990447596367011 : Rat) / 14684585367583138) [(12, 1), (15, 4), (16, 1)],
  term ((40671562239250281781283205489649247782486917106594693325388903475966861163132733585389 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(13, 1), (14, 2), (15, 1)],
  term ((40671562239250281781283205489649247782486917106594693325388903475966861163132733585389 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NYNYN_block_21_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_21_0300_0399
      rs_R009_ueqv_R009NYNYN_block_21_0300_0399 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
