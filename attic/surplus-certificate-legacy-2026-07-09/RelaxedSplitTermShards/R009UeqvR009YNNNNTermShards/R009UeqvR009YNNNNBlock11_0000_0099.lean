/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 11:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(2, 1)],
  term (2 : Rat) [(2, 1), (6, 1)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0000 : Poly :=
[
  term ((4142841219194555 : Rat) / 5802142523688) []
]

/-- Partial product 0 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0000 : Poly :=
[
  term ((4142841219194555 : Rat) / 5802142523688) [],
  term ((-4142841219194555 : Rat) / 2901071261844) [(2, 1)],
  term ((4142841219194555 : Rat) / 2901071261844) [(2, 1), (6, 1)],
  term ((4142841219194555 : Rat) / 2901071261844) [(3, 1), (7, 1)],
  term ((-4142841219194555 : Rat) / 5802142523688) [(6, 2)],
  term ((-4142841219194555 : Rat) / 5802142523688) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0000
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0001 : Poly :=
[
  term ((-56691391963933 : Rat) / 483511876974) [(0, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0001 : Poly :=
[
  term ((-56691391963933 : Rat) / 483511876974) [(0, 1)],
  term ((56691391963933 : Rat) / 241755938487) [(0, 1), (2, 1)],
  term ((-56691391963933 : Rat) / 241755938487) [(0, 1), (2, 1), (6, 1)],
  term ((-56691391963933 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1)],
  term ((56691391963933 : Rat) / 483511876974) [(0, 1), (6, 2)],
  term ((56691391963933 : Rat) / 483511876974) [(0, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0001
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0002 : Poly :=
[
  term ((-2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0002 : Poly :=
[
  term ((-2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1)],
  term ((2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (6, 2)],
  term ((2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((-2438918030895347 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((2438918030895347 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1)],
  term ((-2438918030895347 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0002
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0003 : Poly :=
[
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0003 : Poly :=
[
  term ((-29111795873371 : Rat) / 55083631554) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (6, 2), (7, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (7, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (7, 3)],
  term ((-29111795873371 : Rat) / 55083631554) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(1, 1), (2, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0003
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0004 : Poly :=
[
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 4 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0004 : Poly :=
[
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (6, 2), (9, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (2, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0004
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0005 : Poly :=
[
  term ((13376814635594705 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 5 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0005 : Poly :=
[
  term ((13376814635594705 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-13376814635594705 : Rat) / 26109641356596) [(1, 1), (2, 1), (6, 2), (11, 1)],
  term ((-13376814635594705 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((13376814635594705 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1)],
  term ((13376814635594705 : Rat) / 13054820678298) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((-13376814635594705 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0005
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0006 : Poly :=
[
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 6 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0006 : Poly :=
[
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (2, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0006
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0007 : Poly :=
[
  term ((-985 : Rat) / 84) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0007 : Poly :=
[
  term ((-985 : Rat) / 42) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(1, 1), (2, 1), (6, 2), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(1, 1), (2, 1), (7, 2), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(1, 1), (2, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0007
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0008 : Poly :=
[
  term ((3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 8 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0008 : Poly :=
[
  term ((3479580527781145 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((-3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (15, 1)],
  term ((3479580527781145 : Rat) / 4351606892766) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((-3479580527781145 : Rat) / 4351606892766) [(1, 1), (2, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0008
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0009 : Poly :=
[
  term ((205 : Rat) / 21) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0009 : Poly :=
[
  term ((410 : Rat) / 21) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0009
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0010 : Poly :=
[
  term ((-8164662131171213 : Rat) / 13054820678298) [(1, 1), (3, 1)]
]

/-- Partial product 10 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0010 : Poly :=
[
  term ((8164662131171213 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1)],
  term ((-8164662131171213 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((-8164662131171213 : Rat) / 13054820678298) [(1, 1), (3, 1)],
  term ((8164662131171213 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 2)],
  term ((8164662131171213 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 2)],
  term ((-8164662131171213 : Rat) / 6527410339149) [(1, 1), (3, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0010
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0011 : Poly :=
[
  term ((-104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 11 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0011 : Poly :=
[
  term ((-209634918076240 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (6, 1), (10, 1)],
  term ((209634918076240 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (10, 1)],
  term ((104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 2), (10, 1)],
  term ((104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((-104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (10, 1)],
  term ((-209634918076240 : Rat) / 6527410339149) [(1, 1), (3, 2), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0011
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0012 : Poly :=
[
  term ((12586761679465087 : Rat) / 19582231017447) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 12 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0012 : Poly :=
[
  term ((25173523358930174 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((-25173523358930174 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-12586761679465087 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term ((-12586761679465087 : Rat) / 19582231017447) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((12586761679465087 : Rat) / 19582231017447) [(1, 1), (3, 1), (14, 1)],
  term ((25173523358930174 : Rat) / 19582231017447) [(1, 1), (3, 2), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0012
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0013 : Poly :=
[
  term ((1239549624292481 : Rat) / 2175803446383) [(1, 1), (7, 1)]
]

/-- Partial product 13 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0013 : Poly :=
[
  term ((2479099248584962 : Rat) / 2175803446383) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(1, 1), (2, 1), (7, 1)],
  term ((2479099248584962 : Rat) / 2175803446383) [(1, 1), (3, 1), (7, 2)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(1, 1), (6, 2), (7, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(1, 1), (7, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(1, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0013
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0014 : Poly :=
[
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 14 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0014 : Poly :=
[
  term ((29111795873371 : Rat) / 55083631554) [(1, 1), (2, 1), (6, 1), (7, 1), (10, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(1, 1), (2, 1), (7, 1), (10, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (6, 2), (7, 1), (10, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (7, 1), (10, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (7, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0014
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0015 : Poly :=
[
  term ((4474023365802280 : Rat) / 6527410339149) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 15 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0015 : Poly :=
[
  term ((8948046731604560 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 1), (6, 2), (7, 1), (14, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(1, 1), (7, 1), (14, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 1), (7, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0015
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0016 : Poly :=
[
  term ((6788130415625 : Rat) / 6744934476) [(1, 1), (9, 1)]
]

/-- Partial product 16 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0016 : Poly :=
[
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (2, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(1, 1), (2, 1), (9, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 1), (6, 2), (9, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 1), (7, 2), (9, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0016
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0017 : Poly :=
[
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 17 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0017 : Poly :=
[
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (6, 1), (9, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (9, 1), (10, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (6, 2), (9, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (7, 2), (9, 1), (10, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0017
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0018 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 18 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0018 : Poly :=
[
  term ((-13576260831250 : Rat) / 5058700857) [(1, 1), (2, 1), (6, 1), (9, 1), (14, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 1), (6, 2), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 1), (7, 2), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0018
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0019 : Poly :=
[
  term ((-2767153514147819 : Rat) / 13054820678298) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 19 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0019 : Poly :=
[
  term ((-2767153514147819 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (10, 1), (11, 1)],
  term ((2767153514147819 : Rat) / 6527410339149) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-2767153514147819 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((2767153514147819 : Rat) / 13054820678298) [(1, 1), (6, 2), (10, 1), (11, 1)],
  term ((2767153514147819 : Rat) / 13054820678298) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((-2767153514147819 : Rat) / 13054820678298) [(1, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0019
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0020 : Poly :=
[
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 20 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0020 : Poly :=
[
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (6, 2), (10, 1), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (7, 2), (10, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0020
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0021 : Poly :=
[
  term ((985 : Rat) / 84) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0021 : Poly :=
[
  term ((985 : Rat) / 42) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0021
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0022 : Poly :=
[
  term ((93219059922064 : Rat) / 2175803446383) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 22 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0022 : Poly :=
[
  term ((186438119844128 : Rat) / 2175803446383) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1)],
  term ((-186438119844128 : Rat) / 2175803446383) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((186438119844128 : Rat) / 2175803446383) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-93219059922064 : Rat) / 2175803446383) [(1, 1), (6, 2), (10, 1), (15, 1)],
  term ((-93219059922064 : Rat) / 2175803446383) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((93219059922064 : Rat) / 2175803446383) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0022
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0023 : Poly :=
[
  term ((-205 : Rat) / 21) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0023 : Poly :=
[
  term ((-410 : Rat) / 21) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0023
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0024 : Poly :=
[
  term ((-60844866110355455 : Rat) / 26109641356596) [(1, 1), (11, 1)]
]

/-- Partial product 24 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0024 : Poly :=
[
  term ((-60844866110355455 : Rat) / 13054820678298) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((60844866110355455 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1)],
  term ((-60844866110355455 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((60844866110355455 : Rat) / 26109641356596) [(1, 1), (6, 2), (11, 1)],
  term ((60844866110355455 : Rat) / 26109641356596) [(1, 1), (7, 2), (11, 1)],
  term ((-60844866110355455 : Rat) / 26109641356596) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0024
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0025 : Poly :=
[
  term ((1256180725013353 : Rat) / 1864974382614) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 25 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0025 : Poly :=
[
  term ((1256180725013353 : Rat) / 932487191307) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((-1256180725013353 : Rat) / 932487191307) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((1256180725013353 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((-1256180725013353 : Rat) / 1864974382614) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((-1256180725013353 : Rat) / 1864974382614) [(1, 1), (7, 2), (11, 1), (14, 1)],
  term ((1256180725013353 : Rat) / 1864974382614) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0025
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0026 : Poly :=
[
  term ((-280381883026811 : Rat) / 266424911802) [(1, 1), (13, 1)]
]

/-- Partial product 26 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0026 : Poly :=
[
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(1, 1), (2, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(1, 1), (6, 2), (13, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(1, 1), (7, 2), (13, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0026
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0027 : Poly :=
[
  term ((59271663677612999 : Rat) / 39164462034894) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 27 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0027 : Poly :=
[
  term ((59271663677612999 : Rat) / 19582231017447) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((-59271663677612999 : Rat) / 19582231017447) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((59271663677612999 : Rat) / 19582231017447) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((-59271663677612999 : Rat) / 39164462034894) [(1, 1), (6, 2), (13, 1), (14, 1)],
  term ((-59271663677612999 : Rat) / 39164462034894) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((59271663677612999 : Rat) / 39164462034894) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0027
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0028 : Poly :=
[
  term ((340 : Rat) / 63) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 28 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0028 : Poly :=
[
  term ((680 : Rat) / 63) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((680 : Rat) / 63) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0028
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0029 : Poly :=
[
  term ((-85 : Rat) / 21) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0029 : Poly :=
[
  term ((-170 : Rat) / 21) [(1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 21) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 21) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((85 : Rat) / 21) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0029
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0030 : Poly :=
[
  term ((-32209701640227467 : Rat) / 26109641356596) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 30 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0030 : Poly :=
[
  term ((-32209701640227467 : Rat) / 13054820678298) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((32209701640227467 : Rat) / 13054820678298) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-32209701640227467 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((32209701640227467 : Rat) / 26109641356596) [(1, 1), (6, 2), (14, 1), (15, 1)],
  term ((32209701640227467 : Rat) / 26109641356596) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term ((-32209701640227467 : Rat) / 26109641356596) [(1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0030
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0031 : Poly :=
[
  term ((-64 : Rat) / 9) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0031 : Poly :=
[
  term ((-128 : Rat) / 9) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 9) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0031
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0032 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 32 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0032 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (2, 1), (6, 1), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 2), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (7, 2), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0032
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0033 : Poly :=
[
  term ((47248697219542261 : Rat) / 26109641356596) [(1, 1), (15, 1)]
]

/-- Partial product 33 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0033 : Poly :=
[
  term ((47248697219542261 : Rat) / 13054820678298) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-47248697219542261 : Rat) / 13054820678298) [(1, 1), (2, 1), (15, 1)],
  term ((47248697219542261 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-47248697219542261 : Rat) / 26109641356596) [(1, 1), (6, 2), (15, 1)],
  term ((-47248697219542261 : Rat) / 26109641356596) [(1, 1), (7, 2), (15, 1)],
  term ((47248697219542261 : Rat) / 26109641356596) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0033
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0034 : Poly :=
[
  term ((16 : Rat) / 3) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0034 : Poly :=
[
  term ((32 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0034
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0035 : Poly :=
[
  term ((974580364564039 : Rat) / 4351606892766) [(1, 2)]
]

/-- Partial product 35 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0035 : Poly :=
[
  term ((974580364564039 : Rat) / 4351606892766) [(1, 2)],
  term ((-974580364564039 : Rat) / 2175803446383) [(1, 2), (2, 1)],
  term ((974580364564039 : Rat) / 2175803446383) [(1, 2), (2, 1), (6, 1)],
  term ((974580364564039 : Rat) / 2175803446383) [(1, 2), (3, 1), (7, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 2), (6, 2)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0035
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0036 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1)]
]

/-- Partial product 36 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0036 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (6, 2)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (7, 2)],
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0036
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0037 : Poly :=
[
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (10, 1)]
]

/-- Partial product 37 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0037 : Poly :=
[
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 1), (6, 1), (10, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 1), (10, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (6, 2), (10, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (7, 2), (10, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0037
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0038 : Poly :=
[
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (14, 1)]
]

/-- Partial product 38 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0038 : Poly :=
[
  term ((-2877876402905362 : Rat) / 6527410339149) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(1, 2), (2, 1), (14, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 2), (6, 2), (14, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 2), (7, 2), (14, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0038
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0039 : Poly :=
[
  term ((-15017764716961 : Rat) / 161170625658) [(2, 1)]
]

/-- Partial product 39 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0039 : Poly :=
[
  term ((-15017764716961 : Rat) / 161170625658) [(2, 1)],
  term ((-15017764716961 : Rat) / 80585312829) [(2, 1), (3, 1), (7, 1)],
  term ((15017764716961 : Rat) / 161170625658) [(2, 1), (6, 2)],
  term ((15017764716961 : Rat) / 161170625658) [(2, 1), (7, 2)],
  term ((15017764716961 : Rat) / 80585312829) [(2, 2)],
  term ((-15017764716961 : Rat) / 80585312829) [(2, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0039
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0040 : Poly :=
[
  term ((-29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 40 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0040 : Poly :=
[
  term ((29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (6, 2), (7, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (7, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (7, 3)],
  term ((-29111795873371 : Rat) / 55083631554) [(2, 1), (3, 2), (7, 2)],
  term ((-29111795873371 : Rat) / 55083631554) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(2, 2), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0040
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0041 : Poly :=
[
  term ((-4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 41 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0041 : Poly :=
[
  term ((4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (6, 2), (9, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (7, 2), (9, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(2, 2), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0041
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0042 : Poly :=
[
  term ((-5995055415548693 : Rat) / 5594923147842) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 42 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0042 : Poly :=
[
  term ((5995055415548693 : Rat) / 5594923147842) [(2, 1), (3, 1), (6, 2), (11, 1)],
  term ((5995055415548693 : Rat) / 5594923147842) [(2, 1), (3, 1), (7, 2), (11, 1)],
  term ((-5995055415548693 : Rat) / 5594923147842) [(2, 1), (3, 1), (11, 1)],
  term ((-5995055415548693 : Rat) / 2797461573921) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-5995055415548693 : Rat) / 2797461573921) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((5995055415548693 : Rat) / 2797461573921) [(2, 2), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0042
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0043 : Poly :=
[
  term ((26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 43 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0043 : Poly :=
[
  term ((-26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (6, 2), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (7, 2), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(2, 2), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0043
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0044 : Poly :=
[
  term ((-985 : Rat) / 84) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 44 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0044 : Poly :=
[
  term ((985 : Rat) / 84) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(2, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(2, 2), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0044
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0045 : Poly :=
[
  term ((-55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 45 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0045 : Poly :=
[
  term ((55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (6, 2), (15, 1)],
  term ((55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((-55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (15, 1)],
  term ((-55420968674520529 : Rat) / 13054820678298) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((-55420968674520529 : Rat) / 13054820678298) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((55420968674520529 : Rat) / 13054820678298) [(2, 2), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0045
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0046 : Poly :=
[
  term ((205 : Rat) / 21) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0046 : Poly :=
[
  term ((-205 : Rat) / 21) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(2, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0046
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0047 : Poly :=
[
  term ((2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2)]
]

/-- Partial product 47 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0047 : Poly :=
[
  term ((2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2), (6, 2)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2), (7, 2)],
  term ((2817638222726165 : Rat) / 1864974382614) [(2, 1), (3, 3), (7, 1)],
  term ((-2817638222726165 : Rat) / 1864974382614) [(2, 2), (3, 2)],
  term ((2817638222726165 : Rat) / 1864974382614) [(2, 2), (3, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0047
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0048 : Poly :=
[
  term ((1382044204093718 : Rat) / 932487191307) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 48 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0048 : Poly :=
[
  term ((2764088408187436 : Rat) / 932487191307) [(2, 1), (3, 1), (7, 2), (11, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(2, 1), (6, 2), (7, 1), (11, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(2, 1), (7, 1), (11, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(2, 1), (7, 3), (11, 1)],
  term ((2764088408187436 : Rat) / 932487191307) [(2, 2), (6, 1), (7, 1), (11, 1)],
  term ((-2764088408187436 : Rat) / 932487191307) [(2, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0048
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0049 : Poly :=
[
  term ((11857694119158851 : Rat) / 8703213785532) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 49 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0049 : Poly :=
[
  term ((11857694119158851 : Rat) / 4351606892766) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(2, 1), (7, 1), (15, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(2, 1), (7, 3), (15, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(2, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0049
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0050 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 50 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0050 : Poly :=
[
  term ((13576260831250 : Rat) / 5058700857) [(2, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(2, 1), (6, 2), (9, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(2, 1), (7, 2), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (9, 1), (11, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(2, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0050
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0051 : Poly :=
[
  term ((41195805866345 : Rat) / 26979737904) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 51 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0051 : Poly :=
[
  term ((41195805866345 : Rat) / 13489868952) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(2, 1), (9, 1), (15, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(2, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0051
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0052 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 52 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0052 : Poly :=
[
  term ((-1121527532107244 : Rat) / 399637367703) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(2, 1), (7, 2), (11, 1), (13, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(2, 1), (11, 1), (13, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(2, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0052
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0053 : Poly :=
[
  term ((-340 : Rat) / 63) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 53 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0053 : Poly :=
[
  term ((-680 : Rat) / 63) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((680 : Rat) / 63) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0053
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0054 : Poly :=
[
  term ((10032849595201397 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 54 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0054 : Poly :=
[
  term ((10032849595201397 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-10032849595201397 : Rat) / 26109641356596) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-10032849595201397 : Rat) / 26109641356596) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((10032849595201397 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 1)],
  term ((10032849595201397 : Rat) / 13054820678298) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((-10032849595201397 : Rat) / 13054820678298) [(2, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0054
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0055 : Poly :=
[
  term ((64 : Rat) / 9) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0055 : Poly :=
[
  term ((128 : Rat) / 9) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 9) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0055
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0056 : Poly :=
[
  term ((-3792538175468572 : Rat) / 932487191307) [(2, 1), (11, 2)]
]

/-- Partial product 56 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0056 : Poly :=
[
  term ((-7585076350937144 : Rat) / 932487191307) [(2, 1), (3, 1), (7, 1), (11, 2)],
  term ((3792538175468572 : Rat) / 932487191307) [(2, 1), (6, 2), (11, 2)],
  term ((3792538175468572 : Rat) / 932487191307) [(2, 1), (7, 2), (11, 2)],
  term ((-3792538175468572 : Rat) / 932487191307) [(2, 1), (11, 2)],
  term ((-7585076350937144 : Rat) / 932487191307) [(2, 2), (6, 1), (11, 2)],
  term ((7585076350937144 : Rat) / 932487191307) [(2, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0056
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0057 : Poly :=
[
  term ((-1679838738623195 : Rat) / 1065699647208) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 57 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0057 : Poly :=
[
  term ((-1679838738623195 : Rat) / 532849823604) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(2, 1), (13, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(2, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0057
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0058 : Poly :=
[
  term ((2615 : Rat) / 84) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0058 : Poly :=
[
  term ((2615 : Rat) / 42) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((2615 : Rat) / 42) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2615 : Rat) / 42) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0058
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0059 : Poly :=
[
  term ((80 : Rat) / 7) [(2, 1), (14, 1)]
]

/-- Partial product 59 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0059 : Poly :=
[
  term ((160 : Rat) / 7) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-80 : Rat) / 7) [(2, 1), (6, 2), (14, 1)],
  term ((-80 : Rat) / 7) [(2, 1), (7, 2), (14, 1)],
  term ((80 : Rat) / 7) [(2, 1), (14, 1)],
  term ((160 : Rat) / 7) [(2, 2), (6, 1), (14, 1)],
  term ((-160 : Rat) / 7) [(2, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0059
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0060 : Poly :=
[
  term ((5799525995670422 : Rat) / 2175803446383) [(2, 1), (15, 2)]
]

/-- Partial product 60 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0060 : Poly :=
[
  term ((11599051991340844 : Rat) / 2175803446383) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-5799525995670422 : Rat) / 2175803446383) [(2, 1), (6, 2), (15, 2)],
  term ((-5799525995670422 : Rat) / 2175803446383) [(2, 1), (7, 2), (15, 2)],
  term ((5799525995670422 : Rat) / 2175803446383) [(2, 1), (15, 2)],
  term ((11599051991340844 : Rat) / 2175803446383) [(2, 2), (6, 1), (15, 2)],
  term ((-11599051991340844 : Rat) / 2175803446383) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0060
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0061 : Poly :=
[
  term ((-503 : Rat) / 21) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0061 : Poly :=
[
  term ((-1006 : Rat) / 21) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((503 : Rat) / 21) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((503 : Rat) / 21) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-503 : Rat) / 21) [(2, 1), (15, 2), (16, 1)],
  term ((-1006 : Rat) / 21) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((1006 : Rat) / 21) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0061
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0062 : Poly :=
[
  term ((168541976108990 : Rat) / 103609687923) [(3, 1), (7, 1)]
]

/-- Partial product 62 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0062 : Poly :=
[
  term ((337083952217980 : Rat) / 103609687923) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-337083952217980 : Rat) / 103609687923) [(2, 1), (3, 1), (7, 1)],
  term ((-168541976108990 : Rat) / 103609687923) [(3, 1), (6, 2), (7, 1)],
  term ((168541976108990 : Rat) / 103609687923) [(3, 1), (7, 1)],
  term ((-168541976108990 : Rat) / 103609687923) [(3, 1), (7, 3)],
  term ((337083952217980 : Rat) / 103609687923) [(3, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0062
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0063 : Poly :=
[
  term ((-11857694119158851 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 63 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0063 : Poly :=
[
  term ((-11857694119158851 : Rat) / 4351606892766) [(2, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(2, 1), (3, 1), (7, 1), (10, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(3, 1), (6, 2), (7, 1), (10, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(3, 1), (7, 3), (10, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(3, 2), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0063
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0064 : Poly :=
[
  term ((-1239549624292481 : Rat) / 2175803446383) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 64 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0064 : Poly :=
[
  term ((-2479099248584962 : Rat) / 2175803446383) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((2479099248584962 : Rat) / 2175803446383) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(3, 1), (7, 1), (14, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 1), (7, 3), (14, 1)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(3, 2), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0064
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0065 : Poly :=
[
  term ((964333758680 : Rat) / 562077873) [(3, 1), (9, 1)]
]

/-- Partial product 65 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0065 : Poly :=
[
  term ((1928667517360 : Rat) / 562077873) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-1928667517360 : Rat) / 562077873) [(2, 1), (3, 1), (9, 1)],
  term ((-964333758680 : Rat) / 562077873) [(3, 1), (6, 2), (9, 1)],
  term ((-964333758680 : Rat) / 562077873) [(3, 1), (7, 2), (9, 1)],
  term ((964333758680 : Rat) / 562077873) [(3, 1), (9, 1)],
  term ((1928667517360 : Rat) / 562077873) [(3, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0065
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0066 : Poly :=
[
  term ((-41195805866345 : Rat) / 26979737904) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 66 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0066 : Poly :=
[
  term ((-41195805866345 : Rat) / 13489868952) [(2, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(2, 1), (3, 1), (9, 1), (10, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(3, 1), (6, 2), (9, 1), (10, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(3, 1), (7, 2), (9, 1), (10, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(3, 1), (9, 1), (10, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(3, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0066
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0067 : Poly :=
[
  term ((-6942300346505 : Rat) / 6744934476) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 67 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0067 : Poly :=
[
  term ((-6942300346505 : Rat) / 3372467238) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((6942300346505 : Rat) / 3372467238) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((6942300346505 : Rat) / 6744934476) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((6942300346505 : Rat) / 6744934476) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((-6942300346505 : Rat) / 6744934476) [(3, 1), (9, 1), (14, 1)],
  term ((-6942300346505 : Rat) / 3372467238) [(3, 2), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0067
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0068 : Poly :=
[
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 68 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0068 : Poly :=
[
  term ((-97280 : Rat) / 343) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((48640 : Rat) / 343) [(3, 1), (6, 2), (9, 1), (15, 2)],
  term ((48640 : Rat) / 343) [(3, 1), (7, 2), (9, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 2), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0068
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0069 : Poly :=
[
  term ((30815740027918235 : Rat) / 19582231017447) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 69 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0069 : Poly :=
[
  term ((61631480055836470 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-61631480055836470 : Rat) / 19582231017447) [(2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-30815740027918235 : Rat) / 19582231017447) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((-30815740027918235 : Rat) / 19582231017447) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((30815740027918235 : Rat) / 19582231017447) [(3, 1), (10, 1), (11, 1)],
  term ((61631480055836470 : Rat) / 19582231017447) [(3, 2), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0069
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0070 : Poly :=
[
  term ((1679838738623195 : Rat) / 1065699647208) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 70 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0070 : Poly :=
[
  term ((1679838738623195 : Rat) / 532849823604) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(3, 1), (6, 2), (10, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(3, 1), (7, 2), (10, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(3, 1), (10, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(3, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0070
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0071 : Poly :=
[
  term ((-2615 : Rat) / 84) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 71 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0071 : Poly :=
[
  term ((-2615 : Rat) / 42) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 42) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 42) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0071
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0072 : Poly :=
[
  term ((-3789733867666976 : Rat) / 2175803446383) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 72 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0072 : Poly :=
[
  term ((-7579467735333952 : Rat) / 2175803446383) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((7579467735333952 : Rat) / 2175803446383) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((3789733867666976 : Rat) / 2175803446383) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term ((3789733867666976 : Rat) / 2175803446383) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((-3789733867666976 : Rat) / 2175803446383) [(3, 1), (10, 1), (15, 1)],
  term ((-7579467735333952 : Rat) / 2175803446383) [(3, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0072
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0073 : Poly :=
[
  term ((503 : Rat) / 21) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0073 : Poly :=
[
  term ((1006 : Rat) / 21) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1006 : Rat) / 21) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-503 : Rat) / 21) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-503 : Rat) / 21) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((503 : Rat) / 21) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((1006 : Rat) / 21) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0073
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0074 : Poly :=
[
  term ((-112609115227989001 : Rat) / 156657848139576) [(3, 1), (11, 1)]
]

/-- Partial product 74 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0074 : Poly :=
[
  term ((-112609115227989001 : Rat) / 78328924069788) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term ((112609115227989001 : Rat) / 78328924069788) [(2, 1), (3, 1), (11, 1)],
  term ((112609115227989001 : Rat) / 156657848139576) [(3, 1), (6, 2), (11, 1)],
  term ((112609115227989001 : Rat) / 156657848139576) [(3, 1), (7, 2), (11, 1)],
  term ((-112609115227989001 : Rat) / 156657848139576) [(3, 1), (11, 1)],
  term ((-112609115227989001 : Rat) / 78328924069788) [(3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0074
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0075 : Poly :=
[
  term ((22450012487789473 : Rat) / 11189846295684) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 75 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0075 : Poly :=
[
  term ((22450012487789473 : Rat) / 5594923147842) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-22450012487789473 : Rat) / 5594923147842) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-22450012487789473 : Rat) / 11189846295684) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((-22450012487789473 : Rat) / 11189846295684) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((22450012487789473 : Rat) / 11189846295684) [(3, 1), (11, 1), (14, 1)],
  term ((22450012487789473 : Rat) / 5594923147842) [(3, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0075
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0076 : Poly :=
[
  term ((-79100872481968 : Rat) / 44404151967) [(3, 1), (13, 1)]
]

/-- Partial product 76 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0076 : Poly :=
[
  term ((-158201744963936 : Rat) / 44404151967) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((158201744963936 : Rat) / 44404151967) [(2, 1), (3, 1), (13, 1)],
  term ((79100872481968 : Rat) / 44404151967) [(3, 1), (6, 2), (13, 1)],
  term ((79100872481968 : Rat) / 44404151967) [(3, 1), (7, 2), (13, 1)],
  term ((-79100872481968 : Rat) / 44404151967) [(3, 1), (13, 1)],
  term ((-158201744963936 : Rat) / 44404151967) [(3, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0076
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0077 : Poly :=
[
  term ((52068277784494789 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 77 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0077 : Poly :=
[
  term ((52068277784494789 : Rat) / 39164462034894) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-52068277784494789 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-52068277784494789 : Rat) / 78328924069788) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((-52068277784494789 : Rat) / 78328924069788) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((52068277784494789 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)],
  term ((52068277784494789 : Rat) / 39164462034894) [(3, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0077
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0078 : Poly :=
[
  term ((85 : Rat) / 21) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 78 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0078 : Poly :=
[
  term ((170 : Rat) / 21) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 21) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((170 : Rat) / 21) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0078
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0079 : Poly :=
[
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 79 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0079 : Poly :=
[
  term ((1377280 : Rat) / 3087) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-1377280 : Rat) / 3087) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-688640 : Rat) / 3087) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((-688640 : Rat) / 3087) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)],
  term ((1377280 : Rat) / 3087) [(3, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0079
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0080 : Poly :=
[
  term ((300 : Rat) / 7) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 80 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0080 : Poly :=
[
  term ((600 : Rat) / 7) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-600 : Rat) / 7) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-300 : Rat) / 7) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-300 : Rat) / 7) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((300 : Rat) / 7) [(3, 1), (13, 1), (16, 1)],
  term ((600 : Rat) / 7) [(3, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0080
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0081 : Poly :=
[
  term ((-4536625062194987 : Rat) / 2175803446383) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 81 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0081 : Poly :=
[
  term ((-9073250124389974 : Rat) / 2175803446383) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((9073250124389974 : Rat) / 2175803446383) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((4536625062194987 : Rat) / 2175803446383) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((4536625062194987 : Rat) / 2175803446383) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-4536625062194987 : Rat) / 2175803446383) [(3, 1), (14, 1), (15, 1)],
  term ((-9073250124389974 : Rat) / 2175803446383) [(3, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0081
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0082 : Poly :=
[
  term ((-16 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0082 : Poly :=
[
  term ((-32 : Rat) / 3) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0082
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0083 : Poly :=
[
  term ((641374121843377103 : Rat) / 156657848139576) [(3, 1), (15, 1)]
]

/-- Partial product 83 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0083 : Poly :=
[
  term ((641374121843377103 : Rat) / 78328924069788) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-641374121843377103 : Rat) / 78328924069788) [(2, 1), (3, 1), (15, 1)],
  term ((-641374121843377103 : Rat) / 156657848139576) [(3, 1), (6, 2), (15, 1)],
  term ((-641374121843377103 : Rat) / 156657848139576) [(3, 1), (7, 2), (15, 1)],
  term ((641374121843377103 : Rat) / 156657848139576) [(3, 1), (15, 1)],
  term ((641374121843377103 : Rat) / 78328924069788) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0083
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0084 : Poly :=
[
  term ((-236 : Rat) / 7) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0084 : Poly :=
[
  term ((-472 : Rat) / 7) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((472 : Rat) / 7) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((236 : Rat) / 7) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((236 : Rat) / 7) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-236 : Rat) / 7) [(3, 1), (15, 1), (16, 1)],
  term ((-472 : Rat) / 7) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0084
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0085 : Poly :=
[
  term ((373760 : Rat) / 3087) [(3, 1), (15, 3)]
]

/-- Partial product 85 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0085 : Poly :=
[
  term ((747520 : Rat) / 3087) [(2, 1), (3, 1), (6, 1), (15, 3)],
  term ((-747520 : Rat) / 3087) [(2, 1), (3, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 2), (15, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (7, 2), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (15, 3)],
  term ((747520 : Rat) / 3087) [(3, 2), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0085
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0086 : Poly :=
[
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2)]
]

/-- Partial product 86 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0086 : Poly :=
[
  term ((4342565158683470 : Rat) / 2175803446383) [(2, 1), (3, 2)],
  term ((-4342565158683470 : Rat) / 2175803446383) [(2, 1), (3, 2), (6, 1)],
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2)],
  term ((2171282579341735 : Rat) / 2175803446383) [(3, 2), (6, 2)],
  term ((2171282579341735 : Rat) / 2175803446383) [(3, 2), (7, 2)],
  term ((-4342565158683470 : Rat) / 2175803446383) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0086
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0087 : Poly :=
[
  term ((6331923393017665 : Rat) / 26109641356596) [(3, 2), (10, 1)]
]

/-- Partial product 87 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0087 : Poly :=
[
  term ((6331923393017665 : Rat) / 13054820678298) [(2, 1), (3, 2), (6, 1), (10, 1)],
  term ((-6331923393017665 : Rat) / 13054820678298) [(2, 1), (3, 2), (10, 1)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(3, 2), (6, 2), (10, 1)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(3, 2), (7, 2), (10, 1)],
  term ((6331923393017665 : Rat) / 26109641356596) [(3, 2), (10, 1)],
  term ((6331923393017665 : Rat) / 13054820678298) [(3, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0087
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0088 : Poly :=
[
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (14, 1)]
]

/-- Partial product 88 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0088 : Poly :=
[
  term ((10813215080142800 : Rat) / 6527410339149) [(2, 1), (3, 2), (6, 1), (14, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(2, 1), (3, 2), (14, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 2), (14, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (7, 2), (14, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (14, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0088
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0089 : Poly :=
[
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1)]
]

/-- Partial product 89 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0089 : Poly :=
[
  term ((-1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 2)],
  term ((1994038900525423 : Rat) / 8703213785532) [(3, 1), (6, 1), (7, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (7, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0089
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0090 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1)]
]

/-- Partial product 90 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0090 : Poly :=
[
  term ((1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 1), (10, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 2), (10, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(3, 1), (6, 1), (7, 1), (10, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1), (7, 2), (10, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0090
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0091 : Poly :=
[
  term ((1532199782809 : Rat) / 107447083772) [(7, 1), (9, 1)]
]

/-- Partial product 91 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0091 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(2, 1), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(3, 1), (7, 2), (9, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(6, 2), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0091
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0092 : Poly :=
[
  term ((-12449123235323125 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 92 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0092 : Poly :=
[
  term ((-12449123235323125 : Rat) / 13054820678298) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((12449123235323125 : Rat) / 13054820678298) [(2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-12449123235323125 : Rat) / 13054820678298) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((12449123235323125 : Rat) / 26109641356596) [(6, 2), (7, 1), (10, 1), (11, 1)],
  term ((-12449123235323125 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0092
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0093 : Poly :=
[
  term ((-67426392391782787 : Rat) / 52219282713192) [(7, 1), (11, 1)]
]

/-- Partial product 93 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0093 : Poly :=
[
  term ((-67426392391782787 : Rat) / 26109641356596) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((67426392391782787 : Rat) / 26109641356596) [(2, 1), (7, 1), (11, 1)],
  term ((-67426392391782787 : Rat) / 26109641356596) [(3, 1), (7, 2), (11, 1)],
  term ((67426392391782787 : Rat) / 52219282713192) [(6, 2), (7, 1), (11, 1)],
  term ((-67426392391782787 : Rat) / 52219282713192) [(7, 1), (11, 1)],
  term ((67426392391782787 : Rat) / 52219282713192) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0093
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0094 : Poly :=
[
  term ((8192672238679723 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 94 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0094 : Poly :=
[
  term ((16385344477359446 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((16385344477359446 : Rat) / 6527410339149) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((8192672238679723 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(7, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0094
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0095 : Poly :=
[
  term ((-1532199782809 : Rat) / 322341251316) [(7, 1), (13, 1)]
]

/-- Partial product 95 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0095 : Poly :=
[
  term ((-1532199782809 : Rat) / 161170625658) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(2, 1), (7, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(3, 1), (7, 2), (13, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(6, 2), (7, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 1), (13, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0095
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0096 : Poly :=
[
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 96 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0096 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0096
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0097 : Poly :=
[
  term ((-99592985882585 : Rat) / 82625447331) [(7, 1), (15, 1)]
]

/-- Partial product 97 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0097 : Poly :=
[
  term ((-199185971765170 : Rat) / 82625447331) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((199185971765170 : Rat) / 82625447331) [(2, 1), (7, 1), (15, 1)],
  term ((-199185971765170 : Rat) / 82625447331) [(3, 1), (7, 2), (15, 1)],
  term ((99592985882585 : Rat) / 82625447331) [(6, 2), (7, 1), (15, 1)],
  term ((-99592985882585 : Rat) / 82625447331) [(7, 1), (15, 1)],
  term ((99592985882585 : Rat) / 82625447331) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0097
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0098 : Poly :=
[
  term ((-40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 98 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0098 : Poly :=
[
  term ((-40261759121155 : Rat) / 40469606856) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((40261759121155 : Rat) / 40469606856) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-40261759121155 : Rat) / 40469606856) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((40261759121155 : Rat) / 80939213712) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((40261759121155 : Rat) / 80939213712) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0098
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009YNNNN_coefficient_11_0099 : Poly :=
[
  term ((277943889830233 : Rat) / 6394197883248) [(9, 1), (11, 1)]
]

/-- Partial product 99 for generator 11. -/
def rs_R009_ueqv_R009YNNNN_partial_11_0099 : Poly :=
[
  term ((277943889830233 : Rat) / 3197098941624) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-277943889830233 : Rat) / 3197098941624) [(2, 1), (9, 1), (11, 1)],
  term ((277943889830233 : Rat) / 3197098941624) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-277943889830233 : Rat) / 6394197883248) [(6, 2), (9, 1), (11, 1)],
  term ((-277943889830233 : Rat) / 6394197883248) [(7, 2), (9, 1), (11, 1)],
  term ((277943889830233 : Rat) / 6394197883248) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 11. -/
theorem rs_R009_ueqv_R009YNNNN_partial_11_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_11_0099
        rs_R009_ueqv_R009YNNNN_generator_11_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_11_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_11_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_11_0000,
  rs_R009_ueqv_R009YNNNN_partial_11_0001,
  rs_R009_ueqv_R009YNNNN_partial_11_0002,
  rs_R009_ueqv_R009YNNNN_partial_11_0003,
  rs_R009_ueqv_R009YNNNN_partial_11_0004,
  rs_R009_ueqv_R009YNNNN_partial_11_0005,
  rs_R009_ueqv_R009YNNNN_partial_11_0006,
  rs_R009_ueqv_R009YNNNN_partial_11_0007,
  rs_R009_ueqv_R009YNNNN_partial_11_0008,
  rs_R009_ueqv_R009YNNNN_partial_11_0009,
  rs_R009_ueqv_R009YNNNN_partial_11_0010,
  rs_R009_ueqv_R009YNNNN_partial_11_0011,
  rs_R009_ueqv_R009YNNNN_partial_11_0012,
  rs_R009_ueqv_R009YNNNN_partial_11_0013,
  rs_R009_ueqv_R009YNNNN_partial_11_0014,
  rs_R009_ueqv_R009YNNNN_partial_11_0015,
  rs_R009_ueqv_R009YNNNN_partial_11_0016,
  rs_R009_ueqv_R009YNNNN_partial_11_0017,
  rs_R009_ueqv_R009YNNNN_partial_11_0018,
  rs_R009_ueqv_R009YNNNN_partial_11_0019,
  rs_R009_ueqv_R009YNNNN_partial_11_0020,
  rs_R009_ueqv_R009YNNNN_partial_11_0021,
  rs_R009_ueqv_R009YNNNN_partial_11_0022,
  rs_R009_ueqv_R009YNNNN_partial_11_0023,
  rs_R009_ueqv_R009YNNNN_partial_11_0024,
  rs_R009_ueqv_R009YNNNN_partial_11_0025,
  rs_R009_ueqv_R009YNNNN_partial_11_0026,
  rs_R009_ueqv_R009YNNNN_partial_11_0027,
  rs_R009_ueqv_R009YNNNN_partial_11_0028,
  rs_R009_ueqv_R009YNNNN_partial_11_0029,
  rs_R009_ueqv_R009YNNNN_partial_11_0030,
  rs_R009_ueqv_R009YNNNN_partial_11_0031,
  rs_R009_ueqv_R009YNNNN_partial_11_0032,
  rs_R009_ueqv_R009YNNNN_partial_11_0033,
  rs_R009_ueqv_R009YNNNN_partial_11_0034,
  rs_R009_ueqv_R009YNNNN_partial_11_0035,
  rs_R009_ueqv_R009YNNNN_partial_11_0036,
  rs_R009_ueqv_R009YNNNN_partial_11_0037,
  rs_R009_ueqv_R009YNNNN_partial_11_0038,
  rs_R009_ueqv_R009YNNNN_partial_11_0039,
  rs_R009_ueqv_R009YNNNN_partial_11_0040,
  rs_R009_ueqv_R009YNNNN_partial_11_0041,
  rs_R009_ueqv_R009YNNNN_partial_11_0042,
  rs_R009_ueqv_R009YNNNN_partial_11_0043,
  rs_R009_ueqv_R009YNNNN_partial_11_0044,
  rs_R009_ueqv_R009YNNNN_partial_11_0045,
  rs_R009_ueqv_R009YNNNN_partial_11_0046,
  rs_R009_ueqv_R009YNNNN_partial_11_0047,
  rs_R009_ueqv_R009YNNNN_partial_11_0048,
  rs_R009_ueqv_R009YNNNN_partial_11_0049,
  rs_R009_ueqv_R009YNNNN_partial_11_0050,
  rs_R009_ueqv_R009YNNNN_partial_11_0051,
  rs_R009_ueqv_R009YNNNN_partial_11_0052,
  rs_R009_ueqv_R009YNNNN_partial_11_0053,
  rs_R009_ueqv_R009YNNNN_partial_11_0054,
  rs_R009_ueqv_R009YNNNN_partial_11_0055,
  rs_R009_ueqv_R009YNNNN_partial_11_0056,
  rs_R009_ueqv_R009YNNNN_partial_11_0057,
  rs_R009_ueqv_R009YNNNN_partial_11_0058,
  rs_R009_ueqv_R009YNNNN_partial_11_0059,
  rs_R009_ueqv_R009YNNNN_partial_11_0060,
  rs_R009_ueqv_R009YNNNN_partial_11_0061,
  rs_R009_ueqv_R009YNNNN_partial_11_0062,
  rs_R009_ueqv_R009YNNNN_partial_11_0063,
  rs_R009_ueqv_R009YNNNN_partial_11_0064,
  rs_R009_ueqv_R009YNNNN_partial_11_0065,
  rs_R009_ueqv_R009YNNNN_partial_11_0066,
  rs_R009_ueqv_R009YNNNN_partial_11_0067,
  rs_R009_ueqv_R009YNNNN_partial_11_0068,
  rs_R009_ueqv_R009YNNNN_partial_11_0069,
  rs_R009_ueqv_R009YNNNN_partial_11_0070,
  rs_R009_ueqv_R009YNNNN_partial_11_0071,
  rs_R009_ueqv_R009YNNNN_partial_11_0072,
  rs_R009_ueqv_R009YNNNN_partial_11_0073,
  rs_R009_ueqv_R009YNNNN_partial_11_0074,
  rs_R009_ueqv_R009YNNNN_partial_11_0075,
  rs_R009_ueqv_R009YNNNN_partial_11_0076,
  rs_R009_ueqv_R009YNNNN_partial_11_0077,
  rs_R009_ueqv_R009YNNNN_partial_11_0078,
  rs_R009_ueqv_R009YNNNN_partial_11_0079,
  rs_R009_ueqv_R009YNNNN_partial_11_0080,
  rs_R009_ueqv_R009YNNNN_partial_11_0081,
  rs_R009_ueqv_R009YNNNN_partial_11_0082,
  rs_R009_ueqv_R009YNNNN_partial_11_0083,
  rs_R009_ueqv_R009YNNNN_partial_11_0084,
  rs_R009_ueqv_R009YNNNN_partial_11_0085,
  rs_R009_ueqv_R009YNNNN_partial_11_0086,
  rs_R009_ueqv_R009YNNNN_partial_11_0087,
  rs_R009_ueqv_R009YNNNN_partial_11_0088,
  rs_R009_ueqv_R009YNNNN_partial_11_0089,
  rs_R009_ueqv_R009YNNNN_partial_11_0090,
  rs_R009_ueqv_R009YNNNN_partial_11_0091,
  rs_R009_ueqv_R009YNNNN_partial_11_0092,
  rs_R009_ueqv_R009YNNNN_partial_11_0093,
  rs_R009_ueqv_R009YNNNN_partial_11_0094,
  rs_R009_ueqv_R009YNNNN_partial_11_0095,
  rs_R009_ueqv_R009YNNNN_partial_11_0096,
  rs_R009_ueqv_R009YNNNN_partial_11_0097,
  rs_R009_ueqv_R009YNNNN_partial_11_0098,
  rs_R009_ueqv_R009YNNNN_partial_11_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_11_0000_0099 : Poly :=
[
  term ((4142841219194555 : Rat) / 5802142523688) [],
  term ((-56691391963933 : Rat) / 483511876974) [(0, 1)],
  term ((56691391963933 : Rat) / 241755938487) [(0, 1), (2, 1)],
  term ((-56691391963933 : Rat) / 241755938487) [(0, 1), (2, 1), (6, 1)],
  term ((-56691391963933 : Rat) / 241755938487) [(0, 1), (3, 1), (7, 1)],
  term ((56691391963933 : Rat) / 483511876974) [(0, 1), (6, 2)],
  term ((56691391963933 : Rat) / 483511876974) [(0, 1), (7, 2)],
  term ((13890406231447079 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1)],
  term ((-8164662131171213 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((-209634918076240 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (6, 1), (10, 1)],
  term ((25173523358930174 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (6, 2)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((13376814635594705 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((3479580527781145 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((410 : Rat) / 21) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2230288795546790 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((209634918076240 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-25173523358930174 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-2438918030895347 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((2479099248584962 : Rat) / 2175803446383) [(1, 1), (2, 1), (6, 1), (7, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(1, 1), (2, 1), (6, 1), (7, 1), (10, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (2, 1), (6, 1), (9, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (6, 1), (9, 1), (10, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(1, 1), (2, 1), (6, 1), (9, 1), (14, 1)],
  term ((-2767153514147819 : Rat) / 6527410339149) [(1, 1), (2, 1), (6, 1), (10, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1)],
  term ((985 : Rat) / 42) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((186438119844128 : Rat) / 2175803446383) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-60844866110355455 : Rat) / 13054820678298) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((1256180725013353 : Rat) / 932487191307) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((59271663677612999 : Rat) / 19582231017447) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((680 : Rat) / 63) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((-32209701640227467 : Rat) / 13054820678298) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-128 : Rat) / 9) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (2, 1), (6, 1), (14, 2), (15, 1)],
  term ((47248697219542261 : Rat) / 13054820678298) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((32 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (6, 2), (7, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (6, 2), (9, 1)],
  term ((-13376814635594705 : Rat) / 26109641356596) [(1, 1), (2, 1), (6, 2), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term ((985 : Rat) / 84) [(1, 1), (2, 1), (6, 2), (13, 1), (16, 1)],
  term ((-3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1745175552619451 : Rat) / 1243316255076) [(1, 1), (2, 1), (7, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((-13376814635594705 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((985 : Rat) / 84) [(1, 1), (2, 1), (7, 2), (13, 1), (16, 1)],
  term ((-3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (7, 3)],
  term ((-58986138059615 : Rat) / 26979737904) [(1, 1), (2, 1), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (9, 1), (10, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((2767153514147819 : Rat) / 6527410339149) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((-186438119844128 : Rat) / 2175803446383) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((410 : Rat) / 21) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((45022182285435205 : Rat) / 8703213785532) [(1, 1), (2, 1), (11, 1)],
  term ((-1256180725013353 : Rat) / 932487191307) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((2429158799719805 : Rat) / 1065699647208) [(1, 1), (2, 1), (13, 1)],
  term ((-59271663677612999 : Rat) / 19582231017447) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-680 : Rat) / 63) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-305 : Rat) / 84) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((32209701640227467 : Rat) / 13054820678298) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((128 : Rat) / 9) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-84058652855741087 : Rat) / 26109641356596) [(1, 1), (2, 1), (15, 1)],
  term ((-19 : Rat) / 21) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((2438918030895347 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1)],
  term ((-2438918030895347 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(1, 1), (2, 2), (6, 1), (7, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((13376814635594705 : Rat) / 13054820678298) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((3479580527781145 : Rat) / 4351606892766) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((410 : Rat) / 21) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(1, 1), (2, 2), (7, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (2, 2), (9, 1)],
  term ((-13376814635594705 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (2, 2), (13, 1)],
  term ((985 : Rat) / 42) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-3479580527781145 : Rat) / 4351606892766) [(1, 1), (2, 2), (15, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-8164662131171213 : Rat) / 13054820678298) [(1, 1), (3, 1)],
  term ((8164662131171213 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 2)],
  term ((104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 2), (10, 1)],
  term ((-12586761679465087 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term ((-2767153514147819 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((985 : Rat) / 42) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((186438119844128 : Rat) / 2175803446383) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-60844866110355455 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((1256180725013353 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((59271663677612999 : Rat) / 19582231017447) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((680 : Rat) / 63) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-32209701640227467 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-128 : Rat) / 9) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1)],
  term ((47248697219542261 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((3291322517525855 : Rat) / 1864974382614) [(1, 1), (3, 1), (7, 2)],
  term ((7109130540065167 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((14257378515348593 : Rat) / 19582231017447) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((-104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (10, 1)],
  term ((12586761679465087 : Rat) / 19582231017447) [(1, 1), (3, 1), (14, 1)],
  term ((-8164662131171213 : Rat) / 6527410339149) [(1, 1), (3, 2), (7, 1)],
  term ((-209634918076240 : Rat) / 6527410339149) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((25173523358930174 : Rat) / 19582231017447) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(1, 1), (6, 2), (7, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (6, 2), (7, 1), (10, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 1), (6, 2), (7, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 1), (6, 2), (9, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (6, 2), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 1), (6, 2), (9, 1), (14, 1)],
  term ((2767153514147819 : Rat) / 13054820678298) [(1, 1), (6, 2), (10, 1), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (6, 2), (10, 1), (13, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-93219059922064 : Rat) / 2175803446383) [(1, 1), (6, 2), (10, 1), (15, 1)],
  term ((205 : Rat) / 21) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((60844866110355455 : Rat) / 26109641356596) [(1, 1), (6, 2), (11, 1)],
  term ((-1256180725013353 : Rat) / 1864974382614) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(1, 1), (6, 2), (13, 1)],
  term ((-59271663677612999 : Rat) / 39164462034894) [(1, 1), (6, 2), (13, 1), (14, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 21) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((32209701640227467 : Rat) / 26109641356596) [(1, 1), (6, 2), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (6, 2), (14, 2), (15, 1)],
  term ((-47248697219542261 : Rat) / 26109641356596) [(1, 1), (6, 2), (15, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(1, 1), (7, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (7, 1), (10, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(1, 1), (7, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 1), (7, 2), (9, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (7, 2), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 1), (7, 2), (9, 1), (14, 1)],
  term ((2767153514147819 : Rat) / 13054820678298) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (7, 2), (10, 1), (13, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-93219059922064 : Rat) / 2175803446383) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((205 : Rat) / 21) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((60844866110355455 : Rat) / 26109641356596) [(1, 1), (7, 2), (11, 1)],
  term ((-1256180725013353 : Rat) / 1864974382614) [(1, 1), (7, 2), (11, 1), (14, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(1, 1), (7, 2), (13, 1)],
  term ((-59271663677612999 : Rat) / 39164462034894) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 21) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((32209701640227467 : Rat) / 26109641356596) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (7, 2), (14, 2), (15, 1)],
  term ((-47248697219542261 : Rat) / 26109641356596) [(1, 1), (7, 2), (15, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(1, 1), (7, 3)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (7, 3), (10, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 1), (7, 3), (14, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(1, 1), (9, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (9, 1), (14, 1)],
  term ((-2767153514147819 : Rat) / 13054820678298) [(1, 1), (10, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (10, 1), (13, 1)],
  term ((985 : Rat) / 84) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((93219059922064 : Rat) / 2175803446383) [(1, 1), (10, 1), (15, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-60844866110355455 : Rat) / 26109641356596) [(1, 1), (11, 1)],
  term ((1256180725013353 : Rat) / 1864974382614) [(1, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(1, 1), (13, 1)],
  term ((59271663677612999 : Rat) / 39164462034894) [(1, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(1, 1), (13, 1), (16, 1)],
  term ((-32209701640227467 : Rat) / 26109641356596) [(1, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (14, 2), (15, 1)],
  term ((47248697219542261 : Rat) / 26109641356596) [(1, 1), (15, 1)],
  term ((16 : Rat) / 3) [(1, 1), (15, 1), (16, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 2)],
  term ((-78621566683049 : Rat) / 177616607868) [(1, 2), (2, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((974580364564039 : Rat) / 2175803446383) [(1, 2), (2, 1), (6, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 1), (6, 1), (10, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (6, 2)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (7, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 1), (10, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(1, 2), (2, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 2), (2, 2), (6, 1)],
  term ((974580364564039 : Rat) / 2175803446383) [(1, 2), (3, 1), (7, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 2), (6, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (6, 2), (10, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 2), (6, 2), (14, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 2), (7, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (7, 2), (10, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 2), (7, 2), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (10, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (14, 1)],
  term ((-4413160984099853 : Rat) / 2901071261844) [(2, 1)],
  term ((337083952217980 : Rat) / 103609687923) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(2, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((1928667517360 : Rat) / 562077873) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(2, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((-6942300346505 : Rat) / 3372467238) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((61631480055836470 : Rat) / 19582231017447) [(2, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-2615 : Rat) / 42) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7579467735333952 : Rat) / 2175803446383) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((1006 : Rat) / 21) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-112609115227989001 : Rat) / 78328924069788) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term ((22450012487789473 : Rat) / 5594923147842) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-158201744963936 : Rat) / 44404151967) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((52068277784494789 : Rat) / 39164462034894) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 21) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((1377280 : Rat) / 3087) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((600 : Rat) / 7) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-9073250124389974 : Rat) / 2175803446383) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((641374121843377103 : Rat) / 78328924069788) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-472 : Rat) / 7) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((747520 : Rat) / 3087) [(2, 1), (3, 1), (6, 1), (15, 3)],
  term ((29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (6, 2), (7, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (6, 2), (9, 1)],
  term ((5995055415548693 : Rat) / 5594923147842) [(2, 1), (3, 1), (6, 2), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (6, 2), (13, 1)],
  term ((985 : Rat) / 84) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (6, 2), (15, 1)],
  term ((-205 : Rat) / 21) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-32236802449738417 : Rat) / 8703213785532) [(2, 1), (3, 1), (7, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(2, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-680 : Rat) / 63) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((10032849595201397 : Rat) / 13054820678298) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((128 : Rat) / 9) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7585076350937144 : Rat) / 932487191307) [(2, 1), (3, 1), (7, 1), (11, 2)],
  term ((-1679838738623195 : Rat) / 532849823604) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((2615 : Rat) / 42) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2528831898788002 : Rat) / 2175803446383) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((11599051991340844 : Rat) / 2175803446383) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-1006 : Rat) / 21) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (7, 2), (9, 1)],
  term ((22579585864673309 : Rat) / 5594923147842) [(2, 1), (3, 1), (7, 2), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (7, 2), (13, 1)],
  term ((985 : Rat) / 84) [(2, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((126567133389473635 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((-205 : Rat) / 21) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (7, 3)],
  term ((-97257135567895 : Rat) / 26979737904) [(2, 1), (3, 1), (9, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(2, 1), (3, 1), (9, 1), (10, 1)],
  term ((6942300346505 : Rat) / 3372467238) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-61631480055836470 : Rat) / 19582231017447) [(2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(2, 1), (3, 1), (10, 1), (13, 1)],
  term ((2615 : Rat) / 42) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((7579467735333952 : Rat) / 2175803446383) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-1006 : Rat) / 21) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((3186482156700811 : Rat) / 8703213785532) [(2, 1), (3, 1), (11, 1)],
  term ((-22450012487789473 : Rat) / 5594923147842) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((3982945614639781 : Rat) / 1065699647208) [(2, 1), (3, 1), (13, 1)],
  term ((-52068277784494789 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 21) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1377280 : Rat) / 3087) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-8185 : Rat) / 84) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((9073250124389974 : Rat) / 2175803446383) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-403818513933469345 : Rat) / 39164462034894) [(2, 1), (3, 1), (15, 1)],
  term ((1621 : Rat) / 21) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-747520 : Rat) / 3087) [(2, 1), (3, 1), (15, 3)],
  term ((909294297003605 : Rat) / 330501789324) [(2, 1), (3, 2)],
  term ((-4342565158683470 : Rat) / 2175803446383) [(2, 1), (3, 2), (6, 1)],
  term ((6331923393017665 : Rat) / 13054820678298) [(2, 1), (3, 2), (6, 1), (10, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(2, 1), (3, 2), (6, 1), (14, 1)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2), (6, 2)],
  term ((-4681094734615 : Rat) / 13489868952) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-5995055415548693 : Rat) / 2797461573921) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-55420968674520529 : Rat) / 13054820678298) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((410 : Rat) / 21) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-33522458803061009 : Rat) / 26109641356596) [(2, 1), (3, 2), (7, 2)],
  term ((-6331923393017665 : Rat) / 13054820678298) [(2, 1), (3, 2), (10, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(2, 1), (3, 2), (14, 1)],
  term ((2817638222726165 : Rat) / 1864974382614) [(2, 1), (3, 3), (7, 1)],
  term ((5217242378529121 : Rat) / 4351606892766) [(2, 1), (6, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-12449123235323125 : Rat) / 13054820678298) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-67426392391782787 : Rat) / 26109641356596) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((16385344477359446 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-199185971765170 : Rat) / 82625447331) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-40261759121155 : Rat) / 40469606856) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((277943889830233 : Rat) / 3197098941624) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 1), (10, 1)],
  term ((2804998195241317 : Rat) / 8703213785532) [(2, 1), (6, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(2, 1), (6, 2), (7, 1), (11, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(2, 1), (6, 2), (9, 1), (11, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(2, 1), (6, 2), (10, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((340 : Rat) / 63) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-10032849595201397 : Rat) / 26109641356596) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((3792538175468572 : Rat) / 932487191307) [(2, 1), (6, 2), (11, 2)],
  term ((1679838738623195 : Rat) / 1065699647208) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-2615 : Rat) / 84) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(2, 1), (6, 2), (14, 1)],
  term ((-5799525995670422 : Rat) / 2175803446383) [(2, 1), (6, 2), (15, 2)],
  term ((503 : Rat) / 21) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(2, 1), (7, 1), (9, 1)],
  term ((12449123235323125 : Rat) / 13054820678298) [(2, 1), (7, 1), (10, 1), (11, 1)],
  term ((35374543368802297 : Rat) / 8703213785532) [(2, 1), (7, 1), (11, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(2, 1), (7, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((98515849435270273 : Rat) / 26109641356596) [(2, 1), (7, 1), (15, 1)],
  term ((15017764716961 : Rat) / 161170625658) [(2, 1), (7, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(2, 1), (7, 2), (9, 1), (11, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(2, 1), (7, 2), (11, 1), (13, 1)],
  term ((340 : Rat) / 63) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-10032849595201397 : Rat) / 26109641356596) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((3792538175468572 : Rat) / 932487191307) [(2, 1), (7, 2), (11, 2)],
  term ((1679838738623195 : Rat) / 1065699647208) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-2615 : Rat) / 84) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(2, 1), (7, 2), (14, 1)],
  term ((-5799525995670422 : Rat) / 2175803446383) [(2, 1), (7, 2), (15, 2)],
  term ((503 : Rat) / 21) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(2, 1), (7, 3), (11, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(2, 1), (7, 3), (15, 1)],
  term ((40261759121155 : Rat) / 40469606856) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((445794948093863 : Rat) / 355233215736) [(2, 1), (9, 1), (11, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(2, 1), (9, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(2, 1), (11, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((10032849595201397 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 1)],
  term ((64 : Rat) / 9) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3792538175468572 : Rat) / 932487191307) [(2, 1), (11, 2)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(2, 1), (13, 1), (15, 1)],
  term ((2615 : Rat) / 84) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 7) [(2, 1), (14, 1)],
  term ((5799525995670422 : Rat) / 2175803446383) [(2, 1), (15, 2)],
  term ((-503 : Rat) / 21) [(2, 1), (15, 2), (16, 1)],
  term ((15017764716961 : Rat) / 80585312829) [(2, 2)],
  term ((-29111795873371 : Rat) / 55083631554) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((-5995055415548693 : Rat) / 2797461573921) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-55420968674520529 : Rat) / 13054820678298) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((410 : Rat) / 21) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(2, 2), (3, 1), (7, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(2, 2), (3, 1), (9, 1)],
  term ((5995055415548693 : Rat) / 2797461573921) [(2, 2), (3, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(2, 2), (3, 1), (13, 1)],
  term ((985 : Rat) / 42) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((55420968674520529 : Rat) / 13054820678298) [(2, 2), (3, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2817638222726165 : Rat) / 1864974382614) [(2, 2), (3, 2)],
  term ((2817638222726165 : Rat) / 1864974382614) [(2, 2), (3, 2), (6, 1)],
  term ((-15017764716961 : Rat) / 80585312829) [(2, 2), (6, 1)],
  term ((2764088408187436 : Rat) / 932487191307) [(2, 2), (6, 1), (7, 1), (11, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((-680 : Rat) / 63) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((10032849595201397 : Rat) / 13054820678298) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((128 : Rat) / 9) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7585076350937144 : Rat) / 932487191307) [(2, 2), (6, 1), (11, 2)],
  term ((-1679838738623195 : Rat) / 532849823604) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((2615 : Rat) / 42) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((160 : Rat) / 7) [(2, 2), (6, 1), (14, 1)],
  term ((11599051991340844 : Rat) / 2175803446383) [(2, 2), (6, 1), (15, 2)],
  term ((-1006 : Rat) / 21) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-2764088408187436 : Rat) / 932487191307) [(2, 2), (7, 1), (11, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(2, 2), (7, 1), (15, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(2, 2), (9, 1), (11, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(2, 2), (9, 1), (15, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(2, 2), (11, 1), (13, 1)],
  term ((680 : Rat) / 63) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-10032849595201397 : Rat) / 13054820678298) [(2, 2), (11, 1), (15, 1)],
  term ((-128 : Rat) / 9) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((7585076350937144 : Rat) / 932487191307) [(2, 2), (11, 2)],
  term ((1679838738623195 : Rat) / 532849823604) [(2, 2), (13, 1), (15, 1)],
  term ((-2615 : Rat) / 42) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(2, 2), (14, 1)],
  term ((-11599051991340844 : Rat) / 2175803446383) [(2, 2), (15, 2)],
  term ((1006 : Rat) / 21) [(2, 2), (15, 2), (16, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(3, 1), (6, 1), (7, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-168541976108990 : Rat) / 103609687923) [(3, 1), (6, 2), (7, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(3, 1), (6, 2), (7, 1), (10, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term ((-964333758680 : Rat) / 562077873) [(3, 1), (6, 2), (9, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(3, 1), (6, 2), (9, 1), (10, 1)],
  term ((6942300346505 : Rat) / 6744934476) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((48640 : Rat) / 343) [(3, 1), (6, 2), (9, 1), (15, 2)],
  term ((-30815740027918235 : Rat) / 19582231017447) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(3, 1), (6, 2), (10, 1), (13, 1)],
  term ((2615 : Rat) / 84) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((3789733867666976 : Rat) / 2175803446383) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term ((-503 : Rat) / 21) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((112609115227989001 : Rat) / 156657848139576) [(3, 1), (6, 2), (11, 1)],
  term ((-22450012487789473 : Rat) / 11189846295684) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((79100872481968 : Rat) / 44404151967) [(3, 1), (6, 2), (13, 1)],
  term ((-52068277784494789 : Rat) / 78328924069788) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-688640 : Rat) / 3087) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((-300 : Rat) / 7) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((4536625062194987 : Rat) / 2175803446383) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-641374121843377103 : Rat) / 156657848139576) [(3, 1), (6, 2), (15, 1)],
  term ((236 : Rat) / 7) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 2), (15, 3)],
  term ((8862016550246275 : Rat) / 2901071261844) [(3, 1), (7, 1)],
  term ((-40261759121155 : Rat) / 40469606856) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((277943889830233 : Rat) / 3197098941624) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(3, 1), (7, 1), (14, 1)],
  term ((-7341763777293031 : Rat) / 4351606892766) [(3, 1), (7, 2), (9, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(3, 1), (7, 2), (9, 1), (10, 1)],
  term ((6942300346505 : Rat) / 6744934476) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((48640 : Rat) / 343) [(3, 1), (7, 2), (9, 1), (15, 2)],
  term ((-98978849761805845 : Rat) / 39164462034894) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(3, 1), (7, 2), (10, 1), (13, 1)],
  term ((2615 : Rat) / 84) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((3789733867666976 : Rat) / 2175803446383) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((-503 : Rat) / 21) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-291949239122707721 : Rat) / 156657848139576) [(3, 1), (7, 2), (11, 1)],
  term ((39474046313787041 : Rat) / 78328924069788) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((7710516109097021 : Rat) / 4351606892766) [(3, 1), (7, 2), (13, 1)],
  term ((-104267259985231801 : Rat) / 78328924069788) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-688640 : Rat) / 3087) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((-300 : Rat) / 7) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((4536625062194987 : Rat) / 2175803446383) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((16 : Rat) / 3) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1019030724310139423 : Rat) / 156657848139576) [(3, 1), (7, 2), (15, 1)],
  term ((236 : Rat) / 7) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (7, 2), (15, 3)],
  term ((-168541976108990 : Rat) / 103609687923) [(3, 1), (7, 3)],
  term ((11857694119158851 : Rat) / 8703213785532) [(3, 1), (7, 3), (10, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 1), (7, 3), (14, 1)],
  term ((964333758680 : Rat) / 562077873) [(3, 1), (9, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(3, 1), (9, 1), (10, 1)],
  term ((-6942300346505 : Rat) / 6744934476) [(3, 1), (9, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (15, 2)],
  term ((30815740027918235 : Rat) / 19582231017447) [(3, 1), (10, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(3, 1), (10, 1), (13, 1)],
  term ((-2615 : Rat) / 84) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3789733867666976 : Rat) / 2175803446383) [(3, 1), (10, 1), (15, 1)],
  term ((503 : Rat) / 21) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-112609115227989001 : Rat) / 156657848139576) [(3, 1), (11, 1)],
  term ((22450012487789473 : Rat) / 11189846295684) [(3, 1), (11, 1), (14, 1)],
  term ((-79100872481968 : Rat) / 44404151967) [(3, 1), (13, 1)],
  term ((52068277784494789 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)],
  term ((85 : Rat) / 21) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)],
  term ((300 : Rat) / 7) [(3, 1), (13, 1), (16, 1)],
  term ((-4536625062194987 : Rat) / 2175803446383) [(3, 1), (14, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((641374121843377103 : Rat) / 156657848139576) [(3, 1), (15, 1)],
  term ((-236 : Rat) / 7) [(3, 1), (15, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (15, 3)],
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2)],
  term ((2171282579341735 : Rat) / 2175803446383) [(3, 2), (6, 2)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(3, 2), (6, 2), (10, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 2), (14, 1)],
  term ((1928667517360 : Rat) / 562077873) [(3, 2), (7, 1), (9, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(3, 2), (7, 1), (9, 1), (10, 1)],
  term ((-6942300346505 : Rat) / 3372467238) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((61631480055836470 : Rat) / 19582231017447) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((-2615 : Rat) / 42) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7579467735333952 : Rat) / 2175803446383) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term ((1006 : Rat) / 21) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-112609115227989001 : Rat) / 78328924069788) [(3, 2), (7, 1), (11, 1)],
  term ((22450012487789473 : Rat) / 5594923147842) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-158201744963936 : Rat) / 44404151967) [(3, 2), (7, 1), (13, 1)],
  term ((52068277784494789 : Rat) / 39164462034894) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 21) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1377280 : Rat) / 3087) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((600 : Rat) / 7) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-9073250124389974 : Rat) / 2175803446383) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((641374121843377103 : Rat) / 78328924069788) [(3, 2), (7, 1), (15, 1)],
  term ((-472 : Rat) / 7) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((747520 : Rat) / 3087) [(3, 2), (7, 1), (15, 3)],
  term ((9250045575919315 : Rat) / 2175803446383) [(3, 2), (7, 2)],
  term ((-77478088107970771 : Rat) / 26109641356596) [(3, 2), (7, 2), (10, 1)],
  term ((-1834843612260898 : Rat) / 932487191307) [(3, 2), (7, 2), (14, 1)],
  term ((6331923393017665 : Rat) / 26109641356596) [(3, 2), (10, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (14, 1)],
  term ((-4342565158683470 : Rat) / 2175803446383) [(3, 3), (7, 1)],
  term ((6331923393017665 : Rat) / 13054820678298) [(3, 3), (7, 1), (10, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(3, 3), (7, 1), (14, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (7, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1), (7, 2), (10, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1)],
  term ((-4142841219194555 : Rat) / 5802142523688) [(6, 2)],
  term ((-1532199782809 : Rat) / 107447083772) [(6, 2), (7, 1), (9, 1)],
  term ((12449123235323125 : Rat) / 26109641356596) [(6, 2), (7, 1), (10, 1), (11, 1)],
  term ((67426392391782787 : Rat) / 52219282713192) [(6, 2), (7, 1), (11, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(6, 2), (7, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((99592985882585 : Rat) / 82625447331) [(6, 2), (7, 1), (15, 1)],
  term ((40261759121155 : Rat) / 80939213712) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-277943889830233 : Rat) / 6394197883248) [(6, 2), (9, 1), (11, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 3)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 3), (10, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(7, 1), (9, 1)],
  term ((-12449123235323125 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1)],
  term ((-67426392391782787 : Rat) / 52219282713192) [(7, 1), (11, 1)],
  term ((8192672238679723 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1)],
  term ((-99592985882585 : Rat) / 82625447331) [(7, 1), (15, 1)],
  term ((-4142841219194555 : Rat) / 5802142523688) [(7, 2)],
  term ((40261759121155 : Rat) / 80939213712) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-277943889830233 : Rat) / 6394197883248) [(7, 2), (9, 1), (11, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(7, 3), (9, 1)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 3), (10, 1), (11, 1)],
  term ((67426392391782787 : Rat) / 52219282713192) [(7, 3), (11, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(7, 3), (11, 1), (14, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(7, 3), (13, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 3), (13, 1), (14, 1)],
  term ((99592985882585 : Rat) / 82625447331) [(7, 3), (15, 1)],
  term ((-40261759121155 : Rat) / 80939213712) [(9, 1), (10, 1), (11, 1)],
  term ((277943889830233 : Rat) / 6394197883248) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_11_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_11_0000_0099
      rs_R009_ueqv_R009YNNNN_block_11_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
