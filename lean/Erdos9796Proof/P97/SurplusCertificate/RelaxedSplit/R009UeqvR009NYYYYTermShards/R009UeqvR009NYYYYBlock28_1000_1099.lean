/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 28:1000-1099

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1000 : Poly :=
[
  term ((381240 : Rat) / 32699) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1000 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1000 : Poly :=
[
  term ((762480 : Rat) / 32699) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-381240 : Rat) / 32699) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1000_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1000
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1001 : Poly :=
[
  term ((8803538659 : Rat) / 132757940) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1001 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1001 : Poly :=
[
  term ((-8803538659 : Rat) / 132757940) [(10, 1), (14, 1), (15, 2)],
  term ((8803538659 : Rat) / 66378970) [(10, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1001_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1001
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1002 : Poly :=
[
  term ((-841905 : Rat) / 65398) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1002 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1002 : Poly :=
[
  term ((841905 : Rat) / 65398) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-841905 : Rat) / 32699) [(10, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1002_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1002
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1003 : Poly :=
[
  term ((48182297683 : Rat) / 106206352) [(10, 1), (15, 2)]
]

/-- Partial product 1003 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1003 : Poly :=
[
  term ((48182297683 : Rat) / 53103176) [(10, 1), (14, 1), (15, 2)],
  term ((-48182297683 : Rat) / 106206352) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1003_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1003
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1004 : Poly :=
[
  term ((-11579487 : Rat) / 130796) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1004 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1004 : Poly :=
[
  term ((-11579487 : Rat) / 65398) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((11579487 : Rat) / 130796) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1004_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1004
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1005 : Poly :=
[
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (15, 4)]
]

/-- Partial product 1005 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1005 : Poly :=
[
  term ((-5979762108 : Rat) / 33189485) [(10, 1), (14, 1), (15, 4)],
  term ((2989881054 : Rat) / 33189485) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1005_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1005
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1006 : Poly :=
[
  term ((571860 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 1006 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1006 : Poly :=
[
  term ((1143720 : Rat) / 32699) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-571860 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1006_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1006
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1007 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 1007 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1007 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1007_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1007
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1008 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(10, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1008 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1008 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5888 : Rat) / 32699) [(10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1008_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1008
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1009 : Poly :=
[
  term ((1488258816 : Rat) / 33189485) [(10, 2), (13, 1), (15, 1)]
]

/-- Partial product 1009 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1009 : Poly :=
[
  term ((2976517632 : Rat) / 33189485) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1488258816 : Rat) / 33189485) [(10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1009_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1009
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1010 : Poly :=
[
  term ((-282624 : Rat) / 32699) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1010 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1010 : Poly :=
[
  term ((-565248 : Rat) / 32699) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((282624 : Rat) / 32699) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1010_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1010
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1011 : Poly :=
[
  term ((-806140192 : Rat) / 33189485) [(10, 2), (15, 2)]
]

/-- Partial product 1011 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1011 : Poly :=
[
  term ((-1612280384 : Rat) / 33189485) [(10, 2), (14, 1), (15, 2)],
  term ((806140192 : Rat) / 33189485) [(10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1011_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1011
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1012 : Poly :=
[
  term ((153088 : Rat) / 32699) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 1012 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1012 : Poly :=
[
  term ((306176 : Rat) / 32699) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-153088 : Rat) / 32699) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1012_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1012
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1013 : Poly :=
[
  term ((-1778934366 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1013 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1013 : Poly :=
[
  term ((1778934366 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3557868732 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1013_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1013
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1014 : Poly :=
[
  term ((1689120 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1014 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1014 : Poly :=
[
  term ((-1689120 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3378240 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1014_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1014
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1015 : Poly :=
[
  term ((-31513819269 : Rat) / 33189485) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1015 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1015 : Poly :=
[
  term ((-63027638538 : Rat) / 33189485) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((31513819269 : Rat) / 33189485) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1015_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1015
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1016 : Poly :=
[
  term ((5948336 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1016 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1016 : Poly :=
[
  term ((11896672 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5948336 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1016_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1016
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1017 : Poly :=
[
  term ((10658103500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)]
]

/-- Partial product 1017 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1017 : Poly :=
[
  term ((21316207000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 4)],
  term ((-10658103500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1017_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1017
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1018 : Poly :=
[
  term ((-10120000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 1018 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1018 : Poly :=
[
  term ((-20240000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((10120000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1018_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1018
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1019 : Poly :=
[
  term ((-1651414487 : Rat) / 66378970) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1019 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1019 : Poly :=
[
  term ((1651414487 : Rat) / 66378970) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1651414487 : Rat) / 33189485) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1019_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1019
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1020 : Poly :=
[
  term ((159520 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1020 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1020 : Poly :=
[
  term ((-159520 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((319040 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1020_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1020
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1021 : Poly :=
[
  term ((253596244673 : Rat) / 79654764) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1021 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1021 : Poly :=
[
  term ((253596244673 : Rat) / 39827382) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-253596244673 : Rat) / 79654764) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1021_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1021
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1022 : Poly :=
[
  term ((-60654016 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1022 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1022 : Poly :=
[
  term ((-121308032 : Rat) / 98097) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((60654016 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1022_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1022
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1023 : Poly :=
[
  term ((-2417790145 : Rat) / 3793084) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 1023 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1023 : Poly :=
[
  term ((-2417790145 : Rat) / 1896542) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((2417790145 : Rat) / 3793084) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1023_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1023
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1024 : Poly :=
[
  term ((4020032 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1024 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1024 : Poly :=
[
  term ((8040064 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4020032 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1024_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1024
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1025 : Poly :=
[
  term ((2906755500 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 1025 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1025 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((-2906755500 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1025_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1025
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1026 : Poly :=
[
  term ((-2760000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1026 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1026 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2760000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1026_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1026
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1027 : Poly :=
[
  term ((-6896576970 : Rat) / 6637897) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1027 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1027 : Poly :=
[
  term ((-13793153940 : Rat) / 6637897) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((6896576970 : Rat) / 6637897) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1027_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1027
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1028 : Poly :=
[
  term ((6601522 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1028 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1028 : Poly :=
[
  term ((13203044 : Rat) / 32699) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6601522 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1028_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1028
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1029 : Poly :=
[
  term ((1778934366 : Rat) / 6637897) [(11, 1), (12, 2), (15, 3)]
]

/-- Partial product 1029 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1029 : Poly :=
[
  term ((3557868732 : Rat) / 6637897) [(11, 1), (12, 2), (14, 1), (15, 3)],
  term ((-1778934366 : Rat) / 6637897) [(11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1029_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1029
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1030 : Poly :=
[
  term ((-1689120 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

/-- Partial product 1030 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1030 : Poly :=
[
  term ((-3378240 : Rat) / 32699) [(11, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((1689120 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1030_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1030
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1031 : Poly :=
[
  term ((142649246203 : Rat) / 132757940) [(11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1031 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1031 : Poly :=
[
  term ((-142649246203 : Rat) / 132757940) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((142649246203 : Rat) / 66378970) [(11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1031_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1031
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1032 : Poly :=
[
  term ((-6774880 : Rat) / 32699) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1032 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1032 : Poly :=
[
  term ((6774880 : Rat) / 32699) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13549760 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1032_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1032
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1033 : Poly :=
[
  term ((-739657043831 : Rat) / 796547640) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1033 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1033 : Poly :=
[
  term ((-739657043831 : Rat) / 398273820) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((739657043831 : Rat) / 796547640) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1033_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1033
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1034 : Poly :=
[
  term ((17814160 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1034 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1034 : Poly :=
[
  term ((35628320 : Rat) / 98097) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17814160 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1034_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1034
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1035 : Poly :=
[
  term ((-968918500 : Rat) / 948271) [(11, 1), (13, 1), (15, 4)]
]

/-- Partial product 1035 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1035 : Poly :=
[
  term ((-1937837000 : Rat) / 948271) [(11, 1), (13, 1), (14, 1), (15, 4)],
  term ((968918500 : Rat) / 948271) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1035_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1035
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1036 : Poly :=
[
  term ((6440000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 1036 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1036 : Poly :=
[
  term ((12880000 : Rat) / 32699) [(11, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-6440000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1036_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1036
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1037 : Poly :=
[
  term ((-37897564234 : Rat) / 33189485) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1037 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1037 : Poly :=
[
  term ((37897564234 : Rat) / 33189485) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-75795128468 : Rat) / 33189485) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1037_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1037
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1038 : Poly :=
[
  term ((7233056 : Rat) / 32699) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1038 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1038 : Poly :=
[
  term ((-7233056 : Rat) / 32699) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((14466112 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1038_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1038
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1039 : Poly :=
[
  term ((-10658103500 : Rat) / 6637897) [(11, 1), (13, 2), (14, 1), (15, 3)]
]

/-- Partial product 1039 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1039 : Poly :=
[
  term ((10658103500 : Rat) / 6637897) [(11, 1), (13, 2), (14, 1), (15, 3)],
  term ((-21316207000 : Rat) / 6637897) [(11, 1), (13, 2), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1039_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1039
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1040 : Poly :=
[
  term ((10120000 : Rat) / 32699) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1040 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1040 : Poly :=
[
  term ((-10120000 : Rat) / 32699) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((20240000 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1040_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1040
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1041 : Poly :=
[
  term ((-18948782117 : Rat) / 33189485) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1041 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1041 : Poly :=
[
  term ((-37897564234 : Rat) / 33189485) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((18948782117 : Rat) / 33189485) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1041_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1041
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1042 : Poly :=
[
  term ((3616528 : Rat) / 32699) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1042 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1042 : Poly :=
[
  term ((7233056 : Rat) / 32699) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3616528 : Rat) / 32699) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1042_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1042
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1043 : Poly :=
[
  term ((6297970250 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)]
]

/-- Partial product 1043 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1043 : Poly :=
[
  term ((12595940500 : Rat) / 6637897) [(11, 1), (13, 2), (14, 1), (15, 3)],
  term ((-6297970250 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1043_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1043
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1044 : Poly :=
[
  term ((-5980000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 1044 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1044 : Poly :=
[
  term ((-11960000 : Rat) / 32699) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((5980000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1044_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1044
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1045 : Poly :=
[
  term ((-221207411291 : Rat) / 398273820) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1045 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1045 : Poly :=
[
  term ((221207411291 : Rat) / 398273820) [(11, 1), (14, 1), (15, 1)],
  term ((-221207411291 : Rat) / 199136910) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1045_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1045
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1046 : Poly :=
[
  term ((10592162 : Rat) / 98097) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1046 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1046 : Poly :=
[
  term ((-10592162 : Rat) / 98097) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((21184324 : Rat) / 98097) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1046_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1046
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1047 : Poly :=
[
  term ((-852099676969 : Rat) / 796547640) [(11, 1), (15, 1)]
]

/-- Partial product 1047 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1047 : Poly :=
[
  term ((-852099676969 : Rat) / 398273820) [(11, 1), (14, 1), (15, 1)],
  term ((852099676969 : Rat) / 796547640) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1047_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1047
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1048 : Poly :=
[
  term ((20392841 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1048 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1048 : Poly :=
[
  term ((40785682 : Rat) / 98097) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20392841 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1048_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1048
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1049 : Poly :=
[
  term ((7627425668 : Rat) / 4741355) [(11, 1), (15, 3)]
]

/-- Partial product 1049 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1049 : Poly :=
[
  term ((15254851336 : Rat) / 4741355) [(11, 1), (14, 1), (15, 3)],
  term ((-7627425668 : Rat) / 4741355) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1049_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1049
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1050 : Poly :=
[
  term ((-10173774 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1050 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1050 : Poly :=
[
  term ((-20347548 : Rat) / 32699) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((10173774 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1050_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1050
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1051 : Poly :=
[
  term ((139524264 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1051 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1051 : Poly :=
[
  term ((-139524264 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((279048528 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1051_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1051
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1052 : Poly :=
[
  term ((-26496 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1052 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1052 : Poly :=
[
  term ((26496 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52992 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1052_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1052
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1053 : Poly :=
[
  term ((28493955248 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1053 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1053 : Poly :=
[
  term ((56987910496 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28493955248 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1053_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1053
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1054 : Poly :=
[
  term ((-5411072 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1054 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1054 : Poly :=
[
  term ((-10822144 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5411072 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1054_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1054
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1055 : Poly :=
[
  term ((-25517437616 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 1055 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1055 : Poly :=
[
  term ((-51034875232 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((25517437616 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1055_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1055
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1056 : Poly :=
[
  term ((4845824 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1056 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1056 : Poly :=
[
  term ((9691648 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4845824 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1056_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1056
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1057 : Poly :=
[
  term ((-23254044 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1057 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1057 : Poly :=
[
  term ((23254044 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-46508088 : Rat) / 33189485) [(11, 2), (12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1057_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1057
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1058 : Poly :=
[
  term ((4416 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1058 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1058 : Poly :=
[
  term ((-4416 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8832 : Rat) / 32699) [(11, 2), (12, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1058_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1058
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1059 : Poly :=
[
  term ((-36175541116 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 1059 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1059 : Poly :=
[
  term ((-72351082232 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((36175541116 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1059_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1059
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1060 : Poly :=
[
  term ((6869824 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1060 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1060 : Poly :=
[
  term ((13739648 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6869824 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1060_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1060
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1061 : Poly :=
[
  term ((37563032408 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)]
]

/-- Partial product 1061 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1061 : Poly :=
[
  term ((75126064816 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 4)],
  term ((-37563032408 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1061_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1061
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1062 : Poly :=
[
  term ((-7133312 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 1062 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1062 : Poly :=
[
  term ((-14266624 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((7133312 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1062_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1062
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1063 : Poly :=
[
  term ((-6883197024 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1063 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1063 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1063_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1063
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1064 : Poly :=
[
  term ((1307136 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1064 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1064 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1064_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1064
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1065 : Poly :=
[
  term ((2046355872 : Rat) / 6637897) [(11, 2), (12, 2), (15, 2)]
]

/-- Partial product 1065 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1065 : Poly :=
[
  term ((4092711744 : Rat) / 6637897) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(11, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1065_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1065
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1066 : Poly :=
[
  term ((-1943040 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1066 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1066 : Poly :=
[
  term ((-3886080 : Rat) / 32699) [(11, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((1943040 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1066_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1066
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1067 : Poly :=
[
  term ((-4333003532 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1067 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1067 : Poly :=
[
  term ((4333003532 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-8666007064 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1067_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1067
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1068 : Poly :=
[
  term ((822848 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1068 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1068 : Poly :=
[
  term ((-822848 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1645696 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1068_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1068
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1069 : Poly :=
[
  term ((-37563032408 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1069 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1069 : Poly :=
[
  term ((37563032408 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-75126064816 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1069_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1069
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1070 : Poly :=
[
  term ((7133312 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1070 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1070 : Poly :=
[
  term ((-7133312 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((14266624 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1070_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1070
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1071 : Poly :=
[
  term ((-12894367398 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 1071 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1071 : Poly :=
[
  term ((-25788734796 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((12894367398 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1071_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1071
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1072 : Poly :=
[
  term ((2448672 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1072 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1072 : Poly :=
[
  term ((4897344 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2448672 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1072_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1072
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1073 : Poly :=
[
  term ((38392426644 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 1073 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1073 : Poly :=
[
  term ((76784853288 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-38392426644 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1073_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1073
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1074 : Poly :=
[
  term ((-7290816 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1074 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1074 : Poly :=
[
  term ((-14581632 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((7290816 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1074_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1074
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1075 : Poly :=
[
  term ((25517437616 : Rat) / 33189485) [(11, 2), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1075 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1075 : Poly :=
[
  term ((-25517437616 : Rat) / 33189485) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((51034875232 : Rat) / 33189485) [(11, 2), (13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1075_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1075
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1076 : Poly :=
[
  term ((-4845824 : Rat) / 32699) [(11, 2), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1076 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1076 : Poly :=
[
  term ((4845824 : Rat) / 32699) [(11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9691648 : Rat) / 32699) [(11, 2), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1076_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1076
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1077 : Poly :=
[
  term ((-14774069288 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

/-- Partial product 1077 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1077 : Poly :=
[
  term ((-29548138576 : Rat) / 33189485) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((14774069288 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1077_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1077
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1078 : Poly :=
[
  term ((2805632 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1078 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1078 : Poly :=
[
  term ((5611264 : Rat) / 32699) [(11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2805632 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1078_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1078
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1079 : Poly :=
[
  term ((903032042 : Rat) / 6637897) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 1079 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1079 : Poly :=
[
  term ((-903032042 : Rat) / 6637897) [(11, 2), (14, 1), (15, 2)],
  term ((1806064084 : Rat) / 6637897) [(11, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1079_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1079
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1080 : Poly :=
[
  term ((-857440 : Rat) / 32699) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1080 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1080 : Poly :=
[
  term ((857440 : Rat) / 32699) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1714880 : Rat) / 32699) [(11, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1080_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1080
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1081 : Poly :=
[
  term ((5257351781 : Rat) / 33189485) [(11, 2), (15, 2)]
]

/-- Partial product 1081 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1081 : Poly :=
[
  term ((10514703562 : Rat) / 33189485) [(11, 2), (14, 1), (15, 2)],
  term ((-5257351781 : Rat) / 33189485) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1081_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1081
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1082 : Poly :=
[
  term ((-998384 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1082 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1082 : Poly :=
[
  term ((-1996768 : Rat) / 32699) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((998384 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1082_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1082
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1083 : Poly :=
[
  term ((-23905157232 : Rat) / 33189485) [(11, 2), (15, 4)]
]

/-- Partial product 1083 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1083 : Poly :=
[
  term ((-47810314464 : Rat) / 33189485) [(11, 2), (14, 1), (15, 4)],
  term ((23905157232 : Rat) / 33189485) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1083_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1083
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1084 : Poly :=
[
  term ((4539648 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

/-- Partial product 1084 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1084 : Poly :=
[
  term ((9079296 : Rat) / 32699) [(11, 2), (14, 1), (15, 4), (16, 1)],
  term ((-4539648 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1084_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1084
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1085 : Poly :=
[
  term ((744129408 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1085 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1085 : Poly :=
[
  term ((1488258816 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-744129408 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1085_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1085
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1086 : Poly :=
[
  term ((-141312 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1086 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1086 : Poly :=
[
  term ((-282624 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((141312 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1086_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1086
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1087 : Poly :=
[
  term ((186032352 : Rat) / 33189485) [(11, 3), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1087 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1087 : Poly :=
[
  term ((-186032352 : Rat) / 33189485) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1087_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1087
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1088 : Poly :=
[
  term ((-35328 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1088 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1088 : Poly :=
[
  term ((35328 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70656 : Rat) / 32699) [(11, 3), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1088_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1088
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1089 : Poly :=
[
  term ((713124016 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 1089 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1089 : Poly :=
[
  term ((1426248032 : Rat) / 33189485) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-713124016 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1089_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1089
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1090 : Poly :=
[
  term ((-135424 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1090 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1090 : Poly :=
[
  term ((-270848 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((135424 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1090_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1090
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1091 : Poly :=
[
  term ((-186032352 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)]
]

/-- Partial product 1091 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1091 : Poly :=
[
  term ((-372064704 : Rat) / 33189485) [(11, 3), (12, 1), (14, 1), (15, 3)],
  term ((186032352 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1091_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1091
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1092 : Poly :=
[
  term ((35328 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1092 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1092 : Poly :=
[
  term ((70656 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-35328 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1092_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1092
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1093 : Poly :=
[
  term ((-372064704 : Rat) / 33189485) [(11, 3), (12, 2), (15, 1)]
]

/-- Partial product 1093 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1093 : Poly :=
[
  term ((-744129408 : Rat) / 33189485) [(11, 3), (12, 2), (14, 1), (15, 1)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1093_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1093
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1094 : Poly :=
[
  term ((70656 : Rat) / 32699) [(11, 3), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1094 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1094 : Poly :=
[
  term ((141312 : Rat) / 32699) [(11, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-70656 : Rat) / 32699) [(11, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1094_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1094
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1095 : Poly :=
[
  term ((186032352 : Rat) / 33189485) [(11, 3), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1095 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1095 : Poly :=
[
  term ((-186032352 : Rat) / 33189485) [(11, 3), (13, 1), (14, 1), (15, 2)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1095_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1095
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1096 : Poly :=
[
  term ((-35328 : Rat) / 32699) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1096 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1096 : Poly :=
[
  term ((35328 : Rat) / 32699) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-70656 : Rat) / 32699) [(11, 3), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1096_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1096
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1097 : Poly :=
[
  term ((-403070096 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

/-- Partial product 1097 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1097 : Poly :=
[
  term ((-806140192 : Rat) / 33189485) [(11, 3), (13, 1), (14, 1), (15, 2)],
  term ((403070096 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1097_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1097
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1098 : Poly :=
[
  term ((76544 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1098 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1098 : Poly :=
[
  term ((153088 : Rat) / 32699) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-76544 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1098_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1098
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1099 : Poly :=
[
  term ((-744129408 : Rat) / 33189485) [(11, 3), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1099 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1099 : Poly :=
[
  term ((744129408 : Rat) / 33189485) [(11, 3), (13, 2), (14, 1), (15, 1)],
  term ((-1488258816 : Rat) / 33189485) [(11, 3), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1099_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1099
        rs_R009_ueqv_R009NYYYY_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYYYY_partial_28_1099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_28_1000_1099 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_28_1000,
  rs_R009_ueqv_R009NYYYY_partial_28_1001,
  rs_R009_ueqv_R009NYYYY_partial_28_1002,
  rs_R009_ueqv_R009NYYYY_partial_28_1003,
  rs_R009_ueqv_R009NYYYY_partial_28_1004,
  rs_R009_ueqv_R009NYYYY_partial_28_1005,
  rs_R009_ueqv_R009NYYYY_partial_28_1006,
  rs_R009_ueqv_R009NYYYY_partial_28_1007,
  rs_R009_ueqv_R009NYYYY_partial_28_1008,
  rs_R009_ueqv_R009NYYYY_partial_28_1009,
  rs_R009_ueqv_R009NYYYY_partial_28_1010,
  rs_R009_ueqv_R009NYYYY_partial_28_1011,
  rs_R009_ueqv_R009NYYYY_partial_28_1012,
  rs_R009_ueqv_R009NYYYY_partial_28_1013,
  rs_R009_ueqv_R009NYYYY_partial_28_1014,
  rs_R009_ueqv_R009NYYYY_partial_28_1015,
  rs_R009_ueqv_R009NYYYY_partial_28_1016,
  rs_R009_ueqv_R009NYYYY_partial_28_1017,
  rs_R009_ueqv_R009NYYYY_partial_28_1018,
  rs_R009_ueqv_R009NYYYY_partial_28_1019,
  rs_R009_ueqv_R009NYYYY_partial_28_1020,
  rs_R009_ueqv_R009NYYYY_partial_28_1021,
  rs_R009_ueqv_R009NYYYY_partial_28_1022,
  rs_R009_ueqv_R009NYYYY_partial_28_1023,
  rs_R009_ueqv_R009NYYYY_partial_28_1024,
  rs_R009_ueqv_R009NYYYY_partial_28_1025,
  rs_R009_ueqv_R009NYYYY_partial_28_1026,
  rs_R009_ueqv_R009NYYYY_partial_28_1027,
  rs_R009_ueqv_R009NYYYY_partial_28_1028,
  rs_R009_ueqv_R009NYYYY_partial_28_1029,
  rs_R009_ueqv_R009NYYYY_partial_28_1030,
  rs_R009_ueqv_R009NYYYY_partial_28_1031,
  rs_R009_ueqv_R009NYYYY_partial_28_1032,
  rs_R009_ueqv_R009NYYYY_partial_28_1033,
  rs_R009_ueqv_R009NYYYY_partial_28_1034,
  rs_R009_ueqv_R009NYYYY_partial_28_1035,
  rs_R009_ueqv_R009NYYYY_partial_28_1036,
  rs_R009_ueqv_R009NYYYY_partial_28_1037,
  rs_R009_ueqv_R009NYYYY_partial_28_1038,
  rs_R009_ueqv_R009NYYYY_partial_28_1039,
  rs_R009_ueqv_R009NYYYY_partial_28_1040,
  rs_R009_ueqv_R009NYYYY_partial_28_1041,
  rs_R009_ueqv_R009NYYYY_partial_28_1042,
  rs_R009_ueqv_R009NYYYY_partial_28_1043,
  rs_R009_ueqv_R009NYYYY_partial_28_1044,
  rs_R009_ueqv_R009NYYYY_partial_28_1045,
  rs_R009_ueqv_R009NYYYY_partial_28_1046,
  rs_R009_ueqv_R009NYYYY_partial_28_1047,
  rs_R009_ueqv_R009NYYYY_partial_28_1048,
  rs_R009_ueqv_R009NYYYY_partial_28_1049,
  rs_R009_ueqv_R009NYYYY_partial_28_1050,
  rs_R009_ueqv_R009NYYYY_partial_28_1051,
  rs_R009_ueqv_R009NYYYY_partial_28_1052,
  rs_R009_ueqv_R009NYYYY_partial_28_1053,
  rs_R009_ueqv_R009NYYYY_partial_28_1054,
  rs_R009_ueqv_R009NYYYY_partial_28_1055,
  rs_R009_ueqv_R009NYYYY_partial_28_1056,
  rs_R009_ueqv_R009NYYYY_partial_28_1057,
  rs_R009_ueqv_R009NYYYY_partial_28_1058,
  rs_R009_ueqv_R009NYYYY_partial_28_1059,
  rs_R009_ueqv_R009NYYYY_partial_28_1060,
  rs_R009_ueqv_R009NYYYY_partial_28_1061,
  rs_R009_ueqv_R009NYYYY_partial_28_1062,
  rs_R009_ueqv_R009NYYYY_partial_28_1063,
  rs_R009_ueqv_R009NYYYY_partial_28_1064,
  rs_R009_ueqv_R009NYYYY_partial_28_1065,
  rs_R009_ueqv_R009NYYYY_partial_28_1066,
  rs_R009_ueqv_R009NYYYY_partial_28_1067,
  rs_R009_ueqv_R009NYYYY_partial_28_1068,
  rs_R009_ueqv_R009NYYYY_partial_28_1069,
  rs_R009_ueqv_R009NYYYY_partial_28_1070,
  rs_R009_ueqv_R009NYYYY_partial_28_1071,
  rs_R009_ueqv_R009NYYYY_partial_28_1072,
  rs_R009_ueqv_R009NYYYY_partial_28_1073,
  rs_R009_ueqv_R009NYYYY_partial_28_1074,
  rs_R009_ueqv_R009NYYYY_partial_28_1075,
  rs_R009_ueqv_R009NYYYY_partial_28_1076,
  rs_R009_ueqv_R009NYYYY_partial_28_1077,
  rs_R009_ueqv_R009NYYYY_partial_28_1078,
  rs_R009_ueqv_R009NYYYY_partial_28_1079,
  rs_R009_ueqv_R009NYYYY_partial_28_1080,
  rs_R009_ueqv_R009NYYYY_partial_28_1081,
  rs_R009_ueqv_R009NYYYY_partial_28_1082,
  rs_R009_ueqv_R009NYYYY_partial_28_1083,
  rs_R009_ueqv_R009NYYYY_partial_28_1084,
  rs_R009_ueqv_R009NYYYY_partial_28_1085,
  rs_R009_ueqv_R009NYYYY_partial_28_1086,
  rs_R009_ueqv_R009NYYYY_partial_28_1087,
  rs_R009_ueqv_R009NYYYY_partial_28_1088,
  rs_R009_ueqv_R009NYYYY_partial_28_1089,
  rs_R009_ueqv_R009NYYYY_partial_28_1090,
  rs_R009_ueqv_R009NYYYY_partial_28_1091,
  rs_R009_ueqv_R009NYYYY_partial_28_1092,
  rs_R009_ueqv_R009NYYYY_partial_28_1093,
  rs_R009_ueqv_R009NYYYY_partial_28_1094,
  rs_R009_ueqv_R009NYYYY_partial_28_1095,
  rs_R009_ueqv_R009NYYYY_partial_28_1096,
  rs_R009_ueqv_R009NYYYY_partial_28_1097,
  rs_R009_ueqv_R009NYYYY_partial_28_1098,
  rs_R009_ueqv_R009NYYYY_partial_28_1099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_28_1000_1099 : Poly :=
[
  term ((762480 : Rat) / 32699) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-381240 : Rat) / 32699) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((223304411097 : Rat) / 265515880) [(10, 1), (14, 1), (15, 2)],
  term ((-5368791 : Rat) / 32699) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(10, 1), (14, 1), (15, 4)],
  term ((1143720 : Rat) / 32699) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((8803538659 : Rat) / 66378970) [(10, 1), (14, 2), (15, 2)],
  term ((-841905 : Rat) / 32699) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-48182297683 : Rat) / 106206352) [(10, 1), (15, 2)],
  term ((11579487 : Rat) / 130796) [(10, 1), (15, 2), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(10, 1), (15, 4)],
  term ((-571860 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(10, 2), (11, 1), (15, 1)],
  term ((5888 : Rat) / 32699) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((2976517632 : Rat) / 33189485) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-565248 : Rat) / 32699) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1488258816 : Rat) / 33189485) [(10, 2), (13, 1), (15, 1)],
  term ((282624 : Rat) / 32699) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1612280384 : Rat) / 33189485) [(10, 2), (14, 1), (15, 2)],
  term ((306176 : Rat) / 32699) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((806140192 : Rat) / 33189485) [(10, 2), (15, 2)],
  term ((-153088 : Rat) / 32699) [(10, 2), (15, 2), (16, 1)],
  term ((-54132966708 : Rat) / 33189485) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((10207552 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((21316207000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 4)],
  term ((-20240000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-3557868732 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((3378240 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((31513819269 : Rat) / 33189485) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5948336 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10658103500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((10120000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((636467733413 : Rat) / 99568455) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-121786592 : Rat) / 98097) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2417790145 : Rat) / 1896542) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((8040064 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1651414487 : Rat) / 33189485) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((319040 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-253596244673 : Rat) / 79654764) [(11, 1), (12, 1), (15, 1)],
  term ((60654016 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2417790145 : Rat) / 3793084) [(11, 1), (12, 1), (15, 3)],
  term ((-4020032 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((2760000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-13793153940 : Rat) / 6637897) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((13203044 : Rat) / 32699) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3557868732 : Rat) / 6637897) [(11, 1), (12, 2), (14, 1), (15, 3)],
  term ((-3378240 : Rat) / 32699) [(11, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((6896576970 : Rat) / 6637897) [(11, 1), (12, 2), (15, 1)],
  term ((-6601522 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1778934366 : Rat) / 6637897) [(11, 1), (12, 2), (15, 3)],
  term ((1689120 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-58380239122 : Rat) / 19913691) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((55952960 : Rat) / 98097) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1937837000 : Rat) / 948271) [(11, 1), (13, 1), (14, 1), (15, 4)],
  term ((12880000 : Rat) / 32699) [(11, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((142649246203 : Rat) / 66378970) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-13549760 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((739657043831 : Rat) / 796547640) [(11, 1), (13, 1), (15, 2)],
  term ((-17814160 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((968918500 : Rat) / 948271) [(11, 1), (13, 1), (15, 4)],
  term ((-6440000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((23254044000 : Rat) / 6637897) [(11, 1), (13, 2), (14, 1), (15, 3)],
  term ((-22080000 : Rat) / 32699) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-75795128468 : Rat) / 33189485) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((14466112 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-21316207000 : Rat) / 6637897) [(11, 1), (13, 2), (14, 2), (15, 3)],
  term ((20240000 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((18948782117 : Rat) / 33189485) [(11, 1), (13, 2), (15, 1)],
  term ((-3616528 : Rat) / 32699) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6297970250 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)],
  term ((5980000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-315446132839 : Rat) / 199136910) [(11, 1), (14, 1), (15, 1)],
  term ((30193520 : Rat) / 98097) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((15254851336 : Rat) / 4741355) [(11, 1), (14, 1), (15, 3)],
  term ((-20347548 : Rat) / 32699) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-221207411291 : Rat) / 199136910) [(11, 1), (14, 2), (15, 1)],
  term ((21184324 : Rat) / 98097) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((852099676969 : Rat) / 796547640) [(11, 1), (15, 1)],
  term ((-20392841 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)],
  term ((-7627425668 : Rat) / 4741355) [(11, 1), (15, 3)],
  term ((10173774 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)],
  term ((2992020328 : Rat) / 1746815) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-568192 : Rat) / 1721) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51034875232 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((9691648 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((279048528 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-52992 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28493955248 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((5411072 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25517437616 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-4845824 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10332546884 : Rat) / 4741355) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((13735232 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((75126064816 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 4)],
  term ((-14266624 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-46508088 : Rat) / 33189485) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((8832 : Rat) / 32699) [(11, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((36175541116 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)],
  term ((-6869824 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-37563032408 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)],
  term ((7133312 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4092711744 : Rat) / 6637897) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((-3886080 : Rat) / 32699) [(11, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2046355872 : Rat) / 6637897) [(11, 2), (12, 2), (15, 2)],
  term ((1943040 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-21455731264 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((4074496 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((114347885696 : Rat) / 33189485) [(11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-21714944 : Rat) / 32699) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-8666007064 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((1645696 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-75126064816 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((14266624 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((12894367398 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)],
  term ((-2448672 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-38392426644 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((7290816 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-55065576192 : Rat) / 33189485) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((10457088 : Rat) / 32699) [(11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((51034875232 : Rat) / 33189485) [(11, 2), (13, 2), (14, 2), (15, 2)],
  term ((-9691648 : Rat) / 32699) [(11, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((14774069288 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)],
  term ((-2805632 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((5999543352 : Rat) / 33189485) [(11, 2), (14, 1), (15, 2)],
  term ((-1139328 : Rat) / 32699) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-47810314464 : Rat) / 33189485) [(11, 2), (14, 1), (15, 4)],
  term ((9079296 : Rat) / 32699) [(11, 2), (14, 1), (15, 4), (16, 1)],
  term ((1806064084 : Rat) / 6637897) [(11, 2), (14, 2), (15, 2)],
  term ((-1714880 : Rat) / 32699) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-5257351781 : Rat) / 33189485) [(11, 2), (15, 2)],
  term ((998384 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)],
  term ((23905157232 : Rat) / 33189485) [(11, 2), (15, 4)],
  term ((-4539648 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-282624 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-744129408 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)],
  term ((141312 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((248043136 : Rat) / 6637897) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-235520 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-372064704 : Rat) / 33189485) [(11, 3), (12, 1), (14, 1), (15, 3)],
  term ((70656 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-70656 : Rat) / 32699) [(11, 3), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-713124016 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)],
  term ((135424 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((186032352 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)],
  term ((-35328 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)],
  term ((-744129408 : Rat) / 33189485) [(11, 3), (12, 2), (14, 1), (15, 1)],
  term ((141312 : Rat) / 32699) [(11, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (12, 2), (15, 1)],
  term ((-70656 : Rat) / 32699) [(11, 3), (12, 2), (15, 1), (16, 1)],
  term ((-992172544 : Rat) / 33189485) [(11, 3), (13, 1), (14, 1), (15, 2)],
  term ((188416 : Rat) / 32699) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (13, 1), (14, 2), (15, 2)],
  term ((-70656 : Rat) / 32699) [(11, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((403070096 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)],
  term ((-76544 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((744129408 : Rat) / 33189485) [(11, 3), (13, 2), (14, 1), (15, 1)],
  term ((-1488258816 : Rat) / 33189485) [(11, 3), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1000 through 1099. -/
theorem rs_R009_ueqv_R009NYYYY_block_28_1000_1099_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_28_1000_1099
      rs_R009_ueqv_R009NYYYY_block_28_1000_1099 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
