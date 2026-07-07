/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 15:0-23

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_15_0000_0023 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(4, 1)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0000 : Poly :=
[
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0000 : Poly :=
[
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 2), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0000
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0001 : Poly :=
[
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0001 : Poly :=
[
  term ((-36811646155131 : Rat) / 15218560320848) [(0, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((36811646155131 : Rat) / 15218560320848) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 15218560320848) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0001
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0002 : Poly :=
[
  term ((1066948991083383 : Rat) / 852239377967488) [(0, 1), (16, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0002 : Poly :=
[
  term ((1066948991083383 : Rat) / 426119688983744) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-1066948991083383 : Rat) / 426119688983744) [(0, 1), (4, 1), (16, 1)],
  term ((1066948991083383 : Rat) / 426119688983744) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-1066948991083383 : Rat) / 852239377967488) [(0, 1), (10, 2), (16, 1)],
  term ((-1066948991083383 : Rat) / 852239377967488) [(0, 1), (11, 2), (16, 1)],
  term ((1066948991083383 : Rat) / 852239377967488) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0002_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0002
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0003 : Poly :=
[
  term ((36811646155131 : Rat) / 60874241283392) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0003 : Poly :=
[
  term ((36811646155131 : Rat) / 30437120641696) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(1, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(1, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0003_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0003
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0004 : Poly :=
[
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0004 : Poly :=
[
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0004_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0004
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0005 : Poly :=
[
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 5 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0005 : Poly :=
[
  term ((9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 6658120140371) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0005_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0005
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0006 : Poly :=
[
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (16, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0006 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0006_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0006
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0007 : Poly :=
[
  term ((-9184513182051 : Rat) / 26632480561484) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0007 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(3, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0007_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0007
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0008 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0008 : Poly :=
[
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0008_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0008
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0009 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0009 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0009_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0009
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0010 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 10 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0010 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0010_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0010
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0011 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0011 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0011_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0011
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0012 : Poly :=
[
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0012 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0012_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0012
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0013 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 13 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0013 : Poly :=
[
  term ((349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0013_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0013
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0014 : Poly :=
[
  term ((-579882331213199 : Rat) / 121748482566784) [(8, 1), (16, 1)]
]

/-- Partial product 14 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0014 : Poly :=
[
  term ((-579882331213199 : Rat) / 60874241283392) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((579882331213199 : Rat) / 60874241283392) [(4, 1), (8, 1), (16, 1)],
  term ((-579882331213199 : Rat) / 60874241283392) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((579882331213199 : Rat) / 121748482566784) [(8, 1), (10, 2), (16, 1)],
  term ((579882331213199 : Rat) / 121748482566784) [(8, 1), (11, 2), (16, 1)],
  term ((-579882331213199 : Rat) / 121748482566784) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0014_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0014
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0015 : Poly :=
[
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 15 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0015 : Poly :=
[
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(9, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0015_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0015
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0016 : Poly :=
[
  term ((17917216165591703663 : Rat) / 3610086005070279168) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0016 : Poly :=
[
  term ((17917216165591703663 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-17917216165591703663 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((17917216165591703663 : Rat) / 1805043002535139584) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-17917216165591703663 : Rat) / 3610086005070279168) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((17917216165591703663 : Rat) / 3610086005070279168) [(9, 1), (11, 1), (16, 1)],
  term ((-17917216165591703663 : Rat) / 3610086005070279168) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0016_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0016
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0017 : Poly :=
[
  term ((-6149870212956131 : Rat) / 852239377967488) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 17 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0017 : Poly :=
[
  term ((6149870212956131 : Rat) / 426119688983744) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 426119688983744) [(4, 1), (10, 2), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 426119688983744) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 852239377967488) [(10, 1), (14, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(10, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0017_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0017
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0018 : Poly :=
[
  term ((6149870212956131 : Rat) / 1704478755934976) [(10, 1), (16, 1)]
]

/-- Partial product 18 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0018 : Poly :=
[
  term ((-6149870212956131 : Rat) / 852239377967488) [(4, 1), (10, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(4, 1), (10, 2), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)],
  term ((6149870212956131 : Rat) / 1704478755934976) [(10, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 1704478755934976) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0018_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0018
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0019 : Poly :=
[
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 2), (16, 1)]
]

/-- Partial product 19 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0019 : Poly :=
[
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 3), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 2), (11, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0019_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0019
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0020 : Poly :=
[
  term ((3249908850494927 : Rat) / 1704478755934976) [(11, 2), (16, 1)]
]

/-- Partial product 20 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0020 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 1), (11, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (11, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(5, 1), (11, 3), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 2), (11, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(11, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0020_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0020
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0021 : Poly :=
[
  term ((-5340602744958665 : Rat) / 852239377967488) [(14, 1), (16, 1)]
]

/-- Partial product 21 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0021 : Poly :=
[
  term ((-5340602744958665 : Rat) / 426119688983744) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((5340602744958665 : Rat) / 426119688983744) [(4, 1), (14, 1), (16, 1)],
  term ((-5340602744958665 : Rat) / 426119688983744) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((5340602744958665 : Rat) / 852239377967488) [(10, 2), (14, 1), (16, 1)],
  term ((5340602744958665 : Rat) / 852239377967488) [(11, 2), (14, 1), (16, 1)],
  term ((-5340602744958665 : Rat) / 852239377967488) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0021_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0021
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0022 : Poly :=
[
  term ((724990340615301 : Rat) / 106529922245936) [(14, 2), (16, 1)]
]

/-- Partial product 22 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0022 : Poly :=
[
  term ((724990340615301 : Rat) / 53264961122968) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 53264961122968) [(4, 1), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 53264961122968) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(10, 2), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(11, 2), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0022_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0022
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010NYY_coefficient_15_0023 : Poly :=
[
  term ((4825239698786831 : Rat) / 1704478755934976) [(16, 1)]
]

/-- Partial product 23 for generator 15. -/
def rs_R010_ueqv_R010NYY_partial_15_0023 : Poly :=
[
  term ((4825239698786831 : Rat) / 852239377967488) [(4, 1), (10, 1), (16, 1)],
  term ((-4825239698786831 : Rat) / 852239377967488) [(4, 1), (16, 1)],
  term ((4825239698786831 : Rat) / 852239377967488) [(5, 1), (11, 1), (16, 1)],
  term ((-4825239698786831 : Rat) / 1704478755934976) [(10, 2), (16, 1)],
  term ((-4825239698786831 : Rat) / 1704478755934976) [(11, 2), (16, 1)],
  term ((4825239698786831 : Rat) / 1704478755934976) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem rs_R010_ueqv_R010NYY_partial_15_0023_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_15_0023
        rs_R010_ueqv_R010NYY_generator_15_0000_0023 =
      rs_R010_ueqv_R010NYY_partial_15_0023 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_15_0000_0023 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_15_0000,
  rs_R010_ueqv_R010NYY_partial_15_0001,
  rs_R010_ueqv_R010NYY_partial_15_0002,
  rs_R010_ueqv_R010NYY_partial_15_0003,
  rs_R010_ueqv_R010NYY_partial_15_0004,
  rs_R010_ueqv_R010NYY_partial_15_0005,
  rs_R010_ueqv_R010NYY_partial_15_0006,
  rs_R010_ueqv_R010NYY_partial_15_0007,
  rs_R010_ueqv_R010NYY_partial_15_0008,
  rs_R010_ueqv_R010NYY_partial_15_0009,
  rs_R010_ueqv_R010NYY_partial_15_0010,
  rs_R010_ueqv_R010NYY_partial_15_0011,
  rs_R010_ueqv_R010NYY_partial_15_0012,
  rs_R010_ueqv_R010NYY_partial_15_0013,
  rs_R010_ueqv_R010NYY_partial_15_0014,
  rs_R010_ueqv_R010NYY_partial_15_0015,
  rs_R010_ueqv_R010NYY_partial_15_0016,
  rs_R010_ueqv_R010NYY_partial_15_0017,
  rs_R010_ueqv_R010NYY_partial_15_0018,
  rs_R010_ueqv_R010NYY_partial_15_0019,
  rs_R010_ueqv_R010NYY_partial_15_0020,
  rs_R010_ueqv_R010NYY_partial_15_0021,
  rs_R010_ueqv_R010NYY_partial_15_0022,
  rs_R010_ueqv_R010NYY_partial_15_0023
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_15_0000_0023 : Poly :=
[
  term ((-36811646155131 : Rat) / 15218560320848) [(0, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((29030839205871 : Rat) / 22427352051776) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 2), (16, 1)],
  term ((36811646155131 : Rat) / 15218560320848) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-1066948991083383 : Rat) / 426119688983744) [(0, 1), (4, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 15218560320848) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1066948991083383 : Rat) / 426119688983744) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1066948991083383 : Rat) / 852239377967488) [(0, 1), (10, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 3), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1066948991083383 : Rat) / 852239377967488) [(0, 1), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (14, 1), (16, 1)],
  term ((1066948991083383 : Rat) / 852239377967488) [(0, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(1, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(1, 1), (11, 3), (16, 1)],
  term ((9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 6658120140371) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 3), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(3, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(3, 1), (11, 3), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1854614415229335 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((579882331213199 : Rat) / 60874241283392) [(4, 1), (8, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((17917216165591703663 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-17917216165591703663 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 1), (11, 2), (16, 1)],
  term ((404633733998733 : Rat) / 213059844491872) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 53264961122968) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-331157628542325 : Rat) / 213059844491872) [(4, 1), (10, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 426119688983744) [(4, 1), (10, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(4, 1), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 3), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (11, 2), (16, 1)],
  term ((5340602744958665 : Rat) / 426119688983744) [(4, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 53264961122968) [(4, 1), (14, 2), (16, 1)],
  term ((-4825239698786831 : Rat) / 852239377967488) [(4, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-11676998842802750279 : Rat) / 515726572152897024) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-579882331213199 : Rat) / 60874241283392) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((11676998842802750279 : Rat) / 515726572152897024) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((75809481662375849441 : Rat) / 7220172010140558336) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (9, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 426119688983744) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-5340602744958665 : Rat) / 426119688983744) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 53264961122968) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((4825239698786831 : Rat) / 852239377967488) [(5, 1), (11, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(5, 1), (11, 3), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (14, 1), (16, 1)],
  term ((579882331213199 : Rat) / 121748482566784) [(8, 1), (10, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 3), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((579882331213199 : Rat) / 121748482566784) [(8, 1), (11, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (14, 1), (16, 1)],
  term ((-579882331213199 : Rat) / 121748482566784) [(8, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-17917216165591703663 : Rat) / 3610086005070279168) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((17917216165591703663 : Rat) / 3610086005070279168) [(9, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((-17917216165591703663 : Rat) / 3610086005070279168) [(9, 1), (11, 3), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)],
  term ((-6149870212956131 : Rat) / 852239377967488) [(10, 1), (14, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 1704478755934976) [(10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 2), (11, 2), (16, 1)],
  term ((5340602744958665 : Rat) / 852239377967488) [(10, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(10, 2), (14, 2), (16, 1)],
  term ((-24614544504561 : Rat) / 26632480561484) [(10, 2), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(10, 3), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 1704478755934976) [(10, 3), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 4), (16, 1)],
  term ((5340602744958665 : Rat) / 852239377967488) [(11, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(11, 2), (14, 2), (16, 1)],
  term ((-24614544504561 : Rat) / 26632480561484) [(11, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(11, 4), (16, 1)],
  term ((-5340602744958665 : Rat) / 852239377967488) [(14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(14, 2), (16, 1)],
  term ((4825239698786831 : Rat) / 1704478755934976) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 23. -/
theorem rs_R010_ueqv_R010NYY_block_15_0000_0023_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_15_0000_0023
      rs_R010_ueqv_R010NYY_block_15_0000_0023 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
