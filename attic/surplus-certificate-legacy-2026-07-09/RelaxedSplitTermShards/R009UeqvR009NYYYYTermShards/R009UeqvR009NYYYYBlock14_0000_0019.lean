/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 14:0-19

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0000 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 0 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0000 : Poly :=
[
  term ((15946032288 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((15946032288 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-7973016144 : Rat) / 33189485) [(6, 2), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-7973016144 : Rat) / 33189485) [(7, 2), (9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0000
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0001 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0001 : Poly :=
[
  term ((-3049920 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3049920 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1524960 : Rat) / 32699) [(6, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1524960 : Rat) / 32699) [(7, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0001
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0002 : Poly :=
[
  term ((1494940527 : Rat) / 33189485) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0002 : Poly :=
[
  term ((2989881054 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((2989881054 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1494940527 : Rat) / 33189485) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1494940527 : Rat) / 33189485) [(7, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0002
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0003 : Poly :=
[
  term ((-285930 : Rat) / 32699) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0003 : Poly :=
[
  term ((-571860 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-571860 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((285930 : Rat) / 32699) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((285930 : Rat) / 32699) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0003
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0004 : Poly :=
[
  term ((-1993254036 : Rat) / 33189485) [(9, 1), (10, 1), (15, 3)]
]

/-- Partial product 4 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0004 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 3)],
  term ((-3986508072 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 3)],
  term ((1993254036 : Rat) / 33189485) [(6, 2), (9, 1), (10, 1), (15, 3)],
  term ((1993254036 : Rat) / 33189485) [(7, 2), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0004
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0005 : Poly :=
[
  term ((381240 : Rat) / 32699) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 5 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0005 : Poly :=
[
  term ((762480 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((762480 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-381240 : Rat) / 32699) [(6, 2), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-381240 : Rat) / 32699) [(7, 2), (9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0005
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0006 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 6 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0006 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((7973016144 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0006
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0007 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0007 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0007
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0008 : Poly :=
[
  term ((54482276984 : Rat) / 33189485) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 8 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0008 : Poly :=
[
  term ((108964553968 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((108964553968 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-54482276984 : Rat) / 33189485) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((-54482276984 : Rat) / 33189485) [(7, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0008
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0009 : Poly :=
[
  term ((-10420560 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 9 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0009 : Poly :=
[
  term ((-20841120 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20841120 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10420560 : Rat) / 32699) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10420560 : Rat) / 32699) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0009_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0009
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0010 : Poly :=
[
  term ((5315344096 : Rat) / 6637897) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 10 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0010 : Poly :=
[
  term ((10630688192 : Rat) / 6637897) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((10630688192 : Rat) / 6637897) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-5315344096 : Rat) / 6637897) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((-5315344096 : Rat) / 6637897) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0010_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0010
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0011 : Poly :=
[
  term ((-5083200 : Rat) / 32699) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0011 : Poly :=
[
  term ((-10166400 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10166400 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((5083200 : Rat) / 32699) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((5083200 : Rat) / 32699) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0011_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0011
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0012 : Poly :=
[
  term ((-664418012 : Rat) / 6637897) [(9, 1), (15, 1)]
]

/-- Partial product 12 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0012 : Poly :=
[
  term ((-1328836024 : Rat) / 6637897) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1328836024 : Rat) / 6637897) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((664418012 : Rat) / 6637897) [(6, 2), (9, 1), (15, 1)],
  term ((664418012 : Rat) / 6637897) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0012_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0012
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0013 : Poly :=
[
  term ((635400 : Rat) / 32699) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0013 : Poly :=
[
  term ((1270800 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1270800 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-635400 : Rat) / 32699) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-635400 : Rat) / 32699) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0013_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0013
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0014 : Poly :=
[
  term ((-2657672048 : Rat) / 4741355) [(9, 1), (15, 3)]
]

/-- Partial product 14 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0014 : Poly :=
[
  term ((-5315344096 : Rat) / 4741355) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((-5315344096 : Rat) / 4741355) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((2657672048 : Rat) / 4741355) [(6, 2), (9, 1), (15, 3)],
  term ((2657672048 : Rat) / 4741355) [(7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0014_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0014
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0015 : Poly :=
[
  term ((3558240 : Rat) / 32699) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 15 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0015 : Poly :=
[
  term ((7116480 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((7116480 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-3558240 : Rat) / 32699) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-3558240 : Rat) / 32699) [(7, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0015_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0015
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0016 : Poly :=
[
  term ((-17274868312 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 16 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0016 : Poly :=
[
  term ((-34549736624 : Rat) / 33189485) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-34549736624 : Rat) / 33189485) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((17274868312 : Rat) / 33189485) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((17274868312 : Rat) / 33189485) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0016_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0016
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0017 : Poly :=
[
  term ((3304080 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0017 : Poly :=
[
  term ((6608160 : Rat) / 32699) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6608160 : Rat) / 32699) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3304080 : Rat) / 32699) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3304080 : Rat) / 32699) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0017_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0017
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0018 : Poly :=
[
  term ((12956151234 : Rat) / 33189485) [(11, 1), (15, 1)]
]

/-- Partial product 18 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0018 : Poly :=
[
  term ((25912302468 : Rat) / 33189485) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((25912302468 : Rat) / 33189485) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-12956151234 : Rat) / 33189485) [(6, 2), (11, 1), (15, 1)],
  term ((-12956151234 : Rat) / 33189485) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0018_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0018
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYYYY_coefficient_14_0019 : Poly :=
[
  term ((-2478060 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 14. -/
def rs_R009_ueqv_R009NYYYY_partial_14_0019 : Poly :=
[
  term ((-4956120 : Rat) / 32699) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4956120 : Rat) / 32699) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2478060 : Rat) / 32699) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((2478060 : Rat) / 32699) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem rs_R009_ueqv_R009NYYYY_partial_14_0019_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_14_0019
        rs_R009_ueqv_R009NYYYY_generator_14_0000_0019 =
      rs_R009_ueqv_R009NYYYY_partial_14_0019 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_14_0000_0019 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_14_0000,
  rs_R009_ueqv_R009NYYYY_partial_14_0001,
  rs_R009_ueqv_R009NYYYY_partial_14_0002,
  rs_R009_ueqv_R009NYYYY_partial_14_0003,
  rs_R009_ueqv_R009NYYYY_partial_14_0004,
  rs_R009_ueqv_R009NYYYY_partial_14_0005,
  rs_R009_ueqv_R009NYYYY_partial_14_0006,
  rs_R009_ueqv_R009NYYYY_partial_14_0007,
  rs_R009_ueqv_R009NYYYY_partial_14_0008,
  rs_R009_ueqv_R009NYYYY_partial_14_0009,
  rs_R009_ueqv_R009NYYYY_partial_14_0010,
  rs_R009_ueqv_R009NYYYY_partial_14_0011,
  rs_R009_ueqv_R009NYYYY_partial_14_0012,
  rs_R009_ueqv_R009NYYYY_partial_14_0013,
  rs_R009_ueqv_R009NYYYY_partial_14_0014,
  rs_R009_ueqv_R009NYYYY_partial_14_0015,
  rs_R009_ueqv_R009NYYYY_partial_14_0016,
  rs_R009_ueqv_R009NYYYY_partial_14_0017,
  rs_R009_ueqv_R009NYYYY_partial_14_0018,
  rs_R009_ueqv_R009NYYYY_partial_14_0019
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_14_0000_0019 : Poly :=
[
  term ((15946032288 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3049920 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-571860 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 3)],
  term ((762480 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((108964553968 : Rat) / 33189485) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-20841120 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10630688192 : Rat) / 6637897) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-10166400 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 6637897) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((1270800 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 4741355) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((7116480 : Rat) / 32699) [(4, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-34549736624 : Rat) / 33189485) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((6608160 : Rat) / 32699) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((25912302468 : Rat) / 33189485) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-4956120 : Rat) / 32699) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3049920 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-571860 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 3)],
  term ((762480 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((108964553968 : Rat) / 33189485) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-20841120 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10630688192 : Rat) / 6637897) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-10166400 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 6637897) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((1270800 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 4741355) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((7116480 : Rat) / 32699) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-34549736624 : Rat) / 33189485) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((6608160 : Rat) / 32699) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((25912302468 : Rat) / 33189485) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4956120 : Rat) / 32699) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(6, 2), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((1524960 : Rat) / 32699) [(6, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1494940527 : Rat) / 33189485) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((285930 : Rat) / 32699) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(6, 2), (9, 1), (10, 1), (15, 3)],
  term ((-381240 : Rat) / 32699) [(6, 2), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54482276984 : Rat) / 33189485) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((10420560 : Rat) / 32699) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((5083200 : Rat) / 32699) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((664418012 : Rat) / 6637897) [(6, 2), (9, 1), (15, 1)],
  term ((-635400 : Rat) / 32699) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 4741355) [(6, 2), (9, 1), (15, 3)],
  term ((-3558240 : Rat) / 32699) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12956151234 : Rat) / 33189485) [(6, 2), (11, 1), (15, 1)],
  term ((2478060 : Rat) / 32699) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(7, 2), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((1524960 : Rat) / 32699) [(7, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1494940527 : Rat) / 33189485) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((285930 : Rat) / 32699) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(7, 2), (9, 1), (10, 1), (15, 3)],
  term ((-381240 : Rat) / 32699) [(7, 2), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54482276984 : Rat) / 33189485) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term ((10420560 : Rat) / 32699) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((5083200 : Rat) / 32699) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((664418012 : Rat) / 6637897) [(7, 2), (9, 1), (15, 1)],
  term ((-635400 : Rat) / 32699) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 4741355) [(7, 2), (9, 1), (15, 3)],
  term ((-3558240 : Rat) / 32699) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12956151234 : Rat) / 33189485) [(7, 2), (11, 1), (15, 1)],
  term ((2478060 : Rat) / 32699) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 19. -/
theorem rs_R009_ueqv_R009NYYYY_block_14_0000_0019_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_14_0000_0019
      rs_R009_ueqv_R009NYYYY_block_14_0000_0019 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
