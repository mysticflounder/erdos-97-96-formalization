/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 17:0-31

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_17_0000_0031 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0000 : Poly :=
[
  term ((-110434938465393 : Rat) / 121748482566784) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 0 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0000 : Poly :=
[
  term ((110434938465393 : Rat) / 60874241283392) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 121748482566784) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 60874241283392) [(0, 1), (4, 1), (6, 1), (10, 1), (16, 1)],
  term ((110434938465393 : Rat) / 121748482566784) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 60874241283392) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((110434938465393 : Rat) / 121748482566784) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((110434938465393 : Rat) / 60874241283392) [(0, 2), (6, 1), (10, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 121748482566784) [(0, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0000
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0001 : Poly :=
[
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 1 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0001 : Poly :=
[
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (1, 1), (7, 1), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 2), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (5, 2), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 2), (6, 1), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0001
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0002 : Poly :=
[
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 2 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0002 : Poly :=
[
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0002_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0002
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0003 : Poly :=
[
  term ((2730550976549275 : Rat) / 1704478755934976) [(0, 1), (16, 1)]
]

/-- Partial product 3 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0003 : Poly :=
[
  term ((-2730550976549275 : Rat) / 852239377967488) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((2730550976549275 : Rat) / 1704478755934976) [(0, 1), (1, 2), (16, 1)],
  term ((2730550976549275 : Rat) / 852239377967488) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((-2730550976549275 : Rat) / 1704478755934976) [(0, 1), (4, 2), (16, 1)],
  term ((2730550976549275 : Rat) / 852239377967488) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-2730550976549275 : Rat) / 1704478755934976) [(0, 1), (5, 2), (16, 1)],
  term ((-2730550976549275 : Rat) / 852239377967488) [(0, 2), (6, 1), (16, 1)],
  term ((2730550976549275 : Rat) / 1704478755934976) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0003_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0003
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0004 : Poly :=
[
  term ((-36811646155131 : Rat) / 60874241283392) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0004 : Poly :=
[
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 2), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(1, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(1, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0004_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0004
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0005 : Poly :=
[
  term ((29030839205871 : Rat) / 44854704103552) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0005 : Poly :=
[
  term ((-29030839205871 : Rat) / 22427352051776) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((29030839205871 : Rat) / 44854704103552) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((29030839205871 : Rat) / 22427352051776) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-29030839205871 : Rat) / 44854704103552) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((29030839205871 : Rat) / 22427352051776) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-29030839205871 : Rat) / 44854704103552) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-29030839205871 : Rat) / 22427352051776) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((29030839205871 : Rat) / 44854704103552) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0005_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0005
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0006 : Poly :=
[
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 6 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0006 : Poly :=
[
  term ((9184513182051 : Rat) / 13316240280742) [(0, 1), (2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(0, 2), (2, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(1, 1), (2, 1), (7, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(1, 2), (2, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (6, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 2), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0006_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0006
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0007 : Poly :=
[
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 7 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0007 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0007_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0007
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0008 : Poly :=
[
  term ((9184513182051 : Rat) / 106529922245936) [(2, 1), (16, 1)]
]

/-- Partial product 8 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0008 : Poly :=
[
  term ((-9184513182051 : Rat) / 53264961122968) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((9184513182051 : Rat) / 106529922245936) [(0, 2), (2, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 53264961122968) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((9184513182051 : Rat) / 106529922245936) [(1, 2), (2, 1), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 106529922245936) [(2, 1), (4, 2), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 106529922245936) [(2, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0008_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0008
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0009 : Poly :=
[
  term ((9184513182051 : Rat) / 26632480561484) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0009 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(0, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(1, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(3, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0009_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0009
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0010 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0010 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0010_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0010
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0011 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 11 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0011 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0011_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0011
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0012 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 12 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0012 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0012_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0012
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0013 : Poly :=
[
  term ((-6901028333348391315 : Rat) / 9626896013520744448) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 13 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0013 : Poly :=
[
  term ((6901028333348391315 : Rat) / 4813448006760372224) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-6901028333348391315 : Rat) / 9626896013520744448) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((6901028333348391315 : Rat) / 4813448006760372224) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-6901028333348391315 : Rat) / 9626896013520744448) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((6901028333348391315 : Rat) / 9626896013520744448) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-6901028333348391315 : Rat) / 4813448006760372224) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((6901028333348391315 : Rat) / 9626896013520744448) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0013_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0013
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0014 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0014 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(0, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0014_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0014
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0015 : Poly :=
[
  term ((-4140617000009034789 : Rat) / 4813448006760372224) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0015 : Poly :=
[
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-4140617000009034789 : Rat) / 4813448006760372224) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-4140617000009034789 : Rat) / 4813448006760372224) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 4813448006760372224) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-4140617000009034789 : Rat) / 2406724003380186112) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 4813448006760372224) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0015_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0015
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0016 : Poly :=
[
  term ((-20140782504557979605 : Rat) / 1805043002535139584) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 16 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0016 : Poly :=
[
  term ((20140782504557979605 : Rat) / 902521501267569792) [(0, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-20140782504557979605 : Rat) / 1805043002535139584) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((20140782504557979605 : Rat) / 902521501267569792) [(1, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-20140782504557979605 : Rat) / 1805043002535139584) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((-20140782504557979605 : Rat) / 902521501267569792) [(4, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((20140782504557979605 : Rat) / 1805043002535139584) [(4, 2), (8, 1), (11, 2), (16, 1)],
  term ((-20140782504557979605 : Rat) / 902521501267569792) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((20140782504557979605 : Rat) / 1805043002535139584) [(5, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0016_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0016
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0017 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0017 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0017_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0017
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0018 : Poly :=
[
  term ((-765485422279541 : Rat) / 3408957511869952) [(8, 1), (16, 1)]
]

/-- Partial product 18 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0018 : Poly :=
[
  term ((765485422279541 : Rat) / 1704478755934976) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((-765485422279541 : Rat) / 3408957511869952) [(0, 2), (8, 1), (16, 1)],
  term ((765485422279541 : Rat) / 1704478755934976) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((-765485422279541 : Rat) / 3408957511869952) [(1, 2), (8, 1), (16, 1)],
  term ((-765485422279541 : Rat) / 1704478755934976) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((765485422279541 : Rat) / 3408957511869952) [(4, 2), (8, 1), (16, 1)],
  term ((-765485422279541 : Rat) / 1704478755934976) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((765485422279541 : Rat) / 3408957511869952) [(5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0018_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0018
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0019 : Poly :=
[
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0019 : Poly :=
[
  term ((18658404945247128977 : Rat) / 902521501267569792) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 902521501267569792) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 902521501267569792) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(4, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 902521501267569792) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0019_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0019
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0020 : Poly :=
[
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0020 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(0, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0020_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0020
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0021 : Poly :=
[
  term ((89215250884007110063 : Rat) / 14440344020281116672) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0021 : Poly :=
[
  term ((-89215250884007110063 : Rat) / 7220172010140558336) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((89215250884007110063 : Rat) / 14440344020281116672) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-89215250884007110063 : Rat) / 7220172010140558336) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((89215250884007110063 : Rat) / 14440344020281116672) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((89215250884007110063 : Rat) / 7220172010140558336) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-89215250884007110063 : Rat) / 14440344020281116672) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((89215250884007110063 : Rat) / 7220172010140558336) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-89215250884007110063 : Rat) / 14440344020281116672) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0021_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0021
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0022 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 2), (16, 1)]
]

/-- Partial product 22 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0022 : Poly :=
[
  term ((349947488033723 : Rat) / 213059844491872) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(0, 2), (9, 2), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(1, 2), (9, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 2), (9, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0022_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0022
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0023 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0023 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0023_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0023
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0024 : Poly :=
[
  term ((211333286327301 : Rat) / 6817915023739904) [(10, 1), (16, 1)]
]

/-- Partial product 24 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0024 : Poly :=
[
  term ((-211333286327301 : Rat) / 3408957511869952) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((211333286327301 : Rat) / 6817915023739904) [(0, 2), (10, 1), (16, 1)],
  term ((-211333286327301 : Rat) / 3408957511869952) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((211333286327301 : Rat) / 6817915023739904) [(1, 2), (10, 1), (16, 1)],
  term ((211333286327301 : Rat) / 3408957511869952) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((-211333286327301 : Rat) / 6817915023739904) [(4, 2), (10, 1), (16, 1)],
  term ((211333286327301 : Rat) / 3408957511869952) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-211333286327301 : Rat) / 6817915023739904) [(5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0024_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0024
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0025 : Poly :=
[
  term ((-724990340615301 : Rat) / 213059844491872) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 25 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0025 : Poly :=
[
  term ((724990340615301 : Rat) / 106529922245936) [(0, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(5, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0025_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0025
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0026 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0026 : Poly :=
[
  term ((19399593724902554291 : Rat) / 902521501267569792) [(0, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(5, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0026_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0026
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0027 : Poly :=
[
  term ((23494339168697774339 : Rat) / 2406724003380186112) [(11, 2), (16, 1)]
]

/-- Partial product 27 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0027 : Poly :=
[
  term ((-23494339168697774339 : Rat) / 1203362001690093056) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((23494339168697774339 : Rat) / 2406724003380186112) [(0, 2), (11, 2), (16, 1)],
  term ((-23494339168697774339 : Rat) / 1203362001690093056) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((23494339168697774339 : Rat) / 2406724003380186112) [(1, 2), (11, 2), (16, 1)],
  term ((23494339168697774339 : Rat) / 1203362001690093056) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-23494339168697774339 : Rat) / 2406724003380186112) [(4, 2), (11, 2), (16, 1)],
  term ((23494339168697774339 : Rat) / 1203362001690093056) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-23494339168697774339 : Rat) / 2406724003380186112) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0027_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0027
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0028 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 28 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0028 : Poly :=
[
  term ((-724990340615301 : Rat) / 106529922245936) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0028_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0028
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0029 : Poly :=
[
  term ((-724990340615301 : Rat) / 121748482566784) [(14, 1), (16, 1)]
]

/-- Partial product 29 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0029 : Poly :=
[
  term ((724990340615301 : Rat) / 60874241283392) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 121748482566784) [(0, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 60874241283392) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 121748482566784) [(1, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 60874241283392) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 121748482566784) [(4, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 60874241283392) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 121748482566784) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0029_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0029
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0030 : Poly :=
[
  term ((191122826441661 : Rat) / 213059844491872) [(15, 2), (16, 1)]
]

/-- Partial product 30 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0030 : Poly :=
[
  term ((-191122826441661 : Rat) / 106529922245936) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((191122826441661 : Rat) / 213059844491872) [(0, 2), (15, 2), (16, 1)],
  term ((-191122826441661 : Rat) / 106529922245936) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((191122826441661 : Rat) / 213059844491872) [(1, 2), (15, 2), (16, 1)],
  term ((191122826441661 : Rat) / 106529922245936) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-191122826441661 : Rat) / 213059844491872) [(4, 2), (15, 2), (16, 1)],
  term ((191122826441661 : Rat) / 106529922245936) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-191122826441661 : Rat) / 213059844491872) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0030_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0030
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010NYY_coefficient_17_0031 : Poly :=
[
  term ((101753420456991 : Rat) / 53264961122968) [(16, 1)]
]

/-- Partial product 31 for generator 17. -/
def rs_R010_ueqv_R010NYY_partial_17_0031 : Poly :=
[
  term ((-101753420456991 : Rat) / 26632480561484) [(0, 1), (6, 1), (16, 1)],
  term ((101753420456991 : Rat) / 53264961122968) [(0, 2), (16, 1)],
  term ((-101753420456991 : Rat) / 26632480561484) [(1, 1), (7, 1), (16, 1)],
  term ((101753420456991 : Rat) / 53264961122968) [(1, 2), (16, 1)],
  term ((101753420456991 : Rat) / 26632480561484) [(4, 1), (6, 1), (16, 1)],
  term ((-101753420456991 : Rat) / 53264961122968) [(4, 2), (16, 1)],
  term ((101753420456991 : Rat) / 26632480561484) [(5, 1), (7, 1), (16, 1)],
  term ((-101753420456991 : Rat) / 53264961122968) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 17. -/
theorem rs_R010_ueqv_R010NYY_partial_17_0031_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_17_0031
        rs_R010_ueqv_R010NYY_generator_17_0000_0031 =
      rs_R010_ueqv_R010NYY_partial_17_0031 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_17_0000_0031 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_17_0000,
  rs_R010_ueqv_R010NYY_partial_17_0001,
  rs_R010_ueqv_R010NYY_partial_17_0002,
  rs_R010_ueqv_R010NYY_partial_17_0003,
  rs_R010_ueqv_R010NYY_partial_17_0004,
  rs_R010_ueqv_R010NYY_partial_17_0005,
  rs_R010_ueqv_R010NYY_partial_17_0006,
  rs_R010_ueqv_R010NYY_partial_17_0007,
  rs_R010_ueqv_R010NYY_partial_17_0008,
  rs_R010_ueqv_R010NYY_partial_17_0009,
  rs_R010_ueqv_R010NYY_partial_17_0010,
  rs_R010_ueqv_R010NYY_partial_17_0011,
  rs_R010_ueqv_R010NYY_partial_17_0012,
  rs_R010_ueqv_R010NYY_partial_17_0013,
  rs_R010_ueqv_R010NYY_partial_17_0014,
  rs_R010_ueqv_R010NYY_partial_17_0015,
  rs_R010_ueqv_R010NYY_partial_17_0016,
  rs_R010_ueqv_R010NYY_partial_17_0017,
  rs_R010_ueqv_R010NYY_partial_17_0018,
  rs_R010_ueqv_R010NYY_partial_17_0019,
  rs_R010_ueqv_R010NYY_partial_17_0020,
  rs_R010_ueqv_R010NYY_partial_17_0021,
  rs_R010_ueqv_R010NYY_partial_17_0022,
  rs_R010_ueqv_R010NYY_partial_17_0023,
  rs_R010_ueqv_R010NYY_partial_17_0024,
  rs_R010_ueqv_R010NYY_partial_17_0025,
  rs_R010_ueqv_R010NYY_partial_17_0026,
  rs_R010_ueqv_R010NYY_partial_17_0027,
  rs_R010_ueqv_R010NYY_partial_17_0028,
  rs_R010_ueqv_R010NYY_partial_17_0029,
  rs_R010_ueqv_R010NYY_partial_17_0030,
  rs_R010_ueqv_R010NYY_partial_17_0031
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_17_0000_0031 : Poly :=
[
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-29030839205871 : Rat) / 22427352051776) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((110434938465393 : Rat) / 60874241283392) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (1, 1), (7, 1), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2730550976549275 : Rat) / 852239377967488) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 121748482566784) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((2730550976549275 : Rat) / 1704478755934976) [(0, 1), (1, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(0, 1), (2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 53264961122968) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 60874241283392) [(0, 1), (4, 1), (6, 1), (10, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((2730550976549275 : Rat) / 852239377967488) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((110434938465393 : Rat) / 121748482566784) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 2), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-2730550976549275 : Rat) / 1704478755934976) [(0, 1), (4, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((6901028333348391315 : Rat) / 4813448006760372224) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(0, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-110434938465393 : Rat) / 60874241283392) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((2730550976549275 : Rat) / 852239377967488) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((110434938465393 : Rat) / 121748482566784) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (5, 2), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((-2730550976549275 : Rat) / 1704478755934976) [(0, 1), (5, 2), (16, 1)],
  term ((20140782504557979605 : Rat) / 902521501267569792) [(0, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((765485422279541 : Rat) / 1704478755934976) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 902521501267569792) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(0, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-89215250884007110063 : Rat) / 7220172010140558336) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-211333286327301 : Rat) / 3408957511869952) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(0, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(0, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-23494339168697774339 : Rat) / 1203362001690093056) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 60874241283392) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-191122826441661 : Rat) / 106529922245936) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-101753420456991 : Rat) / 26632480561484) [(0, 1), (6, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 2), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((29030839205871 : Rat) / 44854704103552) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(0, 2), (2, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 106529922245936) [(0, 2), (2, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(0, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6901028333348391315 : Rat) / 9626896013520744448) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4140617000009034789 : Rat) / 4813448006760372224) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((110434938465393 : Rat) / 60874241283392) [(0, 2), (6, 1), (10, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 2), (6, 1), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-2730550976549275 : Rat) / 852239377967488) [(0, 2), (6, 1), (16, 1)],
  term ((-20140782504557979605 : Rat) / 1805043002535139584) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-765485422279541 : Rat) / 3408957511869952) [(0, 2), (8, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((89215250884007110063 : Rat) / 14440344020281116672) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(0, 2), (9, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((211333286327301 : Rat) / 6817915023739904) [(0, 2), (10, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((23494339168697774339 : Rat) / 2406724003380186112) [(0, 2), (11, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 121748482566784) [(0, 2), (14, 1), (16, 1)],
  term ((191122826441661 : Rat) / 213059844491872) [(0, 2), (15, 2), (16, 1)],
  term ((101753420456991 : Rat) / 53264961122968) [(0, 2), (16, 1)],
  term ((-110434938465393 : Rat) / 121748482566784) [(0, 3), (10, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 3), (11, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 3), (15, 2), (16, 1)],
  term ((2730550976549275 : Rat) / 1704478755934976) [(0, 3), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(1, 1), (2, 1), (7, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 53264961122968) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((29030839205871 : Rat) / 22427352051776) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((-29030839205871 : Rat) / 44854704103552) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((6901028333348391315 : Rat) / 4813448006760372224) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((7255974416869463541 : Rat) / 2406724003380186112) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((-29030839205871 : Rat) / 44854704103552) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((20140782504557979605 : Rat) / 902521501267569792) [(1, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((765485422279541 : Rat) / 1704478755934976) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 902521501267569792) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-89215250884007110063 : Rat) / 7220172010140558336) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-211333286327301 : Rat) / 3408957511869952) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-23494339168697774339 : Rat) / 1203362001690093056) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 60874241283392) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-191122826441661 : Rat) / 106529922245936) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-101753420456991 : Rat) / 26632480561484) [(1, 1), (7, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(1, 2), (2, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 106529922245936) [(1, 2), (2, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(1, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6901028333348391315 : Rat) / 9626896013520744448) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4140617000009034789 : Rat) / 4813448006760372224) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(1, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-29030839205871 : Rat) / 22427352051776) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-20140782504557979605 : Rat) / 1805043002535139584) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-765485422279541 : Rat) / 3408957511869952) [(1, 2), (8, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((89215250884007110063 : Rat) / 14440344020281116672) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(1, 2), (9, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((211333286327301 : Rat) / 6817915023739904) [(1, 2), (10, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((23494339168697774339 : Rat) / 2406724003380186112) [(1, 2), (11, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 121748482566784) [(1, 2), (14, 1), (16, 1)],
  term ((191122826441661 : Rat) / 213059844491872) [(1, 2), (15, 2), (16, 1)],
  term ((101753420456991 : Rat) / 53264961122968) [(1, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(1, 3), (10, 1), (11, 1), (16, 1)],
  term ((29030839205871 : Rat) / 44854704103552) [(1, 3), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (6, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 2), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 106529922245936) [(2, 1), (4, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (5, 2), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 106529922245936) [(2, 1), (5, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(3, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6901028333348391315 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-20140782504557979605 : Rat) / 902521501267569792) [(4, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-765485422279541 : Rat) / 1704478755934976) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 902521501267569792) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((89215250884007110063 : Rat) / 7220172010140558336) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((211333286327301 : Rat) / 3408957511869952) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((23494339168697774339 : Rat) / 1203362001690093056) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 60874241283392) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((191122826441661 : Rat) / 106529922245936) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((101753420456991 : Rat) / 26632480561484) [(4, 1), (6, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((6901028333348391315 : Rat) / 9626896013520744448) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((4140617000009034789 : Rat) / 4813448006760372224) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((20140782504557979605 : Rat) / 1805043002535139584) [(4, 2), (8, 1), (11, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((765485422279541 : Rat) / 3408957511869952) [(4, 2), (8, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(4, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-89215250884007110063 : Rat) / 14440344020281116672) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 2), (9, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-211333286327301 : Rat) / 6817915023739904) [(4, 2), (10, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((-23494339168697774339 : Rat) / 2406724003380186112) [(4, 2), (11, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 121748482566784) [(4, 2), (14, 1), (16, 1)],
  term ((-191122826441661 : Rat) / 213059844491872) [(4, 2), (15, 2), (16, 1)],
  term ((-101753420456991 : Rat) / 53264961122968) [(4, 2), (16, 1)],
  term ((-20140782504557979605 : Rat) / 902521501267569792) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-765485422279541 : Rat) / 1704478755934976) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 902521501267569792) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((89215250884007110063 : Rat) / 7220172010140558336) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((211333286327301 : Rat) / 3408957511869952) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((23494339168697774339 : Rat) / 1203362001690093056) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 60874241283392) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((191122826441661 : Rat) / 106529922245936) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((101753420456991 : Rat) / 26632480561484) [(5, 1), (7, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6901028333348391315 : Rat) / 4813448006760372224) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4140617000009034789 : Rat) / 2406724003380186112) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((20140782504557979605 : Rat) / 1805043002535139584) [(5, 2), (8, 1), (11, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((765485422279541 : Rat) / 3408957511869952) [(5, 2), (8, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-89215250884007110063 : Rat) / 14440344020281116672) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(5, 2), (9, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-211333286327301 : Rat) / 6817915023739904) [(5, 2), (10, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((-23494339168697774339 : Rat) / 2406724003380186112) [(5, 2), (11, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((724990340615301 : Rat) / 121748482566784) [(5, 2), (14, 1), (16, 1)],
  term ((-191122826441661 : Rat) / 213059844491872) [(5, 2), (15, 2), (16, 1)],
  term ((-101753420456991 : Rat) / 53264961122968) [(5, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 3), (8, 1), (11, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 3), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(5, 3), (9, 1), (15, 2), (16, 1)],
  term ((6901028333348391315 : Rat) / 9626896013520744448) [(5, 3), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 3), (11, 1), (15, 2), (16, 1)],
  term ((4140617000009034789 : Rat) / 4813448006760372224) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 31. -/
theorem rs_R010_ueqv_R010NYY_block_17_0000_0031_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_17_0000_0031
      rs_R010_ueqv_R010NYY_block_17_0000_0031 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
