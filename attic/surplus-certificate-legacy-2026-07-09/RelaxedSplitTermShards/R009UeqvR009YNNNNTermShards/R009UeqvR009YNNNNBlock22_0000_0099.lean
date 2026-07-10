/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 22:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (10, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (11, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0000 : Poly :=
[
  term ((598861995878285 : Rat) / 52219282713192) []
]

/-- Partial product 0 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0000 : Poly :=
[
  term ((-598861995878285 : Rat) / 26109641356596) [(0, 1), (10, 1)],
  term ((598861995878285 : Rat) / 52219282713192) [(0, 2)],
  term ((-598861995878285 : Rat) / 26109641356596) [(1, 1), (11, 1)],
  term ((598861995878285 : Rat) / 52219282713192) [(1, 2)],
  term ((598861995878285 : Rat) / 26109641356596) [(2, 1), (10, 1)],
  term ((-598861995878285 : Rat) / 52219282713192) [(2, 2)],
  term ((598861995878285 : Rat) / 26109641356596) [(3, 1), (11, 1)],
  term ((-598861995878285 : Rat) / 52219282713192) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0000
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0001 : Poly :=
[
  term ((-395910373848515 : Rat) / 8703213785532) [(0, 1)]
]

/-- Partial product 1 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0001 : Poly :=
[
  term ((395910373848515 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(0, 1), (1, 2)],
  term ((-395910373848515 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(0, 1), (2, 2)],
  term ((-395910373848515 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(0, 1), (3, 2)],
  term ((395910373848515 : Rat) / 4351606892766) [(0, 2), (10, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0001
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0002 : Poly :=
[
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0002 : Poly :=
[
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 3)],
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 1), (1, 3), (3, 1)],
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 3), (1, 1), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0002
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0003 : Poly :=
[
  term ((-1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 3 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0003 : Poly :=
[
  term ((-1388685846372571 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((-1388685846372571 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((1388685846372571 : Rat) / 2175803446383) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 3), (7, 1)],
  term ((1388685846372571 : Rat) / 2175803446383) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((-1388685846372571 : Rat) / 4351606892766) [(0, 3), (1, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0003
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0004 : Poly :=
[
  term ((-6753375187897 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 4 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0004 : Poly :=
[
  term ((-6753375187897 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((6753375187897 : Rat) / 26979737904) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-6753375187897 : Rat) / 13489868952) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((6753375187897 : Rat) / 26979737904) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((6753375187897 : Rat) / 13489868952) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-6753375187897 : Rat) / 26979737904) [(0, 1), (1, 3), (9, 1)],
  term ((6753375187897 : Rat) / 13489868952) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((-6753375187897 : Rat) / 26979737904) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0004
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0005 : Poly :=
[
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 5 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0005 : Poly :=
[
  term ((535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 2), (11, 2)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 3), (11, 1)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 3), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0005
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0006 : Poly :=
[
  term ((286730682782923 : Rat) / 1065699647208) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 6 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0006 : Poly :=
[
  term ((286730682782923 : Rat) / 532849823604) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-286730682782923 : Rat) / 1065699647208) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((286730682782923 : Rat) / 532849823604) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-286730682782923 : Rat) / 1065699647208) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-286730682782923 : Rat) / 532849823604) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((286730682782923 : Rat) / 1065699647208) [(0, 1), (1, 3), (13, 1)],
  term ((-286730682782923 : Rat) / 532849823604) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((286730682782923 : Rat) / 1065699647208) [(0, 3), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0006
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0007 : Poly :=
[
  term ((-295 : Rat) / 84) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0007 : Poly :=
[
  term ((-295 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((295 : Rat) / 84) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-295 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((295 : Rat) / 84) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((295 : Rat) / 42) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-295 : Rat) / 84) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term ((295 : Rat) / 42) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-295 : Rat) / 84) [(0, 3), (1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0007
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0008 : Poly :=
[
  term ((-91911860975884 : Rat) / 310829063769) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 8 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0008 : Poly :=
[
  term ((-183823721951768 : Rat) / 310829063769) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((91911860975884 : Rat) / 310829063769) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-183823721951768 : Rat) / 310829063769) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((91911860975884 : Rat) / 310829063769) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((183823721951768 : Rat) / 310829063769) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-91911860975884 : Rat) / 310829063769) [(0, 1), (1, 3), (15, 1)],
  term ((183823721951768 : Rat) / 310829063769) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-91911860975884 : Rat) / 310829063769) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0008
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0009 : Poly :=
[
  term ((55 : Rat) / 21) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0009 : Poly :=
[
  term ((110 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 21) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((110 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 21) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-110 : Rat) / 21) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 21) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-110 : Rat) / 21) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 21) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0009
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0010 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2)]
]

/-- Partial product 10 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0010 : Poly :=
[
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 1), (10, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (3, 2)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (11, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 4)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (10, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 3), (1, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0010
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0011 : Poly :=
[
  term ((-6331923393017665 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 11 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0011 : Poly :=
[
  term ((6331923393017665 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((-6331923393017665 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((6331923393017665 : Rat) / 26109641356596) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((-6331923393017665 : Rat) / 13054820678298) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((6331923393017665 : Rat) / 26109641356596) [(0, 1), (3, 3), (7, 1)],
  term ((6331923393017665 : Rat) / 13054820678298) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(0, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0011
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0012 : Poly :=
[
  term ((-21722017330 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 12 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0012 : Poly :=
[
  term ((43444034660 : Rat) / 187359291) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-21722017330 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((-43444034660 : Rat) / 187359291) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((-43444034660 : Rat) / 187359291) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (3, 3), (9, 1)],
  term ((43444034660 : Rat) / 187359291) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((-21722017330 : Rat) / 187359291) [(0, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0012
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0013 : Poly :=
[
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 13 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0013 : Poly :=
[
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2), (11, 2)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(0, 1), (3, 3), (11, 1)],
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0013
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0014 : Poly :=
[
  term ((18824853140 : Rat) / 187359291) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 14 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0014 : Poly :=
[
  term ((-37649706280 : Rat) / 187359291) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((18824853140 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((37649706280 : Rat) / 187359291) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-18824853140 : Rat) / 187359291) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((37649706280 : Rat) / 187359291) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-18824853140 : Rat) / 187359291) [(0, 1), (3, 3), (13, 1)],
  term ((-37649706280 : Rat) / 187359291) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((18824853140 : Rat) / 187359291) [(0, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0014
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0015 : Poly :=
[
  term ((-40 : Rat) / 7) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0015 : Poly :=
[
  term ((80 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((80 : Rat) / 7) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(0, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0015
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0016 : Poly :=
[
  term ((-10052062240 : Rat) / 187359291) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 16 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0016 : Poly :=
[
  term ((20104124480 : Rat) / 187359291) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-10052062240 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-20104124480 : Rat) / 187359291) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((10052062240 : Rat) / 187359291) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-20104124480 : Rat) / 187359291) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((10052062240 : Rat) / 187359291) [(0, 1), (3, 3), (15, 1)],
  term ((20104124480 : Rat) / 187359291) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-10052062240 : Rat) / 187359291) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0016
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0017 : Poly :=
[
  term ((32 : Rat) / 7) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0017 : Poly :=
[
  term ((-64 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0017
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0018 : Poly :=
[
  term ((41195805866345 : Rat) / 26979737904) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 18 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0018 : Poly :=
[
  term ((-41195805866345 : Rat) / 13489868952) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(0, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0018
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0019 : Poly :=
[
  term ((-3835099989555931 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 19 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0019 : Poly :=
[
  term ((3835099989555931 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((-3835099989555931 : Rat) / 4351606892766) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-3835099989555931 : Rat) / 2175803446383) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((3835099989555931 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-3835099989555931 : Rat) / 2175803446383) [(0, 1), (3, 1), (7, 1), (11, 2)],
  term ((3835099989555931 : Rat) / 4351606892766) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((3835099989555931 : Rat) / 2175803446383) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-3835099989555931 : Rat) / 4351606892766) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0019
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0020 : Poly :=
[
  term ((-1679838738623195 : Rat) / 1065699647208) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 20 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0020 : Poly :=
[
  term ((1679838738623195 : Rat) / 532849823604) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(0, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0020
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0021 : Poly :=
[
  term ((2615 : Rat) / 84) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0021 : Poly :=
[
  term ((-2615 : Rat) / 42) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 42) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 42) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 42) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(0, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0021
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0022 : Poly :=
[
  term ((3944511525918512 : Rat) / 2175803446383) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 22 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0022 : Poly :=
[
  term ((-7889023051837024 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((3944511525918512 : Rat) / 2175803446383) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((7889023051837024 : Rat) / 2175803446383) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-3944511525918512 : Rat) / 2175803446383) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((7889023051837024 : Rat) / 2175803446383) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-3944511525918512 : Rat) / 2175803446383) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-7889023051837024 : Rat) / 2175803446383) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((3944511525918512 : Rat) / 2175803446383) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0022
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0023 : Poly :=
[
  term ((-503 : Rat) / 21) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0023 : Poly :=
[
  term ((1006 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-503 : Rat) / 21) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1006 : Rat) / 21) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((503 : Rat) / 21) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1006 : Rat) / 21) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((503 : Rat) / 21) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1006 : Rat) / 21) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-503 : Rat) / 21) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0023
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0024 : Poly :=
[
  term ((11857694119158851 : Rat) / 8703213785532) [(0, 1), (7, 2)]
]

/-- Partial product 24 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0024 : Poly :=
[
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 2), (11, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(0, 1), (1, 2), (7, 2)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(0, 1), (2, 2), (7, 2)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(0, 1), (3, 2), (7, 2)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 2), (7, 2), (10, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(0, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0024
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0025 : Poly :=
[
  term ((-7900297702921 : Rat) / 107918951616) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 25 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0025 : Poly :=
[
  term ((7900297702921 : Rat) / 53959475808) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-7900297702921 : Rat) / 107918951616) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-7900297702921 : Rat) / 53959475808) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((7900297702921 : Rat) / 107918951616) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-7900297702921 : Rat) / 53959475808) [(0, 1), (3, 1), (9, 1), (11, 2)],
  term ((7900297702921 : Rat) / 107918951616) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((7900297702921 : Rat) / 53959475808) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-7900297702921 : Rat) / 107918951616) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0025
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0026 : Poly :=
[
  term ((10861008665 : Rat) / 187359291) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 26 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0026 : Poly :=
[
  term ((-21722017330 : Rat) / 187359291) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-21722017330 : Rat) / 187359291) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0026
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0027 : Poly :=
[
  term ((314509675014331 : Rat) / 4262798588832) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 27 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0027 : Poly :=
[
  term ((-314509675014331 : Rat) / 2131399294416) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((314509675014331 : Rat) / 4262798588832) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((314509675014331 : Rat) / 2131399294416) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-314509675014331 : Rat) / 4262798588832) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((314509675014331 : Rat) / 2131399294416) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((-314509675014331 : Rat) / 4262798588832) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-314509675014331 : Rat) / 2131399294416) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((314509675014331 : Rat) / 4262798588832) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0027
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0028 : Poly :=
[
  term ((-535 : Rat) / 336) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0028 : Poly :=
[
  term ((535 : Rat) / 168) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-535 : Rat) / 336) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-535 : Rat) / 168) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((535 : Rat) / 336) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-535 : Rat) / 168) [(0, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((535 : Rat) / 336) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((535 : Rat) / 168) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-535 : Rat) / 336) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0028
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0029 : Poly :=
[
  term ((32207371625563 : Rat) / 276292501128) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 29 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0029 : Poly :=
[
  term ((-32207371625563 : Rat) / 138146250564) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((32207371625563 : Rat) / 276292501128) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((32207371625563 : Rat) / 138146250564) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-32207371625563 : Rat) / 276292501128) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((32207371625563 : Rat) / 138146250564) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-32207371625563 : Rat) / 276292501128) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-32207371625563 : Rat) / 138146250564) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((32207371625563 : Rat) / 276292501128) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0029
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0030 : Poly :=
[
  term ((103 : Rat) / 84) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0030 : Poly :=
[
  term ((-103 : Rat) / 42) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((103 : Rat) / 84) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((103 : Rat) / 42) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-103 : Rat) / 84) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((103 : Rat) / 42) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-103 : Rat) / 84) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-103 : Rat) / 42) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((103 : Rat) / 84) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0030
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0031 : Poly :=
[
  term ((553040367401411 : Rat) / 8703213785532) [(0, 1), (11, 2)]
]

/-- Partial product 31 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0031 : Poly :=
[
  term ((-553040367401411 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 3)],
  term ((553040367401411 : Rat) / 8703213785532) [(0, 1), (1, 2), (11, 2)],
  term ((553040367401411 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-553040367401411 : Rat) / 8703213785532) [(0, 1), (2, 2), (11, 2)],
  term ((553040367401411 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 3)],
  term ((-553040367401411 : Rat) / 8703213785532) [(0, 1), (3, 2), (11, 2)],
  term ((-553040367401411 : Rat) / 4351606892766) [(0, 2), (10, 1), (11, 2)],
  term ((553040367401411 : Rat) / 8703213785532) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0031
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0032 : Poly :=
[
  term ((-10839925930 : Rat) / 187359291) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 32 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0032 : Poly :=
[
  term ((21679851860 : Rat) / 187359291) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10839925930 : Rat) / 187359291) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-21679851860 : Rat) / 187359291) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((10839925930 : Rat) / 187359291) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-21679851860 : Rat) / 187359291) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((10839925930 : Rat) / 187359291) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((21679851860 : Rat) / 187359291) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-10839925930 : Rat) / 187359291) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0032
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0033 : Poly :=
[
  term ((20 : Rat) / 7) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0033 : Poly :=
[
  term ((-40 : Rat) / 7) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 7) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 7) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0033
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0034 : Poly :=
[
  term ((327683327437187 : Rat) / 2175803446383) [(0, 1), (14, 1)]
]

/-- Partial product 34 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0034 : Poly :=
[
  term ((-655366654874374 : Rat) / 2175803446383) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(0, 1), (1, 2), (14, 1)],
  term ((655366654874374 : Rat) / 2175803446383) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 1), (2, 2), (14, 1)],
  term ((655366654874374 : Rat) / 2175803446383) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 1), (3, 2), (14, 1)],
  term ((-655366654874374 : Rat) / 2175803446383) [(0, 2), (10, 1), (14, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(0, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0034
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0035 : Poly :=
[
  term ((-83561023229632 : Rat) / 725267815461) [(0, 1), (15, 2)]
]

/-- Partial product 35 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0035 : Poly :=
[
  term ((167122046459264 : Rat) / 725267815461) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-83561023229632 : Rat) / 725267815461) [(0, 1), (1, 2), (15, 2)],
  term ((-167122046459264 : Rat) / 725267815461) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((83561023229632 : Rat) / 725267815461) [(0, 1), (2, 2), (15, 2)],
  term ((-167122046459264 : Rat) / 725267815461) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((83561023229632 : Rat) / 725267815461) [(0, 1), (3, 2), (15, 2)],
  term ((167122046459264 : Rat) / 725267815461) [(0, 2), (10, 1), (15, 2)],
  term ((-83561023229632 : Rat) / 725267815461) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0035
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0036 : Poly :=
[
  term ((-16 : Rat) / 7) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0036 : Poly :=
[
  term ((32 : Rat) / 7) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0036
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0037 : Poly :=
[
  term ((1995025419914833 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 37 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0037 : Poly :=
[
  term ((-1995025419914833 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((1995025419914833 : Rat) / 26109641356596) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((1995025419914833 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-1995025419914833 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((1995025419914833 : Rat) / 13054820678298) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((-1995025419914833 : Rat) / 26109641356596) [(1, 1), (2, 3), (7, 1)],
  term ((-1995025419914833 : Rat) / 13054820678298) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((1995025419914833 : Rat) / 26109641356596) [(1, 3), (2, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0037
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0038 : Poly :=
[
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 38 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0038 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (2, 3), (11, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (11, 2)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 3), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0038
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0039 : Poly :=
[
  term ((-464357836888642 : Rat) / 6527410339149) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 39 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0039 : Poly :=
[
  term ((928715673777284 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-464357836888642 : Rat) / 6527410339149) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-928715673777284 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((464357836888642 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-928715673777284 : Rat) / 6527410339149) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((464357836888642 : Rat) / 6527410339149) [(1, 1), (2, 3), (15, 1)],
  term ((928715673777284 : Rat) / 6527410339149) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-464357836888642 : Rat) / 6527410339149) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0039
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0040 : Poly :=
[
  term ((-3137849527878865 : Rat) / 52219282713192) [(1, 1), (3, 1)]
]

/-- Partial product 40 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0040 : Poly :=
[
  term ((3137849527878865 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((-3137849527878865 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1)],
  term ((-3137849527878865 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (10, 1)],
  term ((3137849527878865 : Rat) / 52219282713192) [(1, 1), (2, 2), (3, 1)],
  term ((-3137849527878865 : Rat) / 26109641356596) [(1, 1), (3, 2), (11, 1)],
  term ((3137849527878865 : Rat) / 52219282713192) [(1, 1), (3, 3)],
  term ((3137849527878865 : Rat) / 26109641356596) [(1, 2), (3, 1), (11, 1)],
  term ((-3137849527878865 : Rat) / 52219282713192) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0040
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0041 : Poly :=
[
  term ((278043609231076 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 41 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0041 : Poly :=
[
  term ((-556087218462152 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (6, 1), (10, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((556087218462152 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (6, 1), (10, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((556087218462152 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 1), (3, 3), (6, 1)],
  term ((-556087218462152 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 3), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0041
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0042 : Poly :=
[
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 42 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0042 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (10, 2)],
  term ((-45864690786755 : Rat) / 17406427571064) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 1), (2, 1), (3, 1), (10, 2)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (3, 3), (10, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 3), (3, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0042
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0043 : Poly :=
[
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 43 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0043 : Poly :=
[
  term ((556087218462152 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-556087218462152 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-556087218462152 : Rat) / 6527410339149) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 1), (3, 3), (14, 1)],
  term ((556087218462152 : Rat) / 6527410339149) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 3), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0043
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0044 : Poly :=
[
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 44 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0044 : Poly :=
[
  term ((3990050839829666 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((-3990050839829666 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (7, 1), (10, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((-3990050839829666 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((3990050839829666 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0044
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0045 : Poly :=
[
  term ((2632524997090913 : Rat) / 6527410339149) [(1, 1), (7, 1)]
]

/-- Partial product 45 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0045 : Poly :=
[
  term ((-5265049994181826 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((2632524997090913 : Rat) / 6527410339149) [(0, 2), (1, 1), (7, 1)],
  term ((5265049994181826 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-2632524997090913 : Rat) / 6527410339149) [(1, 1), (2, 2), (7, 1)],
  term ((5265049994181826 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-2632524997090913 : Rat) / 6527410339149) [(1, 1), (3, 2), (7, 1)],
  term ((-5265049994181826 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1)],
  term ((2632524997090913 : Rat) / 6527410339149) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0045
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0046 : Poly :=
[
  term ((8117695752019597 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 46 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0046 : Poly :=
[
  term ((-8117695752019597 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((8117695752019597 : Rat) / 26109641356596) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((8117695752019597 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1), (10, 2)],
  term ((-8117695752019597 : Rat) / 26109641356596) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((8117695752019597 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((-8117695752019597 : Rat) / 26109641356596) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((-8117695752019597 : Rat) / 13054820678298) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((8117695752019597 : Rat) / 26109641356596) [(1, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0046
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0047 : Poly :=
[
  term ((-14990364159433 : Rat) / 53959475808) [(1, 1), (9, 1)]
]

/-- Partial product 47 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0047 : Poly :=
[
  term ((14990364159433 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((-14990364159433 : Rat) / 53959475808) [(0, 2), (1, 1), (9, 1)],
  term ((-14990364159433 : Rat) / 26979737904) [(1, 1), (2, 1), (9, 1), (10, 1)],
  term ((14990364159433 : Rat) / 53959475808) [(1, 1), (2, 2), (9, 1)],
  term ((-14990364159433 : Rat) / 26979737904) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((14990364159433 : Rat) / 53959475808) [(1, 1), (3, 2), (9, 1)],
  term ((14990364159433 : Rat) / 26979737904) [(1, 2), (9, 1), (11, 1)],
  term ((-14990364159433 : Rat) / 53959475808) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0047
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0048 : Poly :=
[
  term ((-10541695010249 : Rat) / 35972983872) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 48 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0048 : Poly :=
[
  term ((10541695010249 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-10541695010249 : Rat) / 35972983872) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((-10541695010249 : Rat) / 17986491936) [(1, 1), (2, 1), (9, 1), (10, 2)],
  term ((10541695010249 : Rat) / 35972983872) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-10541695010249 : Rat) / 17986491936) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((10541695010249 : Rat) / 35972983872) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((10541695010249 : Rat) / 17986491936) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-10541695010249 : Rat) / 35972983872) [(1, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0048
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0049 : Poly :=
[
  term ((29952 : Rat) / 553) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 49 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0049 : Poly :=
[
  term ((-59904 : Rat) / 553) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((29952 : Rat) / 553) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (2, 1), (10, 2), (11, 1)],
  term ((-29952 : Rat) / 553) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-29952 : Rat) / 553) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((29952 : Rat) / 553) [(1, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0049
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0050 : Poly :=
[
  term ((420238704919547 : Rat) / 1420932862944) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 50 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0050 : Poly :=
[
  term ((-420238704919547 : Rat) / 710466431472) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((420238704919547 : Rat) / 1420932862944) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((420238704919547 : Rat) / 710466431472) [(1, 1), (2, 1), (10, 2), (13, 1)],
  term ((-420238704919547 : Rat) / 1420932862944) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((420238704919547 : Rat) / 710466431472) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((-420238704919547 : Rat) / 1420932862944) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((-420238704919547 : Rat) / 710466431472) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((420238704919547 : Rat) / 1420932862944) [(1, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0050
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0051 : Poly :=
[
  term ((-855 : Rat) / 112) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 51 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0051 : Poly :=
[
  term ((855 : Rat) / 56) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-855 : Rat) / 112) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-855 : Rat) / 56) [(1, 1), (2, 1), (10, 2), (13, 1), (16, 1)],
  term ((855 : Rat) / 112) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-855 : Rat) / 56) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((855 : Rat) / 112) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((855 : Rat) / 56) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-855 : Rat) / 112) [(1, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0051
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0052 : Poly :=
[
  term ((-5252407311298876 : Rat) / 6527410339149) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 52 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0052 : Poly :=
[
  term ((10504814622597752 : Rat) / 6527410339149) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-5252407311298876 : Rat) / 6527410339149) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-10504814622597752 : Rat) / 6527410339149) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((5252407311298876 : Rat) / 6527410339149) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-10504814622597752 : Rat) / 6527410339149) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((5252407311298876 : Rat) / 6527410339149) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((10504814622597752 : Rat) / 6527410339149) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5252407311298876 : Rat) / 6527410339149) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0052
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0053 : Poly :=
[
  term ((167 : Rat) / 28) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0053 : Poly :=
[
  term ((-167 : Rat) / 14) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((167 : Rat) / 28) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((167 : Rat) / 14) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((-167 : Rat) / 28) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((167 : Rat) / 14) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-167 : Rat) / 28) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-167 : Rat) / 14) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((167 : Rat) / 28) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0053
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0054 : Poly :=
[
  term ((29952 : Rat) / 553) [(1, 1), (11, 1)]
]

/-- Partial product 54 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0054 : Poly :=
[
  term ((-59904 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((29952 : Rat) / 553) [(0, 2), (1, 1), (11, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-29952 : Rat) / 553) [(1, 1), (2, 2), (11, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (3, 1), (11, 2)],
  term ((-29952 : Rat) / 553) [(1, 1), (3, 2), (11, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 2)],
  term ((29952 : Rat) / 553) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0054
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0055 : Poly :=
[
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 55 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0055 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (11, 2), (14, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0055
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0056 : Poly :=
[
  term ((612657449971195 : Rat) / 2131399294416) [(1, 1), (13, 1)]
]

/-- Partial product 56 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0056 : Poly :=
[
  term ((-612657449971195 : Rat) / 1065699647208) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((612657449971195 : Rat) / 2131399294416) [(0, 2), (1, 1), (13, 1)],
  term ((612657449971195 : Rat) / 1065699647208) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-612657449971195 : Rat) / 2131399294416) [(1, 1), (2, 2), (13, 1)],
  term ((612657449971195 : Rat) / 1065699647208) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-612657449971195 : Rat) / 2131399294416) [(1, 1), (3, 2), (13, 1)],
  term ((-612657449971195 : Rat) / 1065699647208) [(1, 2), (11, 1), (13, 1)],
  term ((612657449971195 : Rat) / 2131399294416) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0056
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0057 : Poly :=
[
  term ((-1495 : Rat) / 168) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0057 : Poly :=
[
  term ((1495 : Rat) / 84) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1495 : Rat) / 168) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-1495 : Rat) / 84) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((1495 : Rat) / 168) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-1495 : Rat) / 84) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((1495 : Rat) / 168) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((1495 : Rat) / 84) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1495 : Rat) / 168) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0057
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0058 : Poly :=
[
  term ((8117695752019597 : Rat) / 26109641356596) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 58 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0058 : Poly :=
[
  term ((-8117695752019597 : Rat) / 13054820678298) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((8117695752019597 : Rat) / 26109641356596) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((8117695752019597 : Rat) / 13054820678298) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8117695752019597 : Rat) / 26109641356596) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((8117695752019597 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8117695752019597 : Rat) / 26109641356596) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-8117695752019597 : Rat) / 13054820678298) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((8117695752019597 : Rat) / 26109641356596) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0058
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0059 : Poly :=
[
  term ((-38493409663518703 : Rat) / 52219282713192) [(1, 1), (15, 1)]
]

/-- Partial product 59 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0059 : Poly :=
[
  term ((38493409663518703 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-38493409663518703 : Rat) / 52219282713192) [(0, 2), (1, 1), (15, 1)],
  term ((-38493409663518703 : Rat) / 26109641356596) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((38493409663518703 : Rat) / 52219282713192) [(1, 1), (2, 2), (15, 1)],
  term ((-38493409663518703 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((38493409663518703 : Rat) / 52219282713192) [(1, 1), (3, 2), (15, 1)],
  term ((38493409663518703 : Rat) / 26109641356596) [(1, 2), (11, 1), (15, 1)],
  term ((-38493409663518703 : Rat) / 52219282713192) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0059
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0060 : Poly :=
[
  term ((295 : Rat) / 42) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0060 : Poly :=
[
  term ((-295 : Rat) / 21) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((295 : Rat) / 42) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((295 : Rat) / 21) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-295 : Rat) / 42) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((295 : Rat) / 21) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-295 : Rat) / 42) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-295 : Rat) / 21) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((295 : Rat) / 42) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0060
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0061 : Poly :=
[
  term ((9984 : Rat) / 553) [(1, 2)]
]

/-- Partial product 61 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0061 : Poly :=
[
  term ((-19968 : Rat) / 553) [(0, 1), (1, 2), (10, 1)],
  term ((9984 : Rat) / 553) [(0, 2), (1, 2)],
  term ((19968 : Rat) / 553) [(1, 2), (2, 1), (10, 1)],
  term ((-9984 : Rat) / 553) [(1, 2), (2, 2)],
  term ((19968 : Rat) / 553) [(1, 2), (3, 1), (11, 1)],
  term ((-9984 : Rat) / 553) [(1, 2), (3, 2)],
  term ((-19968 : Rat) / 553) [(1, 3), (11, 1)],
  term ((9984 : Rat) / 553) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0061
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0062 : Poly :=
[
  term ((-1328274198856205 : Rat) / 26109641356596) [(2, 1)]
]

/-- Partial product 62 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0062 : Poly :=
[
  term ((1328274198856205 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(0, 2), (2, 1)],
  term ((1328274198856205 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(1, 2), (2, 1)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(2, 1), (3, 1), (11, 1)],
  term ((1328274198856205 : Rat) / 26109641356596) [(2, 1), (3, 2)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(2, 2), (10, 1)],
  term ((1328274198856205 : Rat) / 26109641356596) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0062
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0063 : Poly :=
[
  term ((-2703963593690645 : Rat) / 11189846295684) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 63 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0063 : Poly :=
[
  term ((2703963593690645 : Rat) / 5594923147842) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-2703963593690645 : Rat) / 11189846295684) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((2703963593690645 : Rat) / 5594923147842) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-2703963593690645 : Rat) / 11189846295684) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-2703963593690645 : Rat) / 5594923147842) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((2703963593690645 : Rat) / 11189846295684) [(2, 1), (3, 3), (7, 1)],
  term ((-2703963593690645 : Rat) / 5594923147842) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((2703963593690645 : Rat) / 11189846295684) [(2, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0063
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0064 : Poly :=
[
  term ((-1107240197953805 : Rat) / 52219282713192) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 64 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0064 : Poly :=
[
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-1107240197953805 : Rat) / 52219282713192) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((1107240197953805 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-1107240197953805 : Rat) / 52219282713192) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(2, 1), (3, 2), (11, 2)],
  term ((1107240197953805 : Rat) / 52219282713192) [(2, 1), (3, 3), (11, 1)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(2, 2), (3, 1), (10, 1), (11, 1)],
  term ((1107240197953805 : Rat) / 52219282713192) [(2, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0064
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0065 : Poly :=
[
  term ((12053075678638045 : Rat) / 39164462034894) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 65 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0065 : Poly :=
[
  term ((-12053075678638045 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((12053075678638045 : Rat) / 39164462034894) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((-12053075678638045 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((12053075678638045 : Rat) / 39164462034894) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((12053075678638045 : Rat) / 19582231017447) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-12053075678638045 : Rat) / 39164462034894) [(2, 1), (3, 3), (15, 1)],
  term ((12053075678638045 : Rat) / 19582231017447) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-12053075678638045 : Rat) / 39164462034894) [(2, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0065
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0066 : Poly :=
[
  term ((-13109237458655 : Rat) / 80939213712) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 66 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0066 : Poly :=
[
  term ((13109237458655 : Rat) / 40469606856) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((-13109237458655 : Rat) / 80939213712) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((13109237458655 : Rat) / 40469606856) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((-13109237458655 : Rat) / 80939213712) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((-13109237458655 : Rat) / 40469606856) [(2, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((13109237458655 : Rat) / 80939213712) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-13109237458655 : Rat) / 40469606856) [(2, 2), (7, 1), (9, 1), (10, 1)],
  term ((13109237458655 : Rat) / 80939213712) [(2, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0066
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0067 : Poly :=
[
  term ((9379776327675377 : Rat) / 52219282713192) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 67 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0067 : Poly :=
[
  term ((-9379776327675377 : Rat) / 26109641356596) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((9379776327675377 : Rat) / 52219282713192) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-9379776327675377 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((9379776327675377 : Rat) / 52219282713192) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((9379776327675377 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 1), (11, 2)],
  term ((-9379776327675377 : Rat) / 52219282713192) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((9379776327675377 : Rat) / 26109641356596) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((-9379776327675377 : Rat) / 52219282713192) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0067
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0068 : Poly :=
[
  term ((563216325591293 : Rat) / 3197098941624) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 68 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0068 : Poly :=
[
  term ((-563216325591293 : Rat) / 1598549470812) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((563216325591293 : Rat) / 3197098941624) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-563216325591293 : Rat) / 1598549470812) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((563216325591293 : Rat) / 3197098941624) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((563216325591293 : Rat) / 1598549470812) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-563216325591293 : Rat) / 3197098941624) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((563216325591293 : Rat) / 1598549470812) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((-563216325591293 : Rat) / 3197098941624) [(2, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0068
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0069 : Poly :=
[
  term ((3295 : Rat) / 252) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 69 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0069 : Poly :=
[
  term ((-3295 : Rat) / 126) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((3295 : Rat) / 252) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3295 : Rat) / 126) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((3295 : Rat) / 252) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((3295 : Rat) / 126) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3295 : Rat) / 252) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((3295 : Rat) / 126) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3295 : Rat) / 252) [(2, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0069
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0070 : Poly :=
[
  term ((-2147977952760877 : Rat) / 4351606892766) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 70 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0070 : Poly :=
[
  term ((2147977952760877 : Rat) / 2175803446383) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-2147977952760877 : Rat) / 4351606892766) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((2147977952760877 : Rat) / 2175803446383) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2147977952760877 : Rat) / 4351606892766) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-2147977952760877 : Rat) / 2175803446383) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((2147977952760877 : Rat) / 4351606892766) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((-2147977952760877 : Rat) / 2175803446383) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term ((2147977952760877 : Rat) / 4351606892766) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0070
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0071 : Poly :=
[
  term ((-727 : Rat) / 63) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0071 : Poly :=
[
  term ((1454 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-727 : Rat) / 63) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((1454 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-727 : Rat) / 63) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1454 : Rat) / 63) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((727 : Rat) / 63) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1454 : Rat) / 63) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((727 : Rat) / 63) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0071
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0072 : Poly :=
[
  term ((-2774813806667099 : Rat) / 26109641356596) [(2, 1), (7, 2)]
]

/-- Partial product 72 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0072 : Poly :=
[
  term ((2774813806667099 : Rat) / 13054820678298) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((-2774813806667099 : Rat) / 26109641356596) [(0, 2), (2, 1), (7, 2)],
  term ((2774813806667099 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-2774813806667099 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 2)],
  term ((-2774813806667099 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 2), (11, 1)],
  term ((2774813806667099 : Rat) / 26109641356596) [(2, 1), (3, 2), (7, 2)],
  term ((-2774813806667099 : Rat) / 13054820678298) [(2, 2), (7, 2), (10, 1)],
  term ((2774813806667099 : Rat) / 26109641356596) [(2, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0072
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0073 : Poly :=
[
  term ((10272341995357 : Rat) / 53959475808) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 73 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0073 : Poly :=
[
  term ((-10272341995357 : Rat) / 26979737904) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((10272341995357 : Rat) / 53959475808) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-10272341995357 : Rat) / 26979737904) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((10272341995357 : Rat) / 53959475808) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((10272341995357 : Rat) / 26979737904) [(2, 1), (3, 1), (9, 1), (11, 2)],
  term ((-10272341995357 : Rat) / 53959475808) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((10272341995357 : Rat) / 26979737904) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((-10272341995357 : Rat) / 53959475808) [(2, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0073
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0074 : Poly :=
[
  term ((2695702350653 : Rat) / 46250979264) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 74 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0074 : Poly :=
[
  term ((-2695702350653 : Rat) / 23125489632) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((2695702350653 : Rat) / 46250979264) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-2695702350653 : Rat) / 23125489632) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((2695702350653 : Rat) / 46250979264) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((2695702350653 : Rat) / 23125489632) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2695702350653 : Rat) / 46250979264) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((2695702350653 : Rat) / 23125489632) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2695702350653 : Rat) / 46250979264) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0074
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0075 : Poly :=
[
  term ((-407190918025783 : Rat) / 2131399294416) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 75 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0075 : Poly :=
[
  term ((407190918025783 : Rat) / 1065699647208) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-407190918025783 : Rat) / 2131399294416) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((407190918025783 : Rat) / 1065699647208) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-407190918025783 : Rat) / 2131399294416) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-407190918025783 : Rat) / 1065699647208) [(2, 1), (3, 1), (11, 2), (13, 1)],
  term ((407190918025783 : Rat) / 2131399294416) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-407190918025783 : Rat) / 1065699647208) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((407190918025783 : Rat) / 2131399294416) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0075
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0076 : Poly :=
[
  term ((835 : Rat) / 168) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 76 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0076 : Poly :=
[
  term ((-835 : Rat) / 84) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((835 : Rat) / 168) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-835 : Rat) / 84) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((835 : Rat) / 168) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((835 : Rat) / 84) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-835 : Rat) / 168) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((835 : Rat) / 84) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-835 : Rat) / 168) [(2, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0076
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0077 : Poly :=
[
  term ((8449799276325179 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 77 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0077 : Poly :=
[
  term ((-8449799276325179 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((8449799276325179 : Rat) / 26109641356596) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-8449799276325179 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((8449799276325179 : Rat) / 26109641356596) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((8449799276325179 : Rat) / 13054820678298) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-8449799276325179 : Rat) / 26109641356596) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((8449799276325179 : Rat) / 13054820678298) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-8449799276325179 : Rat) / 26109641356596) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0077
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0078 : Poly :=
[
  term ((-163 : Rat) / 42) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0078 : Poly :=
[
  term ((163 : Rat) / 21) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-163 : Rat) / 42) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((163 : Rat) / 21) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-163 : Rat) / 42) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-163 : Rat) / 21) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((163 : Rat) / 42) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-163 : Rat) / 21) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((163 : Rat) / 42) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0078
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0079 : Poly :=
[
  term ((-1024430348060099 : Rat) / 17406427571064) [(2, 1), (11, 2)]
]

/-- Partial product 79 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0079 : Poly :=
[
  term ((1024430348060099 : Rat) / 8703213785532) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-1024430348060099 : Rat) / 17406427571064) [(0, 2), (2, 1), (11, 2)],
  term ((1024430348060099 : Rat) / 8703213785532) [(1, 1), (2, 1), (11, 3)],
  term ((-1024430348060099 : Rat) / 17406427571064) [(1, 2), (2, 1), (11, 2)],
  term ((-1024430348060099 : Rat) / 8703213785532) [(2, 1), (3, 1), (11, 3)],
  term ((1024430348060099 : Rat) / 17406427571064) [(2, 1), (3, 2), (11, 2)],
  term ((-1024430348060099 : Rat) / 8703213785532) [(2, 2), (10, 1), (11, 2)],
  term ((1024430348060099 : Rat) / 17406427571064) [(2, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0079
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0080 : Poly :=
[
  term ((-902058195792353 : Rat) / 12788395766496) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 80 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0080 : Poly :=
[
  term ((902058195792353 : Rat) / 6394197883248) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-902058195792353 : Rat) / 12788395766496) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((902058195792353 : Rat) / 6394197883248) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-902058195792353 : Rat) / 12788395766496) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-902058195792353 : Rat) / 6394197883248) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((902058195792353 : Rat) / 12788395766496) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-902058195792353 : Rat) / 6394197883248) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((902058195792353 : Rat) / 12788395766496) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0080
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0081 : Poly :=
[
  term ((-12235 : Rat) / 1008) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0081 : Poly :=
[
  term ((12235 : Rat) / 504) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12235 : Rat) / 1008) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((12235 : Rat) / 504) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12235 : Rat) / 1008) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12235 : Rat) / 504) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12235 : Rat) / 1008) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12235 : Rat) / 504) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12235 : Rat) / 1008) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0081
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0082 : Poly :=
[
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 1), (14, 1)]
]

/-- Partial product 82 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0082 : Poly :=
[
  term ((-1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 1), (3, 2), (14, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 2), (10, 1), (14, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0082
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0083 : Poly :=
[
  term ((10451440794479309 : Rat) / 52219282713192) [(2, 1), (15, 2)]
]

/-- Partial product 83 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0083 : Poly :=
[
  term ((-10451440794479309 : Rat) / 26109641356596) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((10451440794479309 : Rat) / 52219282713192) [(0, 2), (2, 1), (15, 2)],
  term ((-10451440794479309 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((10451440794479309 : Rat) / 52219282713192) [(1, 2), (2, 1), (15, 2)],
  term ((10451440794479309 : Rat) / 26109641356596) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-10451440794479309 : Rat) / 52219282713192) [(2, 1), (3, 2), (15, 2)],
  term ((10451440794479309 : Rat) / 26109641356596) [(2, 2), (10, 1), (15, 2)],
  term ((-10451440794479309 : Rat) / 52219282713192) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0083
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0084 : Poly :=
[
  term ((2683 : Rat) / 252) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 84 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0084 : Poly :=
[
  term ((-2683 : Rat) / 126) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((2683 : Rat) / 252) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-2683 : Rat) / 126) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((2683 : Rat) / 252) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((2683 : Rat) / 126) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2683 : Rat) / 252) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((2683 : Rat) / 126) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2683 : Rat) / 252) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0084
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0085 : Poly :=
[
  term ((68176191761805829 : Rat) / 39164462034894) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 85 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0085 : Poly :=
[
  term ((-68176191761805829 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((68176191761805829 : Rat) / 39164462034894) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((-68176191761805829 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((68176191761805829 : Rat) / 39164462034894) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((68176191761805829 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((68176191761805829 : Rat) / 19582231017447) [(3, 2), (6, 1), (7, 1), (11, 1)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(3, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0085
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0086 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 86 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0086 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (3, 1), (6, 1), (9, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0086
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0087 : Poly :=
[
  term ((-5708949419257772 : Rat) / 6527410339149) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 87 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0087 : Poly :=
[
  term ((11417898838515544 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-5708949419257772 : Rat) / 6527410339149) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((11417898838515544 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (11, 2)],
  term ((-5708949419257772 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-11417898838515544 : Rat) / 6527410339149) [(2, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((5708949419257772 : Rat) / 6527410339149) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((-11417898838515544 : Rat) / 6527410339149) [(3, 2), (6, 1), (11, 2)],
  term ((5708949419257772 : Rat) / 6527410339149) [(3, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0087
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0088 : Poly :=
[
  term ((280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 88 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0088 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (11, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0088
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0089 : Poly :=
[
  term ((85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 89 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0089 : Poly :=
[
  term ((-170 : Rat) / 63) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(3, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0089
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0090 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 90 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0090 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 3), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0090
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0091 : Poly :=
[
  term ((5392685014514719 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 91 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0091 : Poly :=
[
  term ((-5392685014514719 : Rat) / 13054820678298) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 26109641356596) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 26109641356596) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 13054820678298) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 26109641356596) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 13054820678298) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 26109641356596) [(3, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0091
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0092 : Poly :=
[
  term ((-16 : Rat) / 9) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0092 : Poly :=
[
  term ((32 : Rat) / 9) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0092
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0093 : Poly :=
[
  term ((-69890684756316647 : Rat) / 156657848139576) [(3, 1), (7, 1)]
]

/-- Partial product 93 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0093 : Poly :=
[
  term ((69890684756316647 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((-69890684756316647 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1)],
  term ((69890684756316647 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-69890684756316647 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1)],
  term ((-69890684756316647 : Rat) / 78328924069788) [(2, 1), (3, 1), (7, 1), (10, 1)],
  term ((69890684756316647 : Rat) / 156657848139576) [(2, 2), (3, 1), (7, 1)],
  term ((-69890684756316647 : Rat) / 78328924069788) [(3, 2), (7, 1), (11, 1)],
  term ((69890684756316647 : Rat) / 156657848139576) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0093
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0094 : Poly :=
[
  term ((-131394754748634667 : Rat) / 156657848139576) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 94 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0094 : Poly :=
[
  term ((131394754748634667 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((-131394754748634667 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((131394754748634667 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((-131394754748634667 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-131394754748634667 : Rat) / 78328924069788) [(2, 1), (3, 1), (7, 1), (10, 2)],
  term ((131394754748634667 : Rat) / 156657848139576) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((-131394754748634667 : Rat) / 78328924069788) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((131394754748634667 : Rat) / 156657848139576) [(3, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0094
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0095 : Poly :=
[
  term ((-20888479639035097 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 95 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0095 : Poly :=
[
  term ((20888479639035097 : Rat) / 13054820678298) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-20888479639035097 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((20888479639035097 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((-20888479639035097 : Rat) / 26109641356596) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-20888479639035097 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((20888479639035097 : Rat) / 26109641356596) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-20888479639035097 : Rat) / 13054820678298) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((20888479639035097 : Rat) / 26109641356596) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0095
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0096 : Poly :=
[
  term ((9355672864031 : Rat) / 107918951616) [(3, 1), (9, 1)]
]

/-- Partial product 96 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0096 : Poly :=
[
  term ((-9355672864031 : Rat) / 53959475808) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((9355672864031 : Rat) / 107918951616) [(0, 2), (3, 1), (9, 1)],
  term ((-9355672864031 : Rat) / 53959475808) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((9355672864031 : Rat) / 107918951616) [(1, 2), (3, 1), (9, 1)],
  term ((9355672864031 : Rat) / 53959475808) [(2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-9355672864031 : Rat) / 107918951616) [(2, 2), (3, 1), (9, 1)],
  term ((9355672864031 : Rat) / 53959475808) [(3, 2), (9, 1), (11, 1)],
  term ((-9355672864031 : Rat) / 107918951616) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0096
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0097 : Poly :=
[
  term ((10272341995357 : Rat) / 53959475808) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 97 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0097 : Poly :=
[
  term ((-10272341995357 : Rat) / 26979737904) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((10272341995357 : Rat) / 53959475808) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((-10272341995357 : Rat) / 26979737904) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((10272341995357 : Rat) / 53959475808) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((10272341995357 : Rat) / 26979737904) [(2, 1), (3, 1), (9, 1), (10, 2)],
  term ((-10272341995357 : Rat) / 53959475808) [(2, 2), (3, 1), (9, 1), (10, 1)],
  term ((10272341995357 : Rat) / 26979737904) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((-10272341995357 : Rat) / 53959475808) [(3, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0097
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0098 : Poly :=
[
  term ((56444662032005 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 98 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0098 : Poly :=
[
  term ((-56444662032005 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((56444662032005 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-56444662032005 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((56444662032005 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((56444662032005 : Rat) / 161878427424) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-56444662032005 : Rat) / 323756854848) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((56444662032005 : Rat) / 161878427424) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-56444662032005 : Rat) / 323756854848) [(3, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0098
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009YNNNN_coefficient_22_0099 : Poly :=
[
  term ((-1024430348060099 : Rat) / 17406427571064) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 99 for generator 22. -/
def rs_R009_ueqv_R009YNNNN_partial_22_0099 : Poly :=
[
  term ((1024430348060099 : Rat) / 8703213785532) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((-1024430348060099 : Rat) / 17406427571064) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((1024430348060099 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-1024430348060099 : Rat) / 17406427571064) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-1024430348060099 : Rat) / 8703213785532) [(2, 1), (3, 1), (10, 2), (11, 1)],
  term ((1024430348060099 : Rat) / 17406427571064) [(2, 2), (3, 1), (10, 1), (11, 1)],
  term ((-1024430348060099 : Rat) / 8703213785532) [(3, 2), (10, 1), (11, 2)],
  term ((1024430348060099 : Rat) / 17406427571064) [(3, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 22. -/
theorem rs_R009_ueqv_R009YNNNN_partial_22_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_22_0099
        rs_R009_ueqv_R009YNNNN_generator_22_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_22_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_22_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_22_0000,
  rs_R009_ueqv_R009YNNNN_partial_22_0001,
  rs_R009_ueqv_R009YNNNN_partial_22_0002,
  rs_R009_ueqv_R009YNNNN_partial_22_0003,
  rs_R009_ueqv_R009YNNNN_partial_22_0004,
  rs_R009_ueqv_R009YNNNN_partial_22_0005,
  rs_R009_ueqv_R009YNNNN_partial_22_0006,
  rs_R009_ueqv_R009YNNNN_partial_22_0007,
  rs_R009_ueqv_R009YNNNN_partial_22_0008,
  rs_R009_ueqv_R009YNNNN_partial_22_0009,
  rs_R009_ueqv_R009YNNNN_partial_22_0010,
  rs_R009_ueqv_R009YNNNN_partial_22_0011,
  rs_R009_ueqv_R009YNNNN_partial_22_0012,
  rs_R009_ueqv_R009YNNNN_partial_22_0013,
  rs_R009_ueqv_R009YNNNN_partial_22_0014,
  rs_R009_ueqv_R009YNNNN_partial_22_0015,
  rs_R009_ueqv_R009YNNNN_partial_22_0016,
  rs_R009_ueqv_R009YNNNN_partial_22_0017,
  rs_R009_ueqv_R009YNNNN_partial_22_0018,
  rs_R009_ueqv_R009YNNNN_partial_22_0019,
  rs_R009_ueqv_R009YNNNN_partial_22_0020,
  rs_R009_ueqv_R009YNNNN_partial_22_0021,
  rs_R009_ueqv_R009YNNNN_partial_22_0022,
  rs_R009_ueqv_R009YNNNN_partial_22_0023,
  rs_R009_ueqv_R009YNNNN_partial_22_0024,
  rs_R009_ueqv_R009YNNNN_partial_22_0025,
  rs_R009_ueqv_R009YNNNN_partial_22_0026,
  rs_R009_ueqv_R009YNNNN_partial_22_0027,
  rs_R009_ueqv_R009YNNNN_partial_22_0028,
  rs_R009_ueqv_R009YNNNN_partial_22_0029,
  rs_R009_ueqv_R009YNNNN_partial_22_0030,
  rs_R009_ueqv_R009YNNNN_partial_22_0031,
  rs_R009_ueqv_R009YNNNN_partial_22_0032,
  rs_R009_ueqv_R009YNNNN_partial_22_0033,
  rs_R009_ueqv_R009YNNNN_partial_22_0034,
  rs_R009_ueqv_R009YNNNN_partial_22_0035,
  rs_R009_ueqv_R009YNNNN_partial_22_0036,
  rs_R009_ueqv_R009YNNNN_partial_22_0037,
  rs_R009_ueqv_R009YNNNN_partial_22_0038,
  rs_R009_ueqv_R009YNNNN_partial_22_0039,
  rs_R009_ueqv_R009YNNNN_partial_22_0040,
  rs_R009_ueqv_R009YNNNN_partial_22_0041,
  rs_R009_ueqv_R009YNNNN_partial_22_0042,
  rs_R009_ueqv_R009YNNNN_partial_22_0043,
  rs_R009_ueqv_R009YNNNN_partial_22_0044,
  rs_R009_ueqv_R009YNNNN_partial_22_0045,
  rs_R009_ueqv_R009YNNNN_partial_22_0046,
  rs_R009_ueqv_R009YNNNN_partial_22_0047,
  rs_R009_ueqv_R009YNNNN_partial_22_0048,
  rs_R009_ueqv_R009YNNNN_partial_22_0049,
  rs_R009_ueqv_R009YNNNN_partial_22_0050,
  rs_R009_ueqv_R009YNNNN_partial_22_0051,
  rs_R009_ueqv_R009YNNNN_partial_22_0052,
  rs_R009_ueqv_R009YNNNN_partial_22_0053,
  rs_R009_ueqv_R009YNNNN_partial_22_0054,
  rs_R009_ueqv_R009YNNNN_partial_22_0055,
  rs_R009_ueqv_R009YNNNN_partial_22_0056,
  rs_R009_ueqv_R009YNNNN_partial_22_0057,
  rs_R009_ueqv_R009YNNNN_partial_22_0058,
  rs_R009_ueqv_R009YNNNN_partial_22_0059,
  rs_R009_ueqv_R009YNNNN_partial_22_0060,
  rs_R009_ueqv_R009YNNNN_partial_22_0061,
  rs_R009_ueqv_R009YNNNN_partial_22_0062,
  rs_R009_ueqv_R009YNNNN_partial_22_0063,
  rs_R009_ueqv_R009YNNNN_partial_22_0064,
  rs_R009_ueqv_R009YNNNN_partial_22_0065,
  rs_R009_ueqv_R009YNNNN_partial_22_0066,
  rs_R009_ueqv_R009YNNNN_partial_22_0067,
  rs_R009_ueqv_R009YNNNN_partial_22_0068,
  rs_R009_ueqv_R009YNNNN_partial_22_0069,
  rs_R009_ueqv_R009YNNNN_partial_22_0070,
  rs_R009_ueqv_R009YNNNN_partial_22_0071,
  rs_R009_ueqv_R009YNNNN_partial_22_0072,
  rs_R009_ueqv_R009YNNNN_partial_22_0073,
  rs_R009_ueqv_R009YNNNN_partial_22_0074,
  rs_R009_ueqv_R009YNNNN_partial_22_0075,
  rs_R009_ueqv_R009YNNNN_partial_22_0076,
  rs_R009_ueqv_R009YNNNN_partial_22_0077,
  rs_R009_ueqv_R009YNNNN_partial_22_0078,
  rs_R009_ueqv_R009YNNNN_partial_22_0079,
  rs_R009_ueqv_R009YNNNN_partial_22_0080,
  rs_R009_ueqv_R009YNNNN_partial_22_0081,
  rs_R009_ueqv_R009YNNNN_partial_22_0082,
  rs_R009_ueqv_R009YNNNN_partial_22_0083,
  rs_R009_ueqv_R009YNNNN_partial_22_0084,
  rs_R009_ueqv_R009YNNNN_partial_22_0085,
  rs_R009_ueqv_R009YNNNN_partial_22_0086,
  rs_R009_ueqv_R009YNNNN_partial_22_0087,
  rs_R009_ueqv_R009YNNNN_partial_22_0088,
  rs_R009_ueqv_R009YNNNN_partial_22_0089,
  rs_R009_ueqv_R009YNNNN_partial_22_0090,
  rs_R009_ueqv_R009YNNNN_partial_22_0091,
  rs_R009_ueqv_R009YNNNN_partial_22_0092,
  rs_R009_ueqv_R009YNNNN_partial_22_0093,
  rs_R009_ueqv_R009YNNNN_partial_22_0094,
  rs_R009_ueqv_R009YNNNN_partial_22_0095,
  rs_R009_ueqv_R009YNNNN_partial_22_0096,
  rs_R009_ueqv_R009YNNNN_partial_22_0097,
  rs_R009_ueqv_R009YNNNN_partial_22_0098,
  rs_R009_ueqv_R009YNNNN_partial_22_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_22_0000_0099 : Poly :=
[
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-1475305785450037 : Rat) / 1864974382614) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-6753375187897 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((2186454768480463 : Rat) / 8703213785532) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((286730682782923 : Rat) / 532849823604) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-295 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2931582487209844 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((110 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((6753375187897 : Rat) / 26979737904) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((-286730682782923 : Rat) / 1065699647208) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((295 : Rat) / 84) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((91911860975884 : Rat) / 310829063769) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-55 : Rat) / 21) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-556087218462152 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (6, 1), (10, 1)],
  term ((-285741669316823 : Rat) / 1864974382614) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-3625404692377 : Rat) / 13489868952) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((3137849527878865 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((556087218462152 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (10, 2)],
  term ((25664988303229 : Rat) / 76121403372) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((185 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-150470979439448 : Rat) / 310829063769) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-82 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((300520702655251 : Rat) / 1864974382614) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((6753375187897 : Rat) / 26979737904) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-249101180158238 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-286730682782923 : Rat) / 1065699647208) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((295 : Rat) / 84) [(0, 1), (1, 1), (3, 2), (13, 1), (16, 1)],
  term ((91911860975884 : Rat) / 310829063769) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-55 : Rat) / 21) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 3)],
  term ((3990050839829666 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-5265049994181826 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((-8117695752019597 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((1679838738623195 : Rat) / 532849823604) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-2615 : Rat) / 42) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7889023051837024 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((1006 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3835099989555931 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 2), (11, 1)],
  term ((14990364159433 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((10541695010249 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-21722017330 : Rat) / 187359291) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((7900297702921 : Rat) / 53959475808) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-59904 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-612657449971195 : Rat) / 1065699647208) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((1495 : Rat) / 84) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8117695752019597 : Rat) / 13054820678298) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((38493409663518703 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-295 : Rat) / 21) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((-420238704919547 : Rat) / 710466431472) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((855 : Rat) / 56) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((10504814622597752 : Rat) / 6527410339149) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-167 : Rat) / 14) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1)],
  term ((21679851860 : Rat) / 187359291) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-40 : Rat) / 7) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-655366654874374 : Rat) / 2175803446383) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((167122046459264 : Rat) / 725267815461) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((32 : Rat) / 7) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-314509675014331 : Rat) / 2131399294416) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((535 : Rat) / 168) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-32207371625563 : Rat) / 138146250564) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-103 : Rat) / 42) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-553040367401411 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 3)],
  term ((-395910373848515 : Rat) / 8703213785532) [(0, 1), (1, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 1), (10, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 2)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((-21722017330 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((-118864579033325 : Rat) / 3729948765228) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((18824853140 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-40 : Rat) / 7) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-10052062240 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((32 : Rat) / 7) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (3, 2)],
  term ((41195805866345 : Rat) / 26979737904) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((-1057728296810789 : Rat) / 4351606892766) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((2615 : Rat) / 84) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((3944511525918512 : Rat) / 2175803446383) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-503 : Rat) / 21) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(0, 1), (1, 2), (7, 2)],
  term ((46126703800255 : Rat) / 107918951616) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-19968 : Rat) / 553) [(0, 1), (1, 2), (10, 1)],
  term ((-1979335787249053 : Rat) / 4262798588832) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((1825 : Rat) / 336) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((1760456120244211 : Rat) / 2486632510152) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-337 : Rat) / 84) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-529183236764099 : Rat) / 2901071261844) [(0, 1), (1, 2), (11, 2)],
  term ((-10839925930 : Rat) / 187359291) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((20 : Rat) / 7) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(0, 1), (1, 2), (14, 1)],
  term ((-83561023229632 : Rat) / 725267815461) [(0, 1), (1, 2), (15, 2)],
  term ((-16 : Rat) / 7) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 1), (1, 3), (3, 1)],
  term ((-1388685846372571 : Rat) / 4351606892766) [(0, 1), (1, 3), (7, 1)],
  term ((-6753375187897 : Rat) / 26979737904) [(0, 1), (1, 3), (9, 1)],
  term ((27420416 : Rat) / 243873) [(0, 1), (1, 3), (11, 1)],
  term ((286730682782923 : Rat) / 1065699647208) [(0, 1), (1, 3), (13, 1)],
  term ((-295 : Rat) / 84) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term ((-91911860975884 : Rat) / 310829063769) [(0, 1), (1, 3), (15, 1)],
  term ((55 : Rat) / 21) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 4)],
  term ((-34012511609240 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-43444034660 : Rat) / 187359291) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((1107240197953805 : Rat) / 8703213785532) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((37649706280 : Rat) / 187359291) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-80 : Rat) / 7) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-14154298456914205 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((64 : Rat) / 7) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((9764046789835 : Rat) / 2890686204) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((-55400976202346549 : Rat) / 26109641356596) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-2801366270730439 : Rat) / 799274735406) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((325 : Rat) / 9) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((10037001004597901 : Rat) / 2175803446383) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-1564 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((19173948082071826 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((-1053517840505 : Rat) / 1998499104) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-102093481451 : Rat) / 161878427424) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((70271538655330 : Rat) / 6527410339149) [(0, 1), (2, 1), (10, 1)],
  term ((125432390118433 : Rat) / 236822143824) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-105 : Rat) / 8) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-10812405315418951 : Rat) / 26109641356596) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((143 : Rat) / 14) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((710170360954307 : Rat) / 2901071261844) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((162168211514273 : Rat) / 6394197883248) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((15115 : Rat) / 504) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2869166531472919 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((-16467834467012813 : Rat) / 26109641356596) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-3259 : Rat) / 126) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(0, 1), (2, 2)],
  term ((6331923393017665 : Rat) / 26109641356596) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-18824853140 : Rat) / 187359291) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((40 : Rat) / 7) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((10052062240 : Rat) / 187359291) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((3835099989555931 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-2615 : Rat) / 84) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3944511525918512 : Rat) / 2175803446383) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((503 : Rat) / 21) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(0, 1), (2, 2), (7, 2)],
  term ((7900297702921 : Rat) / 107918951616) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-314509675014331 : Rat) / 4262798588832) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((535 : Rat) / 336) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-32207371625563 : Rat) / 276292501128) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-103 : Rat) / 84) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-553040367401411 : Rat) / 8703213785532) [(0, 1), (2, 2), (11, 2)],
  term ((10839925930 : Rat) / 187359291) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 1), (2, 2), (14, 1)],
  term ((83561023229632 : Rat) / 725267815461) [(0, 1), (2, 2), (15, 2)],
  term ((16 : Rat) / 7) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-68176191761805829 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((11417898838515544 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 13054820678298) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((32 : Rat) / 9) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((69890684756316647 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((20888479639035097 : Rat) / 13054820678298) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((131394754748634667 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((2615 : Rat) / 42) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((7889023051837024 : Rat) / 2175803446383) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1006 : Rat) / 21) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3835099989555931 : Rat) / 2175803446383) [(0, 1), (3, 1), (7, 1), (11, 2)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((-9355672864031 : Rat) / 53959475808) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((-56444662032005 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-10272341995357 : Rat) / 26979737904) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-7900297702921 : Rat) / 53959475808) [(0, 1), (3, 1), (9, 1), (11, 2)],
  term ((1024430348060099 : Rat) / 8703213785532) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1)],
  term ((-21679851860 : Rat) / 187359291) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((40 : Rat) / 7) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((655366654874374 : Rat) / 2175803446383) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-167122046459264 : Rat) / 725267815461) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-32 : Rat) / 7) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((314509675014331 : Rat) / 2131399294416) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((-535 : Rat) / 168) [(0, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((32207371625563 : Rat) / 138146250564) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((103 : Rat) / 42) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((553040367401411 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 3)],
  term ((395910373848515 : Rat) / 8703213785532) [(0, 1), (3, 2)],
  term ((-41195805866345 : Rat) / 26979737904) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((2586688287825064 : Rat) / 6527410339149) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-2615 : Rat) / 84) [(0, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3944511525918512 : Rat) / 2175803446383) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((503 : Rat) / 21) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(0, 1), (3, 2), (7, 2)],
  term ((-17123466261239 : Rat) / 107918951616) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((542096442268229 : Rat) / 4262798588832) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-3305 : Rat) / 336) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-185562761576209 : Rat) / 828877503384) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((95 : Rat) / 12) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((555359293703377 : Rat) / 26109641356596) [(0, 1), (3, 2), (11, 2)],
  term ((10839925930 : Rat) / 187359291) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 1), (3, 2), (14, 1)],
  term ((83561023229632 : Rat) / 725267815461) [(0, 1), (3, 2), (15, 2)],
  term ((16 : Rat) / 7) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((6331923393017665 : Rat) / 26109641356596) [(0, 1), (3, 3), (7, 1)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (3, 3), (9, 1)],
  term ((-1107240197953805 : Rat) / 26109641356596) [(0, 1), (3, 3), (11, 1)],
  term ((-18824853140 : Rat) / 187359291) [(0, 1), (3, 3), (13, 1)],
  term ((40 : Rat) / 7) [(0, 1), (3, 3), (13, 1), (16, 1)],
  term ((10052062240 : Rat) / 187359291) [(0, 1), (3, 3), (15, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-598861995878285 : Rat) / 26109641356596) [(0, 1), (10, 1)],
  term ((598861995878285 : Rat) / 52219282713192) [(0, 2)],
  term ((1995025419914833 : Rat) / 26109641356596) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-464357836888642 : Rat) / 6527410339149) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-3137849527878865 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((-4566554864175485 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((2632524997090913 : Rat) / 6527410339149) [(0, 2), (1, 1), (7, 1)],
  term ((24781925908490449 : Rat) / 26109641356596) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((-14990364159433 : Rat) / 53959475808) [(0, 2), (1, 1), (9, 1)],
  term ((22401916472429 : Rat) / 107918951616) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((-417300024258755 : Rat) / 2175803446383) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-1033129347504743 : Rat) / 4262798588832) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((-205 : Rat) / 336) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1392109150311748 : Rat) / 6527410339149) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((61 : Rat) / 84) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((29952 : Rat) / 553) [(0, 2), (1, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((612657449971195 : Rat) / 2131399294416) [(0, 2), (1, 1), (13, 1)],
  term ((-1495 : Rat) / 168) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((8117695752019597 : Rat) / 26109641356596) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-38493409663518703 : Rat) / 52219282713192) [(0, 2), (1, 1), (15, 1)],
  term ((295 : Rat) / 42) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((9984 : Rat) / 553) [(0, 2), (1, 2)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (10, 1)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(0, 2), (2, 1)],
  term ((-2703963593690645 : Rat) / 11189846295684) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((-1107240197953805 : Rat) / 52219282713192) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((12053075678638045 : Rat) / 39164462034894) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((-13109237458655 : Rat) / 80939213712) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((9379776327675377 : Rat) / 52219282713192) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((563216325591293 : Rat) / 3197098941624) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((3295 : Rat) / 252) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2147977952760877 : Rat) / 4351606892766) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-727 : Rat) / 63) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2774813806667099 : Rat) / 26109641356596) [(0, 2), (2, 1), (7, 2)],
  term ((10272341995357 : Rat) / 53959475808) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((2695702350653 : Rat) / 46250979264) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-407190918025783 : Rat) / 2131399294416) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((835 : Rat) / 168) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((8449799276325179 : Rat) / 26109641356596) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-163 : Rat) / 42) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1024430348060099 : Rat) / 17406427571064) [(0, 2), (2, 1), (11, 2)],
  term ((-902058195792353 : Rat) / 12788395766496) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-12235 : Rat) / 1008) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 1)],
  term ((10451440794479309 : Rat) / 52219282713192) [(0, 2), (2, 1), (15, 2)],
  term ((2683 : Rat) / 252) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((68176191761805829 : Rat) / 39164462034894) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((-5708949419257772 : Rat) / 6527410339149) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((85 : Rat) / 63) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 26109641356596) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-69890684756316647 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1)],
  term ((-7915953433203241 : Rat) / 22379692591368) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((-20888479639035097 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((9355672864031 : Rat) / 107918951616) [(0, 2), (3, 1), (9, 1)],
  term ((22784223977437 : Rat) / 53959475808) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((56444662032005 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-7502251835995517 : Rat) / 52219282713192) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-37649706280 : Rat) / 187359291) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((80 : Rat) / 7) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((20104124480 : Rat) / 187359291) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-64 : Rat) / 7) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((3835099989555931 : Rat) / 2175803446383) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((-2615 : Rat) / 42) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7889023051837024 : Rat) / 2175803446383) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((1006 : Rat) / 21) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 2), (7, 2), (10, 1)],
  term ((7900297702921 : Rat) / 53959475808) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-21722017330 : Rat) / 187359291) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(0, 2), (10, 1)],
  term ((-314509675014331 : Rat) / 2131399294416) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((535 : Rat) / 168) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-32207371625563 : Rat) / 138146250564) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-103 : Rat) / 42) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-553040367401411 : Rat) / 4351606892766) [(0, 2), (10, 1), (11, 2)],
  term ((21679851860 : Rat) / 187359291) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-40 : Rat) / 7) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-655366654874374 : Rat) / 2175803446383) [(0, 2), (10, 1), (14, 1)],
  term ((167122046459264 : Rat) / 725267815461) [(0, 2), (10, 1), (15, 2)],
  term ((32 : Rat) / 7) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(0, 3)],
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 3), (1, 1), (3, 1)],
  term ((-1388685846372571 : Rat) / 4351606892766) [(0, 3), (1, 1), (7, 1)],
  term ((-6753375187897 : Rat) / 26979737904) [(0, 3), (1, 1), (9, 1)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 3), (1, 1), (11, 1)],
  term ((286730682782923 : Rat) / 1065699647208) [(0, 3), (1, 1), (13, 1)],
  term ((-295 : Rat) / 84) [(0, 3), (1, 1), (13, 1), (16, 1)],
  term ((-91911860975884 : Rat) / 310829063769) [(0, 3), (1, 1), (15, 1)],
  term ((55 : Rat) / 21) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 3), (1, 2)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(0, 3), (3, 1), (7, 1)],
  term ((-21722017330 : Rat) / 187359291) [(0, 3), (3, 1), (9, 1)],
  term ((1107240197953805 : Rat) / 26109641356596) [(0, 3), (3, 1), (11, 1)],
  term ((18824853140 : Rat) / 187359291) [(0, 3), (3, 1), (13, 1)],
  term ((-40 : Rat) / 7) [(0, 3), (3, 1), (13, 1), (16, 1)],
  term ((-10052062240 : Rat) / 187359291) [(0, 3), (3, 1), (15, 1)],
  term ((32 : Rat) / 7) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(0, 3), (7, 1), (9, 1)],
  term ((-3835099989555931 : Rat) / 4351606892766) [(0, 3), (7, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(0, 3), (7, 1), (13, 1)],
  term ((2615 : Rat) / 84) [(0, 3), (7, 1), (13, 1), (16, 1)],
  term ((3944511525918512 : Rat) / 2175803446383) [(0, 3), (7, 1), (15, 1)],
  term ((-503 : Rat) / 21) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(0, 3), (7, 2)],
  term ((-7900297702921 : Rat) / 107918951616) [(0, 3), (9, 1), (11, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 3), (9, 1), (15, 1)],
  term ((314509675014331 : Rat) / 4262798588832) [(0, 3), (11, 1), (13, 1)],
  term ((-535 : Rat) / 336) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((32207371625563 : Rat) / 276292501128) [(0, 3), (11, 1), (15, 1)],
  term ((103 : Rat) / 84) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((553040367401411 : Rat) / 8703213785532) [(0, 3), (11, 2)],
  term ((-10839925930 : Rat) / 187359291) [(0, 3), (13, 1), (15, 1)],
  term ((20 : Rat) / 7) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(0, 3), (14, 1)],
  term ((-83561023229632 : Rat) / 725267815461) [(0, 3), (15, 2)],
  term ((-16 : Rat) / 7) [(0, 3), (15, 2), (16, 1)],
  term ((556087218462152 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (6, 1), (10, 1)],
  term ((12456410707789507 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-3137849527878865 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-556087218462152 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 1), (2, 1), (3, 1), (10, 2)],
  term ((-14839222699969897 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((242411531398385 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-1995025419914833 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((464357836888642 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-3990050839829666 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (7, 1), (10, 1)],
  term ((13109237458655 : Rat) / 40469606856) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((5265049994181826 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 1), (10, 1)],
  term ((8117695752019597 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1), (10, 2)],
  term ((-563216325591293 : Rat) / 1598549470812) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-3295 : Rat) / 126) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((2147977952760877 : Rat) / 2175803446383) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((1454 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9379776327675377 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((2774813806667099 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-14990364159433 : Rat) / 26979737904) [(1, 1), (2, 1), (9, 1), (10, 1)],
  term ((-10541695010249 : Rat) / 17986491936) [(1, 1), (2, 1), (9, 1), (10, 2)],
  term ((-2695702350653 : Rat) / 23125489632) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-10272341995357 : Rat) / 26979737904) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((59904 : Rat) / 553) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((612657449971195 : Rat) / 1065699647208) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-1495 : Rat) / 84) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((8117695752019597 : Rat) / 13054820678298) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((-38493409663518703 : Rat) / 26109641356596) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((295 : Rat) / 21) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (2, 1), (10, 2), (11, 1)],
  term ((420238704919547 : Rat) / 710466431472) [(1, 1), (2, 1), (10, 2), (13, 1)],
  term ((-855 : Rat) / 56) [(1, 1), (2, 1), (10, 2), (13, 1), (16, 1)],
  term ((-10504814622597752 : Rat) / 6527410339149) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((167 : Rat) / 14) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((1328274198856205 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1)],
  term ((902058195792353 : Rat) / 6394197883248) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((12235 : Rat) / 504) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-10451440794479309 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-2683 : Rat) / 126) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((407190918025783 : Rat) / 1065699647208) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-835 : Rat) / 84) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((-8449799276325179 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((163 : Rat) / 21) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((1024430348060099 : Rat) / 8703213785532) [(1, 1), (2, 1), (11, 3)],
  term ((3137849527878865 : Rat) / 52219282713192) [(1, 1), (2, 2), (3, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((-2632524997090913 : Rat) / 6527410339149) [(1, 1), (2, 2), (7, 1)],
  term ((-4127644912189931 : Rat) / 26109641356596) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((14990364159433 : Rat) / 53959475808) [(1, 1), (2, 2), (9, 1)],
  term ((10541695010249 : Rat) / 35972983872) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-517254671445443 : Rat) / 8703213785532) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((-420238704919547 : Rat) / 1420932862944) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((855 : Rat) / 112) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((617670233931656 : Rat) / 932487191307) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-167 : Rat) / 28) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-29952 : Rat) / 553) [(1, 1), (2, 2), (11, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-612657449971195 : Rat) / 2131399294416) [(1, 1), (2, 2), (13, 1)],
  term ((1495 : Rat) / 168) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-8117695752019597 : Rat) / 26109641356596) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((38493409663518703 : Rat) / 52219282713192) [(1, 1), (2, 2), (15, 1)],
  term ((-295 : Rat) / 42) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1995025419914833 : Rat) / 26109641356596) [(1, 1), (2, 3), (7, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (2, 3), (11, 1)],
  term ((464357836888642 : Rat) / 6527410339149) [(1, 1), (2, 3), (15, 1)],
  term ((-80146344281294827 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (3, 1), (6, 1), (9, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((11417898838515544 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (11, 2)],
  term ((180100929260752249 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((133071284686498559 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((20888479639035097 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((-7452824145923 : Rat) / 7708496544) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((-5619485883271 : Rat) / 7708496544) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-56444662032005 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((420238704919547 : Rat) / 710466431472) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((-855 : Rat) / 56) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-10504814622597752 : Rat) / 6527410339149) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((167 : Rat) / 14) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1967210309377475 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((612657449971195 : Rat) / 1065699647208) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-1495 : Rat) / 84) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((8117695752019597 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-38493409663518703 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((295 : Rat) / 21) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (3, 1), (11, 2)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((556087218462152 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-2632524997090913 : Rat) / 6527410339149) [(1, 1), (3, 2), (7, 1)],
  term ((-8117695752019597 : Rat) / 26109641356596) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((14990364159433 : Rat) / 53959475808) [(1, 1), (3, 2), (9, 1)],
  term ((10541695010249 : Rat) / 35972983872) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((-517254671445443 : Rat) / 8703213785532) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-420238704919547 : Rat) / 1420932862944) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((855 : Rat) / 112) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((5252407311298876 : Rat) / 6527410339149) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-167 : Rat) / 28) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4552019469854929 : Rat) / 26109641356596) [(1, 1), (3, 2), (11, 1)],
  term ((-4311103675336951 : Rat) / 52219282713192) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-612657449971195 : Rat) / 2131399294416) [(1, 1), (3, 2), (13, 1)],
  term ((1495 : Rat) / 168) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-8117695752019597 : Rat) / 26109641356596) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((38493409663518703 : Rat) / 52219282713192) [(1, 1), (3, 2), (15, 1)],
  term ((-295 : Rat) / 42) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((3137849527878865 : Rat) / 52219282713192) [(1, 1), (3, 3)],
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 1), (3, 3), (6, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 1), (3, 3), (10, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 1), (3, 3), (14, 1)],
  term ((-598861995878285 : Rat) / 26109641356596) [(1, 1), (11, 1)],
  term ((598861995878285 : Rat) / 52219282713192) [(1, 2)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(1, 2), (2, 1)],
  term ((-2703963593690645 : Rat) / 11189846295684) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-1107240197953805 : Rat) / 52219282713192) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((12053075678638045 : Rat) / 39164462034894) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-13109237458655 : Rat) / 80939213712) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((1399674648016045 : Rat) / 52219282713192) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((563216325591293 : Rat) / 3197098941624) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((3295 : Rat) / 252) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2147977952760877 : Rat) / 4351606892766) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-727 : Rat) / 63) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2774813806667099 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 2)],
  term ((10272341995357 : Rat) / 53959475808) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((2695702350653 : Rat) / 46250979264) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((19968 : Rat) / 553) [(1, 2), (2, 1), (10, 1)],
  term ((-407190918025783 : Rat) / 2131399294416) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((835 : Rat) / 168) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((1737808853062045 : Rat) / 3729948765228) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-163 : Rat) / 42) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-932700966486589 : Rat) / 17406427571064) [(1, 2), (2, 1), (11, 2)],
  term ((-902058195792353 : Rat) / 12788395766496) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-12235 : Rat) / 1008) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 1)],
  term ((10451440794479309 : Rat) / 52219282713192) [(1, 2), (2, 1), (15, 2)],
  term ((2683 : Rat) / 252) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-9984 : Rat) / 553) [(1, 2), (2, 2)],
  term ((68176191761805829 : Rat) / 39164462034894) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((-6265036637719924 : Rat) / 6527410339149) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((85 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 26109641356596) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-69890684756316647 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1)],
  term ((-131394754748634667 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-20888479639035097 : Rat) / 26109641356596) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((9355672864031 : Rat) / 107918951616) [(1, 2), (3, 1), (9, 1)],
  term ((10272341995357 : Rat) / 53959475808) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((56444662032005 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-932700966486589 : Rat) / 17406427571064) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((4080629489196241 : Rat) / 26109641356596) [(1, 2), (3, 1), (11, 1)],
  term ((556087218462152 : Rat) / 6527410339149) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-9984 : Rat) / 553) [(1, 2), (3, 2)],
  term ((3990050839829666 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-8117695752019597 : Rat) / 13054820678298) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-5265049994181826 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1)],
  term ((10541695010249 : Rat) / 17986491936) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((14990364159433 : Rat) / 26979737904) [(1, 2), (9, 1), (11, 1)],
  term ((-420238704919547 : Rat) / 710466431472) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((855 : Rat) / 56) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((10504814622597752 : Rat) / 6527410339149) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-167 : Rat) / 14) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((-612657449971195 : Rat) / 1065699647208) [(1, 2), (11, 1), (13, 1)],
  term ((1495 : Rat) / 84) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-8117695752019597 : Rat) / 13054820678298) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((38493409663518703 : Rat) / 26109641356596) [(1, 2), (11, 1), (15, 1)],
  term ((-295 : Rat) / 21) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (11, 2), (14, 1)],
  term ((1995025419914833 : Rat) / 26109641356596) [(1, 3), (2, 1), (7, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 3), (2, 1), (11, 1)],
  term ((-464357836888642 : Rat) / 6527410339149) [(1, 3), (2, 1), (15, 1)],
  term ((-3137849527878865 : Rat) / 52219282713192) [(1, 3), (3, 1)],
  term ((278043609231076 : Rat) / 6527410339149) [(1, 3), (3, 1), (6, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 3), (3, 1), (10, 1)],
  term ((-278043609231076 : Rat) / 6527410339149) [(1, 3), (3, 1), (14, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 3), (6, 1), (7, 1)],
  term ((2632524997090913 : Rat) / 6527410339149) [(1, 3), (7, 1)],
  term ((8117695752019597 : Rat) / 26109641356596) [(1, 3), (7, 1), (10, 1)],
  term ((-14990364159433 : Rat) / 53959475808) [(1, 3), (9, 1)],
  term ((-10541695010249 : Rat) / 35972983872) [(1, 3), (9, 1), (10, 1)],
  term ((29952 : Rat) / 553) [(1, 3), (10, 1), (11, 1)],
  term ((420238704919547 : Rat) / 1420932862944) [(1, 3), (10, 1), (13, 1)],
  term ((-855 : Rat) / 112) [(1, 3), (10, 1), (13, 1), (16, 1)],
  term ((-5252407311298876 : Rat) / 6527410339149) [(1, 3), (10, 1), (15, 1)],
  term ((167 : Rat) / 28) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((9984 : Rat) / 553) [(1, 3), (11, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 3), (11, 1), (14, 1)],
  term ((612657449971195 : Rat) / 2131399294416) [(1, 3), (13, 1)],
  term ((-1495 : Rat) / 168) [(1, 3), (13, 1), (16, 1)],
  term ((8117695752019597 : Rat) / 26109641356596) [(1, 3), (14, 1), (15, 1)],
  term ((-38493409663518703 : Rat) / 52219282713192) [(1, 3), (15, 1)],
  term ((295 : Rat) / 42) [(1, 3), (15, 1), (16, 1)],
  term ((9984 : Rat) / 553) [(1, 4)],
  term ((68176191761805829 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(2, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((-11417898838515544 : Rat) / 6527410339149) [(2, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((170 : Rat) / 63) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 13054820678298) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13109237458655 : Rat) / 40469606856) [(2, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-69890684756316647 : Rat) / 78328924069788) [(2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-20888479639035097 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-131394754748634667 : Rat) / 78328924069788) [(2, 1), (3, 1), (7, 1), (10, 2)],
  term ((563216325591293 : Rat) / 1598549470812) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((3295 : Rat) / 126) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2147977952760877 : Rat) / 2175803446383) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1454 : Rat) / 63) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9379776327675377 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 1), (11, 2)],
  term ((-2774813806667099 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 2), (11, 1)],
  term ((9355672864031 : Rat) / 53959475808) [(2, 1), (3, 1), (9, 1), (10, 1)],
  term ((56444662032005 : Rat) / 161878427424) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((10272341995357 : Rat) / 26979737904) [(2, 1), (3, 1), (9, 1), (10, 2)],
  term ((2695702350653 : Rat) / 23125489632) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((10272341995357 : Rat) / 26979737904) [(2, 1), (3, 1), (9, 1), (11, 2)],
  term ((-1024430348060099 : Rat) / 8703213785532) [(2, 1), (3, 1), (10, 2), (11, 1)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(2, 1), (3, 1), (11, 1)],
  term ((-902058195792353 : Rat) / 6394197883248) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12235 : Rat) / 504) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((10451440794479309 : Rat) / 26109641356596) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((2683 : Rat) / 126) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-407190918025783 : Rat) / 1065699647208) [(2, 1), (3, 1), (11, 2), (13, 1)],
  term ((835 : Rat) / 84) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((8449799276325179 : Rat) / 13054820678298) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-163 : Rat) / 21) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1024430348060099 : Rat) / 8703213785532) [(2, 1), (3, 1), (11, 3)],
  term ((1328274198856205 : Rat) / 26109641356596) [(2, 1), (3, 2)],
  term ((13109237458655 : Rat) / 80939213712) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-103850309606364191 : Rat) / 156657848139576) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-563216325591293 : Rat) / 3197098941624) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-3295 : Rat) / 252) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((2147977952760877 : Rat) / 4351606892766) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((727 : Rat) / 63) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((2774813806667099 : Rat) / 26109641356596) [(2, 1), (3, 2), (7, 2)],
  term ((-10272341995357 : Rat) / 53959475808) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((-2695702350653 : Rat) / 46250979264) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((407190918025783 : Rat) / 2131399294416) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-835 : Rat) / 168) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((22862904885576643 : Rat) / 78328924069788) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((163 : Rat) / 42) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((858810648272687 : Rat) / 52219282713192) [(2, 1), (3, 2), (11, 2)],
  term ((902058195792353 : Rat) / 12788395766496) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((12235 : Rat) / 1008) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 1), (3, 2), (14, 1)],
  term ((-10451440794479309 : Rat) / 52219282713192) [(2, 1), (3, 2), (15, 2)],
  term ((-2683 : Rat) / 252) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((2703963593690645 : Rat) / 11189846295684) [(2, 1), (3, 3), (7, 1)],
  term ((1107240197953805 : Rat) / 52219282713192) [(2, 1), (3, 3), (11, 1)],
  term ((-12053075678638045 : Rat) / 39164462034894) [(2, 1), (3, 3), (15, 1)],
  term ((598861995878285 : Rat) / 26109641356596) [(2, 1), (10, 1)],
  term ((-598861995878285 : Rat) / 52219282713192) [(2, 2)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((5708949419257772 : Rat) / 6527410339149) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 26109641356596) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((69890684756316647 : Rat) / 156657848139576) [(2, 2), (3, 1), (7, 1)],
  term ((55683774125296607 : Rat) / 156657848139576) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((20888479639035097 : Rat) / 26109641356596) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-9355672864031 : Rat) / 107918951616) [(2, 2), (3, 1), (9, 1)],
  term ((-10272341995357 : Rat) / 53959475808) [(2, 2), (3, 1), (9, 1), (10, 1)],
  term ((-56444662032005 : Rat) / 323756854848) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((858810648272687 : Rat) / 52219282713192) [(2, 2), (3, 1), (10, 1), (11, 1)],
  term ((12053075678638045 : Rat) / 19582231017447) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-13109237458655 : Rat) / 40469606856) [(2, 2), (7, 1), (9, 1), (10, 1)],
  term ((9379776327675377 : Rat) / 26109641356596) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((563216325591293 : Rat) / 1598549470812) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((3295 : Rat) / 126) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2147977952760877 : Rat) / 2175803446383) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term ((-1454 : Rat) / 63) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2774813806667099 : Rat) / 13054820678298) [(2, 2), (7, 2), (10, 1)],
  term ((10272341995357 : Rat) / 26979737904) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((2695702350653 : Rat) / 23125489632) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(2, 2), (10, 1)],
  term ((-407190918025783 : Rat) / 1065699647208) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((835 : Rat) / 84) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((8449799276325179 : Rat) / 13054820678298) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-163 : Rat) / 21) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1024430348060099 : Rat) / 8703213785532) [(2, 2), (10, 1), (11, 2)],
  term ((-902058195792353 : Rat) / 6394197883248) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((-12235 : Rat) / 504) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 2), (10, 1), (14, 1)],
  term ((10451440794479309 : Rat) / 26109641356596) [(2, 2), (10, 1), (15, 2)],
  term ((2683 : Rat) / 126) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((1328274198856205 : Rat) / 26109641356596) [(2, 3)],
  term ((2703963593690645 : Rat) / 11189846295684) [(2, 3), (3, 1), (7, 1)],
  term ((1107240197953805 : Rat) / 52219282713192) [(2, 3), (3, 1), (11, 1)],
  term ((-12053075678638045 : Rat) / 39164462034894) [(2, 3), (3, 1), (15, 1)],
  term ((13109237458655 : Rat) / 80939213712) [(2, 3), (7, 1), (9, 1)],
  term ((-9379776327675377 : Rat) / 52219282713192) [(2, 3), (7, 1), (11, 1)],
  term ((-563216325591293 : Rat) / 3197098941624) [(2, 3), (7, 1), (13, 1)],
  term ((-3295 : Rat) / 252) [(2, 3), (7, 1), (13, 1), (16, 1)],
  term ((2147977952760877 : Rat) / 4351606892766) [(2, 3), (7, 1), (15, 1)],
  term ((727 : Rat) / 63) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((2774813806667099 : Rat) / 26109641356596) [(2, 3), (7, 2)],
  term ((-10272341995357 : Rat) / 53959475808) [(2, 3), (9, 1), (11, 1)],
  term ((-2695702350653 : Rat) / 46250979264) [(2, 3), (9, 1), (15, 1)],
  term ((407190918025783 : Rat) / 2131399294416) [(2, 3), (11, 1), (13, 1)],
  term ((-835 : Rat) / 168) [(2, 3), (11, 1), (13, 1), (16, 1)],
  term ((-8449799276325179 : Rat) / 26109641356596) [(2, 3), (11, 1), (15, 1)],
  term ((163 : Rat) / 42) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((1024430348060099 : Rat) / 17406427571064) [(2, 3), (11, 2)],
  term ((902058195792353 : Rat) / 12788395766496) [(2, 3), (13, 1), (15, 1)],
  term ((12235 : Rat) / 1008) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 3), (14, 1)],
  term ((-10451440794479309 : Rat) / 52219282713192) [(2, 3), (15, 2)],
  term ((-2683 : Rat) / 252) [(2, 3), (15, 2), (16, 1)],
  term ((598861995878285 : Rat) / 26109641356596) [(3, 1), (11, 1)],
  term ((-598861995878285 : Rat) / 52219282713192) [(3, 2)],
  term ((68176191761805829 : Rat) / 19582231017447) [(3, 2), (6, 1), (7, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((5392685014514719 : Rat) / 13054820678298) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11417898838515544 : Rat) / 6527410339149) [(3, 2), (6, 1), (11, 2)],
  term ((-131394754748634667 : Rat) / 78328924069788) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((-69890684756316647 : Rat) / 78328924069788) [(3, 2), (7, 1), (11, 1)],
  term ((-20888479639035097 : Rat) / 13054820678298) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((10272341995357 : Rat) / 26979737904) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((9355672864031 : Rat) / 53959475808) [(3, 2), (9, 1), (11, 1)],
  term ((56444662032005 : Rat) / 161878427424) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-1024430348060099 : Rat) / 8703213785532) [(3, 2), (10, 1), (11, 2)],
  term ((-68176191761805829 : Rat) / 39164462034894) [(3, 3), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 3), (6, 1), (9, 1)],
  term ((5708949419257772 : Rat) / 6527410339149) [(3, 3), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 3), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(3, 3), (6, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 3), (6, 1), (14, 1), (15, 1)],
  term ((-5392685014514719 : Rat) / 26109641356596) [(3, 3), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((69890684756316647 : Rat) / 156657848139576) [(3, 3), (7, 1)],
  term ((131394754748634667 : Rat) / 156657848139576) [(3, 3), (7, 1), (10, 1)],
  term ((20888479639035097 : Rat) / 26109641356596) [(3, 3), (7, 1), (14, 1)],
  term ((-9355672864031 : Rat) / 107918951616) [(3, 3), (9, 1)],
  term ((-10272341995357 : Rat) / 53959475808) [(3, 3), (9, 1), (10, 1)],
  term ((-56444662032005 : Rat) / 323756854848) [(3, 3), (9, 1), (14, 1)],
  term ((1024430348060099 : Rat) / 17406427571064) [(3, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_22_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_22_0000_0099
      rs_R009_ueqv_R009YNNNN_block_22_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
