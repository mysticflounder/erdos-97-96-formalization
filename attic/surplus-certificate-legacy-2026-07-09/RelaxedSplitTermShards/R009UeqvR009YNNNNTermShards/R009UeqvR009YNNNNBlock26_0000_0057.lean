/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 26:0-57

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0000 : Poly :=
[
  term ((-1532199782809 : Rat) / 1934047507896) []
]

/-- Partial product 0 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0000 : Poly :=
[
  term ((1532199782809 : Rat) / 967023753948) [(0, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 1934047507896) [(0, 2)],
  term ((1532199782809 : Rat) / 967023753948) [(1, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 1934047507896) [(1, 2)],
  term ((-1532199782809 : Rat) / 967023753948) [(6, 1), (12, 1)],
  term ((1532199782809 : Rat) / 1934047507896) [(6, 2)],
  term ((-1532199782809 : Rat) / 967023753948) [(7, 1), (13, 1)],
  term ((1532199782809 : Rat) / 1934047507896) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0000
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0001 : Poly :=
[
  term ((5406607540071400 : Rat) / 6527410339149) [(1, 1), (3, 1)]
]

/-- Partial product 1 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0001 : Poly :=
[
  term ((-10813215080142800 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (12, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 2)],
  term ((10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 2)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(1, 2), (3, 1), (13, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0001
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0002 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 2 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0002 : Poly :=
[
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((33944746640006525 : Rat) / 19582231017447) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 3), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0002
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0003 : Poly :=
[
  term ((-1239549624292481 : Rat) / 2175803446383) [(1, 1), (7, 1)]
]

/-- Partial product 3 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0003 : Poly :=
[
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(0, 2), (1, 1), (7, 1)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (12, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(1, 1), (6, 2), (7, 1)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(1, 1), (7, 2), (13, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(1, 1), (7, 3)],
  term ((2479099248584962 : Rat) / 2175803446383) [(1, 2), (7, 1), (13, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0003
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0004 : Poly :=
[
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 4 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0004 : Poly :=
[
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(1, 1), (6, 2), (7, 1), (14, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(1, 1), (7, 3), (14, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0004
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0005 : Poly :=
[
  term ((-6788130415625 : Rat) / 6744934476) [(1, 1), (9, 1)]
]

/-- Partial product 5 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0005 : Poly :=
[
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(0, 2), (1, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(1, 1), (6, 2), (9, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(1, 1), (7, 2), (9, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 2), (9, 1), (13, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0005
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0006 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 6 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0006 : Poly :=
[
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (6, 2), (9, 1), (14, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (7, 2), (9, 1), (14, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0006
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0007 : Poly :=
[
  term ((24970511668502003 : Rat) / 13054820678298) [(1, 1), (11, 1)]
]

/-- Partial product 7 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0007 : Poly :=
[
  term ((-24970511668502003 : Rat) / 6527410339149) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((24970511668502003 : Rat) / 13054820678298) [(0, 2), (1, 1), (11, 1)],
  term ((24970511668502003 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-24970511668502003 : Rat) / 13054820678298) [(1, 1), (6, 2), (11, 1)],
  term ((24970511668502003 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-24970511668502003 : Rat) / 13054820678298) [(1, 1), (7, 2), (11, 1)],
  term ((-24970511668502003 : Rat) / 6527410339149) [(1, 2), (11, 1), (13, 1)],
  term ((24970511668502003 : Rat) / 13054820678298) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0007
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0008 : Poly :=
[
  term ((-4373700192153358 : Rat) / 6527410339149) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 8 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0008 : Poly :=
[
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(1, 1), (7, 2), (11, 1), (14, 1)],
  term ((8747400384306716 : Rat) / 6527410339149) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0008
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0009 : Poly :=
[
  term ((280381883026811 : Rat) / 266424911802) [(1, 1), (13, 1)]
]

/-- Partial product 9 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0009 : Poly :=
[
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(0, 2), (1, 1), (13, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(1, 1), (6, 2), (13, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(1, 1), (7, 1), (13, 2)],
  term ((-280381883026811 : Rat) / 266424911802) [(1, 1), (7, 2), (13, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 2), (13, 2)],
  term ((280381883026811 : Rat) / 266424911802) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0009
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0010 : Poly :=
[
  term ((-59271663677612999 : Rat) / 39164462034894) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 10 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0010 : Poly :=
[
  term ((59271663677612999 : Rat) / 19582231017447) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-59271663677612999 : Rat) / 39164462034894) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-59271663677612999 : Rat) / 19582231017447) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((59271663677612999 : Rat) / 39164462034894) [(1, 1), (6, 2), (13, 1), (14, 1)],
  term ((-59271663677612999 : Rat) / 19582231017447) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((59271663677612999 : Rat) / 39164462034894) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((59271663677612999 : Rat) / 19582231017447) [(1, 2), (13, 2), (14, 1)],
  term ((-59271663677612999 : Rat) / 39164462034894) [(1, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0010
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0011 : Poly :=
[
  term ((-340 : Rat) / 63) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 11 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0011 : Poly :=
[
  term ((680 : Rat) / 63) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((680 : Rat) / 63) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0011
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0012 : Poly :=
[
  term ((85 : Rat) / 21) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0012 : Poly :=
[
  term ((-170 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 21) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 21) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((170 : Rat) / 21) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-85 : Rat) / 21) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(1, 2), (13, 2), (16, 1)],
  term ((85 : Rat) / 21) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0012
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0013 : Poly :=
[
  term ((32209701640227467 : Rat) / 26109641356596) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 13 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0013 : Poly :=
[
  term ((-32209701640227467 : Rat) / 13054820678298) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((32209701640227467 : Rat) / 26109641356596) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((32209701640227467 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-32209701640227467 : Rat) / 26109641356596) [(1, 1), (6, 2), (14, 1), (15, 1)],
  term ((32209701640227467 : Rat) / 13054820678298) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-32209701640227467 : Rat) / 26109641356596) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term ((-32209701640227467 : Rat) / 13054820678298) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((32209701640227467 : Rat) / 26109641356596) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0013
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0014 : Poly :=
[
  term ((64 : Rat) / 9) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0014 : Poly :=
[
  term ((-128 : Rat) / 9) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 9) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0014
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0015 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 15 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0015 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 2), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (7, 2), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0015
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0016 : Poly :=
[
  term ((-3107121728835839 : Rat) / 1450535630922) [(1, 1), (15, 1)]
]

/-- Partial product 16 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0016 : Poly :=
[
  term ((3107121728835839 : Rat) / 725267815461) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-3107121728835839 : Rat) / 1450535630922) [(0, 2), (1, 1), (15, 1)],
  term ((-3107121728835839 : Rat) / 725267815461) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((3107121728835839 : Rat) / 1450535630922) [(1, 1), (6, 2), (15, 1)],
  term ((-3107121728835839 : Rat) / 725267815461) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((3107121728835839 : Rat) / 1450535630922) [(1, 1), (7, 2), (15, 1)],
  term ((3107121728835839 : Rat) / 725267815461) [(1, 2), (13, 1), (15, 1)],
  term ((-3107121728835839 : Rat) / 1450535630922) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0016
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0017 : Poly :=
[
  term ((-16 : Rat) / 3) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0017 : Poly :=
[
  term ((32 : Rat) / 3) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0017
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0018 : Poly :=
[
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 2)]
]

/-- Partial product 18 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0018 : Poly :=
[
  term ((974580364564039 : Rat) / 2175803446383) [(0, 1), (1, 2), (12, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(0, 2), (1, 2)],
  term ((-974580364564039 : Rat) / 2175803446383) [(1, 2), (6, 1), (12, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 2), (6, 2)],
  term ((-974580364564039 : Rat) / 2175803446383) [(1, 2), (7, 1), (13, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 2), (7, 2)],
  term ((974580364564039 : Rat) / 2175803446383) [(1, 3), (13, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0018
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0019 : Poly :=
[
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 2), (14, 1)]
]

/-- Partial product 19 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0019 : Poly :=
[
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 2), (1, 2), (14, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(1, 2), (6, 1), (12, 1), (14, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (6, 2), (14, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (7, 2), (14, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(1, 3), (13, 1), (14, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0019
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0020 : Poly :=
[
  term ((33944746640006525 : Rat) / 156657848139576) [(3, 1), (11, 1)]
]

/-- Partial product 20 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0020 : Poly :=
[
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((33944746640006525 : Rat) / 156657848139576) [(0, 2), (3, 1), (11, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 156657848139576) [(1, 2), (3, 1), (11, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-33944746640006525 : Rat) / 156657848139576) [(3, 1), (6, 2), (11, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-33944746640006525 : Rat) / 156657848139576) [(3, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0020
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0021 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 21 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0021 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0021
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0022 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 22 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0022 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0022
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0023 : Poly :=
[
  term ((-34625654868081569 : Rat) / 52219282713192) [(3, 1), (15, 1)]
]

/-- Partial product 23 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0023 : Poly :=
[
  term ((34625654868081569 : Rat) / 26109641356596) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-34625654868081569 : Rat) / 52219282713192) [(0, 2), (3, 1), (15, 1)],
  term ((34625654868081569 : Rat) / 26109641356596) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-34625654868081569 : Rat) / 52219282713192) [(1, 2), (3, 1), (15, 1)],
  term ((-34625654868081569 : Rat) / 26109641356596) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((34625654868081569 : Rat) / 52219282713192) [(3, 1), (6, 2), (15, 1)],
  term ((-34625654868081569 : Rat) / 26109641356596) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((34625654868081569 : Rat) / 52219282713192) [(3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0023
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0024 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(3, 1), (15, 3)]
]

/-- Partial product 24 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0024 : Poly :=
[
  term ((747520 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(0, 2), (3, 1), (15, 3)],
  term ((747520 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(1, 2), (3, 1), (15, 3)],
  term ((-747520 : Rat) / 3087) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 2), (15, 3)],
  term ((-747520 : Rat) / 3087) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0024
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0025 : Poly :=
[
  term ((-1532199782809 : Rat) / 107447083772) [(7, 1), (9, 1)]
]

/-- Partial product 25 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0025 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(0, 2), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(1, 2), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(6, 2), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 2), (9, 1), (13, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0025
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0026 : Poly :=
[
  term ((1118505841450570 : Rat) / 6527410339149) [(7, 1), (11, 1)]
]

/-- Partial product 26 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0026 : Poly :=
[
  term ((-2237011682901140 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((1118505841450570 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((1118505841450570 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-1118505841450570 : Rat) / 6527410339149) [(6, 2), (7, 1), (11, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(7, 2), (11, 1), (13, 1)],
  term ((-1118505841450570 : Rat) / 6527410339149) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0026
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0027 : Poly :=
[
  term ((1532199782809 : Rat) / 322341251316) [(7, 1), (13, 1)]
]

/-- Partial product 27 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0027 : Poly :=
[
  term ((-1532199782809 : Rat) / 161170625658) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(0, 2), (7, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 1), (7, 1), (13, 2)],
  term ((1532199782809 : Rat) / 322341251316) [(1, 2), (7, 1), (13, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(6, 2), (7, 1), (13, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(7, 2), (13, 2)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0027
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0028 : Poly :=
[
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 28 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0028 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (13, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0028
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0029 : Poly :=
[
  term ((-4349915183394751 : Rat) / 8703213785532) [(7, 1), (15, 1)]
]

/-- Partial product 29 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0029 : Poly :=
[
  term ((4349915183394751 : Rat) / 4351606892766) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 8703213785532) [(0, 2), (7, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 8703213785532) [(1, 2), (7, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 8703213785532) [(6, 2), (7, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(7, 2), (13, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 8703213785532) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0029
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0030 : Poly :=
[
  term ((-1419365441152247 : Rat) / 1598549470812) [(9, 1), (11, 1)]
]

/-- Partial product 30 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0030 : Poly :=
[
  term ((1419365441152247 : Rat) / 799274735406) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1419365441152247 : Rat) / 1598549470812) [(0, 2), (9, 1), (11, 1)],
  term ((1419365441152247 : Rat) / 799274735406) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1419365441152247 : Rat) / 1598549470812) [(1, 2), (9, 1), (11, 1)],
  term ((-1419365441152247 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((1419365441152247 : Rat) / 1598549470812) [(6, 2), (9, 1), (11, 1)],
  term ((-1419365441152247 : Rat) / 799274735406) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1419365441152247 : Rat) / 1598549470812) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0030
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0031 : Poly :=
[
  term ((-7819657675 : Rat) / 666166368) [(9, 1), (13, 1)]
]

/-- Partial product 31 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0031 : Poly :=
[
  term ((7819657675 : Rat) / 333083184) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-7819657675 : Rat) / 666166368) [(0, 2), (9, 1), (13, 1)],
  term ((7819657675 : Rat) / 333083184) [(1, 1), (9, 1), (13, 2)],
  term ((-7819657675 : Rat) / 666166368) [(1, 2), (9, 1), (13, 1)],
  term ((-7819657675 : Rat) / 333083184) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((7819657675 : Rat) / 666166368) [(6, 2), (9, 1), (13, 1)],
  term ((-7819657675 : Rat) / 333083184) [(7, 1), (9, 1), (13, 2)],
  term ((7819657675 : Rat) / 666166368) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0031
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0032 : Poly :=
[
  term ((-53777198303881 : Rat) / 80939213712) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 32 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0032 : Poly :=
[
  term ((53777198303881 : Rat) / 40469606856) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0032
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0033 : Poly :=
[
  term ((-725 : Rat) / 56) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 33 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0033 : Poly :=
[
  term ((725 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 28) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 56) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 28) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 56) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0033
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0034 : Poly :=
[
  term ((223273978116670483 : Rat) / 208877130852768) [(9, 1), (15, 1)]
]

/-- Partial product 34 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0034 : Poly :=
[
  term ((-223273978116670483 : Rat) / 104438565426384) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((223273978116670483 : Rat) / 208877130852768) [(0, 2), (9, 1), (15, 1)],
  term ((-223273978116670483 : Rat) / 104438565426384) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((223273978116670483 : Rat) / 208877130852768) [(1, 2), (9, 1), (15, 1)],
  term ((223273978116670483 : Rat) / 104438565426384) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-223273978116670483 : Rat) / 208877130852768) [(6, 2), (9, 1), (15, 1)],
  term ((223273978116670483 : Rat) / 104438565426384) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-223273978116670483 : Rat) / 208877130852768) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0034
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0035 : Poly :=
[
  term ((157 : Rat) / 14) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0035 : Poly :=
[
  term ((-157 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 14) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 14) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 7) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 14) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 7) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 14) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0035
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0036 : Poly :=
[
  term ((-385847904595639 : Rat) / 23208570094752) [(9, 2)]
]

/-- Partial product 36 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0036 : Poly :=
[
  term ((385847904595639 : Rat) / 11604285047376) [(0, 1), (9, 2), (12, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(0, 2), (9, 2)],
  term ((385847904595639 : Rat) / 11604285047376) [(1, 1), (9, 2), (13, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(1, 2), (9, 2)],
  term ((-385847904595639 : Rat) / 11604285047376) [(6, 1), (9, 2), (12, 1)],
  term ((385847904595639 : Rat) / 23208570094752) [(6, 2), (9, 2)],
  term ((-385847904595639 : Rat) / 11604285047376) [(7, 1), (9, 2), (13, 1)],
  term ((385847904595639 : Rat) / 23208570094752) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0036
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0037 : Poly :=
[
  term ((1532199782809 : Rat) / 138146250564) [(10, 1)]
]

/-- Partial product 37 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0037 : Poly :=
[
  term ((-1532199782809 : Rat) / 69073125282) [(0, 1), (10, 1), (12, 1)],
  term ((1532199782809 : Rat) / 138146250564) [(0, 2), (10, 1)],
  term ((-1532199782809 : Rat) / 69073125282) [(1, 1), (10, 1), (13, 1)],
  term ((1532199782809 : Rat) / 138146250564) [(1, 2), (10, 1)],
  term ((1532199782809 : Rat) / 69073125282) [(6, 1), (10, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 138146250564) [(6, 2), (10, 1)],
  term ((1532199782809 : Rat) / 69073125282) [(7, 1), (10, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 138146250564) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0037
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0038 : Poly :=
[
  term ((521109558037319 : Rat) / 799274735406) [(11, 1), (13, 1)]
]

/-- Partial product 38 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0038 : Poly :=
[
  term ((-521109558037319 : Rat) / 399637367703) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((521109558037319 : Rat) / 799274735406) [(0, 2), (11, 1), (13, 1)],
  term ((-521109558037319 : Rat) / 399637367703) [(1, 1), (11, 1), (13, 2)],
  term ((521109558037319 : Rat) / 799274735406) [(1, 2), (11, 1), (13, 1)],
  term ((521109558037319 : Rat) / 399637367703) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-521109558037319 : Rat) / 799274735406) [(6, 2), (11, 1), (13, 1)],
  term ((521109558037319 : Rat) / 399637367703) [(7, 1), (11, 1), (13, 2)],
  term ((-521109558037319 : Rat) / 799274735406) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0038
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0039 : Poly :=
[
  term ((353060918012465 : Rat) / 6527410339149) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 39 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0039 : Poly :=
[
  term ((-706121836024930 : Rat) / 6527410339149) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0039
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0040 : Poly :=
[
  term ((85 : Rat) / 63) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0040 : Poly :=
[
  term ((-170 : Rat) / 63) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((85 : Rat) / 63) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-85 : Rat) / 63) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0040
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0041 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 41 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0041 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0041
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0042 : Poly :=
[
  term ((-16210405826528371 : Rat) / 52219282713192) [(11, 1), (15, 1)]
]

/-- Partial product 42 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0042 : Poly :=
[
  term ((16210405826528371 : Rat) / 26109641356596) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16210405826528371 : Rat) / 52219282713192) [(0, 2), (11, 1), (15, 1)],
  term ((16210405826528371 : Rat) / 26109641356596) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-16210405826528371 : Rat) / 52219282713192) [(1, 2), (11, 1), (15, 1)],
  term ((-16210405826528371 : Rat) / 26109641356596) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((16210405826528371 : Rat) / 52219282713192) [(6, 2), (11, 1), (15, 1)],
  term ((-16210405826528371 : Rat) / 26109641356596) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((16210405826528371 : Rat) / 52219282713192) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0042
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0043 : Poly :=
[
  term ((-16 : Rat) / 9) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0043 : Poly :=
[
  term ((32 : Rat) / 9) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0043
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0044 : Poly :=
[
  term ((3445707804341129 : Rat) / 13054820678298) [(11, 2)]
]

/-- Partial product 44 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0044 : Poly :=
[
  term ((-3445707804341129 : Rat) / 6527410339149) [(0, 1), (11, 2), (12, 1)],
  term ((3445707804341129 : Rat) / 13054820678298) [(0, 2), (11, 2)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(1, 1), (11, 2), (13, 1)],
  term ((3445707804341129 : Rat) / 13054820678298) [(1, 2), (11, 2)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (12, 1)],
  term ((-3445707804341129 : Rat) / 13054820678298) [(6, 2), (11, 2)],
  term ((3445707804341129 : Rat) / 6527410339149) [(7, 1), (11, 2), (13, 1)],
  term ((-3445707804341129 : Rat) / 13054820678298) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0044
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0045 : Poly :=
[
  term ((-12605919278436877 : Rat) / 26109641356596) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 45 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0045 : Poly :=
[
  term ((12605919278436877 : Rat) / 13054820678298) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12605919278436877 : Rat) / 26109641356596) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((12605919278436877 : Rat) / 13054820678298) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12605919278436877 : Rat) / 26109641356596) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-12605919278436877 : Rat) / 13054820678298) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((12605919278436877 : Rat) / 26109641356596) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-12605919278436877 : Rat) / 13054820678298) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((12605919278436877 : Rat) / 26109641356596) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0045
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0046 : Poly :=
[
  term ((247 : Rat) / 63) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0046 : Poly :=
[
  term ((-494 : Rat) / 63) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 63) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 63) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 63) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0046
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0047 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 47 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0047 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0047
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0048 : Poly :=
[
  term ((-14933096265298051 : Rat) / 14919795060912) [(13, 1), (15, 1)]
]

/-- Partial product 48 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0048 : Poly :=
[
  term ((14933096265298051 : Rat) / 7459897530456) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-14933096265298051 : Rat) / 14919795060912) [(0, 2), (13, 1), (15, 1)],
  term ((14933096265298051 : Rat) / 7459897530456) [(1, 1), (13, 2), (15, 1)],
  term ((-14933096265298051 : Rat) / 14919795060912) [(1, 2), (13, 1), (15, 1)],
  term ((-14933096265298051 : Rat) / 7459897530456) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((14933096265298051 : Rat) / 14919795060912) [(6, 2), (13, 1), (15, 1)],
  term ((-14933096265298051 : Rat) / 7459897530456) [(7, 1), (13, 2), (15, 1)],
  term ((14933096265298051 : Rat) / 14919795060912) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0048
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0049 : Poly :=
[
  term ((289 : Rat) / 56) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0049 : Poly :=
[
  term ((-289 : Rat) / 28) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((289 : Rat) / 56) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-289 : Rat) / 28) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((289 : Rat) / 56) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((289 : Rat) / 28) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-289 : Rat) / 56) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((289 : Rat) / 28) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-289 : Rat) / 56) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0049
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0050 : Poly :=
[
  term ((941242657 : Rat) / 333083184) [(13, 2)]
]

/-- Partial product 50 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0050 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(0, 1), (12, 1), (13, 2)],
  term ((941242657 : Rat) / 333083184) [(0, 2), (13, 2)],
  term ((-941242657 : Rat) / 166541592) [(1, 1), (13, 3)],
  term ((941242657 : Rat) / 333083184) [(1, 2), (13, 2)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (12, 1), (13, 2)],
  term ((-941242657 : Rat) / 333083184) [(6, 2), (13, 2)],
  term ((941242657 : Rat) / 166541592) [(7, 1), (13, 3)],
  term ((-941242657 : Rat) / 333083184) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0050
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0051 : Poly :=
[
  term ((2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1)]
]

/-- Partial product 51 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0051 : Poly :=
[
  term ((-2224986028928059 : Rat) / 1598549470812) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(0, 2), (13, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(1, 1), (13, 3), (14, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(1, 2), (13, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(6, 2), (13, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(7, 1), (13, 3), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0051
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0052 : Poly :=
[
  term ((-1495 : Rat) / 252) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 52 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0052 : Poly :=
[
  term ((1495 : Rat) / 126) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(7, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0052
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0053 : Poly :=
[
  term ((725 : Rat) / 168) [(13, 2), (16, 1)]
]

/-- Partial product 53 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0053 : Poly :=
[
  term ((-725 : Rat) / 84) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 168) [(0, 2), (13, 2), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 1), (13, 3), (16, 1)],
  term ((725 : Rat) / 168) [(1, 2), (13, 2), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 168) [(6, 2), (13, 2), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (13, 3), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0053
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0054 : Poly :=
[
  term ((6128799131236 : Rat) / 725267815461) [(14, 1)]
]

/-- Partial product 54 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0054 : Poly :=
[
  term ((-12257598262472 : Rat) / 725267815461) [(0, 1), (12, 1), (14, 1)],
  term ((6128799131236 : Rat) / 725267815461) [(0, 2), (14, 1)],
  term ((-12257598262472 : Rat) / 725267815461) [(1, 1), (13, 1), (14, 1)],
  term ((6128799131236 : Rat) / 725267815461) [(1, 2), (14, 1)],
  term ((12257598262472 : Rat) / 725267815461) [(6, 1), (12, 1), (14, 1)],
  term ((-6128799131236 : Rat) / 725267815461) [(6, 2), (14, 1)],
  term ((12257598262472 : Rat) / 725267815461) [(7, 1), (13, 1), (14, 1)],
  term ((-6128799131236 : Rat) / 725267815461) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0054
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0055 : Poly :=
[
  term ((-4596599348427 : Rat) / 53723541886) [(14, 1), (15, 2)]
]

/-- Partial product 55 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0055 : Poly :=
[
  term ((4596599348427 : Rat) / 26861770943) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4596599348427 : Rat) / 53723541886) [(0, 2), (14, 1), (15, 2)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4596599348427 : Rat) / 53723541886) [(1, 2), (14, 1), (15, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((4596599348427 : Rat) / 53723541886) [(6, 2), (14, 1), (15, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((4596599348427 : Rat) / 53723541886) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0055
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0056 : Poly :=
[
  term ((14089496351201221 : Rat) / 17406427571064) [(15, 2)]
]

/-- Partial product 56 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0056 : Poly :=
[
  term ((-14089496351201221 : Rat) / 8703213785532) [(0, 1), (12, 1), (15, 2)],
  term ((14089496351201221 : Rat) / 17406427571064) [(0, 2), (15, 2)],
  term ((-14089496351201221 : Rat) / 8703213785532) [(1, 1), (13, 1), (15, 2)],
  term ((14089496351201221 : Rat) / 17406427571064) [(1, 2), (15, 2)],
  term ((14089496351201221 : Rat) / 8703213785532) [(6, 1), (12, 1), (15, 2)],
  term ((-14089496351201221 : Rat) / 17406427571064) [(6, 2), (15, 2)],
  term ((14089496351201221 : Rat) / 8703213785532) [(7, 1), (13, 1), (15, 2)],
  term ((-14089496351201221 : Rat) / 17406427571064) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0056
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009YNNNN_coefficient_26_0057 : Poly :=
[
  term ((-247 : Rat) / 42) [(15, 2), (16, 1)]
]

/-- Partial product 57 for generator 26. -/
def rs_R009_ueqv_R009YNNNN_partial_26_0057 : Poly :=
[
  term ((247 : Rat) / 21) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 42) [(0, 2), (15, 2), (16, 1)],
  term ((247 : Rat) / 21) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 42) [(1, 2), (15, 2), (16, 1)],
  term ((-247 : Rat) / 21) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 42) [(6, 2), (15, 2), (16, 1)],
  term ((-247 : Rat) / 21) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 42) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 26. -/
theorem rs_R009_ueqv_R009YNNNN_partial_26_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_26_0057
        rs_R009_ueqv_R009YNNNN_generator_26_0000_0057 =
      rs_R009_ueqv_R009YNNNN_partial_26_0057 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_26_0000_0057 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_26_0000,
  rs_R009_ueqv_R009YNNNN_partial_26_0001,
  rs_R009_ueqv_R009YNNNN_partial_26_0002,
  rs_R009_ueqv_R009YNNNN_partial_26_0003,
  rs_R009_ueqv_R009YNNNN_partial_26_0004,
  rs_R009_ueqv_R009YNNNN_partial_26_0005,
  rs_R009_ueqv_R009YNNNN_partial_26_0006,
  rs_R009_ueqv_R009YNNNN_partial_26_0007,
  rs_R009_ueqv_R009YNNNN_partial_26_0008,
  rs_R009_ueqv_R009YNNNN_partial_26_0009,
  rs_R009_ueqv_R009YNNNN_partial_26_0010,
  rs_R009_ueqv_R009YNNNN_partial_26_0011,
  rs_R009_ueqv_R009YNNNN_partial_26_0012,
  rs_R009_ueqv_R009YNNNN_partial_26_0013,
  rs_R009_ueqv_R009YNNNN_partial_26_0014,
  rs_R009_ueqv_R009YNNNN_partial_26_0015,
  rs_R009_ueqv_R009YNNNN_partial_26_0016,
  rs_R009_ueqv_R009YNNNN_partial_26_0017,
  rs_R009_ueqv_R009YNNNN_partial_26_0018,
  rs_R009_ueqv_R009YNNNN_partial_26_0019,
  rs_R009_ueqv_R009YNNNN_partial_26_0020,
  rs_R009_ueqv_R009YNNNN_partial_26_0021,
  rs_R009_ueqv_R009YNNNN_partial_26_0022,
  rs_R009_ueqv_R009YNNNN_partial_26_0023,
  rs_R009_ueqv_R009YNNNN_partial_26_0024,
  rs_R009_ueqv_R009YNNNN_partial_26_0025,
  rs_R009_ueqv_R009YNNNN_partial_26_0026,
  rs_R009_ueqv_R009YNNNN_partial_26_0027,
  rs_R009_ueqv_R009YNNNN_partial_26_0028,
  rs_R009_ueqv_R009YNNNN_partial_26_0029,
  rs_R009_ueqv_R009YNNNN_partial_26_0030,
  rs_R009_ueqv_R009YNNNN_partial_26_0031,
  rs_R009_ueqv_R009YNNNN_partial_26_0032,
  rs_R009_ueqv_R009YNNNN_partial_26_0033,
  rs_R009_ueqv_R009YNNNN_partial_26_0034,
  rs_R009_ueqv_R009YNNNN_partial_26_0035,
  rs_R009_ueqv_R009YNNNN_partial_26_0036,
  rs_R009_ueqv_R009YNNNN_partial_26_0037,
  rs_R009_ueqv_R009YNNNN_partial_26_0038,
  rs_R009_ueqv_R009YNNNN_partial_26_0039,
  rs_R009_ueqv_R009YNNNN_partial_26_0040,
  rs_R009_ueqv_R009YNNNN_partial_26_0041,
  rs_R009_ueqv_R009YNNNN_partial_26_0042,
  rs_R009_ueqv_R009YNNNN_partial_26_0043,
  rs_R009_ueqv_R009YNNNN_partial_26_0044,
  rs_R009_ueqv_R009YNNNN_partial_26_0045,
  rs_R009_ueqv_R009YNNNN_partial_26_0046,
  rs_R009_ueqv_R009YNNNN_partial_26_0047,
  rs_R009_ueqv_R009YNNNN_partial_26_0048,
  rs_R009_ueqv_R009YNNNN_partial_26_0049,
  rs_R009_ueqv_R009YNNNN_partial_26_0050,
  rs_R009_ueqv_R009YNNNN_partial_26_0051,
  rs_R009_ueqv_R009YNNNN_partial_26_0052,
  rs_R009_ueqv_R009YNNNN_partial_26_0053,
  rs_R009_ueqv_R009YNNNN_partial_26_0054,
  rs_R009_ueqv_R009YNNNN_partial_26_0055,
  rs_R009_ueqv_R009YNNNN_partial_26_0056,
  rs_R009_ueqv_R009YNNNN_partial_26_0057
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_26_0000_0057 : Poly :=
[
  term ((-10813215080142800 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-24970511668502003 : Rat) / 6527410339149) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((59271663677612999 : Rat) / 19582231017447) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((680 : Rat) / 63) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32209701640227467 : Rat) / 13054820678298) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-128 : Rat) / 9) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((3107121728835839 : Rat) / 725267815461) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 3) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((974580364564039 : Rat) / 2175803446383) [(0, 1), (1, 2), (12, 1)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((34625654868081569 : Rat) / 26109641356596) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((747520 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (15, 3)],
  term ((1532199782809 : Rat) / 53723541886) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((1419365441152247 : Rat) / 799274735406) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((7819657675 : Rat) / 333083184) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-223273978116670483 : Rat) / 104438565426384) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((385847904595639 : Rat) / 11604285047376) [(0, 1), (9, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 69073125282) [(0, 1), (10, 1), (12, 1)],
  term ((-521109558037319 : Rat) / 399637367703) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 63) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((16210405826528371 : Rat) / 26109641356596) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 9) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(0, 1), (11, 2), (12, 1)],
  term ((1532199782809 : Rat) / 967023753948) [(0, 1), (12, 1)],
  term ((12605919278436877 : Rat) / 13054820678298) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((14933096265298051 : Rat) / 7459897530456) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-289 : Rat) / 28) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(0, 1), (12, 1), (13, 2)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((1495 : Rat) / 126) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-12257598262472 : Rat) / 725267815461) [(0, 1), (12, 1), (14, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-14089496351201221 : Rat) / 8703213785532) [(0, 1), (12, 1), (15, 2)],
  term ((247 : Rat) / 21) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 1934047507896) [(0, 2)],
  term ((5406607540071400 : Rat) / 6527410339149) [(0, 2), (1, 1), (3, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(0, 2), (1, 1), (7, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(0, 2), (1, 1), (9, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((24970511668502003 : Rat) / 13054820678298) [(0, 2), (1, 1), (11, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(0, 2), (1, 1), (13, 1)],
  term ((-59271663677612999 : Rat) / 39164462034894) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-340 : Rat) / 63) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 21) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((32209701640227467 : Rat) / 26109641356596) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((-3107121728835839 : Rat) / 1450535630922) [(0, 2), (1, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(0, 2), (1, 2)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 2), (1, 2), (14, 1)],
  term ((33944746640006525 : Rat) / 156657848139576) [(0, 2), (3, 1), (11, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((-34625654868081569 : Rat) / 52219282713192) [(0, 2), (3, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(0, 2), (3, 1), (15, 3)],
  term ((-1532199782809 : Rat) / 107447083772) [(0, 2), (7, 1), (9, 1)],
  term ((1118505841450570 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(0, 2), (7, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 8703213785532) [(0, 2), (7, 1), (15, 1)],
  term ((-1419365441152247 : Rat) / 1598549470812) [(0, 2), (9, 1), (11, 1)],
  term ((-7819657675 : Rat) / 666166368) [(0, 2), (9, 1), (13, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((223273978116670483 : Rat) / 208877130852768) [(0, 2), (9, 1), (15, 1)],
  term ((157 : Rat) / 14) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(0, 2), (9, 2)],
  term ((1532199782809 : Rat) / 138146250564) [(0, 2), (10, 1)],
  term ((521109558037319 : Rat) / 799274735406) [(0, 2), (11, 1), (13, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((85 : Rat) / 63) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-16210405826528371 : Rat) / 52219282713192) [(0, 2), (11, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((3445707804341129 : Rat) / 13054820678298) [(0, 2), (11, 2)],
  term ((-12605919278436877 : Rat) / 26109641356596) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-14933096265298051 : Rat) / 14919795060912) [(0, 2), (13, 1), (15, 1)],
  term ((289 : Rat) / 56) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 333083184) [(0, 2), (13, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(0, 2), (13, 2), (14, 1)],
  term ((-1495 : Rat) / 252) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(0, 2), (13, 2), (16, 1)],
  term ((6128799131236 : Rat) / 725267815461) [(0, 2), (14, 1)],
  term ((-4596599348427 : Rat) / 53723541886) [(0, 2), (14, 1), (15, 2)],
  term ((14089496351201221 : Rat) / 17406427571064) [(0, 2), (15, 2)],
  term ((-247 : Rat) / 42) [(0, 2), (15, 2), (16, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (12, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((34625654868081569 : Rat) / 26109641356596) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((747520 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (12, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((24970511668502003 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-59271663677612999 : Rat) / 19582231017447) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-680 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((170 : Rat) / 21) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((32209701640227467 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((128 : Rat) / 9) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3107121728835839 : Rat) / 725267815461) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(1, 1), (6, 2), (7, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(1, 1), (6, 2), (7, 1), (14, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(1, 1), (6, 2), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (6, 2), (9, 1), (14, 1)],
  term ((-24970511668502003 : Rat) / 13054820678298) [(1, 1), (6, 2), (11, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(1, 1), (6, 2), (13, 1)],
  term ((59271663677612999 : Rat) / 39164462034894) [(1, 1), (6, 2), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-32209701640227467 : Rat) / 26109641356596) [(1, 1), (6, 2), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 2), (14, 2), (15, 1)],
  term ((3107121728835839 : Rat) / 1450535630922) [(1, 1), (6, 2), (15, 1)],
  term ((16 : Rat) / 3) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-12952264145830894 : Rat) / 6527410339149) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((7577833328533621 : Rat) / 2175803446383) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((32209701640227467 : Rat) / 13054820678298) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((128 : Rat) / 9) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-14292815189620283 : Rat) / 4351606892766) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((27353316354219949 : Rat) / 13054820678298) [(1, 1), (7, 1), (13, 2)],
  term ((-72321409227797252 : Rat) / 19582231017447) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-680 : Rat) / 63) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((170 : Rat) / 21) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(1, 1), (7, 2), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (7, 2), (9, 1), (14, 1)],
  term ((-24970511668502003 : Rat) / 13054820678298) [(1, 1), (7, 2), (11, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(1, 1), (7, 2), (11, 1), (14, 1)],
  term ((-28613307759823511 : Rat) / 13054820678298) [(1, 1), (7, 2), (13, 1)],
  term ((5583383287985639 : Rat) / 39164462034894) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-32209701640227467 : Rat) / 26109641356596) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (7, 2), (14, 2), (15, 1)],
  term ((3107121728835839 : Rat) / 1450535630922) [(1, 1), (7, 2), (15, 1)],
  term ((16 : Rat) / 3) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(1, 1), (7, 3)],
  term ((4474023365802280 : Rat) / 6527410339149) [(1, 1), (7, 3), (14, 1)],
  term ((1419365441152247 : Rat) / 799274735406) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-223273978116670483 : Rat) / 104438565426384) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-157 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7819657675 : Rat) / 333083184) [(1, 1), (9, 1), (13, 2)],
  term ((53777198303881 : Rat) / 40469606856) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((725 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((385847904595639 : Rat) / 11604285047376) [(1, 1), (9, 2), (13, 1)],
  term ((-1532199782809 : Rat) / 69073125282) [(1, 1), (10, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((16210405826528371 : Rat) / 26109641356596) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-521109558037319 : Rat) / 399637367703) [(1, 1), (11, 1), (13, 2)],
  term ((-706121836024930 : Rat) / 6527410339149) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(1, 1), (11, 2), (13, 1)],
  term ((1532199782809 : Rat) / 967023753948) [(1, 1), (13, 1)],
  term ((-12257598262472 : Rat) / 725267815461) [(1, 1), (13, 1), (14, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-14089496351201221 : Rat) / 8703213785532) [(1, 1), (13, 1), (15, 2)],
  term ((247 : Rat) / 21) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((12605919278436877 : Rat) / 13054820678298) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((14933096265298051 : Rat) / 7459897530456) [(1, 1), (13, 2), (15, 1)],
  term ((-289 : Rat) / 28) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 1), (13, 3)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(1, 1), (13, 3), (14, 1)],
  term ((1495 : Rat) / 126) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 1), (13, 3), (16, 1)],
  term ((-1532199782809 : Rat) / 1934047507896) [(1, 2)],
  term ((33944746640006525 : Rat) / 156657848139576) [(1, 2), (3, 1), (11, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(1, 2), (3, 1), (13, 1)],
  term ((169723733200032625 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-34625654868081569 : Rat) / 52219282713192) [(1, 2), (3, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(1, 2), (3, 1), (15, 3)],
  term ((-974580364564039 : Rat) / 2175803446383) [(1, 2), (6, 1), (12, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(1, 2), (6, 1), (12, 1), (14, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 2), (6, 2)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (6, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(1, 2), (7, 1), (9, 1)],
  term ((1118505841450570 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1)],
  term ((2019814976739845 : Rat) / 2901071261844) [(1, 2), (7, 1), (13, 1)],
  term ((28001761452414595 : Rat) / 13054820678298) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 8703213785532) [(1, 2), (7, 1), (15, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 2), (7, 2)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (7, 2), (14, 1)],
  term ((-1419365441152247 : Rat) / 1598549470812) [(1, 2), (9, 1), (11, 1)],
  term ((107976694378325 : Rat) / 53959475808) [(1, 2), (9, 1), (13, 1)],
  term ((-270997371603881 : Rat) / 80939213712) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((223273978116670483 : Rat) / 208877130852768) [(1, 2), (9, 1), (15, 1)],
  term ((157 : Rat) / 14) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-385847904595639 : Rat) / 23208570094752) [(1, 2), (9, 2)],
  term ((1532199782809 : Rat) / 138146250564) [(1, 2), (10, 1)],
  term ((-124288701667183387 : Rat) / 39164462034894) [(1, 2), (11, 1), (13, 1)],
  term ((9100461302319181 : Rat) / 6527410339149) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((85 : Rat) / 63) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-16210405826528371 : Rat) / 52219282713192) [(1, 2), (11, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((3445707804341129 : Rat) / 13054820678298) [(1, 2), (11, 2)],
  term ((-77025322558891811 : Rat) / 26109641356596) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-649 : Rat) / 63) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7660998914045 : Rat) / 26861770943) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((342893855095274459 : Rat) / 104438565426384) [(1, 2), (13, 1), (15, 1)],
  term ((2659 : Rat) / 168) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-640012445238119 : Rat) / 304485613488) [(1, 2), (13, 2)],
  term ((583197624838378883 : Rat) / 156657848139576) [(1, 2), (13, 2), (14, 1)],
  term ((175 : Rat) / 36) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-635 : Rat) / 168) [(1, 2), (13, 2), (16, 1)],
  term ((6128799131236 : Rat) / 725267815461) [(1, 2), (14, 1)],
  term ((-4596599348427 : Rat) / 53723541886) [(1, 2), (14, 1), (15, 2)],
  term ((14089496351201221 : Rat) / 17406427571064) [(1, 2), (15, 2)],
  term ((-247 : Rat) / 42) [(1, 2), (15, 2), (16, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(1, 3), (3, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 3), (3, 1), (14, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(1, 3), (7, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(1, 3), (7, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 3), (9, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 3), (9, 1), (14, 1)],
  term ((24970511668502003 : Rat) / 13054820678298) [(1, 3), (11, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(1, 3), (11, 1), (14, 1)],
  term ((19586194455697973 : Rat) / 13054820678298) [(1, 3), (13, 1)],
  term ((-76538922095045171 : Rat) / 39164462034894) [(1, 3), (13, 1), (14, 1)],
  term ((-340 : Rat) / 63) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 21) [(1, 3), (13, 1), (16, 1)],
  term ((32209701640227467 : Rat) / 26109641356596) [(1, 3), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 3), (14, 2), (15, 1)],
  term ((-3107121728835839 : Rat) / 1450535630922) [(1, 3), (15, 1)],
  term ((-16 : Rat) / 3) [(1, 3), (15, 1), (16, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 4)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 4), (14, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-34625654868081569 : Rat) / 26109641356596) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-747520 : Rat) / 3087) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-33944746640006525 : Rat) / 156657848139576) [(3, 1), (6, 2), (11, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((34625654868081569 : Rat) / 52219282713192) [(3, 1), (6, 2), (15, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (6, 2), (15, 3)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-34625654868081569 : Rat) / 26109641356596) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-747520 : Rat) / 3087) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((-33944746640006525 : Rat) / 156657848139576) [(3, 1), (7, 2), (11, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((34625654868081569 : Rat) / 52219282713192) [(3, 1), (7, 2), (15, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 2), (15, 3)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1419365441152247 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-7819657675 : Rat) / 333083184) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 28) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((223273978116670483 : Rat) / 104438565426384) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 7) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-385847904595639 : Rat) / 11604285047376) [(6, 1), (9, 2), (12, 1)],
  term ((1532199782809 : Rat) / 69073125282) [(6, 1), (10, 1), (12, 1)],
  term ((521109558037319 : Rat) / 399637367703) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16210405826528371 : Rat) / 26109641356596) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 967023753948) [(6, 1), (12, 1)],
  term ((-12605919278436877 : Rat) / 13054820678298) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((494 : Rat) / 63) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-14933096265298051 : Rat) / 7459897530456) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((289 : Rat) / 28) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (12, 1), (13, 2)],
  term ((2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1495 : Rat) / 126) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((12257598262472 : Rat) / 725267815461) [(6, 1), (12, 1), (14, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((14089496351201221 : Rat) / 8703213785532) [(6, 1), (12, 1), (15, 2)],
  term ((-247 : Rat) / 21) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1532199782809 : Rat) / 1934047507896) [(6, 2)],
  term ((1532199782809 : Rat) / 107447083772) [(6, 2), (7, 1), (9, 1)],
  term ((-1118505841450570 : Rat) / 6527410339149) [(6, 2), (7, 1), (11, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(6, 2), (7, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 8703213785532) [(6, 2), (7, 1), (15, 1)],
  term ((1419365441152247 : Rat) / 1598549470812) [(6, 2), (9, 1), (11, 1)],
  term ((7819657675 : Rat) / 666166368) [(6, 2), (9, 1), (13, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 56) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-223273978116670483 : Rat) / 208877130852768) [(6, 2), (9, 1), (15, 1)],
  term ((-157 : Rat) / 14) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((385847904595639 : Rat) / 23208570094752) [(6, 2), (9, 2)],
  term ((-1532199782809 : Rat) / 138146250564) [(6, 2), (10, 1)],
  term ((-521109558037319 : Rat) / 799274735406) [(6, 2), (11, 1), (13, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-85 : Rat) / 63) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((16210405826528371 : Rat) / 52219282713192) [(6, 2), (11, 1), (15, 1)],
  term ((16 : Rat) / 9) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3445707804341129 : Rat) / 13054820678298) [(6, 2), (11, 2)],
  term ((12605919278436877 : Rat) / 26109641356596) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((14933096265298051 : Rat) / 14919795060912) [(6, 2), (13, 1), (15, 1)],
  term ((-289 : Rat) / 56) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 333083184) [(6, 2), (13, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(6, 2), (13, 2), (14, 1)],
  term ((1495 : Rat) / 252) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(6, 2), (13, 2), (16, 1)],
  term ((-6128799131236 : Rat) / 725267815461) [(6, 2), (14, 1)],
  term ((4596599348427 : Rat) / 53723541886) [(6, 2), (14, 1), (15, 2)],
  term ((-14089496351201221 : Rat) / 17406427571064) [(6, 2), (15, 2)],
  term ((247 : Rat) / 42) [(6, 2), (15, 2), (16, 1)],
  term ((-1419365441152247 : Rat) / 799274735406) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((223273978116670483 : Rat) / 104438565426384) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((157 : Rat) / 7) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7819657675 : Rat) / 333083184) [(7, 1), (9, 1), (13, 2)],
  term ((-53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-725 : Rat) / 28) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-385847904595639 : Rat) / 11604285047376) [(7, 1), (9, 2), (13, 1)],
  term ((1532199782809 : Rat) / 69073125282) [(7, 1), (10, 1), (13, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16210405826528371 : Rat) / 26109641356596) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((521109558037319 : Rat) / 399637367703) [(7, 1), (11, 1), (13, 2)],
  term ((706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((170 : Rat) / 63) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(7, 1), (11, 2), (13, 1)],
  term ((-1532199782809 : Rat) / 967023753948) [(7, 1), (13, 1)],
  term ((12257598262472 : Rat) / 725267815461) [(7, 1), (13, 1), (14, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((14089496351201221 : Rat) / 8703213785532) [(7, 1), (13, 1), (15, 2)],
  term ((-247 : Rat) / 21) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12605919278436877 : Rat) / 13054820678298) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((494 : Rat) / 63) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-14933096265298051 : Rat) / 7459897530456) [(7, 1), (13, 2), (15, 1)],
  term ((289 : Rat) / 28) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(7, 1), (13, 3)],
  term ((2224986028928059 : Rat) / 1598549470812) [(7, 1), (13, 3), (14, 1)],
  term ((-1495 : Rat) / 126) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (13, 3), (16, 1)],
  term ((1532199782809 : Rat) / 1934047507896) [(7, 2)],
  term ((1419365441152247 : Rat) / 1598549470812) [(7, 2), (9, 1), (11, 1)],
  term ((-43275694714907 : Rat) / 2578730010528) [(7, 2), (9, 1), (13, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 56) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-223273978116670483 : Rat) / 208877130852768) [(7, 2), (9, 1), (15, 1)],
  term ((-157 : Rat) / 14) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((385847904595639 : Rat) / 23208570094752) [(7, 2), (9, 2)],
  term ((-1532199782809 : Rat) / 138146250564) [(7, 2), (10, 1)],
  term ((-12112298246421791 : Rat) / 39164462034894) [(7, 2), (11, 1), (13, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-85 : Rat) / 63) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((16210405826528371 : Rat) / 52219282713192) [(7, 2), (11, 1), (15, 1)],
  term ((16 : Rat) / 9) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3445707804341129 : Rat) / 13054820678298) [(7, 2), (11, 2)],
  term ((12605919278436877 : Rat) / 26109641356596) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((133709455612333 : Rat) / 104438565426384) [(7, 2), (13, 1), (15, 1)],
  term ((-289 : Rat) / 56) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((8614047937225 : Rat) / 1289365005264) [(7, 2), (13, 2)],
  term ((-4626351016000867 : Rat) / 156657848139576) [(7, 2), (13, 2), (14, 1)],
  term ((1495 : Rat) / 252) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 2), (13, 2), (16, 1)],
  term ((-6128799131236 : Rat) / 725267815461) [(7, 2), (14, 1)],
  term ((4596599348427 : Rat) / 53723541886) [(7, 2), (14, 1), (15, 2)],
  term ((-14089496351201221 : Rat) / 17406427571064) [(7, 2), (15, 2)],
  term ((247 : Rat) / 42) [(7, 2), (15, 2), (16, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(7, 3), (9, 1)],
  term ((-1118505841450570 : Rat) / 6527410339149) [(7, 3), (11, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 3), (13, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 3), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 8703213785532) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 0 through 57. -/
theorem rs_R009_ueqv_R009YNNNN_block_26_0000_0057_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_26_0000_0057
      rs_R009_ueqv_R009YNNNN_block_26_0000_0057 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
