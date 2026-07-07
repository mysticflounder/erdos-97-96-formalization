/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 0:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 0 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_00_0000_0099 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0000 : Poly :=
[
  term ((1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0000 : Poly :=
[
  term ((-1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((1670305698796967316635 : Rat) / 44990153194268770467) [(0, 3), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0000
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0001 : Poly :=
[
  term ((-334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0001 : Poly :=
[
  term ((334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-334061139759393463327 : Rat) / 14996717731422923489) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0001
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0002 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0002 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 3), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 3), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0002
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0003 : Poly :=
[
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0003 : Poly :=
[
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0003
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0004 : Poly :=
[
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0004 : Poly :=
[
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (1, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 3), (4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0004
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0005 : Poly :=
[
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0005 : Poly :=
[
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 3), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0005
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0006 : Poly :=
[
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0006 : Poly :=
[
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 3), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0006
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0007 : Poly :=
[
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 7 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0007 : Poly :=
[
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (2, 2), (4, 1), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 3), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0007
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0008 : Poly :=
[
  term ((-16978362900116695209795 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0008 : Poly :=
[
  term ((-16978362900116695209795 : Rat) / 104977024119960464423) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((16978362900116695209795 : Rat) / 104977024119960464423) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((16978362900116695209795 : Rat) / 104977024119960464423) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-16978362900116695209795 : Rat) / 104977024119960464423) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0008
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0009 : Poly :=
[
  term ((10187017740070017125877 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0009 : Poly :=
[
  term ((10187017740070017125877 : Rat) / 104977024119960464423) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-10187017740070017125877 : Rat) / 104977024119960464423) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-10187017740070017125877 : Rat) / 104977024119960464423) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((10187017740070017125877 : Rat) / 104977024119960464423) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0009
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0010 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0010 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 3), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0010
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0011 : Poly :=
[
  term ((-356204642550734165834725 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0011 : Poly :=
[
  term ((-356204642550734165834725 : Rat) / 2519448578879051146152) [(0, 1), (1, 2), (7, 1), (11, 1), (16, 1)],
  term ((356204642550734165834725 : Rat) / 2519448578879051146152) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((356204642550734165834725 : Rat) / 2519448578879051146152) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-356204642550734165834725 : Rat) / 2519448578879051146152) [(0, 3), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0011
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0012 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0012 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 3), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0012
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0013 : Poly :=
[
  term ((210363520758601764639299 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0013 : Poly :=
[
  term ((210363520758601764639299 : Rat) / 2519448578879051146152) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-210363520758601764639299 : Rat) / 2519448578879051146152) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-210363520758601764639299 : Rat) / 2519448578879051146152) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((210363520758601764639299 : Rat) / 2519448578879051146152) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0013
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0014 : Poly :=
[
  term ((2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0014 : Poly :=
[
  term ((2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((2168193526711736267725 : Rat) / 111152143185840491742) [(0, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0014
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0015 : Poly :=
[
  term ((-433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0015 : Poly :=
[
  term ((-433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-433638705342347253545 : Rat) / 37050714395280163914) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0015
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0016 : Poly :=
[
  term ((-3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0016 : Poly :=
[
  term ((-3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3122593501267461466685 : Rat) / 89980306388537540934) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0016
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0017 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0017 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0017
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0018 : Poly :=
[
  term ((-20919341585386805769155 : Rat) / 359921225554150163736) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0018 : Poly :=
[
  term ((-20919341585386805769155 : Rat) / 359921225554150163736) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((20919341585386805769155 : Rat) / 359921225554150163736) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((20919341585386805769155 : Rat) / 359921225554150163736) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-20919341585386805769155 : Rat) / 359921225554150163736) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0018
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0019 : Poly :=
[
  term ((413412131451344175687800 : Rat) / 944793217079644179807) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 19 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0019 : Poly :=
[
  term ((413412131451344175687800 : Rat) / 944793217079644179807) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((-413412131451344175687800 : Rat) / 944793217079644179807) [(0, 1), (2, 2), (11, 2), (16, 1)],
  term ((-413412131451344175687800 : Rat) / 944793217079644179807) [(0, 1), (3, 2), (11, 2), (16, 1)],
  term ((413412131451344175687800 : Rat) / 944793217079644179807) [(0, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0019
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0020 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 20 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0020 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0020
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0021 : Poly :=
[
  term ((624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0021 : Poly :=
[
  term ((624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((624518700253492293337 : Rat) / 29993435462845846978) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0021
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0022 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0022 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0022
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0023 : Poly :=
[
  term ((-302295881990988354706765 : Rat) / 2519448578879051146152) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0023 : Poly :=
[
  term ((-302295881990988354706765 : Rat) / 2519448578879051146152) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((302295881990988354706765 : Rat) / 2519448578879051146152) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((302295881990988354706765 : Rat) / 2519448578879051146152) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-302295881990988354706765 : Rat) / 2519448578879051146152) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0023
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0024 : Poly :=
[
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0024 : Poly :=
[
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 2), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 3), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 3), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0024
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0025 : Poly :=
[
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0025 : Poly :=
[
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0025
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0026 : Poly :=
[
  term ((404421148737511728775040 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0026 : Poly :=
[
  term ((404421148737511728775040 : Rat) / 944793217079644179807) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-404421148737511728775040 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((-404421148737511728775040 : Rat) / 944793217079644179807) [(1, 1), (3, 2), (4, 1), (11, 1), (16, 1)],
  term ((404421148737511728775040 : Rat) / 944793217079644179807) [(1, 3), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0026
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0027 : Poly :=
[
  term ((-80884229747502345755008 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0027 : Poly :=
[
  term ((-80884229747502345755008 : Rat) / 314931072359881393269) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((80884229747502345755008 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((80884229747502345755008 : Rat) / 314931072359881393269) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((-80884229747502345755008 : Rat) / 314931072359881393269) [(1, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0027
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0028 : Poly :=
[
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0028 : Poly :=
[
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 2), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (3, 2), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 3), (5, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0028
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0029 : Poly :=
[
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0029 : Poly :=
[
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 2), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (3, 2), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 3), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0029
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0030 : Poly :=
[
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0030 : Poly :=
[
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 2), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 3), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0030
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0031 : Poly :=
[
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 31 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0031 : Poly :=
[
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 2), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 3), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0031
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0032 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0032 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(0, 2), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (2, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (3, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 3), (7, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0032
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0033 : Poly :=
[
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0033 : Poly :=
[
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0033
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0034 : Poly :=
[
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0034 : Poly :=
[
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0034
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0035 : Poly :=
[
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 35 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0035 : Poly :=
[
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(0, 2), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0035
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0036 : Poly :=
[
  term ((-607158998196259308223225 : Rat) / 629862144719762786538) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0036 : Poly :=
[
  term ((-607158998196259308223225 : Rat) / 629862144719762786538) [(0, 2), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((607158998196259308223225 : Rat) / 629862144719762786538) [(1, 1), (2, 2), (8, 1), (11, 1), (16, 1)],
  term ((607158998196259308223225 : Rat) / 629862144719762786538) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)],
  term ((-607158998196259308223225 : Rat) / 629862144719762786538) [(1, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0036
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0037 : Poly :=
[
  term ((121431799639251861644645 : Rat) / 209954048239920928846) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0037 : Poly :=
[
  term ((121431799639251861644645 : Rat) / 209954048239920928846) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-121431799639251861644645 : Rat) / 209954048239920928846) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-121431799639251861644645 : Rat) / 209954048239920928846) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((121431799639251861644645 : Rat) / 209954048239920928846) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0037
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0038 : Poly :=
[
  term ((-144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 38 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0038 : Poly :=
[
  term ((-144531092301421410024425 : Rat) / 944793217079644179807) [(0, 2), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((-144531092301421410024425 : Rat) / 944793217079644179807) [(1, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0038
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0039 : Poly :=
[
  term ((28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0039 : Poly :=
[
  term ((28906218460284282004885 : Rat) / 314931072359881393269) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((28906218460284282004885 : Rat) / 314931072359881393269) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0039
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0040 : Poly :=
[
  term ((1248685638285530830228595 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 40 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0040 : Poly :=
[
  term ((1248685638285530830228595 : Rat) / 3779172868318576719228) [(0, 2), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1248685638285530830228595 : Rat) / 3779172868318576719228) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1248685638285530830228595 : Rat) / 3779172868318576719228) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((1248685638285530830228595 : Rat) / 3779172868318576719228) [(1, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0040
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0041 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 41 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0041 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(0, 2), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (2, 2), (11, 1), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (3, 2), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(1, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0041
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0042 : Poly :=
[
  term ((-32382728193950933303005 : Rat) / 7558345736637153438456) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 42 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0042 : Poly :=
[
  term ((-32382728193950933303005 : Rat) / 7558345736637153438456) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((32382728193950933303005 : Rat) / 7558345736637153438456) [(1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((32382728193950933303005 : Rat) / 7558345736637153438456) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-32382728193950933303005 : Rat) / 7558345736637153438456) [(1, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0042
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0043 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0043 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0043
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0044 : Poly :=
[
  term ((-175182158787069975531965 : Rat) / 15116691473274306876912) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0044 : Poly :=
[
  term ((-175182158787069975531965 : Rat) / 15116691473274306876912) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((175182158787069975531965 : Rat) / 15116691473274306876912) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((175182158787069975531965 : Rat) / 15116691473274306876912) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-175182158787069975531965 : Rat) / 15116691473274306876912) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0044
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0045 : Poly :=
[
  term ((-249737127657106166045719 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0045 : Poly :=
[
  term ((-249737127657106166045719 : Rat) / 1259724289439525573076) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((249737127657106166045719 : Rat) / 1259724289439525573076) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((249737127657106166045719 : Rat) / 1259724289439525573076) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-249737127657106166045719 : Rat) / 1259724289439525573076) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0045
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0046 : Poly :=
[
  term ((2 : Rat) / 3) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 46 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0046 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0046
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0047 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0047 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(0, 2), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(1, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0047
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0048 : Poly :=
[
  term ((13195075182467656383673 : Rat) / 2519448578879051146152) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0048 : Poly :=
[
  term ((13195075182467656383673 : Rat) / 2519448578879051146152) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13195075182467656383673 : Rat) / 2519448578879051146152) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13195075182467656383673 : Rat) / 2519448578879051146152) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((13195075182467656383673 : Rat) / 2519448578879051146152) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0048
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0049 : Poly :=
[
  term ((24958637441897790521785 : Rat) / 5038897157758102292304) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0049 : Poly :=
[
  term ((24958637441897790521785 : Rat) / 5038897157758102292304) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-24958637441897790521785 : Rat) / 5038897157758102292304) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-24958637441897790521785 : Rat) / 5038897157758102292304) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((24958637441897790521785 : Rat) / 5038897157758102292304) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0049
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0050 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 50 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0050 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (2, 2), (15, 3), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 2), (15, 3), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0050
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0051 : Poly :=
[
  term ((318138305339935404701660 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 51 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0051 : Poly :=
[
  term ((318138305339935404701660 : Rat) / 944793217079644179807) [(0, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((318138305339935404701660 : Rat) / 944793217079644179807) [(1, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-318138305339935404701660 : Rat) / 944793217079644179807) [(2, 1), (3, 3), (11, 1), (16, 1)],
  term ((-318138305339935404701660 : Rat) / 944793217079644179807) [(2, 3), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0051
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0052 : Poly :=
[
  term ((-63627661067987080940332 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0052 : Poly :=
[
  term ((-63627661067987080940332 : Rat) / 314931072359881393269) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-63627661067987080940332 : Rat) / 314931072359881393269) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((63627661067987080940332 : Rat) / 314931072359881393269) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((63627661067987080940332 : Rat) / 314931072359881393269) [(2, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0052
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0053 : Poly :=
[
  term ((-57208907937078434404895 : Rat) / 269940919165612622802) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 53 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0053 : Poly :=
[
  term ((-57208907937078434404895 : Rat) / 269940919165612622802) [(0, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-57208907937078434404895 : Rat) / 269940919165612622802) [(1, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((57208907937078434404895 : Rat) / 269940919165612622802) [(2, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((57208907937078434404895 : Rat) / 269940919165612622802) [(2, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0053
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0054 : Poly :=
[
  term ((11441781587415686880979 : Rat) / 89980306388537540934) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0054 : Poly :=
[
  term ((11441781587415686880979 : Rat) / 89980306388537540934) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((11441781587415686880979 : Rat) / 89980306388537540934) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-11441781587415686880979 : Rat) / 89980306388537540934) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-11441781587415686880979 : Rat) / 89980306388537540934) [(2, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0054
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0055 : Poly :=
[
  term ((-38439208418846201433815 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0055 : Poly :=
[
  term ((-38439208418846201433815 : Rat) / 944793217079644179807) [(0, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-38439208418846201433815 : Rat) / 944793217079644179807) [(1, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((38439208418846201433815 : Rat) / 944793217079644179807) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((38439208418846201433815 : Rat) / 944793217079644179807) [(2, 3), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0055
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0056 : Poly :=
[
  term ((7687841683769240286763 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0056 : Poly :=
[
  term ((7687841683769240286763 : Rat) / 314931072359881393269) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((7687841683769240286763 : Rat) / 314931072359881393269) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7687841683769240286763 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-7687841683769240286763 : Rat) / 314931072359881393269) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0056
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0057 : Poly :=
[
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 57 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0057 : Poly :=
[
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 269940919165612622802) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 269940919165612622802) [(2, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0057
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0058 : Poly :=
[
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0058 : Poly :=
[
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 89980306388537540934) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 89980306388537540934) [(2, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0058
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0059 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 59 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0059 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0059
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0060 : Poly :=
[
  term ((36423303951024465752530 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 60 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0060 : Poly :=
[
  term ((36423303951024465752530 : Rat) / 314931072359881393269) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((36423303951024465752530 : Rat) / 314931072359881393269) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-36423303951024465752530 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-36423303951024465752530 : Rat) / 314931072359881393269) [(2, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0060
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0061 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0061 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(2, 1), (3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(2, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0061
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0062 : Poly :=
[
  term ((6635996202479029371385 : Rat) / 19281494226115187343) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0062 : Poly :=
[
  term ((6635996202479029371385 : Rat) / 19281494226115187343) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((6635996202479029371385 : Rat) / 19281494226115187343) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6635996202479029371385 : Rat) / 19281494226115187343) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6635996202479029371385 : Rat) / 19281494226115187343) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0062
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0063 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0063 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0063
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0064 : Poly :=
[
  term ((-7284660790204893150506 : Rat) / 104977024119960464423) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0064 : Poly :=
[
  term ((-7284660790204893150506 : Rat) / 104977024119960464423) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7284660790204893150506 : Rat) / 104977024119960464423) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((7284660790204893150506 : Rat) / 104977024119960464423) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((7284660790204893150506 : Rat) / 104977024119960464423) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0064
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0065 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 65 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0065 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(0, 2), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 2), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0065
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0066 : Poly :=
[
  term ((-1327199240495805874277 : Rat) / 6427164742038395781) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 66 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0066 : Poly :=
[
  term ((-1327199240495805874277 : Rat) / 6427164742038395781) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-1327199240495805874277 : Rat) / 6427164742038395781) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((1327199240495805874277 : Rat) / 6427164742038395781) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((1327199240495805874277 : Rat) / 6427164742038395781) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0066
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0067 : Poly :=
[
  term ((-90366213604783667799695 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 67 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0067 : Poly :=
[
  term ((-90366213604783667799695 : Rat) / 1889586434159288359614) [(0, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-90366213604783667799695 : Rat) / 1889586434159288359614) [(1, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((90366213604783667799695 : Rat) / 1889586434159288359614) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((90366213604783667799695 : Rat) / 1889586434159288359614) [(3, 3), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0067_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0067
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0068 : Poly :=
[
  term ((18073242720956733559939 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0068 : Poly :=
[
  term ((18073242720956733559939 : Rat) / 629862144719762786538) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((18073242720956733559939 : Rat) / 629862144719762786538) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-18073242720956733559939 : Rat) / 629862144719762786538) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-18073242720956733559939 : Rat) / 629862144719762786538) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0068_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0068
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0069 : Poly :=
[
  term ((-278551636685914910094715 : Rat) / 1889586434159288359614) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 69 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0069 : Poly :=
[
  term ((-278551636685914910094715 : Rat) / 1889586434159288359614) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-278551636685914910094715 : Rat) / 1889586434159288359614) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((278551636685914910094715 : Rat) / 1889586434159288359614) [(2, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((278551636685914910094715 : Rat) / 1889586434159288359614) [(3, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0069_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0069
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0070 : Poly :=
[
  term ((55710327337182982018943 : Rat) / 629862144719762786538) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0070 : Poly :=
[
  term ((55710327337182982018943 : Rat) / 629862144719762786538) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((55710327337182982018943 : Rat) / 629862144719762786538) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-55710327337182982018943 : Rat) / 629862144719762786538) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-55710327337182982018943 : Rat) / 629862144719762786538) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0070_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0070
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0071 : Poly :=
[
  term ((-33391580269675772575870 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 71 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0071 : Poly :=
[
  term ((-33391580269675772575870 : Rat) / 134970459582806311401) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-33391580269675772575870 : Rat) / 134970459582806311401) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((33391580269675772575870 : Rat) / 134970459582806311401) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((33391580269675772575870 : Rat) / 134970459582806311401) [(3, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0071_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0071
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0072 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0072 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0072_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0072
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0073 : Poly :=
[
  term ((-38115237374553525791425 : Rat) / 104977024119960464423) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 73 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0073 : Poly :=
[
  term ((-38115237374553525791425 : Rat) / 104977024119960464423) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38115237374553525791425 : Rat) / 104977024119960464423) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((38115237374553525791425 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((38115237374553525791425 : Rat) / 104977024119960464423) [(3, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0073_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0073
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0074 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 74 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0074 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(3, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0074_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0074
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0075 : Poly :=
[
  term ((832330894844574404640325 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 75 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0075 : Poly :=
[
  term ((832330894844574404640325 : Rat) / 944793217079644179807) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((832330894844574404640325 : Rat) / 944793217079644179807) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-832330894844574404640325 : Rat) / 944793217079644179807) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-832330894844574404640325 : Rat) / 944793217079644179807) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0075_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0075
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0076 : Poly :=
[
  term ((6678316053935154515174 : Rat) / 44990153194268770467) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0076 : Poly :=
[
  term ((6678316053935154515174 : Rat) / 44990153194268770467) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((6678316053935154515174 : Rat) / 44990153194268770467) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6678316053935154515174 : Rat) / 44990153194268770467) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6678316053935154515174 : Rat) / 44990153194268770467) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0076_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0076
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0077 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 77 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0077 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0077_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0077
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0078 : Poly :=
[
  term ((22869142424732115474855 : Rat) / 104977024119960464423) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0078 : Poly :=
[
  term ((22869142424732115474855 : Rat) / 104977024119960464423) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((22869142424732115474855 : Rat) / 104977024119960464423) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22869142424732115474855 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22869142424732115474855 : Rat) / 104977024119960464423) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0078_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0078
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0079 : Poly :=
[
  term ((-166466178968914880928065 : Rat) / 314931072359881393269) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0079 : Poly :=
[
  term ((-166466178968914880928065 : Rat) / 314931072359881393269) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-166466178968914880928065 : Rat) / 314931072359881393269) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((166466178968914880928065 : Rat) / 314931072359881393269) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((166466178968914880928065 : Rat) / 314931072359881393269) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0079_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0079
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0080 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 80 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0080 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0080_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0080
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0081 : Poly :=
[
  term ((-83133200350547461287370 : Rat) / 944793217079644179807) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 81 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0081 : Poly :=
[
  term ((-83133200350547461287370 : Rat) / 944793217079644179807) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-83133200350547461287370 : Rat) / 944793217079644179807) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((83133200350547461287370 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((83133200350547461287370 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0081_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0081
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0082 : Poly :=
[
  term ((16626640070109492257474 : Rat) / 314931072359881393269) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0082 : Poly :=
[
  term ((16626640070109492257474 : Rat) / 314931072359881393269) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((16626640070109492257474 : Rat) / 314931072359881393269) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-16626640070109492257474 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-16626640070109492257474 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0082_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0082
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0083 : Poly :=
[
  term ((-2153929834559236239680 : Rat) / 9354388287917269107) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 83 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0083 : Poly :=
[
  term ((-2153929834559236239680 : Rat) / 9354388287917269107) [(0, 2), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2153929834559236239680 : Rat) / 9354388287917269107) [(1, 2), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((2153929834559236239680 : Rat) / 9354388287917269107) [(2, 2), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((2153929834559236239680 : Rat) / 9354388287917269107) [(3, 2), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0083_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0083
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0084 : Poly :=
[
  term ((950144489961989174794745 : Rat) / 3779172868318576719228) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 84 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0084 : Poly :=
[
  term ((950144489961989174794745 : Rat) / 3779172868318576719228) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((950144489961989174794745 : Rat) / 3779172868318576719228) [(1, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-950144489961989174794745 : Rat) / 3779172868318576719228) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-950144489961989174794745 : Rat) / 3779172868318576719228) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0084_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0084
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0085 : Poly :=
[
  term ((430785966911847247936 : Rat) / 3118129429305756369) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0085 : Poly :=
[
  term ((430785966911847247936 : Rat) / 3118129429305756369) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((430785966911847247936 : Rat) / 3118129429305756369) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-430785966911847247936 : Rat) / 3118129429305756369) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-430785966911847247936 : Rat) / 3118129429305756369) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0085_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0085
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0086 : Poly :=
[
  term ((-190028897992397834958949 : Rat) / 1259724289439525573076) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0086 : Poly :=
[
  term ((-190028897992397834958949 : Rat) / 1259724289439525573076) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-190028897992397834958949 : Rat) / 1259724289439525573076) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((190028897992397834958949 : Rat) / 1259724289439525573076) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((190028897992397834958949 : Rat) / 1259724289439525573076) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0086_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0086
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0087 : Poly :=
[
  term ((-14602115651210600881435 : Rat) / 111152143185840491742) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 87 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0087 : Poly :=
[
  term ((-14602115651210600881435 : Rat) / 111152143185840491742) [(0, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-14602115651210600881435 : Rat) / 111152143185840491742) [(1, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((14602115651210600881435 : Rat) / 111152143185840491742) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((14602115651210600881435 : Rat) / 111152143185840491742) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0087_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0087
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0088 : Poly :=
[
  term ((2920423130242120176287 : Rat) / 37050714395280163914) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0088 : Poly :=
[
  term ((2920423130242120176287 : Rat) / 37050714395280163914) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2920423130242120176287 : Rat) / 37050714395280163914) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2920423130242120176287 : Rat) / 37050714395280163914) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2920423130242120176287 : Rat) / 37050714395280163914) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0088_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0088
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0089 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0089 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0089_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0089
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0090 : Poly :=
[
  term ((-363868440110018951659285 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 90 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0090 : Poly :=
[
  term ((-363868440110018951659285 : Rat) / 944793217079644179807) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-363868440110018951659285 : Rat) / 944793217079644179807) [(1, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((363868440110018951659285 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((363868440110018951659285 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0090_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0090
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0091 : Poly :=
[
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0091 : Poly :=
[
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(0, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(1, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(2, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(3, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0091_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0091
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0092 : Poly :=
[
  term ((-879866002579722298770475 : Rat) / 3779172868318576719228) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0092 : Poly :=
[
  term ((-879866002579722298770475 : Rat) / 3779172868318576719228) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-879866002579722298770475 : Rat) / 3779172868318576719228) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((879866002579722298770475 : Rat) / 3779172868318576719228) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((879866002579722298770475 : Rat) / 3779172868318576719228) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0092_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0092
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0093 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 93 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0093 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(0, 2), (4, 1), (11, 2), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(1, 2), (4, 1), (11, 2), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0093_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0093
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0094 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 94 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0094 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(1, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0094_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0094
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0095 : Poly :=
[
  term ((72773688022003790331857 : Rat) / 314931072359881393269) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0095 : Poly :=
[
  term ((72773688022003790331857 : Rat) / 314931072359881393269) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((72773688022003790331857 : Rat) / 314931072359881393269) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72773688022003790331857 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72773688022003790331857 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0095_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0095
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0096 : Poly :=
[
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 96 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0096 : Poly :=
[
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(0, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(1, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(2, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 2), (4, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0096_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0096
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0097 : Poly :=
[
  term ((178332228858768929787671 : Rat) / 1259724289439525573076) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 97 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0097 : Poly :=
[
  term ((178332228858768929787671 : Rat) / 1259724289439525573076) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((178332228858768929787671 : Rat) / 1259724289439525573076) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-178332228858768929787671 : Rat) / 1259724289439525573076) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-178332228858768929787671 : Rat) / 1259724289439525573076) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0097_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0097
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0098 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0098 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0098_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0098
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0099 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 99 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0099 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0099_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0099
        rs_R007_ueqv_R007NY_generator_00_0000_0099 =
      rs_R007_ueqv_R007NY_partial_00_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_00_0000_0099 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_00_0000,
  rs_R007_ueqv_R007NY_partial_00_0001,
  rs_R007_ueqv_R007NY_partial_00_0002,
  rs_R007_ueqv_R007NY_partial_00_0003,
  rs_R007_ueqv_R007NY_partial_00_0004,
  rs_R007_ueqv_R007NY_partial_00_0005,
  rs_R007_ueqv_R007NY_partial_00_0006,
  rs_R007_ueqv_R007NY_partial_00_0007,
  rs_R007_ueqv_R007NY_partial_00_0008,
  rs_R007_ueqv_R007NY_partial_00_0009,
  rs_R007_ueqv_R007NY_partial_00_0010,
  rs_R007_ueqv_R007NY_partial_00_0011,
  rs_R007_ueqv_R007NY_partial_00_0012,
  rs_R007_ueqv_R007NY_partial_00_0013,
  rs_R007_ueqv_R007NY_partial_00_0014,
  rs_R007_ueqv_R007NY_partial_00_0015,
  rs_R007_ueqv_R007NY_partial_00_0016,
  rs_R007_ueqv_R007NY_partial_00_0017,
  rs_R007_ueqv_R007NY_partial_00_0018,
  rs_R007_ueqv_R007NY_partial_00_0019,
  rs_R007_ueqv_R007NY_partial_00_0020,
  rs_R007_ueqv_R007NY_partial_00_0021,
  rs_R007_ueqv_R007NY_partial_00_0022,
  rs_R007_ueqv_R007NY_partial_00_0023,
  rs_R007_ueqv_R007NY_partial_00_0024,
  rs_R007_ueqv_R007NY_partial_00_0025,
  rs_R007_ueqv_R007NY_partial_00_0026,
  rs_R007_ueqv_R007NY_partial_00_0027,
  rs_R007_ueqv_R007NY_partial_00_0028,
  rs_R007_ueqv_R007NY_partial_00_0029,
  rs_R007_ueqv_R007NY_partial_00_0030,
  rs_R007_ueqv_R007NY_partial_00_0031,
  rs_R007_ueqv_R007NY_partial_00_0032,
  rs_R007_ueqv_R007NY_partial_00_0033,
  rs_R007_ueqv_R007NY_partial_00_0034,
  rs_R007_ueqv_R007NY_partial_00_0035,
  rs_R007_ueqv_R007NY_partial_00_0036,
  rs_R007_ueqv_R007NY_partial_00_0037,
  rs_R007_ueqv_R007NY_partial_00_0038,
  rs_R007_ueqv_R007NY_partial_00_0039,
  rs_R007_ueqv_R007NY_partial_00_0040,
  rs_R007_ueqv_R007NY_partial_00_0041,
  rs_R007_ueqv_R007NY_partial_00_0042,
  rs_R007_ueqv_R007NY_partial_00_0043,
  rs_R007_ueqv_R007NY_partial_00_0044,
  rs_R007_ueqv_R007NY_partial_00_0045,
  rs_R007_ueqv_R007NY_partial_00_0046,
  rs_R007_ueqv_R007NY_partial_00_0047,
  rs_R007_ueqv_R007NY_partial_00_0048,
  rs_R007_ueqv_R007NY_partial_00_0049,
  rs_R007_ueqv_R007NY_partial_00_0050,
  rs_R007_ueqv_R007NY_partial_00_0051,
  rs_R007_ueqv_R007NY_partial_00_0052,
  rs_R007_ueqv_R007NY_partial_00_0053,
  rs_R007_ueqv_R007NY_partial_00_0054,
  rs_R007_ueqv_R007NY_partial_00_0055,
  rs_R007_ueqv_R007NY_partial_00_0056,
  rs_R007_ueqv_R007NY_partial_00_0057,
  rs_R007_ueqv_R007NY_partial_00_0058,
  rs_R007_ueqv_R007NY_partial_00_0059,
  rs_R007_ueqv_R007NY_partial_00_0060,
  rs_R007_ueqv_R007NY_partial_00_0061,
  rs_R007_ueqv_R007NY_partial_00_0062,
  rs_R007_ueqv_R007NY_partial_00_0063,
  rs_R007_ueqv_R007NY_partial_00_0064,
  rs_R007_ueqv_R007NY_partial_00_0065,
  rs_R007_ueqv_R007NY_partial_00_0066,
  rs_R007_ueqv_R007NY_partial_00_0067,
  rs_R007_ueqv_R007NY_partial_00_0068,
  rs_R007_ueqv_R007NY_partial_00_0069,
  rs_R007_ueqv_R007NY_partial_00_0070,
  rs_R007_ueqv_R007NY_partial_00_0071,
  rs_R007_ueqv_R007NY_partial_00_0072,
  rs_R007_ueqv_R007NY_partial_00_0073,
  rs_R007_ueqv_R007NY_partial_00_0074,
  rs_R007_ueqv_R007NY_partial_00_0075,
  rs_R007_ueqv_R007NY_partial_00_0076,
  rs_R007_ueqv_R007NY_partial_00_0077,
  rs_R007_ueqv_R007NY_partial_00_0078,
  rs_R007_ueqv_R007NY_partial_00_0079,
  rs_R007_ueqv_R007NY_partial_00_0080,
  rs_R007_ueqv_R007NY_partial_00_0081,
  rs_R007_ueqv_R007NY_partial_00_0082,
  rs_R007_ueqv_R007NY_partial_00_0083,
  rs_R007_ueqv_R007NY_partial_00_0084,
  rs_R007_ueqv_R007NY_partial_00_0085,
  rs_R007_ueqv_R007NY_partial_00_0086,
  rs_R007_ueqv_R007NY_partial_00_0087,
  rs_R007_ueqv_R007NY_partial_00_0088,
  rs_R007_ueqv_R007NY_partial_00_0089,
  rs_R007_ueqv_R007NY_partial_00_0090,
  rs_R007_ueqv_R007NY_partial_00_0091,
  rs_R007_ueqv_R007NY_partial_00_0092,
  rs_R007_ueqv_R007NY_partial_00_0093,
  rs_R007_ueqv_R007NY_partial_00_0094,
  rs_R007_ueqv_R007NY_partial_00_0095,
  rs_R007_ueqv_R007NY_partial_00_0096,
  rs_R007_ueqv_R007NY_partial_00_0097,
  rs_R007_ueqv_R007NY_partial_00_0098,
  rs_R007_ueqv_R007NY_partial_00_0099
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_00_0000_0099 : Poly :=
[
  term ((-1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 1), (3, 2), (11, 1), (16, 1)],
  term ((334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (1, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-16978362900116695209795 : Rat) / 104977024119960464423) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((10187017740070017125877 : Rat) / 104977024119960464423) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-356204642550734165834725 : Rat) / 2519448578879051146152) [(0, 1), (1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((210363520758601764639299 : Rat) / 2519448578879051146152) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20919341585386805769155 : Rat) / 359921225554150163736) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((413412131451344175687800 : Rat) / 944793217079644179807) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-302295881990988354706765 : Rat) / 2519448578879051146152) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((1670305698796967316635 : Rat) / 44990153194268770467) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((-334061139759393463327 : Rat) / 14996717731422923489) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (2, 2), (3, 1), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (2, 2), (4, 1), (15, 2), (16, 1)],
  term ((16978362900116695209795 : Rat) / 104977024119960464423) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-10187017740070017125877 : Rat) / 104977024119960464423) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((356204642550734165834725 : Rat) / 2519448578879051146152) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-210363520758601764639299 : Rat) / 2519448578879051146152) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (2, 2), (9, 1), (11, 1), (16, 1)],
  term ((433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20919341585386805769155 : Rat) / 359921225554150163736) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-413412131451344175687800 : Rat) / 944793217079644179807) [(0, 1), (2, 2), (11, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (2, 2), (14, 1), (15, 2), (16, 1)],
  term ((302295881990988354706765 : Rat) / 2519448578879051146152) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(0, 1), (3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(0, 1), (3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (3, 2), (4, 1), (15, 2), (16, 1)],
  term ((16978362900116695209795 : Rat) / 104977024119960464423) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-10187017740070017125877 : Rat) / 104977024119960464423) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 1), (3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((356204642550734165834725 : Rat) / 2519448578879051146152) [(0, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 1), (3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-210363520758601764639299 : Rat) / 2519448578879051146152) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2168193526711736267725 : Rat) / 111152143185840491742) [(0, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((433638705342347253545 : Rat) / 37050714395280163914) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((3122593501267461466685 : Rat) / 89980306388537540934) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20919341585386805769155 : Rat) / 359921225554150163736) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-413412131451344175687800 : Rat) / 944793217079644179807) [(0, 1), (3, 2), (11, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((-624518700253492293337 : Rat) / 29993435462845846978) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((302295881990988354706765 : Rat) / 2519448578879051146152) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 1), (3, 3), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 2), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((404421148737511728775040 : Rat) / 944793217079644179807) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-80884229747502345755008 : Rat) / 314931072359881393269) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 2), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 2), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 2), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 2), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(0, 2), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(0, 2), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-607158998196259308223225 : Rat) / 629862144719762786538) [(0, 2), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((121431799639251861644645 : Rat) / 209954048239920928846) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-144531092301421410024425 : Rat) / 944793217079644179807) [(0, 2), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((28906218460284282004885 : Rat) / 314931072359881393269) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((1248685638285530830228595 : Rat) / 3779172868318576719228) [(0, 2), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(0, 2), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-32382728193950933303005 : Rat) / 7558345736637153438456) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-175182158787069975531965 : Rat) / 15116691473274306876912) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-249737127657106166045719 : Rat) / 1259724289439525573076) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(0, 2), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((13195075182467656383673 : Rat) / 2519448578879051146152) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((24958637441897790521785 : Rat) / 5038897157758102292304) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((318138305339935404701660 : Rat) / 944793217079644179807) [(0, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-63627661067987080940332 : Rat) / 314931072359881393269) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-57208907937078434404895 : Rat) / 269940919165612622802) [(0, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((11441781587415686880979 : Rat) / 89980306388537540934) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-38439208418846201433815 : Rat) / 944793217079644179807) [(0, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((7687841683769240286763 : Rat) / 314931072359881393269) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36423303951024465752530 : Rat) / 314931072359881393269) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6635996202479029371385 : Rat) / 19281494226115187343) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7284660790204893150506 : Rat) / 104977024119960464423) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(0, 2), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1327199240495805874277 : Rat) / 6427164742038395781) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-90366213604783667799695 : Rat) / 1889586434159288359614) [(0, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((18073242720956733559939 : Rat) / 629862144719762786538) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-278551636685914910094715 : Rat) / 1889586434159288359614) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((55710327337182982018943 : Rat) / 629862144719762786538) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-33391580269675772575870 : Rat) / 134970459582806311401) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38115237374553525791425 : Rat) / 104977024119960464423) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((832330894844574404640325 : Rat) / 944793217079644179807) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((6678316053935154515174 : Rat) / 44990153194268770467) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((22869142424732115474855 : Rat) / 104977024119960464423) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-166466178968914880928065 : Rat) / 314931072359881393269) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((-83133200350547461287370 : Rat) / 944793217079644179807) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((16626640070109492257474 : Rat) / 314931072359881393269) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2153929834559236239680 : Rat) / 9354388287917269107) [(0, 2), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((950144489961989174794745 : Rat) / 3779172868318576719228) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((430785966911847247936 : Rat) / 3118129429305756369) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-190028897992397834958949 : Rat) / 1259724289439525573076) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-14602115651210600881435 : Rat) / 111152143185840491742) [(0, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((2920423130242120176287 : Rat) / 37050714395280163914) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-363868440110018951659285 : Rat) / 944793217079644179807) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(0, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-879866002579722298770475 : Rat) / 3779172868318576719228) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(0, 2), (4, 1), (11, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((72773688022003790331857 : Rat) / 314931072359881393269) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(0, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((178332228858768929787671 : Rat) / 1259724289439525573076) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((1670305698796967316635 : Rat) / 44990153194268770467) [(0, 3), (1, 1), (11, 1), (16, 1)],
  term ((-334061139759393463327 : Rat) / 14996717731422923489) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(0, 3), (3, 1), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(0, 3), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(0, 3), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 3), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 3), (4, 1), (15, 2), (16, 1)],
  term ((-16978362900116695209795 : Rat) / 104977024119960464423) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((10187017740070017125877 : Rat) / 104977024119960464423) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(0, 3), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-356204642550734165834725 : Rat) / 2519448578879051146152) [(0, 3), (7, 1), (11, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(0, 3), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((210363520758601764639299 : Rat) / 2519448578879051146152) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((2168193526711736267725 : Rat) / 111152143185840491742) [(0, 3), (9, 1), (11, 1), (16, 1)],
  term ((-433638705342347253545 : Rat) / 37050714395280163914) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-3122593501267461466685 : Rat) / 89980306388537540934) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20919341585386805769155 : Rat) / 359921225554150163736) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((413412131451344175687800 : Rat) / 944793217079644179807) [(0, 3), (11, 2), (16, 1)],
  term ((2 : Rat) / 3) [(0, 3), (12, 1), (16, 1)],
  term ((624518700253492293337 : Rat) / 29993435462845846978) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 3), (14, 1), (15, 2), (16, 1)],
  term ((-302295881990988354706765 : Rat) / 2519448578879051146152) [(0, 3), (15, 2), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-404421148737511728775040 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((80884229747502345755008 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (2, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((607158998196259308223225 : Rat) / 629862144719762786538) [(1, 1), (2, 2), (8, 1), (11, 1), (16, 1)],
  term ((-121431799639251861644645 : Rat) / 209954048239920928846) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((-28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1248685638285530830228595 : Rat) / 3779172868318576719228) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (2, 2), (11, 1), (13, 2), (16, 1)],
  term ((32382728193950933303005 : Rat) / 7558345736637153438456) [(1, 1), (2, 2), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((175182158787069975531965 : Rat) / 15116691473274306876912) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((249737127657106166045719 : Rat) / 1259724289439525573076) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((-13195075182467656383673 : Rat) / 2519448578879051146152) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-24958637441897790521785 : Rat) / 5038897157758102292304) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (2, 2), (15, 3), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 1), (2, 3), (11, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-404421148737511728775040 : Rat) / 944793217079644179807) [(1, 1), (3, 2), (4, 1), (11, 1), (16, 1)],
  term ((80884229747502345755008 : Rat) / 314931072359881393269) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (3, 2), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (3, 2), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (3, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((607158998196259308223225 : Rat) / 629862144719762786538) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)],
  term ((-121431799639251861644645 : Rat) / 209954048239920928846) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((144531092301421410024425 : Rat) / 944793217079644179807) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((-28906218460284282004885 : Rat) / 314931072359881393269) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1248685638285530830228595 : Rat) / 3779172868318576719228) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (3, 2), (11, 1), (13, 2), (16, 1)],
  term ((32382728193950933303005 : Rat) / 7558345736637153438456) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((175182158787069975531965 : Rat) / 15116691473274306876912) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((249737127657106166045719 : Rat) / 1259724289439525573076) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((-13195075182467656383673 : Rat) / 2519448578879051146152) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-24958637441897790521785 : Rat) / 5038897157758102292304) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 2), (15, 3), (16, 1)],
  term ((318138305339935404701660 : Rat) / 944793217079644179807) [(1, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-63627661067987080940332 : Rat) / 314931072359881393269) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-57208907937078434404895 : Rat) / 269940919165612622802) [(1, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((11441781587415686880979 : Rat) / 89980306388537540934) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-38439208418846201433815 : Rat) / 944793217079644179807) [(1, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((7687841683769240286763 : Rat) / 314931072359881393269) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36423303951024465752530 : Rat) / 314931072359881393269) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6635996202479029371385 : Rat) / 19281494226115187343) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7284660790204893150506 : Rat) / 104977024119960464423) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 2), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1327199240495805874277 : Rat) / 6427164742038395781) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-90366213604783667799695 : Rat) / 1889586434159288359614) [(1, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((18073242720956733559939 : Rat) / 629862144719762786538) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-278551636685914910094715 : Rat) / 1889586434159288359614) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((55710327337182982018943 : Rat) / 629862144719762786538) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-33391580269675772575870 : Rat) / 134970459582806311401) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38115237374553525791425 : Rat) / 104977024119960464423) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((832330894844574404640325 : Rat) / 944793217079644179807) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((6678316053935154515174 : Rat) / 44990153194268770467) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((22869142424732115474855 : Rat) / 104977024119960464423) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-166466178968914880928065 : Rat) / 314931072359881393269) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((-83133200350547461287370 : Rat) / 944793217079644179807) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((16626640070109492257474 : Rat) / 314931072359881393269) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2153929834559236239680 : Rat) / 9354388287917269107) [(1, 2), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((950144489961989174794745 : Rat) / 3779172868318576719228) [(1, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((430785966911847247936 : Rat) / 3118129429305756369) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-190028897992397834958949 : Rat) / 1259724289439525573076) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-14602115651210600881435 : Rat) / 111152143185840491742) [(1, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((2920423130242120176287 : Rat) / 37050714395280163914) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-363868440110018951659285 : Rat) / 944793217079644179807) [(1, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(1, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-879866002579722298770475 : Rat) / 3779172868318576719228) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(1, 2), (4, 1), (11, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(1, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((72773688022003790331857 : Rat) / 314931072359881393269) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(1, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((178332228858768929787671 : Rat) / 1259724289439525573076) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(1, 3), (2, 1), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((404421148737511728775040 : Rat) / 944793217079644179807) [(1, 3), (4, 1), (11, 1), (16, 1)],
  term ((-80884229747502345755008 : Rat) / 314931072359881393269) [(1, 3), (4, 1), (15, 1), (16, 1)],
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 3), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 3), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 3), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 3), (5, 1), (15, 2), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 3), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 3), (7, 1), (15, 2), (16, 1)],
  term ((-607158998196259308223225 : Rat) / 629862144719762786538) [(1, 3), (8, 1), (11, 1), (16, 1)],
  term ((121431799639251861644645 : Rat) / 209954048239920928846) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((-144531092301421410024425 : Rat) / 944793217079644179807) [(1, 3), (10, 1), (11, 1), (16, 1)],
  term ((28906218460284282004885 : Rat) / 314931072359881393269) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((1248685638285530830228595 : Rat) / 3779172868318576719228) [(1, 3), (11, 1), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(1, 3), (11, 1), (13, 2), (16, 1)],
  term ((-32382728193950933303005 : Rat) / 7558345736637153438456) [(1, 3), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 3), (11, 1), (15, 2), (16, 1)],
  term ((-175182158787069975531965 : Rat) / 15116691473274306876912) [(1, 3), (11, 1), (16, 1)],
  term ((-249737127657106166045719 : Rat) / 1259724289439525573076) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 3), (13, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(1, 3), (13, 2), (15, 1), (16, 1)],
  term ((13195075182467656383673 : Rat) / 2519448578879051146152) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((24958637441897790521785 : Rat) / 5038897157758102292304) [(1, 3), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 3), (15, 3), (16, 1)],
  term ((57208907937078434404895 : Rat) / 269940919165612622802) [(2, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-11441781587415686880979 : Rat) / 89980306388537540934) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((38439208418846201433815 : Rat) / 944793217079644179807) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-7687841683769240286763 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 269940919165612622802) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 89980306388537540934) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36423303951024465752530 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(2, 1), (3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6635996202479029371385 : Rat) / 19281494226115187343) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7284660790204893150506 : Rat) / 104977024119960464423) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((1327199240495805874277 : Rat) / 6427164742038395781) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-318138305339935404701660 : Rat) / 944793217079644179807) [(2, 1), (3, 3), (11, 1), (16, 1)],
  term ((63627661067987080940332 : Rat) / 314931072359881393269) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((90366213604783667799695 : Rat) / 1889586434159288359614) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-18073242720956733559939 : Rat) / 629862144719762786538) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((278551636685914910094715 : Rat) / 1889586434159288359614) [(2, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-55710327337182982018943 : Rat) / 629862144719762786538) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((33391580269675772575870 : Rat) / 134970459582806311401) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38115237374553525791425 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-832330894844574404640325 : Rat) / 944793217079644179807) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-6678316053935154515174 : Rat) / 44990153194268770467) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-22869142424732115474855 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((166466178968914880928065 : Rat) / 314931072359881393269) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((83133200350547461287370 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-16626640070109492257474 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((2153929834559236239680 : Rat) / 9354388287917269107) [(2, 2), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-950144489961989174794745 : Rat) / 3779172868318576719228) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-430785966911847247936 : Rat) / 3118129429305756369) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((190028897992397834958949 : Rat) / 1259724289439525573076) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((14602115651210600881435 : Rat) / 111152143185840491742) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2920423130242120176287 : Rat) / 37050714395280163914) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363868440110018951659285 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(2, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((879866002579722298770475 : Rat) / 3779172868318576719228) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(2, 2), (4, 1), (11, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-72773688022003790331857 : Rat) / 314931072359881393269) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(2, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-178332228858768929787671 : Rat) / 1259724289439525573076) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-318138305339935404701660 : Rat) / 944793217079644179807) [(2, 3), (3, 1), (11, 1), (16, 1)],
  term ((63627661067987080940332 : Rat) / 314931072359881393269) [(2, 3), (3, 1), (15, 1), (16, 1)],
  term ((57208907937078434404895 : Rat) / 269940919165612622802) [(2, 3), (5, 1), (11, 1), (16, 1)],
  term ((-11441781587415686880979 : Rat) / 89980306388537540934) [(2, 3), (5, 1), (15, 1), (16, 1)],
  term ((38439208418846201433815 : Rat) / 944793217079644179807) [(2, 3), (7, 1), (11, 1), (16, 1)],
  term ((-7687841683769240286763 : Rat) / 314931072359881393269) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 269940919165612622802) [(2, 3), (9, 1), (11, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 89980306388537540934) [(2, 3), (9, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36423303951024465752530 : Rat) / 314931072359881393269) [(2, 3), (11, 1), (13, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(2, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6635996202479029371385 : Rat) / 19281494226115187343) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7284660790204893150506 : Rat) / 104977024119960464423) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(2, 3), (14, 1), (15, 2), (16, 1)],
  term ((1327199240495805874277 : Rat) / 6427164742038395781) [(2, 3), (15, 2), (16, 1)],
  term ((83133200350547461287370 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-16626640070109492257474 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((2153929834559236239680 : Rat) / 9354388287917269107) [(3, 2), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-950144489961989174794745 : Rat) / 3779172868318576719228) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-430785966911847247936 : Rat) / 3118129429305756369) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((190028897992397834958949 : Rat) / 1259724289439525573076) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((14602115651210600881435 : Rat) / 111152143185840491742) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2920423130242120176287 : Rat) / 37050714395280163914) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363868440110018951659285 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(3, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((879866002579722298770475 : Rat) / 3779172868318576719228) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(3, 2), (4, 1), (11, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-72773688022003790331857 : Rat) / 314931072359881393269) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-178332228858768929787671 : Rat) / 1259724289439525573076) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((90366213604783667799695 : Rat) / 1889586434159288359614) [(3, 3), (4, 1), (11, 1), (16, 1)],
  term ((-18073242720956733559939 : Rat) / 629862144719762786538) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((278551636685914910094715 : Rat) / 1889586434159288359614) [(3, 3), (8, 1), (11, 1), (16, 1)],
  term ((-55710327337182982018943 : Rat) / 629862144719762786538) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((33391580269675772575870 : Rat) / 134970459582806311401) [(3, 3), (11, 1), (12, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(3, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38115237374553525791425 : Rat) / 104977024119960464423) [(3, 3), (11, 1), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(3, 3), (11, 1), (15, 2), (16, 1)],
  term ((-832330894844574404640325 : Rat) / 944793217079644179807) [(3, 3), (11, 1), (16, 1)],
  term ((-6678316053935154515174 : Rat) / 44990153194268770467) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((-22869142424732115474855 : Rat) / 104977024119960464423) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((166466178968914880928065 : Rat) / 314931072359881393269) [(3, 3), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 0 through 99. -/
theorem rs_R007_ueqv_R007NY_block_00_0000_0099_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_00_0000_0099
      rs_R007_ueqv_R007NY_block_00_0000_0099 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
