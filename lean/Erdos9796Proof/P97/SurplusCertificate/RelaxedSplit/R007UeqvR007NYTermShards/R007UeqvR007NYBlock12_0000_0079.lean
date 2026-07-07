/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 12:0-79

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_12_0000_0079 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0000 : Poly :=
[
  term ((179820453703086676439375 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0000 : Poly :=
[
  term ((179820453703086676439375 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((179820453703086676439375 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-179820453703086676439375 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-179820453703086676439375 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0000
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0001 : Poly :=
[
  term ((-35964090740617335287875 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0001 : Poly :=
[
  term ((-35964090740617335287875 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35964090740617335287875 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((35964090740617335287875 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((35964090740617335287875 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0001
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0002 : Poly :=
[
  term ((4662882398671472552285 : Rat) / 74101428790560327828) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0002 : Poly :=
[
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 74101428790560327828) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 74101428790560327828) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0002
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0003 : Poly :=
[
  term ((-932576479734294510457 : Rat) / 24700476263520109276) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0003 : Poly :=
[
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 24700476263520109276) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 24700476263520109276) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0003
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0004 : Poly :=
[
  term ((-100794403833707704776505 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0004 : Poly :=
[
  term ((-100794403833707704776505 : Rat) / 629862144719762786538) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-100794403833707704776505 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((100794403833707704776505 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((100794403833707704776505 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0004
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0005 : Poly :=
[
  term ((-126455734003640846542310 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0005 : Poly :=
[
  term ((-252911468007281693084620 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-252911468007281693084620 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((126455734003640846542310 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((126455734003640846542310 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0005
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0006 : Poly :=
[
  term ((20158880766741540955301 : Rat) / 419908096479841857692) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0006 : Poly :=
[
  term ((20158880766741540955301 : Rat) / 209954048239920928846) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((20158880766741540955301 : Rat) / 209954048239920928846) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20158880766741540955301 : Rat) / 419908096479841857692) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20158880766741540955301 : Rat) / 419908096479841857692) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0006
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0007 : Poly :=
[
  term ((25291146800728169308462 : Rat) / 314931072359881393269) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 7 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0007 : Poly :=
[
  term ((50582293601456338616924 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((50582293601456338616924 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25291146800728169308462 : Rat) / 314931072359881393269) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25291146800728169308462 : Rat) / 314931072359881393269) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0007
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0008 : Poly :=
[
  term ((-20557004464181817140965 : Rat) / 269940919165612622802) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0008 : Poly :=
[
  term ((-20557004464181817140965 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-20557004464181817140965 : Rat) / 134970459582806311401) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((20557004464181817140965 : Rat) / 269940919165612622802) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((20557004464181817140965 : Rat) / 269940919165612622802) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0008
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0009 : Poly :=
[
  term ((4111400892836363428193 : Rat) / 89980306388537540934) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0009 : Poly :=
[
  term ((4111400892836363428193 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((4111400892836363428193 : Rat) / 44990153194268770467) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4111400892836363428193 : Rat) / 89980306388537540934) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4111400892836363428193 : Rat) / 89980306388537540934) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0009
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0010 : Poly :=
[
  term ((401785683208423316844715 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 10 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0010 : Poly :=
[
  term ((401785683208423316844715 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (12, 2), (16, 1)],
  term ((401785683208423316844715 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-401785683208423316844715 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-401785683208423316844715 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0010
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0011 : Poly :=
[
  term ((126455734003640846542310 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 11 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0011 : Poly :=
[
  term ((252911468007281693084620 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((252911468007281693084620 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-126455734003640846542310 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-126455734003640846542310 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0011
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0012 : Poly :=
[
  term ((-883062914374385608458295 : Rat) / 7558345736637153438456) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0012 : Poly :=
[
  term ((-883062914374385608458295 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((-883062914374385608458295 : Rat) / 3779172868318576719228) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((883062914374385608458295 : Rat) / 7558345736637153438456) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((883062914374385608458295 : Rat) / 7558345736637153438456) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0012
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0013 : Poly :=
[
  term ((-80357136641684663368943 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0013 : Poly :=
[
  term ((-80357136641684663368943 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-80357136641684663368943 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((80357136641684663368943 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((80357136641684663368943 : Rat) / 1259724289439525573076) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0013
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0014 : Poly :=
[
  term ((-25291146800728169308462 : Rat) / 314931072359881393269) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0014 : Poly :=
[
  term ((-50582293601456338616924 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50582293601456338616924 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25291146800728169308462 : Rat) / 314931072359881393269) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((25291146800728169308462 : Rat) / 314931072359881393269) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0014
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0015 : Poly :=
[
  term ((176612582874877121691659 : Rat) / 2519448578879051146152) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0015 : Poly :=
[
  term ((176612582874877121691659 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((176612582874877121691659 : Rat) / 1259724289439525573076) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176612582874877121691659 : Rat) / 2519448578879051146152) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-176612582874877121691659 : Rat) / 2519448578879051146152) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0015
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0016 : Poly :=
[
  term ((98824978198146895106655 : Rat) / 419908096479841857692) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0016 : Poly :=
[
  term ((98824978198146895106655 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-98824978198146895106655 : Rat) / 419908096479841857692) [(2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-98824978198146895106655 : Rat) / 419908096479841857692) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((98824978198146895106655 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0016
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0017 : Poly :=
[
  term ((-59294986918888137063993 : Rat) / 419908096479841857692) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0017 : Poly :=
[
  term ((-59294986918888137063993 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((59294986918888137063993 : Rat) / 419908096479841857692) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((59294986918888137063993 : Rat) / 419908096479841857692) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-59294986918888137063993 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0017
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0018 : Poly :=
[
  term ((-308564613762820358369285 : Rat) / 944793217079644179807) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0018 : Poly :=
[
  term ((-617129227525640716738570 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((308564613762820358369285 : Rat) / 944793217079644179807) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((308564613762820358369285 : Rat) / 944793217079644179807) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-617129227525640716738570 : Rat) / 944793217079644179807) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0018
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0019 : Poly :=
[
  term ((61712922752564071673857 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0019 : Poly :=
[
  term ((123425845505128143347714 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61712922752564071673857 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-61712922752564071673857 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((123425845505128143347714 : Rat) / 314931072359881393269) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0019
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0020 : Poly :=
[
  term ((-40480666434477912249445 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0020 : Poly :=
[
  term ((-40480666434477912249445 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((40480666434477912249445 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((40480666434477912249445 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((-40480666434477912249445 : Rat) / 314931072359881393269) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0020
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0021 : Poly :=
[
  term ((17931978120890365681335 : Rat) / 104977024119960464423) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0021 : Poly :=
[
  term ((35863956241780731362670 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17931978120890365681335 : Rat) / 104977024119960464423) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17931978120890365681335 : Rat) / 104977024119960464423) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((35863956241780731362670 : Rat) / 104977024119960464423) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0021
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0022 : Poly :=
[
  term ((8096133286895582449889 : Rat) / 209954048239920928846) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0022 : Poly :=
[
  term ((8096133286895582449889 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8096133286895582449889 : Rat) / 209954048239920928846) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8096133286895582449889 : Rat) / 209954048239920928846) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((8096133286895582449889 : Rat) / 104977024119960464423) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0022
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0023 : Poly :=
[
  term ((-10759186872534219408801 : Rat) / 104977024119960464423) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0023 : Poly :=
[
  term ((-21518373745068438817602 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((10759186872534219408801 : Rat) / 104977024119960464423) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((10759186872534219408801 : Rat) / 104977024119960464423) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21518373745068438817602 : Rat) / 104977024119960464423) [(2, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0023
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0024 : Poly :=
[
  term ((-94570004163873541181155 : Rat) / 419908096479841857692) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0024 : Poly :=
[
  term ((-94570004163873541181155 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((94570004163873541181155 : Rat) / 419908096479841857692) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((94570004163873541181155 : Rat) / 419908096479841857692) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-94570004163873541181155 : Rat) / 209954048239920928846) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0024
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0025 : Poly :=
[
  term ((56742002498324124708693 : Rat) / 419908096479841857692) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0025 : Poly :=
[
  term ((56742002498324124708693 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56742002498324124708693 : Rat) / 419908096479841857692) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-56742002498324124708693 : Rat) / 419908096479841857692) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((56742002498324124708693 : Rat) / 209954048239920928846) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0025
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0026 : Poly :=
[
  term ((-40480666434477912249445 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 26 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0026 : Poly :=
[
  term ((-40480666434477912249445 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((40480666434477912249445 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((40480666434477912249445 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 3), (16, 1)],
  term ((-40480666434477912249445 : Rat) / 314931072359881393269) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0026
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0027 : Poly :=
[
  term ((259045118401125757653230 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0027 : Poly :=
[
  term ((518090236802251515306460 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-259045118401125757653230 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-259045118401125757653230 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((518090236802251515306460 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0027
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0028 : Poly :=
[
  term ((8096133286895582449889 : Rat) / 209954048239920928846) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0028 : Poly :=
[
  term ((8096133286895582449889 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8096133286895582449889 : Rat) / 209954048239920928846) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8096133286895582449889 : Rat) / 209954048239920928846) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((8096133286895582449889 : Rat) / 104977024119960464423) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0028
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0029 : Poly :=
[
  term ((-51809023680225151530646 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0029 : Poly :=
[
  term ((-103618047360450303061292 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51809023680225151530646 : Rat) / 314931072359881393269) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((51809023680225151530646 : Rat) / 314931072359881393269) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-103618047360450303061292 : Rat) / 314931072359881393269) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0029
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0030 : Poly :=
[
  term ((-4151520840643405522065 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 30 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0030 : Poly :=
[
  term ((-8303041681286811044130 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8303041681286811044130 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((4151520840643405522065 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((4151520840643405522065 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0030
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0031 : Poly :=
[
  term ((2490912504386043313239 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0031 : Poly :=
[
  term ((4981825008772086626478 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4981825008772086626478 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2490912504386043313239 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2490912504386043313239 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0031
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0032 : Poly :=
[
  term ((18338326771373699806250 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0032 : Poly :=
[
  term ((36676653542747399612500 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((36676653542747399612500 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-18338326771373699806250 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-18338326771373699806250 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0032
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0033 : Poly :=
[
  term ((-3667665354274739961250 : Rat) / 104977024119960464423) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0033 : Poly :=
[
  term ((-7335330708549479922500 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7335330708549479922500 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3667665354274739961250 : Rat) / 104977024119960464423) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3667665354274739961250 : Rat) / 104977024119960464423) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0033
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0034 : Poly :=
[
  term ((385942364904651799180 : Rat) / 14996717731422923489) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0034 : Poly :=
[
  term ((771884729809303598360 : Rat) / 14996717731422923489) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((771884729809303598360 : Rat) / 14996717731422923489) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-385942364904651799180 : Rat) / 14996717731422923489) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-385942364904651799180 : Rat) / 14996717731422923489) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0034
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0035 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0035 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0035
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0036 : Poly :=
[
  term ((1124576104310666393456095 : Rat) / 3779172868318576719228) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0036 : Poly :=
[
  term ((1124576104310666393456095 : Rat) / 1889586434159288359614) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1124576104310666393456095 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1124576104310666393456095 : Rat) / 3779172868318576719228) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1124576104310666393456095 : Rat) / 3779172868318576719228) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0036
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0037 : Poly :=
[
  term ((-231565418942791079508 : Rat) / 14996717731422923489) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0037 : Poly :=
[
  term ((-463130837885582159016 : Rat) / 14996717731422923489) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-463130837885582159016 : Rat) / 14996717731422923489) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((231565418942791079508 : Rat) / 14996717731422923489) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((231565418942791079508 : Rat) / 14996717731422923489) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0037
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0038 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 38 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0038 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0038
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0039 : Poly :=
[
  term ((-224915220862133278691219 : Rat) / 1259724289439525573076) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0039 : Poly :=
[
  term ((-224915220862133278691219 : Rat) / 629862144719762786538) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-224915220862133278691219 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((224915220862133278691219 : Rat) / 1259724289439525573076) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((224915220862133278691219 : Rat) / 1259724289439525573076) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0039
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0040 : Poly :=
[
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0040 : Poly :=
[
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0040
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0041 : Poly :=
[
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0041 : Poly :=
[
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0041
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0042 : Poly :=
[
  term ((-95297734613948562712495 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 42 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0042 : Poly :=
[
  term ((-190595469227897125424990 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-190595469227897125424990 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((95297734613948562712495 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((95297734613948562712495 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0042
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0043 : Poly :=
[
  term ((-1427601625556603824492435 : Rat) / 3779172868318576719228) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 43 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0043 : Poly :=
[
  term ((-1427601625556603824492435 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1427601625556603824492435 : Rat) / 1889586434159288359614) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1427601625556603824492435 : Rat) / 3779172868318576719228) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1427601625556603824492435 : Rat) / 3779172868318576719228) [(5, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0043
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0044 : Poly :=
[
  term ((2598732118883838129895 : Rat) / 7295700517989530346) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0044 : Poly :=
[
  term ((2598732118883838129895 : Rat) / 3647850258994765173) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((2598732118883838129895 : Rat) / 3647850258994765173) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2598732118883838129895 : Rat) / 7295700517989530346) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2598732118883838129895 : Rat) / 7295700517989530346) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0044
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0045 : Poly :=
[
  term ((19059546922789712542499 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0045 : Poly :=
[
  term ((38119093845579425084998 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((38119093845579425084998 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19059546922789712542499 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19059546922789712542499 : Rat) / 314931072359881393269) [(5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0045
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0046 : Poly :=
[
  term ((285520325111320764898487 : Rat) / 1259724289439525573076) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0046 : Poly :=
[
  term ((285520325111320764898487 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((285520325111320764898487 : Rat) / 629862144719762786538) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-285520325111320764898487 : Rat) / 1259724289439525573076) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-285520325111320764898487 : Rat) / 1259724289439525573076) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0046
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0047 : Poly :=
[
  term ((-519746423776767625979 : Rat) / 2431900172663176782) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0047 : Poly :=
[
  term ((-519746423776767625979 : Rat) / 1215950086331588391) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-519746423776767625979 : Rat) / 1215950086331588391) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((519746423776767625979 : Rat) / 2431900172663176782) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((519746423776767625979 : Rat) / 2431900172663176782) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0047
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0048 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 48 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0048 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0048
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0049 : Poly :=
[
  term ((-85897325285045908681715 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 49 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0049 : Poly :=
[
  term ((-85897325285045908681715 : Rat) / 629862144719762786538) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-85897325285045908681715 : Rat) / 629862144719762786538) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85897325285045908681715 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((85897325285045908681715 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0049
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0050 : Poly :=
[
  term ((-19567078413835552171535 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 50 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0050 : Poly :=
[
  term ((-39134156827671104343070 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-39134156827671104343070 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((19567078413835552171535 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((19567078413835552171535 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0050
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0051 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0051 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0051
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0052 : Poly :=
[
  term ((17179465057009181736343 : Rat) / 419908096479841857692) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0052 : Poly :=
[
  term ((17179465057009181736343 : Rat) / 209954048239920928846) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17179465057009181736343 : Rat) / 209954048239920928846) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17179465057009181736343 : Rat) / 419908096479841857692) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17179465057009181736343 : Rat) / 419908096479841857692) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0052
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0053 : Poly :=
[
  term ((3913415682767110434307 : Rat) / 314931072359881393269) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0053 : Poly :=
[
  term ((7826831365534220868614 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((7826831365534220868614 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3913415682767110434307 : Rat) / 314931072359881393269) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3913415682767110434307 : Rat) / 314931072359881393269) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0053
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0054 : Poly :=
[
  term ((67171798417389793867645 : Rat) / 539881838331225245604) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 54 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0054 : Poly :=
[
  term ((67171798417389793867645 : Rat) / 269940919165612622802) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((67171798417389793867645 : Rat) / 269940919165612622802) [(3, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-67171798417389793867645 : Rat) / 539881838331225245604) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-67171798417389793867645 : Rat) / 539881838331225245604) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0054
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0055 : Poly :=
[
  term ((285549042086486432709835 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0055 : Poly :=
[
  term ((571098084172972865419670 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((571098084172972865419670 : Rat) / 944793217079644179807) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-285549042086486432709835 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-285549042086486432709835 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0055
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0056 : Poly :=
[
  term ((-13434359683477958773529 : Rat) / 179960612777075081868) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0056 : Poly :=
[
  term ((-13434359683477958773529 : Rat) / 89980306388537540934) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13434359683477958773529 : Rat) / 89980306388537540934) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((13434359683477958773529 : Rat) / 179960612777075081868) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((13434359683477958773529 : Rat) / 179960612777075081868) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0056
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0057 : Poly :=
[
  term ((-57109808417297286541967 : Rat) / 314931072359881393269) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 57 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0057 : Poly :=
[
  term ((-114219616834594573083934 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-114219616834594573083934 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((57109808417297286541967 : Rat) / 314931072359881393269) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((57109808417297286541967 : Rat) / 314931072359881393269) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0057
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0058 : Poly :=
[
  term ((-256073213450360514413095 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 58 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0058 : Poly :=
[
  term ((-256073213450360514413095 : Rat) / 1889586434159288359614) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-256073213450360514413095 : Rat) / 1889586434159288359614) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((256073213450360514413095 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((256073213450360514413095 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0058
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0059 : Poly :=
[
  term ((-285549042086486432709835 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 59 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0059 : Poly :=
[
  term ((-571098084172972865419670 : Rat) / 944793217079644179807) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-571098084172972865419670 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((285549042086486432709835 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((285549042086486432709835 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0059
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0060 : Poly :=
[
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 60 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0060 : Poly :=
[
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0060
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0061 : Poly :=
[
  term ((51214642690072102882619 : Rat) / 1259724289439525573076) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0061 : Poly :=
[
  term ((51214642690072102882619 : Rat) / 629862144719762786538) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((51214642690072102882619 : Rat) / 629862144719762786538) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51214642690072102882619 : Rat) / 1259724289439525573076) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51214642690072102882619 : Rat) / 1259724289439525573076) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0061
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0062 : Poly :=
[
  term ((57109808417297286541967 : Rat) / 314931072359881393269) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0062 : Poly :=
[
  term ((114219616834594573083934 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((114219616834594573083934 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57109808417297286541967 : Rat) / 314931072359881393269) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-57109808417297286541967 : Rat) / 314931072359881393269) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0062
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0063 : Poly :=
[
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0063 : Poly :=
[
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0063
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0064 : Poly :=
[
  term ((-44658436272219485239340 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0064 : Poly :=
[
  term ((-89316872544438970478680 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-89316872544438970478680 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((44658436272219485239340 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((44658436272219485239340 : Rat) / 944793217079644179807) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0064
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0065 : Poly :=
[
  term ((20394606370307412298525 : Rat) / 104977024119960464423) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 65 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0065 : Poly :=
[
  term ((40789212740614824597050 : Rat) / 104977024119960464423) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((40789212740614824597050 : Rat) / 104977024119960464423) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-20394606370307412298525 : Rat) / 104977024119960464423) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-20394606370307412298525 : Rat) / 104977024119960464423) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0065
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0066 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 66 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0066 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0066
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0067 : Poly :=
[
  term ((-20785219066091969533235 : Rat) / 111152143185840491742) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0067 : Poly :=
[
  term ((-20785219066091969533235 : Rat) / 55576071592920245871) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-20785219066091969533235 : Rat) / 55576071592920245871) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((20785219066091969533235 : Rat) / 111152143185840491742) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((20785219066091969533235 : Rat) / 111152143185840491742) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0067_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0067
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0068 : Poly :=
[
  term ((-2279873116719596909045 : Rat) / 25534951812963356211) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0068 : Poly :=
[
  term ((-4559746233439193818090 : Rat) / 25534951812963356211) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4559746233439193818090 : Rat) / 25534951812963356211) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2279873116719596909045 : Rat) / 25534951812963356211) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2279873116719596909045 : Rat) / 25534951812963356211) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0068_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0068
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0069 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0069 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0069_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0069
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0070 : Poly :=
[
  term ((-2979162720638373862979935 : Rat) / 7558345736637153438456) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0070 : Poly :=
[
  term ((-2979162720638373862979935 : Rat) / 3779172868318576719228) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2979162720638373862979935 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2979162720638373862979935 : Rat) / 7558345736637153438456) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2979162720638373862979935 : Rat) / 7558345736637153438456) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0070_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0070
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0071 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 71 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0071 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0071_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0071
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0072 : Poly :=
[
  term ((8931687254443897047868 : Rat) / 314931072359881393269) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 72 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0072 : Poly :=
[
  term ((17863374508887794095736 : Rat) / 314931072359881393269) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((17863374508887794095736 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8931687254443897047868 : Rat) / 314931072359881393269) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8931687254443897047868 : Rat) / 314931072359881393269) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0072_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0072
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0073 : Poly :=
[
  term ((-12236763822184447379115 : Rat) / 104977024119960464423) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0073 : Poly :=
[
  term ((-24473527644368894758230 : Rat) / 104977024119960464423) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24473527644368894758230 : Rat) / 104977024119960464423) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((12236763822184447379115 : Rat) / 104977024119960464423) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12236763822184447379115 : Rat) / 104977024119960464423) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0073_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0073
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0074 : Poly :=
[
  term ((4157043813218393906647 : Rat) / 37050714395280163914) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0074 : Poly :=
[
  term ((4157043813218393906647 : Rat) / 18525357197640081957) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4157043813218393906647 : Rat) / 18525357197640081957) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4157043813218393906647 : Rat) / 37050714395280163914) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4157043813218393906647 : Rat) / 37050714395280163914) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0074_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0074
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0075 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 75 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0075 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0075_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0075
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0076 : Poly :=
[
  term ((455974623343919381809 : Rat) / 8511650604321118737) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 76 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0076 : Poly :=
[
  term ((911949246687838763618 : Rat) / 8511650604321118737) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((911949246687838763618 : Rat) / 8511650604321118737) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-455974623343919381809 : Rat) / 8511650604321118737) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-455974623343919381809 : Rat) / 8511650604321118737) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0076_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0076
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0077 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 77 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0077 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0077_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0077
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0078 : Poly :=
[
  term ((595832544127674772595987 : Rat) / 2519448578879051146152) [(15, 2), (16, 1)]
]

/-- Partial product 78 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0078 : Poly :=
[
  term ((595832544127674772595987 : Rat) / 1259724289439525573076) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((595832544127674772595987 : Rat) / 1259724289439525573076) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-595832544127674772595987 : Rat) / 2519448578879051146152) [(12, 2), (15, 2), (16, 1)],
  term ((-595832544127674772595987 : Rat) / 2519448578879051146152) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0078_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0078
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 12. -/
def rs_R007_ueqv_R007NY_coefficient_12_0079 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(15, 4), (16, 1)]
]

/-- Partial product 79 for generator 12. -/
def rs_R007_ueqv_R007NY_partial_12_0079 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (15, 4), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(12, 2), (15, 4), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 12. -/
theorem rs_R007_ueqv_R007NY_partial_12_0079_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_12_0079
        rs_R007_ueqv_R007NY_generator_12_0000_0079 =
      rs_R007_ueqv_R007NY_partial_12_0079 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_12_0000_0079 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_12_0000,
  rs_R007_ueqv_R007NY_partial_12_0001,
  rs_R007_ueqv_R007NY_partial_12_0002,
  rs_R007_ueqv_R007NY_partial_12_0003,
  rs_R007_ueqv_R007NY_partial_12_0004,
  rs_R007_ueqv_R007NY_partial_12_0005,
  rs_R007_ueqv_R007NY_partial_12_0006,
  rs_R007_ueqv_R007NY_partial_12_0007,
  rs_R007_ueqv_R007NY_partial_12_0008,
  rs_R007_ueqv_R007NY_partial_12_0009,
  rs_R007_ueqv_R007NY_partial_12_0010,
  rs_R007_ueqv_R007NY_partial_12_0011,
  rs_R007_ueqv_R007NY_partial_12_0012,
  rs_R007_ueqv_R007NY_partial_12_0013,
  rs_R007_ueqv_R007NY_partial_12_0014,
  rs_R007_ueqv_R007NY_partial_12_0015,
  rs_R007_ueqv_R007NY_partial_12_0016,
  rs_R007_ueqv_R007NY_partial_12_0017,
  rs_R007_ueqv_R007NY_partial_12_0018,
  rs_R007_ueqv_R007NY_partial_12_0019,
  rs_R007_ueqv_R007NY_partial_12_0020,
  rs_R007_ueqv_R007NY_partial_12_0021,
  rs_R007_ueqv_R007NY_partial_12_0022,
  rs_R007_ueqv_R007NY_partial_12_0023,
  rs_R007_ueqv_R007NY_partial_12_0024,
  rs_R007_ueqv_R007NY_partial_12_0025,
  rs_R007_ueqv_R007NY_partial_12_0026,
  rs_R007_ueqv_R007NY_partial_12_0027,
  rs_R007_ueqv_R007NY_partial_12_0028,
  rs_R007_ueqv_R007NY_partial_12_0029,
  rs_R007_ueqv_R007NY_partial_12_0030,
  rs_R007_ueqv_R007NY_partial_12_0031,
  rs_R007_ueqv_R007NY_partial_12_0032,
  rs_R007_ueqv_R007NY_partial_12_0033,
  rs_R007_ueqv_R007NY_partial_12_0034,
  rs_R007_ueqv_R007NY_partial_12_0035,
  rs_R007_ueqv_R007NY_partial_12_0036,
  rs_R007_ueqv_R007NY_partial_12_0037,
  rs_R007_ueqv_R007NY_partial_12_0038,
  rs_R007_ueqv_R007NY_partial_12_0039,
  rs_R007_ueqv_R007NY_partial_12_0040,
  rs_R007_ueqv_R007NY_partial_12_0041,
  rs_R007_ueqv_R007NY_partial_12_0042,
  rs_R007_ueqv_R007NY_partial_12_0043,
  rs_R007_ueqv_R007NY_partial_12_0044,
  rs_R007_ueqv_R007NY_partial_12_0045,
  rs_R007_ueqv_R007NY_partial_12_0046,
  rs_R007_ueqv_R007NY_partial_12_0047,
  rs_R007_ueqv_R007NY_partial_12_0048,
  rs_R007_ueqv_R007NY_partial_12_0049,
  rs_R007_ueqv_R007NY_partial_12_0050,
  rs_R007_ueqv_R007NY_partial_12_0051,
  rs_R007_ueqv_R007NY_partial_12_0052,
  rs_R007_ueqv_R007NY_partial_12_0053,
  rs_R007_ueqv_R007NY_partial_12_0054,
  rs_R007_ueqv_R007NY_partial_12_0055,
  rs_R007_ueqv_R007NY_partial_12_0056,
  rs_R007_ueqv_R007NY_partial_12_0057,
  rs_R007_ueqv_R007NY_partial_12_0058,
  rs_R007_ueqv_R007NY_partial_12_0059,
  rs_R007_ueqv_R007NY_partial_12_0060,
  rs_R007_ueqv_R007NY_partial_12_0061,
  rs_R007_ueqv_R007NY_partial_12_0062,
  rs_R007_ueqv_R007NY_partial_12_0063,
  rs_R007_ueqv_R007NY_partial_12_0064,
  rs_R007_ueqv_R007NY_partial_12_0065,
  rs_R007_ueqv_R007NY_partial_12_0066,
  rs_R007_ueqv_R007NY_partial_12_0067,
  rs_R007_ueqv_R007NY_partial_12_0068,
  rs_R007_ueqv_R007NY_partial_12_0069,
  rs_R007_ueqv_R007NY_partial_12_0070,
  rs_R007_ueqv_R007NY_partial_12_0071,
  rs_R007_ueqv_R007NY_partial_12_0072,
  rs_R007_ueqv_R007NY_partial_12_0073,
  rs_R007_ueqv_R007NY_partial_12_0074,
  rs_R007_ueqv_R007NY_partial_12_0075,
  rs_R007_ueqv_R007NY_partial_12_0076,
  rs_R007_ueqv_R007NY_partial_12_0077,
  rs_R007_ueqv_R007NY_partial_12_0078,
  rs_R007_ueqv_R007NY_partial_12_0079
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_12_0000_0079 : Poly :=
[
  term ((179820453703086676439375 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-35964090740617335287875 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-100794403833707704776505 : Rat) / 629862144719762786538) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-252911468007281693084620 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20158880766741540955301 : Rat) / 209954048239920928846) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50582293601456338616924 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((179820453703086676439375 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-35964090740617335287875 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-252911468007281693084620 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-100794403833707704776505 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((50582293601456338616924 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((20158880766741540955301 : Rat) / 209954048239920928846) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-179820453703086676439375 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-179820453703086676439375 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((35964090740617335287875 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((35964090740617335287875 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 74101428790560327828) [(0, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 74101428790560327828) [(0, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((932576479734294510457 : Rat) / 24700476263520109276) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 24700476263520109276) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((100794403833707704776505 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((126455734003640846542310 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((126455734003640846542310 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((100794403833707704776505 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-20158880766741540955301 : Rat) / 419908096479841857692) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25291146800728169308462 : Rat) / 314931072359881393269) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25291146800728169308462 : Rat) / 314931072359881393269) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-20158880766741540955301 : Rat) / 419908096479841857692) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-20557004464181817140965 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((4111400892836363428193 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((252911468007281693084620 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-883062914374385608458295 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((401785683208423316844715 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (12, 2), (16, 1)],
  term ((-50582293601456338616924 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((176612582874877121691659 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-80357136641684663368943 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-20557004464181817140965 : Rat) / 134970459582806311401) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((4111400892836363428193 : Rat) / 44990153194268770467) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((401785683208423316844715 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((252911468007281693084620 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-883062914374385608458295 : Rat) / 3779172868318576719228) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-80357136641684663368943 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50582293601456338616924 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((176612582874877121691659 : Rat) / 1259724289439525573076) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((20557004464181817140965 : Rat) / 269940919165612622802) [(1, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((20557004464181817140965 : Rat) / 269940919165612622802) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4111400892836363428193 : Rat) / 89980306388537540934) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4111400892836363428193 : Rat) / 89980306388537540934) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-401785683208423316844715 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-126455734003640846542310 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((883062914374385608458295 : Rat) / 7558345736637153438456) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-401785683208423316844715 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 3), (16, 1)],
  term ((-126455734003640846542310 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((883062914374385608458295 : Rat) / 7558345736637153438456) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((80357136641684663368943 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((25291146800728169308462 : Rat) / 314931072359881393269) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-176612582874877121691659 : Rat) / 2519448578879051146152) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((80357136641684663368943 : Rat) / 1259724289439525573076) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((25291146800728169308462 : Rat) / 314931072359881393269) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-176612582874877121691659 : Rat) / 2519448578879051146152) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-94570004163873541181155 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((56742002498324124708693 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((98824978198146895106655 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-59294986918888137063993 : Rat) / 209954048239920928846) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-617129227525640716738570 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((123425845505128143347714 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((518090236802251515306460 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-40480666434477912249445 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((35863956241780731362670 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40480666434477912249445 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-103618047360450303061292 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8096133286895582449889 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21518373745068438817602 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((8096133286895582449889 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8303041681286811044130 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((4981825008772086626478 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((36676653542747399612500 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7335330708549479922500 : Rat) / 104977024119960464423) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((771884729809303598360 : Rat) / 14996717731422923489) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1124576104310666393456095 : Rat) / 1889586434159288359614) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-463130837885582159016 : Rat) / 14996717731422923489) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-224915220862133278691219 : Rat) / 629862144719762786538) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1427601625556603824492435 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2598732118883838129895 : Rat) / 3647850258994765173) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1651806680694910557659855 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-98824978198146895106655 : Rat) / 419908096479841857692) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((285520325111320764898487 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-519746423776767625979 : Rat) / 1215950086331588391) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((330361336138982111531971 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((59294986918888137063993 : Rat) / 419908096479841857692) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-85897325285045908681715 : Rat) / 629862144719762786538) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-39134156827671104343070 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((17179465057009181736343 : Rat) / 209954048239920928846) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7826831365534220868614 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((67171798417389793867645 : Rat) / 269940919165612622802) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((571098084172972865419670 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13434359683477958773529 : Rat) / 89980306388537540934) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-114219616834594573083934 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-571098084172972865419670 : Rat) / 944793217079644179807) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((120352004691760067441825 : Rat) / 629862144719762786538) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((308564613762820358369285 : Rat) / 944793217079644179807) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((114219616834594573083934 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24070400938352013488365 : Rat) / 209954048239920928846) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-61712922752564071673857 : Rat) / 314931072359881393269) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((40789212740614824597050 : Rat) / 104977024119960464423) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20785219066091969533235 : Rat) / 55576071592920245871) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4559746233439193818090 : Rat) / 25534951812963356211) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2979162720638373862979935 : Rat) / 3779172868318576719228) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((40480666434477912249445 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-250704675632452261610695 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17931978120890365681335 : Rat) / 104977024119960464423) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((40480666434477912249445 : Rat) / 629862144719762786538) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((-24473527644368894758230 : Rat) / 104977024119960464423) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4157043813218393906647 : Rat) / 18525357197640081957) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((911949246687838763618 : Rat) / 8511650604321118737) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((595832544127674772595987 : Rat) / 1259724289439525573076) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (15, 4), (16, 1)],
  term ((-8096133286895582449889 : Rat) / 209954048239920928846) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((50140935126490452322139 : Rat) / 314931072359881393269) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((10759186872534219408801 : Rat) / 104977024119960464423) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8096133286895582449889 : Rat) / 209954048239920928846) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((98824978198146895106655 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-59294986918888137063993 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-617129227525640716738570 : Rat) / 944793217079644179807) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((123425845505128143347714 : Rat) / 314931072359881393269) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-40480666434477912249445 : Rat) / 314931072359881393269) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((35863956241780731362670 : Rat) / 104977024119960464423) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8096133286895582449889 : Rat) / 104977024119960464423) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21518373745068438817602 : Rat) / 104977024119960464423) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8303041681286811044130 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((4981825008772086626478 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((36676653542747399612500 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7335330708549479922500 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((94570004163873541181155 : Rat) / 419908096479841857692) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1124576104310666393456095 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6834280976384355407955 : Rat) / 24700476263520109276) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-56742002498324124708693 : Rat) / 419908096479841857692) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-224915220862133278691219 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4100568585830613244773 : Rat) / 24700476263520109276) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-190595469227897125424990 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1427601625556603824492435 : Rat) / 1889586434159288359614) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2598732118883838129895 : Rat) / 3647850258994765173) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((38119093845579425084998 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((285520325111320764898487 : Rat) / 629862144719762786538) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-519746423776767625979 : Rat) / 1215950086331588391) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-85897325285045908681715 : Rat) / 629862144719762786538) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-39134156827671104343070 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17179465057009181736343 : Rat) / 209954048239920928846) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7826831365534220868614 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((571098084172972865419670 : Rat) / 944793217079644179807) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((67171798417389793867645 : Rat) / 269940919165612622802) [(3, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-114219616834594573083934 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13434359683477958773529 : Rat) / 89980306388537540934) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-256073213450360514413095 : Rat) / 1889586434159288359614) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-571098084172972865419670 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((51214642690072102882619 : Rat) / 629862144719762786538) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((114219616834594573083934 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-89316872544438970478680 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((40480666434477912249445 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-259045118401125757653230 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((40480666434477912249445 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 3), (16, 1)],
  term ((-4559746233439193818090 : Rat) / 25534951812963356211) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2979162720638373862979935 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((108057796264407663720220 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-20785219066091969533235 : Rat) / 55576071592920245871) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((17863374508887794095736 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8096133286895582449889 : Rat) / 209954048239920928846) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((51809023680225151530646 : Rat) / 314931072359881393269) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8096133286895582449889 : Rat) / 209954048239920928846) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((911949246687838763618 : Rat) / 8511650604321118737) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((595832544127674772595987 : Rat) / 1259724289439525573076) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-21611559252881532744044 : Rat) / 314931072359881393269) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((4157043813218393906647 : Rat) / 18525357197640081957) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-94570004163873541181155 : Rat) / 209954048239920928846) [(3, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((56742002498324124708693 : Rat) / 209954048239920928846) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40480666434477912249445 : Rat) / 314931072359881393269) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((518090236802251515306460 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8096133286895582449889 : Rat) / 104977024119960464423) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103618047360450303061292 : Rat) / 314931072359881393269) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4151520840643405522065 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((4151520840643405522065 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2490912504386043313239 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2490912504386043313239 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18338326771373699806250 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-18338326771373699806250 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3667665354274739961250 : Rat) / 104977024119960464423) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3667665354274739961250 : Rat) / 104977024119960464423) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-385942364904651799180 : Rat) / 14996717731422923489) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1124576104310666393456095 : Rat) / 3779172868318576719228) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1124576104310666393456095 : Rat) / 3779172868318576719228) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-385942364904651799180 : Rat) / 14996717731422923489) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term ((231565418942791079508 : Rat) / 14996717731422923489) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((224915220862133278691219 : Rat) / 1259724289439525573076) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((224915220862133278691219 : Rat) / 1259724289439525573076) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((231565418942791079508 : Rat) / 14996717731422923489) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((95297734613948562712495 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1427601625556603824492435 : Rat) / 3779172868318576719228) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-2598732118883838129895 : Rat) / 7295700517989530346) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((95297734613948562712495 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 3), (16, 1)],
  term ((1427601625556603824492435 : Rat) / 3779172868318576719228) [(5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2598732118883838129895 : Rat) / 7295700517989530346) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-19059546922789712542499 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-285520325111320764898487 : Rat) / 1259724289439525573076) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((519746423776767625979 : Rat) / 2431900172663176782) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-19059546922789712542499 : Rat) / 314931072359881393269) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((-285520325111320764898487 : Rat) / 1259724289439525573076) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((519746423776767625979 : Rat) / 2431900172663176782) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((85897325285045908681715 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((19567078413835552171535 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 3), (16, 1)],
  term ((85897325285045908681715 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((19567078413835552171535 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17179465057009181736343 : Rat) / 419908096479841857692) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3913415682767110434307 : Rat) / 314931072359881393269) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-17179465057009181736343 : Rat) / 419908096479841857692) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3913415682767110434307 : Rat) / 314931072359881393269) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-67171798417389793867645 : Rat) / 539881838331225245604) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-285549042086486432709835 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-285549042086486432709835 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-67171798417389793867645 : Rat) / 539881838331225245604) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((13434359683477958773529 : Rat) / 179960612777075081868) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((57109808417297286541967 : Rat) / 314931072359881393269) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((57109808417297286541967 : Rat) / 314931072359881393269) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((13434359683477958773529 : Rat) / 179960612777075081868) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((256073213450360514413095 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((285549042086486432709835 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((256073213450360514413095 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((285549042086486432709835 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-51214642690072102882619 : Rat) / 1259724289439525573076) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-57109808417297286541967 : Rat) / 314931072359881393269) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-51214642690072102882619 : Rat) / 1259724289439525573076) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-57109808417297286541967 : Rat) / 314931072359881393269) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((44658436272219485239340 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20394606370307412298525 : Rat) / 104977024119960464423) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((20785219066091969533235 : Rat) / 111152143185840491742) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2279873116719596909045 : Rat) / 25534951812963356211) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((2979162720638373862979935 : Rat) / 7558345736637153438456) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((44658436272219485239340 : Rat) / 944793217079644179807) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((2279873116719596909045 : Rat) / 25534951812963356211) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((2979162720638373862979935 : Rat) / 7558345736637153438456) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-20394606370307412298525 : Rat) / 104977024119960464423) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((20785219066091969533235 : Rat) / 111152143185840491742) [(11, 1), (13, 3), (16, 1)],
  term ((-8931687254443897047868 : Rat) / 314931072359881393269) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((12236763822184447379115 : Rat) / 104977024119960464423) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4157043813218393906647 : Rat) / 37050714395280163914) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-455974623343919381809 : Rat) / 8511650604321118737) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-595832544127674772595987 : Rat) / 2519448578879051146152) [(12, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(12, 2), (15, 4), (16, 1)],
  term ((-8931687254443897047868 : Rat) / 314931072359881393269) [(12, 3), (15, 2), (16, 1)],
  term ((-455974623343919381809 : Rat) / 8511650604321118737) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-595832544127674772595987 : Rat) / 2519448578879051146152) [(13, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(13, 2), (15, 4), (16, 1)],
  term ((12236763822184447379115 : Rat) / 104977024119960464423) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4157043813218393906647 : Rat) / 37050714395280163914) [(13, 3), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 79. -/
theorem rs_R007_ueqv_R007NY_block_12_0000_0079_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_12_0000_0079
      rs_R007_ueqv_R007NY_block_12_0000_0079 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
