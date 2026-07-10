/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1500-1599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1500 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1500 : Poly :=
[
  term ((-1278871982648117439859095448076099120671183 : Rat) / 79134349951295896336425736352731598571000) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 1500 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1500 : Poly :=
[
  term ((-1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((1278871982648117439859095448076099120671183 : Rat) / 79134349951295896336425736352731598571000) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1500 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1500_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1500
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1500 := by
  native_decide

/-- Coefficient term 1501 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1501 : Poly :=
[
  term ((543941580350881503222 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1501 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1501 : Poly :=
[
  term ((1087883160701763006444 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-543941580350881503222 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1501 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1501_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1501
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1501 := by
  native_decide

/-- Coefficient term 1502 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1502 : Poly :=
[
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 2), (10, 1)]
]

/-- Partial product 1502 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1502 : Poly :=
[
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 2), (10, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1502 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1502_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1502
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1502 := by
  native_decide

/-- Coefficient term 1503 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1503 : Poly :=
[
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(3, 2), (10, 1), (12, 1)]
]

/-- Partial product 1503 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1503 : Poly :=
[
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(3, 2), (10, 1), (12, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 1043136501831865749467373949160773960438024494515608907246968015845174000) [(3, 2), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1503 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1503_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1503
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1503 := by
  native_decide

/-- Coefficient term 1504 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1504 : Poly :=
[
  term ((12905143960765312684 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1504 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1504 : Poly :=
[
  term ((25810287921530625368 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1504 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1504_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1504
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1504 := by
  native_decide

/-- Coefficient term 1505 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1505 : Poly :=
[
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 2), (10, 1), (14, 1)]
]

/-- Partial product 1505 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1505 : Poly :=
[
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(3, 2), (10, 1), (14, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(3, 2), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1505 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1505_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1505
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1505 := by
  native_decide

/-- Coefficient term 1506 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1506 : Poly :=
[
  term ((-6452571980382656342 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1506 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1506 : Poly :=
[
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1506 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1506_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1506
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1506 := by
  native_decide

/-- Coefficient term 1507 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1507 : Poly :=
[
  term ((-3226285990191328171 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (16, 1)]
]

/-- Partial product 1507 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1507 : Poly :=
[
  term ((-6452571980382656342 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((3226285990191328171 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1507 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1507_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1507
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1507 := by
  native_decide

/-- Coefficient term 1508 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1508 : Poly :=
[
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1508 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1508 : Poly :=
[
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1508 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1508_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1508
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1508 := by
  native_decide

/-- Coefficient term 1509 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1509 : Poly :=
[
  term ((8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1509 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1509 : Poly :=
[
  term ((16796938381458824653536 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1509 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1509_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1509
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1509 := by
  native_decide

/-- Coefficient term 1510 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1510 : Poly :=
[
  term ((163691816024574365805547320622062448980321122964552911750737929774628123522 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1510 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1510 : Poly :=
[
  term ((327383632049148731611094641244124897960642245929105823501475859549256247044 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-163691816024574365805547320622062448980321122964552911750737929774628123522 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1510 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1510_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1510
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1510 := by
  native_decide

/-- Coefficient term 1511 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1511 : Poly :=
[
  term ((8950569911808704948656 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1511 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1511 : Poly :=
[
  term ((17901139823617409897312 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8950569911808704948656 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1511 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1511_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1511
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1511 := by
  native_decide

/-- Coefficient term 1512 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1512 : Poly :=
[
  term ((-251566752052309965381203575237721978345929126158885340941958384 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (13, 1)]
]

/-- Partial product 1512 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1512 : Poly :=
[
  term ((251566752052309965381203575237721978345929126158885340941958384 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (13, 1)],
  term ((-503133504104619930762407150475443956691858252317770681883916768 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1512 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1512_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1512
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1512 := by
  native_decide

/-- Coefficient term 1513 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1513 : Poly :=
[
  term ((-503133504104619930762407150475443956691858252317770681883916768 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1513 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1513 : Poly :=
[
  term ((503133504104619930762407150475443956691858252317770681883916768 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1513 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1513_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1513
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1513 := by
  native_decide

/-- Coefficient term 1514 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1514 : Poly :=
[
  term ((-4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1514 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1514 : Poly :=
[
  term ((4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1514 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1514_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1514
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1514 := by
  native_decide

/-- Coefficient term 1515 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1515 : Poly :=
[
  term ((-2099617297682353081692 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1515 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1515 : Poly :=
[
  term ((-4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2099617297682353081692 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1515 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1515_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1515
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1515 := by
  native_decide

/-- Coefficient term 1516 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1516 : Poly :=
[
  term ((-81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1516 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1516 : Poly :=
[
  term ((81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-163691816024574365805547320622062448980321122964552911750737929774628123522 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1516 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1516_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1516
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1516 := by
  native_decide

/-- Coefficient term 1517 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1517 : Poly :=
[
  term ((-4475284955904352474328 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1517 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1517 : Poly :=
[
  term ((4475284955904352474328 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8950569911808704948656 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1517 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1517_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1517
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1517 := by
  native_decide

/-- Coefficient term 1518 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1518 : Poly :=
[
  term ((-81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(3, 2), (11, 1), (15, 1)]
]

/-- Partial product 1518 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1518 : Poly :=
[
  term ((-81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1518 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1518_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1518
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1518 := by
  native_decide

/-- Coefficient term 1519 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1519 : Poly :=
[
  term ((-2237642477952176237164 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1519 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1519 : Poly :=
[
  term ((-4475284955904352474328 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2237642477952176237164 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1519 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1519_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1519
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1519 := by
  native_decide

/-- Coefficient term 1520 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1520 : Poly :=
[
  term ((-3871943576043257570909536848399176327966 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2)]
]

/-- Partial product 1520 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1520 : Poly :=
[
  term ((3871943576043257570909536848399176327966 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2)],
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1520 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1520_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1520
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1520 := by
  native_decide

/-- Coefficient term 1521 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1521 : Poly :=
[
  term ((15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (12, 1)]
]

/-- Partial product 1521 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1521 : Poly :=
[
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (12, 1)],
  term ((30975548608346060567276294787193410623728 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1521 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1521_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1521
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1521 := by
  native_decide

/-- Coefficient term 1522 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1522 : Poly :=
[
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1522 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1522 : Poly :=
[
  term ((-2841617327957868640896 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1522 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1522_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1522
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1522 := by
  native_decide

/-- Coefficient term 1523 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1523 : Poly :=
[
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (14, 1)]
]

/-- Partial product 1523 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1523 : Poly :=
[
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (14, 1)],
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1523 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1523_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1523
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1523 := by
  native_decide

/-- Coefficient term 1524 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1524 : Poly :=
[
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1524 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1524 : Poly :=
[
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1524 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1524_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1524
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1524 := by
  native_decide

/-- Coefficient term 1525 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1525 : Poly :=
[
  term ((355202165994733580112 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (16, 1)]
]

/-- Partial product 1525 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1525 : Poly :=
[
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((-355202165994733580112 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1525 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1525_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1525
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1525 := by
  native_decide

/-- Coefficient term 1526 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1526 : Poly :=
[
  term ((9256664952405331422293638796687654336111051793607383082281188262653025299705777 : Rat) / 5440999993555011749221822518822596977644735763393416060200185170648427584000) [(3, 2), (12, 1)]
]

/-- Partial product 1526 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1526 : Poly :=
[
  term ((-9256664952405331422293638796687654336111051793607383082281188262653025299705777 : Rat) / 5440999993555011749221822518822596977644735763393416060200185170648427584000) [(3, 2), (12, 1)],
  term ((9256664952405331422293638796687654336111051793607383082281188262653025299705777 : Rat) / 2720499996777505874610911259411298488822367881696708030100092585324213792000) [(3, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1526 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1526_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1526
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1526 := by
  native_decide

/-- Coefficient term 1527 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1527 : Poly :=
[
  term ((-101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1527 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1527 : Poly :=
[
  term ((-101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1527 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1527_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1527
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1527 := by
  native_decide

/-- Coefficient term 1528 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1528 : Poly :=
[
  term ((-29162659845054054605864 : Rat) / 13017774793972194963465) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1528 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1528 : Poly :=
[
  term ((-58325319690108109211728 : Rat) / 13017774793972194963465) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((29162659845054054605864 : Rat) / 13017774793972194963465) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1528 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1528_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1528
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1528 := by
  native_decide

/-- Coefficient term 1529 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1529 : Poly :=
[
  term ((4278729247299390535366344375013648479972822723504 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (12, 1), (13, 2)]
]

/-- Partial product 1529 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1529 : Poly :=
[
  term ((-4278729247299390535366344375013648479972822723504 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (12, 1), (13, 2)],
  term ((8557458494598781070732688750027296959945645447008 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1529 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1529_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1529
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1529 := by
  native_decide

/-- Coefficient term 1530 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1530 : Poly :=
[
  term ((6496918976699576253087625696150157416572734512628203245906516691252421249800153 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(3, 2), (12, 1), (14, 1)]
]

/-- Partial product 1530 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1530 : Poly :=
[
  term ((-6496918976699576253087625696150157416572734512628203245906516691252421249800153 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(3, 2), (12, 1), (14, 1)],
  term ((6496918976699576253087625696150157416572734512628203245906516691252421249800153 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(3, 2), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1530 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1530_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1530
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1530 := by
  native_decide

/-- Coefficient term 1531 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1531 : Poly :=
[
  term ((84567729827233393906 : Rat) / 4578443937821456955) [(3, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1531 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1531 : Poly :=
[
  term ((-84567729827233393906 : Rat) / 4578443937821456955) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((169135459654466787812 : Rat) / 4578443937821456955) [(3, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1531 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1531_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1531
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1531 := by
  native_decide

/-- Coefficient term 1532 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1532 : Poly :=
[
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 330947839017916513220357497188112234199831912717222377600449756) [(3, 2), (12, 1), (15, 2)]
]

/-- Partial product 1532 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1532 : Poly :=
[
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 165473919508958256610178748594056117099915956358611188800224878) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 330947839017916513220357497188112234199831912717222377600449756) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1532 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1532_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1532
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1532 := by
  native_decide

/-- Coefficient term 1533 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1533 : Poly :=
[
  term ((51335937180792 : Rat) / 88461357636043) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1533 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1533 : Poly :=
[
  term ((102671874361584 : Rat) / 88461357636043) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51335937180792 : Rat) / 88461357636043) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1533 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1533_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1533
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1533 := by
  native_decide

/-- Coefficient term 1534 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1534 : Poly :=
[
  term ((548342129325847928299 : Rat) / 10683035854916732895) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 1534 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1534 : Poly :=
[
  term ((1096684258651695856598 : Rat) / 10683035854916732895) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-548342129325847928299 : Rat) / 10683035854916732895) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1534 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1534_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1534
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1534 := by
  native_decide

/-- Coefficient term 1535 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1535 : Poly :=
[
  term ((-6496918976699576253087625696150157416572734512628203245906516691252421249800153 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(3, 2), (12, 2)]
]

/-- Partial product 1535 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1535 : Poly :=
[
  term ((6496918976699576253087625696150157416572734512628203245906516691252421249800153 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(3, 2), (12, 2)],
  term ((-6496918976699576253087625696150157416572734512628203245906516691252421249800153 : Rat) / 2040374997583129405958183444558473866616775911272531022575069438993160344000) [(3, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1535 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1535_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1535
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1535 := by
  native_decide

/-- Coefficient term 1536 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1536 : Poly :=
[
  term ((-169135459654466787812 : Rat) / 4578443937821456955) [(3, 2), (12, 2), (16, 1)]
]

/-- Partial product 1536 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1536 : Poly :=
[
  term ((-338270919308933575624 : Rat) / 4578443937821456955) [(3, 2), (12, 2), (14, 1), (16, 1)],
  term ((169135459654466787812 : Rat) / 4578443937821456955) [(3, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1536 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1536_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1536
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1536 := by
  native_decide

/-- Coefficient term 1537 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1537 : Poly :=
[
  term ((101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(3, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1537 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1537 : Poly :=
[
  term ((-101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(3, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1537 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1537_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1537
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1537 := by
  native_decide

/-- Coefficient term 1538 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1538 : Poly :=
[
  term ((14581329922527027302932 : Rat) / 13017774793972194963465) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1538 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1538 : Poly :=
[
  term ((-14581329922527027302932 : Rat) / 13017774793972194963465) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((29162659845054054605864 : Rat) / 13017774793972194963465) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1538 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1538_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1538
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1538 := by
  native_decide

/-- Coefficient term 1539 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1539 : Poly :=
[
  term ((101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 1539 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1539 : Poly :=
[
  term ((101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1539 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1539_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1539
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1539 := by
  native_decide

/-- Coefficient term 1540 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1540 : Poly :=
[
  term ((7290664961263513651466 : Rat) / 13017774793972194963465) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1540 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1540 : Poly :=
[
  term ((14581329922527027302932 : Rat) / 13017774793972194963465) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7290664961263513651466 : Rat) / 13017774793972194963465) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1540 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1540_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1540
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1540 := by
  native_decide

/-- Coefficient term 1541 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1541 : Poly :=
[
  term ((-1069682311824847633841586093753412119993205680876 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (13, 2)]
]

/-- Partial product 1541 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1541 : Poly :=
[
  term ((1069682311824847633841586093753412119993205680876 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (13, 2)],
  term ((-2139364623649695267683172187506824239986411361752 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1541 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1541_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1541
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1541 := by
  native_decide

/-- Coefficient term 1542 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1542 : Poly :=
[
  term ((-2139364623649695267683172187506824239986411361752 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (13, 2), (14, 1)]
]

/-- Partial product 1542 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1542 : Poly :=
[
  term ((2139364623649695267683172187506824239986411361752 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (13, 2), (14, 1)],
  term ((-4278729247299390535366344375013648479972822723504 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1542 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1542_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1542
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1542 := by
  native_decide

/-- Coefficient term 1543 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1543 : Poly :=
[
  term ((-177324722068076187506447604308333217748201201911785891023030952841104149516174999 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 2), (14, 1)]
]

/-- Partial product 1543 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1543 : Poly :=
[
  term ((177324722068076187506447604308333217748201201911785891023030952841104149516174999 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 2), (14, 1)],
  term ((-177324722068076187506447604308333217748201201911785891023030952841104149516174999 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1543 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1543_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1543
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1543 := by
  native_decide

/-- Coefficient term 1544 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1544 : Poly :=
[
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 661895678035833026440714994376224468399663825434444755200899512) [(3, 2), (14, 1), (15, 2)]
]

/-- Partial product 1544 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1544 : Poly :=
[
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 661895678035833026440714994376224468399663825434444755200899512) [(3, 2), (14, 1), (15, 2)],
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 330947839017916513220357497188112234199831912717222377600449756) [(3, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1544 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1544_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1544
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1544 := by
  native_decide

/-- Coefficient term 1545 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1545 : Poly :=
[
  term ((-25667968590396 : Rat) / 88461357636043) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1545 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1545 : Poly :=
[
  term ((25667968590396 : Rat) / 88461357636043) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-51335937180792 : Rat) / 88461357636043) [(3, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1545 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1545_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1545
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1545 := by
  native_decide

/-- Coefficient term 1546 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1546 : Poly :=
[
  term ((-4102300497077919781969 : Rat) / 128196430259000794740) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 1546 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1546 : Poly :=
[
  term ((4102300497077919781969 : Rat) / 128196430259000794740) [(3, 2), (14, 1), (16, 1)],
  term ((-4102300497077919781969 : Rat) / 64098215129500397370) [(3, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1546 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1546_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1546
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1546 := by
  native_decide

/-- Coefficient term 1547 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1547 : Poly :=
[
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 1323791356071666052881429988752448936799327650868889510401799024) [(3, 2), (15, 2)]
]

/-- Partial product 1547 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1547 : Poly :=
[
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 661895678035833026440714994376224468399663825434444755200899512) [(3, 2), (14, 1), (15, 2)],
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 1323791356071666052881429988752448936799327650868889510401799024) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1547 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1547_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1547
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1547 := by
  native_decide

/-- Coefficient term 1548 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1548 : Poly :=
[
  term ((-12833984295198 : Rat) / 88461357636043) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 1548 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1548 : Poly :=
[
  term ((-25667968590396 : Rat) / 88461357636043) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((12833984295198 : Rat) / 88461357636043) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1548 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1548_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1548
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1548 := by
  native_decide

/-- Coefficient term 1549 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1549 : Poly :=
[
  term ((5302394353193765951047 : Rat) / 256392860518001589480) [(3, 2), (16, 1)]
]

/-- Partial product 1549 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1549 : Poly :=
[
  term ((5302394353193765951047 : Rat) / 128196430259000794740) [(3, 2), (14, 1), (16, 1)],
  term ((-5302394353193765951047 : Rat) / 256392860518001589480) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1549 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1549_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1549
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1549 := by
  native_decide

/-- Coefficient term 1550 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1550 : Poly :=
[
  term ((-6303941969049722431288820699811905014554815366029875200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 1550 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1550 : Poly :=
[
  term ((6303941969049722431288820699811905014554815366029875200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (8, 1), (9, 1)],
  term ((-12607883938099444862577641399623810029109630732059750400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1550 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1550_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1550
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1550 := by
  native_decide

/-- Coefficient term 1551 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1551 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1)]
]

/-- Partial product 1551 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1551 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1551 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1551_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1551
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1551 := by
  native_decide

/-- Coefficient term 1552 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1552 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 1552 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1552 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1552 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1552_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1552
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1552 := by
  native_decide

/-- Coefficient term 1553 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1553 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 1553 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1553 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1553 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1553_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1553
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1553 := by
  native_decide

/-- Coefficient term 1554 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1554 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1554 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1554 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1554 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1554_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1554
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1554 := by
  native_decide

/-- Coefficient term 1555 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1555 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1555 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1555 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1555 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1555_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1555
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1555 := by
  native_decide

/-- Coefficient term 1556 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1556 : Poly :=
[
  term ((551141741143899151217902279133004068808506619727721369600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 1556 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1556 : Poly :=
[
  term ((-551141741143899151217902279133004068808506619727721369600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1)],
  term ((1102283482287798302435804558266008137617013239455442739200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1556 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1556_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1556
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1556 := by
  native_decide

/-- Coefficient term 1557 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1557 : Poly :=
[
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1557 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1557 : Poly :=
[
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1557 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1557_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1557
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1557 := by
  native_decide

/-- Coefficient term 1558 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1558 : Poly :=
[
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 2)]
]

/-- Partial product 1558 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1558 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 2)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1558 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1558_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1558
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1558 := by
  native_decide

/-- Coefficient term 1559 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1559 : Poly :=
[
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1559 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1559 : Poly :=
[
  term ((128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1559 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1559_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1559
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1559 := by
  native_decide

/-- Coefficient term 1560 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1560 : Poly :=
[
  term ((-44210606005872057968817367083962400729939968355372800000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 1560 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1560 : Poly :=
[
  term ((44210606005872057968817367083962400729939968355372800000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1560 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1560_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1560
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1560 := by
  native_decide

/-- Coefficient term 1561 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1561 : Poly :=
[
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (15, 2)]
]

/-- Partial product 1561 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1561 : Poly :=
[
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1561 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1561_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1561
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1561 := by
  native_decide

/-- Coefficient term 1562 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1562 : Poly :=
[
  term ((40504531346666479333376582420887593958529658596811980800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 1562 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1562 : Poly :=
[
  term ((-40504531346666479333376582420887593958529658596811980800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((81009062693332958666753164841775187917059317193623961600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1562 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1562_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1562
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1562 := by
  native_decide

/-- Coefficient term 1563 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1563 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 1563 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1563 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1563 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1563_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1563
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1563 := by
  native_decide

/-- Coefficient term 1564 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1564 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1564 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1564 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1564 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1564_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1564
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1564 := by
  native_decide

/-- Coefficient term 1565 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1565 : Poly :=
[
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1565 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1565 : Poly :=
[
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1565 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1565_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1565
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1565 := by
  native_decide

/-- Coefficient term 1566 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1566 : Poly :=
[
  term ((-74273391192040015774500623244283542098712134743185817600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1566 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1566 : Poly :=
[
  term ((-148546782384080031549001246488567084197424269486371635200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((74273391192040015774500623244283542098712134743185817600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1566 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1566_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1566
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1566 := by
  native_decide

/-- Coefficient term 1567 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1567 : Poly :=
[
  term ((-434842781654569388589997106984596645158740736034070528000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 1567 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1567 : Poly :=
[
  term ((434842781654569388589997106984596645158740736034070528000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-869685563309138777179994213969193290317481472068141056000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1567 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1567_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1567
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1567 := by
  native_decide

/-- Coefficient term 1568 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1568 : Poly :=
[
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1568 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1568 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1568 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1568_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1568
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1568 := by
  native_decide

/-- Coefficient term 1569 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1569 : Poly :=
[
  term ((112597095595034821721801846581687352091372920497062092800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 1569 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1569 : Poly :=
[
  term ((225194191190069643443603693163374704182745840994124185600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-112597095595034821721801846581687352091372920497062092800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1569 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1569_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1569
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1569 := by
  native_decide

/-- Coefficient term 1570 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1570 : Poly :=
[
  term ((-174530306594169669656487896137452738533267190263794995200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 1570 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1570 : Poly :=
[
  term ((174530306594169669656487896137452738533267190263794995200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1)],
  term ((-349060613188339339312975792274905477066534380527589990400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1570 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1570_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1570
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1570 := by
  native_decide

/-- Coefficient term 1571 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1571 : Poly :=
[
  term ((240574116750630210251951180963238392510500911620571443200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 1571 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1571 : Poly :=
[
  term ((-240574116750630210251951180963238392510500911620571443200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((481148233501260420503902361926476785021001823241142886400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1571 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1571_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1571
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1571 := by
  native_decide

/-- Coefficient term 1572 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1572 : Poly :=
[
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1572 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1572 : Poly :=
[
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1572 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1572_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1572
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1572 := by
  native_decide

/-- Coefficient term 1573 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1573 : Poly :=
[
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 2)]
]

/-- Partial product 1573 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1573 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 2)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1573 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1573_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1573
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1573 := by
  native_decide

/-- Coefficient term 1574 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1574 : Poly :=
[
  term ((-2505579761848784161152388745201979933879527502680268800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1574 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1574 : Poly :=
[
  term ((-5011159523697568322304777490403959867759055005360537600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2505579761848784161152388745201979933879527502680268800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1574 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1574_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1574
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1574 := by
  native_decide

/-- Coefficient term 1575 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1575 : Poly :=
[
  term ((-488429325187383802549230020023226022394609729949235200 : Rat) / 60114285150280637492040475866445680491505092058198069) [(5, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1575 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1575 : Poly :=
[
  term ((488429325187383802549230020023226022394609729949235200 : Rat) / 60114285150280637492040475866445680491505092058198069) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-976858650374767605098460040046452044789219459898470400 : Rat) / 60114285150280637492040475866445680491505092058198069) [(5, 1), (8, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1575 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1575_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1575
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1575 := by
  native_decide

/-- Coefficient term 1576 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1576 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 2), (13, 1)]
]

/-- Partial product 1576 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1576 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 2), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1576 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1576_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1576
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1576 := by
  native_decide

/-- Coefficient term 1577 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1577 : Poly :=
[
  term ((-290040358902822531252394280168818158402234724540226969600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1577 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1577 : Poly :=
[
  term ((290040358902822531252394280168818158402234724540226969600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-580080717805645062504788560337636316804469449080453939200 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1577 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1577_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1577
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1577 := by
  native_decide

/-- Coefficient term 1578 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1578 : Poly :=
[
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1578 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1578 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1578 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1578_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1578
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1578 := by
  native_decide

/-- Coefficient term 1579 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1579 : Poly :=
[
  term ((-402113961337676778494629437803694235946225269235987148800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1579 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1579 : Poly :=
[
  term ((-804227922675353556989258875607388471892450538471974297600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((402113961337676778494629437803694235946225269235987148800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1579 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1579_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1579
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1579 := by
  native_decide

/-- Coefficient term 1580 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1580 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1580 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1580 : Poly :=
[
  term ((1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1580 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1580_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1580
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1580 := by
  native_decide

/-- Coefficient term 1581 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1581 : Poly :=
[
  term ((1659486066493832570217992489623560872966888878565847910400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 1581 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1581 : Poly :=
[
  term ((-1659486066493832570217992489623560872966888878565847910400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (13, 1)],
  term ((3318972132987665140435984979247121745933777757131695820800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1581 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1581_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1581
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1581 := by
  native_decide

/-- Coefficient term 1582 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1582 : Poly :=
[
  term ((299189012146823413861567160705959726843314993047581696000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1582 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1582 : Poly :=
[
  term ((-299189012146823413861567160705959726843314993047581696000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((598378024293646827723134321411919453686629986095163392000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1582 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1582_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1582
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1582 := by
  native_decide

/-- Coefficient term 1583 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1583 : Poly :=
[
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 1583 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1583 : Poly :=
[
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1583 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1583_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1583
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1583 := by
  native_decide

/-- Coefficient term 1584 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1584 : Poly :=
[
  term ((-25145931272911400380060742302562403322507601203578112000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 1584 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1584 : Poly :=
[
  term ((-50291862545822800760121484605124806645015202407156224000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((25145931272911400380060742302562403322507601203578112000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1584 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1584_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1584
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1584 := by
  native_decide

/-- Coefficient term 1585 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1585 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (13, 1)]
]

/-- Partial product 1585 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1585 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1585 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1585_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1585
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1585 := by
  native_decide

/-- Coefficient term 1586 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1586 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (15, 1)]
]

/-- Partial product 1586 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1586 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1586 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1586_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1586
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1586 := by
  native_decide

/-- Coefficient term 1587 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1587 : Poly :=
[
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (11, 1)]
]

/-- Partial product 1587 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1587 : Poly :=
[
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (11, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1587 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1587_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1587
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1587 := by
  native_decide

/-- Coefficient term 1588 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1588 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (13, 1)]
]

/-- Partial product 1588 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1588 : Poly :=
[
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1588 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1588_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1588
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1588 := by
  native_decide

/-- Coefficient term 1589 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1589 : Poly :=
[
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (15, 1)]
]

/-- Partial product 1589 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1589 : Poly :=
[
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1589 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1589_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1589
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1589 := by
  native_decide

/-- Coefficient term 1590 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1590 : Poly :=
[
  term ((-88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (13, 1)]
]

/-- Partial product 1590 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1590 : Poly :=
[
  term ((88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (13, 1)],
  term ((-176842424023488231875269468335849602919759873421491200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1590 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1590_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1590
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1590 := by
  native_decide

/-- Coefficient term 1591 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1591 : Poly :=
[
  term ((148651294733428855559192742769519175705771866642047078400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (15, 1)]
]

/-- Partial product 1591 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1591 : Poly :=
[
  term ((297302589466857711118385485539038351411543733284094156800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-148651294733428855559192742769519175705771866642047078400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1591 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1591_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1591
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1591 := by
  native_decide

/-- Coefficient term 1592 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1592 : Poly :=
[
  term ((263579679351015926488649016790149375549817831602005401600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1)]
]

/-- Partial product 1592 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1592 : Poly :=
[
  term ((-263579679351015926488649016790149375549817831602005401600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1)],
  term ((527159358702031852977298033580298751099635663204010803200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1592 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1592_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1592
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1592 := by
  native_decide

/-- Coefficient term 1593 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1593 : Poly :=
[
  term ((-188455053895842934167716800739923325042603581740889702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 1593 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1593 : Poly :=
[
  term ((188455053895842934167716800739923325042603581740889702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1)],
  term ((-376910107791685868335433601479846650085207163481779404800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1593 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1593_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1593
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1593 := by
  native_decide

/-- Coefficient term 1594 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1594 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1594 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1594 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1594 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1594_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1594
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1594 := by
  native_decide

/-- Coefficient term 1595 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1595 : Poly :=
[
  term ((294293774787071236299916671886630366803047312978724147200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 1595 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1595 : Poly :=
[
  term ((-294293774787071236299916671886630366803047312978724147200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1)],
  term ((588587549574142472599833343773260733606094625957448294400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1595 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1595_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1595
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1595 := by
  native_decide

/-- Coefficient term 1596 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1596 : Poly :=
[
  term ((-177269088995170731380670623223628026255360869756246425600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 1596 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1596 : Poly :=
[
  term ((177269088995170731380670623223628026255360869756246425600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1596 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1596_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1596
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1596 := by
  native_decide

/-- Coefficient term 1597 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1597 : Poly :=
[
  term ((354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 2)]
]

/-- Partial product 1597 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1597 : Poly :=
[
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 2)],
  term ((709076355980682925522682492894512105021443479024985702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1597 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1597_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1597
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1597 := by
  native_decide

/-- Coefficient term 1598 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1598 : Poly :=
[
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1598 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1598 : Poly :=
[
  term ((128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1598 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1598_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1598
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1598 := by
  native_decide

/-- Coefficient term 1599 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1599 : Poly :=
[
  term ((471586265544832885199393634604285170325223482060953600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 1599 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1599 : Poly :=
[
  term ((-471586265544832885199393634604285170325223482060953600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (14, 1)],
  term ((943172531089665770398787269208570340650446964121907200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1599 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1599_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1599
        rs_R009_ueqv_R009NYNYN_generator_28_1500_1599 =
      rs_R009_ueqv_R009NYNYN_partial_28_1599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1500_1599 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1500,
  rs_R009_ueqv_R009NYNYN_partial_28_1501,
  rs_R009_ueqv_R009NYNYN_partial_28_1502,
  rs_R009_ueqv_R009NYNYN_partial_28_1503,
  rs_R009_ueqv_R009NYNYN_partial_28_1504,
  rs_R009_ueqv_R009NYNYN_partial_28_1505,
  rs_R009_ueqv_R009NYNYN_partial_28_1506,
  rs_R009_ueqv_R009NYNYN_partial_28_1507,
  rs_R009_ueqv_R009NYNYN_partial_28_1508,
  rs_R009_ueqv_R009NYNYN_partial_28_1509,
  rs_R009_ueqv_R009NYNYN_partial_28_1510,
  rs_R009_ueqv_R009NYNYN_partial_28_1511,
  rs_R009_ueqv_R009NYNYN_partial_28_1512,
  rs_R009_ueqv_R009NYNYN_partial_28_1513,
  rs_R009_ueqv_R009NYNYN_partial_28_1514,
  rs_R009_ueqv_R009NYNYN_partial_28_1515,
  rs_R009_ueqv_R009NYNYN_partial_28_1516,
  rs_R009_ueqv_R009NYNYN_partial_28_1517,
  rs_R009_ueqv_R009NYNYN_partial_28_1518,
  rs_R009_ueqv_R009NYNYN_partial_28_1519,
  rs_R009_ueqv_R009NYNYN_partial_28_1520,
  rs_R009_ueqv_R009NYNYN_partial_28_1521,
  rs_R009_ueqv_R009NYNYN_partial_28_1522,
  rs_R009_ueqv_R009NYNYN_partial_28_1523,
  rs_R009_ueqv_R009NYNYN_partial_28_1524,
  rs_R009_ueqv_R009NYNYN_partial_28_1525,
  rs_R009_ueqv_R009NYNYN_partial_28_1526,
  rs_R009_ueqv_R009NYNYN_partial_28_1527,
  rs_R009_ueqv_R009NYNYN_partial_28_1528,
  rs_R009_ueqv_R009NYNYN_partial_28_1529,
  rs_R009_ueqv_R009NYNYN_partial_28_1530,
  rs_R009_ueqv_R009NYNYN_partial_28_1531,
  rs_R009_ueqv_R009NYNYN_partial_28_1532,
  rs_R009_ueqv_R009NYNYN_partial_28_1533,
  rs_R009_ueqv_R009NYNYN_partial_28_1534,
  rs_R009_ueqv_R009NYNYN_partial_28_1535,
  rs_R009_ueqv_R009NYNYN_partial_28_1536,
  rs_R009_ueqv_R009NYNYN_partial_28_1537,
  rs_R009_ueqv_R009NYNYN_partial_28_1538,
  rs_R009_ueqv_R009NYNYN_partial_28_1539,
  rs_R009_ueqv_R009NYNYN_partial_28_1540,
  rs_R009_ueqv_R009NYNYN_partial_28_1541,
  rs_R009_ueqv_R009NYNYN_partial_28_1542,
  rs_R009_ueqv_R009NYNYN_partial_28_1543,
  rs_R009_ueqv_R009NYNYN_partial_28_1544,
  rs_R009_ueqv_R009NYNYN_partial_28_1545,
  rs_R009_ueqv_R009NYNYN_partial_28_1546,
  rs_R009_ueqv_R009NYNYN_partial_28_1547,
  rs_R009_ueqv_R009NYNYN_partial_28_1548,
  rs_R009_ueqv_R009NYNYN_partial_28_1549,
  rs_R009_ueqv_R009NYNYN_partial_28_1550,
  rs_R009_ueqv_R009NYNYN_partial_28_1551,
  rs_R009_ueqv_R009NYNYN_partial_28_1552,
  rs_R009_ueqv_R009NYNYN_partial_28_1553,
  rs_R009_ueqv_R009NYNYN_partial_28_1554,
  rs_R009_ueqv_R009NYNYN_partial_28_1555,
  rs_R009_ueqv_R009NYNYN_partial_28_1556,
  rs_R009_ueqv_R009NYNYN_partial_28_1557,
  rs_R009_ueqv_R009NYNYN_partial_28_1558,
  rs_R009_ueqv_R009NYNYN_partial_28_1559,
  rs_R009_ueqv_R009NYNYN_partial_28_1560,
  rs_R009_ueqv_R009NYNYN_partial_28_1561,
  rs_R009_ueqv_R009NYNYN_partial_28_1562,
  rs_R009_ueqv_R009NYNYN_partial_28_1563,
  rs_R009_ueqv_R009NYNYN_partial_28_1564,
  rs_R009_ueqv_R009NYNYN_partial_28_1565,
  rs_R009_ueqv_R009NYNYN_partial_28_1566,
  rs_R009_ueqv_R009NYNYN_partial_28_1567,
  rs_R009_ueqv_R009NYNYN_partial_28_1568,
  rs_R009_ueqv_R009NYNYN_partial_28_1569,
  rs_R009_ueqv_R009NYNYN_partial_28_1570,
  rs_R009_ueqv_R009NYNYN_partial_28_1571,
  rs_R009_ueqv_R009NYNYN_partial_28_1572,
  rs_R009_ueqv_R009NYNYN_partial_28_1573,
  rs_R009_ueqv_R009NYNYN_partial_28_1574,
  rs_R009_ueqv_R009NYNYN_partial_28_1575,
  rs_R009_ueqv_R009NYNYN_partial_28_1576,
  rs_R009_ueqv_R009NYNYN_partial_28_1577,
  rs_R009_ueqv_R009NYNYN_partial_28_1578,
  rs_R009_ueqv_R009NYNYN_partial_28_1579,
  rs_R009_ueqv_R009NYNYN_partial_28_1580,
  rs_R009_ueqv_R009NYNYN_partial_28_1581,
  rs_R009_ueqv_R009NYNYN_partial_28_1582,
  rs_R009_ueqv_R009NYNYN_partial_28_1583,
  rs_R009_ueqv_R009NYNYN_partial_28_1584,
  rs_R009_ueqv_R009NYNYN_partial_28_1585,
  rs_R009_ueqv_R009NYNYN_partial_28_1586,
  rs_R009_ueqv_R009NYNYN_partial_28_1587,
  rs_R009_ueqv_R009NYNYN_partial_28_1588,
  rs_R009_ueqv_R009NYNYN_partial_28_1589,
  rs_R009_ueqv_R009NYNYN_partial_28_1590,
  rs_R009_ueqv_R009NYNYN_partial_28_1591,
  rs_R009_ueqv_R009NYNYN_partial_28_1592,
  rs_R009_ueqv_R009NYNYN_partial_28_1593,
  rs_R009_ueqv_R009NYNYN_partial_28_1594,
  rs_R009_ueqv_R009NYNYN_partial_28_1595,
  rs_R009_ueqv_R009NYNYN_partial_28_1596,
  rs_R009_ueqv_R009NYNYN_partial_28_1597,
  rs_R009_ueqv_R009NYNYN_partial_28_1598,
  rs_R009_ueqv_R009NYNYN_partial_28_1599
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1500_1599 : Poly :=
[
  term ((-1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((1087883160701763006444 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1278871982648117439859095448076099120671183 : Rat) / 79134349951295896336425736352731598571000) [(3, 2), (9, 1), (15, 1)],
  term ((-543941580350881503222 : Rat) / 4339258264657398321155) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(3, 2), (10, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(3, 2), (10, 1), (12, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 1043136501831865749467373949160773960438024494515608907246968015845174000) [(3, 2), (10, 1), (12, 1), (14, 1)],
  term ((25810287921530625368 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(3, 2), (10, 1), (14, 2)],
  term ((-12905143960765312684 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (14, 2), (16, 1)],
  term ((3226285990191328171 : Rat) / 1526147979273818985) [(3, 2), (10, 1), (16, 1)],
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((16796938381458824653536 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((327383632049148731611094641244124897960642245929105823501475859549256247044 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((17901139823617409897312 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163691816024574365805547320622062448980321122964552911750737929774628123522 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8950569911808704948656 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((251566752052309965381203575237721978345929126158885340941958384 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (13, 1)],
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(3, 2), (11, 1), (13, 1), (14, 2)],
  term ((-8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2099617297682353081692 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-163691816024574365805547320622062448980321122964552911750737929774628123522 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-8950569911808704948656 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(3, 2), (11, 1), (15, 1)],
  term ((2237642477952176237164 : Rat) / 4339258264657398321155) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((3871943576043257570909536848399176327966 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2)],
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (12, 1)],
  term ((30975548608346060567276294787193410623728 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (12, 1), (14, 1)],
  term ((-2841617327957868640896 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(3, 2), (11, 2), (14, 2)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (14, 2), (16, 1)],
  term ((-355202165994733580112 : Rat) / 619894037808199760165) [(3, 2), (11, 2), (16, 1)],
  term ((-9256664952405331422293638796687654336111051793607383082281188262653025299705777 : Rat) / 5440999993555011749221822518822596977644735763393416060200185170648427584000) [(3, 2), (12, 1)],
  term ((-101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-58325319690108109211728 : Rat) / 13017774793972194963465) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((29162659845054054605864 : Rat) / 13017774793972194963465) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4278729247299390535366344375013648479972822723504 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (12, 1), (13, 2)],
  term ((8557458494598781070732688750027296959945645447008 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (12, 1), (13, 2), (14, 1)],
  term ((10636537940258209006896645346956402795880210434096973000468524048353327324658589 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(3, 2), (12, 1), (14, 1)],
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 165473919508958256610178748594056117099915956358611188800224878) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((102671874361584 : Rat) / 88461357636043) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2698078667164453812452 : Rat) / 32049107564750198685) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((6496918976699576253087625696150157416572734512628203245906516691252421249800153 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(3, 2), (12, 1), (14, 2)],
  term ((169135459654466787812 : Rat) / 4578443937821456955) [(3, 2), (12, 1), (14, 2), (16, 1)],
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 330947839017916513220357497188112234199831912717222377600449756) [(3, 2), (12, 1), (15, 2)],
  term ((-51335937180792 : Rat) / 88461357636043) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-548342129325847928299 : Rat) / 10683035854916732895) [(3, 2), (12, 1), (16, 1)],
  term ((6496918976699576253087625696150157416572734512628203245906516691252421249800153 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(3, 2), (12, 2)],
  term ((-6496918976699576253087625696150157416572734512628203245906516691252421249800153 : Rat) / 2040374997583129405958183444558473866616775911272531022575069438993160344000) [(3, 2), (12, 2), (14, 1)],
  term ((-338270919308933575624 : Rat) / 4578443937821456955) [(3, 2), (12, 2), (14, 1), (16, 1)],
  term ((169135459654466787812 : Rat) / 4578443937821456955) [(3, 2), (12, 2), (16, 1)],
  term ((101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((29162659845054054605864 : Rat) / 13017774793972194963465) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-101923636904335280894467877283393632845937495758238953205607410861 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 2), (13, 1), (15, 1)],
  term ((-7290664961263513651466 : Rat) / 13017774793972194963465) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1069682311824847633841586093753412119993205680876 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (13, 2)],
  term ((-4278729247299390535366344375013648479972822723504 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 2), (13, 2), (14, 2)],
  term ((177324722068076187506447604308333217748201201911785891023030952841104149516174999 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(3, 2), (14, 1)],
  term ((2351173712567921433254 : Rat) / 32049107564750198685) [(3, 2), (14, 1), (16, 1)],
  term ((-177324722068076187506447604308333217748201201911785891023030952841104149516174999 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 2), (14, 2)],
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 330947839017916513220357497188112234199831912717222377600449756) [(3, 2), (14, 2), (15, 2)],
  term ((-51335937180792 : Rat) / 88461357636043) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((-4102300497077919781969 : Rat) / 64098215129500397370) [(3, 2), (14, 2), (16, 1)],
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 1323791356071666052881429988752448936799327650868889510401799024) [(3, 2), (15, 2)],
  term ((12833984295198 : Rat) / 88461357636043) [(3, 2), (15, 2), (16, 1)],
  term ((-5302394353193765951047 : Rat) / 256392860518001589480) [(3, 2), (16, 1)],
  term ((6303941969049722431288820699811905014554815366029875200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (8, 1), (9, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 2)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-551141741143899151217902279133004068808506619727721369600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1)],
  term ((116629339597018785575829497376682639026878061408565452800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 2)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 2)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1)],
  term ((128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((44376630450920059868408611454520531986052489941700147200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (9, 1), (14, 2)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((-40504531346666479333376582420887593958529658596811980800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((10346450923281277800613779614492237699765837988515840000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-148546782384080031549001246488567084197424269486371635200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((74273391192040015774500623244283542098712134743185817600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((434842781654569388589997106984596645158740736034070528000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-835349938387682720930167383807875194242687666972088729600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((225194191190069643443603693163374704182745840994124185600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-112597095595034821721801846581687352091372920497062092800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((174530306594169669656487896137452738533267190263794995200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1)],
  term ((-240574116750630210251951180963238392510500911620571443200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((65090042797531205699634761765749040197378337881886105600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 2)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((-5011159523697568322304777490403959867759055005360537600 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2505579761848784161152388745201979933879527502680268800 : Rat) / 520299502507601379672488256637167786323026831262335011) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1540577228342217720225299709177386023438689376260761600 : Rat) / 102644119542315918438790200288965073492297810249032077) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-976858650374767605098460040046452044789219459898470400 : Rat) / 60114285150280637492040475866445680491505092058198069) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 2), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((290040358902822531252394280168818158402234724540226969600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-2345296393987514617103531462588076231058085285990270156800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((-804227922675353556989258875607388471892450538471974297600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((402113961337676778494629437803694235946225269235987148800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-1659486066493832570217992489623560872966888878565847910400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (13, 1)],
  term ((2421405096547194898851283497129242565403832777988950732800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((598378024293646827723134321411919453686629986095163392000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-50291862545822800760121484605124806645015202407156224000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((25145931272911400380060742302562403322507601203578112000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (11, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((1143512420434667213619992306516918657715467238381938278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((-571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((88421212011744115937634734167924801459879936710745600000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (13, 1)],
  term ((-176842424023488231875269468335849602919759873421491200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((297302589466857711118385485539038351411543733284094156800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-148651294733428855559192742769519175705771866642047078400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 2), (15, 1)],
  term ((-263579679351015926488649016790149375549817831602005401600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1)],
  term ((188455053895842934167716800739923325042603581740889702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-294293774787071236299916671886630366803047312978724147200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1)],
  term ((109408091224187600568643423856698394265922213673384960000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 2)],
  term ((-354538177990341462761341246447256052510721739512492851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 2)],
  term ((709076355980682925522682492894512105021443479024985702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-54046409512617195284433111769094215085168976275423180800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (9, 1), (10, 1), (14, 1)],
  term ((943172531089665770398787269208570340650446964121907200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (14, 2)],
  term ((527159358702031852977298033580298751099635663204010803200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1500 through 1599. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1500_1599_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1500_1599
      rs_R009_ueqv_R009NYNYN_block_28_1500_1599 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
