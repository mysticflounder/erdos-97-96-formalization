/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 19:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0000 : Poly :=
[
  term ((-32624798807292329 : Rat) / 208877130852768) []
]

/-- Partial product 0 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0000 : Poly :=
[
  term ((32624798807292329 : Rat) / 208877130852768) [],
  term ((-32624798807292329 : Rat) / 104438565426384) [(8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0000
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0001 : Poly :=
[
  term ((753222717676 : Rat) / 14801383989) [(0, 1)]
]

/-- Partial product 1 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0001 : Poly :=
[
  term ((-753222717676 : Rat) / 14801383989) [(0, 1)],
  term ((1506445435352 : Rat) / 14801383989) [(0, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0001
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0002 : Poly :=
[
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0002 : Poly :=
[
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1)],
  term ((45864690786755 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0002
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0003 : Poly :=
[
  term ((-84986436597142 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 3 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0003 : Poly :=
[
  term ((84986436597142 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1)],
  term ((-169972873194284 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0003
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0004 : Poly :=
[
  term ((1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 4 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0004 : Poly :=
[
  term ((1096961875165 : Rat) / 1498874328) [(0, 1), (1, 1), (8, 1), (9, 1)],
  term ((-1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0004
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0005 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 5 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0005 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (1, 1), (8, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0005
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0006 : Poly :=
[
  term ((-14716162540349 : Rat) / 39470357304) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 6 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0006 : Poly :=
[
  term ((-14716162540349 : Rat) / 19735178652) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((14716162540349 : Rat) / 39470357304) [(0, 1), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0006
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0007 : Poly :=
[
  term ((585 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0007 : Poly :=
[
  term ((585 : Rat) / 14) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-585 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0007
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0008 : Poly :=
[
  term ((512362315926043 : Rat) / 725267815461) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 8 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0008 : Poly :=
[
  term ((1024724631852086 : Rat) / 725267815461) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((-512362315926043 : Rat) / 725267815461) [(0, 1), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0008
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0009 : Poly :=
[
  term ((-121 : Rat) / 7) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0009 : Poly :=
[
  term ((-242 : Rat) / 7) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((121 : Rat) / 7) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0009
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0010 : Poly :=
[
  term ((320 : Rat) / 63) [(0, 1), (2, 1)]
]

/-- Partial product 10 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0010 : Poly :=
[
  term ((-320 : Rat) / 63) [(0, 1), (2, 1)],
  term ((640 : Rat) / 63) [(0, 1), (2, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0010
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0011 : Poly :=
[
  term ((-3457649416338352 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 11 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0011 : Poly :=
[
  term ((3457649416338352 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1)],
  term ((-6915298832676704 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0011
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0012 : Poly :=
[
  term ((-8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 12 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0012 : Poly :=
[
  term ((-8121862279687 : Rat) / 6744934476) [(0, 1), (3, 1), (8, 1), (9, 1)],
  term ((8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0012
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0013 : Poly :=
[
  term ((1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 13 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0013 : Poly :=
[
  term ((1068637148240579 : Rat) / 2175803446383) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((-1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0013
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0014 : Poly :=
[
  term ((333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 14 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0014 : Poly :=
[
  term ((333576329821813 : Rat) / 266424911802) [(0, 1), (3, 1), (8, 1), (13, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0014
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0015 : Poly :=
[
  term ((-505 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0015 : Poly :=
[
  term ((-505 : Rat) / 21) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((505 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0015
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0016 : Poly :=
[
  term ((-1516122455971103 : Rat) / 2175803446383) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 16 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0016 : Poly :=
[
  term ((-3032244911942206 : Rat) / 2175803446383) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term ((1516122455971103 : Rat) / 2175803446383) [(0, 1), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0016
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0017 : Poly :=
[
  term ((194 : Rat) / 21) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0017 : Poly :=
[
  term ((388 : Rat) / 21) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-194 : Rat) / 21) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0017
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0018 : Poly :=
[
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2)]
]

/-- Partial product 18 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0018 : Poly :=
[
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2)],
  term ((1107240197953805 : Rat) / 6527410339149) [(0, 1), (3, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0018
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0019 : Poly :=
[
  term ((-7660998914045 : Rat) / 241755938487) [(0, 1), (6, 1)]
]

/-- Partial product 19 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0019 : Poly :=
[
  term ((7660998914045 : Rat) / 241755938487) [(0, 1), (6, 1)],
  term ((-15321997828090 : Rat) / 241755938487) [(0, 1), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0019
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0020 : Poly :=
[
  term ((6788130415625 : Rat) / 6744934476) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 20 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0020 : Poly :=
[
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (7, 1), (8, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(0, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0020
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0021 : Poly :=
[
  term ((-1956263011770889 : Rat) / 2175803446383) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 21 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0021 : Poly :=
[
  term ((-3912526023541778 : Rat) / 2175803446383) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((1956263011770889 : Rat) / 2175803446383) [(0, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0021
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0022 : Poly :=
[
  term ((-280381883026811 : Rat) / 266424911802) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 22 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0022 : Poly :=
[
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(0, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0022
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0023 : Poly :=
[
  term ((-85 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0023 : Poly :=
[
  term ((-170 : Rat) / 21) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0023
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0024 : Poly :=
[
  term ((6751967453434339 : Rat) / 4351606892766) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 24 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0024 : Poly :=
[
  term ((6751967453434339 : Rat) / 2175803446383) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((-6751967453434339 : Rat) / 4351606892766) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0024
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0025 : Poly :=
[
  term ((16 : Rat) / 3) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0025 : Poly :=
[
  term ((32 : Rat) / 3) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0025
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0026 : Poly :=
[
  term ((1239549624292481 : Rat) / 2175803446383) [(0, 1), (7, 2)]
]

/-- Partial product 26 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0026 : Poly :=
[
  term ((-1239549624292481 : Rat) / 2175803446383) [(0, 1), (7, 2)],
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0026
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0027 : Poly :=
[
  term ((-17377613864 : Rat) / 562077873) [(0, 1), (8, 1)]
]

/-- Partial product 27 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0027 : Poly :=
[
  term ((17377613864 : Rat) / 562077873) [(0, 1), (8, 1)],
  term ((-34755227728 : Rat) / 562077873) [(0, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0027
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0028 : Poly :=
[
  term ((249803199295 : Rat) / 2997748656) [(0, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 28 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0028 : Poly :=
[
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-249803199295 : Rat) / 2997748656) [(0, 1), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0028
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0029 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 29 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0029 : Poly :=
[
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0029
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0030 : Poly :=
[
  term ((-3064976645263 : Rat) / 17986491936) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 30 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0030 : Poly :=
[
  term ((-3064976645263 : Rat) / 8993245968) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((3064976645263 : Rat) / 17986491936) [(0, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0030
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0031 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 31 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0031 : Poly :=
[
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0031
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0032 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 32 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0032 : Poly :=
[
  term ((249803199295 : Rat) / 374718582) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0032
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0033 : Poly :=
[
  term ((10861008665 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 33 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0033 : Poly :=
[
  term ((10861008665 : Rat) / 374718582) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0033
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0034 : Poly :=
[
  term ((-7887264492523 : Rat) / 11990994624) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 34 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0034 : Poly :=
[
  term ((-7887264492523 : Rat) / 5995497312) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((7887264492523 : Rat) / 11990994624) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0034
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0035 : Poly :=
[
  term ((10128353936477537 : Rat) / 17406427571064) [(0, 1), (10, 1)]
]

/-- Partial product 35 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0035 : Poly :=
[
  term ((10128353936477537 : Rat) / 8703213785532) [(0, 1), (8, 1), (10, 1)],
  term ((-10128353936477537 : Rat) / 17406427571064) [(0, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0035
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0036 : Poly :=
[
  term ((-108242905555 : Rat) / 1498874328) [(0, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 36 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0036 : Poly :=
[
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((108242905555 : Rat) / 1498874328) [(0, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0036
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0037 : Poly :=
[
  term ((115 : Rat) / 28) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0037 : Poly :=
[
  term ((115 : Rat) / 14) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 28) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0037
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0038 : Poly :=
[
  term ((5517018715 : Rat) / 187359291) [(0, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 38 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0038 : Poly :=
[
  term ((11034037430 : Rat) / 187359291) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5517018715 : Rat) / 187359291) [(0, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0038
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0039 : Poly :=
[
  term ((-23 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0039 : Poly :=
[
  term ((-46 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((23 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0039
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0040 : Poly :=
[
  term ((108242905555 : Rat) / 749437164) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0040 : Poly :=
[
  term ((108242905555 : Rat) / 374718582) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0040
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0041 : Poly :=
[
  term ((-115 : Rat) / 14) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0041 : Poly :=
[
  term ((-115 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0041
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0042 : Poly :=
[
  term ((-11034037430 : Rat) / 187359291) [(0, 1), (10, 1), (15, 2)]
]

/-- Partial product 42 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0042 : Poly :=
[
  term ((-22068074860 : Rat) / 187359291) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((11034037430 : Rat) / 187359291) [(0, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0042
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0043 : Poly :=
[
  term ((46 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0043 : Poly :=
[
  term ((92 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0043
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0044 : Poly :=
[
  term ((16909914029131 : Rat) / 101495204496) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 44 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0044 : Poly :=
[
  term ((16909914029131 : Rat) / 50747602248) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-16909914029131 : Rat) / 101495204496) [(0, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0044
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0045 : Poly :=
[
  term ((-465 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0045 : Poly :=
[
  term ((-465 : Rat) / 28) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((465 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0045
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0046 : Poly :=
[
  term ((-574375153398001 : Rat) / 8703213785532) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 46 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0046 : Poly :=
[
  term ((-574375153398001 : Rat) / 4351606892766) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((574375153398001 : Rat) / 8703213785532) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0046
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0047 : Poly :=
[
  term ((97 : Rat) / 14) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0047 : Poly :=
[
  term ((97 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97 : Rat) / 14) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0047
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0048 : Poly :=
[
  term ((-59904 : Rat) / 553) [(0, 1), (11, 2)]
]

/-- Partial product 48 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0048 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (8, 1), (11, 2)],
  term ((59904 : Rat) / 553) [(0, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0048
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0049 : Poly :=
[
  term ((-18615854345 : Rat) / 53531226) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 49 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0049 : Poly :=
[
  term ((-18615854345 : Rat) / 26765613) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((18615854345 : Rat) / 53531226) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0049
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0050 : Poly :=
[
  term (23 : Rat) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0050 : Poly :=
[
  term (46 : Rat) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-23 : Rat) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0050
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0051 : Poly :=
[
  term ((108242905555 : Rat) / 749437164) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 51 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0051 : Poly :=
[
  term ((108242905555 : Rat) / 374718582) [(0, 1), (8, 1), (12, 1), (13, 2)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0051
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0052 : Poly :=
[
  term ((-115 : Rat) / 14) [(0, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 52 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0052 : Poly :=
[
  term ((-115 : Rat) / 7) [(0, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0052
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0053 : Poly :=
[
  term ((22068074860 : Rat) / 187359291) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 53 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0053 : Poly :=
[
  term ((44136149720 : Rat) / 187359291) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-22068074860 : Rat) / 187359291) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0053
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0054 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 54 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0054 : Poly :=
[
  term ((-184 : Rat) / 7) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0054
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0055 : Poly :=
[
  term ((395858485272353 : Rat) / 473644287648) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 55 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0055 : Poly :=
[
  term ((395858485272353 : Rat) / 236822143824) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-395858485272353 : Rat) / 473644287648) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0055
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0056 : Poly :=
[
  term ((-159 : Rat) / 112) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0056 : Poly :=
[
  term ((-159 : Rat) / 56) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((159 : Rat) / 112) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0056
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0057 : Poly :=
[
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (13, 2)]
]

/-- Partial product 57 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0057 : Poly :=
[
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (8, 1), (13, 2)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0057
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0058 : Poly :=
[
  term ((5 : Rat) / 7) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 58 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0058 : Poly :=
[
  term ((10 : Rat) / 7) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 7) [(0, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0058
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0059 : Poly :=
[
  term ((-5196068507256523 : Rat) / 17406427571064) [(0, 1), (14, 1)]
]

/-- Partial product 59 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0059 : Poly :=
[
  term ((-5196068507256523 : Rat) / 8703213785532) [(0, 1), (8, 1), (14, 1)],
  term ((5196068507256523 : Rat) / 17406427571064) [(0, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0059
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0060 : Poly :=
[
  term ((-2489339290629473 : Rat) / 1934047507896) [(0, 1), (15, 2)]
]

/-- Partial product 60 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0060 : Poly :=
[
  term ((-2489339290629473 : Rat) / 967023753948) [(0, 1), (8, 1), (15, 2)],
  term ((2489339290629473 : Rat) / 1934047507896) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0060
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0061 : Poly :=
[
  term ((-17 : Rat) / 28) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0061 : Poly :=
[
  term ((-17 : Rat) / 14) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((17 : Rat) / 28) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0061
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0062 : Poly :=
[
  term ((-4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 62 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0062 : Poly :=
[
  term ((4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (7, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(1, 1), (2, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0062
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0063 : Poly :=
[
  term ((4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 63 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0063 : Poly :=
[
  term ((9193198696854 : Rat) / 26861770943) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0063
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0064 : Poly :=
[
  term ((-1505101399578125 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 64 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0064 : Poly :=
[
  term ((1505101399578125 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1)],
  term ((-1505101399578125 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0064
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0065 : Poly :=
[
  term ((-90071490967235 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 65 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0065 : Poly :=
[
  term ((-90071490967235 : Rat) / 2175803446383) [(1, 1), (3, 1), (8, 1), (10, 1)],
  term ((90071490967235 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0065
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0066 : Poly :=
[
  term ((2101893202014605 : Rat) / 39164462034894) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 66 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0066 : Poly :=
[
  term ((2101893202014605 : Rat) / 19582231017447) [(1, 1), (3, 1), (8, 1), (14, 1)],
  term ((-2101893202014605 : Rat) / 39164462034894) [(1, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0066
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0067 : Poly :=
[
  term ((-8192672238679723 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 67 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0067 : Poly :=
[
  term ((8192672238679723 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0067
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0068 : Poly :=
[
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 68 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0068 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0068
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0069 : Poly :=
[
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (10, 1), (13, 1)]
]

/-- Partial product 69 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0069 : Poly :=
[
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0069
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0070 : Poly :=
[
  term ((29986839311587099 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 70 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0070 : Poly :=
[
  term ((29986839311587099 : Rat) / 13054820678298) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-29986839311587099 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0070
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0071 : Poly :=
[
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 71 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0071 : Poly :=
[
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0071
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0072 : Poly :=
[
  term ((-9027763436335891 : Rat) / 19582231017447) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 72 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0072 : Poly :=
[
  term ((-18055526872671782 : Rat) / 19582231017447) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((9027763436335891 : Rat) / 19582231017447) [(1, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0072
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0073 : Poly :=
[
  term ((-85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0073 : Poly :=
[
  term ((-170 : Rat) / 63) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0073
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0074 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 74 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0074 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0074
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0075 : Poly :=
[
  term ((-18707993583637175 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 75 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0075 : Poly :=
[
  term ((-18707993583637175 : Rat) / 13054820678298) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((18707993583637175 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0075
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0076 : Poly :=
[
  term ((16 : Rat) / 9) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0076 : Poly :=
[
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0076
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0077 : Poly :=
[
  term ((-1622396964599701 : Rat) / 13054820678298) [(1, 1), (7, 1)]
]

/-- Partial product 77 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0077 : Poly :=
[
  term ((1622396964599701 : Rat) / 13054820678298) [(1, 1), (7, 1)],
  term ((-1622396964599701 : Rat) / 6527410339149) [(1, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0077
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0078 : Poly :=
[
  term ((2311886866863751 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 78 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0078 : Poly :=
[
  term ((2311886866863751 : Rat) / 6527410339149) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((-2311886866863751 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0078
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0079 : Poly :=
[
  term ((16031001116740507 : Rat) / 13054820678298) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 79 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0079 : Poly :=
[
  term ((16031001116740507 : Rat) / 6527410339149) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((-16031001116740507 : Rat) / 13054820678298) [(1, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0079
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0080 : Poly :=
[
  term ((-10861008665 : Rat) / 333083184) [(1, 1), (9, 1)]
]

/-- Partial product 80 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0080 : Poly :=
[
  term ((-10861008665 : Rat) / 166541592) [(1, 1), (8, 1), (9, 1)],
  term ((10861008665 : Rat) / 333083184) [(1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0080
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0081 : Poly :=
[
  term ((-5745473583785 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 81 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0081 : Poly :=
[
  term ((-5745473583785 : Rat) / 8993245968) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((5745473583785 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0081
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0082 : Poly :=
[
  term ((249803199295 : Rat) / 1498874328) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 82 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0082 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0082
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0083 : Poly :=
[
  term ((-249803199295 : Rat) / 2997748656) [(1, 1), (9, 1), (10, 2)]
]

/-- Partial product 83 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0083 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((249803199295 : Rat) / 2997748656) [(1, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0083
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0084 : Poly :=
[
  term ((-1305493241533 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 84 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0084 : Poly :=
[
  term ((-1305493241533 : Rat) / 4496622984) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((1305493241533 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0084
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0085 : Poly :=
[
  term ((-127671156857075 : Rat) / 323756854848) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 85 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0085 : Poly :=
[
  term ((-127671156857075 : Rat) / 161878427424) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((127671156857075 : Rat) / 323756854848) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0085
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0086 : Poly :=
[
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 86 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0086 : Poly :=
[
  term ((119808 : Rat) / 553) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0086
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0087 : Poly :=
[
  term ((242605845302939 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 87 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0087 : Poly :=
[
  term ((242605845302939 : Rat) / 355233215736) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-242605845302939 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0087
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0088 : Poly :=
[
  term ((-6648950989536007 : Rat) / 26109641356596) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 88 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0088 : Poly :=
[
  term ((-6648950989536007 : Rat) / 13054820678298) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((6648950989536007 : Rat) / 26109641356596) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0088
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0089 : Poly :=
[
  term ((115 : Rat) / 14) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 89 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0089 : Poly :=
[
  term ((115 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0089
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0090 : Poly :=
[
  term ((-375 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 90 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0090 : Poly :=
[
  term ((-375 : Rat) / 28) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((375 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0090
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0091 : Poly :=
[
  term ((11034037430 : Rat) / 187359291) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 91 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0091 : Poly :=
[
  term ((22068074860 : Rat) / 187359291) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11034037430 : Rat) / 187359291) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0091
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0092 : Poly :=
[
  term ((-46 : Rat) / 7) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0092 : Poly :=
[
  term ((-92 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0092
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0093 : Poly :=
[
  term ((-20318718258600263 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 93 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0093 : Poly :=
[
  term ((-20318718258600263 : Rat) / 13054820678298) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((20318718258600263 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0093
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0094 : Poly :=
[
  term ((71 : Rat) / 14) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0094 : Poly :=
[
  term ((71 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-71 : Rat) / 14) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0094
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0095 : Poly :=
[
  term ((108242905555 : Rat) / 1498874328) [(1, 1), (10, 2), (13, 1)]
]

/-- Partial product 95 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0095 : Poly :=
[
  term ((108242905555 : Rat) / 749437164) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-108242905555 : Rat) / 1498874328) [(1, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0095
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0096 : Poly :=
[
  term ((-115 : Rat) / 28) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 96 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0096 : Poly :=
[
  term ((-115 : Rat) / 14) [(1, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((115 : Rat) / 28) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0096
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0097 : Poly :=
[
  term ((-5517018715 : Rat) / 187359291) [(1, 1), (10, 2), (15, 1)]
]

/-- Partial product 97 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0097 : Poly :=
[
  term ((-11034037430 : Rat) / 187359291) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((5517018715 : Rat) / 187359291) [(1, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0097
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0098 : Poly :=
[
  term ((23 : Rat) / 7) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0098 : Poly :=
[
  term ((46 : Rat) / 7) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-23 : Rat) / 7) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0098
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0099 : Poly :=
[
  term ((3260352132155899 : Rat) / 5802142523688) [(1, 1), (11, 1)]
]

/-- Partial product 99 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0099 : Poly :=
[
  term ((3260352132155899 : Rat) / 2901071261844) [(1, 1), (8, 1), (11, 1)],
  term ((-3260352132155899 : Rat) / 5802142523688) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0099
        rs_R009_ueqv_R009YNNNN_generator_19_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_19_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_19_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_19_0000,
  rs_R009_ueqv_R009YNNNN_partial_19_0001,
  rs_R009_ueqv_R009YNNNN_partial_19_0002,
  rs_R009_ueqv_R009YNNNN_partial_19_0003,
  rs_R009_ueqv_R009YNNNN_partial_19_0004,
  rs_R009_ueqv_R009YNNNN_partial_19_0005,
  rs_R009_ueqv_R009YNNNN_partial_19_0006,
  rs_R009_ueqv_R009YNNNN_partial_19_0007,
  rs_R009_ueqv_R009YNNNN_partial_19_0008,
  rs_R009_ueqv_R009YNNNN_partial_19_0009,
  rs_R009_ueqv_R009YNNNN_partial_19_0010,
  rs_R009_ueqv_R009YNNNN_partial_19_0011,
  rs_R009_ueqv_R009YNNNN_partial_19_0012,
  rs_R009_ueqv_R009YNNNN_partial_19_0013,
  rs_R009_ueqv_R009YNNNN_partial_19_0014,
  rs_R009_ueqv_R009YNNNN_partial_19_0015,
  rs_R009_ueqv_R009YNNNN_partial_19_0016,
  rs_R009_ueqv_R009YNNNN_partial_19_0017,
  rs_R009_ueqv_R009YNNNN_partial_19_0018,
  rs_R009_ueqv_R009YNNNN_partial_19_0019,
  rs_R009_ueqv_R009YNNNN_partial_19_0020,
  rs_R009_ueqv_R009YNNNN_partial_19_0021,
  rs_R009_ueqv_R009YNNNN_partial_19_0022,
  rs_R009_ueqv_R009YNNNN_partial_19_0023,
  rs_R009_ueqv_R009YNNNN_partial_19_0024,
  rs_R009_ueqv_R009YNNNN_partial_19_0025,
  rs_R009_ueqv_R009YNNNN_partial_19_0026,
  rs_R009_ueqv_R009YNNNN_partial_19_0027,
  rs_R009_ueqv_R009YNNNN_partial_19_0028,
  rs_R009_ueqv_R009YNNNN_partial_19_0029,
  rs_R009_ueqv_R009YNNNN_partial_19_0030,
  rs_R009_ueqv_R009YNNNN_partial_19_0031,
  rs_R009_ueqv_R009YNNNN_partial_19_0032,
  rs_R009_ueqv_R009YNNNN_partial_19_0033,
  rs_R009_ueqv_R009YNNNN_partial_19_0034,
  rs_R009_ueqv_R009YNNNN_partial_19_0035,
  rs_R009_ueqv_R009YNNNN_partial_19_0036,
  rs_R009_ueqv_R009YNNNN_partial_19_0037,
  rs_R009_ueqv_R009YNNNN_partial_19_0038,
  rs_R009_ueqv_R009YNNNN_partial_19_0039,
  rs_R009_ueqv_R009YNNNN_partial_19_0040,
  rs_R009_ueqv_R009YNNNN_partial_19_0041,
  rs_R009_ueqv_R009YNNNN_partial_19_0042,
  rs_R009_ueqv_R009YNNNN_partial_19_0043,
  rs_R009_ueqv_R009YNNNN_partial_19_0044,
  rs_R009_ueqv_R009YNNNN_partial_19_0045,
  rs_R009_ueqv_R009YNNNN_partial_19_0046,
  rs_R009_ueqv_R009YNNNN_partial_19_0047,
  rs_R009_ueqv_R009YNNNN_partial_19_0048,
  rs_R009_ueqv_R009YNNNN_partial_19_0049,
  rs_R009_ueqv_R009YNNNN_partial_19_0050,
  rs_R009_ueqv_R009YNNNN_partial_19_0051,
  rs_R009_ueqv_R009YNNNN_partial_19_0052,
  rs_R009_ueqv_R009YNNNN_partial_19_0053,
  rs_R009_ueqv_R009YNNNN_partial_19_0054,
  rs_R009_ueqv_R009YNNNN_partial_19_0055,
  rs_R009_ueqv_R009YNNNN_partial_19_0056,
  rs_R009_ueqv_R009YNNNN_partial_19_0057,
  rs_R009_ueqv_R009YNNNN_partial_19_0058,
  rs_R009_ueqv_R009YNNNN_partial_19_0059,
  rs_R009_ueqv_R009YNNNN_partial_19_0060,
  rs_R009_ueqv_R009YNNNN_partial_19_0061,
  rs_R009_ueqv_R009YNNNN_partial_19_0062,
  rs_R009_ueqv_R009YNNNN_partial_19_0063,
  rs_R009_ueqv_R009YNNNN_partial_19_0064,
  rs_R009_ueqv_R009YNNNN_partial_19_0065,
  rs_R009_ueqv_R009YNNNN_partial_19_0066,
  rs_R009_ueqv_R009YNNNN_partial_19_0067,
  rs_R009_ueqv_R009YNNNN_partial_19_0068,
  rs_R009_ueqv_R009YNNNN_partial_19_0069,
  rs_R009_ueqv_R009YNNNN_partial_19_0070,
  rs_R009_ueqv_R009YNNNN_partial_19_0071,
  rs_R009_ueqv_R009YNNNN_partial_19_0072,
  rs_R009_ueqv_R009YNNNN_partial_19_0073,
  rs_R009_ueqv_R009YNNNN_partial_19_0074,
  rs_R009_ueqv_R009YNNNN_partial_19_0075,
  rs_R009_ueqv_R009YNNNN_partial_19_0076,
  rs_R009_ueqv_R009YNNNN_partial_19_0077,
  rs_R009_ueqv_R009YNNNN_partial_19_0078,
  rs_R009_ueqv_R009YNNNN_partial_19_0079,
  rs_R009_ueqv_R009YNNNN_partial_19_0080,
  rs_R009_ueqv_R009YNNNN_partial_19_0081,
  rs_R009_ueqv_R009YNNNN_partial_19_0082,
  rs_R009_ueqv_R009YNNNN_partial_19_0083,
  rs_R009_ueqv_R009YNNNN_partial_19_0084,
  rs_R009_ueqv_R009YNNNN_partial_19_0085,
  rs_R009_ueqv_R009YNNNN_partial_19_0086,
  rs_R009_ueqv_R009YNNNN_partial_19_0087,
  rs_R009_ueqv_R009YNNNN_partial_19_0088,
  rs_R009_ueqv_R009YNNNN_partial_19_0089,
  rs_R009_ueqv_R009YNNNN_partial_19_0090,
  rs_R009_ueqv_R009YNNNN_partial_19_0091,
  rs_R009_ueqv_R009YNNNN_partial_19_0092,
  rs_R009_ueqv_R009YNNNN_partial_19_0093,
  rs_R009_ueqv_R009YNNNN_partial_19_0094,
  rs_R009_ueqv_R009YNNNN_partial_19_0095,
  rs_R009_ueqv_R009YNNNN_partial_19_0096,
  rs_R009_ueqv_R009YNNNN_partial_19_0097,
  rs_R009_ueqv_R009YNNNN_partial_19_0098,
  rs_R009_ueqv_R009YNNNN_partial_19_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_19_0000_0099 : Poly :=
[
  term ((32624798807292329 : Rat) / 208877130852768) [],
  term ((-753222717676 : Rat) / 14801383989) [(0, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1)],
  term ((45864690786755 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (8, 1)],
  term ((84986436597142 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1)],
  term ((-169972873194284 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (8, 1)],
  term ((1096961875165 : Rat) / 1498874328) [(0, 1), (1, 1), (8, 1), (9, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (1, 1), (8, 1), (11, 1)],
  term ((-14716162540349 : Rat) / 19735178652) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((585 : Rat) / 14) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)],
  term ((1024724631852086 : Rat) / 725267815461) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((-242 : Rat) / 7) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (11, 1)],
  term ((14716162540349 : Rat) / 39470357304) [(0, 1), (1, 1), (13, 1)],
  term ((-585 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-512362315926043 : Rat) / 725267815461) [(0, 1), (1, 1), (15, 1)],
  term ((121 : Rat) / 7) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-320 : Rat) / 63) [(0, 1), (2, 1)],
  term ((640 : Rat) / 63) [(0, 1), (2, 1), (8, 1)],
  term ((3457649416338352 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1)],
  term ((-6915298832676704 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1), (8, 1)],
  term ((-8121862279687 : Rat) / 6744934476) [(0, 1), (3, 1), (8, 1), (9, 1)],
  term ((1068637148240579 : Rat) / 2175803446383) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((333576329821813 : Rat) / 266424911802) [(0, 1), (3, 1), (8, 1), (13, 1)],
  term ((-505 : Rat) / 21) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3032244911942206 : Rat) / 2175803446383) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term ((388 : Rat) / 21) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (9, 1)],
  term ((-1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (13, 1)],
  term ((505 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term ((1516122455971103 : Rat) / 2175803446383) [(0, 1), (3, 1), (15, 1)],
  term ((-194 : Rat) / 21) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2)],
  term ((1107240197953805 : Rat) / 6527410339149) [(0, 1), (3, 2), (8, 1)],
  term ((7660998914045 : Rat) / 241755938487) [(0, 1), (6, 1)],
  term ((-15321997828090 : Rat) / 241755938487) [(0, 1), (6, 1), (8, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (7, 1), (8, 1), (9, 1)],
  term ((-3912526023541778 : Rat) / 2175803446383) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((6751967453434339 : Rat) / 2175803446383) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((32 : Rat) / 3) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(0, 1), (7, 1), (9, 1)],
  term ((1956263011770889 : Rat) / 2175803446383) [(0, 1), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(0, 1), (7, 1), (13, 1)],
  term ((85 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((-6751967453434339 : Rat) / 4351606892766) [(0, 1), (7, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(0, 1), (7, 2)],
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (7, 2), (8, 1)],
  term ((5892167801312 : Rat) / 44404151967) [(0, 1), (8, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3064976645263 : Rat) / 8993245968) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((249803199295 : Rat) / 374718582) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((-7887264492523 : Rat) / 5995497312) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((10128353936477537 : Rat) / 8703213785532) [(0, 1), (8, 1), (10, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((115 : Rat) / 14) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((11034037430 : Rat) / 187359291) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22068074860 : Rat) / 187359291) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((92 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((16909914029131 : Rat) / 50747602248) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-465 : Rat) / 28) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-574375153398001 : Rat) / 4351606892766) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((97 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (8, 1), (11, 2)],
  term ((-18615854345 : Rat) / 26765613) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term (46 : Rat) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (8, 1), (12, 1), (13, 2)],
  term ((-115 : Rat) / 7) [(0, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((44136149720 : Rat) / 187359291) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-184 : Rat) / 7) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((395858485272353 : Rat) / 236822143824) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-159 : Rat) / 56) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (8, 1), (13, 2)],
  term ((10 : Rat) / 7) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-5196068507256523 : Rat) / 8703213785532) [(0, 1), (8, 1), (14, 1)],
  term ((-2489339290629473 : Rat) / 967023753948) [(0, 1), (8, 1), (15, 2)],
  term ((-17 : Rat) / 14) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-34755227728 : Rat) / 562077873) [(0, 1), (8, 2)],
  term ((-249803199295 : Rat) / 2997748656) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((3064976645263 : Rat) / 17986491936) [(0, 1), (9, 1), (11, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1)],
  term ((7887264492523 : Rat) / 11990994624) [(0, 1), (9, 1), (15, 1)],
  term ((-10128353936477537 : Rat) / 17406427571064) [(0, 1), (10, 1)],
  term ((108242905555 : Rat) / 1498874328) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-115 : Rat) / 28) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5517018715 : Rat) / 187359291) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((23 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((115 : Rat) / 14) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11034037430 : Rat) / 187359291) [(0, 1), (10, 1), (15, 2)],
  term ((-46 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-16909914029131 : Rat) / 101495204496) [(0, 1), (11, 1), (13, 1)],
  term ((465 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((574375153398001 : Rat) / 8703213785532) [(0, 1), (11, 1), (15, 1)],
  term ((-97 : Rat) / 14) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(0, 1), (11, 2)],
  term ((18615854345 : Rat) / 53531226) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term (-23 : Rat) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (12, 1), (13, 2)],
  term ((115 : Rat) / 14) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-22068074860 : Rat) / 187359291) [(0, 1), (12, 1), (15, 2)],
  term ((92 : Rat) / 7) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-395858485272353 : Rat) / 473644287648) [(0, 1), (13, 1), (15, 1)],
  term ((159 : Rat) / 112) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (13, 2)],
  term ((-5 : Rat) / 7) [(0, 1), (13, 2), (16, 1)],
  term ((5196068507256523 : Rat) / 17406427571064) [(0, 1), (14, 1)],
  term ((2489339290629473 : Rat) / 1934047507896) [(0, 1), (15, 2)],
  term ((17 : Rat) / 28) [(0, 1), (15, 2), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (7, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(1, 1), (2, 1), (7, 1), (8, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (15, 1)],
  term ((1505101399578125 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1)],
  term ((-1505101399578125 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (8, 1)],
  term ((-90071490967235 : Rat) / 2175803446383) [(1, 1), (3, 1), (8, 1), (10, 1)],
  term ((2101893202014605 : Rat) / 19582231017447) [(1, 1), (3, 1), (8, 1), (14, 1)],
  term ((90071490967235 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1)],
  term ((-2101893202014605 : Rat) / 39164462034894) [(1, 1), (3, 1), (14, 1)],
  term ((8192672238679723 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (8, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((29986839311587099 : Rat) / 13054820678298) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-18055526872671782 : Rat) / 19582231017447) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-18707993583637175 : Rat) / 13054820678298) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-29986839311587099 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((9027763436335891 : Rat) / 19582231017447) [(1, 1), (6, 1), (13, 1)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((18707993583637175 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((1622396964599701 : Rat) / 13054820678298) [(1, 1), (7, 1)],
  term ((-1622396964599701 : Rat) / 6527410339149) [(1, 1), (7, 1), (8, 1)],
  term ((2311886866863751 : Rat) / 6527410339149) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((16031001116740507 : Rat) / 6527410339149) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((-2311886866863751 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1)],
  term ((-16031001116740507 : Rat) / 13054820678298) [(1, 1), (7, 1), (14, 1)],
  term ((-10861008665 : Rat) / 166541592) [(1, 1), (8, 1), (9, 1)],
  term ((-5745473583785 : Rat) / 8993245968) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((249803199295 : Rat) / 749437164) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((-1305493241533 : Rat) / 4496622984) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((-127671156857075 : Rat) / 161878427424) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((242605845302939 : Rat) / 355233215736) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-6648950989536007 : Rat) / 13054820678298) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((115 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-375 : Rat) / 28) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((22068074860 : Rat) / 187359291) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20318718258600263 : Rat) / 13054820678298) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((71 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((108242905555 : Rat) / 749437164) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-115 : Rat) / 14) [(1, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-11034037430 : Rat) / 187359291) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((46 : Rat) / 7) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((3260352132155899 : Rat) / 2901071261844) [(1, 1), (8, 1), (11, 1)],
  term ((10861008665 : Rat) / 333083184) [(1, 1), (9, 1)],
  term ((5745473583785 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((249803199295 : Rat) / 2997748656) [(1, 1), (9, 1), (10, 2)],
  term ((1305493241533 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 1)],
  term ((127671156857075 : Rat) / 323756854848) [(1, 1), (9, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1)],
  term ((-242605845302939 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1)],
  term ((6648950989536007 : Rat) / 26109641356596) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-115 : Rat) / 14) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((375 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-11034037430 : Rat) / 187359291) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((46 : Rat) / 7) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((20318718258600263 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 1)],
  term ((-71 : Rat) / 14) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-108242905555 : Rat) / 1498874328) [(1, 1), (10, 2), (13, 1)],
  term ((115 : Rat) / 28) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((5517018715 : Rat) / 187359291) [(1, 1), (10, 2), (15, 1)],
  term ((-23 : Rat) / 7) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3260352132155899 : Rat) / 5802142523688) [(1, 1), (11, 1)],
  term ((-32624798807292329 : Rat) / 104438565426384) [(8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_19_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_19_0000_0099
      rs_R009_ueqv_R009YNNNN_block_19_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
