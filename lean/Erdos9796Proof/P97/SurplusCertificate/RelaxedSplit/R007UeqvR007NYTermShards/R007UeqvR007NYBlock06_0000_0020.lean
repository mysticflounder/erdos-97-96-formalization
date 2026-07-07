/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 6:0-20

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 6 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_06_0000_0020 : Poly :=
[
  term (-1 : Rat) [],
  term (1 : Rat) [(0, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0000 : Poly :=
[
  term (-1 : Rat) []
]

/-- Partial product 0 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0000 : Poly :=
[
  term (1 : Rat) [],
  term (-1 : Rat) [(0, 2), (16, 1)],
  term (-1 : Rat) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0000
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0001 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0001 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (7, 1), (8, 1), (11, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0001
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0002 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0002 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0002
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0003 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0003 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0003
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0004 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0004 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0004
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0005 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 5 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0005 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (7, 1), (11, 1), (12, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0005
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0006 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0006 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(0, 2), (7, 1), (11, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(1, 2), (7, 1), (11, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0006
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0007 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0007 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0007
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0008 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0008 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(0, 2), (7, 1), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(1, 2), (7, 1), (15, 1), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0008
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0009 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0009 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0009
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0010 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 10 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0010 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (8, 1), (11, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (8, 1), (11, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0010
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0011 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0011 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (8, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (8, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0011
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0012 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0012 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0012
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0013 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0013 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0013
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0014 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0014 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0014
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0015 : Poly :=
[
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0015 : Poly :=
[
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0015
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0016 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0016 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 1336341183988181301) [(0, 2), (11, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 1336341183988181301) [(1, 2), (11, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0016
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0017 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 17 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0017 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (11, 2), (12, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (11, 2), (12, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0017
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0018 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (16, 1)]
]

/-- Partial product 18 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0018 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(0, 2), (11, 2), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(1, 2), (11, 2), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0018
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0019 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 19 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0019 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (12, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (12, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0019
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 6. -/
def rs_R007_ueqv_R007NY_coefficient_06_0020 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(15, 2), (16, 1)]
]

/-- Partial product 20 for generator 6. -/
def rs_R007_ueqv_R007NY_partial_06_0020 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(0, 2), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(1, 2), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 6. -/
theorem rs_R007_ueqv_R007NY_partial_06_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_06_0020
        rs_R007_ueqv_R007NY_generator_06_0000_0020 =
      rs_R007_ueqv_R007NY_partial_06_0020 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_06_0000_0020 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_06_0000,
  rs_R007_ueqv_R007NY_partial_06_0001,
  rs_R007_ueqv_R007NY_partial_06_0002,
  rs_R007_ueqv_R007NY_partial_06_0003,
  rs_R007_ueqv_R007NY_partial_06_0004,
  rs_R007_ueqv_R007NY_partial_06_0005,
  rs_R007_ueqv_R007NY_partial_06_0006,
  rs_R007_ueqv_R007NY_partial_06_0007,
  rs_R007_ueqv_R007NY_partial_06_0008,
  rs_R007_ueqv_R007NY_partial_06_0009,
  rs_R007_ueqv_R007NY_partial_06_0010,
  rs_R007_ueqv_R007NY_partial_06_0011,
  rs_R007_ueqv_R007NY_partial_06_0012,
  rs_R007_ueqv_R007NY_partial_06_0013,
  rs_R007_ueqv_R007NY_partial_06_0014,
  rs_R007_ueqv_R007NY_partial_06_0015,
  rs_R007_ueqv_R007NY_partial_06_0016,
  rs_R007_ueqv_R007NY_partial_06_0017,
  rs_R007_ueqv_R007NY_partial_06_0018,
  rs_R007_ueqv_R007NY_partial_06_0019,
  rs_R007_ueqv_R007NY_partial_06_0020
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_06_0000_0020 : Poly :=
[
  term (1 : Rat) [],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (7, 1), (8, 1), (11, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (7, 1), (11, 1), (12, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(0, 2), (7, 1), (11, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(0, 2), (7, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (8, 1), (11, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (8, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 1336341183988181301) [(0, 2), (11, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (11, 2), (12, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(0, 2), (11, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (12, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(0, 2), (15, 2), (16, 2)],
  term (-1 : Rat) [(0, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(1, 2), (7, 1), (11, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(1, 2), (7, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (8, 1), (11, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (8, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 1336341183988181301) [(1, 2), (11, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (11, 2), (12, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(1, 2), (11, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (12, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(1, 2), (15, 2), (16, 2)],
  term (-1 : Rat) [(1, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 0 through 20. -/
theorem rs_R007_ueqv_R007NY_block_06_0000_0020_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_06_0000_0020
      rs_R007_ueqv_R007NY_block_06_0000_0020 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
