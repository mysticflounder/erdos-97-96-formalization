/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 26:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_26_0100_0199 : Poly :=
[
  term (2 : Rat) [(8, 1), (12, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0100 : Poly :=
[
  term ((10270818070089839739 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0100 : Poly :=
[
  term ((10270818070089839739 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10270818070089839739 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((10270818070089839739 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10270818070089839739 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0100_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0100
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0101 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0101 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0101_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0101
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0102 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0102 : Poly :=
[
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 2), (10, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0102_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0102
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0103 : Poly :=
[
  term ((-4136349421759544865 : Rat) / 443343895359507968) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 103 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0103 : Poly :=
[
  term ((-4136349421759544865 : Rat) / 221671947679753984) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((4136349421759544865 : Rat) / 443343895359507968) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((-4136349421759544865 : Rat) / 221671947679753984) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((4136349421759544865 : Rat) / 443343895359507968) [(3, 1), (5, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0103_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0103
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0104 : Poly :=
[
  term ((-211246121880690055839 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0104 : Poly :=
[
  term ((-211246121880690055839 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((211246121880690055839 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-211246121880690055839 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((211246121880690055839 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0104_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0104
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0105 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 105 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0105 : Poly :=
[
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 2), (11, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0105_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0105
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0106 : Poly :=
[
  term ((3641703605988597 : Rat) / 10744303586518688) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0106 : Poly :=
[
  term ((3641703605988597 : Rat) / 5372151793259344) [(3, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 10744303586518688) [(3, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 5372151793259344) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 10744303586518688) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0106_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0106
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0107 : Poly :=
[
  term ((-105609404573669313 : Rat) / 75210125105630816) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0107 : Poly :=
[
  term ((-105609404573669313 : Rat) / 37605062552815408) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((105609404573669313 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((-105609404573669313 : Rat) / 37605062552815408) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((105609404573669313 : Rat) / 75210125105630816) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0107_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0107
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0108 : Poly :=
[
  term ((-5488210493458347261 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 108 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0108 : Poly :=
[
  term ((-5488210493458347261 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((5488210493458347261 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((-5488210493458347261 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((5488210493458347261 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0108_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0108
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0109 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0109 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0109_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0109
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0110 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 110 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0110 : Poly :=
[
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (8, 2), (11, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0110_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0110
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0111 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0111 : Poly :=
[
  term ((-921238143868634625 : Rat) / 5965675645772416) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 5965675645772416) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0111_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0111
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0112 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (15, 4), (16, 1)]
]

/-- Partial product 112 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0112 : Poly :=
[
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (8, 2), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0112_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0112
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0113 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0113 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0113_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0113
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0114 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0114 : Poly :=
[
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0114_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0114
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0115 : Poly :=
[
  term ((-320032617216188139077 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 115 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0115 : Poly :=
[
  term ((-320032617216188139077 : Rat) / 526470875739415712) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((320032617216188139077 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-320032617216188139077 : Rat) / 526470875739415712) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((320032617216188139077 : Rat) / 1052941751478831424) [(3, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0115_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0115
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0116 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0116 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0116_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0116
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0117 : Poly :=
[
  term ((-792038122205226483 : Rat) / 11931351291544832) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0117 : Poly :=
[
  term ((-792038122205226483 : Rat) / 5965675645772416) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((792038122205226483 : Rat) / 11931351291544832) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-792038122205226483 : Rat) / 5965675645772416) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((792038122205226483 : Rat) / 11931351291544832) [(3, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0117_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0117
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0118 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 118 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0118 : Poly :=
[
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0118_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0118
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0119 : Poly :=
[
  term ((121178165322538353 : Rat) / 75210125105630816) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0119 : Poly :=
[
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0119_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0119
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0120 : Poly :=
[
  term ((1508814845369768907 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0120 : Poly :=
[
  term ((1508814845369768907 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1508814845369768907 : Rat) / 2105883502957662848) [(3, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1508814845369768907 : Rat) / 1052941751478831424) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1508814845369768907 : Rat) / 2105883502957662848) [(3, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0120_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0120
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0121 : Poly :=
[
  term ((-111265474525641 : Rat) / 852239377967488) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0121 : Poly :=
[
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0121_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0121
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0122 : Poly :=
[
  term ((-437825119271628 : Rat) / 46606840982597) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0122 : Poly :=
[
  term ((-875650238543256 : Rat) / 46606840982597) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((437825119271628 : Rat) / 46606840982597) [(3, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-875650238543256 : Rat) / 46606840982597) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((437825119271628 : Rat) / 46606840982597) [(3, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0122_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0122
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0123 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0123 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0123_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0123
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0124 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0124 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0124_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0124
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0125 : Poly :=
[
  term ((483471987809343275445 : Rat) / 4211767005915325696) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 125 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0125 : Poly :=
[
  term ((483471987809343275445 : Rat) / 2105883502957662848) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 4211767005915325696) [(3, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((483471987809343275445 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-483471987809343275445 : Rat) / 4211767005915325696) [(3, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0125_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0125
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0126 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 126 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0126 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0126_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0126
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0127 : Poly :=
[
  term ((69527544276797127 : Rat) / 2982837822886208) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0127 : Poly :=
[
  term ((69527544276797127 : Rat) / 1491418911443104) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 2982837822886208) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 1491418911443104) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-69527544276797127 : Rat) / 2982837822886208) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0127_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0127
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0128 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 128 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0128 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (10, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 2), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0128_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0128
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0129 : Poly :=
[
  term ((-121178165322538353 : Rat) / 10744303586518688) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0129 : Poly :=
[
  term ((-121178165322538353 : Rat) / 5372151793259344) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 10744303586518688) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 5372151793259344) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 10744303586518688) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0129_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0129
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0130 : Poly :=
[
  term ((119889289681480769169 : Rat) / 1052941751478831424) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0130 : Poly :=
[
  term ((119889289681480769169 : Rat) / 526470875739415712) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-119889289681480769169 : Rat) / 1052941751478831424) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((119889289681480769169 : Rat) / 526470875739415712) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-119889289681480769169 : Rat) / 1052941751478831424) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0130_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0130
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0131 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 131 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0131 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (11, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 2), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0131_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0131
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0132 : Poly :=
[
  term ((115417662713842088575 : Rat) / 2105883502957662848) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 132 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0132 : Poly :=
[
  term ((115417662713842088575 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-115417662713842088575 : Rat) / 2105883502957662848) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((115417662713842088575 : Rat) / 1052941751478831424) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-115417662713842088575 : Rat) / 2105883502957662848) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0132_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0132
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0133 : Poly :=
[
  term ((1228626950032067571841 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0133 : Poly :=
[
  term ((1228626950032067571841 : Rat) / 2105883502957662848) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1228626950032067571841 : Rat) / 4211767005915325696) [(3, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((1228626950032067571841 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1228626950032067571841 : Rat) / 4211767005915325696) [(3, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0133_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0133
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0134 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 134 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0134 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (11, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 2), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0134_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0134
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0135 : Poly :=
[
  term ((111265474525641 : Rat) / 121748482566784) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 135 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0135 : Poly :=
[
  term ((111265474525641 : Rat) / 60874241283392) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 121748482566784) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 60874241283392) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 121748482566784) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0135_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0135
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0136 : Poly :=
[
  term ((89926400463120469 : Rat) / 11931351291544832) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0136 : Poly :=
[
  term ((89926400463120469 : Rat) / 5965675645772416) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-89926400463120469 : Rat) / 11931351291544832) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((89926400463120469 : Rat) / 5965675645772416) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-89926400463120469 : Rat) / 11931351291544832) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0136_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0136
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0137 : Poly :=
[
  term ((-3226698761243589 : Rat) / 852239377967488) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 137 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0137 : Poly :=
[
  term ((-3226698761243589 : Rat) / 426119688983744) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((3226698761243589 : Rat) / 852239377967488) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((-3226698761243589 : Rat) / 426119688983744) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((3226698761243589 : Rat) / 852239377967488) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0137_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0137
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0138 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0138 : Poly :=
[
  term ((-10925110817965791 : Rat) / 37605062552815408) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0138_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0138
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0139 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0139 : Poly :=
[
  term ((363534495967615059 : Rat) / 37605062552815408) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0139_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0139
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0140 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 140 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0140 : Poly :=
[
  term ((-333796423576923 : Rat) / 426119688983744) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(3, 2), (8, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(3, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0140_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0140
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0141 : Poly :=
[
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 141 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0141 : Poly :=
[
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0141_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0141
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0142 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0142 : Poly :=
[
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0142_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0142
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0143 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0143 : Poly :=
[
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0143_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0143
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0144 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 144 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0144 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0144_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0144
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0145 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 145 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0145 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0145_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0145
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0146 : Poly :=
[
  term ((67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 146 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0146 : Poly :=
[
  term ((67569431847536233917 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((-67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((67569431847536233917 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0146_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0146
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0147 : Poly :=
[
  term ((-2394288453114688779 : Rat) / 65808859467426964) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0147 : Poly :=
[
  term ((-2394288453114688779 : Rat) / 32904429733713482) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2394288453114688779 : Rat) / 65808859467426964) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2394288453114688779 : Rat) / 32904429733713482) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((2394288453114688779 : Rat) / 65808859467426964) [(5, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0147_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0147
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0148 : Poly :=
[
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 148 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0148 : Poly :=
[
  term ((25147896414168381129 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0148_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0148
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0149 : Poly :=
[
  term ((-72827507826175085451 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0149 : Poly :=
[
  term ((-72827507826175085451 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((72827507826175085451 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72827507826175085451 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((72827507826175085451 : Rat) / 4211767005915325696) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0149_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0149
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0150 : Poly :=
[
  term ((-203492515558960879305 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0150 : Poly :=
[
  term ((-203492515558960879305 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((203492515558960879305 : Rat) / 16847068023661302784) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-203492515558960879305 : Rat) / 8423534011830651392) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((203492515558960879305 : Rat) / 16847068023661302784) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0150_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0150
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0151 : Poly :=
[
  term ((178872171380073971187 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0151 : Poly :=
[
  term ((178872171380073971187 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-178872171380073971187 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((178872171380073971187 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-178872171380073971187 : Rat) / 8423534011830651392) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0151_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0151
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0152 : Poly :=
[
  term ((-36506323680071491005 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 152 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0152 : Poly :=
[
  term ((-36506323680071491005 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((36506323680071491005 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-36506323680071491005 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((36506323680071491005 : Rat) / 33694136047322605568) [(5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0152_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0152
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0153 : Poly :=
[
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 153 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0153 : Poly :=
[
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 3), (13, 2), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0153_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0153
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0154 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0154 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 263235437869707856) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 263235437869707856) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0154_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0154
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0155 : Poly :=
[
  term ((100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 155 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0155 : Poly :=
[
  term ((100963211346141388395 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((100963211346141388395 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0155_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0155
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0156 : Poly :=
[
  term ((-2796571541588754495 : Rat) / 1052941751478831424) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0156 : Poly :=
[
  term ((-2796571541588754495 : Rat) / 526470875739415712) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2796571541588754495 : Rat) / 1052941751478831424) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2796571541588754495 : Rat) / 526470875739415712) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2796571541588754495 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0156_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0156
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0157 : Poly :=
[
  term ((-20734671327282335259 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0157 : Poly :=
[
  term ((-20734671327282335259 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((20734671327282335259 : Rat) / 16847068023661302784) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20734671327282335259 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((20734671327282335259 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0157_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0157
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0158 : Poly :=
[
  term ((874307256106446507873 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 158 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0158 : Poly :=
[
  term ((874307256106446507873 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-874307256106446507873 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((874307256106446507873 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-874307256106446507873 : Rat) / 33694136047322605568) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0158_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0158
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0159 : Poly :=
[
  term ((-200212667625243561 : Rat) / 63334842194215424) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 159 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0159 : Poly :=
[
  term ((-200212667625243561 : Rat) / 31667421097107712) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((200212667625243561 : Rat) / 63334842194215424) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-200212667625243561 : Rat) / 31667421097107712) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((200212667625243561 : Rat) / 63334842194215424) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0159_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0159
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0160 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0160 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0160_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0160
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0161 : Poly :=
[
  term ((-18080505697274733025 : Rat) / 1773375581438031872) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 161 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0161 : Poly :=
[
  term ((-18080505697274733025 : Rat) / 886687790719015936) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((18080505697274733025 : Rat) / 1773375581438031872) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-18080505697274733025 : Rat) / 886687790719015936) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((18080505697274733025 : Rat) / 1773375581438031872) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0161_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0161
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0162 : Poly :=
[
  term ((1943865981682197925477 : Rat) / 67388272094645211136) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0162 : Poly :=
[
  term ((1943865981682197925477 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1943865981682197925477 : Rat) / 67388272094645211136) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((1943865981682197925477 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1943865981682197925477 : Rat) / 67388272094645211136) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0162_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0162
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0163 : Poly :=
[
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0163 : Poly :=
[
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0163_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0163
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0164 : Poly :=
[
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 164 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0164 : Poly :=
[
  term ((-711968041840092767 : Rat) / 23862702583089664) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-711968041840092767 : Rat) / 23862702583089664) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0164_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0164
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0165 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0165 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0165_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0165
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0166 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 166 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0166 : Poly :=
[
  term ((-70302592550481639 : Rat) / 1491418911443104) [(7, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 1491418911443104) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0166_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0166
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0167 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 167 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0167 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 75811806106475862528) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 75811806106475862528) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0167_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0167
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0168 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0168 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0168_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0168
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0169 : Poly :=
[
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0169 : Poly :=
[
  term ((3728508138334321 : Rat) / 319589766737808) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 319589766737808) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0169_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0169
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0170 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 170 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0170 : Poly :=
[
  term ((1353319841726368049 : Rat) / 11931351291544832) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 11931351291544832) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0170_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0170
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0171 : Poly :=
[
  term ((-3157579497405045811529 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 171 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0171 : Poly :=
[
  term ((-3157579497405045811529 : Rat) / 18952951526618965632) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3157579497405045811529 : Rat) / 37905903053237931264) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3157579497405045811529 : Rat) / 18952951526618965632) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3157579497405045811529 : Rat) / 37905903053237931264) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0171_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0171
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0172 : Poly :=
[
  term ((8939487312665387828669 : Rat) / 18952951526618965632) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0172 : Poly :=
[
  term ((8939487312665387828669 : Rat) / 9476475763309482816) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8939487312665387828669 : Rat) / 18952951526618965632) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((8939487312665387828669 : Rat) / 9476475763309482816) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8939487312665387828669 : Rat) / 18952951526618965632) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0172_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0172
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0173 : Poly :=
[
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 173 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0173 : Poly :=
[
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(8, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0173_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0173
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0174 : Poly :=
[
  term ((-328267947403827685 : Rat) / 23862702583089664) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0174 : Poly :=
[
  term ((-328267947403827685 : Rat) / 11931351291544832) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((328267947403827685 : Rat) / 23862702583089664) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-328267947403827685 : Rat) / 11931351291544832) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((328267947403827685 : Rat) / 23862702583089664) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0174_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0174
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0175 : Poly :=
[
  term ((1067342596938727105 : Rat) / 11931351291544832) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 175 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0175 : Poly :=
[
  term ((1067342596938727105 : Rat) / 5965675645772416) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1067342596938727105 : Rat) / 11931351291544832) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((1067342596938727105 : Rat) / 5965675645772416) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1067342596938727105 : Rat) / 11931351291544832) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0175_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0175
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0176 : Poly :=
[
  term ((71367716807167 : Rat) / 1704478755934976) [(8, 1), (16, 1)]
]

/-- Partial product 176 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0176 : Poly :=
[
  term ((71367716807167 : Rat) / 852239377967488) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-71367716807167 : Rat) / 1704478755934976) [(8, 1), (9, 2), (16, 1)],
  term ((71367716807167 : Rat) / 852239377967488) [(8, 2), (12, 1), (16, 1)],
  term ((-71367716807167 : Rat) / 1704478755934976) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0176_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0176
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0177 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 177 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0177 : Poly :=
[
  term ((349947488033723 : Rat) / 213059844491872) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0177_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0177
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0178 : Poly :=
[
  term ((-349947488033723 : Rat) / 213059844491872) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0178 : Poly :=
[
  term ((-349947488033723 : Rat) / 106529922245936) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 106529922245936) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0178_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0178
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0179 : Poly :=
[
  term ((11368546718773356587 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0179 : Poly :=
[
  term ((11368546718773356587 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11368546718773356587 : Rat) / 8423534011830651392) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11368546718773356587 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11368546718773356587 : Rat) / 8423534011830651392) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0179_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0179
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0180 : Poly :=
[
  term ((152740856852388657547 : Rat) / 4211767005915325696) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 180 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0180 : Poly :=
[
  term ((152740856852388657547 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-152740856852388657547 : Rat) / 4211767005915325696) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((152740856852388657547 : Rat) / 2105883502957662848) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-152740856852388657547 : Rat) / 4211767005915325696) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0180_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0180
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0181 : Poly :=
[
  term ((-335207456333016911033 : Rat) / 151623612212951725056) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 181 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0181 : Poly :=
[
  term ((-335207456333016911033 : Rat) / 75811806106475862528) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((335207456333016911033 : Rat) / 151623612212951725056) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-335207456333016911033 : Rat) / 75811806106475862528) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((335207456333016911033 : Rat) / 151623612212951725056) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0181_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0181
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0182 : Poly :=
[
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 182 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0182 : Poly :=
[
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (13, 2), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(9, 3), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0182_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0182
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0183 : Poly :=
[
  term ((100911032203905998999 : Rat) / 6317650508872988544) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0183 : Poly :=
[
  term ((100911032203905998999 : Rat) / 3158825254436494272) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-100911032203905998999 : Rat) / 6317650508872988544) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((100911032203905998999 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-100911032203905998999 : Rat) / 6317650508872988544) [(9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0183_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0183
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0184 : Poly :=
[
  term ((215268440529795673 : Rat) / 11931351291544832) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 184 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0184 : Poly :=
[
  term ((215268440529795673 : Rat) / 5965675645772416) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-215268440529795673 : Rat) / 11931351291544832) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((215268440529795673 : Rat) / 5965675645772416) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-215268440529795673 : Rat) / 11931351291544832) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0184_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0184
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0185 : Poly :=
[
  term ((-262673491014887 : Rat) / 1278359066951232) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 185 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0185 : Poly :=
[
  term ((-262673491014887 : Rat) / 639179533475616) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((262673491014887 : Rat) / 1278359066951232) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-262673491014887 : Rat) / 639179533475616) [(9, 2), (13, 2), (16, 1)],
  term ((262673491014887 : Rat) / 1278359066951232) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0185_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0185
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0186 : Poly :=
[
  term ((-178591182474187835 : Rat) / 143176215498537984) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0186 : Poly :=
[
  term ((-178591182474187835 : Rat) / 71588107749268992) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((178591182474187835 : Rat) / 143176215498537984) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-178591182474187835 : Rat) / 71588107749268992) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((178591182474187835 : Rat) / 143176215498537984) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0186_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0186
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0187 : Poly :=
[
  term ((-167015408479822159 : Rat) / 5965675645772416) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 187 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0187 : Poly :=
[
  term ((-167015408479822159 : Rat) / 2982837822886208) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((167015408479822159 : Rat) / 5965675645772416) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-167015408479822159 : Rat) / 2982837822886208) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((167015408479822159 : Rat) / 5965675645772416) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0187_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0187
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0188 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 188 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0188 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (13, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 4), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0188_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0188
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0189 : Poly :=
[
  term ((41469041122357166957 : Rat) / 263235437869707856) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0189 : Poly :=
[
  term ((41469041122357166957 : Rat) / 131617718934853928) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 131617718934853928) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0189_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0189
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0190 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0190 : Poly :=
[
  term ((-23088038262747441 : Rat) / 372854727860776) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (13, 2), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0190_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0190
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0191 : Poly :=
[
  term ((23088038262747441 : Rat) / 372854727860776) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 191 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0191 : Poly :=
[
  term ((23088038262747441 : Rat) / 186427363930388) [(8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 186427363930388) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0191_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0191
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0192 : Poly :=
[
  term ((-1952880645780243182111 : Rat) / 25270602035491954176) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 192 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0192 : Poly :=
[
  term ((-1952880645780243182111 : Rat) / 12635301017745977088) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 12635301017745977088) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0192_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0192
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0193 : Poly :=
[
  term ((1962752665438333421 : Rat) / 49356644600570223) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0193 : Poly :=
[
  term ((3925505330876666842 : Rat) / 49356644600570223) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1962752665438333421 : Rat) / 49356644600570223) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3925505330876666842 : Rat) / 49356644600570223) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1962752665438333421 : Rat) / 49356644600570223) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0193_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0193
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0194 : Poly :=
[
  term ((-104711860146981725 : Rat) / 5965675645772416) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0194 : Poly :=
[
  term ((-104711860146981725 : Rat) / 2982837822886208) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((104711860146981725 : Rat) / 5965675645772416) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-104711860146981725 : Rat) / 2982837822886208) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((104711860146981725 : Rat) / 5965675645772416) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0194_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0194
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0195 : Poly :=
[
  term ((17592157935092299 : Rat) / 1491418911443104) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 195 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0195 : Poly :=
[
  term ((17592157935092299 : Rat) / 745709455721552) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17592157935092299 : Rat) / 1491418911443104) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((17592157935092299 : Rat) / 745709455721552) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17592157935092299 : Rat) / 1491418911443104) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0195_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0195
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0196 : Poly :=
[
  term ((101644522824340659 : Rat) / 11931351291544832) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 196 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0196 : Poly :=
[
  term ((101644522824340659 : Rat) / 5965675645772416) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101644522824340659 : Rat) / 11931351291544832) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((101644522824340659 : Rat) / 5965675645772416) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-101644522824340659 : Rat) / 11931351291544832) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0196_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0196
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0197 : Poly :=
[
  term ((11126242500098293990585 : Rat) / 151623612212951725056) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 197 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0197 : Poly :=
[
  term ((11126242500098293990585 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11126242500098293990585 : Rat) / 151623612212951725056) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((11126242500098293990585 : Rat) / 75811806106475862528) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-11126242500098293990585 : Rat) / 151623612212951725056) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0197_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0197
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0198 : Poly :=
[
  term ((-104909466824635839050807 : Rat) / 303247224425903450112) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0198 : Poly :=
[
  term ((-104909466824635839050807 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((104909466824635839050807 : Rat) / 303247224425903450112) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-104909466824635839050807 : Rat) / 151623612212951725056) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((104909466824635839050807 : Rat) / 303247224425903450112) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0198_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0198
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0199 : Poly :=
[
  term ((-1150030796077686731 : Rat) / 23862702583089664) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 199 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0199 : Poly :=
[
  term ((-1150030796077686731 : Rat) / 11931351291544832) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1150030796077686731 : Rat) / 23862702583089664) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1150030796077686731 : Rat) / 11931351291544832) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1150030796077686731 : Rat) / 23862702583089664) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0199_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0199
        rs_R010_ueqv_R010NYY_generator_26_0100_0199 =
      rs_R010_ueqv_R010NYY_partial_26_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_26_0100_0199 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_26_0100,
  rs_R010_ueqv_R010NYY_partial_26_0101,
  rs_R010_ueqv_R010NYY_partial_26_0102,
  rs_R010_ueqv_R010NYY_partial_26_0103,
  rs_R010_ueqv_R010NYY_partial_26_0104,
  rs_R010_ueqv_R010NYY_partial_26_0105,
  rs_R010_ueqv_R010NYY_partial_26_0106,
  rs_R010_ueqv_R010NYY_partial_26_0107,
  rs_R010_ueqv_R010NYY_partial_26_0108,
  rs_R010_ueqv_R010NYY_partial_26_0109,
  rs_R010_ueqv_R010NYY_partial_26_0110,
  rs_R010_ueqv_R010NYY_partial_26_0111,
  rs_R010_ueqv_R010NYY_partial_26_0112,
  rs_R010_ueqv_R010NYY_partial_26_0113,
  rs_R010_ueqv_R010NYY_partial_26_0114,
  rs_R010_ueqv_R010NYY_partial_26_0115,
  rs_R010_ueqv_R010NYY_partial_26_0116,
  rs_R010_ueqv_R010NYY_partial_26_0117,
  rs_R010_ueqv_R010NYY_partial_26_0118,
  rs_R010_ueqv_R010NYY_partial_26_0119,
  rs_R010_ueqv_R010NYY_partial_26_0120,
  rs_R010_ueqv_R010NYY_partial_26_0121,
  rs_R010_ueqv_R010NYY_partial_26_0122,
  rs_R010_ueqv_R010NYY_partial_26_0123,
  rs_R010_ueqv_R010NYY_partial_26_0124,
  rs_R010_ueqv_R010NYY_partial_26_0125,
  rs_R010_ueqv_R010NYY_partial_26_0126,
  rs_R010_ueqv_R010NYY_partial_26_0127,
  rs_R010_ueqv_R010NYY_partial_26_0128,
  rs_R010_ueqv_R010NYY_partial_26_0129,
  rs_R010_ueqv_R010NYY_partial_26_0130,
  rs_R010_ueqv_R010NYY_partial_26_0131,
  rs_R010_ueqv_R010NYY_partial_26_0132,
  rs_R010_ueqv_R010NYY_partial_26_0133,
  rs_R010_ueqv_R010NYY_partial_26_0134,
  rs_R010_ueqv_R010NYY_partial_26_0135,
  rs_R010_ueqv_R010NYY_partial_26_0136,
  rs_R010_ueqv_R010NYY_partial_26_0137,
  rs_R010_ueqv_R010NYY_partial_26_0138,
  rs_R010_ueqv_R010NYY_partial_26_0139,
  rs_R010_ueqv_R010NYY_partial_26_0140,
  rs_R010_ueqv_R010NYY_partial_26_0141,
  rs_R010_ueqv_R010NYY_partial_26_0142,
  rs_R010_ueqv_R010NYY_partial_26_0143,
  rs_R010_ueqv_R010NYY_partial_26_0144,
  rs_R010_ueqv_R010NYY_partial_26_0145,
  rs_R010_ueqv_R010NYY_partial_26_0146,
  rs_R010_ueqv_R010NYY_partial_26_0147,
  rs_R010_ueqv_R010NYY_partial_26_0148,
  rs_R010_ueqv_R010NYY_partial_26_0149,
  rs_R010_ueqv_R010NYY_partial_26_0150,
  rs_R010_ueqv_R010NYY_partial_26_0151,
  rs_R010_ueqv_R010NYY_partial_26_0152,
  rs_R010_ueqv_R010NYY_partial_26_0153,
  rs_R010_ueqv_R010NYY_partial_26_0154,
  rs_R010_ueqv_R010NYY_partial_26_0155,
  rs_R010_ueqv_R010NYY_partial_26_0156,
  rs_R010_ueqv_R010NYY_partial_26_0157,
  rs_R010_ueqv_R010NYY_partial_26_0158,
  rs_R010_ueqv_R010NYY_partial_26_0159,
  rs_R010_ueqv_R010NYY_partial_26_0160,
  rs_R010_ueqv_R010NYY_partial_26_0161,
  rs_R010_ueqv_R010NYY_partial_26_0162,
  rs_R010_ueqv_R010NYY_partial_26_0163,
  rs_R010_ueqv_R010NYY_partial_26_0164,
  rs_R010_ueqv_R010NYY_partial_26_0165,
  rs_R010_ueqv_R010NYY_partial_26_0166,
  rs_R010_ueqv_R010NYY_partial_26_0167,
  rs_R010_ueqv_R010NYY_partial_26_0168,
  rs_R010_ueqv_R010NYY_partial_26_0169,
  rs_R010_ueqv_R010NYY_partial_26_0170,
  rs_R010_ueqv_R010NYY_partial_26_0171,
  rs_R010_ueqv_R010NYY_partial_26_0172,
  rs_R010_ueqv_R010NYY_partial_26_0173,
  rs_R010_ueqv_R010NYY_partial_26_0174,
  rs_R010_ueqv_R010NYY_partial_26_0175,
  rs_R010_ueqv_R010NYY_partial_26_0176,
  rs_R010_ueqv_R010NYY_partial_26_0177,
  rs_R010_ueqv_R010NYY_partial_26_0178,
  rs_R010_ueqv_R010NYY_partial_26_0179,
  rs_R010_ueqv_R010NYY_partial_26_0180,
  rs_R010_ueqv_R010NYY_partial_26_0181,
  rs_R010_ueqv_R010NYY_partial_26_0182,
  rs_R010_ueqv_R010NYY_partial_26_0183,
  rs_R010_ueqv_R010NYY_partial_26_0184,
  rs_R010_ueqv_R010NYY_partial_26_0185,
  rs_R010_ueqv_R010NYY_partial_26_0186,
  rs_R010_ueqv_R010NYY_partial_26_0187,
  rs_R010_ueqv_R010NYY_partial_26_0188,
  rs_R010_ueqv_R010NYY_partial_26_0189,
  rs_R010_ueqv_R010NYY_partial_26_0190,
  rs_R010_ueqv_R010NYY_partial_26_0191,
  rs_R010_ueqv_R010NYY_partial_26_0192,
  rs_R010_ueqv_R010NYY_partial_26_0193,
  rs_R010_ueqv_R010NYY_partial_26_0194,
  rs_R010_ueqv_R010NYY_partial_26_0195,
  rs_R010_ueqv_R010NYY_partial_26_0196,
  rs_R010_ueqv_R010NYY_partial_26_0197,
  rs_R010_ueqv_R010NYY_partial_26_0198,
  rs_R010_ueqv_R010NYY_partial_26_0199
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_26_0100_0199 : Poly :=
[
  term ((10270818070089839739 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4136349421759544865 : Rat) / 221671947679753984) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-211246121880690055839 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((3641703605988597 : Rat) / 5372151793259344) [(3, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-105609404573669313 : Rat) / 37605062552815408) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5488210493458347261 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-10270818070089839739 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 2), (10, 1), (15, 2), (16, 1)],
  term ((4136349421759544865 : Rat) / 443343895359507968) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((211246121880690055839 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-3641703605988597 : Rat) / 10744303586518688) [(3, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((105609404573669313 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((5488210493458347261 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4136349421759544865 : Rat) / 221671947679753984) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-211246121880690055839 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-105609404573669313 : Rat) / 37605062552815408) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5488210493458347261 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 5372151793259344) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((4136349421759544865 : Rat) / 443343895359507968) [(3, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((211246121880690055839 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((9557044163316074727 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((105609404573669313 : Rat) / 75210125105630816) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((5488210493458347261 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-10270818070089839739 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 5965675645772416) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 4), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (8, 2), (11, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (8, 2), (15, 4), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 5965675645772416) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 2), (15, 4), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1508814845369768907 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-320032617216188139077 : Rat) / 526470875739415712) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-875650238543256 : Rat) / 46606840982597) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-792038122205226483 : Rat) / 5965675645772416) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((320032617216188139077 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((792038122205226483 : Rat) / 11931351291544832) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((483471987809343275445 : Rat) / 2105883502957662848) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((69527544276797127 : Rat) / 1491418911443104) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 5372151793259344) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((119889289681480769169 : Rat) / 526470875739415712) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((115417662713842088575 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((1228626950032067571841 : Rat) / 2105883502957662848) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((111265474525641 : Rat) / 60874241283392) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((89926400463120469 : Rat) / 5965675645772416) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3226698761243589 : Rat) / 426119688983744) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1508814845369768907 : Rat) / 2105883502957662848) [(3, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((437825119271628 : Rat) / 46606840982597) [(3, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-483471987809343275445 : Rat) / 4211767005915325696) [(3, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-69527544276797127 : Rat) / 2982837822886208) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (10, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-320032617216188139077 : Rat) / 526470875739415712) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 10744303586518688) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-119889289681480769169 : Rat) / 1052941751478831424) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (11, 1), (15, 4), (16, 1)],
  term ((-115417662713842088575 : Rat) / 2105883502957662848) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((-1228626950032067571841 : Rat) / 4211767005915325696) [(3, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (11, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-792038122205226483 : Rat) / 5965675645772416) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((-111265474525641 : Rat) / 121748482566784) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-89926400463120469 : Rat) / 11931351291544832) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((3226698761243589 : Rat) / 852239377967488) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 3), (11, 1), (15, 2), (16, 1)],
  term ((320032617216188139077 : Rat) / 1052941751478831424) [(3, 1), (8, 3), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 3), (13, 1), (15, 2), (16, 1)],
  term ((792038122205226483 : Rat) / 11931351291544832) [(3, 1), (8, 3), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 3), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((483471987809343275445 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((69527544276797127 : Rat) / 1491418911443104) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((119889289681480769169 : Rat) / 526470875739415712) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((115417662713842088575 : Rat) / 1052941751478831424) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 5372151793259344) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1228626950032067571841 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((89926400463120469 : Rat) / 5965675645772416) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3226698761243589 : Rat) / 426119688983744) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((111265474525641 : Rat) / 60874241283392) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-483471987809343275445 : Rat) / 4211767005915325696) [(3, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-69527544276797127 : Rat) / 2982837822886208) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((13384275046978527501 : Rat) / 1052941751478831424) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(3, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-119889289681480769169 : Rat) / 1052941751478831424) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 2), (11, 1), (15, 4), (16, 1)],
  term ((-115417662713842088575 : Rat) / 2105883502957662848) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1228626950032067571841 : Rat) / 4211767005915325696) [(3, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 2), (11, 2), (15, 3), (16, 1)],
  term ((-117535238785293177 : Rat) / 5965675645772416) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(3, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-89926400463120469 : Rat) / 11931351291544832) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((3226698761243589 : Rat) / 852239377967488) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(3, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-1508814845369768907 : Rat) / 2105883502957662848) [(3, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(3, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((437825119271628 : Rat) / 46606840982597) [(3, 1), (9, 3), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(3, 2), (8, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-72827507826175085451 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-203492515558960879305 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((178872171380073971187 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36506323680071491005 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-2394288453114688779 : Rat) / 32904429733713482) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((67569431847536233917 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 263235437869707856) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((2394288453114688779 : Rat) / 65808859467426964) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((100963211346141388395 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2796571541588754495 : Rat) / 526470875739415712) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20734671327282335259 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((874307256106446507873 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-200212667625243561 : Rat) / 31667421097107712) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-18080505697274733025 : Rat) / 886687790719015936) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((1943865981682197925477 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((72827507826175085451 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((203492515558960879305 : Rat) / 16847068023661302784) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-178872171380073971187 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((36506323680071491005 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((2796571541588754495 : Rat) / 1052941751478831424) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((20734671327282335259 : Rat) / 16847068023661302784) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-874307256106446507873 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((200212667625243561 : Rat) / 63334842194215424) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((67569431847536233917 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2394288453114688779 : Rat) / 32904429733713482) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((18080505697274733025 : Rat) / 1773375581438031872) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-1943865981682197925477 : Rat) / 67388272094645211136) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (8, 3), (11, 1), (16, 1)],
  term ((-67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 3), (13, 1), (16, 1)],
  term ((2394288453114688779 : Rat) / 65808859467426964) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((-2796571541588754495 : Rat) / 526470875739415712) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((100963211346141388395 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((874307256106446507873 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-200212667625243561 : Rat) / 31667421097107712) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20734671327282335259 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1943865981682197925477 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18080505697274733025 : Rat) / 886687790719015936) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((2796571541588754495 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-561885391282118348349 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-874307256106446507873 : Rat) / 33694136047322605568) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((200212667625243561 : Rat) / 63334842194215424) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((178872171380073971187 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((270516960888076945465 : Rat) / 33694136047322605568) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-203492515558960879305 : Rat) / 8423534011830651392) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1943865981682197925477 : Rat) / 67388272094645211136) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((72827507826175085451 : Rat) / 4211767005915325696) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-619163473429055198199 : Rat) / 16847068023661302784) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 3), (13, 2), (16, 1)],
  term ((-178872171380073971187 : Rat) / 8423534011830651392) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((36506323680071491005 : Rat) / 33694136047322605568) [(5, 1), (9, 3), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 4), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 23862702583089664) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 23862702583089664) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 1491418911443104) [(7, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 75811806106475862528) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 319589766737808) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 11931351291544832) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((39023555492874908592505 : Rat) / 75811806106475862528) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 319589766737808) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 11931351291544832) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-240937308571641895789 : Rat) / 1579412627218247136) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 1491418911443104) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 3), (15, 2), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 106529922245936) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((11368546718773356587 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((152740856852388657547 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-335207456333016911033 : Rat) / 75811806106475862528) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((8939487312665387828669 : Rat) / 9476475763309482816) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3157579497405045811529 : Rat) / 18952951526618965632) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((100911032203905998999 : Rat) / 3158825254436494272) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((215268440529795673 : Rat) / 5965675645772416) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-262673491014887 : Rat) / 639179533475616) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-178591182474187835 : Rat) / 71588107749268992) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-167015408479822159 : Rat) / 2982837822886208) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1067342596938727105 : Rat) / 5965675645772416) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((71367716807167 : Rat) / 852239377967488) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-328267947403827685 : Rat) / 11931351291544832) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 131617718934853928) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3157579497405045811529 : Rat) / 37905903053237931264) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-8939487312665387828669 : Rat) / 18952951526618965632) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 186427363930388) [(8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((328267947403827685 : Rat) / 23862702583089664) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1067342596938727105 : Rat) / 11931351291544832) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-71367716807167 : Rat) / 1704478755934976) [(8, 1), (9, 2), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 12635301017745977088) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3925505330876666842 : Rat) / 49356644600570223) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-104711860146981725 : Rat) / 2982837822886208) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17592157935092299 : Rat) / 745709455721552) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((101644522824340659 : Rat) / 5965675645772416) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((11126242500098293990585 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-104909466824635839050807 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1150030796077686731 : Rat) / 11931351291544832) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11368546718773356587 : Rat) / 8423534011830651392) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-152740856852388657547 : Rat) / 4211767005915325696) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((335207456333016911033 : Rat) / 151623612212951725056) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-100911032203905998999 : Rat) / 6317650508872988544) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-215268440529795673 : Rat) / 11931351291544832) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((262673491014887 : Rat) / 1278359066951232) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((178591182474187835 : Rat) / 143176215498537984) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((167015408479822159 : Rat) / 5965675645772416) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1962752665438333421 : Rat) / 49356644600570223) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((104711860146981725 : Rat) / 5965675645772416) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17592157935092299 : Rat) / 1491418911443104) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3157579497405045811529 : Rat) / 18952951526618965632) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8939487312665387828669 : Rat) / 9476475763309482816) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101644522824340659 : Rat) / 11931351291544832) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11126242500098293990585 : Rat) / 151623612212951725056) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((104909466824635839050807 : Rat) / 303247224425903450112) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1150030796077686731 : Rat) / 23862702583089664) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((-328267947403827685 : Rat) / 11931351291544832) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1067342596938727105 : Rat) / 5965675645772416) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((71367716807167 : Rat) / 852239377967488) [(8, 2), (12, 1), (16, 1)],
  term ((3157579497405045811529 : Rat) / 37905903053237931264) [(8, 3), (11, 1), (13, 1), (16, 1)],
  term ((-8939487312665387828669 : Rat) / 18952951526618965632) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(8, 3), (11, 2), (16, 1)],
  term ((328267947403827685 : Rat) / 23862702583089664) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1067342596938727105 : Rat) / 11931351291544832) [(8, 3), (15, 2), (16, 1)],
  term ((-71367716807167 : Rat) / 1704478755934976) [(8, 3), (16, 1)],
  term ((3925505330876666842 : Rat) / 49356644600570223) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 12635301017745977088) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((17592157935092299 : Rat) / 745709455721552) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-104711860146981725 : Rat) / 2982837822886208) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-104909466824635839050807 : Rat) / 151623612212951725056) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1150030796077686731 : Rat) / 11931351291544832) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((101644522824340659 : Rat) / 5965675645772416) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((11126242500098293990585 : Rat) / 75811806106475862528) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1962752665438333421 : Rat) / 49356644600570223) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2300400022083601 : Rat) / 161234476912768) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-17592157935092299 : Rat) / 1491418911443104) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((269601197147785062467 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11796657412764327812651 : Rat) / 151623612212951725056) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((11368546718773356587 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((104909466824635839050807 : Rat) / 303247224425903450112) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1150030796077686731 : Rat) / 23862702583089664) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((100911032203905998999 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (13, 2), (16, 1)],
  term ((-178591182474187835 : Rat) / 71588107749268992) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-167015408479822159 : Rat) / 2982837822886208) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((215268440529795673 : Rat) / 5965675645772416) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-262673491014887 : Rat) / 639179533475616) [(9, 2), (13, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 3), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((2642650085112085328661 : Rat) / 8423534011830651392) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (13, 2), (16, 1)],
  term ((-152740856852388657547 : Rat) / 4211767005915325696) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((335207456333016911033 : Rat) / 151623612212951725056) [(9, 3), (11, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(9, 3), (11, 2), (13, 1), (16, 1)],
  term ((-100911032203905998999 : Rat) / 6317650508872988544) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((1262366008286040551 : Rat) / 11931351291544832) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((262673491014887 : Rat) / 1278359066951232) [(9, 3), (13, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (13, 2), (15, 1), (16, 1)],
  term ((178591182474187835 : Rat) / 143176215498537984) [(9, 3), (15, 1), (16, 1)],
  term ((167015408479822159 : Rat) / 5965675645772416) [(9, 3), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 4), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 4), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 100 through 199. -/
theorem rs_R010_ueqv_R010NYY_block_26_0100_0199_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_26_0100_0199
      rs_R010_ueqv_R010NYY_block_26_0100_0199 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
