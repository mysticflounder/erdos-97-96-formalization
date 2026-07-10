/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 3:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_03_0000_0099 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(10, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0000 : Poly :=
[
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0000 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (10, 2), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0000
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0001 : Poly :=
[
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0001 : Poly :=
[
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0001
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0002 : Poly :=
[
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0002 : Poly :=
[
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 3), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0002
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0003 : Poly :=
[
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0003 : Poly :=
[
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0003
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0004 : Poly :=
[
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0004 : Poly :=
[
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0004
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0005 : Poly :=
[
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0005 : Poly :=
[
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 2), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0005
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0006 : Poly :=
[
  term ((23294869392069329663045 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0006 : Poly :=
[
  term ((-46589738784138659326090 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((23294869392069329663045 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((23294869392069329663045 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((46589738784138659326090 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-23294869392069329663045 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-23294869392069329663045 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0006
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0007 : Poly :=
[
  term ((-13976921635241597797827 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0007 : Poly :=
[
  term ((27953843270483195595654 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-13976921635241597797827 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-13976921635241597797827 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-27953843270483195595654 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((13976921635241597797827 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((13976921635241597797827 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0007
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0008 : Poly :=
[
  term ((-1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 8 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0008 : Poly :=
[
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (11, 3), (14, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0008
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0009 : Poly :=
[
  term ((-598677718284396615517045 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0009 : Poly :=
[
  term ((598677718284396615517045 : Rat) / 3779172868318576719228) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-598677718284396615517045 : Rat) / 7558345736637153438456) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-598677718284396615517045 : Rat) / 3779172868318576719228) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((598677718284396615517045 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((598677718284396615517045 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (11, 3), (16, 1)],
  term ((-598677718284396615517045 : Rat) / 7558345736637153438456) [(0, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0009
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0010 : Poly :=
[
  term ((284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0010 : Poly :=
[
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0010
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0011 : Poly :=
[
  term ((119735543656879323103409 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0011 : Poly :=
[
  term ((-119735543656879323103409 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((119735543656879323103409 : Rat) / 2519448578879051146152) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((119735543656879323103409 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-119735543656879323103409 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-119735543656879323103409 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((119735543656879323103409 : Rat) / 2519448578879051146152) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0011
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0012 : Poly :=
[
  term ((-168976900565087327990485 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0012 : Poly :=
[
  term ((337953801130174655980970 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-168976900565087327990485 : Rat) / 944793217079644179807) [(0, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-168976900565087327990485 : Rat) / 944793217079644179807) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-337953801130174655980970 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((168976900565087327990485 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((168976900565087327990485 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0012
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0013 : Poly :=
[
  term ((33795380113017465598097 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0013 : Poly :=
[
  term ((-67590760226034931196194 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((33795380113017465598097 : Rat) / 314931072359881393269) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((33795380113017465598097 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((67590760226034931196194 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-33795380113017465598097 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-33795380113017465598097 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0013
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0014 : Poly :=
[
  term ((-72649827655925117769715 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0014 : Poly :=
[
  term ((145299655311850235539430 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-72649827655925117769715 : Rat) / 944793217079644179807) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-72649827655925117769715 : Rat) / 944793217079644179807) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-145299655311850235539430 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((72649827655925117769715 : Rat) / 944793217079644179807) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((72649827655925117769715 : Rat) / 944793217079644179807) [(0, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0014
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0015 : Poly :=
[
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0015 : Poly :=
[
  term ((-2843827338887233576310 : Rat) / 1502055988997844483) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2843827338887233576310 : Rat) / 1502055988997844483) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0015
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0016 : Poly :=
[
  term ((12254241369435728524125835 : Rat) / 7558345736637153438456) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0016 : Poly :=
[
  term ((-12254241369435728524125835 : Rat) / 3779172868318576719228) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12254241369435728524125835 : Rat) / 7558345736637153438456) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((12254241369435728524125835 : Rat) / 7558345736637153438456) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((12254241369435728524125835 : Rat) / 3779172868318576719228) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12254241369435728524125835 : Rat) / 7558345736637153438456) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12254241369435728524125835 : Rat) / 7558345736637153438456) [(0, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0016
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0017 : Poly :=
[
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 17 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0017 : Poly :=
[
  term ((-40598312741837720600650 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((40598312741837720600650 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (10, 2), (11, 2), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0017
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0018 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 18 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0018 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0018
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0019 : Poly :=
[
  term ((14529965531185023553943 : Rat) / 314931072359881393269) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0019 : Poly :=
[
  term ((-29059931062370047107886 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((14529965531185023553943 : Rat) / 314931072359881393269) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((14529965531185023553943 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((29059931062370047107886 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14529965531185023553943 : Rat) / 314931072359881393269) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14529965531185023553943 : Rat) / 314931072359881393269) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0019
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0020 : Poly :=
[
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0020 : Poly :=
[
  term ((568765467777446715262 : Rat) / 500685329665948161) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-568765467777446715262 : Rat) / 500685329665948161) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0020
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0021 : Poly :=
[
  term ((-2509309844235392022490103 : Rat) / 2519448578879051146152) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0021 : Poly :=
[
  term ((2509309844235392022490103 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2509309844235392022490103 : Rat) / 2519448578879051146152) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-2509309844235392022490103 : Rat) / 2519448578879051146152) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-2509309844235392022490103 : Rat) / 1259724289439525573076) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((2509309844235392022490103 : Rat) / 2519448578879051146152) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((2509309844235392022490103 : Rat) / 2519448578879051146152) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0021
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0022 : Poly :=
[
  term ((1 : Rat) / 2) [(0, 1), (16, 1)]
]

/-- Partial product 22 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0022 : Poly :=
[
  term (-1 : Rat) [(0, 1), (6, 1), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (6, 2), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (7, 2), (16, 1)],
  term (1 : Rat) [(0, 1), (10, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (10, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0022
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0023 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 23 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0023 : Poly :=
[
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (6, 2), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (7, 2), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (10, 1), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (10, 2), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0023
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0024 : Poly :=
[
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0024 : Poly :=
[
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0024
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0025 : Poly :=
[
  term ((-103829153311913124405535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 25 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0025 : Poly :=
[
  term ((207658306623826248811070 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-103829153311913124405535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-103829153311913124405535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-207658306623826248811070 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((103829153311913124405535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((103829153311913124405535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0025
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0026 : Poly :=
[
  term ((20765830662382624881107 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0026 : Poly :=
[
  term ((-41531661324765249762214 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((20765830662382624881107 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((20765830662382624881107 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((41531661324765249762214 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-20765830662382624881107 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((-20765830662382624881107 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0026
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0027 : Poly :=
[
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0027 : Poly :=
[
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 3), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0027
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0028 : Poly :=
[
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0028 : Poly :=
[
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0028
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0029 : Poly :=
[
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0029 : Poly :=
[
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0029
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0030 : Poly :=
[
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0030 : Poly :=
[
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0030
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0031 : Poly :=
[
  term (1 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 31 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0031 : Poly :=
[
  term (-2 : Rat) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 1), (10, 3), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0031
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0032 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0032 : Poly :=
[
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (6, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 3), (13, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0032
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0033 : Poly :=
[
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0033 : Poly :=
[
  term ((3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (7, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0033
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0034 : Poly :=
[
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0034 : Poly :=
[
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0034
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0035 : Poly :=
[
  term (5 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 35 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0035 : Poly :=
[
  term (-10 : Rat) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (7, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0035
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0036 : Poly :=
[
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0036 : Poly :=
[
  term ((-606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0036
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0037 : Poly :=
[
  term (-1 : Rat) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 37 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0037 : Poly :=
[
  term (2 : Rat) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0037
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0038 : Poly :=
[
  term ((168976900565087327990485 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 38 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0038 : Poly :=
[
  term ((-337953801130174655980970 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((168976900565087327990485 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((168976900565087327990485 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((337953801130174655980970 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-168976900565087327990485 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-168976900565087327990485 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0038
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0039 : Poly :=
[
  term ((-33795380113017465598097 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0039 : Poly :=
[
  term ((67590760226034931196194 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-33795380113017465598097 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-33795380113017465598097 : Rat) / 314931072359881393269) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-67590760226034931196194 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((33795380113017465598097 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((33795380113017465598097 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0039
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0040 : Poly :=
[
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0040 : Poly :=
[
  term ((40598312741837720600650 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (11, 3), (16, 1)],
  term ((-40598312741837720600650 : Rat) / 314931072359881393269) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0040
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0041 : Poly :=
[
  term ((3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0041 : Poly :=
[
  term ((-7699754451887702262438 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((7699754451887702262438 : Rat) / 104977024119960464423) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0041
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0042 : Poly :=
[
  term ((-547431752964771063197155 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 42 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0042 : Poly :=
[
  term ((547431752964771063197155 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-547431752964771063197155 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-547431752964771063197155 : Rat) / 3779172868318576719228) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-547431752964771063197155 : Rat) / 1889586434159288359614) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((547431752964771063197155 : Rat) / 3779172868318576719228) [(1, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((547431752964771063197155 : Rat) / 3779172868318576719228) [(1, 1), (11, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0042
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0043 : Poly :=
[
  term ((-5125568393168872109149075 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 43 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0043 : Poly :=
[
  term ((5125568393168872109149075 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5125568393168872109149075 : Rat) / 1889586434159288359614) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-5125568393168872109149075 : Rat) / 1889586434159288359614) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-5125568393168872109149075 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((5125568393168872109149075 : Rat) / 1889586434159288359614) [(1, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((5125568393168872109149075 : Rat) / 1889586434159288359614) [(1, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0043
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0044 : Poly :=
[
  term ((-181981263750289177430075 : Rat) / 104977024119960464423) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 44 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0044 : Poly :=
[
  term ((363962527500578354860150 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-181981263750289177430075 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-181981263750289177430075 : Rat) / 104977024119960464423) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-363962527500578354860150 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((181981263750289177430075 : Rat) / 104977024119960464423) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((181981263750289177430075 : Rat) / 104977024119960464423) [(1, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0044
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0045 : Poly :=
[
  term ((-536202468080387454908293 : Rat) / 5038897157758102292304) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 45 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0045 : Poly :=
[
  term ((536202468080387454908293 : Rat) / 2519448578879051146152) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-536202468080387454908293 : Rat) / 5038897157758102292304) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-536202468080387454908293 : Rat) / 5038897157758102292304) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-536202468080387454908293 : Rat) / 2519448578879051146152) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((536202468080387454908293 : Rat) / 5038897157758102292304) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((536202468080387454908293 : Rat) / 5038897157758102292304) [(1, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0045
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0046 : Poly :=
[
  term ((109486350592954212639431 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0046 : Poly :=
[
  term ((-109486350592954212639431 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((109486350592954212639431 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((109486350592954212639431 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((109486350592954212639431 : Rat) / 629862144719762786538) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-109486350592954212639431 : Rat) / 1259724289439525573076) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-109486350592954212639431 : Rat) / 1259724289439525573076) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0046
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0047 : Poly :=
[
  term ((2 : Rat) / 3) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 47 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0047 : Poly :=
[
  term ((-4 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0047
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0048 : Poly :=
[
  term ((1023853954344334896256739 : Rat) / 629862144719762786538) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0048 : Poly :=
[
  term ((-1023853954344334896256739 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1023853954344334896256739 : Rat) / 629862144719762786538) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((1023853954344334896256739 : Rat) / 629862144719762786538) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((1023853954344334896256739 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1023853954344334896256739 : Rat) / 629862144719762786538) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1023853954344334896256739 : Rat) / 629862144719762786538) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0048
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0049 : Poly :=
[
  term ((108584199524812984926273 : Rat) / 1679632385919367430768) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0049 : Poly :=
[
  term ((-108584199524812984926273 : Rat) / 839816192959683715384) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((108584199524812984926273 : Rat) / 1679632385919367430768) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((108584199524812984926273 : Rat) / 1679632385919367430768) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((108584199524812984926273 : Rat) / 839816192959683715384) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-108584199524812984926273 : Rat) / 1679632385919367430768) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-108584199524812984926273 : Rat) / 1679632385919367430768) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0049
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0050 : Poly :=
[
  term ((109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 50 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0050 : Poly :=
[
  term ((-218377516500347012916090 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (15, 3), (16, 1)],
  term ((109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((218377516500347012916090 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (10, 2), (15, 3), (16, 1)],
  term ((-109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0050
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0051 : Poly :=
[
  term (-4 : Rat) [(1, 2), (14, 1), (16, 1)]
]

/-- Partial product 51 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0051 : Poly :=
[
  term (8 : Rat) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (6, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0051
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0052 : Poly :=
[
  term (2 : Rat) [(1, 2), (16, 1)]
]

/-- Partial product 52 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0052 : Poly :=
[
  term (-4 : Rat) [(1, 2), (6, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (6, 2), (16, 1)],
  term (2 : Rat) [(1, 2), (7, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (10, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0052
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0053 : Poly :=
[
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 53 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0053 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0053
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0054 : Poly :=
[
  term ((-491464238088431256995 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0054 : Poly :=
[
  term ((982928476176862513990 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-491464238088431256995 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-491464238088431256995 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((491464238088431256995 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((491464238088431256995 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0054
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0055 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0055 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 3), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 3), (11, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0055
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0056 : Poly :=
[
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0056 : Poly :=
[
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 3), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0056
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0057 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 57 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0057 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 3), (14, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0057
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0058 : Poly :=
[
  term ((-619560296787890055 : Rat) / 8569552989384527708) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 58 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0058 : Poly :=
[
  term ((619560296787890055 : Rat) / 4284776494692263854) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-619560296787890055 : Rat) / 8569552989384527708) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-619560296787890055 : Rat) / 4284776494692263854) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((619560296787890055 : Rat) / 8569552989384527708) [(2, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((619560296787890055 : Rat) / 8569552989384527708) [(2, 1), (7, 1), (11, 3), (16, 1)],
  term ((-619560296787890055 : Rat) / 8569552989384527708) [(2, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0058
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0059 : Poly :=
[
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0059 : Poly :=
[
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0059
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0060 : Poly :=
[
  term ((371736178072734033 : Rat) / 8569552989384527708) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0060 : Poly :=
[
  term ((-371736178072734033 : Rat) / 4284776494692263854) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((371736178072734033 : Rat) / 8569552989384527708) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((371736178072734033 : Rat) / 4284776494692263854) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-371736178072734033 : Rat) / 8569552989384527708) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-371736178072734033 : Rat) / 8569552989384527708) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((371736178072734033 : Rat) / 8569552989384527708) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0060
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0061 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0061 : Poly :=
[
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0061
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0062 : Poly :=
[
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 62 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0062 : Poly :=
[
  term ((16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0062
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0063 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 63 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0063 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0063
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0064 : Poly :=
[
  term ((8792434400932238248330 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0064 : Poly :=
[
  term ((-17584868801864476496660 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8792434400932238248330 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8792434400932238248330 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17584868801864476496660 : Rat) / 134970459582806311401) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8792434400932238248330 : Rat) / 134970459582806311401) [(2, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8792434400932238248330 : Rat) / 134970459582806311401) [(2, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0064
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0065 : Poly :=
[
  term ((-28436299598048486150346 : Rat) / 104977024119960464423) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0065 : Poly :=
[
  term ((56872599196096972300692 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28436299598048486150346 : Rat) / 104977024119960464423) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-28436299598048486150346 : Rat) / 104977024119960464423) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-56872599196096972300692 : Rat) / 104977024119960464423) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((28436299598048486150346 : Rat) / 104977024119960464423) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((28436299598048486150346 : Rat) / 104977024119960464423) [(2, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0065
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0066 : Poly :=
[
  term ((20944235641494208729255 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 66 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0066 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 1889586434159288359614) [(2, 1), (10, 2), (11, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 1889586434159288359614) [(2, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0066
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0067 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0067 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0067_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0067
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0068 : Poly :=
[
  term ((-1758486880186447649666 : Rat) / 44990153194268770467) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 68 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0068 : Poly :=
[
  term ((3516973760372895299332 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1758486880186447649666 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1758486880186447649666 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3516973760372895299332 : Rat) / 44990153194268770467) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1758486880186447649666 : Rat) / 44990153194268770467) [(2, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((1758486880186447649666 : Rat) / 44990153194268770467) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0068_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0068
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0069 : Poly :=
[
  term ((-2 : Rat) / 3) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 69 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0069 : Poly :=
[
  term ((4 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0069_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0069
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0070 : Poly :=
[
  term ((33285790091998415031245 : Rat) / 209954048239920928846) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 70 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0070 : Poly :=
[
  term ((-33285790091998415031245 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((33285790091998415031245 : Rat) / 209954048239920928846) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((33285790091998415031245 : Rat) / 209954048239920928846) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((33285790091998415031245 : Rat) / 104977024119960464423) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-33285790091998415031245 : Rat) / 209954048239920928846) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-33285790091998415031245 : Rat) / 209954048239920928846) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0070_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0070
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0071 : Poly :=
[
  term ((2457321190442156284975 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 71 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0071 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0071_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0071
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0072 : Poly :=
[
  term ((-491464238088431256995 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0072 : Poly :=
[
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-491464238088431256995 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-491464238088431256995 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((491464238088431256995 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((491464238088431256995 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0072_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0072
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0073 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0073 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0073_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0073
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0074 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 74 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0074 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0074_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0074
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0075 : Poly :=
[
  term ((92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0075 : Poly :=
[
  term ((-184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0075_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0075
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0076 : Poly :=
[
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 76 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0076 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (7, 1), (11, 2), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 2), (11, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 4), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0076_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0076
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0077 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 77 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0077 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0077_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0077
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0078 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 78 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0078 : Poly :=
[
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (11, 3), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0078_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0078
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0079 : Poly :=
[
  term ((4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0079 : Poly :=
[
  term ((-4188847128298841745851 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 104977024119960464423) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0079_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0079
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0080 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0080 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0080_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0080
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0081 : Poly :=
[
  term ((-183837650639606136080395 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 81 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0081 : Poly :=
[
  term ((183837650639606136080395 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-183837650639606136080395 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-183837650639606136080395 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-183837650639606136080395 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((183837650639606136080395 : Rat) / 1889586434159288359614) [(3, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((183837650639606136080395 : Rat) / 1889586434159288359614) [(3, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0081_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0081
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0082 : Poly :=
[
  term ((-164650704121611786537644 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 82 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0082 : Poly :=
[
  term ((329301408243223573075288 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-164650704121611786537644 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-164650704121611786537644 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-329301408243223573075288 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((164650704121611786537644 : Rat) / 944793217079644179807) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((164650704121611786537644 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0082_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0082
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0083 : Poly :=
[
  term ((1115191402432117677861335 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 83 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0083 : Poly :=
[
  term ((-1115191402432117677861335 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((1115191402432117677861335 : Rat) / 7558345736637153438456) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((1115191402432117677861335 : Rat) / 7558345736637153438456) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((1115191402432117677861335 : Rat) / 3779172868318576719228) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1115191402432117677861335 : Rat) / 7558345736637153438456) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1115191402432117677861335 : Rat) / 7558345736637153438456) [(3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0083_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0083
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0084 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0084 : Poly :=
[
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (11, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0084_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0084
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0085 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 85 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0085 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0085_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0085
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0086 : Poly :=
[
  term ((36767530127921227216079 : Rat) / 629862144719762786538) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0086 : Poly :=
[
  term ((-36767530127921227216079 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((36767530127921227216079 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((36767530127921227216079 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((36767530127921227216079 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36767530127921227216079 : Rat) / 629862144719762786538) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-36767530127921227216079 : Rat) / 629862144719762786538) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0086_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0086
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0087 : Poly :=
[
  term ((-74905970957447634334345 : Rat) / 839816192959683715384) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0087 : Poly :=
[
  term ((74905970957447634334345 : Rat) / 419908096479841857692) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-74905970957447634334345 : Rat) / 839816192959683715384) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-74905970957447634334345 : Rat) / 839816192959683715384) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-74905970957447634334345 : Rat) / 419908096479841857692) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((74905970957447634334345 : Rat) / 839816192959683715384) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((74905970957447634334345 : Rat) / 839816192959683715384) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0087_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0087
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0088 : Poly :=
[
  term ((37956757378280967402550 : Rat) / 314931072359881393269) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 88 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0088 : Poly :=
[
  term ((-75913514756561934805100 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((37956757378280967402550 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((37956757378280967402550 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((75913514756561934805100 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-37956757378280967402550 : Rat) / 314931072359881393269) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((-37956757378280967402550 : Rat) / 314931072359881393269) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0088_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0088
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0089 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 89 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0089 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 3), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 3), (11, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0089_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0089
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0090 : Poly :=
[
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0090 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 3), (15, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0090_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0090
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0091 : Poly :=
[
  term ((47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 91 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0091 : Poly :=
[
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 3), (14, 1), (16, 1)],
  term ((47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0091_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0091
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0092 : Poly :=
[
  term ((-103387324493161324946105 : Rat) / 419908096479841857692) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 92 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0092 : Poly :=
[
  term ((103387324493161324946105 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-103387324493161324946105 : Rat) / 419908096479841857692) [(4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-103387324493161324946105 : Rat) / 209954048239920928846) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((103387324493161324946105 : Rat) / 419908096479841857692) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((103387324493161324946105 : Rat) / 419908096479841857692) [(4, 1), (7, 1), (11, 3), (16, 1)],
  term ((-103387324493161324946105 : Rat) / 419908096479841857692) [(4, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0092_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0092
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0093 : Poly :=
[
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0093 : Poly :=
[
  term ((57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0093_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0093
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0094 : Poly :=
[
  term ((62032394695896794967663 : Rat) / 419908096479841857692) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0094 : Poly :=
[
  term ((-62032394695896794967663 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((62032394695896794967663 : Rat) / 419908096479841857692) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((62032394695896794967663 : Rat) / 209954048239920928846) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-62032394695896794967663 : Rat) / 419908096479841857692) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-62032394695896794967663 : Rat) / 419908096479841857692) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((62032394695896794967663 : Rat) / 419908096479841857692) [(4, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0094_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0094
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0095 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0095 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0095_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0095
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0096 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 96 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0096 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0096_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0096
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0097 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0097 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0097_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0097
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0098 : Poly :=
[
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0098 : Poly :=
[
  term ((191190748533369514597960 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-191190748533369514597960 : Rat) / 104977024119960464423) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0098_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0098
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0099 : Poly :=
[
  term ((830837602903043491338295 : Rat) / 1259724289439525573076) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0099 : Poly :=
[
  term ((-830837602903043491338295 : Rat) / 629862144719762786538) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((830837602903043491338295 : Rat) / 1259724289439525573076) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((830837602903043491338295 : Rat) / 1259724289439525573076) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((830837602903043491338295 : Rat) / 629862144719762786538) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-830837602903043491338295 : Rat) / 1259724289439525573076) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-830837602903043491338295 : Rat) / 1259724289439525573076) [(4, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0099_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0099
        rs_R007_ueqv_R007NY_generator_03_0000_0099 =
      rs_R007_ueqv_R007NY_partial_03_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_03_0000_0099 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_03_0000,
  rs_R007_ueqv_R007NY_partial_03_0001,
  rs_R007_ueqv_R007NY_partial_03_0002,
  rs_R007_ueqv_R007NY_partial_03_0003,
  rs_R007_ueqv_R007NY_partial_03_0004,
  rs_R007_ueqv_R007NY_partial_03_0005,
  rs_R007_ueqv_R007NY_partial_03_0006,
  rs_R007_ueqv_R007NY_partial_03_0007,
  rs_R007_ueqv_R007NY_partial_03_0008,
  rs_R007_ueqv_R007NY_partial_03_0009,
  rs_R007_ueqv_R007NY_partial_03_0010,
  rs_R007_ueqv_R007NY_partial_03_0011,
  rs_R007_ueqv_R007NY_partial_03_0012,
  rs_R007_ueqv_R007NY_partial_03_0013,
  rs_R007_ueqv_R007NY_partial_03_0014,
  rs_R007_ueqv_R007NY_partial_03_0015,
  rs_R007_ueqv_R007NY_partial_03_0016,
  rs_R007_ueqv_R007NY_partial_03_0017,
  rs_R007_ueqv_R007NY_partial_03_0018,
  rs_R007_ueqv_R007NY_partial_03_0019,
  rs_R007_ueqv_R007NY_partial_03_0020,
  rs_R007_ueqv_R007NY_partial_03_0021,
  rs_R007_ueqv_R007NY_partial_03_0022,
  rs_R007_ueqv_R007NY_partial_03_0023,
  rs_R007_ueqv_R007NY_partial_03_0024,
  rs_R007_ueqv_R007NY_partial_03_0025,
  rs_R007_ueqv_R007NY_partial_03_0026,
  rs_R007_ueqv_R007NY_partial_03_0027,
  rs_R007_ueqv_R007NY_partial_03_0028,
  rs_R007_ueqv_R007NY_partial_03_0029,
  rs_R007_ueqv_R007NY_partial_03_0030,
  rs_R007_ueqv_R007NY_partial_03_0031,
  rs_R007_ueqv_R007NY_partial_03_0032,
  rs_R007_ueqv_R007NY_partial_03_0033,
  rs_R007_ueqv_R007NY_partial_03_0034,
  rs_R007_ueqv_R007NY_partial_03_0035,
  rs_R007_ueqv_R007NY_partial_03_0036,
  rs_R007_ueqv_R007NY_partial_03_0037,
  rs_R007_ueqv_R007NY_partial_03_0038,
  rs_R007_ueqv_R007NY_partial_03_0039,
  rs_R007_ueqv_R007NY_partial_03_0040,
  rs_R007_ueqv_R007NY_partial_03_0041,
  rs_R007_ueqv_R007NY_partial_03_0042,
  rs_R007_ueqv_R007NY_partial_03_0043,
  rs_R007_ueqv_R007NY_partial_03_0044,
  rs_R007_ueqv_R007NY_partial_03_0045,
  rs_R007_ueqv_R007NY_partial_03_0046,
  rs_R007_ueqv_R007NY_partial_03_0047,
  rs_R007_ueqv_R007NY_partial_03_0048,
  rs_R007_ueqv_R007NY_partial_03_0049,
  rs_R007_ueqv_R007NY_partial_03_0050,
  rs_R007_ueqv_R007NY_partial_03_0051,
  rs_R007_ueqv_R007NY_partial_03_0052,
  rs_R007_ueqv_R007NY_partial_03_0053,
  rs_R007_ueqv_R007NY_partial_03_0054,
  rs_R007_ueqv_R007NY_partial_03_0055,
  rs_R007_ueqv_R007NY_partial_03_0056,
  rs_R007_ueqv_R007NY_partial_03_0057,
  rs_R007_ueqv_R007NY_partial_03_0058,
  rs_R007_ueqv_R007NY_partial_03_0059,
  rs_R007_ueqv_R007NY_partial_03_0060,
  rs_R007_ueqv_R007NY_partial_03_0061,
  rs_R007_ueqv_R007NY_partial_03_0062,
  rs_R007_ueqv_R007NY_partial_03_0063,
  rs_R007_ueqv_R007NY_partial_03_0064,
  rs_R007_ueqv_R007NY_partial_03_0065,
  rs_R007_ueqv_R007NY_partial_03_0066,
  rs_R007_ueqv_R007NY_partial_03_0067,
  rs_R007_ueqv_R007NY_partial_03_0068,
  rs_R007_ueqv_R007NY_partial_03_0069,
  rs_R007_ueqv_R007NY_partial_03_0070,
  rs_R007_ueqv_R007NY_partial_03_0071,
  rs_R007_ueqv_R007NY_partial_03_0072,
  rs_R007_ueqv_R007NY_partial_03_0073,
  rs_R007_ueqv_R007NY_partial_03_0074,
  rs_R007_ueqv_R007NY_partial_03_0075,
  rs_R007_ueqv_R007NY_partial_03_0076,
  rs_R007_ueqv_R007NY_partial_03_0077,
  rs_R007_ueqv_R007NY_partial_03_0078,
  rs_R007_ueqv_R007NY_partial_03_0079,
  rs_R007_ueqv_R007NY_partial_03_0080,
  rs_R007_ueqv_R007NY_partial_03_0081,
  rs_R007_ueqv_R007NY_partial_03_0082,
  rs_R007_ueqv_R007NY_partial_03_0083,
  rs_R007_ueqv_R007NY_partial_03_0084,
  rs_R007_ueqv_R007NY_partial_03_0085,
  rs_R007_ueqv_R007NY_partial_03_0086,
  rs_R007_ueqv_R007NY_partial_03_0087,
  rs_R007_ueqv_R007NY_partial_03_0088,
  rs_R007_ueqv_R007NY_partial_03_0089,
  rs_R007_ueqv_R007NY_partial_03_0090,
  rs_R007_ueqv_R007NY_partial_03_0091,
  rs_R007_ueqv_R007NY_partial_03_0092,
  rs_R007_ueqv_R007NY_partial_03_0093,
  rs_R007_ueqv_R007NY_partial_03_0094,
  rs_R007_ueqv_R007NY_partial_03_0095,
  rs_R007_ueqv_R007NY_partial_03_0096,
  rs_R007_ueqv_R007NY_partial_03_0097,
  rs_R007_ueqv_R007NY_partial_03_0098,
  rs_R007_ueqv_R007NY_partial_03_0099
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_03_0000_0099 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 3), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 2), (15, 2), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 3), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 3), (11, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 3), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (11, 2), (15, 2), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 3), (15, 1), (16, 1)],
  term ((-46589738784138659326090 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((27953843270483195595654 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((23294869392069329663045 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-13976921635241597797827 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((23294869392069329663045 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-13976921635241597797827 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((46589738784138659326090 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-27953843270483195595654 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23294869392069329663045 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((13976921635241597797827 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((13976921635241597797827 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-23294869392069329663045 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (11, 3), (16, 1)],
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((598677718284396615517045 : Rat) / 3779172868318576719228) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119735543656879323103409 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((337953801130174655980970 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-67590760226034931196194 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((145299655311850235539430 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2843827338887233576310 : Rat) / 1502055988997844483) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12254241369435728524125835 : Rat) / 3779172868318576719228) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-40598312741837720600650 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-29059931062370047107886 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((568765467777446715262 : Rat) / 500685329665948161) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((2509309844235392022490103 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(0, 1), (6, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-598677718284396615517045 : Rat) / 7558345736637153438456) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((119735543656879323103409 : Rat) / 2519448578879051146152) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-168976900565087327990485 : Rat) / 944793217079644179807) [(0, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((33795380113017465598097 : Rat) / 314931072359881393269) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-72649827655925117769715 : Rat) / 944793217079644179807) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12254241369435728524125835 : Rat) / 7558345736637153438456) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((14529965531185023553943 : Rat) / 314931072359881393269) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2509309844235392022490103 : Rat) / 2519448578879051146152) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (6, 2), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-598677718284396615517045 : Rat) / 3779172868318576719228) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((119735543656879323103409 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((598677718284396615517045 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-119735543656879323103409 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-119735543656879323103409 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (11, 3), (14, 1), (16, 1)],
  term ((598677718284396615517045 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (11, 3), (16, 1)],
  term ((-168976900565087327990485 : Rat) / 944793217079644179807) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((33795380113017465598097 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-72649827655925117769715 : Rat) / 944793217079644179807) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12254241369435728524125835 : Rat) / 7558345736637153438456) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((14529965531185023553943 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2509309844235392022490103 : Rat) / 2519448578879051146152) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (7, 2), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 3), (11, 1), (14, 1), (16, 1)],
  term ((-598677718284396615517045 : Rat) / 7558345736637153438456) [(0, 1), (7, 3), (11, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((119735543656879323103409 : Rat) / 2519448578879051146152) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((-337953801130174655980970 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((67590760226034931196194 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((168976900565087327990485 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-33795380113017465598097 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-33795380113017465598097 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((168976900565087327990485 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((-145299655311850235539430 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2843827338887233576310 : Rat) / 1502055988997844483) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12254241369435728524125835 : Rat) / 3779172868318576719228) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((40598312741837720600650 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((29059931062370047107886 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-568765467777446715262 : Rat) / 500685329665948161) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2509309844235392022490103 : Rat) / 1259724289439525573076) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(0, 1), (10, 1), (16, 1)],
  term ((72649827655925117769715 : Rat) / 944793217079644179807) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12254241369435728524125835 : Rat) / 7558345736637153438456) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (10, 2), (11, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-14529965531185023553943 : Rat) / 314931072359881393269) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((2509309844235392022490103 : Rat) / 2519448578879051146152) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (10, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-14529965531185023553943 : Rat) / 314931072359881393269) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((2509309844235392022490103 : Rat) / 2519448578879051146152) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (11, 2), (16, 1)],
  term ((72649827655925117769715 : Rat) / 944793217079644179807) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-12254241369435728524125835 : Rat) / 7558345736637153438456) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (11, 4), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (6, 2), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (7, 2), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (10, 1), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (10, 2), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 3), (16, 1)],
  term ((207658306623826248811070 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-41531661324765249762214 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-103829153311913124405535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((20765830662382624881107 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-103829153311913124405535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((20765830662382624881107 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-207658306623826248811070 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((41531661324765249762214 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((103829153311913124405535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((-20765830662382624881107 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((-20765830662382624881107 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((103829153311913124405535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 3), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 3), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 3), (11, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 3), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 3), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-337953801130174655980970 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((67590760226034931196194 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((40598312741837720600650 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-7699754451887702262438 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((547431752964771063197155 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((5125568393168872109149075 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((363962527500578354860150 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((536202468080387454908293 : Rat) / 2519448578879051146152) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-109486350592954212639431 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1023853954344334896256739 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-108584199524812984926273 : Rat) / 839816192959683715384) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-218377516500347012916090 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term (1 : Rat) [(1, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (6, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((168976900565087327990485 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-33795380113017465598097 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-547431752964771063197155 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-5125568393168872109149075 : Rat) / 1889586434159288359614) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-181981263750289177430075 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-536202468080387454908293 : Rat) / 5038897157758102292304) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((109486350592954212639431 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((1023853954344334896256739 : Rat) / 629862144719762786538) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((108584199524812984926273 : Rat) / 1679632385919367430768) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (15, 3), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 1), (10, 3), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 3), (13, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((168976900565087327990485 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-33795380113017465598097 : Rat) / 314931072359881393269) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-547431752964771063197155 : Rat) / 3779172868318576719228) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-5125568393168872109149075 : Rat) / 1889586434159288359614) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-181981263750289177430075 : Rat) / 104977024119960464423) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-536202468080387454908293 : Rat) / 5038897157758102292304) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((109486350592954212639431 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((1023853954344334896256739 : Rat) / 629862144719762786538) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((108584199524812984926273 : Rat) / 1679632385919367430768) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 3), (10, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 3), (11, 1), (13, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (7, 3), (14, 1), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (7, 3), (15, 2), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 3), (16, 1)],
  term ((337953801130174655980970 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-67590760226034931196194 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-168976900565087327990485 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((33795380113017465598097 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((33795380113017465598097 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-168976900565087327990485 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((-547431752964771063197155 : Rat) / 1889586434159288359614) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5125568393168872109149075 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-363962527500578354860150 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-536202468080387454908293 : Rat) / 2519448578879051146152) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (11, 3), (16, 1)],
  term ((109486350592954212639431 : Rat) / 629862144719762786538) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((1023853954344334896256739 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((108584199524812984926273 : Rat) / 839816192959683715384) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((218377516500347012916090 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((547431752964771063197155 : Rat) / 3779172868318576719228) [(1, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((5125568393168872109149075 : Rat) / 1889586434159288359614) [(1, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((181981263750289177430075 : Rat) / 104977024119960464423) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-37790178596338691567369 : Rat) / 1679632385919367430768) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-109486350592954212639431 : Rat) / 1259724289439525573076) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1023853954344334896256739 : Rat) / 629862144719762786538) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((14611871705390251272735 : Rat) / 1679632385919367430768) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (10, 2), (15, 3), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (10, 3), (11, 1), (16, 1)],
  term ((-3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((-109486350592954212639431 : Rat) / 1259724289439525573076) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1023853954344334896256739 : Rat) / 629862144719762786538) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-108584199524812984926273 : Rat) / 1679632385919367430768) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((547431752964771063197155 : Rat) / 3779172868318576719228) [(1, 1), (11, 3), (12, 1), (16, 1)],
  term ((5125568393168872109149075 : Rat) / 1889586434159288359614) [(1, 1), (11, 3), (14, 1), (16, 1)],
  term ((181981263750289177430075 : Rat) / 104977024119960464423) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((536202468080387454908293 : Rat) / 5038897157758102292304) [(1, 1), (11, 3), (16, 1)],
  term (8 : Rat) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (6, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (6, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (6, 2), (16, 1)],
  term (-4 : Rat) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (7, 2), (16, 1)],
  term (-8 : Rat) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (10, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (11, 2), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-491464238088431256995 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-491464238088431256995 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((491464238088431256995 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((491464238088431256995 : Rat) / 104977024119960464423) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (11, 3), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((619560296787890055 : Rat) / 4284776494692263854) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-371736178072734033 : Rat) / 4284776494692263854) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17584868801864476496660 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((56872599196096972300692 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3516973760372895299332 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-33285790091998415031245 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-619560296787890055 : Rat) / 8569552989384527708) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((371736178072734033 : Rat) / 8569552989384527708) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8792434400932238248330 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28436299598048486150346 : Rat) / 104977024119960464423) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1758486880186447649666 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((33285790091998415031245 : Rat) / 209954048239920928846) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-619560296787890055 : Rat) / 4284776494692263854) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 3), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((371736178072734033 : Rat) / 4284776494692263854) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-167280659041070210319785 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((33456131808214042063957 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 3), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 3), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-371736178072734033 : Rat) / 8569552989384527708) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 3), (14, 1), (16, 1)],
  term ((619560296787890055 : Rat) / 8569552989384527708) [(2, 1), (7, 1), (11, 3), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8792434400932238248330 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28436299598048486150346 : Rat) / 104977024119960464423) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1758486880186447649666 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((33285790091998415031245 : Rat) / 209954048239920928846) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 3), (10, 1), (11, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 3), (11, 1), (14, 1), (16, 1)],
  term ((-619560296787890055 : Rat) / 8569552989384527708) [(2, 1), (7, 3), (11, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((371736178072734033 : Rat) / 8569552989384527708) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17584868801864476496660 : Rat) / 134970459582806311401) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56872599196096972300692 : Rat) / 104977024119960464423) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3516973760372895299332 : Rat) / 44990153194268770467) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((33285790091998415031245 : Rat) / 104977024119960464423) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8792434400932238248330 : Rat) / 134970459582806311401) [(2, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((339703638948413210270134 : Rat) / 944793217079644179807) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 1889586434159288359614) [(2, 1), (10, 2), (11, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1758486880186447649666 : Rat) / 44990153194268770467) [(2, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((-133368147302385979060543 : Rat) / 629862144719762786538) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 3), (11, 1), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 3), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1758486880186447649666 : Rat) / 44990153194268770467) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-33285790091998415031245 : Rat) / 209954048239920928846) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-8792434400932238248330 : Rat) / 134970459582806311401) [(2, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((28436299598048486150346 : Rat) / 104977024119960464423) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 1889586434159288359614) [(2, 1), (11, 4), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-491464238088431256995 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-491464238088431256995 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((491464238088431256995 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((491464238088431256995 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 3), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 3), (15, 1), (16, 1)],
  term ((-184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 2), (16, 1)],
  term ((41888471282988417458510 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((183837650639606136080395 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((329301408243223573075288 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1115191402432117677861335 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36767530127921227216079 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((74905970957447634334345 : Rat) / 419908096479841857692) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-75913514756561934805100 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (7, 1), (11, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-183837650639606136080395 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-164650704121611786537644 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((1115191402432117677861335 : Rat) / 7558345736637153438456) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((36767530127921227216079 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-74905970957447634334345 : Rat) / 839816192959683715384) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((37956757378280967402550 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 2), (11, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 4), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-183837650639606136080395 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-164650704121611786537644 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((1115191402432117677861335 : Rat) / 7558345736637153438456) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((36767530127921227216079 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-74905970957447634334345 : Rat) / 839816192959683715384) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((37956757378280967402550 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 3), (11, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 3), (15, 2), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-183837650639606136080395 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-329301408243223573075288 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1115191402432117677861335 : Rat) / 3779172868318576719228) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 38562988452230374686) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (11, 3), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((36767530127921227216079 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74905970957447634334345 : Rat) / 419908096479841857692) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((75913514756561934805100 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((183837650639606136080395 : Rat) / 1889586434159288359614) [(3, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((164650704121611786537644 : Rat) / 944793217079644179807) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1617853057827978687363455 : Rat) / 7558345736637153438456) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-36767530127921227216079 : Rat) / 629862144719762786538) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((108416747983838368301153 : Rat) / 839816192959683715384) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-37956757378280967402550 : Rat) / 314931072359881393269) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (10, 3), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (10, 3), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-36767530127921227216079 : Rat) / 629862144719762786538) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((74905970957447634334345 : Rat) / 839816192959683715384) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-37956757378280967402550 : Rat) / 314931072359881393269) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((183837650639606136080395 : Rat) / 1889586434159288359614) [(3, 1), (11, 3), (14, 1), (16, 1)],
  term ((164650704121611786537644 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (15, 2), (16, 1)],
  term ((-1115191402432117677861335 : Rat) / 7558345736637153438456) [(3, 1), (11, 3), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (11, 4), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((103387324493161324946105 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62032394695896794967663 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((191190748533369514597960 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-830837602903043491338295 : Rat) / 629862144719762786538) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-103387324493161324946105 : Rat) / 419908096479841857692) [(4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((62032394695896794967663 : Rat) / 419908096479841857692) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((830837602903043491338295 : Rat) / 1259724289439525573076) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-103387324493161324946105 : Rat) / 209954048239920928846) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 1), (11, 3), (16, 1)],
  term ((-57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((62032394695896794967663 : Rat) / 209954048239920928846) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((891168781391377423955345 : Rat) / 3779172868318576719228) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-178233756278275484791069 : Rat) / 1259724289439525573076) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 3), (11, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 3), (15, 1), (16, 1)],
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-62032394695896794967663 : Rat) / 419908096479841857692) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 3), (14, 1), (16, 1)],
  term ((103387324493161324946105 : Rat) / 419908096479841857692) [(4, 1), (7, 1), (11, 3), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((830837602903043491338295 : Rat) / 1259724289439525573076) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 3), (10, 1), (11, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 3), (11, 1), (14, 1), (16, 1)],
  term ((-103387324493161324946105 : Rat) / 419908096479841857692) [(4, 1), (7, 3), (11, 1), (16, 1)],
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((62032394695896794967663 : Rat) / 419908096479841857692) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-191190748533369514597960 : Rat) / 104977024119960464423) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((830837602903043491338295 : Rat) / 629862144719762786538) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-344839790087854496127955 : Rat) / 539881838331225245604) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 3), (11, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 3), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-830837602903043491338295 : Rat) / 1259724289439525573076) [(4, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 0 through 99. -/
theorem rs_R007_ueqv_R007NY_block_03_0000_0099_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_03_0000_0099
      rs_R007_ueqv_R007NY_block_03_0000_0099 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
