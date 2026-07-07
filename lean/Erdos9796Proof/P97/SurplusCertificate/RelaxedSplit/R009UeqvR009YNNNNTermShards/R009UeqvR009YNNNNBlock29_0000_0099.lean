/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 29:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0000 : Poly :=
[
  term ((15252936479749783 : Rat) / 52219282713192) []
]

/-- Partial product 0 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0000 : Poly :=
[
  term ((-15252936479749783 : Rat) / 26109641356596) [(0, 1), (14, 1)],
  term ((15252936479749783 : Rat) / 52219282713192) [(0, 2)],
  term ((-15252936479749783 : Rat) / 26109641356596) [(1, 1), (15, 1)],
  term ((15252936479749783 : Rat) / 52219282713192) [(1, 2)],
  term ((15252936479749783 : Rat) / 26109641356596) [(2, 1), (14, 1)],
  term ((-15252936479749783 : Rat) / 52219282713192) [(2, 2)],
  term ((15252936479749783 : Rat) / 26109641356596) [(3, 1), (15, 1)],
  term ((-15252936479749783 : Rat) / 52219282713192) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0000
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0001 : Poly :=
[
  term ((788621427225340 : Rat) / 6527410339149) [(0, 1)]
]

/-- Partial product 1 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0001 : Poly :=
[
  term ((-1577242854450680 : Rat) / 6527410339149) [(0, 1), (1, 1), (15, 1)],
  term ((788621427225340 : Rat) / 6527410339149) [(0, 1), (1, 2)],
  term ((1577242854450680 : Rat) / 6527410339149) [(0, 1), (2, 1), (14, 1)],
  term ((-788621427225340 : Rat) / 6527410339149) [(0, 1), (2, 2)],
  term ((1577242854450680 : Rat) / 6527410339149) [(0, 1), (3, 1), (15, 1)],
  term ((-788621427225340 : Rat) / 6527410339149) [(0, 1), (3, 2)],
  term ((-1577242854450680 : Rat) / 6527410339149) [(0, 2), (14, 1)],
  term ((788621427225340 : Rat) / 6527410339149) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0001
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0002 : Poly :=
[
  term ((9618078051221123 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0002 : Poly :=
[
  term ((9618078051221123 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-9618078051221123 : Rat) / 52219282713192) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((9618078051221123 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-9618078051221123 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 3)],
  term ((-9618078051221123 : Rat) / 26109641356596) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((9618078051221123 : Rat) / 52219282713192) [(0, 1), (1, 3), (3, 1)],
  term ((-9618078051221123 : Rat) / 26109641356596) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((9618078051221123 : Rat) / 52219282713192) [(0, 3), (1, 1), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0002
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0003 : Poly :=
[
  term ((-1415030821112827 : Rat) / 8703213785532) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 3 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0003 : Poly :=
[
  term ((-1415030821112827 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1)],
  term ((1415030821112827 : Rat) / 8703213785532) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((-1415030821112827 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((1415030821112827 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((1415030821112827 : Rat) / 4351606892766) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-1415030821112827 : Rat) / 8703213785532) [(0, 1), (1, 3), (7, 1)],
  term ((1415030821112827 : Rat) / 4351606892766) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((-1415030821112827 : Rat) / 8703213785532) [(0, 3), (1, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0003
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0004 : Poly :=
[
  term ((4290098422675 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 4 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0004 : Poly :=
[
  term ((4290098422675 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-4290098422675 : Rat) / 26979737904) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((4290098422675 : Rat) / 13489868952) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-4290098422675 : Rat) / 26979737904) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-4290098422675 : Rat) / 13489868952) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((4290098422675 : Rat) / 26979737904) [(0, 1), (1, 3), (9, 1)],
  term ((-4290098422675 : Rat) / 13489868952) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((4290098422675 : Rat) / 26979737904) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0004
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0005 : Poly :=
[
  term ((407632441893949 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 5 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0005 : Poly :=
[
  term ((407632441893949 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-407632441893949 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((407632441893949 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-407632441893949 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-407632441893949 : Rat) / 2175803446383) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((407632441893949 : Rat) / 4351606892766) [(0, 1), (1, 3), (11, 1)],
  term ((-407632441893949 : Rat) / 2175803446383) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((407632441893949 : Rat) / 4351606892766) [(0, 3), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0005
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0006 : Poly :=
[
  term ((-172719264922777 : Rat) / 1065699647208) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 6 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0006 : Poly :=
[
  term ((-172719264922777 : Rat) / 532849823604) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)],
  term ((172719264922777 : Rat) / 1065699647208) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-172719264922777 : Rat) / 532849823604) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((172719264922777 : Rat) / 1065699647208) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((172719264922777 : Rat) / 532849823604) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-172719264922777 : Rat) / 1065699647208) [(0, 1), (1, 3), (13, 1)],
  term ((172719264922777 : Rat) / 532849823604) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-172719264922777 : Rat) / 1065699647208) [(0, 3), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0006
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0007 : Poly :=
[
  term ((925 : Rat) / 84) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0007 : Poly :=
[
  term ((925 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-925 : Rat) / 84) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((925 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-925 : Rat) / 84) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-925 : Rat) / 42) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((925 : Rat) / 84) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term ((-925 : Rat) / 42) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((925 : Rat) / 84) [(0, 3), (1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0007
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0008 : Poly :=
[
  term ((-221606511510779 : Rat) / 2486632510152) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 8 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0008 : Poly :=
[
  term ((-221606511510779 : Rat) / 1243316255076) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((221606511510779 : Rat) / 2486632510152) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-221606511510779 : Rat) / 1243316255076) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((221606511510779 : Rat) / 2486632510152) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((221606511510779 : Rat) / 1243316255076) [(0, 1), (1, 2), (15, 2)],
  term ((-221606511510779 : Rat) / 2486632510152) [(0, 1), (1, 3), (15, 1)],
  term ((221606511510779 : Rat) / 1243316255076) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-221606511510779 : Rat) / 2486632510152) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0008
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0009 : Poly :=
[
  term ((-193 : Rat) / 21) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0009 : Poly :=
[
  term ((-386 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((193 : Rat) / 21) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-386 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((193 : Rat) / 21) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((386 : Rat) / 21) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-193 : Rat) / 21) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((386 : Rat) / 21) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-193 : Rat) / 21) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0009
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0010 : Poly :=
[
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2)]
]

/-- Partial product 10 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0010 : Poly :=
[
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 1), (14, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 2)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (3, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (15, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 4)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 3), (1, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0010
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0011 : Poly :=
[
  term ((115215333378687515 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 11 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0011 : Poly :=
[
  term ((-115215333378687515 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((115215333378687515 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((115215333378687515 : Rat) / 26109641356596) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-115215333378687515 : Rat) / 52219282713192) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((115215333378687515 : Rat) / 26109641356596) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-115215333378687515 : Rat) / 52219282713192) [(0, 1), (3, 3), (7, 1)],
  term ((-115215333378687515 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((115215333378687515 : Rat) / 52219282713192) [(0, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0011
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0012 : Poly :=
[
  term ((1083928664767 : Rat) / 2569498848) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 12 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0012 : Poly :=
[
  term ((-1083928664767 : Rat) / 1284749424) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((1083928664767 : Rat) / 2569498848) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((1083928664767 : Rat) / 1284749424) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-1083928664767 : Rat) / 2569498848) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((1083928664767 : Rat) / 1284749424) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-1083928664767 : Rat) / 2569498848) [(0, 1), (3, 3), (9, 1)],
  term ((-1083928664767 : Rat) / 1284749424) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((1083928664767 : Rat) / 2569498848) [(0, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0012
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0013 : Poly :=
[
  term ((-57708637489738159 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 13 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0013 : Poly :=
[
  term ((57708637489738159 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-57708637489738159 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-57708637489738159 : Rat) / 26109641356596) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((57708637489738159 : Rat) / 52219282713192) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-57708637489738159 : Rat) / 26109641356596) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((57708637489738159 : Rat) / 52219282713192) [(0, 1), (3, 3), (11, 1)],
  term ((57708637489738159 : Rat) / 26109641356596) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-57708637489738159 : Rat) / 52219282713192) [(0, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0013
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0014 : Poly :=
[
  term ((-295491384565579 : Rat) / 710466431472) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 14 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0014 : Poly :=
[
  term ((295491384565579 : Rat) / 355233215736) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-295491384565579 : Rat) / 710466431472) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-295491384565579 : Rat) / 355233215736) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((295491384565579 : Rat) / 710466431472) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-295491384565579 : Rat) / 355233215736) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((295491384565579 : Rat) / 710466431472) [(0, 1), (3, 3), (13, 1)],
  term ((295491384565579 : Rat) / 355233215736) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-295491384565579 : Rat) / 710466431472) [(0, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0014
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0015 : Poly :=
[
  term ((1095 : Rat) / 56) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0015 : Poly :=
[
  term ((-1095 : Rat) / 28) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((1095 : Rat) / 56) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((1095 : Rat) / 28) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1095 : Rat) / 56) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((1095 : Rat) / 28) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1095 : Rat) / 56) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((-1095 : Rat) / 28) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1095 : Rat) / 56) [(0, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0015
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0016 : Poly :=
[
  term ((42216658949275829 : Rat) / 52219282713192) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 16 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0016 : Poly :=
[
  term ((-42216658949275829 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((42216658949275829 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((42216658949275829 : Rat) / 26109641356596) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-42216658949275829 : Rat) / 52219282713192) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((42216658949275829 : Rat) / 26109641356596) [(0, 1), (3, 2), (15, 2)],
  term ((-42216658949275829 : Rat) / 52219282713192) [(0, 1), (3, 3), (15, 1)],
  term ((-42216658949275829 : Rat) / 26109641356596) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((42216658949275829 : Rat) / 52219282713192) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0016
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0017 : Poly :=
[
  term ((-223 : Rat) / 14) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0017 : Poly :=
[
  term ((223 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-223 : Rat) / 14) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-223 : Rat) / 7) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((223 : Rat) / 14) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-223 : Rat) / 7) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((223 : Rat) / 14) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((223 : Rat) / 7) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-223 : Rat) / 14) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0017
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0018 : Poly :=
[
  term ((-13518058438706705 : Rat) / 17406427571064) [(0, 1), (3, 2)]
]

/-- Partial product 18 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0018 : Poly :=
[
  term ((13518058438706705 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-13518058438706705 : Rat) / 17406427571064) [(0, 1), (1, 2), (3, 2)],
  term ((-13518058438706705 : Rat) / 8703213785532) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((13518058438706705 : Rat) / 17406427571064) [(0, 1), (2, 2), (3, 2)],
  term ((-13518058438706705 : Rat) / 8703213785532) [(0, 1), (3, 3), (15, 1)],
  term ((13518058438706705 : Rat) / 17406427571064) [(0, 1), (3, 4)],
  term ((13518058438706705 : Rat) / 8703213785532) [(0, 2), (3, 2), (14, 1)],
  term ((-13518058438706705 : Rat) / 17406427571064) [(0, 3), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0018
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0019 : Poly :=
[
  term ((-27619545035095 : Rat) / 13489868952) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 19 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0019 : Poly :=
[
  term ((27619545035095 : Rat) / 6744934476) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-27619545035095 : Rat) / 13489868952) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((-27619545035095 : Rat) / 6744934476) [(0, 1), (2, 1), (7, 1), (9, 1), (14, 1)],
  term ((27619545035095 : Rat) / 13489868952) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((-27619545035095 : Rat) / 6744934476) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((27619545035095 : Rat) / 13489868952) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((27619545035095 : Rat) / 6744934476) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((-27619545035095 : Rat) / 13489868952) [(0, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0019
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0020 : Poly :=
[
  term ((23423412091316483 : Rat) / 8703213785532) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 20 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0020 : Poly :=
[
  term ((-23423412091316483 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((23423412091316483 : Rat) / 8703213785532) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((23423412091316483 : Rat) / 4351606892766) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-23423412091316483 : Rat) / 8703213785532) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((23423412091316483 : Rat) / 4351606892766) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-23423412091316483 : Rat) / 8703213785532) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-23423412091316483 : Rat) / 4351606892766) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((23423412091316483 : Rat) / 8703213785532) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0020
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0021 : Poly :=
[
  term ((1119074972569573 : Rat) / 532849823604) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 21 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0021 : Poly :=
[
  term ((-1119074972569573 : Rat) / 266424911802) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((1119074972569573 : Rat) / 532849823604) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((1119074972569573 : Rat) / 266424911802) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1119074972569573 : Rat) / 532849823604) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((1119074972569573 : Rat) / 266424911802) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1119074972569573 : Rat) / 532849823604) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-1119074972569573 : Rat) / 266424911802) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((1119074972569573 : Rat) / 532849823604) [(0, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0021
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0022 : Poly :=
[
  term ((-2785 : Rat) / 42) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 22 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0022 : Poly :=
[
  term ((2785 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2785 : Rat) / 42) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2785 : Rat) / 21) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((2785 : Rat) / 42) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2785 : Rat) / 21) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2785 : Rat) / 42) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((2785 : Rat) / 21) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2785 : Rat) / 42) [(0, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0022
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0023 : Poly :=
[
  term ((-15294781938209561 : Rat) / 5802142523688) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 23 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0023 : Poly :=
[
  term ((15294781938209561 : Rat) / 2901071261844) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((-15294781938209561 : Rat) / 5802142523688) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-15294781938209561 : Rat) / 2901071261844) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((15294781938209561 : Rat) / 5802142523688) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-15294781938209561 : Rat) / 2901071261844) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((15294781938209561 : Rat) / 5802142523688) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((15294781938209561 : Rat) / 2901071261844) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-15294781938209561 : Rat) / 5802142523688) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0023
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0024 : Poly :=
[
  term ((1118 : Rat) / 21) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0024 : Poly :=
[
  term ((-2236 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((1118 : Rat) / 21) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((2236 : Rat) / 21) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1118 : Rat) / 21) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((2236 : Rat) / 21) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1118 : Rat) / 21) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2236 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1118 : Rat) / 21) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0024
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0025 : Poly :=
[
  term ((-9378594870573889 : Rat) / 4351606892766) [(0, 1), (7, 2)]
]

/-- Partial product 25 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0025 : Poly :=
[
  term ((9378594870573889 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((-9378594870573889 : Rat) / 4351606892766) [(0, 1), (1, 2), (7, 2)],
  term ((-9378594870573889 : Rat) / 2175803446383) [(0, 1), (2, 1), (7, 2), (14, 1)],
  term ((9378594870573889 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 2)],
  term ((-9378594870573889 : Rat) / 2175803446383) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((9378594870573889 : Rat) / 4351606892766) [(0, 1), (3, 2), (7, 2)],
  term ((9378594870573889 : Rat) / 2175803446383) [(0, 2), (7, 2), (14, 1)],
  term ((-9378594870573889 : Rat) / 4351606892766) [(0, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0025
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0026 : Poly :=
[
  term ((-21246305150473 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 26 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0026 : Poly :=
[
  term ((21246305150473 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-21246305150473 : Rat) / 53959475808) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-21246305150473 : Rat) / 26979737904) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((21246305150473 : Rat) / 53959475808) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-21246305150473 : Rat) / 26979737904) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((21246305150473 : Rat) / 53959475808) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((21246305150473 : Rat) / 26979737904) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-21246305150473 : Rat) / 53959475808) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0026
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0027 : Poly :=
[
  term ((2465448966955 : Rat) / 13489868952) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 27 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0027 : Poly :=
[
  term ((-2465448966955 : Rat) / 6744934476) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((2465448966955 : Rat) / 13489868952) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((2465448966955 : Rat) / 6744934476) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2465448966955 : Rat) / 13489868952) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((2465448966955 : Rat) / 6744934476) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((-2465448966955 : Rat) / 13489868952) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-2465448966955 : Rat) / 6744934476) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((2465448966955 : Rat) / 13489868952) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0027
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0028 : Poly :=
[
  term ((826808979291835 : Rat) / 2131399294416) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 28 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0028 : Poly :=
[
  term ((-826808979291835 : Rat) / 1065699647208) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((826808979291835 : Rat) / 2131399294416) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((826808979291835 : Rat) / 1065699647208) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-826808979291835 : Rat) / 2131399294416) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((826808979291835 : Rat) / 1065699647208) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-826808979291835 : Rat) / 2131399294416) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-826808979291835 : Rat) / 1065699647208) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((826808979291835 : Rat) / 2131399294416) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0028
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0029 : Poly :=
[
  term ((-2455 : Rat) / 168) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0029 : Poly :=
[
  term ((2455 : Rat) / 84) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2455 : Rat) / 168) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2455 : Rat) / 84) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2455 : Rat) / 168) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2455 : Rat) / 84) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2455 : Rat) / 168) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((2455 : Rat) / 84) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2455 : Rat) / 168) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0029
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0030 : Poly :=
[
  term ((-139108534951591 : Rat) / 828877503384) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 30 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0030 : Poly :=
[
  term ((139108534951591 : Rat) / 414438751692) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-139108534951591 : Rat) / 828877503384) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-139108534951591 : Rat) / 414438751692) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((139108534951591 : Rat) / 828877503384) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-139108534951591 : Rat) / 414438751692) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((139108534951591 : Rat) / 828877503384) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((139108534951591 : Rat) / 414438751692) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-139108534951591 : Rat) / 828877503384) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0030
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0031 : Poly :=
[
  term ((487 : Rat) / 42) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0031 : Poly :=
[
  term ((-487 : Rat) / 21) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((487 : Rat) / 42) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((487 : Rat) / 21) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-487 : Rat) / 42) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((487 : Rat) / 21) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-487 : Rat) / 42) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-487 : Rat) / 21) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((487 : Rat) / 42) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0031
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0032 : Poly :=
[
  term ((-81650386742723 : Rat) / 8703213785532) [(0, 1), (11, 2)]
]

/-- Partial product 32 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0032 : Poly :=
[
  term ((81650386742723 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-81650386742723 : Rat) / 8703213785532) [(0, 1), (1, 2), (11, 2)],
  term ((-81650386742723 : Rat) / 4351606892766) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((81650386742723 : Rat) / 8703213785532) [(0, 1), (2, 2), (11, 2)],
  term ((-81650386742723 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((81650386742723 : Rat) / 8703213785532) [(0, 1), (3, 2), (11, 2)],
  term ((81650386742723 : Rat) / 4351606892766) [(0, 2), (11, 2), (14, 1)],
  term ((-81650386742723 : Rat) / 8703213785532) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0032
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0033 : Poly :=
[
  term ((-92543245239841 : Rat) / 532849823604) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 33 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0033 : Poly :=
[
  term ((92543245239841 : Rat) / 266424911802) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-92543245239841 : Rat) / 532849823604) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-92543245239841 : Rat) / 266424911802) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((92543245239841 : Rat) / 532849823604) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-92543245239841 : Rat) / 266424911802) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((92543245239841 : Rat) / 532849823604) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((92543245239841 : Rat) / 266424911802) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-92543245239841 : Rat) / 532849823604) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0033
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0034 : Poly :=
[
  term ((1165 : Rat) / 42) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0034 : Poly :=
[
  term ((-1165 : Rat) / 21) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1165 : Rat) / 42) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1165 : Rat) / 21) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1165 : Rat) / 42) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1165 : Rat) / 21) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1165 : Rat) / 42) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1165 : Rat) / 21) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1165 : Rat) / 42) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0034
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0035 : Poly :=
[
  term ((-3294374163479327 : Rat) / 13054820678298) [(0, 1), (14, 1)]
]

/-- Partial product 35 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0035 : Poly :=
[
  term ((3294374163479327 : Rat) / 6527410339149) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((-3294374163479327 : Rat) / 13054820678298) [(0, 1), (1, 2), (14, 1)],
  term ((-3294374163479327 : Rat) / 6527410339149) [(0, 1), (2, 1), (14, 2)],
  term ((3294374163479327 : Rat) / 13054820678298) [(0, 1), (2, 2), (14, 1)],
  term ((-3294374163479327 : Rat) / 6527410339149) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((3294374163479327 : Rat) / 13054820678298) [(0, 1), (3, 2), (14, 1)],
  term ((3294374163479327 : Rat) / 6527410339149) [(0, 2), (14, 2)],
  term ((-3294374163479327 : Rat) / 13054820678298) [(0, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0035
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0036 : Poly :=
[
  term ((8188886026951829 : Rat) / 26109641356596) [(0, 1), (15, 2)]
]

/-- Partial product 36 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0036 : Poly :=
[
  term ((-8188886026951829 : Rat) / 13054820678298) [(0, 1), (1, 1), (15, 3)],
  term ((8188886026951829 : Rat) / 26109641356596) [(0, 1), (1, 2), (15, 2)],
  term ((8188886026951829 : Rat) / 13054820678298) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-8188886026951829 : Rat) / 26109641356596) [(0, 1), (2, 2), (15, 2)],
  term ((8188886026951829 : Rat) / 13054820678298) [(0, 1), (3, 1), (15, 3)],
  term ((-8188886026951829 : Rat) / 26109641356596) [(0, 1), (3, 2), (15, 2)],
  term ((-8188886026951829 : Rat) / 13054820678298) [(0, 2), (14, 1), (15, 2)],
  term ((8188886026951829 : Rat) / 26109641356596) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0036
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0037 : Poly :=
[
  term ((-494 : Rat) / 21) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0037 : Poly :=
[
  term ((988 : Rat) / 21) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-494 : Rat) / 21) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-988 : Rat) / 21) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 21) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-988 : Rat) / 21) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((494 : Rat) / 21) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((988 : Rat) / 21) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-494 : Rat) / 21) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0037
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0038 : Poly :=
[
  term ((-10862912321535193 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 38 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0038 : Poly :=
[
  term ((10862912321535193 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-10862912321535193 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((-10862912321535193 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((10862912321535193 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 3)],
  term ((-10862912321535193 : Rat) / 26109641356596) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((10862912321535193 : Rat) / 52219282713192) [(1, 1), (2, 3), (3, 1)],
  term ((10862912321535193 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-10862912321535193 : Rat) / 52219282713192) [(1, 3), (2, 1), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0038
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0039 : Poly :=
[
  term ((1825255152115579 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 39 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0039 : Poly :=
[
  term ((-1825255152115579 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1)],
  term ((1825255152115579 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((1825255152115579 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-1825255152115579 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((1825255152115579 : Rat) / 26109641356596) [(1, 1), (2, 2), (7, 1), (14, 1)],
  term ((-1825255152115579 : Rat) / 52219282713192) [(1, 1), (2, 3), (7, 1)],
  term ((-1825255152115579 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((1825255152115579 : Rat) / 52219282713192) [(1, 3), (2, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0039
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0040 : Poly :=
[
  term ((-2217817969393 : Rat) / 53959475808) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 40 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0040 : Poly :=
[
  term ((2217817969393 : Rat) / 26979737904) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-2217817969393 : Rat) / 53959475808) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term ((-2217817969393 : Rat) / 26979737904) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((2217817969393 : Rat) / 53959475808) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-2217817969393 : Rat) / 26979737904) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((2217817969393 : Rat) / 53959475808) [(1, 1), (2, 3), (9, 1)],
  term ((2217817969393 : Rat) / 26979737904) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-2217817969393 : Rat) / 53959475808) [(1, 3), (2, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0040
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0041 : Poly :=
[
  term ((10796791712760385 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 41 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0041 : Poly :=
[
  term ((-10796791712760385 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((10796791712760385 : Rat) / 26109641356596) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((10796791712760385 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-10796791712760385 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((10796791712760385 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-10796791712760385 : Rat) / 26109641356596) [(1, 1), (2, 3), (11, 1)],
  term ((-10796791712760385 : Rat) / 13054820678298) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((10796791712760385 : Rat) / 26109641356596) [(1, 3), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0041
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0042 : Poly :=
[
  term ((72092317645171 : Rat) / 2131399294416) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 42 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0042 : Poly :=
[
  term ((-72092317645171 : Rat) / 1065699647208) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)],
  term ((72092317645171 : Rat) / 2131399294416) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((72092317645171 : Rat) / 1065699647208) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-72092317645171 : Rat) / 2131399294416) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((72092317645171 : Rat) / 1065699647208) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((-72092317645171 : Rat) / 2131399294416) [(1, 1), (2, 3), (13, 1)],
  term ((-72092317645171 : Rat) / 1065699647208) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((72092317645171 : Rat) / 2131399294416) [(1, 3), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0042
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0043 : Poly :=
[
  term ((-1615 : Rat) / 168) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0043 : Poly :=
[
  term ((1615 : Rat) / 84) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1615 : Rat) / 168) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-1615 : Rat) / 84) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((1615 : Rat) / 168) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-1615 : Rat) / 84) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((1615 : Rat) / 168) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((1615 : Rat) / 84) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1615 : Rat) / 168) [(1, 3), (2, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0043
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0044 : Poly :=
[
  term ((12066135967554937 : Rat) / 26109641356596) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 44 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0044 : Poly :=
[
  term ((-12066135967554937 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((12066135967554937 : Rat) / 26109641356596) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((12066135967554937 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-12066135967554937 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((12066135967554937 : Rat) / 13054820678298) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-12066135967554937 : Rat) / 26109641356596) [(1, 1), (2, 3), (15, 1)],
  term ((-12066135967554937 : Rat) / 13054820678298) [(1, 2), (2, 1), (15, 2)],
  term ((12066135967554937 : Rat) / 26109641356596) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0044
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0045 : Poly :=
[
  term ((49 : Rat) / 6) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0045 : Poly :=
[
  term ((-49 : Rat) / 3) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((49 : Rat) / 6) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((49 : Rat) / 3) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-49 : Rat) / 6) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((49 : Rat) / 3) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-49 : Rat) / 6) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-49 : Rat) / 3) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((49 : Rat) / 6) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0045
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0046 : Poly :=
[
  term ((922649885837051 : Rat) / 8703213785532) [(1, 1), (3, 1)]
]

/-- Partial product 46 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0046 : Poly :=
[
  term ((-922649885837051 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((922649885837051 : Rat) / 8703213785532) [(0, 2), (1, 1), (3, 1)],
  term ((922649885837051 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-922649885837051 : Rat) / 8703213785532) [(1, 1), (2, 2), (3, 1)],
  term ((922649885837051 : Rat) / 4351606892766) [(1, 1), (3, 2), (15, 1)],
  term ((-922649885837051 : Rat) / 8703213785532) [(1, 1), (3, 3)],
  term ((-922649885837051 : Rat) / 4351606892766) [(1, 2), (3, 1), (15, 1)],
  term ((922649885837051 : Rat) / 8703213785532) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0046
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0047 : Poly :=
[
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 47 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0047 : Poly :=
[
  term ((556087218462152 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (6, 1), (14, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((-556087218462152 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((-556087218462152 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 1), (3, 3), (6, 1)],
  term ((556087218462152 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 3), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0047
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0048 : Poly :=
[
  term ((-1415552839535231 : Rat) / 52219282713192) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 48 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0048 : Poly :=
[
  term ((1415552839535231 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-1415552839535231 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((-1415552839535231 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)],
  term ((1415552839535231 : Rat) / 52219282713192) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((-1415552839535231 : Rat) / 26109641356596) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((1415552839535231 : Rat) / 52219282713192) [(1, 1), (3, 3), (10, 1)],
  term ((1415552839535231 : Rat) / 26109641356596) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-1415552839535231 : Rat) / 52219282713192) [(1, 3), (3, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0048
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0049 : Poly :=
[
  term ((-31017977519966095 : Rat) / 156657848139576) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 49 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0049 : Poly :=
[
  term ((31017977519966095 : Rat) / 78328924069788) [(0, 1), (1, 1), (3, 1), (14, 2)],
  term ((-31017977519966095 : Rat) / 156657848139576) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-31017977519966095 : Rat) / 78328924069788) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((31017977519966095 : Rat) / 156657848139576) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-31017977519966095 : Rat) / 78328924069788) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((31017977519966095 : Rat) / 156657848139576) [(1, 1), (3, 3), (14, 1)],
  term ((31017977519966095 : Rat) / 78328924069788) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-31017977519966095 : Rat) / 156657848139576) [(1, 3), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0049
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0050 : Poly :=
[
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 50 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0050 : Poly :=
[
  term ((-3990050839829666 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (14, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((3990050839829666 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((3990050839829666 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((-3990050839829666 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0050
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0051 : Poly :=
[
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 51 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0051 : Poly :=
[
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0051
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0052 : Poly :=
[
  term ((-306629898617197 : Rat) / 3729948765228) [(1, 1), (7, 1)]
]

/-- Partial product 52 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0052 : Poly :=
[
  term ((306629898617197 : Rat) / 1864974382614) [(0, 1), (1, 1), (7, 1), (14, 1)],
  term ((-306629898617197 : Rat) / 3729948765228) [(0, 2), (1, 1), (7, 1)],
  term ((-306629898617197 : Rat) / 1864974382614) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term ((306629898617197 : Rat) / 3729948765228) [(1, 1), (2, 2), (7, 1)],
  term ((-306629898617197 : Rat) / 1864974382614) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((306629898617197 : Rat) / 3729948765228) [(1, 1), (3, 2), (7, 1)],
  term ((306629898617197 : Rat) / 1864974382614) [(1, 2), (7, 1), (15, 1)],
  term ((-306629898617197 : Rat) / 3729948765228) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0052
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0053 : Poly :=
[
  term ((-144406663694840 : Rat) / 932487191307) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 53 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0053 : Poly :=
[
  term ((288813327389680 : Rat) / 932487191307) [(0, 1), (1, 1), (7, 1), (10, 1), (14, 1)],
  term ((-144406663694840 : Rat) / 932487191307) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((-288813327389680 : Rat) / 932487191307) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1)],
  term ((144406663694840 : Rat) / 932487191307) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((-288813327389680 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((144406663694840 : Rat) / 932487191307) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((288813327389680 : Rat) / 932487191307) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-144406663694840 : Rat) / 932487191307) [(1, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0053
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0054 : Poly :=
[
  term ((59689906938890213 : Rat) / 52219282713192) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 54 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0054 : Poly :=
[
  term ((-59689906938890213 : Rat) / 26109641356596) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term ((59689906938890213 : Rat) / 52219282713192) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((59689906938890213 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((-59689906938890213 : Rat) / 52219282713192) [(1, 1), (2, 2), (7, 1), (14, 1)],
  term ((59689906938890213 : Rat) / 26109641356596) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-59689906938890213 : Rat) / 52219282713192) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((-59689906938890213 : Rat) / 26109641356596) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((59689906938890213 : Rat) / 52219282713192) [(1, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0054
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0055 : Poly :=
[
  term ((-310624847819 : Rat) / 4496622984) [(1, 1), (9, 1)]
]

/-- Partial product 55 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0055 : Poly :=
[
  term ((310624847819 : Rat) / 2248311492) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term ((-310624847819 : Rat) / 4496622984) [(0, 2), (1, 1), (9, 1)],
  term ((-310624847819 : Rat) / 2248311492) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((310624847819 : Rat) / 4496622984) [(1, 1), (2, 2), (9, 1)],
  term ((-310624847819 : Rat) / 2248311492) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((310624847819 : Rat) / 4496622984) [(1, 1), (3, 2), (9, 1)],
  term ((310624847819 : Rat) / 2248311492) [(1, 2), (9, 1), (15, 1)],
  term ((-310624847819 : Rat) / 4496622984) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0055
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0056 : Poly :=
[
  term ((8117517876221 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 56 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0056 : Poly :=
[
  term ((-8117517876221 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((8117517876221 : Rat) / 17986491936) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((8117517876221 : Rat) / 8993245968) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1)],
  term ((-8117517876221 : Rat) / 17986491936) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((8117517876221 : Rat) / 8993245968) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-8117517876221 : Rat) / 17986491936) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((-8117517876221 : Rat) / 8993245968) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((8117517876221 : Rat) / 17986491936) [(1, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0056
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0057 : Poly :=
[
  term ((-603872081774 : Rat) / 722671551) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 57 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0057 : Poly :=
[
  term ((1207744163548 : Rat) / 722671551) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-603872081774 : Rat) / 722671551) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((-1207744163548 : Rat) / 722671551) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((603872081774 : Rat) / 722671551) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((-1207744163548 : Rat) / 722671551) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((603872081774 : Rat) / 722671551) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((1207744163548 : Rat) / 722671551) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-603872081774 : Rat) / 722671551) [(1, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0057
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0058 : Poly :=
[
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 58 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0058 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(1, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0058
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0059 : Poly :=
[
  term ((-328288306993943 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 59 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0059 : Poly :=
[
  term ((328288306993943 : Rat) / 355233215736) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-328288306993943 : Rat) / 710466431472) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((-328288306993943 : Rat) / 355233215736) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1)],
  term ((328288306993943 : Rat) / 710466431472) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((-328288306993943 : Rat) / 355233215736) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((328288306993943 : Rat) / 710466431472) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((328288306993943 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-328288306993943 : Rat) / 710466431472) [(1, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0059
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0060 : Poly :=
[
  term ((165 : Rat) / 8) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 60 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0060 : Poly :=
[
  term ((-165 : Rat) / 4) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((165 : Rat) / 8) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((165 : Rat) / 4) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-165 : Rat) / 8) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((165 : Rat) / 4) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-165 : Rat) / 8) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-165 : Rat) / 4) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((165 : Rat) / 8) [(1, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0060
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0061 : Poly :=
[
  term ((40455478956927709 : Rat) / 52219282713192) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 61 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0061 : Poly :=
[
  term ((-40455478956927709 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((40455478956927709 : Rat) / 52219282713192) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((40455478956927709 : Rat) / 26109641356596) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((-40455478956927709 : Rat) / 52219282713192) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((40455478956927709 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-40455478956927709 : Rat) / 52219282713192) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-40455478956927709 : Rat) / 26109641356596) [(1, 2), (10, 1), (15, 2)],
  term ((40455478956927709 : Rat) / 52219282713192) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0061
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0062 : Poly :=
[
  term ((-235 : Rat) / 14) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0062 : Poly :=
[
  term ((235 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-235 : Rat) / 14) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-235 : Rat) / 7) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((235 : Rat) / 14) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-235 : Rat) / 7) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((235 : Rat) / 14) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((235 : Rat) / 7) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-235 : Rat) / 14) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0062
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0063 : Poly :=
[
  term ((-4637051076209395 : Rat) / 13054820678298) [(1, 1), (11, 1)]
]

/-- Partial product 63 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0063 : Poly :=
[
  term ((4637051076209395 : Rat) / 6527410339149) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((-4637051076209395 : Rat) / 13054820678298) [(0, 2), (1, 1), (11, 1)],
  term ((-4637051076209395 : Rat) / 6527410339149) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((4637051076209395 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1)],
  term ((-4637051076209395 : Rat) / 6527410339149) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((4637051076209395 : Rat) / 13054820678298) [(1, 1), (3, 2), (11, 1)],
  term ((4637051076209395 : Rat) / 6527410339149) [(1, 2), (11, 1), (15, 1)],
  term ((-4637051076209395 : Rat) / 13054820678298) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0063
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0064 : Poly :=
[
  term ((-37507036691901419 : Rat) / 26109641356596) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 64 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0064 : Poly :=
[
  term ((37507036691901419 : Rat) / 13054820678298) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((-37507036691901419 : Rat) / 26109641356596) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-37507036691901419 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((37507036691901419 : Rat) / 26109641356596) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-37507036691901419 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((37507036691901419 : Rat) / 26109641356596) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((37507036691901419 : Rat) / 13054820678298) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-37507036691901419 : Rat) / 26109641356596) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0064
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0065 : Poly :=
[
  term ((1472176447223 : Rat) / 25373801124) [(1, 1), (13, 1)]
]

/-- Partial product 65 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0065 : Poly :=
[
  term ((-1472176447223 : Rat) / 12686900562) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((1472176447223 : Rat) / 25373801124) [(0, 2), (1, 1), (13, 1)],
  term ((1472176447223 : Rat) / 12686900562) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-1472176447223 : Rat) / 25373801124) [(1, 1), (2, 2), (13, 1)],
  term ((1472176447223 : Rat) / 12686900562) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-1472176447223 : Rat) / 25373801124) [(1, 1), (3, 2), (13, 1)],
  term ((-1472176447223 : Rat) / 12686900562) [(1, 2), (13, 1), (15, 1)],
  term ((1472176447223 : Rat) / 25373801124) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0065
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0066 : Poly :=
[
  term ((38902852098606227 : Rat) / 39164462034894) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 66 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0066 : Poly :=
[
  term ((-38902852098606227 : Rat) / 19582231017447) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((38902852098606227 : Rat) / 39164462034894) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((38902852098606227 : Rat) / 19582231017447) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-38902852098606227 : Rat) / 39164462034894) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((38902852098606227 : Rat) / 19582231017447) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-38902852098606227 : Rat) / 39164462034894) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-38902852098606227 : Rat) / 19582231017447) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((38902852098606227 : Rat) / 39164462034894) [(1, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0066
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0067 : Poly :=
[
  term ((-380 : Rat) / 63) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 67 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0067 : Poly :=
[
  term ((760 : Rat) / 63) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-380 : Rat) / 63) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-760 : Rat) / 63) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((380 : Rat) / 63) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((-760 : Rat) / 63) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((380 : Rat) / 63) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((760 : Rat) / 63) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-380 : Rat) / 63) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0067
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0068 : Poly :=
[
  term ((-205 : Rat) / 14) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 68 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0068 : Poly :=
[
  term ((205 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-205 : Rat) / 14) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-205 : Rat) / 7) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((205 : Rat) / 14) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-205 : Rat) / 7) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 14) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((205 : Rat) / 7) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 14) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0068
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0069 : Poly :=
[
  term ((-374773549897436 : Rat) / 932487191307) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 69 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0069 : Poly :=
[
  term ((749547099794872 : Rat) / 932487191307) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((-374773549897436 : Rat) / 932487191307) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-749547099794872 : Rat) / 932487191307) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((374773549897436 : Rat) / 932487191307) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-749547099794872 : Rat) / 932487191307) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((374773549897436 : Rat) / 932487191307) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((749547099794872 : Rat) / 932487191307) [(1, 2), (14, 1), (15, 2)],
  term ((-374773549897436 : Rat) / 932487191307) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0069
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0070 : Poly :=
[
  term ((236 : Rat) / 63) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0070 : Poly :=
[
  term ((-472 : Rat) / 63) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((236 : Rat) / 63) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((472 : Rat) / 63) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-236 : Rat) / 63) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((472 : Rat) / 63) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-236 : Rat) / 63) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-472 : Rat) / 63) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((236 : Rat) / 63) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0070
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0071 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 71 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0071 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (14, 3), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (2, 1), (14, 3), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 2), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 2), (14, 2), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0071
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0072 : Poly :=
[
  term ((11119522789707949 : Rat) / 26109641356596) [(1, 1), (15, 1)]
]

/-- Partial product 72 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0072 : Poly :=
[
  term ((-11119522789707949 : Rat) / 13054820678298) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((11119522789707949 : Rat) / 26109641356596) [(0, 2), (1, 1), (15, 1)],
  term ((11119522789707949 : Rat) / 13054820678298) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-11119522789707949 : Rat) / 26109641356596) [(1, 1), (2, 2), (15, 1)],
  term ((11119522789707949 : Rat) / 13054820678298) [(1, 1), (3, 1), (15, 2)],
  term ((-11119522789707949 : Rat) / 26109641356596) [(1, 1), (3, 2), (15, 1)],
  term ((-11119522789707949 : Rat) / 13054820678298) [(1, 2), (15, 2)],
  term ((11119522789707949 : Rat) / 26109641356596) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0072
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0073 : Poly :=
[
  term ((86 : Rat) / 7) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0073 : Poly :=
[
  term ((-172 : Rat) / 7) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((86 : Rat) / 7) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((172 : Rat) / 7) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86 : Rat) / 7) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((172 : Rat) / 7) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-86 : Rat) / 7) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-172 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((86 : Rat) / 7) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0073
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0074 : Poly :=
[
  term ((-9984 : Rat) / 553) [(1, 2)]
]

/-- Partial product 74 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0074 : Poly :=
[
  term ((19968 : Rat) / 553) [(0, 1), (1, 2), (14, 1)],
  term ((-9984 : Rat) / 553) [(0, 2), (1, 2)],
  term ((-19968 : Rat) / 553) [(1, 2), (2, 1), (14, 1)],
  term ((9984 : Rat) / 553) [(1, 2), (2, 2)],
  term ((-19968 : Rat) / 553) [(1, 2), (3, 1), (15, 1)],
  term ((9984 : Rat) / 553) [(1, 2), (3, 2)],
  term ((19968 : Rat) / 553) [(1, 3), (15, 1)],
  term ((-9984 : Rat) / 553) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0074
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0075 : Poly :=
[
  term ((45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1)]
]

/-- Partial product 75 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0075 : Poly :=
[
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 1), (14, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(0, 2), (1, 2), (2, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1), (3, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 2), (14, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 3)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 3), (2, 1), (15, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 4), (2, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0075
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0076 : Poly :=
[
  term ((45864690786755 : Rat) / 52219282713192) [(1, 2), (14, 1)]
]

/-- Partial product 76 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0076 : Poly :=
[
  term ((-45864690786755 : Rat) / 26109641356596) [(0, 1), (1, 2), (14, 2)],
  term ((45864690786755 : Rat) / 52219282713192) [(0, 2), (1, 2), (14, 1)],
  term ((45864690786755 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 2)],
  term ((-45864690786755 : Rat) / 52219282713192) [(1, 2), (2, 2), (14, 1)],
  term ((45864690786755 : Rat) / 26109641356596) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-45864690786755 : Rat) / 52219282713192) [(1, 2), (3, 2), (14, 1)],
  term ((-45864690786755 : Rat) / 26109641356596) [(1, 3), (14, 1), (15, 1)],
  term ((45864690786755 : Rat) / 52219282713192) [(1, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0076
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0077 : Poly :=
[
  term ((-157800526470211 : Rat) / 3729948765228) [(2, 1)]
]

/-- Partial product 77 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0077 : Poly :=
[
  term ((157800526470211 : Rat) / 1864974382614) [(0, 1), (2, 1), (14, 1)],
  term ((-157800526470211 : Rat) / 3729948765228) [(0, 2), (2, 1)],
  term ((157800526470211 : Rat) / 1864974382614) [(1, 1), (2, 1), (15, 1)],
  term ((-157800526470211 : Rat) / 3729948765228) [(1, 2), (2, 1)],
  term ((-157800526470211 : Rat) / 1864974382614) [(2, 1), (3, 1), (15, 1)],
  term ((157800526470211 : Rat) / 3729948765228) [(2, 1), (3, 2)],
  term ((-157800526470211 : Rat) / 1864974382614) [(2, 2), (14, 1)],
  term ((157800526470211 : Rat) / 3729948765228) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0077
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0078 : Poly :=
[
  term ((-60941144387381731 : Rat) / 78328924069788) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 78 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0078 : Poly :=
[
  term ((60941144387381731 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-60941144387381731 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((60941144387381731 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-60941144387381731 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-60941144387381731 : Rat) / 39164462034894) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((60941144387381731 : Rat) / 78328924069788) [(2, 1), (3, 3), (7, 1)],
  term ((-60941144387381731 : Rat) / 39164462034894) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((60941144387381731 : Rat) / 78328924069788) [(2, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0078
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0079 : Poly :=
[
  term ((-4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 79 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0079 : Poly :=
[
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 1), (3, 3), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0079
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0080 : Poly :=
[
  term ((-151944009278685139 : Rat) / 156657848139576) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 80 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0080 : Poly :=
[
  term ((151944009278685139 : Rat) / 78328924069788) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-151944009278685139 : Rat) / 156657848139576) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((151944009278685139 : Rat) / 78328924069788) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-151944009278685139 : Rat) / 156657848139576) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-151944009278685139 : Rat) / 78328924069788) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((151944009278685139 : Rat) / 156657848139576) [(2, 1), (3, 3), (11, 1)],
  term ((-151944009278685139 : Rat) / 78328924069788) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((151944009278685139 : Rat) / 156657848139576) [(2, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0080
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0081 : Poly :=
[
  term ((26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 81 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0081 : Poly :=
[
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 1), (3, 3), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0081
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0082 : Poly :=
[
  term ((-985 : Rat) / 84) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 82 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0082 : Poly :=
[
  term ((985 : Rat) / 42) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((985 : Rat) / 84) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((985 : Rat) / 84) [(2, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0082
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0083 : Poly :=
[
  term ((-127611693308643917 : Rat) / 78328924069788) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 83 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0083 : Poly :=
[
  term ((127611693308643917 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-127611693308643917 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((127611693308643917 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-127611693308643917 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-127611693308643917 : Rat) / 39164462034894) [(2, 1), (3, 2), (15, 2)],
  term ((127611693308643917 : Rat) / 78328924069788) [(2, 1), (3, 3), (15, 1)],
  term ((-127611693308643917 : Rat) / 39164462034894) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((127611693308643917 : Rat) / 78328924069788) [(2, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0083
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0084 : Poly :=
[
  term ((205 : Rat) / 21) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0084 : Poly :=
[
  term ((-410 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((205 : Rat) / 21) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-205 : Rat) / 21) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(2, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0084
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0085 : Poly :=
[
  term ((2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2)]
]

/-- Partial product 85 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0085 : Poly :=
[
  term ((-2817638222726165 : Rat) / 1864974382614) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((2817638222726165 : Rat) / 3729948765228) [(0, 2), (2, 1), (3, 2)],
  term ((-2817638222726165 : Rat) / 1864974382614) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((2817638222726165 : Rat) / 3729948765228) [(1, 2), (2, 1), (3, 2)],
  term ((2817638222726165 : Rat) / 1864974382614) [(2, 1), (3, 3), (15, 1)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 4)],
  term ((2817638222726165 : Rat) / 1864974382614) [(2, 2), (3, 2), (14, 1)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 3), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0085
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0086 : Poly :=
[
  term ((6788130415625 : Rat) / 20234803428) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 86 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0086 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (2, 1), (7, 1), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 2), (7, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(2, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0086
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0087 : Poly :=
[
  term ((-6863305354755691 : Rat) / 17406427571064) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 87 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0087 : Poly :=
[
  term ((6863305354755691 : Rat) / 8703213785532) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-6863305354755691 : Rat) / 17406427571064) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((6863305354755691 : Rat) / 8703213785532) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-6863305354755691 : Rat) / 17406427571064) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((-6863305354755691 : Rat) / 8703213785532) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((6863305354755691 : Rat) / 17406427571064) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-6863305354755691 : Rat) / 8703213785532) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((6863305354755691 : Rat) / 17406427571064) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0087
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0088 : Poly :=
[
  term ((-280381883026811 : Rat) / 799274735406) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 88 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0088 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(2, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0088
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0089 : Poly :=
[
  term ((-85 : Rat) / 63) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 89 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0089 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 63) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 63) [(2, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0089
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0090 : Poly :=
[
  term ((15383607147144655 : Rat) / 8703213785532) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 90 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0090 : Poly :=
[
  term ((-15383607147144655 : Rat) / 4351606892766) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((15383607147144655 : Rat) / 8703213785532) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-15383607147144655 : Rat) / 4351606892766) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((15383607147144655 : Rat) / 8703213785532) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((15383607147144655 : Rat) / 4351606892766) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-15383607147144655 : Rat) / 8703213785532) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((15383607147144655 : Rat) / 4351606892766) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-15383607147144655 : Rat) / 8703213785532) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0090
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0091 : Poly :=
[
  term ((16 : Rat) / 9) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0091 : Poly :=
[
  term ((-32 : Rat) / 9) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 9) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 9) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0091
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0092 : Poly :=
[
  term ((691022102046859 : Rat) / 1864974382614) [(2, 1), (7, 2)]
]

/-- Partial product 92 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0092 : Poly :=
[
  term ((-691022102046859 : Rat) / 932487191307) [(0, 1), (2, 1), (7, 2), (14, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(0, 2), (2, 1), (7, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(1, 2), (2, 1), (7, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(2, 1), (3, 2), (7, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(2, 2), (7, 2), (14, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(2, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0092
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0093 : Poly :=
[
  term ((259476013612049 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 93 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0093 : Poly :=
[
  term ((-259476013612049 : Rat) / 80939213712) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((259476013612049 : Rat) / 161878427424) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-259476013612049 : Rat) / 80939213712) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((259476013612049 : Rat) / 161878427424) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((259476013612049 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-259476013612049 : Rat) / 161878427424) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((259476013612049 : Rat) / 80939213712) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-259476013612049 : Rat) / 161878427424) [(2, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0093
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0094 : Poly :=
[
  term ((91742940193255 : Rat) / 80939213712) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 94 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0094 : Poly :=
[
  term ((-91742940193255 : Rat) / 40469606856) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((91742940193255 : Rat) / 80939213712) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-91742940193255 : Rat) / 40469606856) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((91742940193255 : Rat) / 80939213712) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((91742940193255 : Rat) / 40469606856) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-91742940193255 : Rat) / 80939213712) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((91742940193255 : Rat) / 40469606856) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-91742940193255 : Rat) / 80939213712) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0094
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0095 : Poly :=
[
  term ((-10636157154957011 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 95 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0095 : Poly :=
[
  term ((10636157154957011 : Rat) / 3197098941624) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-10636157154957011 : Rat) / 6394197883248) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((10636157154957011 : Rat) / 3197098941624) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10636157154957011 : Rat) / 6394197883248) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-10636157154957011 : Rat) / 3197098941624) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((10636157154957011 : Rat) / 6394197883248) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-10636157154957011 : Rat) / 3197098941624) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((10636157154957011 : Rat) / 6394197883248) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0095
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0096 : Poly :=
[
  term ((-3025 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 96 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0096 : Poly :=
[
  term ((3025 : Rat) / 252) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3025 : Rat) / 504) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((3025 : Rat) / 252) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3025 : Rat) / 504) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3025 : Rat) / 252) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3025 : Rat) / 504) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3025 : Rat) / 252) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3025 : Rat) / 504) [(2, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0096
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0097 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 97 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0097 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0097
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0098 : Poly :=
[
  term ((13334377689654277 : Rat) / 13054820678298) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 98 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0098 : Poly :=
[
  term ((-13334377689654277 : Rat) / 6527410339149) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((13334377689654277 : Rat) / 13054820678298) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-13334377689654277 : Rat) / 6527410339149) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((13334377689654277 : Rat) / 13054820678298) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((13334377689654277 : Rat) / 6527410339149) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-13334377689654277 : Rat) / 13054820678298) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((13334377689654277 : Rat) / 6527410339149) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-13334377689654277 : Rat) / 13054820678298) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0098
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0099 : Poly :=
[
  term ((1033 : Rat) / 126) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0099 : Poly :=
[
  term ((-1033 : Rat) / 63) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1033 : Rat) / 126) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1033 : Rat) / 63) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((1033 : Rat) / 126) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1033 : Rat) / 63) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1033 : Rat) / 126) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((1033 : Rat) / 63) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1033 : Rat) / 126) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0099
        rs_R009_ueqv_R009YNNNN_generator_29_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_29_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_29_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_29_0000,
  rs_R009_ueqv_R009YNNNN_partial_29_0001,
  rs_R009_ueqv_R009YNNNN_partial_29_0002,
  rs_R009_ueqv_R009YNNNN_partial_29_0003,
  rs_R009_ueqv_R009YNNNN_partial_29_0004,
  rs_R009_ueqv_R009YNNNN_partial_29_0005,
  rs_R009_ueqv_R009YNNNN_partial_29_0006,
  rs_R009_ueqv_R009YNNNN_partial_29_0007,
  rs_R009_ueqv_R009YNNNN_partial_29_0008,
  rs_R009_ueqv_R009YNNNN_partial_29_0009,
  rs_R009_ueqv_R009YNNNN_partial_29_0010,
  rs_R009_ueqv_R009YNNNN_partial_29_0011,
  rs_R009_ueqv_R009YNNNN_partial_29_0012,
  rs_R009_ueqv_R009YNNNN_partial_29_0013,
  rs_R009_ueqv_R009YNNNN_partial_29_0014,
  rs_R009_ueqv_R009YNNNN_partial_29_0015,
  rs_R009_ueqv_R009YNNNN_partial_29_0016,
  rs_R009_ueqv_R009YNNNN_partial_29_0017,
  rs_R009_ueqv_R009YNNNN_partial_29_0018,
  rs_R009_ueqv_R009YNNNN_partial_29_0019,
  rs_R009_ueqv_R009YNNNN_partial_29_0020,
  rs_R009_ueqv_R009YNNNN_partial_29_0021,
  rs_R009_ueqv_R009YNNNN_partial_29_0022,
  rs_R009_ueqv_R009YNNNN_partial_29_0023,
  rs_R009_ueqv_R009YNNNN_partial_29_0024,
  rs_R009_ueqv_R009YNNNN_partial_29_0025,
  rs_R009_ueqv_R009YNNNN_partial_29_0026,
  rs_R009_ueqv_R009YNNNN_partial_29_0027,
  rs_R009_ueqv_R009YNNNN_partial_29_0028,
  rs_R009_ueqv_R009YNNNN_partial_29_0029,
  rs_R009_ueqv_R009YNNNN_partial_29_0030,
  rs_R009_ueqv_R009YNNNN_partial_29_0031,
  rs_R009_ueqv_R009YNNNN_partial_29_0032,
  rs_R009_ueqv_R009YNNNN_partial_29_0033,
  rs_R009_ueqv_R009YNNNN_partial_29_0034,
  rs_R009_ueqv_R009YNNNN_partial_29_0035,
  rs_R009_ueqv_R009YNNNN_partial_29_0036,
  rs_R009_ueqv_R009YNNNN_partial_29_0037,
  rs_R009_ueqv_R009YNNNN_partial_29_0038,
  rs_R009_ueqv_R009YNNNN_partial_29_0039,
  rs_R009_ueqv_R009YNNNN_partial_29_0040,
  rs_R009_ueqv_R009YNNNN_partial_29_0041,
  rs_R009_ueqv_R009YNNNN_partial_29_0042,
  rs_R009_ueqv_R009YNNNN_partial_29_0043,
  rs_R009_ueqv_R009YNNNN_partial_29_0044,
  rs_R009_ueqv_R009YNNNN_partial_29_0045,
  rs_R009_ueqv_R009YNNNN_partial_29_0046,
  rs_R009_ueqv_R009YNNNN_partial_29_0047,
  rs_R009_ueqv_R009YNNNN_partial_29_0048,
  rs_R009_ueqv_R009YNNNN_partial_29_0049,
  rs_R009_ueqv_R009YNNNN_partial_29_0050,
  rs_R009_ueqv_R009YNNNN_partial_29_0051,
  rs_R009_ueqv_R009YNNNN_partial_29_0052,
  rs_R009_ueqv_R009YNNNN_partial_29_0053,
  rs_R009_ueqv_R009YNNNN_partial_29_0054,
  rs_R009_ueqv_R009YNNNN_partial_29_0055,
  rs_R009_ueqv_R009YNNNN_partial_29_0056,
  rs_R009_ueqv_R009YNNNN_partial_29_0057,
  rs_R009_ueqv_R009YNNNN_partial_29_0058,
  rs_R009_ueqv_R009YNNNN_partial_29_0059,
  rs_R009_ueqv_R009YNNNN_partial_29_0060,
  rs_R009_ueqv_R009YNNNN_partial_29_0061,
  rs_R009_ueqv_R009YNNNN_partial_29_0062,
  rs_R009_ueqv_R009YNNNN_partial_29_0063,
  rs_R009_ueqv_R009YNNNN_partial_29_0064,
  rs_R009_ueqv_R009YNNNN_partial_29_0065,
  rs_R009_ueqv_R009YNNNN_partial_29_0066,
  rs_R009_ueqv_R009YNNNN_partial_29_0067,
  rs_R009_ueqv_R009YNNNN_partial_29_0068,
  rs_R009_ueqv_R009YNNNN_partial_29_0069,
  rs_R009_ueqv_R009YNNNN_partial_29_0070,
  rs_R009_ueqv_R009YNNNN_partial_29_0071,
  rs_R009_ueqv_R009YNNNN_partial_29_0072,
  rs_R009_ueqv_R009YNNNN_partial_29_0073,
  rs_R009_ueqv_R009YNNNN_partial_29_0074,
  rs_R009_ueqv_R009YNNNN_partial_29_0075,
  rs_R009_ueqv_R009YNNNN_partial_29_0076,
  rs_R009_ueqv_R009YNNNN_partial_29_0077,
  rs_R009_ueqv_R009YNNNN_partial_29_0078,
  rs_R009_ueqv_R009YNNNN_partial_29_0079,
  rs_R009_ueqv_R009YNNNN_partial_29_0080,
  rs_R009_ueqv_R009YNNNN_partial_29_0081,
  rs_R009_ueqv_R009YNNNN_partial_29_0082,
  rs_R009_ueqv_R009YNNNN_partial_29_0083,
  rs_R009_ueqv_R009YNNNN_partial_29_0084,
  rs_R009_ueqv_R009YNNNN_partial_29_0085,
  rs_R009_ueqv_R009YNNNN_partial_29_0086,
  rs_R009_ueqv_R009YNNNN_partial_29_0087,
  rs_R009_ueqv_R009YNNNN_partial_29_0088,
  rs_R009_ueqv_R009YNNNN_partial_29_0089,
  rs_R009_ueqv_R009YNNNN_partial_29_0090,
  rs_R009_ueqv_R009YNNNN_partial_29_0091,
  rs_R009_ueqv_R009YNNNN_partial_29_0092,
  rs_R009_ueqv_R009YNNNN_partial_29_0093,
  rs_R009_ueqv_R009YNNNN_partial_29_0094,
  rs_R009_ueqv_R009YNNNN_partial_29_0095,
  rs_R009_ueqv_R009YNNNN_partial_29_0096,
  rs_R009_ueqv_R009YNNNN_partial_29_0097,
  rs_R009_ueqv_R009YNNNN_partial_29_0098,
  rs_R009_ueqv_R009YNNNN_partial_29_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_29_0000_0099 : Poly :=
[
  term ((568916399243231 : Rat) / 725267815461) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-1473634296970363 : Rat) / 3729948765228) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1)],
  term ((3599338271581 : Rat) / 8993245968) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-8350997061396691 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-139176949163575 : Rat) / 355233215736) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1)],
  term ((165 : Rat) / 4) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28786008676836233 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-243 : Rat) / 7) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9618078051221123 : Rat) / 52219282713192) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((1415030821112827 : Rat) / 8703213785532) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((-4290098422675 : Rat) / 26979737904) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-407632441893949 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((172719264922777 : Rat) / 1065699647208) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-925 : Rat) / 84) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((221606511510779 : Rat) / 2486632510152) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((193 : Rat) / 21) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((556087218462152 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (6, 1), (14, 1)],
  term ((-123705518305364477 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-14182305114757 : Rat) / 26979737904) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((1415552839535231 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((62600226792465547 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((541035623851183 : Rat) / 1065699647208) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-205 : Rat) / 12) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-922649885837051 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((31017977519966095 : Rat) / 78328924069788) [(0, 1), (1, 1), (3, 1), (14, 2)],
  term ((-11717598922750547 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((283 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((1415030821112827 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((-4290098422675 : Rat) / 26979737904) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-407632441893949 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((172719264922777 : Rat) / 1065699647208) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-925 : Rat) / 84) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((2142821295436915 : Rat) / 1065699647208) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((193 : Rat) / 21) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-9618078051221123 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 3)],
  term ((-3990050839829666 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (14, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1)],
  term ((27619545035095 : Rat) / 6744934476) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((288813327389680 : Rat) / 932487191307) [(0, 1), (1, 1), (7, 1), (10, 1), (14, 1)],
  term ((-23423412091316483 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1119074972569573 : Rat) / 266424911802) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((2785 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((306629898617197 : Rat) / 1864974382614) [(0, 1), (1, 1), (7, 1), (14, 1)],
  term ((-59689906938890213 : Rat) / 26109641356596) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term ((15294781938209561 : Rat) / 2901071261844) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((-2236 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((9378594870573889 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((-8117517876221 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((21246305150473 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((310624847819 : Rat) / 2248311492) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term ((1207744163548 : Rat) / 722671551) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-2465448966955 : Rat) / 6744934476) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((328288306993943 : Rat) / 355233215736) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-165 : Rat) / 4) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-40455478956927709 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((235 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-826808979291835 : Rat) / 1065699647208) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((2455 : Rat) / 84) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4637051076209395 : Rat) / 6527410339149) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((37507036691901419 : Rat) / 13054820678298) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((139108534951591 : Rat) / 414438751692) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-487 : Rat) / 21) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((81650386742723 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-1472176447223 : Rat) / 12686900562) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((205 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38902852098606227 : Rat) / 19582231017447) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((760 : Rat) / 63) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((92543245239841 : Rat) / 266424911802) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-1165 : Rat) / 21) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1510258154249765 : Rat) / 4351606892766) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((-172 : Rat) / 7) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((749547099794872 : Rat) / 932487191307) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((-472 : Rat) / 63) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (14, 3), (15, 1)],
  term ((-1577242854450680 : Rat) / 6527410339149) [(0, 1), (1, 1), (15, 1)],
  term ((-8188886026951829 : Rat) / 13054820678298) [(0, 1), (1, 1), (15, 3)],
  term ((988 : Rat) / 21) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((788621427225340 : Rat) / 6527410339149) [(0, 1), (1, 2)],
  term ((-45864690786755 : Rat) / 2901071261844) [(0, 1), (1, 2), (2, 1), (14, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 2)],
  term ((115215333378687515 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((1083928664767 : Rat) / 2569498848) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((-57708637489738159 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-295491384565579 : Rat) / 710466431472) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((1095 : Rat) / 56) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((22430126557392523 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-223 : Rat) / 14) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1918047008161885 : Rat) / 2486632510152) [(0, 1), (1, 2), (3, 2)],
  term ((-27619545035095 : Rat) / 13489868952) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((23423412091316483 : Rat) / 8703213785532) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((1119074972569573 : Rat) / 532849823604) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-2785 : Rat) / 42) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-40224222530177375 : Rat) / 17406427571064) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((1118 : Rat) / 21) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-9378594870573889 : Rat) / 4351606892766) [(0, 1), (1, 2), (7, 2)],
  term ((-21246305150473 : Rat) / 53959475808) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-10861008665 : Rat) / 80296839) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((826808979291835 : Rat) / 2131399294416) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-2455 : Rat) / 168) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6182338769135003 : Rat) / 17406427571064) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((487 : Rat) / 42) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-81650386742723 : Rat) / 8703213785532) [(0, 1), (1, 2), (11, 2)],
  term ((6681334973578 : Rat) / 44404151967) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((40 : Rat) / 7) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2822984182820639 : Rat) / 13054820678298) [(0, 1), (1, 2), (14, 1)],
  term ((-45864690786755 : Rat) / 26109641356596) [(0, 1), (1, 2), (14, 2)],
  term ((3210655692169547 : Rat) / 6527410339149) [(0, 1), (1, 2), (15, 2)],
  term ((-36 : Rat) / 7) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((9618078051221123 : Rat) / 52219282713192) [(0, 1), (1, 3), (3, 1)],
  term ((-1415030821112827 : Rat) / 8703213785532) [(0, 1), (1, 3), (7, 1)],
  term ((4290098422675 : Rat) / 26979737904) [(0, 1), (1, 3), (9, 1)],
  term ((407632441893949 : Rat) / 4351606892766) [(0, 1), (1, 3), (11, 1)],
  term ((-172719264922777 : Rat) / 1065699647208) [(0, 1), (1, 3), (13, 1)],
  term ((925 : Rat) / 84) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term ((-455928939142811 : Rat) / 5802142523688) [(0, 1), (1, 3), (15, 1)],
  term ((-193 : Rat) / 21) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 4)],
  term ((467528288910826007 : Rat) / 78328924069788) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((32124691429337 : Rat) / 26979737904) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-10590951595264669 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-1258681624707371 : Rat) / 1065699647208) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((5255 : Rat) / 84) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((381873363465115321 : Rat) / 78328924069788) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-1079 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-80001110434286425 : Rat) / 26109641356596) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((-96434895936535 : Rat) / 20234803428) [(0, 1), (2, 1), (7, 1), (9, 1), (14, 1)],
  term ((53710129537388657 : Rat) / 8703213785532) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((3917988683762341 : Rat) / 799274735406) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-8185 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-76651560108917993 : Rat) / 8703213785532) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((6484 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32972939326049680 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 2), (14, 1)],
  term ((-80803732265867 : Rat) / 20234803428) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-76950246391525 : Rat) / 40469606856) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((3279146023208129 : Rat) / 799274735406) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-155 : Rat) / 9) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-62101348460567341 : Rat) / 26109641356596) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((428 : Rat) / 63) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-81650386742723 : Rat) / 4351606892766) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((-92543245239841 : Rat) / 266424911802) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((1165 : Rat) / 21) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4259089394192837 : Rat) / 13054820678298) [(0, 1), (2, 1), (14, 1)],
  term ((8188886026951829 : Rat) / 13054820678298) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-988 : Rat) / 21) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3294374163479327 : Rat) / 6527410339149) [(0, 1), (2, 1), (14, 2)],
  term ((-788621427225340 : Rat) / 6527410339149) [(0, 1), (2, 2)],
  term ((-115215333378687515 : Rat) / 52219282713192) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((-1083928664767 : Rat) / 2569498848) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((57708637489738159 : Rat) / 52219282713192) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((295491384565579 : Rat) / 710466431472) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-1095 : Rat) / 56) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-42216658949275829 : Rat) / 52219282713192) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((223 : Rat) / 14) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((13518058438706705 : Rat) / 17406427571064) [(0, 1), (2, 2), (3, 2)],
  term ((27619545035095 : Rat) / 13489868952) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((-23423412091316483 : Rat) / 8703213785532) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-1119074972569573 : Rat) / 532849823604) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((2785 : Rat) / 42) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((15294781938209561 : Rat) / 5802142523688) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-1118 : Rat) / 21) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((9378594870573889 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 2)],
  term ((21246305150473 : Rat) / 53959475808) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-2465448966955 : Rat) / 13489868952) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-826808979291835 : Rat) / 2131399294416) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((2455 : Rat) / 168) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((139108534951591 : Rat) / 828877503384) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-487 : Rat) / 42) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((81650386742723 : Rat) / 8703213785532) [(0, 1), (2, 2), (11, 2)],
  term ((92543245239841 : Rat) / 532849823604) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-1165 : Rat) / 42) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((3294374163479327 : Rat) / 13054820678298) [(0, 1), (2, 2), (14, 1)],
  term ((-8188886026951829 : Rat) / 26109641356596) [(0, 1), (2, 2), (15, 2)],
  term ((494 : Rat) / 21) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-27619545035095 : Rat) / 6744934476) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((23423412091316483 : Rat) / 4351606892766) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((1119074972569573 : Rat) / 266424911802) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2785 : Rat) / 21) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15294781938209561 : Rat) / 2901071261844) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((2236 : Rat) / 21) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-9378594870573889 : Rat) / 2175803446383) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((-21246305150473 : Rat) / 26979737904) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((2465448966955 : Rat) / 6744934476) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((826808979291835 : Rat) / 1065699647208) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2455 : Rat) / 84) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-139108534951591 : Rat) / 414438751692) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((487 : Rat) / 21) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-81650386742723 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-92543245239841 : Rat) / 266424911802) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((1165 : Rat) / 21) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3294374163479327 : Rat) / 6527410339149) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((1577242854450680 : Rat) / 6527410339149) [(0, 1), (3, 1), (15, 1)],
  term ((8188886026951829 : Rat) / 13054820678298) [(0, 1), (3, 1), (15, 3)],
  term ((-988 : Rat) / 21) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-788621427225340 : Rat) / 6527410339149) [(0, 1), (3, 2)],
  term ((27619545035095 : Rat) / 13489868952) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((-23423412091316483 : Rat) / 8703213785532) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-1119074972569573 : Rat) / 532849823604) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((2785 : Rat) / 42) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((368083704201261079 : Rat) / 52219282713192) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-1118 : Rat) / 21) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((9378594870573889 : Rat) / 4351606892766) [(0, 1), (3, 2), (7, 2)],
  term ((21246305150473 : Rat) / 53959475808) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((17831604026197 : Rat) / 26979737904) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-826808979291835 : Rat) / 2131399294416) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((2455 : Rat) / 168) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-106653437277526085 : Rat) / 52219282713192) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-487 : Rat) / 42) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((81650386742723 : Rat) / 8703213785532) [(0, 1), (3, 2), (11, 2)],
  term ((-701387663217055 : Rat) / 1065699647208) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((955 : Rat) / 84) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((3294374163479327 : Rat) / 13054820678298) [(0, 1), (3, 2), (14, 1)],
  term ((105023990501000 : Rat) / 80585312829) [(0, 1), (3, 2), (15, 2)],
  term ((-25 : Rat) / 3) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-115215333378687515 : Rat) / 52219282713192) [(0, 1), (3, 3), (7, 1)],
  term ((-1083928664767 : Rat) / 2569498848) [(0, 1), (3, 3), (9, 1)],
  term ((57708637489738159 : Rat) / 52219282713192) [(0, 1), (3, 3), (11, 1)],
  term ((295491384565579 : Rat) / 710466431472) [(0, 1), (3, 3), (13, 1)],
  term ((-1095 : Rat) / 56) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((-123325009581516059 : Rat) / 52219282713192) [(0, 1), (3, 3), (15, 1)],
  term ((223 : Rat) / 14) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((13518058438706705 : Rat) / 17406427571064) [(0, 1), (3, 4)],
  term ((-15252936479749783 : Rat) / 26109641356596) [(0, 1), (14, 1)],
  term ((15252936479749783 : Rat) / 52219282713192) [(0, 2)],
  term ((-10862912321535193 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((1825255152115579 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-2217817969393 : Rat) / 53959475808) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term ((10796791712760385 : Rat) / 26109641356596) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((72092317645171 : Rat) / 2131399294416) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((-1615 : Rat) / 168) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((12066135967554937 : Rat) / 26109641356596) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((49 : Rat) / 6) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((922649885837051 : Rat) / 8703213785532) [(0, 2), (1, 1), (3, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((-1415552839535231 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((-12675206546756119 : Rat) / 22379692591368) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((-306629898617197 : Rat) / 3729948765228) [(0, 2), (1, 1), (7, 1)],
  term ((-144406663694840 : Rat) / 932487191307) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((76670276792244137 : Rat) / 52219282713192) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((-310624847819 : Rat) / 4496622984) [(0, 2), (1, 1), (9, 1)],
  term ((8117517876221 : Rat) / 17986491936) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((-46687131847369 : Rat) / 40469606856) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-328288306993943 : Rat) / 710466431472) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((165 : Rat) / 8) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((40455478956927709 : Rat) / 52219282713192) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-235 : Rat) / 14) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4637051076209395 : Rat) / 13054820678298) [(0, 2), (1, 1), (11, 1)],
  term ((-42398625994628807 : Rat) / 26109641356596) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((1472176447223 : Rat) / 25373801124) [(0, 2), (1, 1), (13, 1)],
  term ((103195436140860673 : Rat) / 78328924069788) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-505 : Rat) / 18) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-205 : Rat) / 14) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-119182095008201 : Rat) / 532849823604) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((1394 : Rat) / 63) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((11119522789707949 : Rat) / 26109641356596) [(0, 2), (1, 1), (15, 1)],
  term ((86 : Rat) / 7) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-9984 : Rat) / 553) [(0, 2), (1, 2)],
  term ((45864690786755 : Rat) / 17406427571064) [(0, 2), (1, 2), (2, 1)],
  term ((596240980227815 : Rat) / 52219282713192) [(0, 2), (1, 2), (14, 1)],
  term ((-157800526470211 : Rat) / 3729948765228) [(0, 2), (2, 1)],
  term ((-60941144387381731 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((-151944009278685139 : Rat) / 156657848139576) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((-985 : Rat) / 84) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-127611693308643917 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((205 : Rat) / 21) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((2817638222726165 : Rat) / 3729948765228) [(0, 2), (2, 1), (3, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((-6863305354755691 : Rat) / 17406427571064) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((15383607147144655 : Rat) / 8703213785532) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((16 : Rat) / 9) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(0, 2), (2, 1), (7, 2)],
  term ((259476013612049 : Rat) / 161878427424) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((91742940193255 : Rat) / 80939213712) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-10636157154957011 : Rat) / 6394197883248) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-3025 : Rat) / 504) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((13334377689654277 : Rat) / 13054820678298) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((1033 : Rat) / 126) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-115215333378687515 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-1083928664767 : Rat) / 1284749424) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((57708637489738159 : Rat) / 26109641356596) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((295491384565579 : Rat) / 355233215736) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-1095 : Rat) / 28) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42216658949275829 : Rat) / 26109641356596) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((223 : Rat) / 7) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((13518058438706705 : Rat) / 8703213785532) [(0, 2), (3, 2), (14, 1)],
  term ((27619545035095 : Rat) / 6744934476) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((-23423412091316483 : Rat) / 4351606892766) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-1119074972569573 : Rat) / 266424911802) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((2785 : Rat) / 21) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((15294781938209561 : Rat) / 2901071261844) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-2236 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((9378594870573889 : Rat) / 2175803446383) [(0, 2), (7, 2), (14, 1)],
  term ((21246305150473 : Rat) / 26979737904) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2465448966955 : Rat) / 6744934476) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-826808979291835 : Rat) / 1065699647208) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((2455 : Rat) / 84) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((139108534951591 : Rat) / 414438751692) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-487 : Rat) / 21) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((81650386742723 : Rat) / 4351606892766) [(0, 2), (11, 2), (14, 1)],
  term ((92543245239841 : Rat) / 266424911802) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1165 : Rat) / 21) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1577242854450680 : Rat) / 6527410339149) [(0, 2), (14, 1)],
  term ((-8188886026951829 : Rat) / 13054820678298) [(0, 2), (14, 1), (15, 2)],
  term ((988 : Rat) / 21) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((3294374163479327 : Rat) / 6527410339149) [(0, 2), (14, 2)],
  term ((788621427225340 : Rat) / 6527410339149) [(0, 3)],
  term ((9618078051221123 : Rat) / 52219282713192) [(0, 3), (1, 1), (3, 1)],
  term ((-1415030821112827 : Rat) / 8703213785532) [(0, 3), (1, 1), (7, 1)],
  term ((4290098422675 : Rat) / 26979737904) [(0, 3), (1, 1), (9, 1)],
  term ((407632441893949 : Rat) / 4351606892766) [(0, 3), (1, 1), (11, 1)],
  term ((-172719264922777 : Rat) / 1065699647208) [(0, 3), (1, 1), (13, 1)],
  term ((925 : Rat) / 84) [(0, 3), (1, 1), (13, 1), (16, 1)],
  term ((-221606511510779 : Rat) / 2486632510152) [(0, 3), (1, 1), (15, 1)],
  term ((-193 : Rat) / 21) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 3), (1, 2)],
  term ((115215333378687515 : Rat) / 52219282713192) [(0, 3), (3, 1), (7, 1)],
  term ((1083928664767 : Rat) / 2569498848) [(0, 3), (3, 1), (9, 1)],
  term ((-57708637489738159 : Rat) / 52219282713192) [(0, 3), (3, 1), (11, 1)],
  term ((-295491384565579 : Rat) / 710466431472) [(0, 3), (3, 1), (13, 1)],
  term ((1095 : Rat) / 56) [(0, 3), (3, 1), (13, 1), (16, 1)],
  term ((42216658949275829 : Rat) / 52219282713192) [(0, 3), (3, 1), (15, 1)],
  term ((-223 : Rat) / 14) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((-13518058438706705 : Rat) / 17406427571064) [(0, 3), (3, 2)],
  term ((-27619545035095 : Rat) / 13489868952) [(0, 3), (7, 1), (9, 1)],
  term ((23423412091316483 : Rat) / 8703213785532) [(0, 3), (7, 1), (11, 1)],
  term ((1119074972569573 : Rat) / 532849823604) [(0, 3), (7, 1), (13, 1)],
  term ((-2785 : Rat) / 42) [(0, 3), (7, 1), (13, 1), (16, 1)],
  term ((-15294781938209561 : Rat) / 5802142523688) [(0, 3), (7, 1), (15, 1)],
  term ((1118 : Rat) / 21) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((-9378594870573889 : Rat) / 4351606892766) [(0, 3), (7, 2)],
  term ((-21246305150473 : Rat) / 53959475808) [(0, 3), (9, 1), (11, 1)],
  term ((2465448966955 : Rat) / 13489868952) [(0, 3), (9, 1), (15, 1)],
  term ((826808979291835 : Rat) / 2131399294416) [(0, 3), (11, 1), (13, 1)],
  term ((-2455 : Rat) / 168) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((-139108534951591 : Rat) / 828877503384) [(0, 3), (11, 1), (15, 1)],
  term ((487 : Rat) / 42) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-81650386742723 : Rat) / 8703213785532) [(0, 3), (11, 2)],
  term ((-92543245239841 : Rat) / 532849823604) [(0, 3), (13, 1), (15, 1)],
  term ((1165 : Rat) / 42) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3294374163479327 : Rat) / 13054820678298) [(0, 3), (14, 1)],
  term ((8188886026951829 : Rat) / 26109641356596) [(0, 3), (15, 2)],
  term ((-494 : Rat) / 21) [(0, 3), (15, 2), (16, 1)],
  term ((-556087218462152 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((18194007747301457 : Rat) / 11189846295684) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((7144371499837 : Rat) / 26979737904) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((-1415552839535231 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)],
  term ((216724759555247449 : Rat) / 78328924069788) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-300115153365463 : Rat) / 1065699647208) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((355 : Rat) / 84) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((922649885837051 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-31017977519966095 : Rat) / 78328924069788) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((81905050605654364 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-67 : Rat) / 21) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-1825255152115579 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((2217817969393 : Rat) / 53959475808) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-10796791712760385 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-72092317645171 : Rat) / 2131399294416) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((1615 : Rat) / 168) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-5197998617271370 : Rat) / 2175803446383) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-49 : Rat) / 6) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((10862912321535193 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 3)],
  term ((3990050839829666 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-288813327389680 : Rat) / 932487191307) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1)],
  term ((6863305354755691 : Rat) / 8703213785532) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((170 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-306629898617197 : Rat) / 1864974382614) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term ((59689906938890213 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((-15383607147144655 : Rat) / 4351606892766) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-32 : Rat) / 9) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((8117517876221 : Rat) / 8993245968) [(1, 1), (2, 1), (9, 1), (10, 1), (14, 1)],
  term ((-259476013612049 : Rat) / 80939213712) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-310624847819 : Rat) / 2248311492) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-1207744163548 : Rat) / 722671551) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((-91742940193255 : Rat) / 40469606856) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((-328288306993943 : Rat) / 355233215736) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1)],
  term ((165 : Rat) / 4) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((40455478956927709 : Rat) / 26109641356596) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((-235 : Rat) / 7) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10636157154957011 : Rat) / 3197098941624) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((3025 : Rat) / 252) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4637051076209395 : Rat) / 6527410339149) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((-37507036691901419 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-13334377689654277 : Rat) / 6527410339149) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-1033 : Rat) / 63) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((1472176447223 : Rat) / 12686900562) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-205 : Rat) / 7) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((38902852098606227 : Rat) / 19582231017447) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-760 : Rat) / 63) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((11119522789707949 : Rat) / 13054820678298) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((172 : Rat) / 7) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-749547099794872 : Rat) / 932487191307) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((472 : Rat) / 63) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (2, 1), (14, 3), (15, 1)],
  term ((157800526470211 : Rat) / 1864974382614) [(1, 1), (2, 1), (15, 1)],
  term ((-922649885837051 : Rat) / 8703213785532) [(1, 1), (2, 2), (3, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((1415552839535231 : Rat) / 52219282713192) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((-34159496409245063 : Rat) / 156657848139576) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((306629898617197 : Rat) / 3729948765228) [(1, 1), (2, 2), (7, 1)],
  term ((144406663694840 : Rat) / 932487191307) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((-18679798878219685 : Rat) / 17406427571064) [(1, 1), (2, 2), (7, 1), (14, 1)],
  term ((310624847819 : Rat) / 4496622984) [(1, 1), (2, 2), (9, 1)],
  term ((-8117517876221 : Rat) / 17986491936) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((60980219250509 : Rat) / 80939213712) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((328288306993943 : Rat) / 710466431472) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((-165 : Rat) / 8) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-40455478956927709 : Rat) / 52219282713192) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((235 : Rat) / 14) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((4637051076209395 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1)],
  term ((59100620117422189 : Rat) / 26109641356596) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-1472176447223 : Rat) / 25373801124) [(1, 1), (2, 2), (13, 1)],
  term ((-145013837700584771 : Rat) / 156657848139576) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((-475 : Rat) / 36) [(1, 1), (2, 2), (13, 1), (14, 1), (16, 1)],
  term ((205 : Rat) / 14) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((17312965666119041 : Rat) / 13054820678298) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((793 : Rat) / 63) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 2), (14, 2), (15, 1)],
  term ((-11119522789707949 : Rat) / 26109641356596) [(1, 1), (2, 2), (15, 1)],
  term ((-86 : Rat) / 7) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((10862912321535193 : Rat) / 52219282713192) [(1, 1), (2, 3), (3, 1)],
  term ((-1825255152115579 : Rat) / 52219282713192) [(1, 1), (2, 3), (7, 1)],
  term ((2217817969393 : Rat) / 53959475808) [(1, 1), (2, 3), (9, 1)],
  term ((-10796791712760385 : Rat) / 26109641356596) [(1, 1), (2, 3), (11, 1)],
  term ((-72092317645171 : Rat) / 2131399294416) [(1, 1), (2, 3), (13, 1)],
  term ((1615 : Rat) / 168) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((-12066135967554937 : Rat) / 26109641356596) [(1, 1), (2, 3), (15, 1)],
  term ((-49 : Rat) / 6) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((3990050839829666 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-288813327389680 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((59689906938890213 : Rat) / 26109641356596) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-306629898617197 : Rat) / 1864974382614) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((8117517876221 : Rat) / 8993245968) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1207744163548 : Rat) / 722671551) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-310624847819 : Rat) / 2248311492) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-328288306993943 : Rat) / 355233215736) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((165 : Rat) / 4) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((40455478956927709 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-235 : Rat) / 7) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-37507036691901419 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4637051076209395 : Rat) / 6527410339149) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((38902852098606227 : Rat) / 19582231017447) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-760 : Rat) / 63) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1472176447223 : Rat) / 12686900562) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-205 : Rat) / 7) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-749547099794872 : Rat) / 932487191307) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((472 : Rat) / 63) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((11119522789707949 : Rat) / 13054820678298) [(1, 1), (3, 1), (15, 2)],
  term ((172 : Rat) / 7) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-556087218462152 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((306629898617197 : Rat) / 3729948765228) [(1, 1), (3, 2), (7, 1)],
  term ((144406663694840 : Rat) / 932487191307) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((-59689906938890213 : Rat) / 52219282713192) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((310624847819 : Rat) / 4496622984) [(1, 1), (3, 2), (9, 1)],
  term ((-8117517876221 : Rat) / 17986491936) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((603872081774 : Rat) / 722671551) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((328288306993943 : Rat) / 710466431472) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((-165 : Rat) / 8) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-43286584635998171 : Rat) / 52219282713192) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((235 : Rat) / 14) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((4637051076209395 : Rat) / 13054820678298) [(1, 1), (3, 2), (11, 1)],
  term ((37507036691901419 : Rat) / 26109641356596) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-1472176447223 : Rat) / 25373801124) [(1, 1), (3, 2), (13, 1)],
  term ((-38902852098606227 : Rat) / 39164462034894) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((380 : Rat) / 63) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((205 : Rat) / 14) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((463000671418529 : Rat) / 78328924069788) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-236 : Rat) / 63) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((-5583623474685643 : Rat) / 26109641356596) [(1, 1), (3, 2), (15, 1)],
  term ((-86 : Rat) / 7) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-922649885837051 : Rat) / 8703213785532) [(1, 1), (3, 3)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 1), (3, 3), (6, 1)],
  term ((1415552839535231 : Rat) / 52219282713192) [(1, 1), (3, 3), (10, 1)],
  term ((31017977519966095 : Rat) / 156657848139576) [(1, 1), (3, 3), (14, 1)],
  term ((-15252936479749783 : Rat) / 26109641356596) [(1, 1), (15, 1)],
  term ((15252936479749783 : Rat) / 52219282713192) [(1, 2)],
  term ((-157800526470211 : Rat) / 3729948765228) [(1, 2), (2, 1)],
  term ((-60941144387381731 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-151944009278685139 : Rat) / 156657848139576) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-985 : Rat) / 84) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-94610174126957543 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((205 : Rat) / 21) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((39309341045806045 : Rat) / 52219282713192) [(1, 2), (2, 1), (3, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((-6863305354755691 : Rat) / 17406427571064) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((22162783144659193 : Rat) / 13054820678298) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((16 : Rat) / 9) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(1, 2), (2, 1), (7, 2)],
  term ((259476013612049 : Rat) / 161878427424) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((49198197050717 : Rat) / 40469606856) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-10636157154957011 : Rat) / 6394197883248) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-3025 : Rat) / 504) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((422930996148982 : Rat) / 2175803446383) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((1033 : Rat) / 126) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72092317645171 : Rat) / 1065699647208) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((1615 : Rat) / 84) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19968 : Rat) / 553) [(1, 2), (2, 1), (14, 1)],
  term ((45864690786755 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 2)],
  term ((-12066135967554937 : Rat) / 13054820678298) [(1, 2), (2, 1), (15, 2)],
  term ((-49 : Rat) / 3) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((9984 : Rat) / 553) [(1, 2), (2, 2)],
  term ((229323453933775 : Rat) / 52219282713192) [(1, 2), (2, 2), (14, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 3)],
  term ((556087218462152 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((1415552839535231 : Rat) / 26109641356596) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((7788892898081590 : Rat) / 19582231017447) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-1079779879389947 : Rat) / 4351606892766) [(1, 2), (3, 1), (15, 1)],
  term ((9984 : Rat) / 553) [(1, 2), (3, 2)],
  term ((-45864690786755 : Rat) / 52219282713192) [(1, 2), (3, 2), (14, 1)],
  term ((-3990050839829666 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((288813327389680 : Rat) / 932487191307) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-59689906938890213 : Rat) / 26109641356596) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((306629898617197 : Rat) / 1864974382614) [(1, 2), (7, 1), (15, 1)],
  term ((-8117517876221 : Rat) / 8993245968) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((1207744163548 : Rat) / 722671551) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((310624847819 : Rat) / 2248311492) [(1, 2), (9, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((328288306993943 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-165 : Rat) / 4) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40455478956927709 : Rat) / 26109641356596) [(1, 2), (10, 1), (15, 2)],
  term ((235 : Rat) / 7) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((37507036691901419 : Rat) / 13054820678298) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((4637051076209395 : Rat) / 6527410339149) [(1, 2), (11, 1), (15, 1)],
  term ((-38902852098606227 : Rat) / 19582231017447) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((760 : Rat) / 63) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1472176447223 : Rat) / 12686900562) [(1, 2), (13, 1), (15, 1)],
  term ((205 : Rat) / 7) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((749547099794872 : Rat) / 932487191307) [(1, 2), (14, 1), (15, 2)],
  term ((-472 : Rat) / 63) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 2), (14, 2), (15, 2)],
  term ((-11119522789707949 : Rat) / 13054820678298) [(1, 2), (15, 2)],
  term ((-172 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((-10862912321535193 : Rat) / 52219282713192) [(1, 3), (2, 1), (3, 1)],
  term ((1825255152115579 : Rat) / 52219282713192) [(1, 3), (2, 1), (7, 1)],
  term ((-2217817969393 : Rat) / 53959475808) [(1, 3), (2, 1), (9, 1)],
  term ((10796791712760385 : Rat) / 26109641356596) [(1, 3), (2, 1), (11, 1)],
  term ((72092317645171 : Rat) / 2131399294416) [(1, 3), (2, 1), (13, 1)],
  term ((-1615 : Rat) / 168) [(1, 3), (2, 1), (13, 1), (16, 1)],
  term ((2982135473798668 : Rat) / 6527410339149) [(1, 3), (2, 1), (15, 1)],
  term ((49 : Rat) / 6) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((922649885837051 : Rat) / 8703213785532) [(1, 3), (3, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 3), (3, 1), (6, 1)],
  term ((-1415552839535231 : Rat) / 52219282713192) [(1, 3), (3, 1), (10, 1)],
  term ((-31017977519966095 : Rat) / 156657848139576) [(1, 3), (3, 1), (14, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 3), (6, 1), (7, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 3), (6, 1), (11, 1)],
  term ((-306629898617197 : Rat) / 3729948765228) [(1, 3), (7, 1)],
  term ((-144406663694840 : Rat) / 932487191307) [(1, 3), (7, 1), (10, 1)],
  term ((59689906938890213 : Rat) / 52219282713192) [(1, 3), (7, 1), (14, 1)],
  term ((-310624847819 : Rat) / 4496622984) [(1, 3), (9, 1)],
  term ((8117517876221 : Rat) / 17986491936) [(1, 3), (9, 1), (10, 1)],
  term ((-603872081774 : Rat) / 722671551) [(1, 3), (9, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(1, 3), (10, 1), (11, 1)],
  term ((-328288306993943 : Rat) / 710466431472) [(1, 3), (10, 1), (13, 1)],
  term ((165 : Rat) / 8) [(1, 3), (10, 1), (13, 1), (16, 1)],
  term ((40455478956927709 : Rat) / 52219282713192) [(1, 3), (10, 1), (15, 1)],
  term ((-235 : Rat) / 14) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((-4637051076209395 : Rat) / 13054820678298) [(1, 3), (11, 1)],
  term ((-37507036691901419 : Rat) / 26109641356596) [(1, 3), (11, 1), (14, 1)],
  term ((1472176447223 : Rat) / 25373801124) [(1, 3), (13, 1)],
  term ((38902852098606227 : Rat) / 39164462034894) [(1, 3), (13, 1), (14, 1)],
  term ((-380 : Rat) / 63) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((-205 : Rat) / 14) [(1, 3), (13, 1), (16, 1)],
  term ((-10539524087914963 : Rat) / 26109641356596) [(1, 3), (14, 1), (15, 1)],
  term ((236 : Rat) / 63) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 3), (14, 2), (15, 1)],
  term ((12062302751025325 : Rat) / 26109641356596) [(1, 3), (15, 1)],
  term ((86 : Rat) / 7) [(1, 3), (15, 1), (16, 1)],
  term ((-9984 : Rat) / 553) [(1, 4)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 4), (2, 1)],
  term ((45864690786755 : Rat) / 52219282713192) [(1, 4), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6863305354755691 : Rat) / 8703213785532) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 63) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((15383607147144655 : Rat) / 4351606892766) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((32 : Rat) / 9) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((259476013612049 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((91742940193255 : Rat) / 40469606856) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-10636157154957011 : Rat) / 3197098941624) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3025 : Rat) / 252) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((13334377689654277 : Rat) / 6527410339149) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((1033 : Rat) / 63) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-157800526470211 : Rat) / 1864974382614) [(2, 1), (3, 1), (15, 1)],
  term ((157800526470211 : Rat) / 3729948765228) [(2, 1), (3, 2)],
  term ((-6788130415625 : Rat) / 20234803428) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((6863305354755691 : Rat) / 17406427571064) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((85 : Rat) / 63) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-260334753099065357 : Rat) / 78328924069788) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(2, 1), (3, 2), (7, 2)],
  term ((-259476013612049 : Rat) / 161878427424) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((-119829508600945 : Rat) / 80939213712) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((10636157154957011 : Rat) / 6394197883248) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((3025 : Rat) / 504) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-231950275416610801 : Rat) / 78328924069788) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-1033 : Rat) / 126) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-985 : Rat) / 42) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-127611693308643917 : Rat) / 39164462034894) [(2, 1), (3, 2), (15, 2)],
  term ((410 : Rat) / 21) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((60941144387381731 : Rat) / 78328924069788) [(2, 1), (3, 3), (7, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 1), (3, 3), (9, 1)],
  term ((151944009278685139 : Rat) / 156657848139576) [(2, 1), (3, 3), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 1), (3, 3), (13, 1)],
  term ((985 : Rat) / 84) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((245952498663142847 : Rat) / 78328924069788) [(2, 1), (3, 3), (15, 1)],
  term ((-205 : Rat) / 21) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 4)],
  term ((15252936479749783 : Rat) / 26109641356596) [(2, 1), (14, 1)],
  term ((-15252936479749783 : Rat) / 52219282713192) [(2, 2)],
  term ((-60941144387381731 : Rat) / 39164462034894) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-151944009278685139 : Rat) / 78328924069788) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-985 : Rat) / 42) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-127611693308643917 : Rat) / 39164462034894) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((410 : Rat) / 21) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2817638222726165 : Rat) / 1864974382614) [(2, 2), (3, 2), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 2), (7, 1), (9, 1), (14, 1)],
  term ((-6863305354755691 : Rat) / 8703213785532) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 63) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((15383607147144655 : Rat) / 4351606892766) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 9) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(2, 2), (7, 2), (14, 1)],
  term ((259476013612049 : Rat) / 80939213712) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((91742940193255 : Rat) / 40469606856) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-10636157154957011 : Rat) / 3197098941624) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3025 : Rat) / 252) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13334377689654277 : Rat) / 6527410339149) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((1033 : Rat) / 63) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((-157800526470211 : Rat) / 1864974382614) [(2, 2), (14, 1)],
  term ((157800526470211 : Rat) / 3729948765228) [(2, 3)],
  term ((60941144387381731 : Rat) / 78328924069788) [(2, 3), (3, 1), (7, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 3), (3, 1), (9, 1)],
  term ((151944009278685139 : Rat) / 156657848139576) [(2, 3), (3, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 3), (3, 1), (13, 1)],
  term ((985 : Rat) / 84) [(2, 3), (3, 1), (13, 1), (16, 1)],
  term ((127611693308643917 : Rat) / 78328924069788) [(2, 3), (3, 1), (15, 1)],
  term ((-205 : Rat) / 21) [(2, 3), (3, 1), (15, 1), (16, 1)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 3), (3, 2)],
  term ((-6788130415625 : Rat) / 20234803428) [(2, 3), (7, 1), (9, 1)],
  term ((6863305354755691 : Rat) / 17406427571064) [(2, 3), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(2, 3), (7, 1), (13, 1)],
  term ((85 : Rat) / 63) [(2, 3), (7, 1), (13, 1), (16, 1)],
  term ((-15383607147144655 : Rat) / 8703213785532) [(2, 3), (7, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(2, 3), (7, 2)],
  term ((-259476013612049 : Rat) / 161878427424) [(2, 3), (9, 1), (11, 1)],
  term ((-91742940193255 : Rat) / 80939213712) [(2, 3), (9, 1), (15, 1)],
  term ((10636157154957011 : Rat) / 6394197883248) [(2, 3), (11, 1), (13, 1)],
  term ((3025 : Rat) / 504) [(2, 3), (11, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 3), (11, 1), (14, 1), (15, 1)],
  term ((-13334377689654277 : Rat) / 13054820678298) [(2, 3), (11, 1), (15, 1)],
  term ((-1033 : Rat) / 126) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((15252936479749783 : Rat) / 26109641356596) [(3, 1), (15, 1)],
  term ((-15252936479749783 : Rat) / 52219282713192) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_29_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_29_0000_0099
      rs_R009_ueqv_R009YNNNN_block_29_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
