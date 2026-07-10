/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 24:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0000 : Poly :=
[
  term ((-73786686725060051 : Rat) / 417754261705536) []
]

/-- Partial product 0 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0000 : Poly :=
[
  term ((73786686725060051 : Rat) / 208877130852768) [(0, 1), (10, 1)],
  term ((-73786686725060051 : Rat) / 417754261705536) [(0, 2)],
  term ((73786686725060051 : Rat) / 208877130852768) [(1, 1), (11, 1)],
  term ((-73786686725060051 : Rat) / 417754261705536) [(1, 2)],
  term ((-73786686725060051 : Rat) / 208877130852768) [(10, 1), (14, 1)],
  term ((-73786686725060051 : Rat) / 208877130852768) [(11, 1), (15, 1)],
  term ((73786686725060051 : Rat) / 417754261705536) [(14, 2)],
  term ((73786686725060051 : Rat) / 417754261705536) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0000
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0001 : Poly :=
[
  term ((10212934129824805 : Rat) / 17406427571064) [(0, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0001 : Poly :=
[
  term ((-10212934129824805 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1)],
  term ((10212934129824805 : Rat) / 17406427571064) [(0, 1), (1, 2)],
  term ((10212934129824805 : Rat) / 8703213785532) [(0, 1), (10, 1), (14, 1)],
  term ((10212934129824805 : Rat) / 8703213785532) [(0, 1), (11, 1), (15, 1)],
  term ((-10212934129824805 : Rat) / 17406427571064) [(0, 1), (14, 2)],
  term ((-10212934129824805 : Rat) / 17406427571064) [(0, 1), (15, 2)],
  term ((-10212934129824805 : Rat) / 8703213785532) [(0, 2), (10, 1)],
  term ((10212934129824805 : Rat) / 17406427571064) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0001
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0002 : Poly :=
[
  term ((427923741401 : Rat) / 999249552) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0002 : Poly :=
[
  term ((427923741401 : Rat) / 499624776) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((427923741401 : Rat) / 499624776) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-427923741401 : Rat) / 999249552) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-427923741401 : Rat) / 999249552) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((-427923741401 : Rat) / 499624776) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((427923741401 : Rat) / 999249552) [(0, 1), (1, 3), (9, 1)],
  term ((-427923741401 : Rat) / 499624776) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((427923741401 : Rat) / 999249552) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0002
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0003 : Poly :=
[
  term ((-5982455126969 : Rat) / 13156785768) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0003 : Poly :=
[
  term ((-5982455126969 : Rat) / 6578392884) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-5982455126969 : Rat) / 6578392884) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((5982455126969 : Rat) / 13156785768) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((5982455126969 : Rat) / 13156785768) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((5982455126969 : Rat) / 6578392884) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-5982455126969 : Rat) / 13156785768) [(0, 1), (1, 3), (13, 1)],
  term ((5982455126969 : Rat) / 6578392884) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((-5982455126969 : Rat) / 13156785768) [(0, 3), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0003
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0004 : Poly :=
[
  term ((335 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0004 : Poly :=
[
  term ((335 : Rat) / 14) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((335 : Rat) / 14) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-335 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-335 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-335 : Rat) / 14) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((335 : Rat) / 28) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term ((-335 : Rat) / 14) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((335 : Rat) / 28) [(0, 3), (1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0004
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0005 : Poly :=
[
  term ((4068918527993 : Rat) / 4933794663) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 5 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0005 : Poly :=
[
  term ((8137837055986 : Rat) / 4933794663) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((8137837055986 : Rat) / 4933794663) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-4068918527993 : Rat) / 4933794663) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((-4068918527993 : Rat) / 4933794663) [(0, 1), (1, 1), (15, 3)],
  term ((-8137837055986 : Rat) / 4933794663) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((4068918527993 : Rat) / 4933794663) [(0, 1), (1, 3), (15, 1)],
  term ((-8137837055986 : Rat) / 4933794663) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((4068918527993 : Rat) / 4933794663) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0005
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0006 : Poly :=
[
  term ((-67 : Rat) / 7) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0006 : Poly :=
[
  term ((-134 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-134 : Rat) / 7) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((67 : Rat) / 7) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((67 : Rat) / 7) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((134 : Rat) / 7) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-67 : Rat) / 7) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((134 : Rat) / 7) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-67 : Rat) / 7) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0006
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0007 : Poly :=
[
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 1), (2, 1)]
]

/-- Partial product 7 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0007 : Poly :=
[
  term ((655366654874374 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 1), (1, 2), (2, 1)],
  term ((-655366654874374 : Rat) / 2175803446383) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((-655366654874374 : Rat) / 2175803446383) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(0, 1), (2, 1), (14, 2)],
  term ((327683327437187 : Rat) / 2175803446383) [(0, 1), (2, 1), (15, 2)],
  term ((655366654874374 : Rat) / 2175803446383) [(0, 2), (2, 1), (10, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 3), (2, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0007
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0008 : Poly :=
[
  term ((-24515196524944 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0008 : Poly :=
[
  term ((49030393049888 : Rat) / 241755938487) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-24515196524944 : Rat) / 241755938487) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((-49030393049888 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-49030393049888 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((24515196524944 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((24515196524944 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((49030393049888 : Rat) / 241755938487) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((-24515196524944 : Rat) / 241755938487) [(0, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0008
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0009 : Poly :=
[
  term ((10861008665 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0009 : Poly :=
[
  term ((-21722017330 : Rat) / 187359291) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((-21722017330 : Rat) / 187359291) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0009
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0010 : Poly :=
[
  term ((-640 : Rat) / 63) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0010 : Poly :=
[
  term ((1280 : Rat) / 63) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((-640 : Rat) / 63) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-1280 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((640 : Rat) / 63) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((640 : Rat) / 63) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-1280 : Rat) / 63) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((1280 : Rat) / 63) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-640 : Rat) / 63) [(0, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0010
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0011 : Poly :=
[
  term ((-7984927210 : Rat) / 187359291) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 11 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0011 : Poly :=
[
  term ((15969854420 : Rat) / 187359291) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-7984927210 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-15969854420 : Rat) / 187359291) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-15969854420 : Rat) / 187359291) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((7984927210 : Rat) / 187359291) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((7984927210 : Rat) / 187359291) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((15969854420 : Rat) / 187359291) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-7984927210 : Rat) / 187359291) [(0, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0011
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0012 : Poly :=
[
  term ((20 : Rat) / 7) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0012 : Poly :=
[
  term ((-40 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((20 : Rat) / 7) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((20 : Rat) / 7) [(0, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0012
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0013 : Poly :=
[
  term ((170212893090272 : Rat) / 725267815461) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0013 : Poly :=
[
  term ((-340425786180544 : Rat) / 725267815461) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((170212893090272 : Rat) / 725267815461) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((340425786180544 : Rat) / 725267815461) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((340425786180544 : Rat) / 725267815461) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-170212893090272 : Rat) / 725267815461) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-170212893090272 : Rat) / 725267815461) [(0, 1), (3, 1), (15, 3)],
  term ((-340425786180544 : Rat) / 725267815461) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((170212893090272 : Rat) / 725267815461) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0013
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0014 : Poly :=
[
  term ((-16 : Rat) / 7) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0014 : Poly :=
[
  term ((32 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 7) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0014
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0015 : Poly :=
[
  term ((-640 : Rat) / 21) [(0, 1), (3, 2)]
]

/-- Partial product 15 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0015 : Poly :=
[
  term ((1280 : Rat) / 21) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-640 : Rat) / 21) [(0, 1), (1, 2), (3, 2)],
  term ((-1280 : Rat) / 21) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((-1280 : Rat) / 21) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((640 : Rat) / 21) [(0, 1), (3, 2), (14, 2)],
  term ((640 : Rat) / 21) [(0, 1), (3, 2), (15, 2)],
  term ((1280 : Rat) / 21) [(0, 2), (3, 2), (10, 1)],
  term ((-640 : Rat) / 21) [(0, 3), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0015
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0016 : Poly :=
[
  term ((-1758326923282207 : Rat) / 2901071261844) [(0, 1), (6, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0016 : Poly :=
[
  term ((1758326923282207 : Rat) / 1450535630922) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((-1758326923282207 : Rat) / 2901071261844) [(0, 1), (1, 2), (6, 1)],
  term ((-1758326923282207 : Rat) / 1450535630922) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((-1758326923282207 : Rat) / 1450535630922) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((1758326923282207 : Rat) / 2901071261844) [(0, 1), (6, 1), (14, 2)],
  term ((1758326923282207 : Rat) / 2901071261844) [(0, 1), (6, 1), (15, 2)],
  term ((1758326923282207 : Rat) / 1450535630922) [(0, 2), (6, 1), (10, 1)],
  term ((-1758326923282207 : Rat) / 2901071261844) [(0, 3), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0016
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0017 : Poly :=
[
  term ((-62820191095169 : Rat) / 1450535630922) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 17 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0017 : Poly :=
[
  term ((62820191095169 : Rat) / 725267815461) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((-62820191095169 : Rat) / 1450535630922) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-62820191095169 : Rat) / 725267815461) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((62820191095169 : Rat) / 1450535630922) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((62820191095169 : Rat) / 1450535630922) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((-62820191095169 : Rat) / 725267815461) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((62820191095169 : Rat) / 725267815461) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-62820191095169 : Rat) / 1450535630922) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0017
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0018 : Poly :=
[
  term ((-19918597176517 : Rat) / 2901071261844) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0018 : Poly :=
[
  term ((19918597176517 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-19918597176517 : Rat) / 2901071261844) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-19918597176517 : Rat) / 1450535630922) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-19918597176517 : Rat) / 1450535630922) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((19918597176517 : Rat) / 2901071261844) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(0, 1), (7, 1), (15, 3)],
  term ((19918597176517 : Rat) / 1450535630922) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-19918597176517 : Rat) / 2901071261844) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0018
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0019 : Poly :=
[
  term ((2172201733 : Rat) / 107062452) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 19 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0019 : Poly :=
[
  term ((-2172201733 : Rat) / 53531226) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((2172201733 : Rat) / 107062452) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((2172201733 : Rat) / 53531226) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2172201733 : Rat) / 107062452) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-2172201733 : Rat) / 107062452) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((2172201733 : Rat) / 53531226) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-2172201733 : Rat) / 53531226) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((2172201733 : Rat) / 107062452) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0019
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0020 : Poly :=
[
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0020 : Poly :=
[
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-108242905555 : Rat) / 374718582) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0020
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0021 : Poly :=
[
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0021 : Poly :=
[
  term ((115 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((115 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0021
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0022 : Poly :=
[
  term ((-8652670741 : Rat) / 104877504) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0022 : Poly :=
[
  term ((8652670741 : Rat) / 52438752) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-8652670741 : Rat) / 104877504) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-8652670741 : Rat) / 52438752) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8652670741 : Rat) / 52438752) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((8652670741 : Rat) / 104877504) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((8652670741 : Rat) / 104877504) [(0, 1), (9, 1), (15, 3)],
  term ((8652670741 : Rat) / 52438752) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-8652670741 : Rat) / 104877504) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0022
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0023 : Poly :=
[
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0023 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0023
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0024 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2)]
]

/-- Partial product 24 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0024 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (1, 2), (9, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (14, 2)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (15, 2)],
  term ((249803199295 : Rat) / 749437164) [(0, 2), (9, 2), (10, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0024
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0025 : Poly :=
[
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1)]
]

/-- Partial product 25 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0025 : Poly :=
[
  term ((-9387371864538683 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 1), (1, 2), (10, 1)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1), (14, 2)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1), (15, 2)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 1), (10, 2), (14, 1)],
  term ((-9387371864538683 : Rat) / 8703213785532) [(0, 2), (10, 2)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0025
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0026 : Poly :=
[
  term ((-333701349449 : Rat) / 29602767978) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 26 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0026 : Poly :=
[
  term ((333701349449 : Rat) / 14801383989) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((-333701349449 : Rat) / 29602767978) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-333701349449 : Rat) / 14801383989) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((333701349449 : Rat) / 29602767978) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((333701349449 : Rat) / 29602767978) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-333701349449 : Rat) / 14801383989) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((333701349449 : Rat) / 14801383989) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-333701349449 : Rat) / 29602767978) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0026
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0027 : Poly :=
[
  term ((-45 : Rat) / 7) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 27 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0027 : Poly :=
[
  term ((90 : Rat) / 7) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-45 : Rat) / 7) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-90 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((45 : Rat) / 7) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((45 : Rat) / 7) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-90 : Rat) / 7) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((90 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-45 : Rat) / 7) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0027
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0028 : Poly :=
[
  term ((-93572861223133 : Rat) / 725267815461) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 28 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0028 : Poly :=
[
  term ((187145722446266 : Rat) / 725267815461) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-93572861223133 : Rat) / 725267815461) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-187145722446266 : Rat) / 725267815461) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((93572861223133 : Rat) / 725267815461) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((93572861223133 : Rat) / 725267815461) [(0, 1), (11, 1), (15, 3)],
  term ((-187145722446266 : Rat) / 725267815461) [(0, 1), (11, 2), (15, 2)],
  term ((187145722446266 : Rat) / 725267815461) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-93572861223133 : Rat) / 725267815461) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0028
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0029 : Poly :=
[
  term ((40 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0029 : Poly :=
[
  term ((-80 : Rat) / 7) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0029
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0030 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (11, 2)]
]

/-- Partial product 30 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0030 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (1, 1), (11, 3)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 2), (11, 2)],
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (11, 2), (14, 2)],
  term ((119808 : Rat) / 553) [(0, 1), (11, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(0, 1), (11, 3), (15, 1)],
  term ((239616 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((-119808 : Rat) / 553) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0030
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0031 : Poly :=
[
  term ((42524064902857 : Rat) / 1420932862944) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 31 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0031 : Poly :=
[
  term ((-42524064902857 : Rat) / 710466431472) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((42524064902857 : Rat) / 1420932862944) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((42524064902857 : Rat) / 710466431472) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((42524064902857 : Rat) / 710466431472) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-42524064902857 : Rat) / 1420932862944) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-42524064902857 : Rat) / 1420932862944) [(0, 1), (13, 1), (15, 3)],
  term ((-42524064902857 : Rat) / 710466431472) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((42524064902857 : Rat) / 1420932862944) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0031
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0032 : Poly :=
[
  term ((-125 : Rat) / 112) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0032 : Poly :=
[
  term ((125 : Rat) / 56) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-125 : Rat) / 112) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-125 : Rat) / 56) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((125 : Rat) / 112) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((125 : Rat) / 112) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((125 : Rat) / 56) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-125 : Rat) / 112) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0032
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0033 : Poly :=
[
  term ((-196842265964507 : Rat) / 17406427571064) [(0, 1), (14, 1)]
]

/-- Partial product 33 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0033 : Poly :=
[
  term ((196842265964507 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((-196842265964507 : Rat) / 17406427571064) [(0, 1), (1, 2), (14, 1)],
  term ((-196842265964507 : Rat) / 8703213785532) [(0, 1), (10, 1), (14, 2)],
  term ((-196842265964507 : Rat) / 8703213785532) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((196842265964507 : Rat) / 17406427571064) [(0, 1), (14, 1), (15, 2)],
  term ((196842265964507 : Rat) / 17406427571064) [(0, 1), (14, 3)],
  term ((196842265964507 : Rat) / 8703213785532) [(0, 2), (10, 1), (14, 1)],
  term ((-196842265964507 : Rat) / 17406427571064) [(0, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0033
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0034 : Poly :=
[
  term ((-3498990095386153 : Rat) / 17406427571064) [(0, 1), (15, 2)]
]

/-- Partial product 34 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0034 : Poly :=
[
  term ((3498990095386153 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-3498990095386153 : Rat) / 17406427571064) [(0, 1), (1, 2), (15, 2)],
  term ((-3498990095386153 : Rat) / 8703213785532) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3498990095386153 : Rat) / 8703213785532) [(0, 1), (11, 1), (15, 3)],
  term ((3498990095386153 : Rat) / 17406427571064) [(0, 1), (14, 2), (15, 2)],
  term ((3498990095386153 : Rat) / 17406427571064) [(0, 1), (15, 4)],
  term ((3498990095386153 : Rat) / 8703213785532) [(0, 2), (10, 1), (15, 2)],
  term ((-3498990095386153 : Rat) / 17406427571064) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0034
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0035 : Poly :=
[
  term ((29 : Rat) / 28) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 35 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0035 : Poly :=
[
  term ((-29 : Rat) / 14) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((29 : Rat) / 28) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((29 : Rat) / 14) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((29 : Rat) / 14) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-29 : Rat) / 28) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-29 : Rat) / 28) [(0, 1), (15, 4), (16, 1)],
  term ((-29 : Rat) / 14) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((29 : Rat) / 28) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0035
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0036 : Poly :=
[
  term ((106057349445674 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 36 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0036 : Poly :=
[
  term ((-212114698891348 : Rat) / 932487191307) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((106057349445674 : Rat) / 932487191307) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((212114698891348 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)],
  term ((212114698891348 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-106057349445674 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-106057349445674 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-212114698891348 : Rat) / 932487191307) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((106057349445674 : Rat) / 932487191307) [(1, 3), (2, 1), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0036
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0037 : Poly :=
[
  term ((45864690786755 : Rat) / 2901071261844) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 37 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0037 : Poly :=
[
  term ((-45864690786755 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((45864690786755 : Rat) / 2901071261844) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((45864690786755 : Rat) / 1450535630922) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1)],
  term ((45864690786755 : Rat) / 1450535630922) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-45864690786755 : Rat) / 2901071261844) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((-45864690786755 : Rat) / 2901071261844) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-45864690786755 : Rat) / 1450535630922) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((45864690786755 : Rat) / 2901071261844) [(1, 3), (2, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0037
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0038 : Poly :=
[
  term ((-16097797431678929 : Rat) / 52219282713192) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 38 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0038 : Poly :=
[
  term ((16097797431678929 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-16097797431678929 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-16097797431678929 : Rat) / 26109641356596) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((16097797431678929 : Rat) / 52219282713192) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((16097797431678929 : Rat) / 52219282713192) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-16097797431678929 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((16097797431678929 : Rat) / 26109641356596) [(1, 2), (2, 1), (11, 2)],
  term ((-16097797431678929 : Rat) / 52219282713192) [(1, 3), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0038
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0039 : Poly :=
[
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 39 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0039 : Poly :=
[
  term ((3990050839829666 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-3990050839829666 : Rat) / 6527410339149) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3990050839829666 : Rat) / 6527410339149) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 1), (2, 1), (15, 3)],
  term ((3990050839829666 : Rat) / 6527410339149) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0039
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0040 : Poly :=
[
  term ((-2241117273696821 : Rat) / 52219282713192) [(1, 1), (3, 1)]
]

/-- Partial product 40 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0040 : Poly :=
[
  term ((2241117273696821 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((-2241117273696821 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1)],
  term ((-2241117273696821 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-2241117273696821 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((2241117273696821 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 2)],
  term ((2241117273696821 : Rat) / 52219282713192) [(1, 1), (3, 1), (15, 2)],
  term ((2241117273696821 : Rat) / 26109641356596) [(1, 2), (3, 1), (11, 1)],
  term ((-2241117273696821 : Rat) / 52219282713192) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0040
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0041 : Poly :=
[
  term ((2798930113055885 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 41 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0041 : Poly :=
[
  term ((-5597860226111770 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (10, 1)],
  term ((2798930113055885 : Rat) / 19582231017447) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((5597860226111770 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1)],
  term ((5597860226111770 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2798930113055885 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((-2798930113055885 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-5597860226111770 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((2798930113055885 : Rat) / 19582231017447) [(1, 3), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0041
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0042 : Poly :=
[
  term ((130962509935165 : Rat) / 17406427571064) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 42 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0042 : Poly :=
[
  term ((-130962509935165 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (10, 2)],
  term ((130962509935165 : Rat) / 17406427571064) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((130962509935165 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-130962509935165 : Rat) / 17406427571064) [(1, 1), (3, 1), (10, 1), (14, 2)],
  term ((-130962509935165 : Rat) / 17406427571064) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((130962509935165 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 2), (14, 1)],
  term ((-130962509935165 : Rat) / 8703213785532) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((130962509935165 : Rat) / 17406427571064) [(1, 3), (3, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0042
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0043 : Poly :=
[
  term ((-90071490967235 : Rat) / 8703213785532) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 43 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0043 : Poly :=
[
  term ((90071490967235 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-90071490967235 : Rat) / 8703213785532) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-90071490967235 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1), (14, 2)],
  term ((-90071490967235 : Rat) / 4351606892766) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((90071490967235 : Rat) / 8703213785532) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((90071490967235 : Rat) / 8703213785532) [(1, 1), (3, 1), (14, 3)],
  term ((90071490967235 : Rat) / 4351606892766) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-90071490967235 : Rat) / 8703213785532) [(1, 3), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0043
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0044 : Poly :=
[
  term ((-8192672238679723 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 44 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0044 : Poly :=
[
  term ((16385344477359446 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((8192672238679723 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (14, 2)],
  term ((8192672238679723 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((16385344477359446 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(1, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0044
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0045 : Poly :=
[
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 45 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0045 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (6, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0045
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0046 : Poly :=
[
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 46 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0046 : Poly :=
[
  term ((-33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1), (14, 2)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((33885160769843255 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(1, 2), (6, 1), (11, 2)],
  term ((33885160769843255 : Rat) / 26109641356596) [(1, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0046
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0047 : Poly :=
[
  term ((-280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 47 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0047 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0047
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0048 : Poly :=
[
  term ((-85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0048 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0048
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0049 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 49 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0049 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 2), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 3)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 3), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 3), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0049
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0050 : Poly :=
[
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 50 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0050 : Poly :=
[
  term ((24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 3)],
  term ((24463746389447899 : Rat) / 13054820678298) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0050
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0051 : Poly :=
[
  term ((16 : Rat) / 9) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0051 : Poly :=
[
  term ((-32 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(1, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0051
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0052 : Poly :=
[
  term ((13312832350183 : Rat) / 967023753948) [(1, 1), (7, 1)]
]

/-- Partial product 52 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0052 : Poly :=
[
  term ((-13312832350183 : Rat) / 483511876974) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((13312832350183 : Rat) / 967023753948) [(0, 2), (1, 1), (7, 1)],
  term ((13312832350183 : Rat) / 483511876974) [(1, 1), (7, 1), (10, 1), (14, 1)],
  term ((13312832350183 : Rat) / 483511876974) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-13312832350183 : Rat) / 967023753948) [(1, 1), (7, 1), (14, 2)],
  term ((-13312832350183 : Rat) / 967023753948) [(1, 1), (7, 1), (15, 2)],
  term ((-13312832350183 : Rat) / 483511876974) [(1, 2), (7, 1), (11, 1)],
  term ((13312832350183 : Rat) / 967023753948) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0052
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0053 : Poly :=
[
  term ((62820191095169 : Rat) / 1450535630922) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 53 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0053 : Poly :=
[
  term ((-62820191095169 : Rat) / 725267815461) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((62820191095169 : Rat) / 1450535630922) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((62820191095169 : Rat) / 725267815461) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-62820191095169 : Rat) / 1450535630922) [(1, 1), (7, 1), (10, 1), (14, 2)],
  term ((-62820191095169 : Rat) / 1450535630922) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((62820191095169 : Rat) / 725267815461) [(1, 1), (7, 1), (10, 2), (14, 1)],
  term ((-62820191095169 : Rat) / 725267815461) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((62820191095169 : Rat) / 1450535630922) [(1, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0053
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0054 : Poly :=
[
  term ((19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 54 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0054 : Poly :=
[
  term ((-19918597176517 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (10, 1), (14, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((19918597176517 : Rat) / 1450535630922) [(1, 1), (7, 1), (10, 1), (14, 2)],
  term ((19918597176517 : Rat) / 1450535630922) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (14, 3)],
  term ((-19918597176517 : Rat) / 1450535630922) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(1, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0054
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0055 : Poly :=
[
  term ((9160174708061 : Rat) / 17986491936) [(1, 1), (9, 1)]
]

/-- Partial product 55 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0055 : Poly :=
[
  term ((-9160174708061 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((9160174708061 : Rat) / 17986491936) [(0, 2), (1, 1), (9, 1)],
  term ((9160174708061 : Rat) / 8993245968) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((9160174708061 : Rat) / 8993245968) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-9160174708061 : Rat) / 17986491936) [(1, 1), (9, 1), (14, 2)],
  term ((-9160174708061 : Rat) / 17986491936) [(1, 1), (9, 1), (15, 2)],
  term ((-9160174708061 : Rat) / 8993245968) [(1, 2), (9, 1), (11, 1)],
  term ((9160174708061 : Rat) / 17986491936) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0055
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0056 : Poly :=
[
  term ((62993850257 : Rat) / 999249552) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 56 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0056 : Poly :=
[
  term ((-62993850257 : Rat) / 499624776) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((62993850257 : Rat) / 999249552) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((62993850257 : Rat) / 499624776) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-62993850257 : Rat) / 999249552) [(1, 1), (9, 1), (10, 1), (14, 2)],
  term ((-62993850257 : Rat) / 999249552) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((62993850257 : Rat) / 499624776) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((-62993850257 : Rat) / 499624776) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((62993850257 : Rat) / 999249552) [(1, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0056
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0057 : Poly :=
[
  term ((-5615141479805 : Rat) / 35972983872) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 57 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0057 : Poly :=
[
  term ((5615141479805 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-5615141479805 : Rat) / 35972983872) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((-5615141479805 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (14, 2)],
  term ((-5615141479805 : Rat) / 17986491936) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((5615141479805 : Rat) / 35972983872) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((5615141479805 : Rat) / 35972983872) [(1, 1), (9, 1), (14, 3)],
  term ((5615141479805 : Rat) / 17986491936) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-5615141479805 : Rat) / 35972983872) [(1, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0057
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0058 : Poly :=
[
  term ((119808 : Rat) / 553) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 58 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0058 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((-239616 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((119808 : Rat) / 553) [(1, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0058
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0059 : Poly :=
[
  term ((-7216384141049 : Rat) / 118411071912) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 59 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0059 : Poly :=
[
  term ((7216384141049 : Rat) / 59205535956) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((-7216384141049 : Rat) / 118411071912) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((-7216384141049 : Rat) / 59205535956) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((7216384141049 : Rat) / 118411071912) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((7216384141049 : Rat) / 118411071912) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-7216384141049 : Rat) / 59205535956) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((7216384141049 : Rat) / 59205535956) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-7216384141049 : Rat) / 118411071912) [(1, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0059
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0060 : Poly :=
[
  term ((295 : Rat) / 28) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 60 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0060 : Poly :=
[
  term ((-295 : Rat) / 14) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((295 : Rat) / 28) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((295 : Rat) / 14) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-295 : Rat) / 28) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-295 : Rat) / 28) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((295 : Rat) / 14) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-295 : Rat) / 14) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((295 : Rat) / 28) [(1, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0060
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0061 : Poly :=
[
  term ((13564261196228125 : Rat) / 52219282713192) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 61 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0061 : Poly :=
[
  term ((-13564261196228125 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((13564261196228125 : Rat) / 52219282713192) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((13564261196228125 : Rat) / 26109641356596) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-13564261196228125 : Rat) / 52219282713192) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((-13564261196228125 : Rat) / 52219282713192) [(1, 1), (10, 1), (15, 3)],
  term ((13564261196228125 : Rat) / 26109641356596) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((-13564261196228125 : Rat) / 26109641356596) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((13564261196228125 : Rat) / 52219282713192) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0061
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0062 : Poly :=
[
  term (-9 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0062 : Poly :=
[
  term (18 : Rat) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term (9 : Rat) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term (-18 : Rat) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0062
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0063 : Poly :=
[
  term ((59904 : Rat) / 553) [(1, 1), (11, 1)]
]

/-- Partial product 63 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0063 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (1, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (11, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(1, 1), (11, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 2), (15, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (11, 2)],
  term ((59904 : Rat) / 553) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0063
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0064 : Poly :=
[
  term ((10946035635971725 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 64 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0064 : Poly :=
[
  term ((-10946035635971725 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((10946035635971725 : Rat) / 52219282713192) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((10946035635971725 : Rat) / 26109641356596) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((-10946035635971725 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-10946035635971725 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 3)],
  term ((10946035635971725 : Rat) / 26109641356596) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-10946035635971725 : Rat) / 26109641356596) [(1, 2), (11, 2), (14, 1)],
  term ((10946035635971725 : Rat) / 52219282713192) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0064
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0065 : Poly :=
[
  term ((-59260846402276025 : Rat) / 104438565426384) [(1, 1), (13, 1)]
]

/-- Partial product 65 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0065 : Poly :=
[
  term ((59260846402276025 : Rat) / 52219282713192) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((-59260846402276025 : Rat) / 104438565426384) [(0, 2), (1, 1), (13, 1)],
  term ((-59260846402276025 : Rat) / 52219282713192) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-59260846402276025 : Rat) / 52219282713192) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((59260846402276025 : Rat) / 104438565426384) [(1, 1), (13, 1), (14, 2)],
  term ((59260846402276025 : Rat) / 104438565426384) [(1, 1), (13, 1), (15, 2)],
  term ((59260846402276025 : Rat) / 52219282713192) [(1, 2), (11, 1), (13, 1)],
  term ((-59260846402276025 : Rat) / 104438565426384) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0065
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0066 : Poly :=
[
  term ((238144355108759 : Rat) / 1420932862944) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 66 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0066 : Poly :=
[
  term ((-238144355108759 : Rat) / 710466431472) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((238144355108759 : Rat) / 1420932862944) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((238144355108759 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((238144355108759 : Rat) / 710466431472) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-238144355108759 : Rat) / 1420932862944) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-238144355108759 : Rat) / 1420932862944) [(1, 1), (13, 1), (14, 3)],
  term ((-238144355108759 : Rat) / 710466431472) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((238144355108759 : Rat) / 1420932862944) [(1, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0066
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0067 : Poly :=
[
  term ((-355 : Rat) / 112) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 67 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0067 : Poly :=
[
  term ((355 : Rat) / 56) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-355 : Rat) / 112) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-355 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-355 : Rat) / 56) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((355 : Rat) / 112) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((355 : Rat) / 112) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((355 : Rat) / 56) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-355 : Rat) / 112) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0067
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0068 : Poly :=
[
  term ((1315 : Rat) / 56) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 68 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0068 : Poly :=
[
  term ((-1315 : Rat) / 28) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((1315 : Rat) / 56) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((1315 : Rat) / 28) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1315 : Rat) / 28) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1315 : Rat) / 56) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1315 : Rat) / 56) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1315 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((1315 : Rat) / 56) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0068
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0069 : Poly :=
[
  term ((-4857173451905519 : Rat) / 17406427571064) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 69 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0069 : Poly :=
[
  term ((4857173451905519 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-4857173451905519 : Rat) / 17406427571064) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-4857173451905519 : Rat) / 8703213785532) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((-4857173451905519 : Rat) / 8703213785532) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((4857173451905519 : Rat) / 17406427571064) [(1, 1), (14, 1), (15, 3)],
  term ((4857173451905519 : Rat) / 17406427571064) [(1, 1), (14, 3), (15, 1)],
  term ((4857173451905519 : Rat) / 8703213785532) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4857173451905519 : Rat) / 17406427571064) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0069
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0070 : Poly :=
[
  term ((67 : Rat) / 28) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0070 : Poly :=
[
  term ((-67 : Rat) / 14) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((67 : Rat) / 28) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((67 : Rat) / 14) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((67 : Rat) / 14) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-67 : Rat) / 28) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-67 : Rat) / 28) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-67 : Rat) / 14) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((67 : Rat) / 28) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0070
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0071 : Poly :=
[
  term ((10385135859446377 : Rat) / 13054820678298) [(1, 1), (15, 1)]
]

/-- Partial product 71 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0071 : Poly :=
[
  term ((-10385135859446377 : Rat) / 6527410339149) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((10385135859446377 : Rat) / 13054820678298) [(0, 2), (1, 1), (15, 1)],
  term ((10385135859446377 : Rat) / 6527410339149) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((10385135859446377 : Rat) / 6527410339149) [(1, 1), (11, 1), (15, 2)],
  term ((-10385135859446377 : Rat) / 13054820678298) [(1, 1), (14, 2), (15, 1)],
  term ((-10385135859446377 : Rat) / 13054820678298) [(1, 1), (15, 3)],
  term ((-10385135859446377 : Rat) / 6527410339149) [(1, 2), (11, 1), (15, 1)],
  term ((10385135859446377 : Rat) / 13054820678298) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0071
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0072 : Poly :=
[
  term ((-267 : Rat) / 14) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0072 : Poly :=
[
  term ((267 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-267 : Rat) / 14) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-267 : Rat) / 7) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-267 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((267 : Rat) / 14) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((267 : Rat) / 14) [(1, 1), (15, 3), (16, 1)],
  term ((267 : Rat) / 7) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-267 : Rat) / 14) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0072
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0073 : Poly :=
[
  term ((123497011989809 : Rat) / 2901071261844) [(1, 2)]
]

/-- Partial product 73 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0073 : Poly :=
[
  term ((-123497011989809 : Rat) / 1450535630922) [(0, 1), (1, 2), (10, 1)],
  term ((123497011989809 : Rat) / 2901071261844) [(0, 2), (1, 2)],
  term ((123497011989809 : Rat) / 1450535630922) [(1, 2), (10, 1), (14, 1)],
  term ((123497011989809 : Rat) / 1450535630922) [(1, 2), (11, 1), (15, 1)],
  term ((-123497011989809 : Rat) / 2901071261844) [(1, 2), (14, 2)],
  term ((-123497011989809 : Rat) / 2901071261844) [(1, 2), (15, 2)],
  term ((-123497011989809 : Rat) / 1450535630922) [(1, 3), (11, 1)],
  term ((123497011989809 : Rat) / 2901071261844) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0073
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0074 : Poly :=
[
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1)]
]

/-- Partial product 74 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0074 : Poly :=
[
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (10, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(0, 2), (1, 2), (6, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 2), (6, 1), (10, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (14, 2)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (15, 2)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 3), (6, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 4), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0074
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0075 : Poly :=
[
  term ((-346238762919121 : Rat) / 2175803446383) [(2, 1)]
]

/-- Partial product 75 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0075 : Poly :=
[
  term ((692477525838242 : Rat) / 2175803446383) [(0, 1), (2, 1), (10, 1)],
  term ((-346238762919121 : Rat) / 2175803446383) [(0, 2), (2, 1)],
  term ((692477525838242 : Rat) / 2175803446383) [(1, 1), (2, 1), (11, 1)],
  term ((-346238762919121 : Rat) / 2175803446383) [(1, 2), (2, 1)],
  term ((-692477525838242 : Rat) / 2175803446383) [(2, 1), (10, 1), (14, 1)],
  term ((-692477525838242 : Rat) / 2175803446383) [(2, 1), (11, 1), (15, 1)],
  term ((346238762919121 : Rat) / 2175803446383) [(2, 1), (14, 2)],
  term ((346238762919121 : Rat) / 2175803446383) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0075
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0076 : Poly :=
[
  term ((26813407663889003 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 76 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0076 : Poly :=
[
  term ((-26813407663889003 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((26813407663889003 : Rat) / 26109641356596) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((-26813407663889003 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((26813407663889003 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((26813407663889003 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((26813407663889003 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-26813407663889003 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((-26813407663889003 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0076
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0077 : Poly :=
[
  term ((-4707161155411 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 77 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0077 : Poly :=
[
  term ((4707161155411 : Rat) / 10117401714) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-4707161155411 : Rat) / 20234803428) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((4707161155411 : Rat) / 10117401714) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((-4707161155411 : Rat) / 20234803428) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-4707161155411 : Rat) / 10117401714) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-4707161155411 : Rat) / 10117401714) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((4707161155411 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((4707161155411 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0077
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0078 : Poly :=
[
  term ((1739372345392249 : Rat) / 22379692591368) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 78 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0078 : Poly :=
[
  term ((-1739372345392249 : Rat) / 11189846295684) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((1739372345392249 : Rat) / 22379692591368) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((-1739372345392249 : Rat) / 11189846295684) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((1739372345392249 : Rat) / 22379692591368) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((1739372345392249 : Rat) / 11189846295684) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1739372345392249 : Rat) / 22379692591368) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-1739372345392249 : Rat) / 22379692591368) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((1739372345392249 : Rat) / 11189846295684) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0078
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0079 : Poly :=
[
  term ((28014228485791 : Rat) / 114182105058) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 79 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0079 : Poly :=
[
  term ((-28014228485791 : Rat) / 57091052529) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((28014228485791 : Rat) / 114182105058) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((-28014228485791 : Rat) / 57091052529) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((28014228485791 : Rat) / 114182105058) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((28014228485791 : Rat) / 57091052529) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((28014228485791 : Rat) / 57091052529) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-28014228485791 : Rat) / 114182105058) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-28014228485791 : Rat) / 114182105058) [(2, 1), (3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0079
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0080 : Poly :=
[
  term ((1175 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 80 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0080 : Poly :=
[
  term ((-2350 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((1175 : Rat) / 63) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-2350 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((1175 : Rat) / 63) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((2350 : Rat) / 63) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2350 : Rat) / 63) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1175 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1175 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0080
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0081 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 81 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0081 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (10, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0081
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0082 : Poly :=
[
  term ((24845360043340328 : Rat) / 19582231017447) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 82 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0082 : Poly :=
[
  term ((-49690720086680656 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((24845360043340328 : Rat) / 19582231017447) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((-49690720086680656 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((24845360043340328 : Rat) / 19582231017447) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((49690720086680656 : Rat) / 19582231017447) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((49690720086680656 : Rat) / 19582231017447) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-24845360043340328 : Rat) / 19582231017447) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-24845360043340328 : Rat) / 19582231017447) [(2, 1), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0082
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0083 : Poly :=
[
  term ((-1040 : Rat) / 63) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0083 : Poly :=
[
  term ((2080 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1040 : Rat) / 63) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((2080 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1040 : Rat) / 63) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-2080 : Rat) / 63) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2080 : Rat) / 63) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1040 : Rat) / 63) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((1040 : Rat) / 63) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0083
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0084 : Poly :=
[
  term ((-28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2)]
]

/-- Partial product 84 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0084 : Poly :=
[
  term ((28547376631104355 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 2), (10, 1)],
  term ((-28547376631104355 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 2)],
  term ((28547376631104355 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-28547376631104355 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 2)],
  term ((-28547376631104355 : Rat) / 39164462034894) [(2, 1), (3, 2), (10, 1), (14, 1)],
  term ((-28547376631104355 : Rat) / 39164462034894) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2), (14, 2)],
  term ((28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0084
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0085 : Poly :=
[
  term ((2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1)]
]

/-- Partial product 85 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0085 : Poly :=
[
  term ((-2664495422304851 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (10, 1)],
  term ((2664495422304851 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1)],
  term ((-2664495422304851 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((2664495422304851 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1)],
  term ((2664495422304851 : Rat) / 2901071261844) [(2, 1), (6, 1), (10, 1), (14, 1)],
  term ((2664495422304851 : Rat) / 2901071261844) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 2)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0085
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0086 : Poly :=
[
  term ((-4681094734615 : Rat) / 8993245968) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 86 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0086 : Poly :=
[
  term ((4681094734615 : Rat) / 4496622984) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 8993245968) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((4681094734615 : Rat) / 4496622984) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 8993245968) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((-4681094734615 : Rat) / 4496622984) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-4681094734615 : Rat) / 4496622984) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((4681094734615 : Rat) / 8993245968) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((4681094734615 : Rat) / 8993245968) [(2, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0086
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0087 : Poly :=
[
  term ((-34556301041139287 : Rat) / 52219282713192) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 87 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0087 : Poly :=
[
  term ((34556301041139287 : Rat) / 26109641356596) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-34556301041139287 : Rat) / 52219282713192) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((34556301041139287 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-34556301041139287 : Rat) / 52219282713192) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((-34556301041139287 : Rat) / 26109641356596) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((34556301041139287 : Rat) / 52219282713192) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((34556301041139287 : Rat) / 52219282713192) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-34556301041139287 : Rat) / 26109641356596) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0087
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0088 : Poly :=
[
  term ((26586247929331 : Rat) / 50747602248) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 88 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0088 : Poly :=
[
  term ((-26586247929331 : Rat) / 25373801124) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((26586247929331 : Rat) / 50747602248) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 25373801124) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((26586247929331 : Rat) / 50747602248) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((26586247929331 : Rat) / 25373801124) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((26586247929331 : Rat) / 25373801124) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-26586247929331 : Rat) / 50747602248) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-26586247929331 : Rat) / 50747602248) [(2, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0088
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0089 : Poly :=
[
  term ((-985 : Rat) / 28) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 89 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0089 : Poly :=
[
  term ((985 : Rat) / 14) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 28) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 14) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 28) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 14) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-985 : Rat) / 14) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((985 : Rat) / 28) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((985 : Rat) / 28) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0089
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0090 : Poly :=
[
  term ((-4922360401048042 : Rat) / 6527410339149) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 90 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0090 : Poly :=
[
  term ((9844720802096084 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-4922360401048042 : Rat) / 6527410339149) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((9844720802096084 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4922360401048042 : Rat) / 6527410339149) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-9844720802096084 : Rat) / 6527410339149) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-9844720802096084 : Rat) / 6527410339149) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((4922360401048042 : Rat) / 6527410339149) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((4922360401048042 : Rat) / 6527410339149) [(2, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0090
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0091 : Poly :=
[
  term ((205 : Rat) / 7) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0091 : Poly :=
[
  term ((-410 : Rat) / 7) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 7) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 7) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 7) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 7) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 7) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-205 : Rat) / 7) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-205 : Rat) / 7) [(2, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0091
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0092 : Poly :=
[
  term ((-727794896834275 : Rat) / 2901071261844) [(2, 1), (7, 2)]
]

/-- Partial product 92 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0092 : Poly :=
[
  term ((727794896834275 : Rat) / 1450535630922) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((-727794896834275 : Rat) / 2901071261844) [(0, 2), (2, 1), (7, 2)],
  term ((727794896834275 : Rat) / 1450535630922) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-727794896834275 : Rat) / 2901071261844) [(1, 2), (2, 1), (7, 2)],
  term ((-727794896834275 : Rat) / 1450535630922) [(2, 1), (7, 2), (10, 1), (14, 1)],
  term ((-727794896834275 : Rat) / 1450535630922) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((727794896834275 : Rat) / 2901071261844) [(2, 1), (7, 2), (14, 2)],
  term ((727794896834275 : Rat) / 2901071261844) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0092
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0093 : Poly :=
[
  term ((69026054469541 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 93 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0093 : Poly :=
[
  term ((-69026054469541 : Rat) / 80939213712) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((69026054469541 : Rat) / 161878427424) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-69026054469541 : Rat) / 80939213712) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((69026054469541 : Rat) / 161878427424) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((69026054469541 : Rat) / 80939213712) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-69026054469541 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-69026054469541 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((69026054469541 : Rat) / 80939213712) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0093
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0094 : Poly :=
[
  term ((-195865258062877 : Rat) / 323756854848) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 94 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0094 : Poly :=
[
  term ((195865258062877 : Rat) / 161878427424) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-195865258062877 : Rat) / 323756854848) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((195865258062877 : Rat) / 161878427424) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-195865258062877 : Rat) / 323756854848) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-195865258062877 : Rat) / 161878427424) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-195865258062877 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((195865258062877 : Rat) / 323756854848) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((195865258062877 : Rat) / 323756854848) [(2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0094
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0095 : Poly :=
[
  term ((9984 : Rat) / 553) [(2, 1), (10, 1)]
]

/-- Partial product 95 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0095 : Poly :=
[
  term ((-19968 : Rat) / 553) [(0, 1), (2, 1), (10, 2)],
  term ((9984 : Rat) / 553) [(0, 2), (2, 1), (10, 1)],
  term ((-19968 : Rat) / 553) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((9984 : Rat) / 553) [(1, 2), (2, 1), (10, 1)],
  term ((19968 : Rat) / 553) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9984 : Rat) / 553) [(2, 1), (10, 1), (14, 2)],
  term ((-9984 : Rat) / 553) [(2, 1), (10, 1), (15, 2)],
  term ((19968 : Rat) / 553) [(2, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0095
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0096 : Poly :=
[
  term ((-2798162019570703 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 96 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0096 : Poly :=
[
  term ((2798162019570703 : Rat) / 3197098941624) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2798162019570703 : Rat) / 6394197883248) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((2798162019570703 : Rat) / 3197098941624) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-2798162019570703 : Rat) / 6394197883248) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-2798162019570703 : Rat) / 3197098941624) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2798162019570703 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((2798162019570703 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2798162019570703 : Rat) / 3197098941624) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0096
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0097 : Poly :=
[
  term ((18715 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 97 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0097 : Poly :=
[
  term ((-18715 : Rat) / 252) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((18715 : Rat) / 504) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-18715 : Rat) / 252) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((18715 : Rat) / 504) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((18715 : Rat) / 252) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18715 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-18715 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18715 : Rat) / 252) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0097
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0098 : Poly :=
[
  term ((50394353163572863 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 98 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0098 : Poly :=
[
  term ((-50394353163572863 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((50394353163572863 : Rat) / 26109641356596) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-50394353163572863 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((50394353163572863 : Rat) / 26109641356596) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((50394353163572863 : Rat) / 13054820678298) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-50394353163572863 : Rat) / 26109641356596) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-50394353163572863 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 3)],
  term ((50394353163572863 : Rat) / 13054820678298) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0098
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0099 : Poly :=
[
  term ((-3907 : Rat) / 126) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0099 : Poly :=
[
  term ((3907 : Rat) / 63) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3907 : Rat) / 126) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((3907 : Rat) / 63) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3907 : Rat) / 126) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3907 : Rat) / 63) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3907 : Rat) / 126) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3907 : Rat) / 126) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3907 : Rat) / 63) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0099
        rs_R009_ueqv_R009YNNNN_generator_24_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_24_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_24_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_24_0000,
  rs_R009_ueqv_R009YNNNN_partial_24_0001,
  rs_R009_ueqv_R009YNNNN_partial_24_0002,
  rs_R009_ueqv_R009YNNNN_partial_24_0003,
  rs_R009_ueqv_R009YNNNN_partial_24_0004,
  rs_R009_ueqv_R009YNNNN_partial_24_0005,
  rs_R009_ueqv_R009YNNNN_partial_24_0006,
  rs_R009_ueqv_R009YNNNN_partial_24_0007,
  rs_R009_ueqv_R009YNNNN_partial_24_0008,
  rs_R009_ueqv_R009YNNNN_partial_24_0009,
  rs_R009_ueqv_R009YNNNN_partial_24_0010,
  rs_R009_ueqv_R009YNNNN_partial_24_0011,
  rs_R009_ueqv_R009YNNNN_partial_24_0012,
  rs_R009_ueqv_R009YNNNN_partial_24_0013,
  rs_R009_ueqv_R009YNNNN_partial_24_0014,
  rs_R009_ueqv_R009YNNNN_partial_24_0015,
  rs_R009_ueqv_R009YNNNN_partial_24_0016,
  rs_R009_ueqv_R009YNNNN_partial_24_0017,
  rs_R009_ueqv_R009YNNNN_partial_24_0018,
  rs_R009_ueqv_R009YNNNN_partial_24_0019,
  rs_R009_ueqv_R009YNNNN_partial_24_0020,
  rs_R009_ueqv_R009YNNNN_partial_24_0021,
  rs_R009_ueqv_R009YNNNN_partial_24_0022,
  rs_R009_ueqv_R009YNNNN_partial_24_0023,
  rs_R009_ueqv_R009YNNNN_partial_24_0024,
  rs_R009_ueqv_R009YNNNN_partial_24_0025,
  rs_R009_ueqv_R009YNNNN_partial_24_0026,
  rs_R009_ueqv_R009YNNNN_partial_24_0027,
  rs_R009_ueqv_R009YNNNN_partial_24_0028,
  rs_R009_ueqv_R009YNNNN_partial_24_0029,
  rs_R009_ueqv_R009YNNNN_partial_24_0030,
  rs_R009_ueqv_R009YNNNN_partial_24_0031,
  rs_R009_ueqv_R009YNNNN_partial_24_0032,
  rs_R009_ueqv_R009YNNNN_partial_24_0033,
  rs_R009_ueqv_R009YNNNN_partial_24_0034,
  rs_R009_ueqv_R009YNNNN_partial_24_0035,
  rs_R009_ueqv_R009YNNNN_partial_24_0036,
  rs_R009_ueqv_R009YNNNN_partial_24_0037,
  rs_R009_ueqv_R009YNNNN_partial_24_0038,
  rs_R009_ueqv_R009YNNNN_partial_24_0039,
  rs_R009_ueqv_R009YNNNN_partial_24_0040,
  rs_R009_ueqv_R009YNNNN_partial_24_0041,
  rs_R009_ueqv_R009YNNNN_partial_24_0042,
  rs_R009_ueqv_R009YNNNN_partial_24_0043,
  rs_R009_ueqv_R009YNNNN_partial_24_0044,
  rs_R009_ueqv_R009YNNNN_partial_24_0045,
  rs_R009_ueqv_R009YNNNN_partial_24_0046,
  rs_R009_ueqv_R009YNNNN_partial_24_0047,
  rs_R009_ueqv_R009YNNNN_partial_24_0048,
  rs_R009_ueqv_R009YNNNN_partial_24_0049,
  rs_R009_ueqv_R009YNNNN_partial_24_0050,
  rs_R009_ueqv_R009YNNNN_partial_24_0051,
  rs_R009_ueqv_R009YNNNN_partial_24_0052,
  rs_R009_ueqv_R009YNNNN_partial_24_0053,
  rs_R009_ueqv_R009YNNNN_partial_24_0054,
  rs_R009_ueqv_R009YNNNN_partial_24_0055,
  rs_R009_ueqv_R009YNNNN_partial_24_0056,
  rs_R009_ueqv_R009YNNNN_partial_24_0057,
  rs_R009_ueqv_R009YNNNN_partial_24_0058,
  rs_R009_ueqv_R009YNNNN_partial_24_0059,
  rs_R009_ueqv_R009YNNNN_partial_24_0060,
  rs_R009_ueqv_R009YNNNN_partial_24_0061,
  rs_R009_ueqv_R009YNNNN_partial_24_0062,
  rs_R009_ueqv_R009YNNNN_partial_24_0063,
  rs_R009_ueqv_R009YNNNN_partial_24_0064,
  rs_R009_ueqv_R009YNNNN_partial_24_0065,
  rs_R009_ueqv_R009YNNNN_partial_24_0066,
  rs_R009_ueqv_R009YNNNN_partial_24_0067,
  rs_R009_ueqv_R009YNNNN_partial_24_0068,
  rs_R009_ueqv_R009YNNNN_partial_24_0069,
  rs_R009_ueqv_R009YNNNN_partial_24_0070,
  rs_R009_ueqv_R009YNNNN_partial_24_0071,
  rs_R009_ueqv_R009YNNNN_partial_24_0072,
  rs_R009_ueqv_R009YNNNN_partial_24_0073,
  rs_R009_ueqv_R009YNNNN_partial_24_0074,
  rs_R009_ueqv_R009YNNNN_partial_24_0075,
  rs_R009_ueqv_R009YNNNN_partial_24_0076,
  rs_R009_ueqv_R009YNNNN_partial_24_0077,
  rs_R009_ueqv_R009YNNNN_partial_24_0078,
  rs_R009_ueqv_R009YNNNN_partial_24_0079,
  rs_R009_ueqv_R009YNNNN_partial_24_0080,
  rs_R009_ueqv_R009YNNNN_partial_24_0081,
  rs_R009_ueqv_R009YNNNN_partial_24_0082,
  rs_R009_ueqv_R009YNNNN_partial_24_0083,
  rs_R009_ueqv_R009YNNNN_partial_24_0084,
  rs_R009_ueqv_R009YNNNN_partial_24_0085,
  rs_R009_ueqv_R009YNNNN_partial_24_0086,
  rs_R009_ueqv_R009YNNNN_partial_24_0087,
  rs_R009_ueqv_R009YNNNN_partial_24_0088,
  rs_R009_ueqv_R009YNNNN_partial_24_0089,
  rs_R009_ueqv_R009YNNNN_partial_24_0090,
  rs_R009_ueqv_R009YNNNN_partial_24_0091,
  rs_R009_ueqv_R009YNNNN_partial_24_0092,
  rs_R009_ueqv_R009YNNNN_partial_24_0093,
  rs_R009_ueqv_R009YNNNN_partial_24_0094,
  rs_R009_ueqv_R009YNNNN_partial_24_0095,
  rs_R009_ueqv_R009YNNNN_partial_24_0096,
  rs_R009_ueqv_R009YNNNN_partial_24_0097,
  rs_R009_ueqv_R009YNNNN_partial_24_0098,
  rs_R009_ueqv_R009YNNNN_partial_24_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_24_0000_0099 : Poly :=
[
  term ((-212114698891348 : Rat) / 932487191307) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-45864690786755 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((16097797431678929 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((3990050839829666 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((655366654874374 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((-5597860226111770 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (10, 1)],
  term ((49030393049888 : Rat) / 241755938487) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-21722017330 : Rat) / 187359291) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((2241117273696821 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((90071490967235 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-130962509935165 : Rat) / 8703213785532) [(0, 1), (1, 1), (3, 1), (10, 2)],
  term ((15969854420 : Rat) / 187359291) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-40 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-340425786180544 : Rat) / 725267815461) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((32 : Rat) / 7) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((1280 : Rat) / 63) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((1280 : Rat) / 21) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((16385344477359446 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (6, 1), (9, 1), (10, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1)],
  term ((170 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1758326923282207 : Rat) / 1450535630922) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((-13312832350183 : Rat) / 483511876974) [(0, 1), (1, 1), (7, 1), (10, 1)],
  term ((-19918597176517 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (10, 1), (14, 1)],
  term ((-62820191095169 : Rat) / 725267815461) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((19918597176517 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((62820191095169 : Rat) / 725267815461) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((-9160174708061 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((21020396170241 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-62993850257 : Rat) / 499624776) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((115 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((18373120754599 : Rat) / 17986491936) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 53531226) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-427923741401 : Rat) / 999249552) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-427923741401 : Rat) / 999249552) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((-11272931787173435 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((-10946035635971725 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1)],
  term ((59260846402276025 : Rat) / 52219282713192) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((-884249508821411 : Rat) / 710466431472) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((1695 : Rat) / 56) [(0, 1), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1315 : Rat) / 28) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((19212318018664823 : Rat) / 8703213785532) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-335 : Rat) / 14) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10385135859446377 : Rat) / 6527410339149) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((267 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((7216384141049 : Rat) / 59205535956) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((-295 : Rat) / 14) [(0, 1), (1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-13564261196228125 : Rat) / 26109641356596) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term (18 : Rat) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10212934129824805 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1)],
  term ((-688629218615509 : Rat) / 710466431472) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((1465 : Rat) / 56) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((196842265964507 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((17854134662145457 : Rat) / 8703213785532) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-297 : Rat) / 14) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((333701349449 : Rat) / 14801383989) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((90 : Rat) / 7) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((187145722446266 : Rat) / 725267815461) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-80 : Rat) / 7) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (1, 1), (11, 3)],
  term ((5982455126969 : Rat) / 13156785768) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((-335 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((5982455126969 : Rat) / 13156785768) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-335 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4068918527993 : Rat) / 4933794663) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((67 : Rat) / 7) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4068918527993 : Rat) / 4933794663) [(0, 1), (1, 1), (15, 3)],
  term ((67 : Rat) / 7) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((10212934129824805 : Rat) / 17406427571064) [(0, 1), (1, 2)],
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 1), (1, 2), (2, 1)],
  term ((-24515196524944 : Rat) / 241755938487) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((-640 : Rat) / 63) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-7984927210 : Rat) / 187359291) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((20 : Rat) / 7) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((170212893090272 : Rat) / 725267815461) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-640 : Rat) / 21) [(0, 1), (1, 2), (3, 2)],
  term ((-1758326923282207 : Rat) / 2901071261844) [(0, 1), (1, 2), (6, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (10, 1)],
  term ((-62820191095169 : Rat) / 1450535630922) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-19918597176517 : Rat) / 2901071261844) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-1253360399941 : Rat) / 1498874328) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-8652670741 : Rat) / 104877504) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (1, 2), (9, 2)],
  term ((1129343960094425 : Rat) / 2486632510152) [(0, 1), (1, 2), (10, 1)],
  term ((7596384777689 : Rat) / 8457933708) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-425 : Rat) / 14) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1289834908453075 : Rat) / 725267815461) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((174 : Rat) / 7) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 2), (11, 2)],
  term ((42524064902857 : Rat) / 1420932862944) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-125 : Rat) / 112) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-196842265964507 : Rat) / 17406427571064) [(0, 1), (1, 2), (14, 1)],
  term ((-3498990095386153 : Rat) / 17406427571064) [(0, 1), (1, 2), (15, 2)],
  term ((29 : Rat) / 28) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((427923741401 : Rat) / 999249552) [(0, 1), (1, 3), (9, 1)],
  term ((-5982455126969 : Rat) / 13156785768) [(0, 1), (1, 3), (13, 1)],
  term ((335 : Rat) / 28) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term ((4068918527993 : Rat) / 4933794663) [(0, 1), (1, 3), (15, 1)],
  term ((-67 : Rat) / 7) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-26813407663889003 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((4707161155411 : Rat) / 10117401714) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-1739372345392249 : Rat) / 11189846295684) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-28014228485791 : Rat) / 57091052529) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-2350 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-49690720086680656 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((2080 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((28547376631104355 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 2), (10, 1)],
  term ((-2664495422304851 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (10, 1)],
  term ((4681094734615 : Rat) / 4496622984) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((34556301041139287 : Rat) / 26109641356596) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 25373801124) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((985 : Rat) / 14) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((9844720802096084 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-410 : Rat) / 7) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((727794896834275 : Rat) / 1450535630922) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((-69026054469541 : Rat) / 80939213712) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((195865258062877 : Rat) / 161878427424) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((692477525838242 : Rat) / 2175803446383) [(0, 1), (2, 1), (10, 1)],
  term ((2798162019570703 : Rat) / 3197098941624) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-18715 : Rat) / 252) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-50394353163572863 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((3907 : Rat) / 63) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-655366654874374 : Rat) / 2175803446383) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((-19968 : Rat) / 553) [(0, 1), (2, 1), (10, 2)],
  term ((-655366654874374 : Rat) / 2175803446383) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(0, 1), (2, 1), (14, 2)],
  term ((327683327437187 : Rat) / 2175803446383) [(0, 1), (2, 1), (15, 2)],
  term ((-49030393049888 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-49030393049888 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((24515196524944 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((24515196524944 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((21722017330 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((-1280 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-15969854420 : Rat) / 187359291) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((40 : Rat) / 7) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((340425786180544 : Rat) / 725267815461) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15969854420 : Rat) / 187359291) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((40 : Rat) / 7) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((640 : Rat) / 63) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((347793586210624 : Rat) / 725267815461) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-32 : Rat) / 7) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1280 : Rat) / 63) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((7984927210 : Rat) / 187359291) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((-20 : Rat) / 7) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((7984927210 : Rat) / 187359291) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-20 : Rat) / 7) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-170212893090272 : Rat) / 725267815461) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((16 : Rat) / 7) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-170212893090272 : Rat) / 725267815461) [(0, 1), (3, 1), (15, 3)],
  term ((16 : Rat) / 7) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-1280 : Rat) / 21) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((-1280 : Rat) / 21) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((640 : Rat) / 21) [(0, 1), (3, 2), (14, 2)],
  term ((640 : Rat) / 21) [(0, 1), (3, 2), (15, 2)],
  term ((-1758326923282207 : Rat) / 1450535630922) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((-1758326923282207 : Rat) / 1450535630922) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((1758326923282207 : Rat) / 2901071261844) [(0, 1), (6, 1), (14, 2)],
  term ((1758326923282207 : Rat) / 2901071261844) [(0, 1), (6, 1), (15, 2)],
  term ((-62820191095169 : Rat) / 725267815461) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-19918597176517 : Rat) / 1450535630922) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((62820191095169 : Rat) / 1450535630922) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((3064399565618 : Rat) / 103609687923) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((-62820191095169 : Rat) / 725267815461) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(0, 1), (7, 1), (15, 3)],
  term ((2172201733 : Rat) / 53531226) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8652670741 : Rat) / 52438752) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 107062452) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-476113707901 : Rat) / 2569498848) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2172201733 : Rat) / 53531226) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((8652670741 : Rat) / 104877504) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((8652670741 : Rat) / 104877504) [(0, 1), (9, 1), (15, 3)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (14, 2)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (15, 2)],
  term ((73786686725060051 : Rat) / 208877130852768) [(0, 1), (10, 1)],
  term ((-333701349449 : Rat) / 14801383989) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-90 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-187145722446266 : Rat) / 725267815461) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((80 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((42524064902857 : Rat) / 710466431472) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-125 : Rat) / 56) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10212934129824805 : Rat) / 8703213785532) [(0, 1), (10, 1), (14, 1)],
  term ((-3498990095386153 : Rat) / 8703213785532) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((29 : Rat) / 14) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3260352132155899 : Rat) / 5802142523688) [(0, 1), (10, 1), (14, 2)],
  term ((-9387371864538683 : Rat) / 17406427571064) [(0, 1), (10, 1), (15, 2)],
  term ((9387371864538683 : Rat) / 8703213785532) [(0, 1), (10, 2), (14, 1)],
  term ((333701349449 : Rat) / 29602767978) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((45 : Rat) / 7) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((50532897289633 : Rat) / 710466431472) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((235 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-196842265964507 : Rat) / 8703213785532) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((93572861223133 : Rat) / 725267815461) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-40 : Rat) / 7) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((10212934129824805 : Rat) / 8703213785532) [(0, 1), (11, 1), (15, 1)],
  term ((-339445108672651 : Rat) / 1243316255076) [(0, 1), (11, 1), (15, 3)],
  term ((-51 : Rat) / 14) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-333701349449 : Rat) / 14801383989) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-90 : Rat) / 7) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (11, 2), (14, 2)],
  term ((-30015728893370 : Rat) / 725267815461) [(0, 1), (11, 2), (15, 2)],
  term ((80 : Rat) / 7) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (11, 3), (15, 1)],
  term ((-42524064902857 : Rat) / 1420932862944) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((125 : Rat) / 112) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-42524064902857 : Rat) / 1420932862944) [(0, 1), (13, 1), (15, 3)],
  term ((125 : Rat) / 112) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((196842265964507 : Rat) / 17406427571064) [(0, 1), (14, 1), (15, 2)],
  term ((-10212934129824805 : Rat) / 17406427571064) [(0, 1), (14, 2)],
  term ((3498990095386153 : Rat) / 17406427571064) [(0, 1), (14, 2), (15, 2)],
  term ((-29 : Rat) / 28) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((196842265964507 : Rat) / 17406427571064) [(0, 1), (14, 3)],
  term ((-10212934129824805 : Rat) / 17406427571064) [(0, 1), (15, 2)],
  term ((3498990095386153 : Rat) / 17406427571064) [(0, 1), (15, 4)],
  term ((-29 : Rat) / 28) [(0, 1), (15, 4), (16, 1)],
  term ((-73786686725060051 : Rat) / 417754261705536) [(0, 2)],
  term ((106057349445674 : Rat) / 932487191307) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((45864690786755 : Rat) / 2901071261844) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-16097797431678929 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-2241117273696821 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1)],
  term ((2798930113055885 : Rat) / 19582231017447) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((130962509935165 : Rat) / 17406427571064) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((-90071490967235 : Rat) / 8703213785532) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 2), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((13312832350183 : Rat) / 967023753948) [(0, 2), (1, 1), (7, 1)],
  term ((62820191095169 : Rat) / 1450535630922) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((9160174708061 : Rat) / 17986491936) [(0, 2), (1, 1), (9, 1)],
  term ((-792853632545 : Rat) / 999249552) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((-5615141479805 : Rat) / 35972983872) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((100467808144393 : Rat) / 118411071912) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((-375 : Rat) / 28) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-72566606204327699 : Rat) / 52219282713192) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((71 : Rat) / 7) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (1, 1), (11, 1)],
  term ((10946035635971725 : Rat) / 52219282713192) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-59260846402276025 : Rat) / 104438565426384) [(0, 2), (1, 1), (13, 1)],
  term ((238144355108759 : Rat) / 1420932862944) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-355 : Rat) / 112) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((1315 : Rat) / 56) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-4857173451905519 : Rat) / 17406427571064) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((67 : Rat) / 28) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((10385135859446377 : Rat) / 13054820678298) [(0, 2), (1, 1), (15, 1)],
  term ((-267 : Rat) / 14) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((123497011989809 : Rat) / 2901071261844) [(0, 2), (1, 2)],
  term ((-45864690786755 : Rat) / 13054820678298) [(0, 2), (1, 2), (6, 1)],
  term ((-346238762919121 : Rat) / 2175803446383) [(0, 2), (2, 1)],
  term ((26813407663889003 : Rat) / 26109641356596) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((-4707161155411 : Rat) / 20234803428) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((1739372345392249 : Rat) / 22379692591368) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((28014228485791 : Rat) / 114182105058) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((1175 : Rat) / 63) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((24845360043340328 : Rat) / 19582231017447) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((-1040 : Rat) / 63) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-28547376631104355 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 2)],
  term ((2664495422304851 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1)],
  term ((-4681094734615 : Rat) / 8993245968) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((-34556301041139287 : Rat) / 52219282713192) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((26586247929331 : Rat) / 50747602248) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-985 : Rat) / 28) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4922360401048042 : Rat) / 6527410339149) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((205 : Rat) / 7) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-727794896834275 : Rat) / 2901071261844) [(0, 2), (2, 1), (7, 2)],
  term ((69026054469541 : Rat) / 161878427424) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-195865258062877 : Rat) / 323756854848) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((694649153262598 : Rat) / 2175803446383) [(0, 2), (2, 1), (10, 1)],
  term ((-2798162019570703 : Rat) / 6394197883248) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((18715 : Rat) / 504) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((50394353163572863 : Rat) / 26109641356596) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-3907 : Rat) / 126) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((49030393049888 : Rat) / 241755938487) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((-21722017330 : Rat) / 187359291) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((1280 : Rat) / 63) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((15969854420 : Rat) / 187359291) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-40 : Rat) / 7) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-340425786180544 : Rat) / 725267815461) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((32 : Rat) / 7) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((1280 : Rat) / 21) [(0, 2), (3, 2), (10, 1)],
  term ((1758326923282207 : Rat) / 1450535630922) [(0, 2), (6, 1), (10, 1)],
  term ((62820191095169 : Rat) / 725267815461) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((19918597176517 : Rat) / 1450535630922) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-2172201733 : Rat) / 53531226) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((115 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((8652670741 : Rat) / 52438752) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 2), (9, 2), (10, 1)],
  term ((-10212934129824805 : Rat) / 8703213785532) [(0, 2), (10, 1)],
  term ((333701349449 : Rat) / 14801383989) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((90 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((187145722446266 : Rat) / 725267815461) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-80 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((-42524064902857 : Rat) / 710466431472) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((125 : Rat) / 56) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((196842265964507 : Rat) / 8703213785532) [(0, 2), (10, 1), (14, 1)],
  term ((3498990095386153 : Rat) / 8703213785532) [(0, 2), (10, 1), (15, 2)],
  term ((-29 : Rat) / 14) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-9387371864538683 : Rat) / 8703213785532) [(0, 2), (10, 2)],
  term ((10212934129824805 : Rat) / 17406427571064) [(0, 3)],
  term ((427923741401 : Rat) / 999249552) [(0, 3), (1, 1), (9, 1)],
  term ((-5982455126969 : Rat) / 13156785768) [(0, 3), (1, 1), (13, 1)],
  term ((335 : Rat) / 28) [(0, 3), (1, 1), (13, 1), (16, 1)],
  term ((4068918527993 : Rat) / 4933794663) [(0, 3), (1, 1), (15, 1)],
  term ((-67 : Rat) / 7) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 3), (2, 1)],
  term ((-24515196524944 : Rat) / 241755938487) [(0, 3), (3, 1), (7, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 3), (3, 1), (9, 1)],
  term ((-640 : Rat) / 63) [(0, 3), (3, 1), (11, 1)],
  term ((-7984927210 : Rat) / 187359291) [(0, 3), (3, 1), (13, 1)],
  term ((20 : Rat) / 7) [(0, 3), (3, 1), (13, 1), (16, 1)],
  term ((170212893090272 : Rat) / 725267815461) [(0, 3), (3, 1), (15, 1)],
  term ((-16 : Rat) / 7) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((-640 : Rat) / 21) [(0, 3), (3, 2)],
  term ((-1758326923282207 : Rat) / 2901071261844) [(0, 3), (6, 1)],
  term ((-62820191095169 : Rat) / 1450535630922) [(0, 3), (7, 1), (11, 1)],
  term ((-19918597176517 : Rat) / 2901071261844) [(0, 3), (7, 1), (15, 1)],
  term ((2172201733 : Rat) / 107062452) [(0, 3), (9, 1), (11, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 3), (9, 1), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 3), (9, 1), (13, 1), (16, 1)],
  term ((-8652670741 : Rat) / 104877504) [(0, 3), (9, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 3), (9, 2)],
  term ((9387371864538683 : Rat) / 17406427571064) [(0, 3), (10, 1)],
  term ((-333701349449 : Rat) / 29602767978) [(0, 3), (11, 1), (13, 1)],
  term ((-45 : Rat) / 7) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((-93572861223133 : Rat) / 725267815461) [(0, 3), (11, 1), (15, 1)],
  term ((40 : Rat) / 7) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 3), (11, 2)],
  term ((42524064902857 : Rat) / 1420932862944) [(0, 3), (13, 1), (15, 1)],
  term ((-125 : Rat) / 112) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-196842265964507 : Rat) / 17406427571064) [(0, 3), (14, 1)],
  term ((-3498990095386153 : Rat) / 17406427571064) [(0, 3), (15, 2)],
  term ((29 : Rat) / 28) [(0, 3), (15, 2), (16, 1)],
  term ((-26813407663889003 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((4707161155411 : Rat) / 10117401714) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((212114698891348 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (10, 1), (14, 1)],
  term ((-28014228485791 : Rat) / 57091052529) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-2350 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-45236311409962348 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((2080 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1739372345392249 : Rat) / 11189846295684) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-106057349445674 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-106057349445674 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((28547376631104355 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-2664495422304851 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((4681094734615 : Rat) / 4496622984) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((45864690786755 : Rat) / 1450535630922) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1)],
  term ((-26586247929331 : Rat) / 25373801124) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((985 : Rat) / 14) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((20102223821272963 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-410 : Rat) / 7) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((34556301041139287 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-45864690786755 : Rat) / 2901071261844) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((-45864690786755 : Rat) / 2901071261844) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((727794896834275 : Rat) / 1450535630922) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((195865258062877 : Rat) / 161878427424) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-69026054469541 : Rat) / 80939213712) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((-19968 : Rat) / 553) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-16097797431678929 : Rat) / 26109641356596) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1)],
  term ((-3990050839829666 : Rat) / 6527410339149) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1)],
  term ((692477525838242 : Rat) / 2175803446383) [(1, 1), (2, 1), (11, 1)],
  term ((16097797431678929 : Rat) / 52219282713192) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-15822609286958399 : Rat) / 52219282713192) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((2798162019570703 : Rat) / 3197098941624) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-18715 : Rat) / 252) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((-116886503758824655 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((3907 : Rat) / 63) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((1995025419914833 : Rat) / 6527410339149) [(1, 1), (2, 1), (15, 3)],
  term ((5597860226111770 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (10, 1), (14, 1)],
  term ((5597860226111770 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2798930113055885 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((-2798930113055885 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((130962509935165 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2241117273696821 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-163749491268035 : Rat) / 5802142523688) [(1, 1), (3, 1), (10, 1), (14, 2)],
  term ((-130962509935165 : Rat) / 17406427571064) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((130962509935165 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 2), (14, 1)],
  term ((-90071490967235 : Rat) / 4351606892766) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2241117273696821 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((90071490967235 : Rat) / 8703213785532) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((2241117273696821 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 2)],
  term ((90071490967235 : Rat) / 8703213785532) [(1, 1), (3, 1), (14, 3)],
  term ((2241117273696821 : Rat) / 52219282713192) [(1, 1), (3, 1), (15, 2)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((8192672238679723 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (14, 2)],
  term ((8192672238679723 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((33885160769843255 : Rat) / 13054820678298) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1), (14, 2)],
  term ((-82812653548739053 : Rat) / 26109641356596) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 3)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 3), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 3)],
  term ((-16 : Rat) / 9) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((62820191095169 : Rat) / 725267815461) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((13312832350183 : Rat) / 483511876974) [(1, 1), (7, 1), (10, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 103609687923) [(1, 1), (7, 1), (10, 1), (14, 2)],
  term ((-62820191095169 : Rat) / 1450535630922) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((62820191095169 : Rat) / 725267815461) [(1, 1), (7, 1), (10, 2), (14, 1)],
  term ((19918597176517 : Rat) / 1450535630922) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((13312832350183 : Rat) / 483511876974) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-13312832350183 : Rat) / 967023753948) [(1, 1), (7, 1), (14, 2)],
  term ((-19918597176517 : Rat) / 2901071261844) [(1, 1), (7, 1), (14, 3)],
  term ((-13312832350183 : Rat) / 967023753948) [(1, 1), (7, 1), (15, 2)],
  term ((62993850257 : Rat) / 499624776) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((9160174708061 : Rat) / 8993245968) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-6749030784431 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (14, 2)],
  term ((-62993850257 : Rat) / 999249552) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((62993850257 : Rat) / 499624776) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((-5615141479805 : Rat) / 17986491936) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((9160174708061 : Rat) / 8993245968) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((5615141479805 : Rat) / 35972983872) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-9160174708061 : Rat) / 17986491936) [(1, 1), (9, 1), (14, 2)],
  term ((5615141479805 : Rat) / 35972983872) [(1, 1), (9, 1), (14, 3)],
  term ((-9160174708061 : Rat) / 17986491936) [(1, 1), (9, 1), (15, 2)],
  term ((-7216384141049 : Rat) / 59205535956) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((295 : Rat) / 14) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((5289355868067469 : Rat) / 26109641356596) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((7907581428323869 : Rat) / 26109641356596) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term (-18 : Rat) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-59260846402276025 : Rat) / 52219282713192) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((1315 : Rat) / 28) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((281442659955053 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((-135 : Rat) / 8) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((7216384141049 : Rat) / 118411071912) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-295 : Rat) / 28) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((10385135859446377 : Rat) / 6527410339149) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-267 : Rat) / 7) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42707301907661239 : Rat) / 52219282713192) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((193 : Rat) / 14) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13564261196228125 : Rat) / 52219282713192) [(1, 1), (10, 1), (15, 3)],
  term (9 : Rat) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((-7216384141049 : Rat) / 59205535956) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((295 : Rat) / 14) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((13564261196228125 : Rat) / 26109641356596) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term (-18 : Rat) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((73786686725060051 : Rat) / 208877130852768) [(1, 1), (11, 1)],
  term ((238144355108759 : Rat) / 710466431472) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-355 : Rat) / 56) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59260846402276025 : Rat) / 52219282713192) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((1315 : Rat) / 28) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40089076347404839 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((67 : Rat) / 14) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (11, 1), (14, 2)],
  term ((-10946035635971725 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 3)],
  term ((9678050888458345 : Rat) / 6527410339149) [(1, 1), (11, 1), (15, 2)],
  term ((-267 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((10946035635971725 : Rat) / 26109641356596) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 2), (15, 1)],
  term ((-238144355108759 : Rat) / 1420932862944) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((355 : Rat) / 112) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((59260846402276025 : Rat) / 104438565426384) [(1, 1), (13, 1), (14, 2)],
  term ((-1315 : Rat) / 56) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-238144355108759 : Rat) / 1420932862944) [(1, 1), (13, 1), (14, 3)],
  term ((355 : Rat) / 112) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((59260846402276025 : Rat) / 104438565426384) [(1, 1), (13, 1), (15, 2)],
  term ((-1315 : Rat) / 56) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((4857173451905519 : Rat) / 17406427571064) [(1, 1), (14, 1), (15, 3)],
  term ((-67 : Rat) / 28) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10385135859446377 : Rat) / 13054820678298) [(1, 1), (14, 2), (15, 1)],
  term ((267 : Rat) / 14) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((4857173451905519 : Rat) / 17406427571064) [(1, 1), (14, 3), (15, 1)],
  term ((-67 : Rat) / 28) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-10385135859446377 : Rat) / 13054820678298) [(1, 1), (15, 3)],
  term ((267 : Rat) / 14) [(1, 1), (15, 3), (16, 1)],
  term ((-73786686725060051 : Rat) / 417754261705536) [(1, 2)],
  term ((-346238762919121 : Rat) / 2175803446383) [(1, 2), (2, 1)],
  term ((26813407663889003 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-4707161155411 : Rat) / 20234803428) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-3351380428000103 : Rat) / 22379692591368) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((28014228485791 : Rat) / 114182105058) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((1175 : Rat) / 63) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((24845360043340328 : Rat) / 19582231017447) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-1040 : Rat) / 63) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-28547376631104355 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 2)],
  term ((2664495422304851 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1)],
  term ((-4681094734615 : Rat) / 8993245968) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((-36207429909462467 : Rat) / 52219282713192) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((26586247929331 : Rat) / 50747602248) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-985 : Rat) / 28) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4922360401048042 : Rat) / 6527410339149) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((205 : Rat) / 7) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-727794896834275 : Rat) / 2901071261844) [(1, 2), (2, 1), (7, 2)],
  term ((69026054469541 : Rat) / 161878427424) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-195865258062877 : Rat) / 323756854848) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((9984 : Rat) / 553) [(1, 2), (2, 1), (10, 1)],
  term ((-2798162019570703 : Rat) / 6394197883248) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((18715 : Rat) / 504) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((819192055838167 : Rat) / 322341251316) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-3907 : Rat) / 126) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((16097797431678929 : Rat) / 26109641356596) [(1, 2), (2, 1), (11, 2)],
  term ((-5597860226111770 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-130962509935165 : Rat) / 8703213785532) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((2241117273696821 : Rat) / 26109641356596) [(1, 2), (3, 1), (11, 1)],
  term ((90071490967235 : Rat) / 4351606892766) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((16385344477359446 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 2), (6, 1), (10, 1), (14, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((386857412823403 : Rat) / 207219375846) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(1, 2), (6, 1), (11, 2)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (14, 2)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1), (15, 2)],
  term ((-62820191095169 : Rat) / 725267815461) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-13312832350183 : Rat) / 483511876974) [(1, 2), (7, 1), (11, 1)],
  term ((-19918597176517 : Rat) / 1450535630922) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-62993850257 : Rat) / 499624776) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-9160174708061 : Rat) / 8993245968) [(1, 2), (9, 1), (11, 1)],
  term ((5615141479805 : Rat) / 17986491936) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((7216384141049 : Rat) / 59205535956) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-295 : Rat) / 14) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13564261196228125 : Rat) / 26109641356596) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term (18 : Rat) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((123497011989809 : Rat) / 1450535630922) [(1, 2), (10, 1), (14, 1)],
  term ((59260846402276025 : Rat) / 52219282713192) [(1, 2), (11, 1), (13, 1)],
  term ((-238144355108759 : Rat) / 710466431472) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((355 : Rat) / 56) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1315 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((4857173451905519 : Rat) / 8703213785532) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-67 : Rat) / 14) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19658798610984473 : Rat) / 13054820678298) [(1, 2), (11, 1), (15, 1)],
  term ((267 : Rat) / 7) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (11, 2)],
  term ((-10946035635971725 : Rat) / 26109641356596) [(1, 2), (11, 2), (14, 1)],
  term ((-123497011989809 : Rat) / 2901071261844) [(1, 2), (14, 2)],
  term ((-123497011989809 : Rat) / 2901071261844) [(1, 2), (15, 2)],
  term ((106057349445674 : Rat) / 932487191307) [(1, 3), (2, 1), (3, 1)],
  term ((45864690786755 : Rat) / 2901071261844) [(1, 3), (2, 1), (7, 1)],
  term ((-16097797431678929 : Rat) / 52219282713192) [(1, 3), (2, 1), (11, 1)],
  term ((-1995025419914833 : Rat) / 6527410339149) [(1, 3), (2, 1), (15, 1)],
  term ((-2241117273696821 : Rat) / 52219282713192) [(1, 3), (3, 1)],
  term ((2798930113055885 : Rat) / 19582231017447) [(1, 3), (3, 1), (6, 1)],
  term ((130962509935165 : Rat) / 17406427571064) [(1, 3), (3, 1), (10, 1)],
  term ((-90071490967235 : Rat) / 8703213785532) [(1, 3), (3, 1), (14, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(1, 3), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 3), (6, 1), (9, 1)],
  term ((34068619532990275 : Rat) / 26109641356596) [(1, 3), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(1, 3), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(1, 3), (6, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 3), (6, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(1, 3), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(1, 3), (6, 1), (15, 1), (16, 1)],
  term ((13312832350183 : Rat) / 967023753948) [(1, 3), (7, 1)],
  term ((62820191095169 : Rat) / 1450535630922) [(1, 3), (7, 1), (10, 1)],
  term ((19918597176517 : Rat) / 2901071261844) [(1, 3), (7, 1), (14, 1)],
  term ((9160174708061 : Rat) / 17986491936) [(1, 3), (9, 1)],
  term ((62993850257 : Rat) / 999249552) [(1, 3), (9, 1), (10, 1)],
  term ((-5615141479805 : Rat) / 35972983872) [(1, 3), (9, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(1, 3), (10, 1), (11, 1)],
  term ((-7216384141049 : Rat) / 118411071912) [(1, 3), (10, 1), (13, 1)],
  term ((295 : Rat) / 28) [(1, 3), (10, 1), (13, 1), (16, 1)],
  term ((13564261196228125 : Rat) / 52219282713192) [(1, 3), (10, 1), (15, 1)],
  term (-9 : Rat) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((33632981563087 : Rat) / 1450535630922) [(1, 3), (11, 1)],
  term ((10946035635971725 : Rat) / 52219282713192) [(1, 3), (11, 1), (14, 1)],
  term ((-59260846402276025 : Rat) / 104438565426384) [(1, 3), (13, 1)],
  term ((238144355108759 : Rat) / 1420932862944) [(1, 3), (13, 1), (14, 1)],
  term ((-355 : Rat) / 112) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((1315 : Rat) / 56) [(1, 3), (13, 1), (16, 1)],
  term ((-4857173451905519 : Rat) / 17406427571064) [(1, 3), (14, 1), (15, 1)],
  term ((67 : Rat) / 28) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((10385135859446377 : Rat) / 13054820678298) [(1, 3), (15, 1)],
  term ((-267 : Rat) / 14) [(1, 3), (15, 1), (16, 1)],
  term ((123497011989809 : Rat) / 2901071261844) [(1, 4)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 4), (6, 1)],
  term ((26813407663889003 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((26813407663889003 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-26813407663889003 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((-26813407663889003 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-4707161155411 : Rat) / 10117401714) [(2, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-4707161155411 : Rat) / 10117401714) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((4707161155411 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((4707161155411 : Rat) / 20234803428) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((1739372345392249 : Rat) / 11189846295684) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((28014228485791 : Rat) / 57091052529) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((2350 : Rat) / 63) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((49690720086680656 : Rat) / 19582231017447) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2080 : Rat) / 63) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (10, 1), (14, 2), (15, 1)],
  term ((28014228485791 : Rat) / 57091052529) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((2350 : Rat) / 63) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1739372345392249 : Rat) / 22379692591368) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((385350154275699505 : Rat) / 156657848139576) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-2080 : Rat) / 63) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1739372345392249 : Rat) / 11189846295684) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-28014228485791 : Rat) / 114182105058) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-1175 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-28014228485791 : Rat) / 114182105058) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-1175 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-24845360043340328 : Rat) / 19582231017447) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((1040 : Rat) / 63) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((-24845360043340328 : Rat) / 19582231017447) [(2, 1), (3, 1), (15, 3)],
  term ((1040 : Rat) / 63) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((-28547376631104355 : Rat) / 39164462034894) [(2, 1), (3, 2), (10, 1), (14, 1)],
  term ((-28547376631104355 : Rat) / 39164462034894) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2), (14, 2)],
  term ((28547376631104355 : Rat) / 78328924069788) [(2, 1), (3, 2), (15, 2)],
  term ((2664495422304851 : Rat) / 2901071261844) [(2, 1), (6, 1), (10, 1), (14, 1)],
  term ((2664495422304851 : Rat) / 2901071261844) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 2)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1), (15, 2)],
  term ((-4681094734615 : Rat) / 4496622984) [(2, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-4681094734615 : Rat) / 4496622984) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((4681094734615 : Rat) / 8993245968) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((4681094734615 : Rat) / 8993245968) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-34556301041139287 : Rat) / 26109641356596) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((26586247929331 : Rat) / 25373801124) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-985 : Rat) / 14) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9844720802096084 : Rat) / 6527410339149) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((410 : Rat) / 7) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((26586247929331 : Rat) / 25373801124) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-985 : Rat) / 14) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34556301041139287 : Rat) / 52219282713192) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-44201465375629385 : Rat) / 52219282713192) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((410 : Rat) / 7) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-34556301041139287 : Rat) / 26109641356596) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-26586247929331 : Rat) / 50747602248) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((985 : Rat) / 28) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-26586247929331 : Rat) / 50747602248) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((985 : Rat) / 28) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4922360401048042 : Rat) / 6527410339149) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-205 : Rat) / 7) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((4922360401048042 : Rat) / 6527410339149) [(2, 1), (7, 1), (15, 3)],
  term ((-205 : Rat) / 7) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-727794896834275 : Rat) / 1450535630922) [(2, 1), (7, 2), (10, 1), (14, 1)],
  term ((-727794896834275 : Rat) / 1450535630922) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((727794896834275 : Rat) / 2901071261844) [(2, 1), (7, 2), (14, 2)],
  term ((727794896834275 : Rat) / 2901071261844) [(2, 1), (7, 2), (15, 2)],
  term ((69026054469541 : Rat) / 80939213712) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-195865258062877 : Rat) / 161878427424) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-69026054469541 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-132445656266209 : Rat) / 80939213712) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((69026054469541 : Rat) / 80939213712) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((195865258062877 : Rat) / 323756854848) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((195865258062877 : Rat) / 323756854848) [(2, 1), (9, 1), (15, 3)],
  term ((-2798162019570703 : Rat) / 3197098941624) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((18715 : Rat) / 252) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((50394353163572863 : Rat) / 13054820678298) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3907 : Rat) / 63) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19968 : Rat) / 553) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-692477525838242 : Rat) / 2175803446383) [(2, 1), (10, 1), (14, 1)],
  term ((-9984 : Rat) / 553) [(2, 1), (10, 1), (14, 2)],
  term ((-9984 : Rat) / 553) [(2, 1), (10, 1), (15, 2)],
  term ((19968 : Rat) / 553) [(2, 1), (10, 2), (14, 1)],
  term ((2798162019570703 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-18715 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2798162019570703 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-18715 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50394353163572863 : Rat) / 26109641356596) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((3907 : Rat) / 126) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-692477525838242 : Rat) / 2175803446383) [(2, 1), (11, 1), (15, 1)],
  term ((-50394353163572863 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 3)],
  term ((3907 : Rat) / 126) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2798162019570703 : Rat) / 3197098941624) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((18715 : Rat) / 252) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((50394353163572863 : Rat) / 13054820678298) [(2, 1), (11, 2), (15, 2)],
  term ((-3907 : Rat) / 63) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((346238762919121 : Rat) / 2175803446383) [(2, 1), (14, 2)],
  term ((346238762919121 : Rat) / 2175803446383) [(2, 1), (15, 2)],
  term ((-73786686725060051 : Rat) / 208877130852768) [(10, 1), (14, 1)],
  term ((-73786686725060051 : Rat) / 208877130852768) [(11, 1), (15, 1)],
  term ((73786686725060051 : Rat) / 417754261705536) [(14, 2)],
  term ((73786686725060051 : Rat) / 417754261705536) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_24_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_24_0000_0099
      rs_R009_ueqv_R009YNNNN_block_24_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
