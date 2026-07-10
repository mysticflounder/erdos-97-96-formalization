/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:700-799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0700 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (14, 1)]
]

/-- Partial product 700 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0700 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0700_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0700
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0701 : Poly :=
[
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(2, 1), (3, 1), (8, 1), (13, 1)]
]

/-- Partial product 701 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0701 : Poly :=
[
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(2, 1), (3, 1), (8, 1), (13, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 42577000074770030590505059149419345324000999776147302336610939422252000) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0701_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0701
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0702 : Poly :=
[
  term ((42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 702 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0702 : Poly :=
[
  term ((85184708823587271392 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0702_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0702
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0703 : Poly :=
[
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 1), (3, 1), (8, 1), (15, 1)]
]

/-- Partial product 703 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0703 : Poly :=
[
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 1), (3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0703_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0703
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0704 : Poly :=
[
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 704 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0704 : Poly :=
[
  term ((-42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0704_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0704
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0705 : Poly :=
[
  term ((-87415666172446026253622984357990605194943 : Rat) / 1130490713589941376234653376467594265300) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 705 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0705 : Poly :=
[
  term ((87415666172446026253622984357990605194943 : Rat) / 1130490713589941376234653376467594265300) [(2, 1), (3, 1), (9, 1)],
  term ((-87415666172446026253622984357990605194943 : Rat) / 565245356794970688117326688233797132650) [(2, 1), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0705_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0705
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0706 : Poly :=
[
  term ((-437122755035103944519927206371001426739647 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1)]
]

/-- Partial product 706 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0706 : Poly :=
[
  term ((437122755035103944519927206371001426739647 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-874245510070207889039854412742002853479294 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0706_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0706
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0707 : Poly :=
[
  term ((2042656786867588678267704250041253472147059 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 707 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0707 : Poly :=
[
  term ((-2042656786867588678267704250041253472147059 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1)],
  term ((2042656786867588678267704250041253472147059 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0707_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0707
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0708 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 708 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0708 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0708_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0708
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0709 : Poly :=
[
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 709 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0709 : Poly :=
[
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0709_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0709
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0710 : Poly :=
[
  term ((-1737603099979595118012 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 710 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0710 : Poly :=
[
  term ((-3475206199959190236024 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1737603099979595118012 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0710_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0710
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0711 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2)]
]

/-- Partial product 711 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0711 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2)],
  term ((415521500975212250826203828836216554791462 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0711_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0711
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0712 : Poly :=
[
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

/-- Partial product 712 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0712 : Poly :=
[
  term ((-1413867376731274973664 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0712_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0712
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0713 : Poly :=
[
  term ((-513576756550936550888868970355299143187619 : Rat) / 13189058325215982722737622725455266428500) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 713 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0713 : Poly :=
[
  term ((513576756550936550888868970355299143187619 : Rat) / 13189058325215982722737622725455266428500) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-513576756550936550888868970355299143187619 : Rat) / 6594529162607991361368811362727633214250) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0713_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0713
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0714 : Poly :=
[
  term ((1310635105218320988276 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 714 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0714 : Poly :=
[
  term ((-1310635105218320988276 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2621270210436641976552 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0714_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0714
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0715 : Poly :=
[
  term ((1487368527309730359984 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 715 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0715 : Poly :=
[
  term ((2974737054619460719968 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1487368527309730359984 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0715_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0715
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0716 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 716 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0716 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1)],
  term ((122766201736782921383248439727255513889582 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0716_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0716
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0717 : Poly :=
[
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 717 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0717 : Poly :=
[
  term ((-3759555509742011600736 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0717_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0717
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0718 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 718 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0718 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0718_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0718
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0719 : Poly :=
[
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 719 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0719 : Poly :=
[
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0719_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0719
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0720 : Poly :=
[
  term ((-253562072720507588031567317479009466040623 : Rat) / 471037797329142240097772240194830943875) [(2, 1), (3, 1), (9, 1), (12, 1)]
]

/-- Partial product 720 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0720 : Poly :=
[
  term ((253562072720507588031567317479009466040623 : Rat) / 471037797329142240097772240194830943875) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-507124145441015176063134634958018932081246 : Rat) / 471037797329142240097772240194830943875) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0720_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0720
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0721 : Poly :=
[
  term ((-1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 721 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0721 : Poly :=
[
  term ((1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0721_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0721
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0722 : Poly :=
[
  term ((6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 722 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0722 : Poly :=
[
  term ((-6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0722_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0722
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0723 : Poly :=
[
  term ((2588336404406244100368 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 723 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0723 : Poly :=
[
  term ((5176672808812488200736 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2588336404406244100368 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0723_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0723
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0724 : Poly :=
[
  term ((3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 2)]
]

/-- Partial product 724 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0724 : Poly :=
[
  term ((-3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((7833803068741102637830075306656039288873812 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0724_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0724
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0725 : Poly :=
[
  term ((-13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 725 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0725 : Poly :=
[
  term ((-26655560707774604172864 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0725_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0725
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0726 : Poly :=
[
  term ((-1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 726 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0726 : Poly :=
[
  term ((-1278871982648117439859095448076099120671183 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0726_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0726
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0727 : Poly :=
[
  term ((2175766321403526012888 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 727 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0727 : Poly :=
[
  term ((4351532642807052025776 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2175766321403526012888 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0727_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0727
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0728 : Poly :=
[
  term ((45123853596575810528328063199913076979679 : Rat) / 2082482893455155166748045693492936804500) [(2, 1), (3, 1), (9, 1), (14, 1)]
]

/-- Partial product 728 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0728 : Poly :=
[
  term ((-45123853596575810528328063199913076979679 : Rat) / 2082482893455155166748045693492936804500) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((45123853596575810528328063199913076979679 : Rat) / 1041241446727577583374022846746468402250) [(2, 1), (3, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0728_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0728
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0729 : Poly :=
[
  term ((-38384983907488976172 : Rat) / 228382013929336753745) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 729 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0729 : Poly :=
[
  term ((38384983907488976172 : Rat) / 228382013929336753745) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-76769967814977952344 : Rat) / 228382013929336753745) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0729_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0729
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0730 : Poly :=
[
  term ((1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

/-- Partial product 730 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0730 : Poly :=
[
  term ((1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0730_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0730
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0731 : Poly :=
[
  term ((-1087883160701763006444 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 731 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0731 : Poly :=
[
  term ((-2175766321403526012888 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1087883160701763006444 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0731_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0731
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0732 : Poly :=
[
  term ((74360868406558142124 : Rat) / 123978807561639952033) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 732 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0732 : Poly :=
[
  term ((148721736813116284248 : Rat) / 123978807561639952033) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-74360868406558142124 : Rat) / 123978807561639952033) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0732_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0732
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0733 : Poly :=
[
  term ((552681867688050456546342474951924984536 : Rat) / 13242026430939741689495605146039424125) [(2, 1), (3, 1), (10, 1), (11, 1)]
]

/-- Partial product 733 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0733 : Poly :=
[
  term ((-552681867688050456546342474951924984536 : Rat) / 13242026430939741689495605146039424125) [(2, 1), (3, 1), (10, 1), (11, 1)],
  term ((1105363735376100913092684949903849969072 : Rat) / 13242026430939741689495605146039424125) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0733_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0733
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0734 : Poly :=
[
  term ((-413050512151767374730353465310863831807134 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 734 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0734 : Poly :=
[
  term ((413050512151767374730353465310863831807134 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((-826101024303534749460706930621727663614268 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0734_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0734
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0735 : Poly :=
[
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 735 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0735 : Poly :=
[
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0735_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0735
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0736 : Poly :=
[
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 736 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0736 : Poly :=
[
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0736_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0736
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0737 : Poly :=
[
  term ((1313347566014301193232 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 737 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0737 : Poly :=
[
  term ((2626695132028602386464 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1313347566014301193232 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0737_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0737
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0738 : Poly :=
[
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2)]
]

/-- Partial product 738 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0738 : Poly :=
[
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2)],
  term ((52458011773967510031618059505117434183536 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0738_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0738
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0739 : Poly :=
[
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 739 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0739 : Poly :=
[
  term ((1068655596849965797504 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0739_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0739
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0740 : Poly :=
[
  term ((30591118440109919723670742495995842875694 : Rat) / 366362731255999520076045075707090734125) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 740 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0740 : Poly :=
[
  term ((-30591118440109919723670742495995842875694 : Rat) / 366362731255999520076045075707090734125) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((61182236880219839447341484991991685751388 : Rat) / 366362731255999520076045075707090734125) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0740_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0740
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0741 : Poly :=
[
  term ((-990628657022764908336 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 741 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0741 : Poly :=
[
  term ((990628657022764908336 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1981257314045529816672 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0741_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0741
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0742 : Poly :=
[
  term ((-1124210606629010633024 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 742 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0742 : Poly :=
[
  term ((-2248421213258021266048 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1124210606629010633024 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0742_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0742
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0743 : Poly :=
[
  term ((-564161958776264164500229799601692512049869 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 743 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0743 : Poly :=
[
  term ((564161958776264164500229799601692512049869 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1)],
  term ((-564161958776264164500229799601692512049869 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0743_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0743
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0744 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 744 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0744 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0744_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0744
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0745 : Poly :=
[
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 745 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0745 : Poly :=
[
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0745_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0745
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0746 : Poly :=
[
  term ((-23289784225416526496836 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 746 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0746 : Poly :=
[
  term ((-46579568450833052993672 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((23289784225416526496836 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0746_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0746
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0747 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 747 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0747 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0747_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0747
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0748 : Poly :=
[
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 748 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0748 : Poly :=
[
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2081612327941872 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0748_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0748
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0749 : Poly :=
[
  term ((4023152550366444231826684892527268125590800987439685665826462111 : Rat) / 53767436030922010551206540159413192110897061449856856865059064) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 749 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0749 : Poly :=
[
  term ((4023152550366444231826684892527268125590800987439685665826462111 : Rat) / 26883718015461005275603270079706596055448530724928428432529532) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4023152550366444231826684892527268125590800987439685665826462111 : Rat) / 53767436030922010551206540159413192110897061449856856865059064) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0749_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0749
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0750 : Poly :=
[
  term ((1396371386195676 : Rat) / 1048898954827367) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 750 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0750 : Poly :=
[
  term ((2792742772391352 : Rat) / 1048898954827367) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1396371386195676 : Rat) / 1048898954827367) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0750_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0750
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0751 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 751 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0751 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1)],
  term ((-114763001504190054808868916461224119038042 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0751_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0751
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0752 : Poly :=
[
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 752 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0752 : Poly :=
[
  term ((-18950625794701781122592 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0752_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0752
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0753 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 753 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0753 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(2, 1), (3, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0753_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0753
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0754 : Poly :=
[
  term ((-2081612327941872 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 754 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0754 : Poly :=
[
  term ((-4163224655883744 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2081612327941872 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0754_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0754
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0755 : Poly :=
[
  term ((-95470198600259414753884326617617681182514329526491488577183753568461692365607717 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(2, 1), (3, 1), (10, 1), (13, 1)]
]

/-- Partial product 755 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0755 : Poly :=
[
  term ((95470198600259414753884326617617681182514329526491488577183753568461692365607717 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-95470198600259414753884326617617681182514329526491488577183753568461692365607717 : Rat) / 123297691380024699721294133416854321349814057227250457227684372504883721626000) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0755_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0755
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0756 : Poly :=
[
  term ((141844910422789883587067015125792134940829 : Rat) / 1582686999025917926728514727054631971420) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 756 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0756 : Poly :=
[
  term ((-141844910422789883587067015125792134940829 : Rat) / 1582686999025917926728514727054631971420) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((141844910422789883587067015125792134940829 : Rat) / 791343499512958963364257363527315985710) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0756_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0756
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0757 : Poly :=
[
  term ((5855654224517523283076 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 757 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0757 : Poly :=
[
  term ((-5855654224517523283076 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((11711308449035046566152 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0757_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0757
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0758 : Poly :=
[
  term ((-8743854060034135986066268 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 758 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0758 : Poly :=
[
  term ((-17487708120068271972132536 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((8743854060034135986066268 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0758_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0758
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0759 : Poly :=
[
  term ((8365090030717008544414051542794125266371203798849719033157671857 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 759 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0759 : Poly :=
[
  term ((-8365090030717008544414051542794125266371203798849719033157671857 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((8365090030717008544414051542794125266371203798849719033157671857 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (3, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0759_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0759
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0760 : Poly :=
[
  term ((-3586292146721196 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 760 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0760 : Poly :=
[
  term ((3586292146721196 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7172584293442392 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0760_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0760
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0761 : Poly :=
[
  term ((1100160500493828316839338988562463183990957355029748313074464630863461769283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (3, 1), (10, 1), (15, 1)]
]

/-- Partial product 761 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0761 : Poly :=
[
  term ((1100160500493828316839338988562463183990957355029748313074464630863461769283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1100160500493828316839338988562463183990957355029748313074464630863461769283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0761_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0761
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0762 : Poly :=
[
  term ((830757862724247146 : Rat) / 218021139896259855) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 762 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0762 : Poly :=
[
  term ((1661515725448494292 : Rat) / 218021139896259855) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-830757862724247146 : Rat) / 218021139896259855) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0762_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0762
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0763 : Poly :=
[
  term ((-31760409280890836699781336251610373444717710347561317337487490059147601435872749 : Rat) / 39455261241607903910814122693393382831940498312720146312858999201562790920320) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 763 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0763 : Poly :=
[
  term ((31760409280890836699781336251610373444717710347561317337487490059147601435872749 : Rat) / 39455261241607903910814122693393382831940498312720146312858999201562790920320) [(2, 1), (3, 1), (11, 1)],
  term ((-31760409280890836699781336251610373444717710347561317337487490059147601435872749 : Rat) / 19727630620803951955407061346696691415970249156360073156429499600781395460160) [(2, 1), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0763_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0763
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0764 : Poly :=
[
  term ((24001614007695736136657354975527694380614186512862668220648181806690592114011701 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 764 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0764 : Poly :=
[
  term ((-24001614007695736136657354975527694380614186512862668220648181806690592114011701 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (3, 1), (11, 1), (12, 1)],
  term ((24001614007695736136657354975527694380614186512862668220648181806690592114011701 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0764_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0764
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0765 : Poly :=
[
  term ((-273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 765 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0765 : Poly :=
[
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0765_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0765
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0766 : Poly :=
[
  term ((-5036825696373545162176 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 766 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0766 : Poly :=
[
  term ((5036825696373545162176 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10073651392747090324352 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0766_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0766
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0767 : Poly :=
[
  term ((-3949105012432785982776532 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 767 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0767 : Poly :=
[
  term ((-7898210024865571965553064 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3949105012432785982776532 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0767_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0767
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0768 : Poly :=
[
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (3, 1), (11, 1), (12, 2)]
]

/-- Partial product 768 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0768 : Poly :=
[
  term ((-273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((546010123283707123557216904387544999281666631321732310445611407494 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0768_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0768
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0769 : Poly :=
[
  term ((10073651392747090324352 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 769 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0769 : Poly :=
[
  term ((20147302785494180648704 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-10073651392747090324352 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0769_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0769
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0770 : Poly :=
[
  term ((348175108231186955647824647722491591782961716284982473842879504214425531034 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 770 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0770 : Poly :=
[
  term ((696350216462373911295649295444983183565923432569964947685759008428851062068 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-348175108231186955647824647722491591782961716284982473842879504214425531034 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0770_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0770
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0771 : Poly :=
[
  term ((-678762188063428397896 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 771 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0771 : Poly :=
[
  term ((-1357524376126856795792 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((678762188063428397896 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0771_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0771
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0772 : Poly :=
[
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(2, 1), (3, 1), (11, 1), (13, 2)]
]

/-- Partial product 772 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0772 : Poly :=
[
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(2, 1), (3, 1), (11, 1), (13, 2)],
  term ((-2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0772_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0772
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0773 : Poly :=
[
  term ((-8398469190729412326768 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 773 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0773 : Poly :=
[
  term ((-16796938381458824653536 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((8398469190729412326768 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0773_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0773
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0774 : Poly :=
[
  term ((-29958685882275380849088142929554644664298597421213691580469232430597092657936519 : Rat) / 51914817423168294619492266701833398463079603043052824095867104212582619632000) [(2, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 774 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0774 : Poly :=
[
  term ((29958685882275380849088142929554644664298597421213691580469232430597092657936519 : Rat) / 51914817423168294619492266701833398463079603043052824095867104212582619632000) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-29958685882275380849088142929554644664298597421213691580469232430597092657936519 : Rat) / 25957408711584147309746133350916699231539801521526412047933552106291309816000) [(2, 1), (3, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0774_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0774
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0775 : Poly :=
[
  term ((-571077101219723493568546 : Rat) / 66459166053436995339795) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 775 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0775 : Poly :=
[
  term ((571077101219723493568546 : Rat) / 66459166053436995339795) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1142154202439446987137092 : Rat) / 66459166053436995339795) [(2, 1), (3, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0775_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0775
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0776 : Poly :=
[
  term ((81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(2, 1), (3, 1), (11, 1), (15, 2)]
]

/-- Partial product 776 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0776 : Poly :=
[
  term ((163691816024574365805547320622062448980321122964552911750737929774628123522 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(2, 1), (3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0776_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0776
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0777 : Poly :=
[
  term ((4475284955904352474328 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 777 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0777 : Poly :=
[
  term ((8950569911808704948656 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4475284955904352474328 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0777_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0777
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0778 : Poly :=
[
  term ((-3196094378986240425095726 : Rat) / 252544831003060582291221) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 778 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0778 : Poly :=
[
  term ((-6392188757972480850191452 : Rat) / 252544831003060582291221) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((3196094378986240425095726 : Rat) / 252544831003060582291221) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0778_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0778
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0779 : Poly :=
[
  term ((-15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (13, 1)]
]

/-- Partial product 779 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0779 : Poly :=
[
  term ((15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (13, 1)],
  term ((-30975548608346060567276294787193410623728 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0779_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0779
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0780 : Poly :=
[
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 780 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0780 : Poly :=
[
  term ((2841617327957868640896 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0780_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0780
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0781 : Poly :=
[
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 781 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0781 : Poly :=
[
  term ((15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0781_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0781
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0782 : Poly :=
[
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 782 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0782 : Poly :=
[
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0782_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0782
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0783 : Poly :=
[
  term ((5796645229411623948431354058978338789418190250141234786052881284134097560174448857467 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 783 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0783 : Poly :=
[
  term ((-5796645229411623948431354058978338789418190250141234786052881284134097560174448857467 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((5796645229411623948431354058978338789418190250141234786052881284134097560174448857467 : Rat) / 964681137357313250619405299853468210240945183746007577349402530478210238001824000) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0783_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0783
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0784 : Poly :=
[
  term ((151468046208947825915679929103699431466889913409132487179559025311 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 784 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0784 : Poly :=
[
  term ((-151468046208947825915679929103699431466889913409132487179559025311 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0784_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0784
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0785 : Poly :=
[
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 785 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0785 : Poly :=
[
  term ((-89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0785_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0785
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0786 : Poly :=
[
  term ((222337450837410871283637502 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 786 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0786 : Poly :=
[
  term ((444674901674821742567275004 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-222337450837410871283637502 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0786_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0786
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0787 : Poly :=
[
  term ((-58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 787 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0787 : Poly :=
[
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0787_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0787
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0788 : Poly :=
[
  term ((-2348872156474817556622 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 788 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0788 : Poly :=
[
  term ((2348872156474817556622 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4697744312949635113244 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0788_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0788
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0789 : Poly :=
[
  term ((-187657018391505785260793098300314634589661845008369429213052283354344641010117129 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 789 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0789 : Poly :=
[
  term ((-187657018391505785260793098300314634589661845008369429213052283354344641010117129 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((187657018391505785260793098300314634589661845008369429213052283354344641010117129 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0789_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0789
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0790 : Poly :=
[
  term ((-7534639110681136616908 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 790 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0790 : Poly :=
[
  term ((-15069278221362273233816 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7534639110681136616908 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0790_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0790
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0791 : Poly :=
[
  term ((-302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (12, 2), (13, 1)]
]

/-- Partial product 791 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0791 : Poly :=
[
  term ((302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (12, 2), (13, 1)],
  term ((-605872184835791303662719716414797725867559653636529948718236101244 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0791_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0791
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0792 : Poly :=
[
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 792 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0792 : Poly :=
[
  term ((-357275063159620119200192 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0792_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0792
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0793 : Poly :=
[
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (3, 1), (12, 2), (15, 1)]
]

/-- Partial product 793 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0793 : Poly :=
[
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (3, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0793_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0793
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0794 : Poly :=
[
  term ((4697744312949635113244 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 794 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0794 : Poly :=
[
  term ((9395488625899270226488 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4697744312949635113244 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0794_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0794
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0795 : Poly :=
[
  term ((-2372647952467253383252976397617940168654381437893691929397757157685845710740634843431 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 795 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0795 : Poly :=
[
  term ((2372647952467253383252976397617940168654381437893691929397757157685845710740634843431 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(2, 1), (3, 1), (13, 1)],
  term ((-2372647952467253383252976397617940168654381437893691929397757157685845710740634843431 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0795_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0795
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0796 : Poly :=
[
  term ((-9563362546534871160928633708841870078134394485255662072270193451300548455371181047 : Rat) / 67696921919811456183817915779190751595855802368140882621010703893207736000128000) [(2, 1), (3, 1), (13, 1), (14, 1)]
]

/-- Partial product 796 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0796 : Poly :=
[
  term ((9563362546534871160928633708841870078134394485255662072270193451300548455371181047 : Rat) / 67696921919811456183817915779190751595855802368140882621010703893207736000128000) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-9563362546534871160928633708841870078134394485255662072270193451300548455371181047 : Rat) / 33848460959905728091908957889595375797927901184070441310505351946603868000064000) [(2, 1), (3, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0796_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0796
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0797 : Poly :=
[
  term ((-152776783819006343297969 : Rat) / 66459166053436995339795) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 797 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0797 : Poly :=
[
  term ((152776783819006343297969 : Rat) / 66459166053436995339795) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-305553567638012686595938 : Rat) / 66459166053436995339795) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0797_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0797
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0798 : Poly :=
[
  term ((-29592308376939716284655228005679629281423803179284055995325233619296982157 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (3, 1), (13, 1), (15, 2)]
]

/-- Partial product 798 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0798 : Poly :=
[
  term ((-29592308376939716284655228005679629281423803179284055995325233619296982157 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((29592308376939716284655228005679629281423803179284055995325233619296982157 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0798_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0798
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0799 : Poly :=
[
  term ((-22135811188873407144892 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 799 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0799 : Poly :=
[
  term ((-44271622377746814289784 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((22135811188873407144892 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0799_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0799
        rs_R009_ueqv_R009NYNYN_generator_28_0700_0799 =
      rs_R009_ueqv_R009NYNYN_partial_28_0799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0700_0799 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0700,
  rs_R009_ueqv_R009NYNYN_partial_28_0701,
  rs_R009_ueqv_R009NYNYN_partial_28_0702,
  rs_R009_ueqv_R009NYNYN_partial_28_0703,
  rs_R009_ueqv_R009NYNYN_partial_28_0704,
  rs_R009_ueqv_R009NYNYN_partial_28_0705,
  rs_R009_ueqv_R009NYNYN_partial_28_0706,
  rs_R009_ueqv_R009NYNYN_partial_28_0707,
  rs_R009_ueqv_R009NYNYN_partial_28_0708,
  rs_R009_ueqv_R009NYNYN_partial_28_0709,
  rs_R009_ueqv_R009NYNYN_partial_28_0710,
  rs_R009_ueqv_R009NYNYN_partial_28_0711,
  rs_R009_ueqv_R009NYNYN_partial_28_0712,
  rs_R009_ueqv_R009NYNYN_partial_28_0713,
  rs_R009_ueqv_R009NYNYN_partial_28_0714,
  rs_R009_ueqv_R009NYNYN_partial_28_0715,
  rs_R009_ueqv_R009NYNYN_partial_28_0716,
  rs_R009_ueqv_R009NYNYN_partial_28_0717,
  rs_R009_ueqv_R009NYNYN_partial_28_0718,
  rs_R009_ueqv_R009NYNYN_partial_28_0719,
  rs_R009_ueqv_R009NYNYN_partial_28_0720,
  rs_R009_ueqv_R009NYNYN_partial_28_0721,
  rs_R009_ueqv_R009NYNYN_partial_28_0722,
  rs_R009_ueqv_R009NYNYN_partial_28_0723,
  rs_R009_ueqv_R009NYNYN_partial_28_0724,
  rs_R009_ueqv_R009NYNYN_partial_28_0725,
  rs_R009_ueqv_R009NYNYN_partial_28_0726,
  rs_R009_ueqv_R009NYNYN_partial_28_0727,
  rs_R009_ueqv_R009NYNYN_partial_28_0728,
  rs_R009_ueqv_R009NYNYN_partial_28_0729,
  rs_R009_ueqv_R009NYNYN_partial_28_0730,
  rs_R009_ueqv_R009NYNYN_partial_28_0731,
  rs_R009_ueqv_R009NYNYN_partial_28_0732,
  rs_R009_ueqv_R009NYNYN_partial_28_0733,
  rs_R009_ueqv_R009NYNYN_partial_28_0734,
  rs_R009_ueqv_R009NYNYN_partial_28_0735,
  rs_R009_ueqv_R009NYNYN_partial_28_0736,
  rs_R009_ueqv_R009NYNYN_partial_28_0737,
  rs_R009_ueqv_R009NYNYN_partial_28_0738,
  rs_R009_ueqv_R009NYNYN_partial_28_0739,
  rs_R009_ueqv_R009NYNYN_partial_28_0740,
  rs_R009_ueqv_R009NYNYN_partial_28_0741,
  rs_R009_ueqv_R009NYNYN_partial_28_0742,
  rs_R009_ueqv_R009NYNYN_partial_28_0743,
  rs_R009_ueqv_R009NYNYN_partial_28_0744,
  rs_R009_ueqv_R009NYNYN_partial_28_0745,
  rs_R009_ueqv_R009NYNYN_partial_28_0746,
  rs_R009_ueqv_R009NYNYN_partial_28_0747,
  rs_R009_ueqv_R009NYNYN_partial_28_0748,
  rs_R009_ueqv_R009NYNYN_partial_28_0749,
  rs_R009_ueqv_R009NYNYN_partial_28_0750,
  rs_R009_ueqv_R009NYNYN_partial_28_0751,
  rs_R009_ueqv_R009NYNYN_partial_28_0752,
  rs_R009_ueqv_R009NYNYN_partial_28_0753,
  rs_R009_ueqv_R009NYNYN_partial_28_0754,
  rs_R009_ueqv_R009NYNYN_partial_28_0755,
  rs_R009_ueqv_R009NYNYN_partial_28_0756,
  rs_R009_ueqv_R009NYNYN_partial_28_0757,
  rs_R009_ueqv_R009NYNYN_partial_28_0758,
  rs_R009_ueqv_R009NYNYN_partial_28_0759,
  rs_R009_ueqv_R009NYNYN_partial_28_0760,
  rs_R009_ueqv_R009NYNYN_partial_28_0761,
  rs_R009_ueqv_R009NYNYN_partial_28_0762,
  rs_R009_ueqv_R009NYNYN_partial_28_0763,
  rs_R009_ueqv_R009NYNYN_partial_28_0764,
  rs_R009_ueqv_R009NYNYN_partial_28_0765,
  rs_R009_ueqv_R009NYNYN_partial_28_0766,
  rs_R009_ueqv_R009NYNYN_partial_28_0767,
  rs_R009_ueqv_R009NYNYN_partial_28_0768,
  rs_R009_ueqv_R009NYNYN_partial_28_0769,
  rs_R009_ueqv_R009NYNYN_partial_28_0770,
  rs_R009_ueqv_R009NYNYN_partial_28_0771,
  rs_R009_ueqv_R009NYNYN_partial_28_0772,
  rs_R009_ueqv_R009NYNYN_partial_28_0773,
  rs_R009_ueqv_R009NYNYN_partial_28_0774,
  rs_R009_ueqv_R009NYNYN_partial_28_0775,
  rs_R009_ueqv_R009NYNYN_partial_28_0776,
  rs_R009_ueqv_R009NYNYN_partial_28_0777,
  rs_R009_ueqv_R009NYNYN_partial_28_0778,
  rs_R009_ueqv_R009NYNYN_partial_28_0779,
  rs_R009_ueqv_R009NYNYN_partial_28_0780,
  rs_R009_ueqv_R009NYNYN_partial_28_0781,
  rs_R009_ueqv_R009NYNYN_partial_28_0782,
  rs_R009_ueqv_R009NYNYN_partial_28_0783,
  rs_R009_ueqv_R009NYNYN_partial_28_0784,
  rs_R009_ueqv_R009NYNYN_partial_28_0785,
  rs_R009_ueqv_R009NYNYN_partial_28_0786,
  rs_R009_ueqv_R009NYNYN_partial_28_0787,
  rs_R009_ueqv_R009NYNYN_partial_28_0788,
  rs_R009_ueqv_R009NYNYN_partial_28_0789,
  rs_R009_ueqv_R009NYNYN_partial_28_0790,
  rs_R009_ueqv_R009NYNYN_partial_28_0791,
  rs_R009_ueqv_R009NYNYN_partial_28_0792,
  rs_R009_ueqv_R009NYNYN_partial_28_0793,
  rs_R009_ueqv_R009NYNYN_partial_28_0794,
  rs_R009_ueqv_R009NYNYN_partial_28_0795,
  rs_R009_ueqv_R009NYNYN_partial_28_0796,
  rs_R009_ueqv_R009NYNYN_partial_28_0797,
  rs_R009_ueqv_R009NYNYN_partial_28_0798,
  rs_R009_ueqv_R009NYNYN_partial_28_0799
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0700_0799 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(2, 1), (3, 1), (8, 1), (13, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 42577000074770030590505059149419345324000999776147302336610939422252000) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((85184708823587271392 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 85154000149540061181010118298838690648001999552294604673221878844504000) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-42592354411793635696 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 1), (3, 1), (8, 1), (15, 1)],
  term ((21296177205896817848 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((87415666172446026253622984357990605194943 : Rat) / 1130490713589941376234653376467594265300) [(2, 1), (3, 1), (9, 1)],
  term ((437122755035103944519927206371001426739647 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-2042656786867588678267704250041253472147059 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1)],
  term ((225041753735519480368080616445936174954279 : Rat) / 1978358748782397408410643408818289964275) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-765734608828401795888 : Rat) / 867851652931479664231) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 2)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((1737603099979595118012 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2)],
  term ((415521500975212250826203828836216554791462 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((-1413867376731274973664 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-1956251770628021903492810739902113984354319 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((1664101949401139731692 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-513576756550936550888868970355299143187619 : Rat) / 6594529162607991361368811362727633214250) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 2)],
  term ((2621270210436641976552 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-1487368527309730359984 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1)],
  term ((122766201736782921383248439727255513889582 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3759555509742011600736 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((253562072720507588031567317479009466040623 : Rat) / 471037797329142240097772240194830943875) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-8691156287076043037868308507454387751487713 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((29572819484743766361936 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2)],
  term ((13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-2588336404406244100368 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((7833803068741102637830075306656039288873812 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (12, 2), (14, 1)],
  term ((-26655560707774604172864 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1278871982648117439859095448076099120671183 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((4351532642807052025776 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2175766321403526012888 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2325483283468720745930614035285896942086637 : Rat) / 13189058325215982722737622725455266428500) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((1278871982648117439859095448076099120671183 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-2175766321403526012888 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((5934575482701360495948 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((45123853596575810528328063199913076979679 : Rat) / 1041241446727577583374022846746468402250) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((-76769967814977952344 : Rat) / 228382013929336753745) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1278871982648117439859095448076099120671183 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((1087883160701763006444 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-74360868406558142124 : Rat) / 123978807561639952033) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-552681867688050456546342474951924984536 : Rat) / 13242026430939741689495605146039424125) [(2, 1), (3, 1), (10, 1), (11, 1)],
  term ((413050512151767374730353465310863831807134 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((-146859900739818321381075065297554430758616 : Rat) / 219817638753599712045627045424254440475) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((578771806248218767168 : Rat) / 123978807561639952033) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1313347566014301193232 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2)],
  term ((52458011773967510031618059505117434183536 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((1068655596849965797504 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-28165284113383384319376645967981194106 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1257792556235256357712 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((61182236880219839447341484991991685751388 : Rat) / 366362731255999520076045075707090734125) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-1981257314045529816672 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((1124210606629010633024 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((564161958776264164500229799601692512049869 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1)],
  term ((-62154345952835919190466425783230457156889 : Rat) / 237403049853887689009277209058194795713) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10263444979901699654864 : Rat) / 2603554958794438992693) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((23289784225416526496836 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((80399294021332060620381561498997444708778099383999643776228292693 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((18508393242768528 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((2081612327941872 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4023152550366444231826684892527268125590800987439685665826462111 : Rat) / 53767436030922010551206540159413192110897061449856856865059064) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1396371386195676 : Rat) / 1048898954827367) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1)],
  term ((-114763001504190054808868916461224119038042 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-18950625794701781122592 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(2, 1), (3, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-4163224655883744 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1)],
  term ((2081612327941872 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((95470198600259414753884326617617681182514329526491488577183753568461692365607717 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-106520488392176758553144904516855823430756818742138541681147669668506974655346417 : Rat) / 123297691380024699721294133416854321349814057227250457227684372504883721626000) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-19191703499402871247507652 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((141844910422789883587067015125792134940829 : Rat) / 791343499512958963364257363527315985710) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 2)],
  term ((11711308449035046566152 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((8743854060034135986066268 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((1093796176879203217757082162074700329002859448941109369264517127540054957783 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((86632325620455560488 : Rat) / 10683035854916732895) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8365090030717008544414051542794125266371203798849719033157671857 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-7172584293442392 : Rat) / 7342292683791569) [(2, 1), (3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1100160500493828316839338988562463183990957355029748313074464630863461769283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-830757862724247146 : Rat) / 218021139896259855) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((31760409280890836699781336251610373444717710347561317337487490059147601435872749 : Rat) / 39455261241607903910814122693393382831940498312720146312858999201562790920320) [(2, 1), (3, 1), (11, 1)],
  term ((-24001614007695736136657354975527694380614186512862668220648181806690592114011701 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (3, 1), (11, 1), (12, 1)],
  term ((4587734398579415039167614728025165697545724807272488364906952713159359510047177 : Rat) / 8503289060691358601468560925300298024125107394982790153633405000336808388000) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((2361803918647339529799448 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-10073651392747090324352 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((3949105012432785982776532 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((546010123283707123557216904387544999281666631321732310445611407494 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((20147302785494180648704 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-10073651392747090324352 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((696350216462373911295649295444983183565923432569964947685759008428851062068 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357524376126856795792 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-348175108231186955647824647722491591782961716284982473842879504214425531034 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((678762188063428397896 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(2, 1), (3, 1), (11, 1), (13, 2)],
  term ((-2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 5291908411740749350901198128248199481350516725138781626753735) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-16796938381458824653536 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((8398469190729412326768 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1018805432281309598856392096918980423614212166375005726845459086776035311292843589 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((163691816024574365805547320622062448980321122964552911750737929774628123522 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((8950569911808704948656 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21110478866687657873154886 : Rat) / 1262724155015302911456105) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-29958685882275380849088142929554644664298597421213691580469232430597092657936519 : Rat) / 25957408711584147309746133350916699231539801521526412047933552106291309816000) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-1142154202439446987137092 : Rat) / 66459166053436995339795) [(2, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-81845908012287182902773660311031224490160561482276455875368964887314061761 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-4475284955904352474328 : Rat) / 4339258264657398321155) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((3196094378986240425095726 : Rat) / 252544831003060582291221) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term ((15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (13, 1)],
  term ((-30975548608346060567276294787193410623728 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (13, 1), (14, 1)],
  term ((2841617327957868640896 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5796645229411623948431354058978338789418190250141234786052881284134097560174448857467 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((64558613712347012913918818215504642314428462104683085296092449363408308052549384249 : Rat) / 11622664305509798200233798793415279641457170888506115389751837716604942626528000) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((418683140829959378895461036 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 2)],
  term ((178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-222337450837410871283637502 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-316894683144147268415465113608319731350689679235679414552397748716737202115411317 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12720406064887455677194 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4697744312949635113244 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((187657018391505785260793098300314634589661845008369429213052283354344641010117129 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((7534639110681136616908 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (12, 2), (13, 1)],
  term ((-605872184835791303662719716414797725867559653636529948718236101244 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-357275063159620119200192 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((9395488625899270226488 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-4697744312949635113244 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((2372647952467253383252976397617940168654381437893691929397757157685845710740634843431 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(2, 1), (3, 1), (13, 1)],
  term ((-4200184239782019110333020673831893742855102390127811120676113288647560159525112367183 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-29592308376939716284655228005679629281423803179284055995325233619296982157 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-44271622377746814289784 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((152776783819006343297969 : Rat) / 66459166053436995339795) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9563362546534871160928633708841870078134394485255662072270193451300548455371181047 : Rat) / 33848460959905728091908957889595375797927901184070441310505351946603868000064000) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-305553567638012686595938 : Rat) / 66459166053436995339795) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((29592308376939716284655228005679629281423803179284055995325233619296982157 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((22135811188873407144892 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 700 through 799. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0700_0799_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0700_0799
      rs_R009_ueqv_R009NYNYN_block_28_0700_0799 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
