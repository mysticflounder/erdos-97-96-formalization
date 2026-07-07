/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 30:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0000 : Poly :=
[
  term ((-163376706251516431 : Rat) / 208877130852768) []
]

/-- Partial product 0 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0000 : Poly :=
[
  term ((163376706251516431 : Rat) / 104438565426384) [(0, 1), (14, 1)],
  term ((-163376706251516431 : Rat) / 208877130852768) [(0, 2)],
  term ((163376706251516431 : Rat) / 104438565426384) [(1, 1), (15, 1)],
  term ((-163376706251516431 : Rat) / 208877130852768) [(1, 2)],
  term ((-163376706251516431 : Rat) / 104438565426384) [(12, 1), (14, 1)],
  term ((163376706251516431 : Rat) / 208877130852768) [(12, 2)],
  term ((-163376706251516431 : Rat) / 104438565426384) [(13, 1), (15, 1)],
  term ((163376706251516431 : Rat) / 208877130852768) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0000
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0001 : Poly :=
[
  term ((11240391924886141 : Rat) / 17406427571064) [(0, 1)]
]

/-- Partial product 1 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0001 : Poly :=
[
  term ((-11240391924886141 : Rat) / 8703213785532) [(0, 1), (1, 1), (15, 1)],
  term ((11240391924886141 : Rat) / 17406427571064) [(0, 1), (1, 2)],
  term ((11240391924886141 : Rat) / 8703213785532) [(0, 1), (12, 1), (14, 1)],
  term ((-11240391924886141 : Rat) / 17406427571064) [(0, 1), (12, 2)],
  term ((11240391924886141 : Rat) / 8703213785532) [(0, 1), (13, 1), (15, 1)],
  term ((-11240391924886141 : Rat) / 17406427571064) [(0, 1), (13, 2)],
  term ((-11240391924886141 : Rat) / 8703213785532) [(0, 2), (14, 1)],
  term ((11240391924886141 : Rat) / 17406427571064) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0001
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0002 : Poly :=
[
  term ((2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0002 : Poly :=
[
  term ((2076886323547345 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1), (12, 2)],
  term ((2076886323547345 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((-2076886323547345 : Rat) / 26109641356596) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 3), (3, 1)],
  term ((-2076886323547345 : Rat) / 26109641356596) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((2076886323547345 : Rat) / 52219282713192) [(0, 3), (1, 1), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0002
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0003 : Poly :=
[
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (15, 1)]
]

/-- Partial product 3 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0003 : Poly :=
[
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (15, 2)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 3), (6, 1), (15, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 3), (1, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0003
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0004 : Poly :=
[
  term ((-23005860100474 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 4 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0004 : Poly :=
[
  term ((-46011720200948 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((23005860100474 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-46011720200948 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((23005860100474 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((46011720200948 : Rat) / 241755938487) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-23005860100474 : Rat) / 241755938487) [(0, 1), (1, 3), (7, 1)],
  term ((46011720200948 : Rat) / 241755938487) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((-23005860100474 : Rat) / 241755938487) [(0, 3), (1, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0004
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0005 : Poly :=
[
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (14, 1)]
]

/-- Partial product 5 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0005 : Poly :=
[
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 2)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 2), (14, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (13, 2), (14, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 3), (7, 1), (14, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 2), (1, 1), (7, 1), (14, 2)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 3), (1, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0005
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0006 : Poly :=
[
  term ((2791279226905 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 6 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0006 : Poly :=
[
  term ((2791279226905 : Rat) / 6744934476) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-2791279226905 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((2791279226905 : Rat) / 6744934476) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2791279226905 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((-2791279226905 : Rat) / 6744934476) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((2791279226905 : Rat) / 13489868952) [(0, 1), (1, 3), (9, 1)],
  term ((-2791279226905 : Rat) / 6744934476) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((2791279226905 : Rat) / 13489868952) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0006
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0007 : Poly :=
[
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1)]
]

/-- Partial product 7 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0007 : Poly :=
[
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (12, 2), (14, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 3)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (1, 3), (9, 1), (12, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 2), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 3), (1, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0007
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0008 : Poly :=
[
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (14, 1)]
]

/-- Partial product 8 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0008 : Poly :=
[
  term ((10861008665 : Rat) / 187359291) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 2)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (12, 2), (14, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (1, 2), (9, 1), (14, 1), (15, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 3), (9, 1), (14, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 2), (1, 1), (9, 1), (14, 2)],
  term ((10861008665 : Rat) / 374718582) [(0, 3), (1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0008
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0009 : Poly :=
[
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 9 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0009 : Poly :=
[
  term ((535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 3), (11, 1)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 3), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0009
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0010 : Poly :=
[
  term ((4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 1), (13, 1)]
]

/-- Partial product 10 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0010 : Poly :=
[
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 1), (13, 3)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 3), (13, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 2), (12, 1), (13, 1), (15, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (1, 3), (12, 1), (13, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 3), (1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0010
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0011 : Poly :=
[
  term ((-5 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0011 : Poly :=
[
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 3), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 7) [(0, 1), (1, 1), (12, 3), (13, 1), (16, 1)],
  term ((10 : Rat) / 7) [(0, 1), (1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(0, 1), (1, 3), (12, 1), (13, 1), (16, 1)],
  term ((10 : Rat) / 7) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(0, 3), (1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0011
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0012 : Poly :=
[
  term ((-25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (15, 1)]
]

/-- Partial product 12 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0012 : Poly :=
[
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2)],
  term ((25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1)],
  term ((25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (12, 3), (15, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 2), (12, 1), (15, 2)],
  term ((-25218104180 : Rat) / 187359291) [(0, 1), (1, 3), (12, 1), (15, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25218104180 : Rat) / 187359291) [(0, 3), (1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0012
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0013 : Poly :=
[
  term ((4 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0013 : Poly :=
[
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(0, 1), (1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (1, 2), (12, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 7) [(0, 1), (1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 7) [(0, 3), (1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0013
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0014 : Poly :=
[
  term ((-107498459989867 : Rat) / 532849823604) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 14 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0014 : Poly :=
[
  term ((-107498459989867 : Rat) / 266424911802) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((107498459989867 : Rat) / 532849823604) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-107498459989867 : Rat) / 266424911802) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((107498459989867 : Rat) / 532849823604) [(0, 1), (1, 1), (13, 3)],
  term ((107498459989867 : Rat) / 266424911802) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-107498459989867 : Rat) / 532849823604) [(0, 1), (1, 3), (13, 1)],
  term ((107498459989867 : Rat) / 266424911802) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-107498459989867 : Rat) / 532849823604) [(0, 3), (1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0014
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0015 : Poly :=
[
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (13, 1), (14, 1)]
]

/-- Partial product 15 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0015 : Poly :=
[
  term ((-9412426570 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-9412426570 : Rat) / 187359291) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (13, 3), (14, 1)],
  term ((9412426570 : Rat) / 187359291) [(0, 1), (1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 3), (13, 1), (14, 1)],
  term ((9412426570 : Rat) / 187359291) [(0, 2), (1, 1), (13, 1), (14, 2)],
  term ((-4706213285 : Rat) / 187359291) [(0, 3), (1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0015
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0016 : Poly :=
[
  term ((10 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0016 : Poly :=
[
  term ((20 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((20 : Rat) / 7) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(0, 1), (1, 3), (13, 1), (14, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 2), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((10 : Rat) / 7) [(0, 3), (1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0016
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0017 : Poly :=
[
  term ((415 : Rat) / 42) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0017 : Poly :=
[
  term ((415 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-415 : Rat) / 42) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((415 : Rat) / 21) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-415 : Rat) / 42) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((-415 : Rat) / 21) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((415 : Rat) / 42) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term ((-415 : Rat) / 21) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((415 : Rat) / 42) [(0, 3), (1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0017
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0018 : Poly :=
[
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (14, 1), (15, 1)]
]

/-- Partial product 18 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0018 : Poly :=
[
  term ((100872416720 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1)],
  term ((100872416720 : Rat) / 187359291) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-100872416720 : Rat) / 187359291) [(0, 1), (1, 2), (14, 1), (15, 2)],
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 3), (14, 1), (15, 1)],
  term ((-100872416720 : Rat) / 187359291) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 3), (1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0018
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0019 : Poly :=
[
  term ((-8 : Rat) / 7) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0019 : Poly :=
[
  term ((-16 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(0, 1), (1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (1, 3), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(0, 2), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 3), (1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0019
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0020 : Poly :=
[
  term ((1389584157001721 : Rat) / 2486632510152) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 20 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0020 : Poly :=
[
  term ((1389584157001721 : Rat) / 1243316255076) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1389584157001721 : Rat) / 2486632510152) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((1389584157001721 : Rat) / 1243316255076) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-1389584157001721 : Rat) / 2486632510152) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-1389584157001721 : Rat) / 1243316255076) [(0, 1), (1, 2), (15, 2)],
  term ((1389584157001721 : Rat) / 2486632510152) [(0, 1), (1, 3), (15, 1)],
  term ((-1389584157001721 : Rat) / 1243316255076) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((1389584157001721 : Rat) / 2486632510152) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0020
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0021 : Poly :=
[
  term ((-170 : Rat) / 21) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0021 : Poly :=
[
  term ((-340 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((170 : Rat) / 21) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-340 : Rat) / 21) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((170 : Rat) / 21) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((340 : Rat) / 21) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((340 : Rat) / 21) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0021
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0022 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2)]
]

/-- Partial product 22 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0022 : Poly :=
[
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (12, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (13, 2)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 3), (15, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 4)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (14, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 3), (1, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0022
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0023 : Poly :=
[
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1)]
]

/-- Partial product 23 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0023 : Poly :=
[
  term ((369246208469699 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (1, 2), (2, 1)],
  term ((-369246208469699 : Rat) / 1450535630922) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (12, 2)],
  term ((-369246208469699 : Rat) / 1450535630922) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (13, 2)],
  term ((369246208469699 : Rat) / 1450535630922) [(0, 2), (2, 1), (14, 1)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 3), (2, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0023
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0024 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (15, 1)]
]

/-- Partial product 24 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0024 : Poly :=
[
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 1)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 3), (3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0024
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0025 : Poly :=
[
  term ((-56601600409522153 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 25 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0025 : Poly :=
[
  term ((56601600409522153 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-56601600409522153 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((-56601600409522153 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((56601600409522153 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1), (12, 2)],
  term ((-56601600409522153 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((56601600409522153 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1), (13, 2)],
  term ((56601600409522153 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-56601600409522153 : Rat) / 52219282713192) [(0, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0025
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0026 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (14, 1)]
]

/-- Partial product 26 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0026 : Poly :=
[
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (1, 2), (3, 1), (7, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (12, 2), (14, 1)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (13, 2), (14, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 2), (3, 1), (7, 1), (14, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 3), (3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0026
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0027 : Poly :=
[
  term ((-2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 27 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0027 : Poly :=
[
  term ((2700046754119 : Rat) / 7708496544) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-2700046754119 : Rat) / 15416993088) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((-2700046754119 : Rat) / 7708496544) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1), (12, 2)],
  term ((-2700046754119 : Rat) / 7708496544) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((2700046754119 : Rat) / 7708496544) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-2700046754119 : Rat) / 15416993088) [(0, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0027
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0028 : Poly :=
[
  term ((2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 28 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0028 : Poly :=
[
  term ((-2500010837845201 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((2500010837845201 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((2500010837845201 : Rat) / 26109641356596) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((2500010837845201 : Rat) / 26109641356596) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((-2500010837845201 : Rat) / 26109641356596) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((2500010837845201 : Rat) / 52219282713192) [(0, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0028
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0029 : Poly :=
[
  term ((811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 29 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0029 : Poly :=
[
  term ((-811459086674035 : Rat) / 2131399294416) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((811459086674035 : Rat) / 4262798588832) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((811459086674035 : Rat) / 2131399294416) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((811459086674035 : Rat) / 2131399294416) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (13, 3)],
  term ((-811459086674035 : Rat) / 2131399294416) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((811459086674035 : Rat) / 4262798588832) [(0, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0029
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0030 : Poly :=
[
  term ((-2095 : Rat) / 336) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0030 : Poly :=
[
  term ((2095 : Rat) / 168) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2095 : Rat) / 336) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-2095 : Rat) / 168) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2095 : Rat) / 336) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2095 : Rat) / 168) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((2095 : Rat) / 336) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term ((2095 : Rat) / 168) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2095 : Rat) / 336) [(0, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0030
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0031 : Poly :=
[
  term ((17603503168604333 : Rat) / 26109641356596) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 31 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0031 : Poly :=
[
  term ((-17603503168604333 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((17603503168604333 : Rat) / 26109641356596) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((17603503168604333 : Rat) / 13054820678298) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17603503168604333 : Rat) / 26109641356596) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((17603503168604333 : Rat) / 13054820678298) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-17603503168604333 : Rat) / 26109641356596) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-17603503168604333 : Rat) / 13054820678298) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((17603503168604333 : Rat) / 26109641356596) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0031
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0032 : Poly :=
[
  term ((415 : Rat) / 84) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0032 : Poly :=
[
  term ((-415 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((415 : Rat) / 84) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((415 : Rat) / 42) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-415 : Rat) / 84) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((415 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-415 : Rat) / 84) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-415 : Rat) / 42) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((415 : Rat) / 84) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0032
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0033 : Poly :=
[
  term ((-3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2)]
]

/-- Partial product 33 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0033 : Poly :=
[
  term ((3759648208782605 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-3759648208782605 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 2)],
  term ((-3759648208782605 : Rat) / 26109641356596) [(0, 1), (3, 2), (12, 1), (14, 1)],
  term ((3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2), (12, 2)],
  term ((-3759648208782605 : Rat) / 26109641356596) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2), (13, 2)],
  term ((3759648208782605 : Rat) / 26109641356596) [(0, 2), (3, 2), (14, 1)],
  term ((-3759648208782605 : Rat) / 52219282713192) [(0, 3), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0033
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0034 : Poly :=
[
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1)]
]

/-- Partial product 34 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0034 : Poly :=
[
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (1, 2), (6, 1)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (12, 2)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (13, 2)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 2), (6, 1), (14, 1)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 3), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0034
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0035 : Poly :=
[
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 35 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0035 : Poly :=
[
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (15, 2)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (7, 1), (15, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 3), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0035
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0036 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 36 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0036 : Poly :=
[
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (1, 1), (6, 1), (9, 1), (15, 2)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (1, 2), (6, 1), (9, 1), (15, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 2), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 3), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0036
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0037 : Poly :=
[
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 37 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0037 : Poly :=
[
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (11, 1), (15, 2)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 3), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0037
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0038 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 38 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0038 : Poly :=
[
  term ((1121527532107244 : Rat) / 399637367703) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 2), (15, 2)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 3), (15, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 3), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0038
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0039 : Poly :=
[
  term ((-340 : Rat) / 63) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0039 : Poly :=
[
  term ((680 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((680 : Rat) / 63) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 3), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0039
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0040 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 1), (15, 2)]
]

/-- Partial product 40 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0040 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 3)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (1, 2), (6, 1), (14, 1), (15, 2)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 1), (14, 2), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 3)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (13, 2), (14, 1), (15, 2)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 2), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 3), (6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0040
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0041 : Poly :=
[
  term ((4282250622413135 : Rat) / 3729948765228) [(0, 1), (6, 1), (15, 2)]
]

/-- Partial product 41 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0041 : Poly :=
[
  term ((-4282250622413135 : Rat) / 1864974382614) [(0, 1), (1, 1), (6, 1), (15, 3)],
  term ((4282250622413135 : Rat) / 3729948765228) [(0, 1), (1, 2), (6, 1), (15, 2)],
  term ((4282250622413135 : Rat) / 1864974382614) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4282250622413135 : Rat) / 3729948765228) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((4282250622413135 : Rat) / 1864974382614) [(0, 1), (6, 1), (13, 1), (15, 3)],
  term ((-4282250622413135 : Rat) / 3729948765228) [(0, 1), (6, 1), (13, 2), (15, 2)],
  term ((-4282250622413135 : Rat) / 1864974382614) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((4282250622413135 : Rat) / 3729948765228) [(0, 3), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0041
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0042 : Poly :=
[
  term ((64 : Rat) / 9) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 42 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0042 : Poly :=
[
  term ((-128 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 9) [(0, 1), (1, 2), (6, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 9) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((128 : Rat) / 9) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128 : Rat) / 9) [(0, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 9) [(0, 3), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0042
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0043 : Poly :=
[
  term ((9764046789835 : Rat) / 3854248272) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 43 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0043 : Poly :=
[
  term ((-9764046789835 : Rat) / 1927124136) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((9764046789835 : Rat) / 3854248272) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((9764046789835 : Rat) / 1927124136) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-9764046789835 : Rat) / 3854248272) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((9764046789835 : Rat) / 1927124136) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-9764046789835 : Rat) / 3854248272) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((-9764046789835 : Rat) / 1927124136) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((9764046789835 : Rat) / 3854248272) [(0, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0043
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0044 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 44 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0044 : Poly :=
[
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (1, 2), (7, 1), (9, 1), (14, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (13, 2), (14, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 2), (7, 1), (9, 1), (14, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 3), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0044
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0045 : Poly :=
[
  term ((-8222716347836045 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 45 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0045 : Poly :=
[
  term ((8222716347836045 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-8222716347836045 : Rat) / 2901071261844) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-8222716347836045 : Rat) / 1450535630922) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((8222716347836045 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-8222716347836045 : Rat) / 1450535630922) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((8222716347836045 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((8222716347836045 : Rat) / 1450535630922) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-8222716347836045 : Rat) / 2901071261844) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0045
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0046 : Poly :=
[
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 46 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0046 : Poly :=
[
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (1, 2), (7, 1), (11, 1), (14, 1)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1), (14, 2)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 3), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0046
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0047 : Poly :=
[
  term ((-2801366270730439 : Rat) / 1065699647208) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 47 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0047 : Poly :=
[
  term ((2801366270730439 : Rat) / 532849823604) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2801366270730439 : Rat) / 1065699647208) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-2801366270730439 : Rat) / 532849823604) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2801366270730439 : Rat) / 1065699647208) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-2801366270730439 : Rat) / 532849823604) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((2801366270730439 : Rat) / 1065699647208) [(0, 1), (7, 1), (13, 3)],
  term ((2801366270730439 : Rat) / 532849823604) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-2801366270730439 : Rat) / 1065699647208) [(0, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0047
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0048 : Poly :=
[
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 48 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0048 : Poly :=
[
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (1, 2), (7, 1), (13, 1), (14, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 3), (14, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 3), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0048
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0049 : Poly :=
[
  term ((340 : Rat) / 63) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 49 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0049 : Poly :=
[
  term ((-680 : Rat) / 63) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((340 : Rat) / 63) [(0, 1), (1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((680 : Rat) / 63) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((680 : Rat) / 63) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(0, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((340 : Rat) / 63) [(0, 3), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0049
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0050 : Poly :=
[
  term ((325 : Rat) / 12) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0050 : Poly :=
[
  term ((-325 : Rat) / 6) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((325 : Rat) / 12) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((325 : Rat) / 6) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-325 : Rat) / 12) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((325 : Rat) / 6) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-325 : Rat) / 12) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((-325 : Rat) / 6) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((325 : Rat) / 12) [(0, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0050
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0051 : Poly :=
[
  term ((-30720403451337119 : Rat) / 26109641356596) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 51 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0051 : Poly :=
[
  term ((30720403451337119 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-30720403451337119 : Rat) / 26109641356596) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-30720403451337119 : Rat) / 13054820678298) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((30720403451337119 : Rat) / 26109641356596) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-30720403451337119 : Rat) / 13054820678298) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((30720403451337119 : Rat) / 26109641356596) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((30720403451337119 : Rat) / 13054820678298) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((-30720403451337119 : Rat) / 26109641356596) [(0, 3), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0051
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0052 : Poly :=
[
  term ((-64 : Rat) / 9) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0052 : Poly :=
[
  term ((128 : Rat) / 9) [(0, 1), (1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 9) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 9) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 9) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 3), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0052
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0053 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (14, 2), (15, 1)]
]

/-- Partial product 53 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0053 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (7, 1), (14, 2), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (1, 2), (7, 1), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (14, 3), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 3), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 3), (7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0053
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0054 : Poly :=
[
  term ((5486832080301235 : Rat) / 1934047507896) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 54 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0054 : Poly :=
[
  term ((-5486832080301235 : Rat) / 967023753948) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((5486832080301235 : Rat) / 1934047507896) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((5486832080301235 : Rat) / 967023753948) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5486832080301235 : Rat) / 1934047507896) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((5486832080301235 : Rat) / 967023753948) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-5486832080301235 : Rat) / 1934047507896) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-5486832080301235 : Rat) / 967023753948) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((5486832080301235 : Rat) / 1934047507896) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0054
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0055 : Poly :=
[
  term ((-391 : Rat) / 21) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0055 : Poly :=
[
  term ((782 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-391 : Rat) / 21) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-782 : Rat) / 21) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((391 : Rat) / 21) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-782 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((391 : Rat) / 21) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((782 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-391 : Rat) / 21) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0055
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0056 : Poly :=
[
  term ((16815892616328775 : Rat) / 8703213785532) [(0, 1), (7, 2)]
]

/-- Partial product 56 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0056 : Poly :=
[
  term ((-16815892616328775 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((16815892616328775 : Rat) / 8703213785532) [(0, 1), (1, 2), (7, 2)],
  term ((16815892616328775 : Rat) / 4351606892766) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term ((-16815892616328775 : Rat) / 8703213785532) [(0, 1), (7, 2), (12, 2)],
  term ((16815892616328775 : Rat) / 4351606892766) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-16815892616328775 : Rat) / 8703213785532) [(0, 1), (7, 2), (13, 2)],
  term ((-16815892616328775 : Rat) / 4351606892766) [(0, 2), (7, 2), (14, 1)],
  term ((16815892616328775 : Rat) / 8703213785532) [(0, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0056
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0057 : Poly :=
[
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 1)]
]

/-- Partial product 57 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0057 : Poly :=
[
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 2), (14, 1), (15, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (1, 2), (7, 2), (14, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 1), (14, 2)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 2), (14, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (13, 2), (14, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 2), (7, 2), (14, 2)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 3), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0057
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0058 : Poly :=
[
  term ((10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 58 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0058 : Poly :=
[
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 1), (1, 2), (9, 1), (10, 1), (13, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (13, 3)],
  term ((-10861008665 : Rat) / 107062452) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 3), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0058
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0059 : Poly :=
[
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 59 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0059 : Poly :=
[
  term ((10861008665 : Rat) / 53531226) [(0, 1), (1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-10861008665 : Rat) / 53531226) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-10861008665 : Rat) / 53531226) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((10861008665 : Rat) / 53531226) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 3), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0059
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0060 : Poly :=
[
  term ((10806703621675 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 60 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0060 : Poly :=
[
  term ((-10806703621675 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((10806703621675 : Rat) / 53959475808) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((10806703621675 : Rat) / 26979737904) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-10806703621675 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((10806703621675 : Rat) / 26979737904) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10806703621675 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-10806703621675 : Rat) / 26979737904) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((10806703621675 : Rat) / 53959475808) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0060
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0061 : Poly :=
[
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 61 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0061 : Poly :=
[
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (1, 2), (9, 1), (12, 1), (13, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 3)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 3), (13, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 3), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0061
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0062 : Poly :=
[
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 62 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0062 : Poly :=
[
  term ((115 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (12, 3), (13, 1), (16, 1)],
  term ((115 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 3), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0062
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0063 : Poly :=
[
  term ((183252917185 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 63 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0063 : Poly :=
[
  term ((-183252917185 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1), (15, 2)],
  term ((183252917185 : Rat) / 1498874328) [(0, 1), (1, 2), (9, 1), (12, 1), (15, 1)],
  term ((183252917185 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-183252917185 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((183252917185 : Rat) / 749437164) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-183252917185 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 3), (15, 1)],
  term ((-183252917185 : Rat) / 749437164) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((183252917185 : Rat) / 1498874328) [(0, 3), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0063
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0064 : Poly :=
[
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0064 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 3), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0064
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0065 : Poly :=
[
  term ((10861008665 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 65 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0065 : Poly :=
[
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (9, 1), (13, 3)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0065
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0066 : Poly :=
[
  term ((-3649940619119 : Rat) / 5995497312) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 66 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0066 : Poly :=
[
  term ((3649940619119 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3649940619119 : Rat) / 5995497312) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3649940619119 : Rat) / 2997748656) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((3649940619119 : Rat) / 5995497312) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3649940619119 : Rat) / 2997748656) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((3649940619119 : Rat) / 5995497312) [(0, 1), (9, 1), (13, 3), (14, 1)],
  term ((3649940619119 : Rat) / 2997748656) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((-3649940619119 : Rat) / 5995497312) [(0, 3), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0066
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0067 : Poly :=
[
  term ((115 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 67 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0067 : Poly :=
[
  term ((-230 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((115 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((230 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((230 : Rat) / 7) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-230 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((115 : Rat) / 7) [(0, 3), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0067
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0068 : Poly :=
[
  term ((954789077801 : Rat) / 2997748656) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 68 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0068 : Poly :=
[
  term ((-954789077801 : Rat) / 1498874328) [(0, 1), (1, 1), (9, 1), (14, 1), (15, 2)],
  term ((954789077801 : Rat) / 2997748656) [(0, 1), (1, 2), (9, 1), (14, 1), (15, 1)],
  term ((954789077801 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-954789077801 : Rat) / 2997748656) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((954789077801 : Rat) / 1498874328) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-954789077801 : Rat) / 2997748656) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-954789077801 : Rat) / 1498874328) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((954789077801 : Rat) / 2997748656) [(0, 3), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0068
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0069 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0069 : Poly :=
[
  term ((184 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-184 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-184 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((184 : Rat) / 7) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0069
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0070 : Poly :=
[
  term ((-15277094788189 : Rat) / 6744934476) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 70 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0070 : Poly :=
[
  term ((15277094788189 : Rat) / 3372467238) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((-15277094788189 : Rat) / 6744934476) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-15277094788189 : Rat) / 3372467238) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((15277094788189 : Rat) / 6744934476) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-15277094788189 : Rat) / 3372467238) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((15277094788189 : Rat) / 6744934476) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((15277094788189 : Rat) / 3372467238) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-15277094788189 : Rat) / 6744934476) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0070
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0071 : Poly :=
[
  term ((-34755227728 : Rat) / 562077873) [(0, 1), (9, 2)]
]

/-- Partial product 71 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0071 : Poly :=
[
  term ((69510455456 : Rat) / 562077873) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((-34755227728 : Rat) / 562077873) [(0, 1), (1, 2), (9, 2)],
  term ((-69510455456 : Rat) / 562077873) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((34755227728 : Rat) / 562077873) [(0, 1), (9, 2), (12, 2)],
  term ((-69510455456 : Rat) / 562077873) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((34755227728 : Rat) / 562077873) [(0, 1), (9, 2), (13, 2)],
  term ((69510455456 : Rat) / 562077873) [(0, 2), (9, 2), (14, 1)],
  term ((-34755227728 : Rat) / 562077873) [(0, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0071
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0072 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 1)]
]

/-- Partial product 72 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0072 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (1, 2), (9, 2), (12, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 1), (13, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (12, 2), (14, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 3)],
  term ((249803199295 : Rat) / 749437164) [(0, 2), (9, 2), (12, 1), (14, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 3), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0072
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0073 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (14, 1)]
]

/-- Partial product 73 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0073 : Poly :=
[
  term ((-249803199295 : Rat) / 374718582) [(0, 1), (1, 1), (9, 2), (14, 1), (15, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 2), (9, 2), (14, 1)],
  term ((249803199295 : Rat) / 374718582) [(0, 1), (9, 2), (12, 1), (14, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (12, 2), (14, 1)],
  term ((249803199295 : Rat) / 374718582) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (13, 2), (14, 1)],
  term ((-249803199295 : Rat) / 374718582) [(0, 2), (9, 2), (14, 2)],
  term ((249803199295 : Rat) / 749437164) [(0, 3), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0073
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0074 : Poly :=
[
  term ((73859077229671451 : Rat) / 69625710284256) [(0, 1), (10, 1)]
]

/-- Partial product 74 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0074 : Poly :=
[
  term ((-73859077229671451 : Rat) / 34812855142128) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((73859077229671451 : Rat) / 69625710284256) [(0, 1), (1, 2), (10, 1)],
  term ((73859077229671451 : Rat) / 34812855142128) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-73859077229671451 : Rat) / 69625710284256) [(0, 1), (10, 1), (12, 2)],
  term ((73859077229671451 : Rat) / 34812855142128) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-73859077229671451 : Rat) / 69625710284256) [(0, 1), (10, 1), (13, 2)],
  term ((-73859077229671451 : Rat) / 34812855142128) [(0, 2), (10, 1), (14, 1)],
  term ((73859077229671451 : Rat) / 69625710284256) [(0, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0074
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0075 : Poly :=
[
  term ((3355349785 : Rat) / 53531226) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 75 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0075 : Poly :=
[
  term ((-3355349785 : Rat) / 26765613) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2)],
  term ((3355349785 : Rat) / 53531226) [(0, 1), (1, 2), (10, 1), (13, 1), (15, 1)],
  term ((3355349785 : Rat) / 26765613) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3355349785 : Rat) / 53531226) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((3355349785 : Rat) / 26765613) [(0, 1), (10, 1), (13, 2), (15, 2)],
  term ((-3355349785 : Rat) / 53531226) [(0, 1), (10, 1), (13, 3), (15, 1)],
  term ((-3355349785 : Rat) / 26765613) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3355349785 : Rat) / 53531226) [(0, 3), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0075
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0076 : Poly :=
[
  term (-7 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0076 : Poly :=
[
  term (14 : Rat) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term (-7 : Rat) [(0, 1), (1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term (7 : Rat) [(0, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term (14 : Rat) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(0, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0076
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0077 : Poly :=
[
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (13, 2)]
]

/-- Partial product 77 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0077 : Poly :=
[
  term ((4706213285 : Rat) / 53531226) [(0, 1), (1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (1, 2), (10, 1), (13, 2)],
  term ((-4706213285 : Rat) / 53531226) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (12, 2), (13, 2)],
  term ((-4706213285 : Rat) / 53531226) [(0, 1), (10, 1), (13, 3), (15, 1)],
  term ((4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (13, 4)],
  term ((4706213285 : Rat) / 53531226) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 3), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0077
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0078 : Poly :=
[
  term ((5 : Rat) / 2) [(0, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 78 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0078 : Poly :=
[
  term (-5 : Rat) [(0, 1), (1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(0, 1), (1, 2), (10, 1), (13, 2), (16, 1)],
  term (5 : Rat) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term (5 : Rat) [(0, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 1), (10, 1), (13, 4), (16, 1)],
  term (-5 : Rat) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(0, 3), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0078
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0079 : Poly :=
[
  term ((192980500 : Rat) / 3823659) [(0, 1), (10, 1), (15, 2)]
]

/-- Partial product 79 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0079 : Poly :=
[
  term ((-385961000 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (15, 3)],
  term ((192980500 : Rat) / 3823659) [(0, 1), (1, 2), (10, 1), (15, 2)],
  term ((385961000 : Rat) / 3823659) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-192980500 : Rat) / 3823659) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((385961000 : Rat) / 3823659) [(0, 1), (10, 1), (13, 1), (15, 3)],
  term ((-192980500 : Rat) / 3823659) [(0, 1), (10, 1), (13, 2), (15, 2)],
  term ((-385961000 : Rat) / 3823659) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((192980500 : Rat) / 3823659) [(0, 3), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0079
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0080 : Poly :=
[
  term (4 : Rat) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 80 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0080 : Poly :=
[
  term (-8 : Rat) [(0, 1), (1, 1), (10, 1), (15, 3), (16, 1)],
  term (4 : Rat) [(0, 1), (1, 2), (10, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(0, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 3), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0080
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0081 : Poly :=
[
  term ((-455993594267233 : Rat) / 2131399294416) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 81 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0081 : Poly :=
[
  term ((455993594267233 : Rat) / 1065699647208) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-455993594267233 : Rat) / 2131399294416) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-455993594267233 : Rat) / 1065699647208) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((455993594267233 : Rat) / 2131399294416) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-455993594267233 : Rat) / 1065699647208) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((455993594267233 : Rat) / 2131399294416) [(0, 1), (11, 1), (13, 3)],
  term ((455993594267233 : Rat) / 1065699647208) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-455993594267233 : Rat) / 2131399294416) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0081
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0082 : Poly :=
[
  term ((-179712 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 82 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0082 : Poly :=
[
  term ((359424 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-179712 : Rat) / 553) [(0, 1), (1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-359424 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((179712 : Rat) / 553) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-359424 : Rat) / 553) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((179712 : Rat) / 553) [(0, 1), (11, 1), (13, 3), (14, 1)],
  term ((359424 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-179712 : Rat) / 553) [(0, 3), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0082
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0083 : Poly :=
[
  term ((-395 : Rat) / 168) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 83 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0083 : Poly :=
[
  term ((395 : Rat) / 84) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-395 : Rat) / 168) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-395 : Rat) / 84) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((395 : Rat) / 168) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-395 : Rat) / 84) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((395 : Rat) / 168) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((395 : Rat) / 84) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-395 : Rat) / 168) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0083
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0084 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 84 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0084 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (14, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(0, 1), (1, 2), (11, 1), (14, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((119808 : Rat) / 553) [(0, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0084
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0085 : Poly :=
[
  term ((13119677174251537 : Rat) / 5802142523688) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 85 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0085 : Poly :=
[
  term ((-13119677174251537 : Rat) / 2901071261844) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((13119677174251537 : Rat) / 5802142523688) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((13119677174251537 : Rat) / 2901071261844) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13119677174251537 : Rat) / 5802142523688) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((13119677174251537 : Rat) / 2901071261844) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-13119677174251537 : Rat) / 5802142523688) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-13119677174251537 : Rat) / 2901071261844) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((13119677174251537 : Rat) / 5802142523688) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0085
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0086 : Poly :=
[
  term ((107 : Rat) / 42) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0086 : Poly :=
[
  term ((-107 : Rat) / 21) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((107 : Rat) / 42) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 21) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107 : Rat) / 42) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((107 : Rat) / 21) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-107 : Rat) / 42) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-107 : Rat) / 21) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 42) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0086
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0087 : Poly :=
[
  term ((-1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2)]
]

/-- Partial product 87 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0087 : Poly :=
[
  term ((1803909535892029 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-1803909535892029 : Rat) / 8703213785532) [(0, 1), (1, 2), (11, 2)],
  term ((-1803909535892029 : Rat) / 4351606892766) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2), (12, 2)],
  term ((-1803909535892029 : Rat) / 4351606892766) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2), (13, 2)],
  term ((1803909535892029 : Rat) / 4351606892766) [(0, 2), (11, 2), (14, 1)],
  term ((-1803909535892029 : Rat) / 8703213785532) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0087
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0088 : Poly :=
[
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 1)]
]

/-- Partial product 88 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0088 : Poly :=
[
  term ((1729028084357939 : Rat) / 1657755006768) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 1), (1, 2), (12, 1)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 1), (13, 2)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(0, 1), (12, 2), (14, 1)],
  term ((1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 3)],
  term ((1729028084357939 : Rat) / 1657755006768) [(0, 2), (12, 1), (14, 1)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0088
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0089 : Poly :=
[
  term ((-117655332125 : Rat) / 749437164) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 89 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0089 : Poly :=
[
  term ((117655332125 : Rat) / 374718582) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-117655332125 : Rat) / 749437164) [(0, 1), (1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-117655332125 : Rat) / 374718582) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((117655332125 : Rat) / 749437164) [(0, 1), (12, 1), (13, 3), (15, 1)],
  term ((-117655332125 : Rat) / 374718582) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((117655332125 : Rat) / 749437164) [(0, 1), (12, 3), (13, 1), (15, 1)],
  term ((117655332125 : Rat) / 374718582) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-117655332125 : Rat) / 749437164) [(0, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0089
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0090 : Poly :=
[
  term ((125 : Rat) / 14) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0090 : Poly :=
[
  term ((-125 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((125 : Rat) / 14) [(0, 1), (1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((125 : Rat) / 7) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-125 : Rat) / 14) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((125 : Rat) / 7) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125 : Rat) / 14) [(0, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-125 : Rat) / 7) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((125 : Rat) / 14) [(0, 3), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0090
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0091 : Poly :=
[
  term ((36252141610 : Rat) / 187359291) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 91 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0091 : Poly :=
[
  term ((-72504283220 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (15, 3)],
  term ((36252141610 : Rat) / 187359291) [(0, 1), (1, 2), (12, 1), (15, 2)],
  term ((72504283220 : Rat) / 187359291) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((-36252141610 : Rat) / 187359291) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((72504283220 : Rat) / 187359291) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-36252141610 : Rat) / 187359291) [(0, 1), (12, 3), (15, 2)],
  term ((-72504283220 : Rat) / 187359291) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((36252141610 : Rat) / 187359291) [(0, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0091
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0092 : Poly :=
[
  term ((-50 : Rat) / 7) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 92 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0092 : Poly :=
[
  term ((100 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-50 : Rat) / 7) [(0, 1), (1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-100 : Rat) / 7) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((50 : Rat) / 7) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-100 : Rat) / 7) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((50 : Rat) / 7) [(0, 1), (12, 3), (15, 2), (16, 1)],
  term ((100 : Rat) / 7) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-50 : Rat) / 7) [(0, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0092
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0093 : Poly :=
[
  term ((-54867625049149 : Rat) / 118411071912) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 93 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0093 : Poly :=
[
  term ((54867625049149 : Rat) / 59205535956) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-54867625049149 : Rat) / 118411071912) [(0, 1), (1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-54867625049149 : Rat) / 59205535956) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((54867625049149 : Rat) / 118411071912) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-54867625049149 : Rat) / 59205535956) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((54867625049149 : Rat) / 118411071912) [(0, 1), (13, 3), (14, 1), (15, 1)],
  term ((54867625049149 : Rat) / 59205535956) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-54867625049149 : Rat) / 118411071912) [(0, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0093
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0094 : Poly :=
[
  term ((1163 : Rat) / 28) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0094 : Poly :=
[
  term ((-1163 : Rat) / 14) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1163 : Rat) / 28) [(0, 1), (1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1163 : Rat) / 14) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1163 : Rat) / 28) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1163 : Rat) / 14) [(0, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1163 : Rat) / 28) [(0, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1163 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1163 : Rat) / 28) [(0, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0094
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0095 : Poly :=
[
  term ((331543294310471 : Rat) / 133212455901) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 95 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0095 : Poly :=
[
  term ((-663086588620942 : Rat) / 133212455901) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((331543294310471 : Rat) / 133212455901) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((663086588620942 : Rat) / 133212455901) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-331543294310471 : Rat) / 133212455901) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((663086588620942 : Rat) / 133212455901) [(0, 1), (13, 2), (15, 2)],
  term ((-331543294310471 : Rat) / 133212455901) [(0, 1), (13, 3), (15, 1)],
  term ((-663086588620942 : Rat) / 133212455901) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((331543294310471 : Rat) / 133212455901) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0095
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0096 : Poly :=
[
  term ((-121 : Rat) / 3) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0096 : Poly :=
[
  term ((242 : Rat) / 3) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-121 : Rat) / 3) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-242 : Rat) / 3) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((121 : Rat) / 3) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-242 : Rat) / 3) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((121 : Rat) / 3) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((242 : Rat) / 3) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-121 : Rat) / 3) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0096
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0097 : Poly :=
[
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (13, 2)]
]

/-- Partial product 97 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0097 : Poly :=
[
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (1, 2), (13, 2)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (12, 2), (13, 2)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (13, 3), (15, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (13, 4)],
  term ((4706213285 : Rat) / 187359291) [(0, 2), (13, 2), (14, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0097
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0098 : Poly :=
[
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 98 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0098 : Poly :=
[
  term ((-831117266131 : Rat) / 1498874328) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (1, 2), (13, 2), (14, 1)],
  term ((831117266131 : Rat) / 1498874328) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (12, 2), (13, 2), (14, 1)],
  term ((831117266131 : Rat) / 1498874328) [(0, 1), (13, 3), (14, 1), (15, 1)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (13, 4), (14, 1)],
  term ((-831117266131 : Rat) / 1498874328) [(0, 2), (13, 2), (14, 2)],
  term ((831117266131 : Rat) / 2997748656) [(0, 3), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0098
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YNNNN_coefficient_30_0099 : Poly :=
[
  term ((-1635 : Rat) / 56) [(0, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 99 for generator 30. -/
def rs_R009_ueqv_R009YNNNN_partial_30_0099 : Poly :=
[
  term ((1635 : Rat) / 28) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1635 : Rat) / 56) [(0, 1), (1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1635 : Rat) / 28) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((1635 : Rat) / 56) [(0, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1635 : Rat) / 28) [(0, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1635 : Rat) / 56) [(0, 1), (13, 4), (14, 1), (16, 1)],
  term ((1635 : Rat) / 28) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((-1635 : Rat) / 56) [(0, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 30. -/
theorem rs_R009_ueqv_R009YNNNN_partial_30_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_30_0099
        rs_R009_ueqv_R009YNNNN_generator_30_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_30_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_30_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_30_0000,
  rs_R009_ueqv_R009YNNNN_partial_30_0001,
  rs_R009_ueqv_R009YNNNN_partial_30_0002,
  rs_R009_ueqv_R009YNNNN_partial_30_0003,
  rs_R009_ueqv_R009YNNNN_partial_30_0004,
  rs_R009_ueqv_R009YNNNN_partial_30_0005,
  rs_R009_ueqv_R009YNNNN_partial_30_0006,
  rs_R009_ueqv_R009YNNNN_partial_30_0007,
  rs_R009_ueqv_R009YNNNN_partial_30_0008,
  rs_R009_ueqv_R009YNNNN_partial_30_0009,
  rs_R009_ueqv_R009YNNNN_partial_30_0010,
  rs_R009_ueqv_R009YNNNN_partial_30_0011,
  rs_R009_ueqv_R009YNNNN_partial_30_0012,
  rs_R009_ueqv_R009YNNNN_partial_30_0013,
  rs_R009_ueqv_R009YNNNN_partial_30_0014,
  rs_R009_ueqv_R009YNNNN_partial_30_0015,
  rs_R009_ueqv_R009YNNNN_partial_30_0016,
  rs_R009_ueqv_R009YNNNN_partial_30_0017,
  rs_R009_ueqv_R009YNNNN_partial_30_0018,
  rs_R009_ueqv_R009YNNNN_partial_30_0019,
  rs_R009_ueqv_R009YNNNN_partial_30_0020,
  rs_R009_ueqv_R009YNNNN_partial_30_0021,
  rs_R009_ueqv_R009YNNNN_partial_30_0022,
  rs_R009_ueqv_R009YNNNN_partial_30_0023,
  rs_R009_ueqv_R009YNNNN_partial_30_0024,
  rs_R009_ueqv_R009YNNNN_partial_30_0025,
  rs_R009_ueqv_R009YNNNN_partial_30_0026,
  rs_R009_ueqv_R009YNNNN_partial_30_0027,
  rs_R009_ueqv_R009YNNNN_partial_30_0028,
  rs_R009_ueqv_R009YNNNN_partial_30_0029,
  rs_R009_ueqv_R009YNNNN_partial_30_0030,
  rs_R009_ueqv_R009YNNNN_partial_30_0031,
  rs_R009_ueqv_R009YNNNN_partial_30_0032,
  rs_R009_ueqv_R009YNNNN_partial_30_0033,
  rs_R009_ueqv_R009YNNNN_partial_30_0034,
  rs_R009_ueqv_R009YNNNN_partial_30_0035,
  rs_R009_ueqv_R009YNNNN_partial_30_0036,
  rs_R009_ueqv_R009YNNNN_partial_30_0037,
  rs_R009_ueqv_R009YNNNN_partial_30_0038,
  rs_R009_ueqv_R009YNNNN_partial_30_0039,
  rs_R009_ueqv_R009YNNNN_partial_30_0040,
  rs_R009_ueqv_R009YNNNN_partial_30_0041,
  rs_R009_ueqv_R009YNNNN_partial_30_0042,
  rs_R009_ueqv_R009YNNNN_partial_30_0043,
  rs_R009_ueqv_R009YNNNN_partial_30_0044,
  rs_R009_ueqv_R009YNNNN_partial_30_0045,
  rs_R009_ueqv_R009YNNNN_partial_30_0046,
  rs_R009_ueqv_R009YNNNN_partial_30_0047,
  rs_R009_ueqv_R009YNNNN_partial_30_0048,
  rs_R009_ueqv_R009YNNNN_partial_30_0049,
  rs_R009_ueqv_R009YNNNN_partial_30_0050,
  rs_R009_ueqv_R009YNNNN_partial_30_0051,
  rs_R009_ueqv_R009YNNNN_partial_30_0052,
  rs_R009_ueqv_R009YNNNN_partial_30_0053,
  rs_R009_ueqv_R009YNNNN_partial_30_0054,
  rs_R009_ueqv_R009YNNNN_partial_30_0055,
  rs_R009_ueqv_R009YNNNN_partial_30_0056,
  rs_R009_ueqv_R009YNNNN_partial_30_0057,
  rs_R009_ueqv_R009YNNNN_partial_30_0058,
  rs_R009_ueqv_R009YNNNN_partial_30_0059,
  rs_R009_ueqv_R009YNNNN_partial_30_0060,
  rs_R009_ueqv_R009YNNNN_partial_30_0061,
  rs_R009_ueqv_R009YNNNN_partial_30_0062,
  rs_R009_ueqv_R009YNNNN_partial_30_0063,
  rs_R009_ueqv_R009YNNNN_partial_30_0064,
  rs_R009_ueqv_R009YNNNN_partial_30_0065,
  rs_R009_ueqv_R009YNNNN_partial_30_0066,
  rs_R009_ueqv_R009YNNNN_partial_30_0067,
  rs_R009_ueqv_R009YNNNN_partial_30_0068,
  rs_R009_ueqv_R009YNNNN_partial_30_0069,
  rs_R009_ueqv_R009YNNNN_partial_30_0070,
  rs_R009_ueqv_R009YNNNN_partial_30_0071,
  rs_R009_ueqv_R009YNNNN_partial_30_0072,
  rs_R009_ueqv_R009YNNNN_partial_30_0073,
  rs_R009_ueqv_R009YNNNN_partial_30_0074,
  rs_R009_ueqv_R009YNNNN_partial_30_0075,
  rs_R009_ueqv_R009YNNNN_partial_30_0076,
  rs_R009_ueqv_R009YNNNN_partial_30_0077,
  rs_R009_ueqv_R009YNNNN_partial_30_0078,
  rs_R009_ueqv_R009YNNNN_partial_30_0079,
  rs_R009_ueqv_R009YNNNN_partial_30_0080,
  rs_R009_ueqv_R009YNNNN_partial_30_0081,
  rs_R009_ueqv_R009YNNNN_partial_30_0082,
  rs_R009_ueqv_R009YNNNN_partial_30_0083,
  rs_R009_ueqv_R009YNNNN_partial_30_0084,
  rs_R009_ueqv_R009YNNNN_partial_30_0085,
  rs_R009_ueqv_R009YNNNN_partial_30_0086,
  rs_R009_ueqv_R009YNNNN_partial_30_0087,
  rs_R009_ueqv_R009YNNNN_partial_30_0088,
  rs_R009_ueqv_R009YNNNN_partial_30_0089,
  rs_R009_ueqv_R009YNNNN_partial_30_0090,
  rs_R009_ueqv_R009YNNNN_partial_30_0091,
  rs_R009_ueqv_R009YNNNN_partial_30_0092,
  rs_R009_ueqv_R009YNNNN_partial_30_0093,
  rs_R009_ueqv_R009YNNNN_partial_30_0094,
  rs_R009_ueqv_R009YNNNN_partial_30_0095,
  rs_R009_ueqv_R009YNNNN_partial_30_0096,
  rs_R009_ueqv_R009YNNNN_partial_30_0097,
  rs_R009_ueqv_R009YNNNN_partial_30_0098,
  rs_R009_ueqv_R009YNNNN_partial_30_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_30_0000_0099 : Poly :=
[
  term ((369246208469699 : Rat) / 1450535630922) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((56601600409522153 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((2700046754119 : Rat) / 7708496544) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-2500010837845201 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((2076886323547345 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1), (12, 2)],
  term ((-10484649984279445 : Rat) / 34812855142128) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((2095 : Rat) / 168) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((-17603503168604333 : Rat) / 13054820678298) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((-415 : Rat) / 42) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((3759648208782605 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (15, 2)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (1, 1), (6, 1), (9, 1), (15, 2)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (11, 1), (15, 2)],
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1)],
  term ((63588478281971042 : Rat) / 19582231017447) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2)],
  term ((680 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (13, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 3)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((-4282250622413135 : Rat) / 1864974382614) [(0, 1), (1, 1), (6, 1), (15, 3)],
  term ((-128 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (15, 3), (16, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-9764046789835 : Rat) / 1927124136) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((8222716347836045 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-46011720200948 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 2)],
  term ((23005860100474 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 2), (14, 1)],
  term ((-63588478281971042 : Rat) / 19582231017447) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-680 : Rat) / 63) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((132297681484089127 : Rat) / 26109641356596) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-325 : Rat) / 6) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((23005860100474 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (13, 2), (14, 1)],
  term ((30720403451337119 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (14, 1), (15, 2)],
  term ((128 : Rat) / 9) [(0, 1), (1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (7, 1), (14, 2), (15, 2)],
  term ((-5486832080301235 : Rat) / 967023753948) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((782 : Rat) / 21) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 2), (14, 1), (15, 1)],
  term ((-16815892616328775 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((10861008665 : Rat) / 53531226) [(0, 1), (1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-10806703621675 : Rat) / 26979737904) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-19850652370 : Rat) / 62453097) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((115 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 2)],
  term ((2791279226905 : Rat) / 6744934476) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 2)],
  term ((-183252917185 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-92 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2791279226905 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (1, 1), (9, 1), (12, 2), (14, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 3)],
  term ((3823716757759 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-230 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2595781070935 : Rat) / 6744934476) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2791279226905 : Rat) / 13489868952) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-954789077801 : Rat) / 1498874328) [(0, 1), (1, 1), (9, 1), (14, 1), (15, 2)],
  term ((184 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((15277094788189 : Rat) / 3372467238) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-249803199295 : Rat) / 374718582) [(0, 1), (1, 1), (9, 2), (14, 1), (15, 1)],
  term ((69510455456 : Rat) / 562077873) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((-3355349785 : Rat) / 26765613) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2)],
  term (14 : Rat) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4706213285 : Rat) / 53531226) [(0, 1), (1, 1), (10, 1), (13, 2), (15, 1)],
  term (-5 : Rat) [(0, 1), (1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-73859077229671451 : Rat) / 34812855142128) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-385961000 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (15, 3)],
  term (-8 : Rat) [(0, 1), (1, 1), (10, 1), (15, 3), (16, 1)],
  term ((535147519423427 : Rat) / 2175803446383) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((359424 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((35187226585256665 : Rat) / 52219282713192) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((395 : Rat) / 84) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-239616 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-13119677174251537 : Rat) / 2901071261844) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-107 : Rat) / 21) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((1803909535892029 : Rat) / 4351606892766) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-107498459989867 : Rat) / 266424911802) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((415 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9412426570 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2)],
  term ((20 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((5594305135 : Rat) / 124906194) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-117 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4274902495 : Rat) / 26765613) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1)],
  term (-2 : Rat) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 1), (13, 3)],
  term ((5 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 3), (16, 1)],
  term ((1389584157001721 : Rat) / 1243316255076) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-340 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((100872416720 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1729028084357939 : Rat) / 1657755006768) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-72504283220 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (15, 3)],
  term ((100 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (15, 3), (16, 1)],
  term ((107498459989867 : Rat) / 532849823604) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((9412426570 : Rat) / 187359291) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-415 : Rat) / 42) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-100872416720 : Rat) / 187359291) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1)],
  term ((16 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1389584157001721 : Rat) / 2486632510152) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((170 : Rat) / 21) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 3), (13, 1)],
  term ((5 : Rat) / 7) [(0, 1), (1, 1), (12, 3), (13, 1), (16, 1)],
  term ((25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (12, 3), (15, 1)],
  term ((-4 : Rat) / 7) [(0, 1), (1, 1), (12, 3), (15, 1), (16, 1)],
  term ((3212715138247 : Rat) / 2192797628) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1195 : Rat) / 14) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14397672010381213 : Rat) / 3729948765228) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((1354 : Rat) / 21) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1309906345571 : Rat) / 1498874328) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)],
  term ((1747 : Rat) / 28) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6991326762565879 : Rat) / 7459897530456) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((195 : Rat) / 7) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((107498459989867 : Rat) / 532849823604) [(0, 1), (1, 1), (13, 3)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (13, 3), (14, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-415 : Rat) / 42) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((-11240391924886141 : Rat) / 8703213785532) [(0, 1), (1, 1), (15, 1)],
  term ((11240391924886141 : Rat) / 17406427571064) [(0, 1), (1, 2)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 1), (1, 2), (2, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-56601600409522153 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-2700046754119 : Rat) / 15416993088) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((2500010837845201 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((811459086674035 : Rat) / 4262798588832) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-2095 : Rat) / 336) [(0, 1), (1, 2), (3, 1), (13, 1), (16, 1)],
  term ((3881654211264247 : Rat) / 6527410339149) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((415 : Rat) / 84) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-3759648208782605 : Rat) / 52219282713192) [(0, 1), (1, 2), (3, 2)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 1), (1, 2), (6, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (7, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (1, 2), (6, 1), (14, 1), (15, 2)],
  term ((18464248745270497 : Rat) / 26109641356596) [(0, 1), (1, 2), (6, 1), (15, 2)],
  term ((64 : Rat) / 9) [(0, 1), (1, 2), (6, 1), (15, 2), (16, 1)],
  term ((9764046789835 : Rat) / 3854248272) [(0, 1), (1, 2), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (1, 2), (7, 1), (9, 1), (14, 1)],
  term ((-8222716347836045 : Rat) / 2901071261844) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-2801366270730439 : Rat) / 1065699647208) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (1, 2), (7, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(0, 1), (1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((325 : Rat) / 12) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-19208897839715671 : Rat) / 26109641356596) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (1, 2), (7, 1), (14, 2), (15, 1)],
  term ((5854925841908819 : Rat) / 1934047507896) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-391 : Rat) / 21) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((16815892616328775 : Rat) / 8703213785532) [(0, 1), (1, 2), (7, 2)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (1, 2), (7, 2), (14, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 1), (1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (1, 2), (9, 1), (10, 1), (15, 1)],
  term ((10806703621675 : Rat) / 53959475808) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((514052045 : Rat) / 3398808) [(0, 1), (1, 2), (9, 1), (12, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-3649940619119 : Rat) / 5995497312) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1)],
  term ((115 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((37191092341 : Rat) / 142749936) [(0, 1), (1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9034187007547 : Rat) / 3372467238) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-34755227728 : Rat) / 562077873) [(0, 1), (1, 2), (9, 2)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (1, 2), (9, 2), (12, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (1, 2), (9, 2), (14, 1)],
  term ((73859077229671451 : Rat) / 69625710284256) [(0, 1), (1, 2), (10, 1)],
  term ((3355349785 : Rat) / 53531226) [(0, 1), (1, 2), (10, 1), (13, 1), (15, 1)],
  term (-7 : Rat) [(0, 1), (1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (1, 2), (10, 1), (13, 2)],
  term ((5 : Rat) / 2) [(0, 1), (1, 2), (10, 1), (13, 2), (16, 1)],
  term ((192980500 : Rat) / 3823659) [(0, 1), (1, 2), (10, 1), (15, 2)],
  term (4 : Rat) [(0, 1), (1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-455993594267233 : Rat) / 2131399294416) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-179712 : Rat) / 553) [(0, 1), (1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-395 : Rat) / 168) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (1, 2), (11, 1), (14, 1), (15, 1)],
  term ((35077851367367195 : Rat) / 17406427571064) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((107 : Rat) / 42) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1803909535892029 : Rat) / 8703213785532) [(0, 1), (1, 2), (11, 2)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 1), (1, 2), (12, 1)],
  term ((-136480185265 : Rat) / 749437164) [(0, 1), (1, 2), (12, 1), (13, 1), (15, 1)],
  term ((145 : Rat) / 14) [(0, 1), (1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((86688349970 : Rat) / 187359291) [(0, 1), (1, 2), (12, 1), (15, 2)],
  term ((-58 : Rat) / 7) [(0, 1), (1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (12, 2)],
  term ((-48918971456909 : Rat) / 118411071912) [(0, 1), (1, 2), (13, 1), (14, 1), (15, 1)],
  term ((1083 : Rat) / 28) [(0, 1), (1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18948130727144953 : Rat) / 6527410339149) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-1262 : Rat) / 21) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-155171200544165 : Rat) / 8703213785532) [(0, 1), (1, 2), (13, 2)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (1, 2), (13, 2), (14, 1)],
  term ((-1635 : Rat) / 56) [(0, 1), (1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-100872416720 : Rat) / 187359291) [(0, 1), (1, 2), (14, 1), (15, 2)],
  term ((16 : Rat) / 7) [(0, 1), (1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1389584157001721 : Rat) / 1243316255076) [(0, 1), (1, 2), (15, 2)],
  term ((340 : Rat) / 21) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((2076886323547345 : Rat) / 52219282713192) [(0, 1), (1, 3), (3, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 3), (6, 1), (15, 1)],
  term ((-23005860100474 : Rat) / 241755938487) [(0, 1), (1, 3), (7, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 3), (7, 1), (14, 1)],
  term ((2791279226905 : Rat) / 13489868952) [(0, 1), (1, 3), (9, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (1, 3), (9, 1), (12, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 3), (9, 1), (14, 1)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 1), (1, 3), (11, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (1, 3), (12, 1), (13, 1)],
  term ((-5 : Rat) / 7) [(0, 1), (1, 3), (12, 1), (13, 1), (16, 1)],
  term ((-25218104180 : Rat) / 187359291) [(0, 1), (1, 3), (12, 1), (15, 1)],
  term ((4 : Rat) / 7) [(0, 1), (1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-107498459989867 : Rat) / 532849823604) [(0, 1), (1, 3), (13, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 3), (13, 1), (14, 1)],
  term ((10 : Rat) / 7) [(0, 1), (1, 3), (13, 1), (14, 1), (16, 1)],
  term ((415 : Rat) / 42) [(0, 1), (1, 3), (13, 1), (16, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 3), (14, 1), (15, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (1, 3), (14, 1), (15, 1), (16, 1)],
  term ((3181210111955009 : Rat) / 5802142523688) [(0, 1), (1, 3), (15, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 4)],
  term ((-369246208469699 : Rat) / 1450535630922) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (12, 2)],
  term ((-369246208469699 : Rat) / 1450535630922) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((369246208469699 : Rat) / 2901071261844) [(0, 1), (2, 1), (13, 2)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 1)],
  term ((-56601600409522153 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 2)],
  term ((56601600409522153 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1), (12, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (12, 2), (14, 1)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-56601600409522153 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((56601600409522153 : Rat) / 52219282713192) [(0, 1), (3, 1), (7, 1), (13, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (13, 2), (14, 1)],
  term ((-2700046754119 : Rat) / 7708496544) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1), (12, 2)],
  term ((-2700046754119 : Rat) / 7708496544) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((2700046754119 : Rat) / 15416993088) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((2500010837845201 : Rat) / 26109641356596) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((2500010837845201 : Rat) / 26109641356596) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2500010837845201 : Rat) / 52219282713192) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((811459086674035 : Rat) / 2131399294416) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2095 : Rat) / 168) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((17603503168604333 : Rat) / 13054820678298) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((415 : Rat) / 42) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((2095 : Rat) / 336) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-17603503168604333 : Rat) / 26109641356596) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-415 : Rat) / 84) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((17603503168604333 : Rat) / 13054820678298) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((415 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30652517427389617 : Rat) / 104438565426384) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-975 : Rat) / 56) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-811459086674035 : Rat) / 4262798588832) [(0, 1), (3, 1), (13, 3)],
  term ((2095 : Rat) / 336) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term ((-3759648208782605 : Rat) / 26109641356596) [(0, 1), (3, 2), (12, 1), (14, 1)],
  term ((3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2), (12, 2)],
  term ((-3759648208782605 : Rat) / 26109641356596) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((3759648208782605 : Rat) / 52219282713192) [(0, 1), (3, 2), (13, 2)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-680 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((4282250622413135 : Rat) / 1864974382614) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((128 : Rat) / 9) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 1), (14, 2), (15, 2)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (12, 2)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-4282250622413135 : Rat) / 3729948765228) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2098475275065805 : Rat) / 1450535630922) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((4282250622413135 : Rat) / 1864974382614) [(0, 1), (6, 1), (13, 1), (15, 3)],
  term ((128 : Rat) / 9) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((2098475275065805 : Rat) / 2901071261844) [(0, 1), (6, 1), (13, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (13, 2), (14, 1), (15, 2)],
  term ((-44249522766242237 : Rat) / 11189846295684) [(0, 1), (6, 1), (13, 2), (15, 2)],
  term ((-376 : Rat) / 21) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 3), (15, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((9764046789835 : Rat) / 1927124136) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-9764046789835 : Rat) / 3854248272) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((9764046789835 : Rat) / 1927124136) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-9764046789835 : Rat) / 3854248272) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-8222716347836045 : Rat) / 1450535630922) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((8222716347836045 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8222716347836045 : Rat) / 1450535630922) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((8222716347836045 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2801366270730439 : Rat) / 532849823604) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((325 : Rat) / 6) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((680 : Rat) / 63) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((5486832080301235 : Rat) / 967023753948) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-782 : Rat) / 21) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30720403451337119 : Rat) / 13054820678298) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-128 : Rat) / 9) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (14, 3), (15, 1)],
  term ((2801366270730439 : Rat) / 1065699647208) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-325 : Rat) / 12) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((30720403451337119 : Rat) / 26109641356596) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-5486832080301235 : Rat) / 1934047507896) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((391 : Rat) / 21) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-30720403451337119 : Rat) / 13054820678298) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-128 : Rat) / 9) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (7, 1), (13, 1), (14, 2), (15, 2)],
  term ((5486832080301235 : Rat) / 967023753948) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-782 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((311980606647031181 : Rat) / 78328924069788) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((376 : Rat) / 21) [(0, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-422678360699716367 : Rat) / 52219282713192) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((1019 : Rat) / 14) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2801366270730439 : Rat) / 1065699647208) [(0, 1), (7, 1), (13, 3)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 3), (14, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-325 : Rat) / 12) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((16815892616328775 : Rat) / 4351606892766) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 1), (14, 2)],
  term ((-16815892616328775 : Rat) / 8703213785532) [(0, 1), (7, 2), (12, 2)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 2), (14, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((16815892616328775 : Rat) / 4351606892766) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-16815892616328775 : Rat) / 8703213785532) [(0, 1), (7, 2), (13, 2)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (13, 2), (14, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10861008665 : Rat) / 53531226) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-10861008665 : Rat) / 53531226) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((10861008665 : Rat) / 53531226) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (13, 3)],
  term ((10806703621675 : Rat) / 26979737904) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-10806703621675 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((10806703621675 : Rat) / 26979737904) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10806703621675 : Rat) / 53959475808) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3649940619119 : Rat) / 2997748656) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((230 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((183252917185 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((83239568345 : Rat) / 499624776) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term (-23 : Rat) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 3)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-15277094788189 : Rat) / 3372467238) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((954789077801 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-184 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((1793942369333 : Rat) / 1998499104) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-230 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-221777409061 : Rat) / 2997748656) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((184 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((15277094788189 : Rat) / 6744934476) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 3), (13, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (12, 3), (13, 1), (16, 1)],
  term ((-183252917185 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 3), (15, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((954789077801 : Rat) / 1498874328) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-184 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15277094788189 : Rat) / 3372467238) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-575591212115 : Rat) / 374718582) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term (46 : Rat) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((15472592944159 : Rat) / 6744934476) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (9, 1), (13, 3)],
  term ((3649940619119 : Rat) / 5995497312) [(0, 1), (9, 1), (13, 3), (14, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 1), (13, 2)],
  term ((-69510455456 : Rat) / 562077873) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((249803199295 : Rat) / 374718582) [(0, 1), (9, 2), (12, 1), (14, 2)],
  term ((34755227728 : Rat) / 562077873) [(0, 1), (9, 2), (12, 2)],
  term ((-249803199295 : Rat) / 374718582) [(0, 1), (9, 2), (12, 2), (14, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 3)],
  term ((249803199295 : Rat) / 374718582) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-69510455456 : Rat) / 562077873) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((34755227728 : Rat) / 562077873) [(0, 1), (9, 2), (13, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (13, 2), (14, 1)],
  term ((3355349785 : Rat) / 26765613) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (-14 : Rat) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 53531226) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term (5 : Rat) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((73859077229671451 : Rat) / 34812855142128) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((385961000 : Rat) / 3823659) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term (8 : Rat) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73859077229671451 : Rat) / 69625710284256) [(0, 1), (10, 1), (12, 2)],
  term ((-3355349785 : Rat) / 53531226) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term (7 : Rat) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (12, 2), (13, 2)],
  term ((-5 : Rat) / 2) [(0, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-192980500 : Rat) / 3823659) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term (-4 : Rat) [(0, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((73859077229671451 : Rat) / 34812855142128) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((385961000 : Rat) / 3823659) [(0, 1), (10, 1), (13, 1), (15, 3)],
  term (8 : Rat) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-73859077229671451 : Rat) / 69625710284256) [(0, 1), (10, 1), (13, 2)],
  term ((668162095 : Rat) / 8921871) [(0, 1), (10, 1), (13, 2), (15, 2)],
  term (-18 : Rat) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-149288205 : Rat) / 991319) [(0, 1), (10, 1), (13, 3), (15, 1)],
  term (12 : Rat) [(0, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (13, 4)],
  term ((-5 : Rat) / 2) [(0, 1), (10, 1), (13, 4), (16, 1)],
  term ((-455993594267233 : Rat) / 1065699647208) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-395 : Rat) / 84) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-359424 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((13119677174251537 : Rat) / 2901071261844) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((107 : Rat) / 21) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((455993594267233 : Rat) / 2131399294416) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((179712 : Rat) / 553) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((395 : Rat) / 168) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-13119677174251537 : Rat) / 5802142523688) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-107 : Rat) / 42) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((13119677174251537 : Rat) / 2901071261844) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((107 : Rat) / 21) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-479232 : Rat) / 553) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-70210390343679125 : Rat) / 26109641356596) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-29 : Rat) / 4) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((455993594267233 : Rat) / 2131399294416) [(0, 1), (11, 1), (13, 3)],
  term ((179712 : Rat) / 553) [(0, 1), (11, 1), (13, 3), (14, 1)],
  term ((395 : Rat) / 168) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1803909535892029 : Rat) / 4351606892766) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2), (12, 2)],
  term ((-1803909535892029 : Rat) / 4351606892766) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((1803909535892029 : Rat) / 8703213785532) [(0, 1), (11, 2), (13, 2)],
  term ((663086588620942 : Rat) / 133212455901) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-242 : Rat) / 3) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54867625049149 : Rat) / 59205535956) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1163 : Rat) / 14) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((72504283220 : Rat) / 187359291) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((-100 : Rat) / 7) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 1), (13, 2)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((831117266131 : Rat) / 1498874328) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((-1635 : Rat) / 28) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-27165659335 : Rat) / 53531226) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term (25 : Rat) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((117655332125 : Rat) / 749437164) [(0, 1), (12, 1), (13, 3), (15, 1)],
  term ((-125 : Rat) / 14) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((11240391924886141 : Rat) / 8703213785532) [(0, 1), (12, 1), (14, 1)],
  term ((-11240391924886141 : Rat) / 17406427571064) [(0, 1), (12, 2)],
  term ((17688540097649 : Rat) / 118411071912) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-663 : Rat) / 28) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-331543294310471 : Rat) / 133212455901) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((121 : Rat) / 3) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (12, 2), (13, 2)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (12, 2), (13, 2), (14, 1)],
  term ((1635 : Rat) / 56) [(0, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(0, 1), (12, 2), (14, 1)],
  term ((72504283220 : Rat) / 187359291) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-100 : Rat) / 7) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 3)],
  term ((117655332125 : Rat) / 749437164) [(0, 1), (12, 3), (13, 1), (15, 1)],
  term ((-125 : Rat) / 14) [(0, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-36252141610 : Rat) / 187359291) [(0, 1), (12, 3), (15, 2)],
  term ((50 : Rat) / 7) [(0, 1), (12, 3), (15, 2), (16, 1)],
  term ((11240391924886141 : Rat) / 8703213785532) [(0, 1), (13, 1), (15, 1)],
  term ((-11240391924886141 : Rat) / 17406427571064) [(0, 1), (13, 2)],
  term ((-54867625049149 : Rat) / 59205535956) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((1163 : Rat) / 14) [(0, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((663086588620942 : Rat) / 133212455901) [(0, 1), (13, 2), (15, 2)],
  term ((-242 : Rat) / 3) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((60262944536749 : Rat) / 59205535956) [(0, 1), (13, 3), (14, 1), (15, 1)],
  term ((-1399 : Rat) / 14) [(0, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-47841344565158 : Rat) / 19030350843) [(0, 1), (13, 3), (15, 1)],
  term ((121 : Rat) / 3) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (13, 4)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (13, 4), (14, 1)],
  term ((1635 : Rat) / 56) [(0, 1), (13, 4), (14, 1), (16, 1)],
  term ((163376706251516431 : Rat) / 104438565426384) [(0, 1), (14, 1)],
  term ((-163376706251516431 : Rat) / 208877130852768) [(0, 2)],
  term ((-2076886323547345 : Rat) / 26109641356596) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((46011720200948 : Rat) / 241755938487) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 2), (1, 1), (7, 1), (14, 2)],
  term ((10861008665 : Rat) / 374718582) [(0, 2), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-2791279226905 : Rat) / 6744934476) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 2), (1, 1), (9, 1), (14, 2)],
  term ((-535147519423427 : Rat) / 2175803446383) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((10 : Rat) / 7) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8 : Rat) / 7) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((107498459989867 : Rat) / 266424911802) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-415 : Rat) / 21) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((9412426570 : Rat) / 187359291) [(0, 2), (1, 1), (13, 1), (14, 2)],
  term ((-20 : Rat) / 7) [(0, 2), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1389584157001721 : Rat) / 1243316255076) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((340 : Rat) / 21) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-100872416720 : Rat) / 187359291) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((16 : Rat) / 7) [(0, 2), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 2), (1, 2), (14, 1)],
  term ((369246208469699 : Rat) / 1450535630922) [(0, 2), (2, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((56601600409522153 : Rat) / 26109641356596) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 2), (3, 1), (7, 1), (14, 2)],
  term ((2700046754119 : Rat) / 7708496544) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-2500010837845201 : Rat) / 26109641356596) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-811459086674035 : Rat) / 2131399294416) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((2095 : Rat) / 168) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17603503168604333 : Rat) / 13054820678298) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-415 : Rat) / 42) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((3759648208782605 : Rat) / 26109641356596) [(0, 2), (3, 2), (14, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 2), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((680 : Rat) / 63) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2098475275065805 : Rat) / 1450535630922) [(0, 2), (6, 1), (14, 1)],
  term ((-4282250622413135 : Rat) / 1864974382614) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((-128 : Rat) / 9) [(0, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 2), (15, 2)],
  term ((-9764046789835 : Rat) / 1927124136) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 2), (7, 1), (9, 1), (14, 2)],
  term ((8222716347836045 : Rat) / 1450535630922) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1), (14, 2)],
  term ((2801366270730439 : Rat) / 532849823604) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-325 : Rat) / 6) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((-680 : Rat) / 63) [(0, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5486832080301235 : Rat) / 967023753948) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((782 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((30720403451337119 : Rat) / 13054820678298) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((128 : Rat) / 9) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 3), (15, 1)],
  term ((-16815892616328775 : Rat) / 4351606892766) [(0, 2), (7, 2), (14, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 2), (7, 2), (14, 2)],
  term ((-10861008665 : Rat) / 107062452) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((10861008665 : Rat) / 53531226) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-10806703621675 : Rat) / 26979737904) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((115 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-183252917185 : Rat) / 749437164) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((3649940619119 : Rat) / 2997748656) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((-230 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((15277094788189 : Rat) / 3372467238) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-954789077801 : Rat) / 1498874328) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((184 : Rat) / 7) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 2), (9, 2), (12, 1), (14, 1)],
  term ((69510455456 : Rat) / 562077873) [(0, 2), (9, 2), (14, 1)],
  term ((-249803199295 : Rat) / 374718582) [(0, 2), (9, 2), (14, 2)],
  term ((-3355349785 : Rat) / 26765613) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (14 : Rat) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 53531226) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term (-5 : Rat) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-73859077229671451 : Rat) / 34812855142128) [(0, 2), (10, 1), (14, 1)],
  term ((-385961000 : Rat) / 3823659) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term (-8 : Rat) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((455993594267233 : Rat) / 1065699647208) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((395 : Rat) / 84) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((359424 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-13119677174251537 : Rat) / 2901071261844) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-107 : Rat) / 21) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((1803909535892029 : Rat) / 4351606892766) [(0, 2), (11, 2), (14, 1)],
  term ((117655332125 : Rat) / 374718582) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-125 : Rat) / 7) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1729028084357939 : Rat) / 1657755006768) [(0, 2), (12, 1), (14, 1)],
  term ((-72504283220 : Rat) / 187359291) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((100 : Rat) / 7) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-663086588620942 : Rat) / 133212455901) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((242 : Rat) / 3) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((54867625049149 : Rat) / 59205535956) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1163 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 187359291) [(0, 2), (13, 2), (14, 1)],
  term ((-831117266131 : Rat) / 1498874328) [(0, 2), (13, 2), (14, 2)],
  term ((1635 : Rat) / 28) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((-11240391924886141 : Rat) / 8703213785532) [(0, 2), (14, 1)],
  term ((11240391924886141 : Rat) / 17406427571064) [(0, 3)],
  term ((2076886323547345 : Rat) / 52219282713192) [(0, 3), (1, 1), (3, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 3), (1, 1), (6, 1), (15, 1)],
  term ((-23005860100474 : Rat) / 241755938487) [(0, 3), (1, 1), (7, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 3), (1, 1), (7, 1), (14, 1)],
  term ((2791279226905 : Rat) / 13489868952) [(0, 3), (1, 1), (9, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 3), (1, 1), (9, 1), (12, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 3), (1, 1), (9, 1), (14, 1)],
  term ((535147519423427 : Rat) / 4351606892766) [(0, 3), (1, 1), (11, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 3), (1, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 7) [(0, 3), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25218104180 : Rat) / 187359291) [(0, 3), (1, 1), (12, 1), (15, 1)],
  term ((4 : Rat) / 7) [(0, 3), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-107498459989867 : Rat) / 532849823604) [(0, 3), (1, 1), (13, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 3), (1, 1), (13, 1), (14, 1)],
  term ((10 : Rat) / 7) [(0, 3), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((415 : Rat) / 42) [(0, 3), (1, 1), (13, 1), (16, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 3), (1, 1), (14, 1), (15, 1)],
  term ((-8 : Rat) / 7) [(0, 3), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((1389584157001721 : Rat) / 2486632510152) [(0, 3), (1, 1), (15, 1)],
  term ((-170 : Rat) / 21) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(0, 3), (1, 2)],
  term ((-369246208469699 : Rat) / 2901071261844) [(0, 3), (2, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 3), (3, 1), (6, 1), (15, 1)],
  term ((-56601600409522153 : Rat) / 52219282713192) [(0, 3), (3, 1), (7, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 3), (3, 1), (7, 1), (14, 1)],
  term ((-2700046754119 : Rat) / 15416993088) [(0, 3), (3, 1), (9, 1)],
  term ((2500010837845201 : Rat) / 52219282713192) [(0, 3), (3, 1), (11, 1)],
  term ((811459086674035 : Rat) / 4262798588832) [(0, 3), (3, 1), (13, 1)],
  term ((-2095 : Rat) / 336) [(0, 3), (3, 1), (13, 1), (16, 1)],
  term ((17603503168604333 : Rat) / 26109641356596) [(0, 3), (3, 1), (15, 1)],
  term ((415 : Rat) / 84) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((-3759648208782605 : Rat) / 52219282713192) [(0, 3), (3, 2)],
  term ((-2098475275065805 : Rat) / 2901071261844) [(0, 3), (6, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 3), (6, 1), (7, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 3), (6, 1), (9, 1), (15, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 3), (6, 1), (11, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 3), (6, 1), (13, 1), (15, 1)],
  term ((-340 : Rat) / 63) [(0, 3), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 3), (6, 1), (14, 1), (15, 2)],
  term ((4282250622413135 : Rat) / 3729948765228) [(0, 3), (6, 1), (15, 2)],
  term ((64 : Rat) / 9) [(0, 3), (6, 1), (15, 2), (16, 1)],
  term ((9764046789835 : Rat) / 3854248272) [(0, 3), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 3), (7, 1), (9, 1), (14, 1)],
  term ((-8222716347836045 : Rat) / 2901071261844) [(0, 3), (7, 1), (11, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 3), (7, 1), (11, 1), (14, 1)],
  term ((-2801366270730439 : Rat) / 1065699647208) [(0, 3), (7, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 3), (7, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(0, 3), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((325 : Rat) / 12) [(0, 3), (7, 1), (13, 1), (16, 1)],
  term ((-30720403451337119 : Rat) / 26109641356596) [(0, 3), (7, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(0, 3), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 3), (7, 1), (14, 2), (15, 1)],
  term ((5486832080301235 : Rat) / 1934047507896) [(0, 3), (7, 1), (15, 1)],
  term ((-391 : Rat) / 21) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((16815892616328775 : Rat) / 8703213785532) [(0, 3), (7, 2)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 3), (7, 2), (14, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 3), (9, 1), (10, 1), (13, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 3), (9, 1), (10, 1), (15, 1)],
  term ((10806703621675 : Rat) / 53959475808) [(0, 3), (9, 1), (11, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 3), (9, 1), (12, 1), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 3), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((183252917185 : Rat) / 1498874328) [(0, 3), (9, 1), (12, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 3), (9, 1), (13, 1)],
  term ((-3649940619119 : Rat) / 5995497312) [(0, 3), (9, 1), (13, 1), (14, 1)],
  term ((115 : Rat) / 7) [(0, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((954789077801 : Rat) / 2997748656) [(0, 3), (9, 1), (14, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15277094788189 : Rat) / 6744934476) [(0, 3), (9, 1), (15, 1)],
  term ((-34755227728 : Rat) / 562077873) [(0, 3), (9, 2)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 3), (9, 2), (12, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 3), (9, 2), (14, 1)],
  term ((73859077229671451 : Rat) / 69625710284256) [(0, 3), (10, 1)],
  term ((3355349785 : Rat) / 53531226) [(0, 3), (10, 1), (13, 1), (15, 1)],
  term (-7 : Rat) [(0, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 3), (10, 1), (13, 2)],
  term ((5 : Rat) / 2) [(0, 3), (10, 1), (13, 2), (16, 1)],
  term ((192980500 : Rat) / 3823659) [(0, 3), (10, 1), (15, 2)],
  term (4 : Rat) [(0, 3), (10, 1), (15, 2), (16, 1)],
  term ((-455993594267233 : Rat) / 2131399294416) [(0, 3), (11, 1), (13, 1)],
  term ((-179712 : Rat) / 553) [(0, 3), (11, 1), (13, 1), (14, 1)],
  term ((-395 : Rat) / 168) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 3), (11, 1), (14, 1), (15, 1)],
  term ((13119677174251537 : Rat) / 5802142523688) [(0, 3), (11, 1), (15, 1)],
  term ((107 : Rat) / 42) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1803909535892029 : Rat) / 8703213785532) [(0, 3), (11, 2)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 3), (12, 1)],
  term ((-117655332125 : Rat) / 749437164) [(0, 3), (12, 1), (13, 1), (15, 1)],
  term ((125 : Rat) / 14) [(0, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((36252141610 : Rat) / 187359291) [(0, 3), (12, 1), (15, 2)],
  term ((-50 : Rat) / 7) [(0, 3), (12, 1), (15, 2), (16, 1)],
  term ((-54867625049149 : Rat) / 118411071912) [(0, 3), (13, 1), (14, 1), (15, 1)],
  term ((1163 : Rat) / 28) [(0, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((331543294310471 : Rat) / 133212455901) [(0, 3), (13, 1), (15, 1)],
  term ((-121 : Rat) / 3) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 3), (13, 2)],
  term ((831117266131 : Rat) / 2997748656) [(0, 3), (13, 2), (14, 1)],
  term ((-1635 : Rat) / 56) [(0, 3), (13, 2), (14, 1), (16, 1)],
  term ((163376706251516431 : Rat) / 104438565426384) [(1, 1), (15, 1)],
  term ((-163376706251516431 : Rat) / 208877130852768) [(1, 2)],
  term ((-163376706251516431 : Rat) / 104438565426384) [(12, 1), (14, 1)],
  term ((163376706251516431 : Rat) / 208877130852768) [(12, 2)],
  term ((-163376706251516431 : Rat) / 104438565426384) [(13, 1), (15, 1)],
  term ((163376706251516431 : Rat) / 208877130852768) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_30_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_30_0000_0099
      rs_R009_ueqv_R009YNNNN_block_30_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
