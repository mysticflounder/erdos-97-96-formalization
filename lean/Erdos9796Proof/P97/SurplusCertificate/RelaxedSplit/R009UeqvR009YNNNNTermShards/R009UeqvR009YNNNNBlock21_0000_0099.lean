/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 21:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 : Poly :=
[
  term (2 : Rat) [(8, 1), (12, 1)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0000 : Poly :=
[
  term ((1934854446325 : Rat) / 710466431472) []
]

/-- Partial product 0 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0000 : Poly :=
[
  term ((1934854446325 : Rat) / 355233215736) [(8, 1), (12, 1)],
  term ((1934854446325 : Rat) / 355233215736) [(9, 1), (13, 1)],
  term ((-1934854446325 : Rat) / 710466431472) [(12, 2)],
  term ((-1934854446325 : Rat) / 710466431472) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0000
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0001 : Poly :=
[
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0001 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (13, 3)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0001
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0002 : Poly :=
[
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0002 : Poly :=
[
  term ((-249803199295 : Rat) / 374718582) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-249803199295 : Rat) / 374718582) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0002
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0003 : Poly :=
[
  term ((18615854345 : Rat) / 53531226) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0003 : Poly :=
[
  term ((18615854345 : Rat) / 26765613) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((18615854345 : Rat) / 26765613) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-18615854345 : Rat) / 53531226) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-18615854345 : Rat) / 53531226) [(0, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0003
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0004 : Poly :=
[
  term (-23 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0004 : Poly :=
[
  term (-46 : Rat) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-46 : Rat) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term (23 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (23 : Rat) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0004
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0005 : Poly :=
[
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (13, 2)]
]

/-- Partial product 5 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0005 : Poly :=
[
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (8, 1), (12, 1), (13, 2)],
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (13, 3)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (12, 2), (13, 2)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0005
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0006 : Poly :=
[
  term ((115 : Rat) / 14) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0006 : Poly :=
[
  term ((115 : Rat) / 7) [(0, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((115 : Rat) / 7) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0006
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0007 : Poly :=
[
  term ((-22068074860 : Rat) / 187359291) [(0, 1), (15, 2)]
]

/-- Partial product 7 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0007 : Poly :=
[
  term ((-44136149720 : Rat) / 187359291) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-44136149720 : Rat) / 187359291) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((22068074860 : Rat) / 187359291) [(0, 1), (12, 2), (15, 2)],
  term ((22068074860 : Rat) / 187359291) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0007
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0008 : Poly :=
[
  term ((92 : Rat) / 7) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0008 : Poly :=
[
  term ((184 : Rat) / 7) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((184 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0008
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0009 : Poly :=
[
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0009 : Poly :=
[
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0009
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0010 : Poly :=
[
  term ((1305493241533 : Rat) / 8993245968) [(1, 1), (9, 1)]
]

/-- Partial product 10 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0010 : Poly :=
[
  term ((1305493241533 : Rat) / 4496622984) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((-1305493241533 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 2)],
  term ((-1305493241533 : Rat) / 8993245968) [(1, 1), (9, 1), (13, 2)],
  term ((1305493241533 : Rat) / 4496622984) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0010
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0011 : Poly :=
[
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 11 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0011 : Poly :=
[
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0011
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0012 : Poly :=
[
  term ((-185707805753 : Rat) / 4496622984) [(1, 1), (13, 1)]
]

/-- Partial product 12 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0012 : Poly :=
[
  term ((-185707805753 : Rat) / 2248311492) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-185707805753 : Rat) / 2248311492) [(1, 1), (9, 1), (13, 2)],
  term ((185707805753 : Rat) / 4496622984) [(1, 1), (12, 2), (13, 1)],
  term ((185707805753 : Rat) / 4496622984) [(1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0012
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0013 : Poly :=
[
  term ((115 : Rat) / 28) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0013 : Poly :=
[
  term ((115 : Rat) / 14) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((115 : Rat) / 14) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-115 : Rat) / 28) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-115 : Rat) / 28) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0013
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0014 : Poly :=
[
  term ((33928670009 : Rat) / 562077873) [(1, 1), (15, 1)]
]

/-- Partial product 14 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0014 : Poly :=
[
  term ((67857340018 : Rat) / 562077873) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((67857340018 : Rat) / 562077873) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-33928670009 : Rat) / 562077873) [(1, 1), (12, 2), (15, 1)],
  term ((-33928670009 : Rat) / 562077873) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0014
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0015 : Poly :=
[
  term ((-23 : Rat) / 7) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0015 : Poly :=
[
  term ((-46 : Rat) / 7) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((23 : Rat) / 7) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((23 : Rat) / 7) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0015
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0016 : Poly :=
[
  term ((1280 : Rat) / 21) [(3, 1), (5, 1)]
]

/-- Partial product 16 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0016 : Poly :=
[
  term ((2560 : Rat) / 21) [(3, 1), (5, 1), (8, 1), (12, 1)],
  term ((2560 : Rat) / 21) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-1280 : Rat) / 21) [(3, 1), (5, 1), (12, 2)],
  term ((-1280 : Rat) / 21) [(3, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0016
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0017 : Poly :=
[
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 17 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0017 : Poly :=
[
  term ((-1280 : Rat) / 7) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1)],
  term ((-1280 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((640 : Rat) / 7) [(3, 1), (5, 1), (12, 2), (14, 1)],
  term ((640 : Rat) / 7) [(3, 1), (5, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0017
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0018 : Poly :=
[
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 18 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0018 : Poly :=
[
  term ((-389120 : Rat) / 343) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-389120 : Rat) / 343) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((194560 : Rat) / 343) [(3, 1), (5, 1), (12, 2), (15, 2)],
  term ((194560 : Rat) / 343) [(3, 1), (5, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0018
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0019 : Poly :=
[
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 19 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0019 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0019
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0020 : Poly :=
[
  term ((-640 : Rat) / 21) [(3, 1), (9, 1)]
]

/-- Partial product 20 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0020 : Poly :=
[
  term ((-1280 : Rat) / 21) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((640 : Rat) / 21) [(3, 1), (9, 1), (12, 2)],
  term ((640 : Rat) / 21) [(3, 1), (9, 1), (13, 2)],
  term ((-1280 : Rat) / 21) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0020
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0021 : Poly :=
[
  term ((320 : Rat) / 7) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 21 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0021 : Poly :=
[
  term ((640 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((640 : Rat) / 7) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0021
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0022 : Poly :=
[
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 22 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0022 : Poly :=
[
  term ((194560 : Rat) / 343) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((194560 : Rat) / 343) [(3, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0022
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0023 : Poly :=
[
  term ((320 : Rat) / 21) [(3, 1), (11, 1)]
]

/-- Partial product 23 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0023 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((640 : Rat) / 21) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (11, 1), (12, 2)],
  term ((-320 : Rat) / 21) [(3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0023
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0024 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 24 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0024 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0024
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0025 : Poly :=
[
  term ((-16 : Rat) / 3) [(5, 1), (15, 1)]
]

/-- Partial product 25 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0025 : Poly :=
[
  term ((-32 : Rat) / 3) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((16 : Rat) / 3) [(5, 1), (12, 2), (15, 1)],
  term ((16 : Rat) / 3) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0025
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0026 : Poly :=
[
  term ((4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0026 : Poly :=
[
  term ((8 : Rat) / 3) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0026
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0027 : Poly :=
[
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 27 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0027 : Poly :=
[
  term ((-4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (12, 2)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0027
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0028 : Poly :=
[
  term ((-1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 28 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0028 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (13, 2)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0028
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0029 : Poly :=
[
  term ((8088939207425 : Rat) / 10117401714) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 29 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0029 : Poly :=
[
  term ((8088939207425 : Rat) / 5058700857) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-8088939207425 : Rat) / 10117401714) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((-8088939207425 : Rat) / 10117401714) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((8088939207425 : Rat) / 5058700857) [(6, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0029
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0030 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 30 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0030 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 1), (13, 3)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0030
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0031 : Poly :=
[
  term ((-7158759049051 : Rat) / 2901071261844) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 31 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0031 : Poly :=
[
  term ((-7158759049051 : Rat) / 1450535630922) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((7158759049051 : Rat) / 2901071261844) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((7158759049051 : Rat) / 2901071261844) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-7158759049051 : Rat) / 1450535630922) [(6, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0031
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0032 : Poly :=
[
  term ((-366963716209019 : Rat) / 399637367703) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 32 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0032 : Poly :=
[
  term ((-733927432418038 : Rat) / 399637367703) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-733927432418038 : Rat) / 399637367703) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((366963716209019 : Rat) / 399637367703) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((366963716209019 : Rat) / 399637367703) [(6, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0032
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0033 : Poly :=
[
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 33 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0033 : Poly :=
[
  term ((-340 : Rat) / 63) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0033
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0034 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 34 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0034 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0034
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0035 : Poly :=
[
  term ((12436879200914209 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 35 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0035 : Poly :=
[
  term ((12436879200914209 : Rat) / 13054820678298) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((12436879200914209 : Rat) / 13054820678298) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12436879200914209 : Rat) / 26109641356596) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-12436879200914209 : Rat) / 26109641356596) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0035
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0036 : Poly :=
[
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0036 : Poly :=
[
  term ((64 : Rat) / 9) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0036
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0037 : Poly :=
[
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2)]
]

/-- Partial product 37 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0037 : Poly :=
[
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (8, 1), (11, 2), (12, 1)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (12, 2)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0037
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0038 : Poly :=
[
  term ((34362796658753 : Rat) / 725267815461) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 38 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0038 : Poly :=
[
  term ((68725593317506 : Rat) / 725267815461) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((68725593317506 : Rat) / 725267815461) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-34362796658753 : Rat) / 725267815461) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-34362796658753 : Rat) / 725267815461) [(6, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0038
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0039 : Poly :=
[
  term ((157 : Rat) / 21) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0039 : Poly :=
[
  term ((314 : Rat) / 21) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0039
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0040 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(6, 1), (13, 2)]
]

/-- Partial product 40 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0040 : Poly :=
[
  term ((-941242657 : Rat) / 83270796) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (13, 3)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (12, 2), (13, 2)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0040
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0041 : Poly :=
[
  term ((-725 : Rat) / 84) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 41 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0041 : Poly :=
[
  term ((-725 : Rat) / 42) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (13, 3), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0041
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0042 : Poly :=
[
  term ((3849005354029 : Rat) / 859576670176) [(7, 1), (9, 1)]
]

/-- Partial product 42 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0042 : Poly :=
[
  term ((3849005354029 : Rat) / 429788335088) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((-3849005354029 : Rat) / 859576670176) [(7, 1), (9, 1), (12, 2)],
  term ((-3849005354029 : Rat) / 859576670176) [(7, 1), (9, 1), (13, 2)],
  term ((3849005354029 : Rat) / 429788335088) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0042
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0043 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 43 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0043 : Poly :=
[
  term ((-3064399565618 : Rat) / 80585312829) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0043
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0044 : Poly :=
[
  term ((357218796280009 : Rat) / 621658127538) [(7, 1), (11, 1)]
]

/-- Partial product 44 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0044 : Poly :=
[
  term ((357218796280009 : Rat) / 310829063769) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((357218796280009 : Rat) / 310829063769) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-357218796280009 : Rat) / 621658127538) [(7, 1), (11, 1), (12, 2)],
  term ((-357218796280009 : Rat) / 621658127538) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0044
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0045 : Poly :=
[
  term ((2609336230123727 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 45 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0045 : Poly :=
[
  term ((5218672460247454 : Rat) / 6527410339149) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((5218672460247454 : Rat) / 6527410339149) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2609336230123727 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-2609336230123727 : Rat) / 6527410339149) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0045
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0046 : Poly :=
[
  term ((17059450106977 : Rat) / 1289365005264) [(7, 1), (13, 1)]
]

/-- Partial product 46 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0046 : Poly :=
[
  term ((17059450106977 : Rat) / 644682502632) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((17059450106977 : Rat) / 644682502632) [(7, 1), (9, 1), (13, 2)],
  term ((-17059450106977 : Rat) / 1289365005264) [(7, 1), (12, 2), (13, 1)],
  term ((-17059450106977 : Rat) / 1289365005264) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0046
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0047 : Poly :=
[
  term ((725 : Rat) / 56) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 47 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0047 : Poly :=
[
  term ((725 : Rat) / 28) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 28) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 56) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-725 : Rat) / 56) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0047
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0048 : Poly :=
[
  term ((-474671511135211 : Rat) / 5802142523688) [(7, 1), (15, 1)]
]

/-- Partial product 48 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0048 : Poly :=
[
  term ((-474671511135211 : Rat) / 2901071261844) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-474671511135211 : Rat) / 2901071261844) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((474671511135211 : Rat) / 5802142523688) [(7, 1), (12, 2), (15, 1)],
  term ((474671511135211 : Rat) / 5802142523688) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0048
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0049 : Poly :=
[
  term ((-157 : Rat) / 14) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0049 : Poly :=
[
  term ((-157 : Rat) / 7) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 7) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 14) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((157 : Rat) / 14) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0049
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0050 : Poly :=
[
  term ((1532199782809 : Rat) / 107447083772) [(7, 2)]
]

/-- Partial product 50 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0050 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(7, 2), (8, 1), (12, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 2), (9, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(7, 2), (12, 2)],
  term ((-1532199782809 : Rat) / 107447083772) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0050
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0051 : Poly :=
[
  term ((39936 : Rat) / 553) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 51 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0051 : Poly :=
[
  term ((79872 : Rat) / 553) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-39936 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-39936 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((79872 : Rat) / 553) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0051
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0052 : Poly :=
[
  term ((-1771211695741 : Rat) / 177616607868) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 52 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0052 : Poly :=
[
  term ((-1771211695741 : Rat) / 88808303934) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((1771211695741 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((1771211695741 : Rat) / 177616607868) [(9, 1), (10, 1), (13, 3)],
  term ((-1771211695741 : Rat) / 88808303934) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0052
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0053 : Poly :=
[
  term ((305 : Rat) / 84) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 53 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0053 : Poly :=
[
  term ((305 : Rat) / 42) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-305 : Rat) / 84) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-305 : Rat) / 84) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((305 : Rat) / 42) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0053
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0054 : Poly :=
[
  term ((22301944217695 : Rat) / 710466431472) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 54 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0054 : Poly :=
[
  term ((22301944217695 : Rat) / 355233215736) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-22301944217695 : Rat) / 710466431472) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-22301944217695 : Rat) / 710466431472) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((22301944217695 : Rat) / 355233215736) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0054
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0055 : Poly :=
[
  term ((-65 : Rat) / 21) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0055 : Poly :=
[
  term ((-130 : Rat) / 21) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 21) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 21) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-130 : Rat) / 21) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0055
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0056 : Poly :=
[
  term ((-52098526042343 : Rat) / 473644287648) [(9, 1), (11, 1)]
]

/-- Partial product 56 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0056 : Poly :=
[
  term ((-52098526042343 : Rat) / 236822143824) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((52098526042343 : Rat) / 473644287648) [(9, 1), (11, 1), (12, 2)],
  term ((52098526042343 : Rat) / 473644287648) [(9, 1), (11, 1), (13, 2)],
  term ((-52098526042343 : Rat) / 236822143824) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0056
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0057 : Poly :=
[
  term ((-3605857173337117 : Rat) / 6394197883248) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 57 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0057 : Poly :=
[
  term ((-3605857173337117 : Rat) / 3197098941624) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((3605857173337117 : Rat) / 6394197883248) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((3605857173337117 : Rat) / 6394197883248) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3605857173337117 : Rat) / 3197098941624) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0057
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0058 : Poly :=
[
  term ((-9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 58 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0058 : Poly :=
[
  term ((-9008294618453 : Rat) / 59205535956) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-9008294618453 : Rat) / 59205535956) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0058
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0059 : Poly :=
[
  term ((-1594344100841 : Rat) / 14499314928) [(9, 1), (13, 1)]
]

/-- Partial product 59 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0059 : Poly :=
[
  term ((-1594344100841 : Rat) / 7249657464) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((1594344100841 : Rat) / 14499314928) [(9, 1), (12, 2), (13, 1)],
  term ((1594344100841 : Rat) / 14499314928) [(9, 1), (13, 3)],
  term ((-1594344100841 : Rat) / 7249657464) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0059
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0060 : Poly :=
[
  term ((22963112234129 : Rat) / 710466431472) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 60 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0060 : Poly :=
[
  term ((22963112234129 : Rat) / 355233215736) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-22963112234129 : Rat) / 710466431472) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-22963112234129 : Rat) / 710466431472) [(9, 1), (13, 3), (14, 1)],
  term ((22963112234129 : Rat) / 355233215736) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0060
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0061 : Poly :=
[
  term ((865 : Rat) / 168) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 61 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0061 : Poly :=
[
  term ((865 : Rat) / 84) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-865 : Rat) / 168) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-865 : Rat) / 168) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((865 : Rat) / 84) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0061
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0062 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 62 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0062 : Poly :=
[
  term ((2954048478533 : Rat) / 19735178652) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (13, 3), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0062
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0063 : Poly :=
[
  term ((-305 : Rat) / 28) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 63 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0063 : Poly :=
[
  term ((-305 : Rat) / 14) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0063
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0064 : Poly :=
[
  term ((-5 : Rat) / 3) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 64 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0064 : Poly :=
[
  term ((-10 : Rat) / 3) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 3) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((5 : Rat) / 3) [(9, 1), (13, 3), (16, 1)],
  term ((-10 : Rat) / 3) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0064
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0065 : Poly :=
[
  term ((-5611784242928831 : Rat) / 69625710284256) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 65 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0065 : Poly :=
[
  term ((-5611784242928831 : Rat) / 34812855142128) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((5611784242928831 : Rat) / 69625710284256) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((5611784242928831 : Rat) / 69625710284256) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-5611784242928831 : Rat) / 34812855142128) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0065
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0066 : Poly :=
[
  term ((-197 : Rat) / 42) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0066 : Poly :=
[
  term ((-197 : Rat) / 21) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 42) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 42) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-197 : Rat) / 21) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0066
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0067 : Poly :=
[
  term ((1023559677272003 : Rat) / 139251420568512) [(9, 1), (15, 1)]
]

/-- Partial product 67 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0067 : Poly :=
[
  term ((1023559677272003 : Rat) / 69625710284256) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1023559677272003 : Rat) / 139251420568512) [(9, 1), (12, 2), (15, 1)],
  term ((-1023559677272003 : Rat) / 139251420568512) [(9, 1), (13, 2), (15, 1)],
  term ((1023559677272003 : Rat) / 69625710284256) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0067
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0068 : Poly :=
[
  term ((1 : Rat) / 21) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0068 : Poly :=
[
  term ((2 : Rat) / 21) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 21) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1 : Rat) / 21) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2 : Rat) / 21) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0068
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0069 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (15, 3)]
]

/-- Partial product 69 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0069 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (12, 2), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (13, 2), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0069
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0070 : Poly :=
[
  term ((65 : Rat) / 7) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 70 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0070 : Poly :=
[
  term ((130 : Rat) / 7) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0070
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0071 : Poly :=
[
  term ((23894219063 : Rat) / 1124155746) [(9, 2)]
]

/-- Partial product 71 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0071 : Poly :=
[
  term ((23894219063 : Rat) / 562077873) [(8, 1), (9, 2), (12, 1)],
  term ((-23894219063 : Rat) / 1124155746) [(9, 2), (12, 2)],
  term ((-23894219063 : Rat) / 1124155746) [(9, 2), (13, 2)],
  term ((23894219063 : Rat) / 562077873) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0071
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0072 : Poly :=
[
  term ((210703568101 : Rat) / 8993245968) [(9, 2), (10, 1)]
]

/-- Partial product 72 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0072 : Poly :=
[
  term ((210703568101 : Rat) / 4496622984) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((-210703568101 : Rat) / 8993245968) [(9, 2), (10, 1), (12, 2)],
  term ((-210703568101 : Rat) / 8993245968) [(9, 2), (10, 1), (13, 2)],
  term ((210703568101 : Rat) / 4496622984) [(9, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0072
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0073 : Poly :=
[
  term ((-1249015996475 : Rat) / 17986491936) [(9, 2), (14, 1)]
]

/-- Partial product 73 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0073 : Poly :=
[
  term ((-1249015996475 : Rat) / 8993245968) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((1249015996475 : Rat) / 17986491936) [(9, 2), (12, 2), (14, 1)],
  term ((1249015996475 : Rat) / 17986491936) [(9, 2), (13, 2), (14, 1)],
  term ((-1249015996475 : Rat) / 8993245968) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0073
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0074 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (15, 2)]
]

/-- Partial product 74 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0074 : Poly :=
[
  term ((-210703568101 : Rat) / 1498874328) [(8, 1), (9, 2), (12, 1), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (13, 2), (15, 2)],
  term ((-210703568101 : Rat) / 1498874328) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0074
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0075 : Poly :=
[
  term ((4992 : Rat) / 553) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 75 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0075 : Poly :=
[
  term ((9984 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-4992 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-4992 : Rat) / 553) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0075
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0076 : Poly :=
[
  term ((29952 : Rat) / 553) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 76 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0076 : Poly :=
[
  term ((59904 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-29952 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-29952 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0076
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0077 : Poly :=
[
  term ((108418763473967 : Rat) / 1065699647208) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 77 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0077 : Poly :=
[
  term ((108418763473967 : Rat) / 532849823604) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((108418763473967 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-108418763473967 : Rat) / 1065699647208) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-108418763473967 : Rat) / 1065699647208) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0077
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0078 : Poly :=
[
  term ((101 : Rat) / 84) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0078 : Poly :=
[
  term ((101 : Rat) / 42) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((101 : Rat) / 42) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-101 : Rat) / 84) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101 : Rat) / 84) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0078
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0079 : Poly :=
[
  term ((-6090608323475 : Rat) / 532849823604) [(10, 1), (13, 2)]
]

/-- Partial product 79 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0079 : Poly :=
[
  term ((-6090608323475 : Rat) / 266424911802) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 3)],
  term ((6090608323475 : Rat) / 532849823604) [(10, 1), (12, 2), (13, 2)],
  term ((6090608323475 : Rat) / 532849823604) [(10, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0079
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0080 : Poly :=
[
  term ((5 : Rat) / 6) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 80 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0080 : Poly :=
[
  term ((5 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 3) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0080
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0081 : Poly :=
[
  term ((-15073554766871 : Rat) / 88808303934) [(10, 1), (15, 2)]
]

/-- Partial product 81 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0081 : Poly :=
[
  term ((-15073554766871 : Rat) / 44404151967) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-15073554766871 : Rat) / 44404151967) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((15073554766871 : Rat) / 88808303934) [(10, 1), (12, 2), (15, 2)],
  term ((15073554766871 : Rat) / 88808303934) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0081
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0082 : Poly :=
[
  term ((-11 : Rat) / 7) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 82 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0082 : Poly :=
[
  term ((-22 : Rat) / 7) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-22 : Rat) / 7) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 7) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((11 : Rat) / 7) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0082
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0083 : Poly :=
[
  term ((-82604286814447 : Rat) / 710466431472) [(11, 1), (13, 1)]
]

/-- Partial product 83 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0083 : Poly :=
[
  term ((-82604286814447 : Rat) / 355233215736) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-82604286814447 : Rat) / 355233215736) [(9, 1), (11, 1), (13, 2)],
  term ((82604286814447 : Rat) / 710466431472) [(11, 1), (12, 2), (13, 1)],
  term ((82604286814447 : Rat) / 710466431472) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0083
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0084 : Poly :=
[
  term ((2438286298446361 : Rat) / 3197098941624) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 84 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0084 : Poly :=
[
  term ((2438286298446361 : Rat) / 1598549470812) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2438286298446361 : Rat) / 1598549470812) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0084
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0085 : Poly :=
[
  term ((-7645 : Rat) / 252) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 85 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0085 : Poly :=
[
  term ((-7645 : Rat) / 126) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7645 : Rat) / 126) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7645 : Rat) / 252) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((7645 : Rat) / 252) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0085
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0086 : Poly :=
[
  term ((-2954048478533 : Rat) / 19735178652) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 86 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0086 : Poly :=
[
  term ((-2954048478533 : Rat) / 9867589326) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 9867589326) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0086
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0087 : Poly :=
[
  term ((305 : Rat) / 14) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 87 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0087 : Poly :=
[
  term ((305 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0087
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0088 : Poly :=
[
  term ((425 : Rat) / 168) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 88 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0088 : Poly :=
[
  term ((425 : Rat) / 84) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((425 : Rat) / 84) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-425 : Rat) / 168) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-425 : Rat) / 168) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0088
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0089 : Poly :=
[
  term ((-8768283710970787 : Rat) / 26109641356596) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 89 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0089 : Poly :=
[
  term ((-8768283710970787 : Rat) / 13054820678298) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8768283710970787 : Rat) / 13054820678298) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((8768283710970787 : Rat) / 26109641356596) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((8768283710970787 : Rat) / 26109641356596) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0089
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0090 : Poly :=
[
  term ((1585 : Rat) / 63) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0090 : Poly :=
[
  term ((3170 : Rat) / 63) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3170 : Rat) / 63) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1585 : Rat) / 63) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1585 : Rat) / 63) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0090
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0091 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 91 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0091 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0091
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0092 : Poly :=
[
  term ((-829570191737071 : Rat) / 3729948765228) [(11, 1), (15, 1)]
]

/-- Partial product 92 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0092 : Poly :=
[
  term ((-829570191737071 : Rat) / 1864974382614) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-829570191737071 : Rat) / 1864974382614) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((829570191737071 : Rat) / 3729948765228) [(11, 1), (12, 2), (15, 1)],
  term ((829570191737071 : Rat) / 3729948765228) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0092
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0093 : Poly :=
[
  term ((-95 : Rat) / 42) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0093 : Poly :=
[
  term ((-95 : Rat) / 21) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95 : Rat) / 21) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((95 : Rat) / 42) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((95 : Rat) / 42) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0093
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0094 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(11, 1), (15, 3)]
]

/-- Partial product 94 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0094 : Poly :=
[
  term ((6733812628546 : Rat) / 14801383989) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((6733812628546 : Rat) / 14801383989) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (12, 2), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0094
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0095 : Poly :=
[
  term ((-130 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 95 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0095 : Poly :=
[
  term ((-260 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-260 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0095
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0096 : Poly :=
[
  term ((57408 : Rat) / 553) [(11, 2)]
]

/-- Partial product 96 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0096 : Poly :=
[
  term ((114816 : Rat) / 553) [(8, 1), (11, 2), (12, 1)],
  term ((114816 : Rat) / 553) [(9, 1), (11, 2), (13, 1)],
  term ((-57408 : Rat) / 553) [(11, 2), (12, 2)],
  term ((-57408 : Rat) / 553) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0096
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0097 : Poly :=
[
  term ((-2328819458727799 : Rat) / 6527410339149) [(11, 2), (14, 1)]
]

/-- Partial product 97 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0097 : Poly :=
[
  term ((-4657638917455598 : Rat) / 6527410339149) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-4657638917455598 : Rat) / 6527410339149) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2328819458727799 : Rat) / 6527410339149) [(11, 2), (12, 2), (14, 1)],
  term ((2328819458727799 : Rat) / 6527410339149) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0097
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0098 : Poly :=
[
  term ((239616 : Rat) / 553) [(11, 2), (15, 2)]
]

/-- Partial product 98 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0098 : Poly :=
[
  term ((479232 : Rat) / 553) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((479232 : Rat) / 553) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-239616 : Rat) / 553) [(11, 2), (12, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0098
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0099 : Poly :=
[
  term ((-2954048478533 : Rat) / 78940714608) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 99 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0099 : Poly :=
[
  term ((-2954048478533 : Rat) / 39470357304) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0099
        rs_R009_ueqv_R009YNNNN_generator_21_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_21_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_21_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_21_0000,
  rs_R009_ueqv_R009YNNNN_partial_21_0001,
  rs_R009_ueqv_R009YNNNN_partial_21_0002,
  rs_R009_ueqv_R009YNNNN_partial_21_0003,
  rs_R009_ueqv_R009YNNNN_partial_21_0004,
  rs_R009_ueqv_R009YNNNN_partial_21_0005,
  rs_R009_ueqv_R009YNNNN_partial_21_0006,
  rs_R009_ueqv_R009YNNNN_partial_21_0007,
  rs_R009_ueqv_R009YNNNN_partial_21_0008,
  rs_R009_ueqv_R009YNNNN_partial_21_0009,
  rs_R009_ueqv_R009YNNNN_partial_21_0010,
  rs_R009_ueqv_R009YNNNN_partial_21_0011,
  rs_R009_ueqv_R009YNNNN_partial_21_0012,
  rs_R009_ueqv_R009YNNNN_partial_21_0013,
  rs_R009_ueqv_R009YNNNN_partial_21_0014,
  rs_R009_ueqv_R009YNNNN_partial_21_0015,
  rs_R009_ueqv_R009YNNNN_partial_21_0016,
  rs_R009_ueqv_R009YNNNN_partial_21_0017,
  rs_R009_ueqv_R009YNNNN_partial_21_0018,
  rs_R009_ueqv_R009YNNNN_partial_21_0019,
  rs_R009_ueqv_R009YNNNN_partial_21_0020,
  rs_R009_ueqv_R009YNNNN_partial_21_0021,
  rs_R009_ueqv_R009YNNNN_partial_21_0022,
  rs_R009_ueqv_R009YNNNN_partial_21_0023,
  rs_R009_ueqv_R009YNNNN_partial_21_0024,
  rs_R009_ueqv_R009YNNNN_partial_21_0025,
  rs_R009_ueqv_R009YNNNN_partial_21_0026,
  rs_R009_ueqv_R009YNNNN_partial_21_0027,
  rs_R009_ueqv_R009YNNNN_partial_21_0028,
  rs_R009_ueqv_R009YNNNN_partial_21_0029,
  rs_R009_ueqv_R009YNNNN_partial_21_0030,
  rs_R009_ueqv_R009YNNNN_partial_21_0031,
  rs_R009_ueqv_R009YNNNN_partial_21_0032,
  rs_R009_ueqv_R009YNNNN_partial_21_0033,
  rs_R009_ueqv_R009YNNNN_partial_21_0034,
  rs_R009_ueqv_R009YNNNN_partial_21_0035,
  rs_R009_ueqv_R009YNNNN_partial_21_0036,
  rs_R009_ueqv_R009YNNNN_partial_21_0037,
  rs_R009_ueqv_R009YNNNN_partial_21_0038,
  rs_R009_ueqv_R009YNNNN_partial_21_0039,
  rs_R009_ueqv_R009YNNNN_partial_21_0040,
  rs_R009_ueqv_R009YNNNN_partial_21_0041,
  rs_R009_ueqv_R009YNNNN_partial_21_0042,
  rs_R009_ueqv_R009YNNNN_partial_21_0043,
  rs_R009_ueqv_R009YNNNN_partial_21_0044,
  rs_R009_ueqv_R009YNNNN_partial_21_0045,
  rs_R009_ueqv_R009YNNNN_partial_21_0046,
  rs_R009_ueqv_R009YNNNN_partial_21_0047,
  rs_R009_ueqv_R009YNNNN_partial_21_0048,
  rs_R009_ueqv_R009YNNNN_partial_21_0049,
  rs_R009_ueqv_R009YNNNN_partial_21_0050,
  rs_R009_ueqv_R009YNNNN_partial_21_0051,
  rs_R009_ueqv_R009YNNNN_partial_21_0052,
  rs_R009_ueqv_R009YNNNN_partial_21_0053,
  rs_R009_ueqv_R009YNNNN_partial_21_0054,
  rs_R009_ueqv_R009YNNNN_partial_21_0055,
  rs_R009_ueqv_R009YNNNN_partial_21_0056,
  rs_R009_ueqv_R009YNNNN_partial_21_0057,
  rs_R009_ueqv_R009YNNNN_partial_21_0058,
  rs_R009_ueqv_R009YNNNN_partial_21_0059,
  rs_R009_ueqv_R009YNNNN_partial_21_0060,
  rs_R009_ueqv_R009YNNNN_partial_21_0061,
  rs_R009_ueqv_R009YNNNN_partial_21_0062,
  rs_R009_ueqv_R009YNNNN_partial_21_0063,
  rs_R009_ueqv_R009YNNNN_partial_21_0064,
  rs_R009_ueqv_R009YNNNN_partial_21_0065,
  rs_R009_ueqv_R009YNNNN_partial_21_0066,
  rs_R009_ueqv_R009YNNNN_partial_21_0067,
  rs_R009_ueqv_R009YNNNN_partial_21_0068,
  rs_R009_ueqv_R009YNNNN_partial_21_0069,
  rs_R009_ueqv_R009YNNNN_partial_21_0070,
  rs_R009_ueqv_R009YNNNN_partial_21_0071,
  rs_R009_ueqv_R009YNNNN_partial_21_0072,
  rs_R009_ueqv_R009YNNNN_partial_21_0073,
  rs_R009_ueqv_R009YNNNN_partial_21_0074,
  rs_R009_ueqv_R009YNNNN_partial_21_0075,
  rs_R009_ueqv_R009YNNNN_partial_21_0076,
  rs_R009_ueqv_R009YNNNN_partial_21_0077,
  rs_R009_ueqv_R009YNNNN_partial_21_0078,
  rs_R009_ueqv_R009YNNNN_partial_21_0079,
  rs_R009_ueqv_R009YNNNN_partial_21_0080,
  rs_R009_ueqv_R009YNNNN_partial_21_0081,
  rs_R009_ueqv_R009YNNNN_partial_21_0082,
  rs_R009_ueqv_R009YNNNN_partial_21_0083,
  rs_R009_ueqv_R009YNNNN_partial_21_0084,
  rs_R009_ueqv_R009YNNNN_partial_21_0085,
  rs_R009_ueqv_R009YNNNN_partial_21_0086,
  rs_R009_ueqv_R009YNNNN_partial_21_0087,
  rs_R009_ueqv_R009YNNNN_partial_21_0088,
  rs_R009_ueqv_R009YNNNN_partial_21_0089,
  rs_R009_ueqv_R009YNNNN_partial_21_0090,
  rs_R009_ueqv_R009YNNNN_partial_21_0091,
  rs_R009_ueqv_R009YNNNN_partial_21_0092,
  rs_R009_ueqv_R009YNNNN_partial_21_0093,
  rs_R009_ueqv_R009YNNNN_partial_21_0094,
  rs_R009_ueqv_R009YNNNN_partial_21_0095,
  rs_R009_ueqv_R009YNNNN_partial_21_0096,
  rs_R009_ueqv_R009YNNNN_partial_21_0097,
  rs_R009_ueqv_R009YNNNN_partial_21_0098,
  rs_R009_ueqv_R009YNNNN_partial_21_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_21_0000_0099 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-249803199295 : Rat) / 374718582) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((18615854345 : Rat) / 26765613) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term (-46 : Rat) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (8, 1), (12, 1), (13, 2)],
  term ((115 : Rat) / 7) [(0, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-44136149720 : Rat) / 187359291) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((184 : Rat) / 7) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-44136149720 : Rat) / 187359291) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((184 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((257015706985 : Rat) / 249812388) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term (-46 : Rat) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-682774821515 : Rat) / 1498874328) [(0, 1), (9, 1), (13, 3)],
  term ((115 : Rat) / 7) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((-249803199295 : Rat) / 374718582) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (13, 2)],
  term ((-18615854345 : Rat) / 53531226) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term (23 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (12, 2), (13, 2)],
  term ((-115 : Rat) / 14) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((22068074860 : Rat) / 187359291) [(0, 1), (12, 2), (15, 2)],
  term ((-92 : Rat) / 7) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((22068074860 : Rat) / 187359291) [(0, 1), (13, 2), (15, 2)],
  term ((-92 : Rat) / 7) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18615854345 : Rat) / 53531226) [(0, 1), (13, 3), (15, 1)],
  term (23 : Rat) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (13, 4)],
  term ((-115 : Rat) / 14) [(0, 1), (13, 4), (16, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((1305493241533 : Rat) / 4496622984) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-185707805753 : Rat) / 2248311492) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((115 : Rat) / 14) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((67857340018 : Rat) / 562077873) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1305493241533 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 2)],
  term ((67857340018 : Rat) / 562077873) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-682774821515 : Rat) / 2997748656) [(1, 1), (9, 1), (13, 2)],
  term ((115 : Rat) / 14) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((1305493241533 : Rat) / 4496622984) [(1, 1), (9, 2), (13, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((185707805753 : Rat) / 4496622984) [(1, 1), (12, 2), (13, 1)],
  term ((-115 : Rat) / 28) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-33928670009 : Rat) / 562077873) [(1, 1), (12, 2), (15, 1)],
  term ((23 : Rat) / 7) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33928670009 : Rat) / 562077873) [(1, 1), (13, 2), (15, 1)],
  term ((23 : Rat) / 7) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((185707805753 : Rat) / 4496622984) [(1, 1), (13, 3)],
  term ((-115 : Rat) / 28) [(1, 1), (13, 3), (16, 1)],
  term ((2560 : Rat) / 21) [(3, 1), (5, 1), (8, 1), (12, 1)],
  term ((-1280 : Rat) / 7) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1)],
  term ((-389120 : Rat) / 343) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((2560 : Rat) / 21) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-1280 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((-389120 : Rat) / 343) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1280 : Rat) / 21) [(3, 1), (5, 1), (12, 2)],
  term ((640 : Rat) / 7) [(3, 1), (5, 1), (12, 2), (14, 1)],
  term ((194560 : Rat) / 343) [(3, 1), (5, 1), (12, 2), (15, 2)],
  term ((-1280 : Rat) / 21) [(3, 1), (5, 1), (13, 2)],
  term ((640 : Rat) / 7) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((194560 : Rat) / 343) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1), (13, 2)],
  term ((-1280 : Rat) / 21) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((640 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((194560 : Rat) / 343) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((640 : Rat) / 21) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((640 : Rat) / 21) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((640 : Rat) / 21) [(3, 1), (9, 1), (12, 2)],
  term ((-320 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((-97280 : Rat) / 343) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((640 : Rat) / 21) [(3, 1), (9, 1), (13, 2)],
  term ((-320 : Rat) / 7) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((-97280 : Rat) / 343) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((-1280 : Rat) / 21) [(3, 1), (9, 2), (13, 1)],
  term ((640 : Rat) / 7) [(3, 1), (9, 2), (13, 1), (14, 1)],
  term ((194560 : Rat) / 343) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((-320 : Rat) / 21) [(3, 1), (11, 1), (12, 2)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (11, 1), (13, 2)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-32 : Rat) / 3) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((8 : Rat) / 3) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(5, 1), (12, 2), (15, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(5, 1), (13, 2), (15, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (13, 2)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (12, 2)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (13, 2)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (13, 3)],
  term ((8088939207425 : Rat) / 5058700857) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-7158759049051 : Rat) / 1450535630922) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-733927432418038 : Rat) / 399637367703) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((12436879200914209 : Rat) / 13054820678298) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((64 : Rat) / 9) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (8, 1), (11, 2), (12, 1)],
  term ((68725593317506 : Rat) / 725267815461) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((314 : Rat) / 21) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((-725 : Rat) / 42) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-8088939207425 : Rat) / 10117401714) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((12436879200914209 : Rat) / 13054820678298) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((64 : Rat) / 9) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2106881062222651 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-340 : Rat) / 63) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((7158759049051 : Rat) / 2901071261844) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5937172361 : Rat) / 333083184) [(6, 1), (9, 1), (13, 3)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (13, 3), (16, 1)],
  term ((8088939207425 : Rat) / 5058700857) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-7158759049051 : Rat) / 1450535630922) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (13, 2)],
  term ((366963716209019 : Rat) / 399637367703) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-12436879200914209 : Rat) / 26109641356596) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12436879200914209 : Rat) / 26109641356596) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((366963716209019 : Rat) / 399637367703) [(6, 1), (11, 1), (13, 3)],
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (13, 3), (16, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (12, 2)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (13, 2)],
  term ((-34362796658753 : Rat) / 725267815461) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (12, 2), (13, 2)],
  term ((725 : Rat) / 84) [(6, 1), (12, 2), (13, 2), (16, 1)],
  term ((-34362796658753 : Rat) / 725267815461) [(6, 1), (13, 3), (15, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (13, 4)],
  term ((725 : Rat) / 84) [(6, 1), (13, 4), (16, 1)],
  term ((3849005354029 : Rat) / 429788335088) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((357218796280009 : Rat) / 310829063769) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((5218672460247454 : Rat) / 6527410339149) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((17059450106977 : Rat) / 644682502632) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((725 : Rat) / 28) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-474671511135211 : Rat) / 2901071261844) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 7) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((357218796280009 : Rat) / 310829063769) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((5218672460247454 : Rat) / 6527410339149) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3849005354029 : Rat) / 859576670176) [(7, 1), (9, 1), (12, 2)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-474671511135211 : Rat) / 2901071261844) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-157 : Rat) / 7) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((56690784365821 : Rat) / 2578730010528) [(7, 1), (9, 1), (13, 2)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((725 : Rat) / 28) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((3849005354029 : Rat) / 429788335088) [(7, 1), (9, 2), (13, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-357218796280009 : Rat) / 621658127538) [(7, 1), (11, 1), (12, 2)],
  term ((-2609336230123727 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-357218796280009 : Rat) / 621658127538) [(7, 1), (11, 1), (13, 2)],
  term ((-2609336230123727 : Rat) / 6527410339149) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-17059450106977 : Rat) / 1289365005264) [(7, 1), (12, 2), (13, 1)],
  term ((-725 : Rat) / 56) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((474671511135211 : Rat) / 5802142523688) [(7, 1), (12, 2), (15, 1)],
  term ((157 : Rat) / 14) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((474671511135211 : Rat) / 5802142523688) [(7, 1), (13, 2), (15, 1)],
  term ((157 : Rat) / 14) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17059450106977 : Rat) / 1289365005264) [(7, 1), (13, 3)],
  term ((-725 : Rat) / 56) [(7, 1), (13, 3), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 2), (8, 1), (12, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 2), (9, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(7, 2), (12, 2)],
  term ((-1532199782809 : Rat) / 107447083772) [(7, 2), (13, 2)],
  term ((79872 : Rat) / 553) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1771211695741 : Rat) / 88808303934) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((305 : Rat) / 42) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((22301944217695 : Rat) / 355233215736) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-130 : Rat) / 21) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-52098526042343 : Rat) / 236822143824) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-3605857173337117 : Rat) / 3197098941624) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9008294618453 : Rat) / 59205535956) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1594344100841 : Rat) / 7249657464) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((22963112234129 : Rat) / 355233215736) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((865 : Rat) / 84) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 14) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10 : Rat) / 3) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5611784242928831 : Rat) / 34812855142128) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-197 : Rat) / 21) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1023559677272003 : Rat) / 69625710284256) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((2 : Rat) / 21) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((130 : Rat) / 7) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((210703568101 : Rat) / 4496622984) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((23894219063 : Rat) / 562077873) [(8, 1), (9, 2), (12, 1)],
  term ((-1249015996475 : Rat) / 8993245968) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((-210703568101 : Rat) / 1498874328) [(8, 1), (9, 2), (12, 1), (15, 2)],
  term ((9984 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((59904 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((108418763473967 : Rat) / 532849823604) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((101 : Rat) / 42) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((5 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-15073554766871 : Rat) / 44404151967) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-22 : Rat) / 7) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-82604286814447 : Rat) / 355233215736) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((2438286298446361 : Rat) / 1598549470812) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-7645 : Rat) / 126) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 9867589326) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((425 : Rat) / 84) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8768283710970787 : Rat) / 13054820678298) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3170 : Rat) / 63) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-829570191737071 : Rat) / 1864974382614) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-95 : Rat) / 21) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6733812628546 : Rat) / 14801383989) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-260 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((114816 : Rat) / 553) [(8, 1), (11, 2), (12, 1)],
  term ((-4657638917455598 : Rat) / 6527410339149) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((479232 : Rat) / 553) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((1934854446325 : Rat) / 355233215736) [(8, 1), (12, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-39936 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((1771211695741 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-305 : Rat) / 84) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-22301944217695 : Rat) / 710466431472) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((65 : Rat) / 21) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-15073554766871 : Rat) / 44404151967) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-22 : Rat) / 7) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((366769221242783 : Rat) / 2131399294416) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((11 : Rat) / 2) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-981083079961 : Rat) / 76121403372) [(9, 1), (10, 1), (13, 3)],
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((52098526042343 : Rat) / 473644287648) [(9, 1), (11, 1), (12, 2)],
  term ((3605857173337117 : Rat) / 6394197883248) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-8768283710970787 : Rat) / 13054820678298) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((3170 : Rat) / 63) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-829570191737071 : Rat) / 1864974382614) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-95 : Rat) / 21) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6733812628546 : Rat) / 14801383989) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-260 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-174121569130759 : Rat) / 1420932862944) [(9, 1), (11, 1), (13, 2)],
  term ((13359002367122561 : Rat) / 6394197883248) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-7645 : Rat) / 126) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-77085385201 : Rat) / 345221784) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((305 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((425 : Rat) / 84) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((114816 : Rat) / 553) [(9, 1), (11, 2), (13, 1)],
  term ((-4657638917455598 : Rat) / 6527410339149) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((479232 : Rat) / 553) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((1594344100841 : Rat) / 14499314928) [(9, 1), (12, 2), (13, 1)],
  term ((-22963112234129 : Rat) / 710466431472) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-865 : Rat) / 168) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((5611784242928831 : Rat) / 69625710284256) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((197 : Rat) / 42) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1023559677272003 : Rat) / 139251420568512) [(9, 1), (12, 2), (15, 1)],
  term ((-1 : Rat) / 21) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (12, 2), (15, 3)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((1934854446325 : Rat) / 355233215736) [(9, 1), (13, 1)],
  term ((400842726796619 : Rat) / 69625710284256) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((197 : Rat) / 42) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1023559677272003 : Rat) / 139251420568512) [(9, 1), (13, 2), (15, 1)],
  term ((-1 : Rat) / 21) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (13, 2), (15, 3)],
  term ((-65 : Rat) / 7) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((1594344100841 : Rat) / 14499314928) [(9, 1), (13, 3)],
  term ((-22963112234129 : Rat) / 710466431472) [(9, 1), (13, 3), (14, 1)],
  term ((-865 : Rat) / 168) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (13, 3), (15, 2)],
  term ((305 : Rat) / 28) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(9, 1), (13, 3), (16, 1)],
  term ((79872 : Rat) / 553) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-210703568101 : Rat) / 8993245968) [(9, 2), (10, 1), (12, 2)],
  term ((22301944217695 : Rat) / 355233215736) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-130 : Rat) / 21) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10271758481969 : Rat) / 236822143824) [(9, 2), (10, 1), (13, 2)],
  term ((305 : Rat) / 42) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-52098526042343 : Rat) / 236822143824) [(9, 2), (11, 1), (13, 1)],
  term ((-3605857173337117 : Rat) / 3197098941624) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-9008294618453 : Rat) / 59205535956) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-23894219063 : Rat) / 1124155746) [(9, 2), (12, 2)],
  term ((1249015996475 : Rat) / 17986491936) [(9, 2), (12, 2), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 2), (15, 2)],
  term ((-5611784242928831 : Rat) / 34812855142128) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-197 : Rat) / 21) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1023559677272003 : Rat) / 69625710284256) [(9, 2), (13, 1), (15, 1)],
  term ((2 : Rat) / 21) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(9, 2), (13, 1), (15, 3)],
  term ((130 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-85673434165117 : Rat) / 355233215736) [(9, 2), (13, 2)],
  term ((190524712658041 : Rat) / 1420932862944) [(9, 2), (13, 2), (14, 1)],
  term ((865 : Rat) / 84) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((1063146196375 : Rat) / 4833104976) [(9, 2), (13, 2), (15, 2)],
  term ((-305 : Rat) / 14) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-10 : Rat) / 3) [(9, 2), (13, 2), (16, 1)],
  term ((210703568101 : Rat) / 4496622984) [(9, 3), (10, 1), (13, 1)],
  term ((23894219063 : Rat) / 562077873) [(9, 3), (13, 1)],
  term ((-1249015996475 : Rat) / 8993245968) [(9, 3), (13, 1), (14, 1)],
  term ((-210703568101 : Rat) / 1498874328) [(9, 3), (13, 1), (15, 2)],
  term ((-4992 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-29952 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-29952 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-4992 : Rat) / 553) [(10, 1), (11, 1), (13, 3)],
  term ((-108418763473967 : Rat) / 1065699647208) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-101 : Rat) / 84) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(10, 1), (12, 2), (13, 2)],
  term ((-5 : Rat) / 6) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((15073554766871 : Rat) / 88808303934) [(10, 1), (12, 2), (15, 2)],
  term ((11 : Rat) / 7) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((15073554766871 : Rat) / 88808303934) [(10, 1), (13, 2), (15, 2)],
  term ((11 : Rat) / 7) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-108418763473967 : Rat) / 1065699647208) [(10, 1), (13, 3), (15, 1)],
  term ((-101 : Rat) / 84) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(10, 1), (13, 4)],
  term ((-5 : Rat) / 6) [(10, 1), (13, 4), (16, 1)],
  term ((82604286814447 : Rat) / 710466431472) [(11, 1), (12, 2), (13, 1)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((7645 : Rat) / 252) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-305 : Rat) / 14) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-425 : Rat) / 168) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((8768283710970787 : Rat) / 26109641356596) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1585 : Rat) / 63) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((829570191737071 : Rat) / 3729948765228) [(11, 1), (12, 2), (15, 1)],
  term ((95 : Rat) / 42) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (12, 2), (15, 3)],
  term ((130 : Rat) / 7) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((8768283710970787 : Rat) / 26109641356596) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1585 : Rat) / 63) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((829570191737071 : Rat) / 3729948765228) [(11, 1), (13, 2), (15, 1)],
  term ((95 : Rat) / 42) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (13, 2), (15, 3)],
  term ((130 : Rat) / 7) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((82604286814447 : Rat) / 710466431472) [(11, 1), (13, 3)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(11, 1), (13, 3), (14, 1)],
  term ((7645 : Rat) / 252) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (13, 3), (15, 2)],
  term ((-305 : Rat) / 14) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-425 : Rat) / 168) [(11, 1), (13, 3), (16, 1)],
  term ((-57408 : Rat) / 553) [(11, 2), (12, 2)],
  term ((2328819458727799 : Rat) / 6527410339149) [(11, 2), (12, 2), (14, 1)],
  term ((-239616 : Rat) / 553) [(11, 2), (12, 2), (15, 2)],
  term ((-57408 : Rat) / 553) [(11, 2), (13, 2)],
  term ((2328819458727799 : Rat) / 6527410339149) [(11, 2), (13, 2), (14, 1)],
  term ((-239616 : Rat) / 553) [(11, 2), (13, 2), (15, 2)],
  term ((-1934854446325 : Rat) / 710466431472) [(12, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1934854446325 : Rat) / 710466431472) [(13, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_21_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_21_0000_0099
      rs_R009_ueqv_R009YNNNN_block_21_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
