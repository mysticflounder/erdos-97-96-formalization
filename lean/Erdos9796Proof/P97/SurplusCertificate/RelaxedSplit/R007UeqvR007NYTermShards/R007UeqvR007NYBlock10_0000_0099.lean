/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 10:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_10_0000_0099 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0000 : Poly :=
[
  term ((1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0000 : Poly :=
[
  term ((3340611397593934633270 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((3340611397593934633270 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0000
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0001 : Poly :=
[
  term ((-334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0001 : Poly :=
[
  term ((-668122279518786926654 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-668122279518786926654 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 2), (15, 1), (16, 1)],
  term ((334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0001
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0002 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0002 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0002
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0003 : Poly :=
[
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0003 : Poly :=
[
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0003
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0004 : Poly :=
[
  term ((56539997303700370170175 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0004 : Poly :=
[
  term ((56539997303700370170175 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((56539997303700370170175 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-56539997303700370170175 : Rat) / 1889586434159288359614) [(0, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-56539997303700370170175 : Rat) / 1889586434159288359614) [(0, 1), (5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0004
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0005 : Poly :=
[
  term ((-11307999460740074034035 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0005 : Poly :=
[
  term ((-11307999460740074034035 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-11307999460740074034035 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((11307999460740074034035 : Rat) / 629862144719762786538) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((11307999460740074034035 : Rat) / 629862144719762786538) [(0, 1), (5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0005
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0006 : Poly :=
[
  term ((-44990756928298703683565 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0006 : Poly :=
[
  term ((-89981513856597407367130 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-89981513856597407367130 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((44990756928298703683565 : Rat) / 314931072359881393269) [(0, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term ((44990756928298703683565 : Rat) / 314931072359881393269) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0006
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0007 : Poly :=
[
  term ((8998151385659740736713 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0007 : Poly :=
[
  term ((17996302771319481473426 : Rat) / 104977024119960464423) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((17996302771319481473426 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-8998151385659740736713 : Rat) / 104977024119960464423) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-8998151385659740736713 : Rat) / 104977024119960464423) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0007
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0008 : Poly :=
[
  term ((2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0008 : Poly :=
[
  term ((2168193526711736267725 : Rat) / 55576071592920245871) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((2168193526711736267725 : Rat) / 55576071592920245871) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0008
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0009 : Poly :=
[
  term ((-433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0009 : Poly :=
[
  term ((-433638705342347253545 : Rat) / 18525357197640081957) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-433638705342347253545 : Rat) / 18525357197640081957) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0009
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0010 : Poly :=
[
  term ((-3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0010 : Poly :=
[
  term ((-3122593501267461466685 : Rat) / 44990153194268770467) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3122593501267461466685 : Rat) / 44990153194268770467) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0010
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0011 : Poly :=
[
  term ((-1296705423710109681215 : Rat) / 89980306388537540934) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0011 : Poly :=
[
  term ((-1296705423710109681215 : Rat) / 44990153194268770467) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1296705423710109681215 : Rat) / 44990153194268770467) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1296705423710109681215 : Rat) / 89980306388537540934) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((1296705423710109681215 : Rat) / 89980306388537540934) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0011
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0012 : Poly :=
[
  term ((144238646036920786726675 : Rat) / 944793217079644179807) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 12 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0012 : Poly :=
[
  term ((288477292073841573453350 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (4, 1), (11, 2), (16, 1)],
  term ((288477292073841573453350 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-144238646036920786726675 : Rat) / 944793217079644179807) [(0, 1), (4, 2), (11, 2), (16, 1)],
  term ((-144238646036920786726675 : Rat) / 944793217079644179807) [(0, 1), (5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0012
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0013 : Poly :=
[
  term ((624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0013 : Poly :=
[
  term ((624518700253492293337 : Rat) / 14996717731422923489) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((624518700253492293337 : Rat) / 14996717731422923489) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0013
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0014 : Poly :=
[
  term ((-9723704089759509384433 : Rat) / 209954048239920928846) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0014 : Poly :=
[
  term ((-9723704089759509384433 : Rat) / 104977024119960464423) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-9723704089759509384433 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((9723704089759509384433 : Rat) / 209954048239920928846) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((9723704089759509384433 : Rat) / 209954048239920928846) [(0, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0014
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0015 : Poly :=
[
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0015 : Poly :=
[
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (4, 2), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (5, 2), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0015
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0016 : Poly :=
[
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0016 : Poly :=
[
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0016
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0017 : Poly :=
[
  term ((1074913322906493239275 : Rat) / 89980306388537540934) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0017 : Poly :=
[
  term ((1074913322906493239275 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (4, 2), (11, 1), (16, 1)],
  term ((1074913322906493239275 : Rat) / 44990153194268770467) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-1074913322906493239275 : Rat) / 89980306388537540934) [(1, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((-1074913322906493239275 : Rat) / 89980306388537540934) [(1, 1), (4, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0017
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0018 : Poly :=
[
  term ((-214982664581298647855 : Rat) / 29993435462845846978) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0018 : Poly :=
[
  term ((-214982664581298647855 : Rat) / 14996717731422923489) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((-214982664581298647855 : Rat) / 14996717731422923489) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((214982664581298647855 : Rat) / 29993435462845846978) [(1, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((214982664581298647855 : Rat) / 29993435462845846978) [(1, 1), (4, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0018
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0019 : Poly :=
[
  term ((5257797444456988943465 : Rat) / 629862144719762786538) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0019 : Poly :=
[
  term ((5257797444456988943465 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((5257797444456988943465 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-5257797444456988943465 : Rat) / 629862144719762786538) [(1, 1), (4, 2), (8, 1), (11, 1), (16, 1)],
  term ((-5257797444456988943465 : Rat) / 629862144719762786538) [(1, 1), (5, 2), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0019
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0020 : Poly :=
[
  term ((-1051559488891397788693 : Rat) / 209954048239920928846) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0020 : Poly :=
[
  term ((-1051559488891397788693 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1051559488891397788693 : Rat) / 104977024119960464423) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((1051559488891397788693 : Rat) / 209954048239920928846) [(1, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((1051559488891397788693 : Rat) / 209954048239920928846) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0020
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0021 : Poly :=
[
  term ((-144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0021 : Poly :=
[
  term ((-289062184602842820048850 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-289062184602842820048850 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0021
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0022 : Poly :=
[
  term ((28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0022 : Poly :=
[
  term ((57812436920568564009770 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((57812436920568564009770 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0022
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0023 : Poly :=
[
  term ((80199458850907595910905 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 23 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0023 : Poly :=
[
  term ((80199458850907595910905 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((80199458850907595910905 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-80199458850907595910905 : Rat) / 1889586434159288359614) [(1, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((-80199458850907595910905 : Rat) / 1889586434159288359614) [(1, 1), (5, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0023
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0024 : Poly :=
[
  term ((31756354857895449811735 : Rat) / 629862144719762786538) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 24 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0024 : Poly :=
[
  term ((31756354857895449811735 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((31756354857895449811735 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-31756354857895449811735 : Rat) / 629862144719762786538) [(1, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((-31756354857895449811735 : Rat) / 629862144719762786538) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0024
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0025 : Poly :=
[
  term ((113727438988605891858770 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 25 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0025 : Poly :=
[
  term ((227454877977211783717540 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((227454877977211783717540 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-113727438988605891858770 : Rat) / 314931072359881393269) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-113727438988605891858770 : Rat) / 314931072359881393269) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0025
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0026 : Poly :=
[
  term ((-16039891770181519182181 : Rat) / 629862144719762786538) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0026 : Poly :=
[
  term ((-16039891770181519182181 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16039891770181519182181 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((16039891770181519182181 : Rat) / 629862144719762786538) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((16039891770181519182181 : Rat) / 629862144719762786538) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0026
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0027 : Poly :=
[
  term ((-6351270971579089962347 : Rat) / 209954048239920928846) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0027 : Poly :=
[
  term ((-6351270971579089962347 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6351270971579089962347 : Rat) / 104977024119960464423) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((6351270971579089962347 : Rat) / 209954048239920928846) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((6351270971579089962347 : Rat) / 209954048239920928846) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0027
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0028 : Poly :=
[
  term ((-22745487797721178371754 : Rat) / 104977024119960464423) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0028 : Poly :=
[
  term ((-45490975595442356743508 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-45490975595442356743508 : Rat) / 104977024119960464423) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((22745487797721178371754 : Rat) / 104977024119960464423) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((22745487797721178371754 : Rat) / 104977024119960464423) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0028
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0029 : Poly :=
[
  term ((318138305339935404701660 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 29 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0029 : Poly :=
[
  term ((-318138305339935404701660 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-318138305339935404701660 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((636276610679870809403320 : Rat) / 944793217079644179807) [(2, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((636276610679870809403320 : Rat) / 944793217079644179807) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0029
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0030 : Poly :=
[
  term ((-63627661067987080940332 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0030 : Poly :=
[
  term ((63627661067987080940332 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((63627661067987080940332 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-127255322135974161880664 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-127255322135974161880664 : Rat) / 314931072359881393269) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0030
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0031 : Poly :=
[
  term ((-456779542229606348695385 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 31 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0031 : Poly :=
[
  term ((-456779542229606348695385 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((456779542229606348695385 : Rat) / 1889586434159288359614) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((456779542229606348695385 : Rat) / 1889586434159288359614) [(2, 1), (5, 3), (11, 1), (16, 1)],
  term ((-456779542229606348695385 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0031
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0032 : Poly :=
[
  term ((91355908445921269739077 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0032 : Poly :=
[
  term ((91355908445921269739077 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-91355908445921269739077 : Rat) / 629862144719762786538) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-91355908445921269739077 : Rat) / 629862144719762786538) [(2, 1), (5, 3), (15, 1), (16, 1)],
  term ((91355908445921269739077 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0032
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0033 : Poly :=
[
  term ((-22553726918875329729955 : Rat) / 269940919165612622802) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 33 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0033 : Poly :=
[
  term ((-22553726918875329729955 : Rat) / 134970459582806311401) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((22553726918875329729955 : Rat) / 269940919165612622802) [(2, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term ((22553726918875329729955 : Rat) / 269940919165612622802) [(2, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-22553726918875329729955 : Rat) / 134970459582806311401) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0033
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0034 : Poly :=
[
  term ((4510745383775065945991 : Rat) / 89980306388537540934) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0034 : Poly :=
[
  term ((4510745383775065945991 : Rat) / 44990153194268770467) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4510745383775065945991 : Rat) / 89980306388537540934) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4510745383775065945991 : Rat) / 89980306388537540934) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((4510745383775065945991 : Rat) / 44990153194268770467) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0034
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0035 : Poly :=
[
  term ((-153035616702254605199645 : Rat) / 944793217079644179807) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 35 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0035 : Poly :=
[
  term ((-306071233404509210399290 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((153035616702254605199645 : Rat) / 944793217079644179807) [(2, 1), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((153035616702254605199645 : Rat) / 944793217079644179807) [(2, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-306071233404509210399290 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0035
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0036 : Poly :=
[
  term ((30607123340450921039929 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0036 : Poly :=
[
  term ((61214246680901842079858 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30607123340450921039929 : Rat) / 314931072359881393269) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-30607123340450921039929 : Rat) / 314931072359881393269) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((61214246680901842079858 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0036
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0037 : Poly :=
[
  term ((2453288725596739930135 : Rat) / 74101428790560327828) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0037 : Poly :=
[
  term ((2453288725596739930135 : Rat) / 37050714395280163914) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2453288725596739930135 : Rat) / 74101428790560327828) [(2, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2453288725596739930135 : Rat) / 74101428790560327828) [(2, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((2453288725596739930135 : Rat) / 37050714395280163914) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0037
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0038 : Poly :=
[
  term ((62865918515812916759470 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0038 : Poly :=
[
  term ((125731837031625833518940 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-62865918515812916759470 : Rat) / 944793217079644179807) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-62865918515812916759470 : Rat) / 944793217079644179807) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((125731837031625833518940 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0038
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0039 : Poly :=
[
  term ((-490657745119347986027 : Rat) / 24700476263520109276) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0039 : Poly :=
[
  term ((-490657745119347986027 : Rat) / 12350238131760054638) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((490657745119347986027 : Rat) / 24700476263520109276) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((490657745119347986027 : Rat) / 24700476263520109276) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-490657745119347986027 : Rat) / 12350238131760054638) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0039
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0040 : Poly :=
[
  term ((-12573183703162583351894 : Rat) / 314931072359881393269) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 40 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0040 : Poly :=
[
  term ((-25146367406325166703788 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((12573183703162583351894 : Rat) / 314931072359881393269) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((12573183703162583351894 : Rat) / 314931072359881393269) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-25146367406325166703788 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0040
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0041 : Poly :=
[
  term ((-34049026934726359938575 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 41 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0041 : Poly :=
[
  term ((-34049026934726359938575 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (4, 2), (11, 1), (16, 1)],
  term ((34049026934726359938575 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((34049026934726359938575 : Rat) / 1889586434159288359614) [(3, 1), (4, 3), (11, 1), (16, 1)],
  term ((-34049026934726359938575 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0041
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0042 : Poly :=
[
  term ((6809805386945271987715 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0042 : Poly :=
[
  term ((6809805386945271987715 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-6809805386945271987715 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-6809805386945271987715 : Rat) / 629862144719762786538) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((6809805386945271987715 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0042
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0043 : Poly :=
[
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 43 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0043 : Poly :=
[
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(3, 1), (4, 2), (8, 1), (11, 1), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0043
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0044 : Poly :=
[
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0044 : Poly :=
[
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0044
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0045 : Poly :=
[
  term ((12245138134376603844155 : Rat) / 77125976904460749372) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 45 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0045 : Poly :=
[
  term ((12245138134376603844155 : Rat) / 38562988452230374686) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-12245138134376603844155 : Rat) / 77125976904460749372) [(3, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((-12245138134376603844155 : Rat) / 77125976904460749372) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((12245138134376603844155 : Rat) / 38562988452230374686) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0045
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0046 : Poly :=
[
  term ((-22929218710996381342375 : Rat) / 44990153194268770467) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 46 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0046 : Poly :=
[
  term ((-45858437421992762684750 : Rat) / 44990153194268770467) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((22929218710996381342375 : Rat) / 44990153194268770467) [(3, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((22929218710996381342375 : Rat) / 44990153194268770467) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-45858437421992762684750 : Rat) / 44990153194268770467) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0046
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0047 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 47 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0047 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0047
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0048 : Poly :=
[
  term ((949577172568413034764905 : Rat) / 1259724289439525573076) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 48 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0048 : Poly :=
[
  term ((949577172568413034764905 : Rat) / 629862144719762786538) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-949577172568413034764905 : Rat) / 1259724289439525573076) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-949577172568413034764905 : Rat) / 1259724289439525573076) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((949577172568413034764905 : Rat) / 629862144719762786538) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0048
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0049 : Poly :=
[
  term ((-2449027626875320768831 : Rat) / 25708658968153583124) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0049 : Poly :=
[
  term ((-2449027626875320768831 : Rat) / 12854329484076791562) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((2449027626875320768831 : Rat) / 25708658968153583124) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((2449027626875320768831 : Rat) / 25708658968153583124) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2449027626875320768831 : Rat) / 12854329484076791562) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0049
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0050 : Poly :=
[
  term ((4585843742199276268475 : Rat) / 14996717731422923489) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0050 : Poly :=
[
  term ((9171687484398552536950 : Rat) / 14996717731422923489) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4585843742199276268475 : Rat) / 14996717731422923489) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4585843742199276268475 : Rat) / 14996717731422923489) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((9171687484398552536950 : Rat) / 14996717731422923489) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0050
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0051 : Poly :=
[
  term ((-189915434513682606952981 : Rat) / 419908096479841857692) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0051 : Poly :=
[
  term ((-189915434513682606952981 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((189915434513682606952981 : Rat) / 419908096479841857692) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((189915434513682606952981 : Rat) / 419908096479841857692) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-189915434513682606952981 : Rat) / 209954048239920928846) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0051
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0052 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 52 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0052 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (4, 2), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0052
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0053 : Poly :=
[
  term ((-45769512784756811588785 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 53 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0053 : Poly :=
[
  term ((-91539025569513623177570 : Rat) / 944793217079644179807) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-91539025569513623177570 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((45769512784756811588785 : Rat) / 944793217079644179807) [(4, 1), (5, 3), (11, 1), (16, 1)],
  term ((45769512784756811588785 : Rat) / 944793217079644179807) [(4, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0053
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0054 : Poly :=
[
  term ((9153902556951362317757 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0054 : Poly :=
[
  term ((18307805113902724635514 : Rat) / 314931072359881393269) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((18307805113902724635514 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-9153902556951362317757 : Rat) / 314931072359881393269) [(4, 1), (5, 3), (15, 1), (16, 1)],
  term ((-9153902556951362317757 : Rat) / 314931072359881393269) [(4, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0054
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0055 : Poly :=
[
  term ((411719781059933444751155 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0055 : Poly :=
[
  term ((411719781059933444751155 : Rat) / 944793217079644179807) [(2, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term ((411719781059933444751155 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-411719781059933444751155 : Rat) / 1889586434159288359614) [(4, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-411719781059933444751155 : Rat) / 1889586434159288359614) [(4, 3), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0055
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0056 : Poly :=
[
  term ((-82343956211986688950231 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0056 : Poly :=
[
  term ((-82343956211986688950231 : Rat) / 314931072359881393269) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-82343956211986688950231 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((82343956211986688950231 : Rat) / 629862144719762786538) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((82343956211986688950231 : Rat) / 629862144719762786538) [(4, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0056
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0057 : Poly :=
[
  term ((-2790737854788069213275 : Rat) / 629862144719762786538) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 57 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0057 : Poly :=
[
  term ((-2790737854788069213275 : Rat) / 314931072359881393269) [(2, 1), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(4, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0057
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0058 : Poly :=
[
  term ((558147570957613842655 : Rat) / 209954048239920928846) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0058 : Poly :=
[
  term ((558147570957613842655 : Rat) / 104977024119960464423) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(4, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0058
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0059 : Poly :=
[
  term ((-30623118384850080891010 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 59 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0059 : Poly :=
[
  term ((-61246236769700161782020 : Rat) / 944793217079644179807) [(2, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-61246236769700161782020 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((30623118384850080891010 : Rat) / 944793217079644179807) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((30623118384850080891010 : Rat) / 944793217079644179807) [(4, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0059
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0060 : Poly :=
[
  term ((4583946206332979473615 : Rat) / 89980306388537540934) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0060 : Poly :=
[
  term ((4583946206332979473615 : Rat) / 44990153194268770467) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((4583946206332979473615 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4583946206332979473615 : Rat) / 89980306388537540934) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4583946206332979473615 : Rat) / 89980306388537540934) [(4, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0060
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0061 : Poly :=
[
  term ((6124623676970016178202 : Rat) / 314931072359881393269) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0061 : Poly :=
[
  term ((12249247353940032356404 : Rat) / 314931072359881393269) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((12249247353940032356404 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6124623676970016178202 : Rat) / 314931072359881393269) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6124623676970016178202 : Rat) / 314931072359881393269) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0061
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0062 : Poly :=
[
  term ((-916789241266595894723 : Rat) / 29993435462845846978) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 62 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0062 : Poly :=
[
  term ((-916789241266595894723 : Rat) / 14996717731422923489) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-916789241266595894723 : Rat) / 14996717731422923489) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((916789241266595894723 : Rat) / 29993435462845846978) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((916789241266595894723 : Rat) / 29993435462845846978) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0062
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0063 : Poly :=
[
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 63 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0063 : Poly :=
[
  term ((2790737854788069213275 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((2790737854788069213275 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 629862144719762786538) [(4, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 629862144719762786538) [(5, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0063
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0064 : Poly :=
[
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0064 : Poly :=
[
  term ((-558147570957613842655 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-558147570957613842655 : Rat) / 104977024119960464423) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 209954048239920928846) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 209954048239920928846) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0064
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0065 : Poly :=
[
  term ((-92072614579002328007915 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 65 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0065 : Poly :=
[
  term ((-184145229158004656015830 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-184145229158004656015830 : Rat) / 944793217079644179807) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((92072614579002328007915 : Rat) / 944793217079644179807) [(4, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((92072614579002328007915 : Rat) / 944793217079644179807) [(5, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0065
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0066 : Poly :=
[
  term ((54700086006635250816875 : Rat) / 209954048239920928846) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 66 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0066 : Poly :=
[
  term ((54700086006635250816875 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((54700086006635250816875 : Rat) / 104977024119960464423) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-54700086006635250816875 : Rat) / 209954048239920928846) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-54700086006635250816875 : Rat) / 209954048239920928846) [(5, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0066
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0067 : Poly :=
[
  term ((-160098516306315226456945 : Rat) / 3779172868318576719228) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 67 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0067 : Poly :=
[
  term ((-160098516306315226456945 : Rat) / 1889586434159288359614) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-160098516306315226456945 : Rat) / 1889586434159288359614) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((160098516306315226456945 : Rat) / 3779172868318576719228) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((160098516306315226456945 : Rat) / 3779172868318576719228) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0067_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0067
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0068 : Poly :=
[
  term ((18414522915800465601583 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0068 : Poly :=
[
  term ((36829045831600931203166 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((36829045831600931203166 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-18414522915800465601583 : Rat) / 314931072359881393269) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18414522915800465601583 : Rat) / 314931072359881393269) [(5, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0068_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0068
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0069 : Poly :=
[
  term ((-32820051603981150490125 : Rat) / 209954048239920928846) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0069 : Poly :=
[
  term ((-32820051603981150490125 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32820051603981150490125 : Rat) / 104977024119960464423) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((32820051603981150490125 : Rat) / 209954048239920928846) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((32820051603981150490125 : Rat) / 209954048239920928846) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0069_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0069
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0070 : Poly :=
[
  term ((32019703261263045291389 : Rat) / 1259724289439525573076) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0070 : Poly :=
[
  term ((32019703261263045291389 : Rat) / 629862144719762786538) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((32019703261263045291389 : Rat) / 629862144719762786538) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-32019703261263045291389 : Rat) / 1259724289439525573076) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-32019703261263045291389 : Rat) / 1259724289439525573076) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0070_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0070
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0071 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 71 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0071 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(4, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(5, 2), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0071_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0071
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0072 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0072 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0072_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0072
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0073 : Poly :=
[
  term ((-613776177030094414951345 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 73 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0073 : Poly :=
[
  term ((-613776177030094414951345 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-613776177030094414951345 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((613776177030094414951345 : Rat) / 1889586434159288359614) [(4, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((613776177030094414951345 : Rat) / 1889586434159288359614) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0073_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0073
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0074 : Poly :=
[
  term ((564734946330651195963245 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 74 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0074 : Poly :=
[
  term ((564734946330651195963245 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((564734946330651195963245 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-564734946330651195963245 : Rat) / 1889586434159288359614) [(4, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-564734946330651195963245 : Rat) / 1889586434159288359614) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0074_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0074
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0075 : Poly :=
[
  term ((30231861040121181319640 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 75 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0075 : Poly :=
[
  term ((60463722080242362639280 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((60463722080242362639280 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-30231861040121181319640 : Rat) / 944793217079644179807) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-30231861040121181319640 : Rat) / 944793217079644179807) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0075_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0075
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0076 : Poly :=
[
  term ((122755235406018882990269 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0076 : Poly :=
[
  term ((122755235406018882990269 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((122755235406018882990269 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-122755235406018882990269 : Rat) / 629862144719762786538) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-122755235406018882990269 : Rat) / 629862144719762786538) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0076_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0076
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0077 : Poly :=
[
  term ((-112946989266130239192649 : Rat) / 629862144719762786538) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0077 : Poly :=
[
  term ((-112946989266130239192649 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112946989266130239192649 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((112946989266130239192649 : Rat) / 629862144719762786538) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((112946989266130239192649 : Rat) / 629862144719762786538) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0077_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0077
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0078 : Poly :=
[
  term ((-6046372208024236263928 : Rat) / 314931072359881393269) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0078 : Poly :=
[
  term ((-12092744416048472527856 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12092744416048472527856 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((6046372208024236263928 : Rat) / 314931072359881393269) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((6046372208024236263928 : Rat) / 314931072359881393269) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0078_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0078
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0079 : Poly :=
[
  term ((-720845106655228517020 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 79 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0079 : Poly :=
[
  term ((-1441690213310457034040 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1441690213310457034040 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((720845106655228517020 : Rat) / 104977024119960464423) [(4, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((720845106655228517020 : Rat) / 104977024119960464423) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0079_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0079
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0080 : Poly :=
[
  term ((-55066477686846135388183 : Rat) / 3779172868318576719228) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0080 : Poly :=
[
  term ((-55066477686846135388183 : Rat) / 1889586434159288359614) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-55066477686846135388183 : Rat) / 1889586434159288359614) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((55066477686846135388183 : Rat) / 3779172868318576719228) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((55066477686846135388183 : Rat) / 3779172868318576719228) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0080_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0080
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0081 : Poly :=
[
  term ((-5155867842353138444335 : Rat) / 539881838331225245604) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 81 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0081 : Poly :=
[
  term ((-5155867842353138444335 : Rat) / 269940919165612622802) [(2, 1), (4, 1), (8, 1), (11, 2), (16, 1)],
  term ((-5155867842353138444335 : Rat) / 269940919165612622802) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((5155867842353138444335 : Rat) / 539881838331225245604) [(4, 2), (8, 1), (11, 2), (16, 1)],
  term ((5155867842353138444335 : Rat) / 539881838331225245604) [(5, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0081_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0081
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0082 : Poly :=
[
  term ((432507063993137110212 : Rat) / 104977024119960464423) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0082 : Poly :=
[
  term ((865014127986274220424 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((865014127986274220424 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-432507063993137110212 : Rat) / 104977024119960464423) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-432507063993137110212 : Rat) / 104977024119960464423) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0082_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0082
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0083 : Poly :=
[
  term ((451300721321937157967 : Rat) / 37050714395280163914) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 83 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0083 : Poly :=
[
  term ((451300721321937157967 : Rat) / 18525357197640081957) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((451300721321937157967 : Rat) / 18525357197640081957) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-451300721321937157967 : Rat) / 37050714395280163914) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-451300721321937157967 : Rat) / 37050714395280163914) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0083_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0083
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0084 : Poly :=
[
  term ((29898813728725695957765 : Rat) / 419908096479841857692) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 84 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0084 : Poly :=
[
  term ((29898813728725695957765 : Rat) / 209954048239920928846) [(2, 1), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((29898813728725695957765 : Rat) / 209954048239920928846) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-29898813728725695957765 : Rat) / 419908096479841857692) [(4, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-29898813728725695957765 : Rat) / 419908096479841857692) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0084_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0084
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0085 : Poly :=
[
  term ((-17939288237235417574659 : Rat) / 419908096479841857692) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0085 : Poly :=
[
  term ((-17939288237235417574659 : Rat) / 209954048239920928846) [(2, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17939288237235417574659 : Rat) / 209954048239920928846) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17939288237235417574659 : Rat) / 419908096479841857692) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17939288237235417574659 : Rat) / 419908096479841857692) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0085_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0085
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0086 : Poly :=
[
  term ((-16173810094429153083830 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 86 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0086 : Poly :=
[
  term ((-32347620188858306167660 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-32347620188858306167660 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((16173810094429153083830 : Rat) / 314931072359881393269) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((16173810094429153083830 : Rat) / 314931072359881393269) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0086_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0086
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0087 : Poly :=
[
  term ((2256503606609685789835 : Rat) / 111152143185840491742) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 87 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0087 : Poly :=
[
  term ((2256503606609685789835 : Rat) / 55576071592920245871) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2256503606609685789835 : Rat) / 55576071592920245871) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2256503606609685789835 : Rat) / 111152143185840491742) [(4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2256503606609685789835 : Rat) / 111152143185840491742) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0087_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0087
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0088 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 88 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0088 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0088_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0088
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0089 : Poly :=
[
  term ((3234762018885830616766 : Rat) / 104977024119960464423) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0089 : Poly :=
[
  term ((6469524037771661233532 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6469524037771661233532 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3234762018885830616766 : Rat) / 104977024119960464423) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3234762018885830616766 : Rat) / 104977024119960464423) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0089_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0089
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0090 : Poly :=
[
  term ((-451300721321937157967 : Rat) / 37050714395280163914) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0090 : Poly :=
[
  term ((-451300721321937157967 : Rat) / 18525357197640081957) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-451300721321937157967 : Rat) / 18525357197640081957) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((451300721321937157967 : Rat) / 37050714395280163914) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((451300721321937157967 : Rat) / 37050714395280163914) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0090_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0090
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0091 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0091 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0091_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0091
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0092 : Poly :=
[
  term ((631112962788541772470 : Rat) / 2837216868107039579) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0092 : Poly :=
[
  term ((1262225925577083544940 : Rat) / 2837216868107039579) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1262225925577083544940 : Rat) / 2837216868107039579) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-631112962788541772470 : Rat) / 2837216868107039579) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-631112962788541772470 : Rat) / 2837216868107039579) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0092_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0092
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0093 : Poly :=
[
  term ((-378667777673125063482 : Rat) / 2837216868107039579) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 93 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0093 : Poly :=
[
  term ((-757335555346250126964 : Rat) / 2837216868107039579) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-757335555346250126964 : Rat) / 2837216868107039579) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((378667777673125063482 : Rat) / 2837216868107039579) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((378667777673125063482 : Rat) / 2837216868107039579) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0093_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0093
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0094 : Poly :=
[
  term ((32950448028760652743525 : Rat) / 314931072359881393269) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 94 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0094 : Poly :=
[
  term ((65900896057521305487050 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((65900896057521305487050 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32950448028760652743525 : Rat) / 314931072359881393269) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32950448028760652743525 : Rat) / 314931072359881393269) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0094_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0094
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0095 : Poly :=
[
  term ((745856206262274709257685 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0095 : Poly :=
[
  term ((745856206262274709257685 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((745856206262274709257685 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-745856206262274709257685 : Rat) / 1889586434159288359614) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-745856206262274709257685 : Rat) / 1889586434159288359614) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0095_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0095
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0096 : Poly :=
[
  term ((-1163041786312563260083555 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 96 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0096 : Poly :=
[
  term ((-1163041786312563260083555 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1163041786312563260083555 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1163041786312563260083555 : Rat) / 1889586434159288359614) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1163041786312563260083555 : Rat) / 1889586434159288359614) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0096_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0096
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0097 : Poly :=
[
  term ((358540196079154644367525 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 97 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0097 : Poly :=
[
  term ((358540196079154644367525 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((358540196079154644367525 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-358540196079154644367525 : Rat) / 1889586434159288359614) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-358540196079154644367525 : Rat) / 1889586434159288359614) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0097_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0097
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0098 : Poly :=
[
  term ((48064147679719027514884 : Rat) / 314931072359881393269) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0098 : Poly :=
[
  term ((96128295359438055029768 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((96128295359438055029768 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48064147679719027514884 : Rat) / 314931072359881393269) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48064147679719027514884 : Rat) / 314931072359881393269) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0098_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0098
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 10. -/
def rs_R007_ueqv_R007NY_coefficient_10_0099 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 10. -/
def rs_R007_ueqv_R007NY_partial_10_0099 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 10. -/
theorem rs_R007_ueqv_R007NY_partial_10_0099_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_10_0099
        rs_R007_ueqv_R007NY_generator_10_0000_0099 =
      rs_R007_ueqv_R007NY_partial_10_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_10_0000_0099 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_10_0000,
  rs_R007_ueqv_R007NY_partial_10_0001,
  rs_R007_ueqv_R007NY_partial_10_0002,
  rs_R007_ueqv_R007NY_partial_10_0003,
  rs_R007_ueqv_R007NY_partial_10_0004,
  rs_R007_ueqv_R007NY_partial_10_0005,
  rs_R007_ueqv_R007NY_partial_10_0006,
  rs_R007_ueqv_R007NY_partial_10_0007,
  rs_R007_ueqv_R007NY_partial_10_0008,
  rs_R007_ueqv_R007NY_partial_10_0009,
  rs_R007_ueqv_R007NY_partial_10_0010,
  rs_R007_ueqv_R007NY_partial_10_0011,
  rs_R007_ueqv_R007NY_partial_10_0012,
  rs_R007_ueqv_R007NY_partial_10_0013,
  rs_R007_ueqv_R007NY_partial_10_0014,
  rs_R007_ueqv_R007NY_partial_10_0015,
  rs_R007_ueqv_R007NY_partial_10_0016,
  rs_R007_ueqv_R007NY_partial_10_0017,
  rs_R007_ueqv_R007NY_partial_10_0018,
  rs_R007_ueqv_R007NY_partial_10_0019,
  rs_R007_ueqv_R007NY_partial_10_0020,
  rs_R007_ueqv_R007NY_partial_10_0021,
  rs_R007_ueqv_R007NY_partial_10_0022,
  rs_R007_ueqv_R007NY_partial_10_0023,
  rs_R007_ueqv_R007NY_partial_10_0024,
  rs_R007_ueqv_R007NY_partial_10_0025,
  rs_R007_ueqv_R007NY_partial_10_0026,
  rs_R007_ueqv_R007NY_partial_10_0027,
  rs_R007_ueqv_R007NY_partial_10_0028,
  rs_R007_ueqv_R007NY_partial_10_0029,
  rs_R007_ueqv_R007NY_partial_10_0030,
  rs_R007_ueqv_R007NY_partial_10_0031,
  rs_R007_ueqv_R007NY_partial_10_0032,
  rs_R007_ueqv_R007NY_partial_10_0033,
  rs_R007_ueqv_R007NY_partial_10_0034,
  rs_R007_ueqv_R007NY_partial_10_0035,
  rs_R007_ueqv_R007NY_partial_10_0036,
  rs_R007_ueqv_R007NY_partial_10_0037,
  rs_R007_ueqv_R007NY_partial_10_0038,
  rs_R007_ueqv_R007NY_partial_10_0039,
  rs_R007_ueqv_R007NY_partial_10_0040,
  rs_R007_ueqv_R007NY_partial_10_0041,
  rs_R007_ueqv_R007NY_partial_10_0042,
  rs_R007_ueqv_R007NY_partial_10_0043,
  rs_R007_ueqv_R007NY_partial_10_0044,
  rs_R007_ueqv_R007NY_partial_10_0045,
  rs_R007_ueqv_R007NY_partial_10_0046,
  rs_R007_ueqv_R007NY_partial_10_0047,
  rs_R007_ueqv_R007NY_partial_10_0048,
  rs_R007_ueqv_R007NY_partial_10_0049,
  rs_R007_ueqv_R007NY_partial_10_0050,
  rs_R007_ueqv_R007NY_partial_10_0051,
  rs_R007_ueqv_R007NY_partial_10_0052,
  rs_R007_ueqv_R007NY_partial_10_0053,
  rs_R007_ueqv_R007NY_partial_10_0054,
  rs_R007_ueqv_R007NY_partial_10_0055,
  rs_R007_ueqv_R007NY_partial_10_0056,
  rs_R007_ueqv_R007NY_partial_10_0057,
  rs_R007_ueqv_R007NY_partial_10_0058,
  rs_R007_ueqv_R007NY_partial_10_0059,
  rs_R007_ueqv_R007NY_partial_10_0060,
  rs_R007_ueqv_R007NY_partial_10_0061,
  rs_R007_ueqv_R007NY_partial_10_0062,
  rs_R007_ueqv_R007NY_partial_10_0063,
  rs_R007_ueqv_R007NY_partial_10_0064,
  rs_R007_ueqv_R007NY_partial_10_0065,
  rs_R007_ueqv_R007NY_partial_10_0066,
  rs_R007_ueqv_R007NY_partial_10_0067,
  rs_R007_ueqv_R007NY_partial_10_0068,
  rs_R007_ueqv_R007NY_partial_10_0069,
  rs_R007_ueqv_R007NY_partial_10_0070,
  rs_R007_ueqv_R007NY_partial_10_0071,
  rs_R007_ueqv_R007NY_partial_10_0072,
  rs_R007_ueqv_R007NY_partial_10_0073,
  rs_R007_ueqv_R007NY_partial_10_0074,
  rs_R007_ueqv_R007NY_partial_10_0075,
  rs_R007_ueqv_R007NY_partial_10_0076,
  rs_R007_ueqv_R007NY_partial_10_0077,
  rs_R007_ueqv_R007NY_partial_10_0078,
  rs_R007_ueqv_R007NY_partial_10_0079,
  rs_R007_ueqv_R007NY_partial_10_0080,
  rs_R007_ueqv_R007NY_partial_10_0081,
  rs_R007_ueqv_R007NY_partial_10_0082,
  rs_R007_ueqv_R007NY_partial_10_0083,
  rs_R007_ueqv_R007NY_partial_10_0084,
  rs_R007_ueqv_R007NY_partial_10_0085,
  rs_R007_ueqv_R007NY_partial_10_0086,
  rs_R007_ueqv_R007NY_partial_10_0087,
  rs_R007_ueqv_R007NY_partial_10_0088,
  rs_R007_ueqv_R007NY_partial_10_0089,
  rs_R007_ueqv_R007NY_partial_10_0090,
  rs_R007_ueqv_R007NY_partial_10_0091,
  rs_R007_ueqv_R007NY_partial_10_0092,
  rs_R007_ueqv_R007NY_partial_10_0093,
  rs_R007_ueqv_R007NY_partial_10_0094,
  rs_R007_ueqv_R007NY_partial_10_0095,
  rs_R007_ueqv_R007NY_partial_10_0096,
  rs_R007_ueqv_R007NY_partial_10_0097,
  rs_R007_ueqv_R007NY_partial_10_0098,
  rs_R007_ueqv_R007NY_partial_10_0099
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_10_0000_0099 : Poly :=
[
  term ((3340611397593934633270 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-668122279518786926654 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((3340611397593934633270 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-668122279518786926654 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (4, 2), (11, 1), (16, 1)],
  term ((334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (5, 2), (11, 1), (16, 1)],
  term ((334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((56539997303700370170175 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-11307999460740074034035 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-89981513856597407367130 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((17996302771319481473426 : Rat) / 104977024119960464423) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2168193526711736267725 : Rat) / 55576071592920245871) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-433638705342347253545 : Rat) / 18525357197640081957) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3122593501267461466685 : Rat) / 44990153194268770467) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1296705423710109681215 : Rat) / 44990153194268770467) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((288477292073841573453350 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (4, 1), (11, 2), (16, 1)],
  term ((624518700253492293337 : Rat) / 14996717731422923489) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9723704089759509384433 : Rat) / 104977024119960464423) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (4, 2), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-89981513856597407367130 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((17996302771319481473426 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((2168193526711736267725 : Rat) / 55576071592920245871) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-433638705342347253545 : Rat) / 18525357197640081957) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3122593501267461466685 : Rat) / 44990153194268770467) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1296705423710109681215 : Rat) / 44990153194268770467) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((288477292073841573453350 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((624518700253492293337 : Rat) / 14996717731422923489) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9723704089759509384433 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-156093490807022648620775 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((31218698161404529724155 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-56539997303700370170175 : Rat) / 1889586434159288359614) [(0, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((11307999460740074034035 : Rat) / 629862144719762786538) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((44990756928298703683565 : Rat) / 314931072359881393269) [(0, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-8998151385659740736713 : Rat) / 104977024119960464423) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((1296705423710109681215 : Rat) / 89980306388537540934) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-144238646036920786726675 : Rat) / 944793217079644179807) [(0, 1), (4, 2), (11, 2), (16, 1)],
  term ((-624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((9723704089759509384433 : Rat) / 209954048239920928846) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((44990756928298703683565 : Rat) / 314931072359881393269) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-8998151385659740736713 : Rat) / 104977024119960464423) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((1296705423710109681215 : Rat) / 89980306388537540934) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-144238646036920786726675 : Rat) / 944793217079644179807) [(0, 1), (5, 2), (11, 2), (16, 1)],
  term ((-624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((9723704089759509384433 : Rat) / 209954048239920928846) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((-56539997303700370170175 : Rat) / 1889586434159288359614) [(0, 1), (5, 3), (11, 1), (16, 1)],
  term ((11307999460740074034035 : Rat) / 629862144719762786538) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((5257797444456988943465 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1051559488891397788693 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-289062184602842820048850 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((57812436920568564009770 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((80199458850907595910905 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((31756354857895449811735 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((227454877977211783717540 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-16039891770181519182181 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6351270971579089962347 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45490975595442356743508 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((314319844976496105010675 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (4, 2), (11, 1), (16, 1)],
  term ((-62863968995299221002135 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (5, 2), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((1074913322906493239275 : Rat) / 44990153194268770467) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-214982664581298647855 : Rat) / 14996717731422923489) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((5257797444456988943465 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1051559488891397788693 : Rat) / 104977024119960464423) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-289062184602842820048850 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((57812436920568564009770 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((80199458850907595910905 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((31756354857895449811735 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((227454877977211783717540 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-16039891770181519182181 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6351270971579089962347 : Rat) / 104977024119960464423) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45490975595442356743508 : Rat) / 104977024119960464423) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1074913322906493239275 : Rat) / 89980306388537540934) [(1, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((214982664581298647855 : Rat) / 29993435462845846978) [(1, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-5257797444456988943465 : Rat) / 629862144719762786538) [(1, 1), (4, 2), (8, 1), (11, 1), (16, 1)],
  term ((1051559488891397788693 : Rat) / 209954048239920928846) [(1, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((-28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-80199458850907595910905 : Rat) / 1889586434159288359614) [(1, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((-31756354857895449811735 : Rat) / 629862144719762786538) [(1, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((-113727438988605891858770 : Rat) / 314931072359881393269) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((16039891770181519182181 : Rat) / 629862144719762786538) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((6351270971579089962347 : Rat) / 209954048239920928846) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((22745487797721178371754 : Rat) / 104977024119960464423) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1074913322906493239275 : Rat) / 89980306388537540934) [(1, 1), (4, 3), (11, 1), (16, 1)],
  term ((214982664581298647855 : Rat) / 29993435462845846978) [(1, 1), (4, 3), (15, 1), (16, 1)],
  term ((-5257797444456988943465 : Rat) / 629862144719762786538) [(1, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((1051559488891397788693 : Rat) / 209954048239920928846) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((-28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-80199458850907595910905 : Rat) / 1889586434159288359614) [(1, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-31756354857895449811735 : Rat) / 629862144719762786538) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-113727438988605891858770 : Rat) / 314931072359881393269) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((16039891770181519182181 : Rat) / 629862144719762786538) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((6351270971579089962347 : Rat) / 209954048239920928846) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((22745487797721178371754 : Rat) / 104977024119960464423) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((12245138134376603844155 : Rat) / 38562988452230374686) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-45858437421992762684750 : Rat) / 44990153194268770467) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((949577172568413034764905 : Rat) / 629862144719762786538) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-2449027626875320768831 : Rat) / 12854329484076791562) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((9171687484398552536950 : Rat) / 14996717731422923489) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189915434513682606952981 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-50312476039237394948605 : Rat) / 134970459582806311401) [(2, 1), (3, 1), (4, 2), (11, 1), (16, 1)],
  term ((10062495207847478989721 : Rat) / 44990153194268770467) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-22553726918875329729955 : Rat) / 134970459582806311401) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((4510745383775065945991 : Rat) / 44990153194268770467) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-306071233404509210399290 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((61214246680901842079858 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2453288725596739930135 : Rat) / 37050714395280163914) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((125731837031625833518940 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-490657745119347986027 : Rat) / 12350238131760054638) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25146367406325166703788 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-774917847569541753397045 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((154983569513908350679409 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((636276610679870809403320 : Rat) / 944793217079644179807) [(2, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-127255322135974161880664 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((2790737854788069213275 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-558147570957613842655 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-184145229158004656015830 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((54700086006635250816875 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-160098516306315226456945 : Rat) / 1889586434159288359614) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((36829045831600931203166 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32820051603981150490125 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((32019703261263045291389 : Rat) / 629862144719762786538) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-613776177030094414951345 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((564734946330651195963245 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((60463722080242362639280 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((122755235406018882990269 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-112946989266130239192649 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12092744416048472527856 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1441690213310457034040 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-55066477686846135388183 : Rat) / 1889586434159288359614) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5155867842353138444335 : Rat) / 269940919165612622802) [(2, 1), (4, 1), (8, 1), (11, 2), (16, 1)],
  term ((865014127986274220424 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((451300721321937157967 : Rat) / 18525357197640081957) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((29898813728725695957765 : Rat) / 209954048239920928846) [(2, 1), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-17939288237235417574659 : Rat) / 209954048239920928846) [(2, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32347620188858306167660 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2256503606609685789835 : Rat) / 55576071592920245871) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((6469524037771661233532 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-451300721321937157967 : Rat) / 18525357197640081957) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1262225925577083544940 : Rat) / 2837216868107039579) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-757335555346250126964 : Rat) / 2837216868107039579) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((65900896057521305487050 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((745856206262274709257685 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1163041786312563260083555 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((358540196079154644367525 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((96128295359438055029768 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((273701491090579102340245 : Rat) / 1889586434159288359614) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-54740298218115820468049 : Rat) / 629862144719762786538) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((981315650551994197611995 : Rat) / 1889586434159288359614) [(2, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-196263130110398839522399 : Rat) / 629862144719762786538) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((20666200448270056794260 : Rat) / 134970459582806311401) [(2, 1), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-4133240089654011358852 : Rat) / 44990153194268770467) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-370102672084234383564965 : Rat) / 3779172868318576719228) [(2, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((33396951817179652186445 : Rat) / 944793217079644179807) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((74020534416846876712993 : Rat) / 1259724289439525573076) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6679390363435930437289 : Rat) / 314931072359881393269) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((22553726918875329729955 : Rat) / 269940919165612622802) [(2, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-4510745383775065945991 : Rat) / 89980306388537540934) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((153035616702254605199645 : Rat) / 944793217079644179807) [(2, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-30607123340450921039929 : Rat) / 314931072359881393269) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2453288725596739930135 : Rat) / 74101428790560327828) [(2, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-62865918515812916759470 : Rat) / 944793217079644179807) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((490657745119347986027 : Rat) / 24700476263520109276) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((12573183703162583351894 : Rat) / 314931072359881393269) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((456779542229606348695385 : Rat) / 1889586434159288359614) [(2, 1), (5, 3), (11, 1), (16, 1)],
  term ((-91355908445921269739077 : Rat) / 629862144719762786538) [(2, 1), (5, 3), (15, 1), (16, 1)],
  term ((636276610679870809403320 : Rat) / 944793217079644179807) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-127255322135974161880664 : Rat) / 314931072359881393269) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-456779542229606348695385 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((91355908445921269739077 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-22553726918875329729955 : Rat) / 134970459582806311401) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((4510745383775065945991 : Rat) / 44990153194268770467) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-306071233404509210399290 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((61214246680901842079858 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2453288725596739930135 : Rat) / 37050714395280163914) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((125731837031625833518940 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-490657745119347986027 : Rat) / 12350238131760054638) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25146367406325166703788 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((411719781059933444751155 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-82343956211986688950231 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-61246236769700161782020 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((4583946206332979473615 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((12249247353940032356404 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-916789241266595894723 : Rat) / 14996717731422923489) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-149029024204300886416565 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((29805804840860177283313 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(3, 1), (4, 2), (8, 1), (11, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((-12245138134376603844155 : Rat) / 77125976904460749372) [(3, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((22929218710996381342375 : Rat) / 44990153194268770467) [(3, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((-949577172568413034764905 : Rat) / 1259724289439525573076) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((2449027626875320768831 : Rat) / 25708658968153583124) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4585843742199276268475 : Rat) / 14996717731422923489) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((189915434513682606952981 : Rat) / 419908096479841857692) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (4, 2), (15, 3), (16, 1)],
  term ((34049026934726359938575 : Rat) / 1889586434159288359614) [(3, 1), (4, 3), (11, 1), (16, 1)],
  term ((-6809805386945271987715 : Rat) / 629862144719762786538) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-613776177030094414951345 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((564734946330651195963245 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((60463722080242362639280 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((122755235406018882990269 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-112946989266130239192649 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12092744416048472527856 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1441690213310457034040 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-55066477686846135388183 : Rat) / 1889586434159288359614) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5155867842353138444335 : Rat) / 269940919165612622802) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((865014127986274220424 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((451300721321937157967 : Rat) / 18525357197640081957) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((29898813728725695957765 : Rat) / 209954048239920928846) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-17939288237235417574659 : Rat) / 209954048239920928846) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32347620188858306167660 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2256503606609685789835 : Rat) / 55576071592920245871) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((6469524037771661233532 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-451300721321937157967 : Rat) / 18525357197640081957) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((1262225925577083544940 : Rat) / 2837216868107039579) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-757335555346250126964 : Rat) / 2837216868107039579) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((65900896057521305487050 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((745856206262274709257685 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1163041786312563260083555 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((358540196079154644367525 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((96128295359438055029768 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-34305218461897440219910 : Rat) / 944793217079644179807) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((6861043692379488043982 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-445530895072157404142305 : Rat) / 1259724289439525573076) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((324604788996880421847250 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-3168928550317869557208605 : Rat) / 3779172868318576719228) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((89106179014431480828461 : Rat) / 419908096479841857692) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-64920957799376084369450 : Rat) / 104977024119960464423) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((633785710063573911441721 : Rat) / 1259724289439525573076) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((-34049026934726359938575 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((6809805386945271987715 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((12245138134376603844155 : Rat) / 38562988452230374686) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-45858437421992762684750 : Rat) / 44990153194268770467) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((949577172568413034764905 : Rat) / 629862144719762786538) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-2449027626875320768831 : Rat) / 12854329484076791562) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((9171687484398552536950 : Rat) / 14996717731422923489) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189915434513682606952981 : Rat) / 209954048239920928846) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-411719781059933444751155 : Rat) / 1889586434159288359614) [(4, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((82343956211986688950231 : Rat) / 629862144719762786538) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((30623118384850080891010 : Rat) / 944793217079644179807) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4583946206332979473615 : Rat) / 89980306388537540934) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6124623676970016178202 : Rat) / 314931072359881393269) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((916789241266595894723 : Rat) / 29993435462845846978) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((45769512784756811588785 : Rat) / 944793217079644179807) [(4, 1), (5, 3), (11, 1), (16, 1)],
  term ((-9153902556951362317757 : Rat) / 314931072359881393269) [(4, 1), (5, 3), (15, 1), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 629862144719762786538) [(4, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 209954048239920928846) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((92072614579002328007915 : Rat) / 944793217079644179807) [(4, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-54700086006635250816875 : Rat) / 209954048239920928846) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((160098516306315226456945 : Rat) / 3779172868318576719228) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-18414522915800465601583 : Rat) / 314931072359881393269) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((32820051603981150490125 : Rat) / 209954048239920928846) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32019703261263045291389 : Rat) / 1259724289439525573076) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(4, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((613776177030094414951345 : Rat) / 1889586434159288359614) [(4, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-564734946330651195963245 : Rat) / 1889586434159288359614) [(4, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-30231861040121181319640 : Rat) / 944793217079644179807) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-122755235406018882990269 : Rat) / 629862144719762786538) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((112946989266130239192649 : Rat) / 629862144719762786538) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6046372208024236263928 : Rat) / 314931072359881393269) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((720845106655228517020 : Rat) / 104977024119960464423) [(4, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((55066477686846135388183 : Rat) / 3779172868318576719228) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5155867842353138444335 : Rat) / 539881838331225245604) [(4, 2), (8, 1), (11, 2), (16, 1)],
  term ((-432507063993137110212 : Rat) / 104977024119960464423) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-451300721321937157967 : Rat) / 37050714395280163914) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-29898813728725695957765 : Rat) / 419908096479841857692) [(4, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((17939288237235417574659 : Rat) / 419908096479841857692) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((16173810094429153083830 : Rat) / 314931072359881393269) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2256503606609685789835 : Rat) / 111152143185840491742) [(4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3234762018885830616766 : Rat) / 104977024119960464423) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((451300721321937157967 : Rat) / 37050714395280163914) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-631112962788541772470 : Rat) / 2837216868107039579) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((378667777673125063482 : Rat) / 2837216868107039579) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-32950448028760652743525 : Rat) / 314931072359881393269) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-745856206262274709257685 : Rat) / 1889586434159288359614) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1163041786312563260083555 : Rat) / 1889586434159288359614) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-358540196079154644367525 : Rat) / 1889586434159288359614) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-48064147679719027514884 : Rat) / 314931072359881393269) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((45769512784756811588785 : Rat) / 944793217079644179807) [(4, 3), (5, 1), (11, 1), (16, 1)],
  term ((-9153902556951362317757 : Rat) / 314931072359881393269) [(4, 3), (5, 1), (15, 1), (16, 1)],
  term ((-411719781059933444751155 : Rat) / 1889586434159288359614) [(4, 3), (7, 1), (11, 1), (16, 1)],
  term ((82343956211986688950231 : Rat) / 629862144719762786538) [(4, 3), (7, 1), (15, 1), (16, 1)],
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(4, 3), (9, 1), (11, 1), (16, 1)],
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(4, 3), (9, 1), (15, 1), (16, 1)],
  term ((30623118384850080891010 : Rat) / 944793217079644179807) [(4, 3), (11, 1), (13, 1), (16, 1)],
  term ((-4583946206332979473615 : Rat) / 89980306388537540934) [(4, 3), (11, 1), (15, 1), (16, 1)],
  term ((-6124623676970016178202 : Rat) / 314931072359881393269) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((916789241266595894723 : Rat) / 29993435462845846978) [(4, 3), (15, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(5, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((613776177030094414951345 : Rat) / 1889586434159288359614) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-564734946330651195963245 : Rat) / 1889586434159288359614) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-30231861040121181319640 : Rat) / 944793217079644179807) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-122755235406018882990269 : Rat) / 629862144719762786538) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((112946989266130239192649 : Rat) / 629862144719762786538) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6046372208024236263928 : Rat) / 314931072359881393269) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((720845106655228517020 : Rat) / 104977024119960464423) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((55066477686846135388183 : Rat) / 3779172868318576719228) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5155867842353138444335 : Rat) / 539881838331225245604) [(5, 2), (8, 1), (11, 2), (16, 1)],
  term ((-432507063993137110212 : Rat) / 104977024119960464423) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-451300721321937157967 : Rat) / 37050714395280163914) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-29898813728725695957765 : Rat) / 419908096479841857692) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((17939288237235417574659 : Rat) / 419908096479841857692) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((16173810094429153083830 : Rat) / 314931072359881393269) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2256503606609685789835 : Rat) / 111152143185840491742) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3234762018885830616766 : Rat) / 104977024119960464423) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((451300721321937157967 : Rat) / 37050714395280163914) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-631112962788541772470 : Rat) / 2837216868107039579) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((378667777673125063482 : Rat) / 2837216868107039579) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-32950448028760652743525 : Rat) / 314931072359881393269) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-745856206262274709257685 : Rat) / 1889586434159288359614) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1163041786312563260083555 : Rat) / 1889586434159288359614) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-358540196079154644367525 : Rat) / 1889586434159288359614) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-48064147679719027514884 : Rat) / 314931072359881393269) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 629862144719762786538) [(5, 3), (8, 1), (11, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 209954048239920928846) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((92072614579002328007915 : Rat) / 944793217079644179807) [(5, 3), (11, 1), (12, 1), (16, 1)],
  term ((-54700086006635250816875 : Rat) / 209954048239920928846) [(5, 3), (11, 1), (14, 1), (16, 1)],
  term ((160098516306315226456945 : Rat) / 3779172868318576719228) [(5, 3), (11, 1), (16, 1)],
  term ((-18414522915800465601583 : Rat) / 314931072359881393269) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((32820051603981150490125 : Rat) / 209954048239920928846) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((-32019703261263045291389 : Rat) / 1259724289439525573076) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 99. -/
theorem rs_R007_ueqv_R007NY_block_10_0000_0099_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_10_0000_0099
      rs_R007_ueqv_R007NY_block_10_0000_0099 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
