/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 4:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_04_0000_0099 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0000 : Poly :=
[
  term ((-26382038750701018527220 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0000 : Poly :=
[
  term ((52764077501402037054440 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-26382038750701018527220 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-26382038750701018527220 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-52764077501402037054440 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((26382038750701018527220 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((26382038750701018527220 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0000
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0001 : Poly :=
[
  term ((15829223250420611116332 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0001 : Poly :=
[
  term ((-31658446500841222232664 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((15829223250420611116332 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((15829223250420611116332 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((31658446500841222232664 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15829223250420611116332 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-15829223250420611116332 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0001
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0002 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 2 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0002 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0002
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0003 : Poly :=
[
  term ((-7291176097715546343575 : Rat) / 37050714395280163914) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0003 : Poly :=
[
  term ((7291176097715546343575 : Rat) / 18525357197640081957) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 37050714395280163914) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 37050714395280163914) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 18525357197640081957) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((7291176097715546343575 : Rat) / 37050714395280163914) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((7291176097715546343575 : Rat) / 37050714395280163914) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0003
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0004 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0004 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0004
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0005 : Poly :=
[
  term ((1458235219543109268715 : Rat) / 12350238131760054638) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0005 : Poly :=
[
  term ((-1458235219543109268715 : Rat) / 6175119065880027319) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 12350238131760054638) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 12350238131760054638) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 6175119065880027319) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 12350238131760054638) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 12350238131760054638) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0005
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0006 : Poly :=
[
  term ((-223421164547493583079075 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0006 : Poly :=
[
  term ((223421164547493583079075 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-223421164547493583079075 : Rat) / 1889586434159288359614) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-223421164547493583079075 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((223421164547493583079075 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((223421164547493583079075 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-223421164547493583079075 : Rat) / 1889586434159288359614) [(0, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0006
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0007 : Poly :=
[
  term ((44684232909498716615815 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0007 : Poly :=
[
  term ((-44684232909498716615815 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((44684232909498716615815 : Rat) / 629862144719762786538) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((44684232909498716615815 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-44684232909498716615815 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-44684232909498716615815 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((44684232909498716615815 : Rat) / 629862144719762786538) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0007
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0008 : Poly :=
[
  term ((194970052309384542390775 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0008 : Poly :=
[
  term ((-389940104618769084781550 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((194970052309384542390775 : Rat) / 944793217079644179807) [(0, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((194970052309384542390775 : Rat) / 944793217079644179807) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((389940104618769084781550 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-194970052309384542390775 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-194970052309384542390775 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0008
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0009 : Poly :=
[
  term ((-38994010461876908478155 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0009 : Poly :=
[
  term ((77988020923753816956310 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-38994010461876908478155 : Rat) / 314931072359881393269) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-38994010461876908478155 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-77988020923753816956310 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((38994010461876908478155 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((38994010461876908478155 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0009
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0010 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0010 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0010
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0011 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0011 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0011
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0012 : Poly :=
[
  term ((-86841965568300061610515 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0012 : Poly :=
[
  term ((86841965568300061610515 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 1259724289439525573076) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 1259724289439525573076) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 629862144719762786538) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((86841965568300061610515 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((86841965568300061610515 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0012
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0013 : Poly :=
[
  term ((64661847731539787644477 : Rat) / 222304286371680983484) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0013 : Poly :=
[
  term ((-64661847731539787644477 : Rat) / 111152143185840491742) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((64661847731539787644477 : Rat) / 222304286371680983484) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((64661847731539787644477 : Rat) / 222304286371680983484) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((64661847731539787644477 : Rat) / 111152143185840491742) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64661847731539787644477 : Rat) / 222304286371680983484) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-64661847731539787644477 : Rat) / 222304286371680983484) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0013
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0014 : Poly :=
[
  term ((471635348702704374015335 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 14 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0014 : Poly :=
[
  term ((-471635348702704374015335 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((471635348702704374015335 : Rat) / 3779172868318576719228) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((471635348702704374015335 : Rat) / 3779172868318576719228) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((471635348702704374015335 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-471635348702704374015335 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-471635348702704374015335 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0014
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0015 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0015 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0015
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0016 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 16 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0016 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0016
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0017 : Poly :=
[
  term ((-1 : Rat) / 6) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 17 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0017 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (12, 2), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0017
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0018 : Poly :=
[
  term ((17368393113660012322103 : Rat) / 419908096479841857692) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0018 : Poly :=
[
  term ((-17368393113660012322103 : Rat) / 209954048239920928846) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((17368393113660012322103 : Rat) / 419908096479841857692) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((17368393113660012322103 : Rat) / 419908096479841857692) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((17368393113660012322103 : Rat) / 209954048239920928846) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17368393113660012322103 : Rat) / 419908096479841857692) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17368393113660012322103 : Rat) / 419908096479841857692) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0018
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0019 : Poly :=
[
  term ((-19746180295111414490933 : Rat) / 89980306388537540934) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 19 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0019 : Poly :=
[
  term ((19746180295111414490933 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 89980306388537540934) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 89980306388537540934) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((19746180295111414490933 : Rat) / 89980306388537540934) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((19746180295111414490933 : Rat) / 89980306388537540934) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0019
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0020 : Poly :=
[
  term ((26382038750701018527220 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0020 : Poly :=
[
  term ((-52764077501402037054440 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((26382038750701018527220 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 2), (11, 1), (16, 1)],
  term ((26382038750701018527220 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (7, 2), (11, 1), (16, 1)],
  term ((52764077501402037054440 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((-26382038750701018527220 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (11, 1), (12, 2), (16, 1)],
  term ((-26382038750701018527220 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0020
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0021 : Poly :=
[
  term ((-15829223250420611116332 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0021 : Poly :=
[
  term ((31658446500841222232664 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-15829223250420611116332 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-15829223250420611116332 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-31658446500841222232664 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((15829223250420611116332 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((15829223250420611116332 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0021
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0022 : Poly :=
[
  term ((7291176097715546343575 : Rat) / 37050714395280163914) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0022 : Poly :=
[
  term ((-7291176097715546343575 : Rat) / 18525357197640081957) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((7291176097715546343575 : Rat) / 37050714395280163914) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((7291176097715546343575 : Rat) / 37050714395280163914) [(1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((7291176097715546343575 : Rat) / 18525357197640081957) [(1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 37050714395280163914) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 37050714395280163914) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0022
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0023 : Poly :=
[
  term ((-1458235219543109268715 : Rat) / 12350238131760054638) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0023 : Poly :=
[
  term ((1458235219543109268715 : Rat) / 6175119065880027319) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 12350238131760054638) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 12350238131760054638) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 6175119065880027319) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 12350238131760054638) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 12350238131760054638) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0023
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0024 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0024 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0024
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0025 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0025 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0025
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0026 : Poly :=
[
  term ((-194970052309384542390775 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0026 : Poly :=
[
  term ((389940104618769084781550 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-194970052309384542390775 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-194970052309384542390775 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-389940104618769084781550 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((194970052309384542390775 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((194970052309384542390775 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0026
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0027 : Poly :=
[
  term ((38994010461876908478155 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0027 : Poly :=
[
  term ((-77988020923753816956310 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((38994010461876908478155 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((38994010461876908478155 : Rat) / 314931072359881393269) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((77988020923753816956310 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-38994010461876908478155 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-38994010461876908478155 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0027
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0028 : Poly :=
[
  term ((42862904184507353364715 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0028 : Poly :=
[
  term ((-42862904184507353364715 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((42862904184507353364715 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((42862904184507353364715 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((42862904184507353364715 : Rat) / 629862144719762786538) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-42862904184507353364715 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-42862904184507353364715 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0028
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0029 : Poly :=
[
  term ((-8572580836901470672943 : Rat) / 419908096479841857692) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0029 : Poly :=
[
  term ((8572580836901470672943 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8572580836901470672943 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-8572580836901470672943 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-8572580836901470672943 : Rat) / 209954048239920928846) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8572580836901470672943 : Rat) / 419908096479841857692) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((8572580836901470672943 : Rat) / 419908096479841857692) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0029
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0030 : Poly :=
[
  term ((86841965568300061610515 : Rat) / 1259724289439525573076) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 30 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0030 : Poly :=
[
  term ((-86841965568300061610515 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((86841965568300061610515 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((86841965568300061610515 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 1259724289439525573076) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((86841965568300061610515 : Rat) / 629862144719762786538) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 1259724289439525573076) [(1, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0030
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0031 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0031 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0031
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0032 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 32 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0032 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0032
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0033 : Poly :=
[
  term ((-98730901475557072454665 : Rat) / 269940919165612622802) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 33 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0033 : Poly :=
[
  term ((98730901475557072454665 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-98730901475557072454665 : Rat) / 269940919165612622802) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-98730901475557072454665 : Rat) / 269940919165612622802) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-98730901475557072454665 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((98730901475557072454665 : Rat) / 269940919165612622802) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((98730901475557072454665 : Rat) / 269940919165612622802) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0033
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0034 : Poly :=
[
  term ((-76690866080619633975665 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0034 : Poly :=
[
  term ((76690866080619633975665 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-76690866080619633975665 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-76690866080619633975665 : Rat) / 3779172868318576719228) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-76690866080619633975665 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((76690866080619633975665 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((76690866080619633975665 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0034
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0035 : Poly :=
[
  term ((-17368393113660012322103 : Rat) / 419908096479841857692) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0035 : Poly :=
[
  term ((17368393113660012322103 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17368393113660012322103 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-17368393113660012322103 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((17368393113660012322103 : Rat) / 419908096479841857692) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17368393113660012322103 : Rat) / 209954048239920928846) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((17368393113660012322103 : Rat) / 419908096479841857692) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0035
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0036 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0036 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0036
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0037 : Poly :=
[
  term ((-1 : Rat) / 6) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0037 : Poly :=
[
  term ((1 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0037
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0038 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0038 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0038
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0039 : Poly :=
[
  term ((19746180295111414490933 : Rat) / 89980306388537540934) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0039 : Poly :=
[
  term ((-19746180295111414490933 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((19746180295111414490933 : Rat) / 89980306388537540934) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((19746180295111414490933 : Rat) / 89980306388537540934) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((19746180295111414490933 : Rat) / 44990153194268770467) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 89980306388537540934) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 89980306388537540934) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0039
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0040 : Poly :=
[
  term ((15338173216123926795133 : Rat) / 1259724289439525573076) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0040 : Poly :=
[
  term ((-15338173216123926795133 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((15338173216123926795133 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((15338173216123926795133 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((15338173216123926795133 : Rat) / 629862144719762786538) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15338173216123926795133 : Rat) / 1259724289439525573076) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-15338173216123926795133 : Rat) / 1259724289439525573076) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0040
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0041 : Poly :=
[
  term ((-557172743343760440679765 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 41 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0041 : Poly :=
[
  term ((557172743343760440679765 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((557172743343760440679765 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((557172743343760440679765 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0041
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0042 : Poly :=
[
  term ((111434548668752088135953 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0042 : Poly :=
[
  term ((-111434548668752088135953 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0042
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0043 : Poly :=
[
  term ((-484696415587523070790 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 43 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0043 : Poly :=
[
  term ((969392831175046141580 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-484696415587523070790 : Rat) / 104977024119960464423) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-969392831175046141580 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((484696415587523070790 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((484696415587523070790 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-484696415587523070790 : Rat) / 104977024119960464423) [(2, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0043
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0044 : Poly :=
[
  term ((290817849352513842474 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0044 : Poly :=
[
  term ((-581635698705027684948 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((290817849352513842474 : Rat) / 104977024119960464423) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((581635698705027684948 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-290817849352513842474 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-290817849352513842474 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((290817849352513842474 : Rat) / 104977024119960464423) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0044
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0045 : Poly :=
[
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 45 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0045 : Poly :=
[
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0045
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0046 : Poly :=
[
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0046 : Poly :=
[
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0046
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0047 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0047 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0047
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0048 : Poly :=
[
  term ((109499368732246143812065 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0048 : Poly :=
[
  term ((-109499368732246143812065 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((109499368732246143812065 : Rat) / 629862144719762786538) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((109499368732246143812065 : Rat) / 629862144719762786538) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((109499368732246143812065 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-109499368732246143812065 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-109499368732246143812065 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0048
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0049 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0049 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0049
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0050 : Poly :=
[
  term ((538660015976265837603853 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0050 : Poly :=
[
  term ((-538660015976265837603853 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((538660015976265837603853 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((538660015976265837603853 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((538660015976265837603853 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-538660015976265837603853 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-538660015976265837603853 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0050
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0051 : Poly :=
[
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 51 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0051 : Poly :=
[
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (12, 2), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0051
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0052 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 52 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0052 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0052
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0053 : Poly :=
[
  term ((-21899873746449228762413 : Rat) / 209954048239920928846) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0053 : Poly :=
[
  term ((21899873746449228762413 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21899873746449228762413 : Rat) / 209954048239920928846) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21899873746449228762413 : Rat) / 209954048239920928846) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21899873746449228762413 : Rat) / 104977024119960464423) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((21899873746449228762413 : Rat) / 209954048239920928846) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((21899873746449228762413 : Rat) / 209954048239920928846) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0053
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0054 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 54 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0054 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0054
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0055 : Poly :=
[
  term ((-2 : Rat) / 3) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0055 : Poly :=
[
  term ((4 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0055
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0056 : Poly :=
[
  term ((-8189880160633200311035 : Rat) / 44990153194268770467) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 56 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0056 : Poly :=
[
  term ((16379760321266400622070 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-8189880160633200311035 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-8189880160633200311035 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-16379760321266400622070 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((8189880160633200311035 : Rat) / 44990153194268770467) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((8189880160633200311035 : Rat) / 44990153194268770467) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0056
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0057 : Poly :=
[
  term ((557172743343760440679765 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 57 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0057 : Poly :=
[
  term ((-557172743343760440679765 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((557172743343760440679765 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((557172743343760440679765 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((557172743343760440679765 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0057
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0058 : Poly :=
[
  term ((-111434548668752088135953 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0058 : Poly :=
[
  term ((111434548668752088135953 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0058
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0059 : Poly :=
[
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 59 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0059 : Poly :=
[
  term ((-95711104877563916601925 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(3, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0059
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0060 : Poly :=
[
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0060 : Poly :=
[
  term ((19142220975512783320385 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0060
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0061 : Poly :=
[
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 61 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0061 : Poly :=
[
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0061
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0062 : Poly :=
[
  term ((11543865089352728056199 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0062 : Poly :=
[
  term ((-11543865089352728056199 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((11543865089352728056199 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((11543865089352728056199 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((11543865089352728056199 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11543865089352728056199 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11543865089352728056199 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0062
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0063 : Poly :=
[
  term ((-378199342050388532693795 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 63 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0063 : Poly :=
[
  term ((378199342050388532693795 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-378199342050388532693795 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-378199342050388532693795 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((378199342050388532693795 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-378199342050388532693795 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((378199342050388532693795 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0063
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0064 : Poly :=
[
  term ((-186940723287112939769830 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 64 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0064 : Poly :=
[
  term ((373881446574225879539660 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-186940723287112939769830 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-186940723287112939769830 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-373881446574225879539660 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((186940723287112939769830 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((186940723287112939769830 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0064
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0065 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 65 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0065 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0065
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0066 : Poly :=
[
  term ((-50833627144399062570685 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 66 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0066 : Poly :=
[
  term ((50833627144399062570685 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-50833627144399062570685 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-50833627144399062570685 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-50833627144399062570685 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((50833627144399062570685 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((50833627144399062570685 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0066
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0067 : Poly :=
[
  term ((75639868410077706538759 : Rat) / 629862144719762786538) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0067 : Poly :=
[
  term ((-75639868410077706538759 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((75639868410077706538759 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((75639868410077706538759 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-75639868410077706538759 : Rat) / 629862144719762786538) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((75639868410077706538759 : Rat) / 314931072359881393269) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-75639868410077706538759 : Rat) / 629862144719762786538) [(3, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0067_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0067
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0068 : Poly :=
[
  term ((37388144657422587953966 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0068 : Poly :=
[
  term ((-74776289314845175907932 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((37388144657422587953966 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((37388144657422587953966 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((74776289314845175907932 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37388144657422587953966 : Rat) / 314931072359881393269) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-37388144657422587953966 : Rat) / 314931072359881393269) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0068_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0068
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0069 : Poly :=
[
  term ((3248939110799990218815 : Rat) / 209954048239920928846) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0069 : Poly :=
[
  term ((-3248939110799990218815 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3248939110799990218815 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((3248939110799990218815 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((3248939110799990218815 : Rat) / 104977024119960464423) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3248939110799990218815 : Rat) / 209954048239920928846) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3248939110799990218815 : Rat) / 209954048239920928846) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0069_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0069
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0070 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 70 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0070 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0070_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0070
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0071 : Poly :=
[
  term ((23212151932589367340585 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 71 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0071 : Poly :=
[
  term ((-23212151932589367340585 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((23212151932589367340585 : Rat) / 1889586434159288359614) [(4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((23212151932589367340585 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-23212151932589367340585 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-23212151932589367340585 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((23212151932589367340585 : Rat) / 1889586434159288359614) [(4, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0071_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0071
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0072 : Poly :=
[
  term ((-4642430386517873468117 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0072 : Poly :=
[
  term ((4642430386517873468117 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4642430386517873468117 : Rat) / 629862144719762786538) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4642430386517873468117 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((4642430386517873468117 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((4642430386517873468117 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4642430386517873468117 : Rat) / 629862144719762786538) [(4, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0072_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0072
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0073 : Poly :=
[
  term ((-516150036672716418272165 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0073 : Poly :=
[
  term ((516150036672716418272165 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 1889586434159288359614) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 1889586434159288359614) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((516150036672716418272165 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((516150036672716418272165 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0073_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0073
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0074 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0074 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0074_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0074
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0075 : Poly :=
[
  term ((-237700989317100376915055 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0075 : Poly :=
[
  term ((475401978634200753830110 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-237700989317100376915055 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-237700989317100376915055 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-475401978634200753830110 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((237700989317100376915055 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((237700989317100376915055 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0075_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0075
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0076 : Poly :=
[
  term ((103230007334543283654433 : Rat) / 629862144719762786538) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0076 : Poly :=
[
  term ((-103230007334543283654433 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 629862144719762786538) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 629862144719762786538) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 629862144719762786538) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 629862144719762786538) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0076_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0076
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0077 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 77 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0077 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0077_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0077
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0078 : Poly :=
[
  term ((47540197863420075383011 : Rat) / 314931072359881393269) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 78 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0078 : Poly :=
[
  term ((-95080395726840150766022 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((47540197863420075383011 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((47540197863420075383011 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((95080395726840150766022 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-47540197863420075383011 : Rat) / 314931072359881393269) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-47540197863420075383011 : Rat) / 314931072359881393269) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0078_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0078
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0079 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 79 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0079 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0079_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0079
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0080 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0080 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0080_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0080
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0081 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 81 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0081 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0081_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0081
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0082 : Poly :=
[
  term ((516150036672716418272165 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 82 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0082 : Poly :=
[
  term ((-516150036672716418272165 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((516150036672716418272165 : Rat) / 1889586434159288359614) [(5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((516150036672716418272165 : Rat) / 1889586434159288359614) [(5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((516150036672716418272165 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0082_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0082
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0083 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0083 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0083_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0083
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0084 : Poly :=
[
  term ((1153973885699331956225 : Rat) / 3118129429305756369) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 84 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0084 : Poly :=
[
  term ((-2307947771398663912450 : Rat) / 3118129429305756369) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((1153973885699331956225 : Rat) / 3118129429305756369) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((1153973885699331956225 : Rat) / 3118129429305756369) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((2307947771398663912450 : Rat) / 3118129429305756369) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1153973885699331956225 : Rat) / 3118129429305756369) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1153973885699331956225 : Rat) / 3118129429305756369) [(5, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0084_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0084
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0085 : Poly :=
[
  term ((-34010450733643947758025 : Rat) / 419908096479841857692) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 85 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0085 : Poly :=
[
  term ((34010450733643947758025 : Rat) / 209954048239920928846) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-34010450733643947758025 : Rat) / 419908096479841857692) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-34010450733643947758025 : Rat) / 419908096479841857692) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-34010450733643947758025 : Rat) / 209954048239920928846) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((34010450733643947758025 : Rat) / 419908096479841857692) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((34010450733643947758025 : Rat) / 419908096479841857692) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0085_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0085
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0086 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0086 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0086_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0086
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0087 : Poly :=
[
  term ((-103230007334543283654433 : Rat) / 629862144719762786538) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0087 : Poly :=
[
  term ((103230007334543283654433 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 629862144719762786538) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 629862144719762786538) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 629862144719762786538) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 314931072359881393269) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 629862144719762786538) [(5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0087_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0087
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0088 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 88 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0088 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0088_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0088
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0089 : Poly :=
[
  term ((-230794777139866391245 : Rat) / 1039376476435252123) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0089 : Poly :=
[
  term ((461589554279732782490 : Rat) / 1039376476435252123) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-230794777139866391245 : Rat) / 1039376476435252123) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-230794777139866391245 : Rat) / 1039376476435252123) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-461589554279732782490 : Rat) / 1039376476435252123) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((230794777139866391245 : Rat) / 1039376476435252123) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((230794777139866391245 : Rat) / 1039376476435252123) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0089_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0089
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0090 : Poly :=
[
  term ((20406270440186368654815 : Rat) / 419908096479841857692) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0090 : Poly :=
[
  term ((-20406270440186368654815 : Rat) / 209954048239920928846) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((20406270440186368654815 : Rat) / 419908096479841857692) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((20406270440186368654815 : Rat) / 419908096479841857692) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((20406270440186368654815 : Rat) / 209954048239920928846) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20406270440186368654815 : Rat) / 419908096479841857692) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-20406270440186368654815 : Rat) / 419908096479841857692) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0090_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0090
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0091 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 91 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0091 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0091_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0091
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0092 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0092 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0092_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0092
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0093 : Poly :=
[
  term ((67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 93 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0093 : Poly :=
[
  term ((-134796090577430608371950 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((67398045288715304185975 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((134796090577430608371950 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((67398045288715304185975 : Rat) / 314931072359881393269) [(7, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0093_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0093
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0094 : Poly :=
[
  term ((-13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0094 : Poly :=
[
  term ((26959218115486121674390 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13479609057743060837195 : Rat) / 104977024119960464423) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-26959218115486121674390 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13479609057743060837195 : Rat) / 104977024119960464423) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0094_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0094
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0095 : Poly :=
[
  term ((-360930172329542197607705 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 95 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0095 : Poly :=
[
  term ((360930172329542197607705 : Rat) / 1889586434159288359614) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-360930172329542197607705 : Rat) / 3779172868318576719228) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-360930172329542197607705 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((360930172329542197607705 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((360930172329542197607705 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-360930172329542197607705 : Rat) / 3779172868318576719228) [(7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0095_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0095
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0096 : Poly :=
[
  term ((-1763486761416599446975 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 96 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0096 : Poly :=
[
  term ((1763486761416599446975 : Rat) / 111152143185840491742) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1763486761416599446975 : Rat) / 222304286371680983484) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1763486761416599446975 : Rat) / 111152143185840491742) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((1763486761416599446975 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((1763486761416599446975 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1763486761416599446975 : Rat) / 222304286371680983484) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0096_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0096
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0097 : Poly :=
[
  term ((72186034465908439521541 : Rat) / 1259724289439525573076) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0097 : Poly :=
[
  term ((-72186034465908439521541 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((72186034465908439521541 : Rat) / 1259724289439525573076) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((72186034465908439521541 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72186034465908439521541 : Rat) / 1259724289439525573076) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-72186034465908439521541 : Rat) / 1259724289439525573076) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((72186034465908439521541 : Rat) / 1259724289439525573076) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0097_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0097
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0098 : Poly :=
[
  term ((352697352283319889395 : Rat) / 74101428790560327828) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0098 : Poly :=
[
  term ((-352697352283319889395 : Rat) / 37050714395280163914) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((352697352283319889395 : Rat) / 74101428790560327828) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((352697352283319889395 : Rat) / 37050714395280163914) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-352697352283319889395 : Rat) / 74101428790560327828) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-352697352283319889395 : Rat) / 74101428790560327828) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((352697352283319889395 : Rat) / 74101428790560327828) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0098_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0098
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0099 : Poly :=
[
  term ((-66800252263155747666355 : Rat) / 222304286371680983484) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 99 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0099 : Poly :=
[
  term ((66800252263155747666355 : Rat) / 111152143185840491742) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 222304286371680983484) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 222304286371680983484) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 111152143185840491742) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((66800252263155747666355 : Rat) / 222304286371680983484) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((66800252263155747666355 : Rat) / 222304286371680983484) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0099_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0099
        rs_R007_ueqv_R007NY_generator_04_0000_0099 =
      rs_R007_ueqv_R007NY_partial_04_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_04_0000_0099 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_04_0000,
  rs_R007_ueqv_R007NY_partial_04_0001,
  rs_R007_ueqv_R007NY_partial_04_0002,
  rs_R007_ueqv_R007NY_partial_04_0003,
  rs_R007_ueqv_R007NY_partial_04_0004,
  rs_R007_ueqv_R007NY_partial_04_0005,
  rs_R007_ueqv_R007NY_partial_04_0006,
  rs_R007_ueqv_R007NY_partial_04_0007,
  rs_R007_ueqv_R007NY_partial_04_0008,
  rs_R007_ueqv_R007NY_partial_04_0009,
  rs_R007_ueqv_R007NY_partial_04_0010,
  rs_R007_ueqv_R007NY_partial_04_0011,
  rs_R007_ueqv_R007NY_partial_04_0012,
  rs_R007_ueqv_R007NY_partial_04_0013,
  rs_R007_ueqv_R007NY_partial_04_0014,
  rs_R007_ueqv_R007NY_partial_04_0015,
  rs_R007_ueqv_R007NY_partial_04_0016,
  rs_R007_ueqv_R007NY_partial_04_0017,
  rs_R007_ueqv_R007NY_partial_04_0018,
  rs_R007_ueqv_R007NY_partial_04_0019,
  rs_R007_ueqv_R007NY_partial_04_0020,
  rs_R007_ueqv_R007NY_partial_04_0021,
  rs_R007_ueqv_R007NY_partial_04_0022,
  rs_R007_ueqv_R007NY_partial_04_0023,
  rs_R007_ueqv_R007NY_partial_04_0024,
  rs_R007_ueqv_R007NY_partial_04_0025,
  rs_R007_ueqv_R007NY_partial_04_0026,
  rs_R007_ueqv_R007NY_partial_04_0027,
  rs_R007_ueqv_R007NY_partial_04_0028,
  rs_R007_ueqv_R007NY_partial_04_0029,
  rs_R007_ueqv_R007NY_partial_04_0030,
  rs_R007_ueqv_R007NY_partial_04_0031,
  rs_R007_ueqv_R007NY_partial_04_0032,
  rs_R007_ueqv_R007NY_partial_04_0033,
  rs_R007_ueqv_R007NY_partial_04_0034,
  rs_R007_ueqv_R007NY_partial_04_0035,
  rs_R007_ueqv_R007NY_partial_04_0036,
  rs_R007_ueqv_R007NY_partial_04_0037,
  rs_R007_ueqv_R007NY_partial_04_0038,
  rs_R007_ueqv_R007NY_partial_04_0039,
  rs_R007_ueqv_R007NY_partial_04_0040,
  rs_R007_ueqv_R007NY_partial_04_0041,
  rs_R007_ueqv_R007NY_partial_04_0042,
  rs_R007_ueqv_R007NY_partial_04_0043,
  rs_R007_ueqv_R007NY_partial_04_0044,
  rs_R007_ueqv_R007NY_partial_04_0045,
  rs_R007_ueqv_R007NY_partial_04_0046,
  rs_R007_ueqv_R007NY_partial_04_0047,
  rs_R007_ueqv_R007NY_partial_04_0048,
  rs_R007_ueqv_R007NY_partial_04_0049,
  rs_R007_ueqv_R007NY_partial_04_0050,
  rs_R007_ueqv_R007NY_partial_04_0051,
  rs_R007_ueqv_R007NY_partial_04_0052,
  rs_R007_ueqv_R007NY_partial_04_0053,
  rs_R007_ueqv_R007NY_partial_04_0054,
  rs_R007_ueqv_R007NY_partial_04_0055,
  rs_R007_ueqv_R007NY_partial_04_0056,
  rs_R007_ueqv_R007NY_partial_04_0057,
  rs_R007_ueqv_R007NY_partial_04_0058,
  rs_R007_ueqv_R007NY_partial_04_0059,
  rs_R007_ueqv_R007NY_partial_04_0060,
  rs_R007_ueqv_R007NY_partial_04_0061,
  rs_R007_ueqv_R007NY_partial_04_0062,
  rs_R007_ueqv_R007NY_partial_04_0063,
  rs_R007_ueqv_R007NY_partial_04_0064,
  rs_R007_ueqv_R007NY_partial_04_0065,
  rs_R007_ueqv_R007NY_partial_04_0066,
  rs_R007_ueqv_R007NY_partial_04_0067,
  rs_R007_ueqv_R007NY_partial_04_0068,
  rs_R007_ueqv_R007NY_partial_04_0069,
  rs_R007_ueqv_R007NY_partial_04_0070,
  rs_R007_ueqv_R007NY_partial_04_0071,
  rs_R007_ueqv_R007NY_partial_04_0072,
  rs_R007_ueqv_R007NY_partial_04_0073,
  rs_R007_ueqv_R007NY_partial_04_0074,
  rs_R007_ueqv_R007NY_partial_04_0075,
  rs_R007_ueqv_R007NY_partial_04_0076,
  rs_R007_ueqv_R007NY_partial_04_0077,
  rs_R007_ueqv_R007NY_partial_04_0078,
  rs_R007_ueqv_R007NY_partial_04_0079,
  rs_R007_ueqv_R007NY_partial_04_0080,
  rs_R007_ueqv_R007NY_partial_04_0081,
  rs_R007_ueqv_R007NY_partial_04_0082,
  rs_R007_ueqv_R007NY_partial_04_0083,
  rs_R007_ueqv_R007NY_partial_04_0084,
  rs_R007_ueqv_R007NY_partial_04_0085,
  rs_R007_ueqv_R007NY_partial_04_0086,
  rs_R007_ueqv_R007NY_partial_04_0087,
  rs_R007_ueqv_R007NY_partial_04_0088,
  rs_R007_ueqv_R007NY_partial_04_0089,
  rs_R007_ueqv_R007NY_partial_04_0090,
  rs_R007_ueqv_R007NY_partial_04_0091,
  rs_R007_ueqv_R007NY_partial_04_0092,
  rs_R007_ueqv_R007NY_partial_04_0093,
  rs_R007_ueqv_R007NY_partial_04_0094,
  rs_R007_ueqv_R007NY_partial_04_0095,
  rs_R007_ueqv_R007NY_partial_04_0096,
  rs_R007_ueqv_R007NY_partial_04_0097,
  rs_R007_ueqv_R007NY_partial_04_0098,
  rs_R007_ueqv_R007NY_partial_04_0099
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_04_0000_0099 : Poly :=
[
  term ((52764077501402037054440 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-31658446500841222232664 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-26382038750701018527220 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((15829223250420611116332 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-26382038750701018527220 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((15829223250420611116332 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-52764077501402037054440 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((26382038750701018527220 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((26382038750701018527220 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((31658446500841222232664 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15829223250420611116332 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-15829223250420611116332 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((7291176097715546343575 : Rat) / 18525357197640081957) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 6175119065880027319) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 37050714395280163914) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 12350238131760054638) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 37050714395280163914) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 12350238131760054638) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 18525357197640081957) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((332532841936418362962725 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 3), (16, 1)],
  term ((7291176097715546343575 : Rat) / 37050714395280163914) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 6175119065880027319) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-66506568387283672592545 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 12350238131760054638) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((223421164547493583079075 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-44684232909498716615815 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-389940104618769084781550 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((77988020923753816956310 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((86841965568300061610515 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-64661847731539787644477 : Rat) / 111152143185840491742) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-471635348702704374015335 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-17368393113660012322103 : Rat) / 209954048239920928846) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((19746180295111414490933 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-223421164547493583079075 : Rat) / 1889586434159288359614) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((44684232909498716615815 : Rat) / 629862144719762786538) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((194970052309384542390775 : Rat) / 944793217079644179807) [(0, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-38994010461876908478155 : Rat) / 314931072359881393269) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 1259724289439525573076) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((64661847731539787644477 : Rat) / 222304286371680983484) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((471635348702704374015335 : Rat) / 3779172868318576719228) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((17368393113660012322103 : Rat) / 419908096479841857692) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 89980306388537540934) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-223421164547493583079075 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((223421164547493583079075 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((223421164547493583079075 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((44684232909498716615815 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-44684232909498716615815 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-44684232909498716615815 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((194970052309384542390775 : Rat) / 944793217079644179807) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-38994010461876908478155 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 1259724289439525573076) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((64661847731539787644477 : Rat) / 222304286371680983484) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((471635348702704374015335 : Rat) / 3779172868318576719228) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((17368393113660012322103 : Rat) / 419908096479841857692) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 89980306388537540934) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-223421164547493583079075 : Rat) / 1889586434159288359614) [(0, 1), (7, 3), (11, 1), (16, 1)],
  term ((44684232909498716615815 : Rat) / 629862144719762786538) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((389940104618769084781550 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-194970052309384542390775 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-194970052309384542390775 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-77988020923753816956310 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((38994010461876908478155 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((38994010461876908478155 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 629862144719762786538) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((64661847731539787644477 : Rat) / 111152143185840491742) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-111962977846300343419885 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-7193157839776087679431 : Rat) / 27188294016680408052) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-64661847731539787644477 : Rat) / 222304286371680983484) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((86841965568300061610515 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((471635348702704374015335 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-471635348702704374015335 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-471635348702704374015335 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((17368393113660012322103 : Rat) / 209954048239920928846) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((22392595569260068683977 : Rat) / 419908096479841857692) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((18326144985007125883573 : Rat) / 89980306388537540934) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (12, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 3), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (12, 3), (16, 1)],
  term ((19746180295111414490933 : Rat) / 89980306388537540934) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-17368393113660012322103 : Rat) / 419908096479841857692) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-52764077501402037054440 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((31658446500841222232664 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((26382038750701018527220 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 2), (11, 1), (16, 1)],
  term ((-15829223250420611116332 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((26382038750701018527220 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (7, 2), (11, 1), (16, 1)],
  term ((-15829223250420611116332 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((52764077501402037054440 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((-26382038750701018527220 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (11, 1), (12, 2), (16, 1)],
  term ((-26382038750701018527220 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)],
  term ((-31658446500841222232664 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((15829223250420611116332 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((15829223250420611116332 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 18525357197640081957) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 6175119065880027319) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((7291176097715546343575 : Rat) / 37050714395280163914) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 12350238131760054638) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((7291176097715546343575 : Rat) / 37050714395280163914) [(1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 12350238131760054638) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((7291176097715546343575 : Rat) / 18525357197640081957) [(1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 37050714395280163914) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-7291176097715546343575 : Rat) / 37050714395280163914) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1458235219543109268715 : Rat) / 6175119065880027319) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 12350238131760054638) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((1458235219543109268715 : Rat) / 12350238131760054638) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((389940104618769084781550 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-77988020923753816956310 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-42862904184507353364715 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((8572580836901470672943 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((98730901475557072454665 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((76690866080619633975665 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((17368393113660012322103 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15338173216123926795133 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-194970052309384542390775 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((38994010461876908478155 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((42862904184507353364715 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-8572580836901470672943 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((86841965568300061610515 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((-98730901475557072454665 : Rat) / 269940919165612622802) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-76690866080619633975665 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-17368393113660012322103 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((19746180295111414490933 : Rat) / 89980306388537540934) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((15338173216123926795133 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-194970052309384542390775 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((38994010461876908478155 : Rat) / 314931072359881393269) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((42862904184507353364715 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-8572580836901470672943 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((86841965568300061610515 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((-98730901475557072454665 : Rat) / 269940919165612622802) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-76690866080619633975665 : Rat) / 3779172868318576719228) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-17368393113660012322103 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((19746180295111414490933 : Rat) / 89980306388537540934) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((15338173216123926795133 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-389940104618769084781550 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((194970052309384542390775 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((194970052309384542390775 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((77988020923753816956310 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-38994010461876908478155 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-38994010461876908478155 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((42862904184507353364715 : Rat) / 629862144719762786538) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-42862904184507353364715 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-42862904184507353364715 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-8572580836901470672943 : Rat) / 209954048239920928846) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8572580836901470672943 : Rat) / 419908096479841857692) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((8572580836901470672943 : Rat) / 419908096479841857692) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-95215636327633488880305 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-98730901475557072454665 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-76690866080619633975665 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((98730901475557072454665 : Rat) / 269940919165612622802) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((597742659490420003638755 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-86841965568300061610515 : Rat) / 1259724289439525573076) [(1, 1), (11, 1), (12, 3), (16, 1)],
  term ((98730901475557072454665 : Rat) / 269940919165612622802) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((76690866080619633975665 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 4), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((57129381796580093328183 : Rat) / 419908096479841857692) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((19746180295111414490933 : Rat) / 44990153194268770467) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15338173216123926795133 : Rat) / 629862144719762786538) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 89980306388537540934) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-119548531898084000727751 : Rat) / 1259724289439525573076) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((17368393113660012322103 : Rat) / 419908096479841857692) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-19746180295111414490933 : Rat) / 89980306388537540934) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15338173216123926795133 : Rat) / 1259724289439525573076) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (13, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((557172743343760440679765 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((557172743343760440679765 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((557172743343760440679765 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((111434548668752088135953 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((969392831175046141580 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-581635698705027684948 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-109499368732246143812065 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-538660015976265837603853 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((21899873746449228762413 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((16379760321266400622070 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-484696415587523070790 : Rat) / 104977024119960464423) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((290817849352513842474 : Rat) / 104977024119960464423) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((109499368732246143812065 : Rat) / 629862144719762786538) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((538660015976265837603853 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-21899873746449228762413 : Rat) / 209954048239920928846) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-8189880160633200311035 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-969392831175046141580 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((484696415587523070790 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((484696415587523070790 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((581635698705027684948 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-290817849352513842474 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-290817849352513842474 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((109499368732246143812065 : Rat) / 629862144719762786538) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((538660015976265837603853 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-21899873746449228762413 : Rat) / 209954048239920928846) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-8189880160633200311035 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-484696415587523070790 : Rat) / 104977024119960464423) [(2, 1), (7, 3), (11, 1), (16, 1)],
  term ((290817849352513842474 : Rat) / 104977024119960464423) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((109499368732246143812065 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((538660015976265837603853 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-109499368732246143812065 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-339855072561665432573453 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-538660015976265837603853 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-109499368732246143812065 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (12, 2), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (13, 2), (16, 1)],
  term ((-21899873746449228762413 : Rat) / 104977024119960464423) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16379760321266400622070 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((21899873746449228762413 : Rat) / 209954048239920928846) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((5349809540424623096315 : Rat) / 44990153194268770467) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 3), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((8189880160633200311035 : Rat) / 44990153194268770467) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((21899873746449228762413 : Rat) / 209954048239920928846) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((557172743343760440679765 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((557172743343760440679765 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((557172743343760440679765 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-557172743343760440679765 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-111434548668752088135953 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((111434548668752088135953 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-11543865089352728056199 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((378199342050388532693795 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((373881446574225879539660 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((50833627144399062570685 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-75639868410077706538759 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-74776289314845175907932 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3248939110799990218815 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((11543865089352728056199 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-378199342050388532693795 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-186940723287112939769830 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-50833627144399062570685 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((75639868410077706538759 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((37388144657422587953966 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((3248939110799990218815 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((11543865089352728056199 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-378199342050388532693795 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-186940723287112939769830 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-50833627144399062570685 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((75639868410077706538759 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((37388144657422587953966 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((3248939110799990218815 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(3, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((11543865089352728056199 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11543865089352728056199 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11543865089352728056199 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((378199342050388532693795 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-373881446574225879539660 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-50833627144399062570685 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((186940723287112939769830 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-78396117439597555868545 : Rat) / 209954048239920928846) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((378199342050388532693795 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (12, 3), (16, 1)],
  term ((186940723287112939769830 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((50833627144399062570685 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-75639868410077706538759 : Rat) / 629862144719762786538) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((74776289314845175907932 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3248939110799990218815 : Rat) / 104977024119960464423) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-37388144657422587953966 : Rat) / 314931072359881393269) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((141532919487755442421073 : Rat) / 629862144719762786538) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-75639868410077706538759 : Rat) / 629862144719762786538) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((-37388144657422587953966 : Rat) / 314931072359881393269) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3248939110799990218815 : Rat) / 209954048239920928846) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-23212151932589367340585 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((4642430386517873468117 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((516150036672716418272165 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((475401978634200753830110 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-95080395726840150766022 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((23212151932589367340585 : Rat) / 1889586434159288359614) [(4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-4642430386517873468117 : Rat) / 629862144719762786538) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 1889586434159288359614) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-237700989317100376915055 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 629862144719762786538) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((47540197863420075383011 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((23212151932589367340585 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-23212151932589367340585 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-23212151932589367340585 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4642430386517873468117 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((4642430386517873468117 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((4642430386517873468117 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 1889586434159288359614) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-237700989317100376915055 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 629862144719762786538) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((47540197863420075383011 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((23212151932589367340585 : Rat) / 1889586434159288359614) [(4, 1), (7, 3), (11, 1), (16, 1)],
  term ((-4642430386517873468117 : Rat) / 629862144719762786538) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-475401978634200753830110 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((516150036672716418272165 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((237700989317100376915055 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((237700989317100376915055 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((516150036672716418272165 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term ((103230007334543283654433 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((95080395726840150766022 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 629862144719762786538) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-47540197863420075383011 : Rat) / 314931072359881393269) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-47540197863420075383011 : Rat) / 314931072359881393269) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 629862144719762786538) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2307947771398663912450 : Rat) / 3118129429305756369) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((34010450733643947758025 : Rat) / 209954048239920928846) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((461589554279732782490 : Rat) / 1039376476435252123) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20406270440186368654815 : Rat) / 209954048239920928846) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((516150036672716418272165 : Rat) / 1889586434159288359614) [(5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1153973885699331956225 : Rat) / 3118129429305756369) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-34010450733643947758025 : Rat) / 419908096479841857692) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 629862144719762786538) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-230794777139866391245 : Rat) / 1039376476435252123) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((20406270440186368654815 : Rat) / 419908096479841857692) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((516150036672716418272165 : Rat) / 1889586434159288359614) [(5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1153973885699331956225 : Rat) / 3118129429305756369) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-34010450733643947758025 : Rat) / 419908096479841857692) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103230007334543283654433 : Rat) / 629862144719762786538) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-230794777139866391245 : Rat) / 1039376476435252123) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((20406270440186368654815 : Rat) / 419908096479841857692) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2307947771398663912450 : Rat) / 3118129429305756369) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-34010450733643947758025 : Rat) / 209954048239920928846) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-329995517843360332456375 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((2370694203293661202910885 : Rat) / 3779172868318576719228) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((-516150036672716418272165 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (12, 3), (16, 1)],
  term ((-1153973885699331956225 : Rat) / 3118129429305756369) [(5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((34010450733643947758025 : Rat) / 419908096479841857692) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 629862144719762786538) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-461589554279732782490 : Rat) / 1039376476435252123) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((20406270440186368654815 : Rat) / 209954048239920928846) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((65999103568672066491275 : Rat) / 314931072359881393269) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-474138840658732240582177 : Rat) / 1259724289439525573076) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((103230007334543283654433 : Rat) / 629862144719762786538) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((230794777139866391245 : Rat) / 1039376476435252123) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-20406270440186368654815 : Rat) / 419908096479841857692) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-134796090577430608371950 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((26959218115486121674390 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((360930172329542197607705 : Rat) / 1889586434159288359614) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1763486761416599446975 : Rat) / 111152143185840491742) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-72186034465908439521541 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-352697352283319889395 : Rat) / 37050714395280163914) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((66800252263155747666355 : Rat) / 111152143185840491742) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((67398045288715304185975 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-13479609057743060837195 : Rat) / 104977024119960464423) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-360930172329542197607705 : Rat) / 3779172868318576719228) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1763486761416599446975 : Rat) / 222304286371680983484) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((72186034465908439521541 : Rat) / 1259724289439525573076) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((352697352283319889395 : Rat) / 74101428790560327828) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 222304286371680983484) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((134796090577430608371950 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-26959218115486121674390 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-360930172329542197607705 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1763486761416599446975 : Rat) / 111152143185840491742) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((360930172329542197607705 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1763486761416599446975 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((360930172329542197607705 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1763486761416599446975 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((72186034465908439521541 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((352697352283319889395 : Rat) / 37050714395280163914) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72186034465908439521541 : Rat) / 1259724289439525573076) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-352697352283319889395 : Rat) / 74101428790560327828) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-72186034465908439521541 : Rat) / 1259724289439525573076) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-352697352283319889395 : Rat) / 74101428790560327828) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 222304286371680983484) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 3), (8, 1), (11, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (8, 1), (15, 1), (16, 1)],
  term ((67398045288715304185975 : Rat) / 314931072359881393269) [(7, 3), (10, 1), (11, 1), (16, 1)],
  term ((-13479609057743060837195 : Rat) / 104977024119960464423) [(7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-360930172329542197607705 : Rat) / 3779172868318576719228) [(7, 3), (11, 1), (14, 1), (16, 1)],
  term ((-1763486761416599446975 : Rat) / 222304286371680983484) [(7, 3), (11, 1), (16, 1)],
  term ((72186034465908439521541 : Rat) / 1259724289439525573076) [(7, 3), (14, 1), (15, 1), (16, 1)],
  term ((352697352283319889395 : Rat) / 74101428790560327828) [(7, 3), (15, 1), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 111152143185840491742) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((66800252263155747666355 : Rat) / 222304286371680983484) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((66800252263155747666355 : Rat) / 222304286371680983484) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 0 through 99. -/
theorem rs_R007_ueqv_R007NY_block_04_0000_0099_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_04_0000_0099
      rs_R007_ueqv_R007NY_block_04_0000_0099 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
